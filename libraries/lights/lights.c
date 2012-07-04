/*
 * Copyright (C) 2008 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#define LOG_NDEBUG 0
#define LOG_TAG "lights"

#include <cutils/log.h>

#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>
#include <fcntl.h>
#include <pthread.h>

#include <sys/ioctl.h>
#include <sys/types.h>

#include <hardware/lights.h>
#include <drv_display_sun4i.h>

static pthread_once_t g_init = PTHREAD_ONCE_INIT;
static pthread_mutex_t g_lock = PTHREAD_MUTEX_INITIALIZER;

static struct light_state_t g_notification;
static struct light_state_t g_battery;

static int g_backlight = 14;
static int g_haveTrackballLight = 0;

/* Only one instance is created per platform */
struct light_context_t 
{
    struct light_device_t     device;
    /* our private state goes below here */
    int                       fd;
};

/**
 * device methods
 */
void init_globals(void)
{
    // init the mutex
    pthread_mutex_init(&g_lock, NULL);
}

static int
is_lit(struct light_state_t const* state)
{
    return state->color & 0x00ffffff;
}

static int
rgb_to_brightness(struct light_state_t const* state)
{
    int color = state->color & 0x00ffffff;
    int bright;
    
    bright = ((77*((color>>16)&0x00ff)) + (150*((color>>8)&0x00ff)) + (29*(color&0x00ff))) >> 8;

    //support backlight 0-255
//    bright = bright >> 4;


	/* fix bright value >=5 , for HW reason*/
	if(bright < 5)
		bright = 5;

    return bright;
}

static int
set_light_backlight(struct light_device_t* dev,
        struct light_state_t const* state)
{
    struct light_context_t      *ctx;

    int err = 0;

    int brightness = rgb_to_brightness(state);
	
    pthread_mutex_lock(&g_lock);	
    g_backlight = brightness;
    ctx = (struct light_context_t *)dev;
    unsigned long  args[3];

	args[0]  = 0;
	args[1]  = brightness;
	args[2]  = 0;
	err = ioctl(ctx->fd,DISP_CMD_LCD_SET_BRIGHTNESS,args);
	
	if(err == 0)
	{
		g_backlight = brightness;
	}

    pthread_mutex_unlock(&g_lock);
    
    return err;
}

static int
set_light_keyboard(struct light_device_t* dev,
        struct light_state_t const* state)
{
    return 0;
}

static int
set_light_buttons(struct light_device_t* dev,
        struct light_state_t const* state)
{
    return 0;
}

static int
set_light_battery(struct light_device_t* dev,
        struct light_state_t const* state)
{
    return 0;
}

static int
set_light_notifications(struct light_device_t* dev,
        struct light_state_t const* state)
{
    return 0;
}

static int
set_light_attention(struct light_device_t* dev,
        struct light_state_t const* state)
{
    return 0;
}


/** Close the lights device */
static int
close_lights(struct light_device_t *dev)
{
    struct light_context_t *ctx;

    ctx = (struct light_context_t *)dev;
    if(ctx->fd)
    {
        close(ctx->fd);
    }
    if (dev) {
        free(dev);
    }
    return 0;
}

/** Open a new instance of a lights device using name */
static int open_lights(const struct hw_module_t* module, char const* name,
        struct hw_device_t** device)
{
    int (*set_light)(struct light_device_t* dev,
            struct light_state_t const* state);

    LOGD("open_lights!name = %s\n",name);
    if (0 == strcmp(LIGHT_ID_BACKLIGHT, name)) {
        set_light = set_light_backlight;
    }
    else if (0 == strcmp(LIGHT_ID_KEYBOARD, name)) {
        set_light = set_light_keyboard;
    }
    else if (0 == strcmp(LIGHT_ID_BUTTONS, name)) {
        set_light = set_light_buttons;
    }
    else if (0 == strcmp(LIGHT_ID_BATTERY, name)) {
        set_light = set_light_battery;
    }
    else if (0 == strcmp(LIGHT_ID_NOTIFICATIONS, name)) {
        set_light = set_light_notifications;
    }
    else if (0 == strcmp(LIGHT_ID_ATTENTION, name)) {
        set_light = set_light_attention;
    }
    else {
        return -EINVAL;
    }

    pthread_once(&g_init, init_globals);

    struct light_context_t *dev = (struct light_context_t *)malloc(sizeof(struct light_context_t));
    memset(dev, 0, sizeof(struct light_context_t));
	
    LOGD("light set back linghts!name = %s\n",name);
    
	if(0 == strcmp(LIGHT_ID_BACKLIGHT, name))
    {
        dev->fd = open("/dev/disp", O_RDONLY);
        if (dev->fd < 0)
        {
            LOGE("Failed to open display device dev->fd = %x\n",dev->fd);
        }       
    }
    
    dev->device.common.tag = HARDWARE_DEVICE_TAG;
    dev->device.common.version = 0;
    dev->device.common.module = (struct hw_module_t*)module;
    dev->device.common.close = (int (*)(struct hw_device_t*))close_lights;
    dev->device.set_light = set_light;

    *device = (struct hw_device_t*)dev;
    
    return 0;

error:
    free(dev);

    return -EINVAL;
}

static struct hw_module_methods_t lights_module_methods = {
    .open =  open_lights,
};

/*
 * The lights Module
 */
const struct hw_module_t HAL_MODULE_INFO_SYM = {
    .tag = HARDWARE_MODULE_TAG,
    .version_major = 1,
    .version_minor = 0,
    .id = LIGHTS_HARDWARE_MODULE_ID,
    .name = "SoftWinner lights Module",
    .author = "SoftWinner.",
    .methods = &lights_module_methods,
};
