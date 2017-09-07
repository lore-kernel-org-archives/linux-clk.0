Return-Path: <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v3] clk: x86: Do not gate clocks enabled by the firmware
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: Carlo Caione <carlo@caione.org>, alan@linux.intel.com
Cc: Michael Turquette <mturquette@baylibre.com>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 Darren Hart <dvhart@infradead.org>, Stephen Boyd <sboyd@codeaurora.org>,
 Linux Upstreaming Team <linux@endlessm.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>,
 andriy.shevchenko@linux.intel.com, Carlo Caione <carlo@endlessm.com>
References: <20170714082356.28117-1-carlo@caione.org>
 <CAOQ7t2beu8CyHM1qR+DDt-BQXmFHoyJe8q_56qhkkYLM_o1upQ@mail.gmail.com>
 <ac99f461-798b-e245-232e-5e76c2de93b0@linux.intel.com>
Message-ID: <58ef7321-a16d-8974-6a37-db473b6bf48e@linux.intel.com>
Date: Thu, 7 Sep 2017 16:51:16 -0500
MIME-Version: 1.0
In-Reply-To: <ac99f461-798b-e245-232e-5e76c2de93b0@linux.intel.com>
Content-Type: multipart/mixed;
 boundary="------------90ECBE380AF0973E05A660F7"
List-ID: <linux-clk.vger.kernel.org>

This is a multi-part message in MIME format.
--------------90ECBE380AF0973E05A660F7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/07/2017 06:59 AM, Pierre-Louis Bossart wrote:
> On 9/7/17 4:22 AM, Carlo Caione wrote:
>> On Fri, Jul 14, 2017 at 10:23 AM, Carlo Caione <carlo@caione.org> wrote:
>>> From: Carlo Caione <carlo@endlessm.com>
>>>
>>> Read the enable register to determine if the clock is already in use by
>>> the firmware. In this case avoid gating the clock.
>>>
>>> Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>>> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>> Acked-by: Darren Hart (VMware) <dvhart@infradead.org>
>>> Signed-off-by: Carlo Caione <carlo@endlessm.com>
>>> ---
>>>   drivers/clk/x86/clk-pmc-atom.c | 7 +++++++
>>>   1 file changed, 7 insertions(+)
>>>
>>> diff --git a/drivers/clk/x86/clk-pmc-atom.c 
>>> b/drivers/clk/x86/clk-pmc-atom.c
>>> index 2b60577703ef..be8d821ce625 100644
>>> --- a/drivers/clk/x86/clk-pmc-atom.c
>>> +++ b/drivers/clk/x86/clk-pmc-atom.c
>>> @@ -185,6 +185,13 @@ static struct clk_plt *plt_clk_register(struct 
>>> platform_device *pdev, int id,
>>>          pclk->reg = base + PMC_CLK_CTL_OFFSET + id * PMC_CLK_CTL_SIZE;
>>>          spin_lock_init(&pclk->lock);
>>>
>>> +       /*
>>> +        * If the clock was already enabled by the firmware mark it 
>>> as critical
>>> +        * to avoid it being gated by the clock framework if no 
>>> driver owns it.
>>> +        */
>>> +       if (plt_clk_is_enabled(&pclk->hw))
>>> +               init.flags |= CLK_IS_CRITICAL;
>>> +
>>>          ret = devm_clk_hw_register(&pdev->dev, &pclk->hw);
>>>          if (ret) {
>>>                  pclk = ERR_PTR(ret);
>>
>> Hi,
>>
>> I just discovered that this fix is not working anymore on my platform
>> (with a baytrail processor).
>> This fix was needed on my setup because the clock pmc_plt_clk_4 used
>> by the Ethernet and enabled by the firmware, was being gated by the
>> clock framework since the r8169 driver was failing to claim it. You
>> can read the whole discussion about this in [0]. This fix was also
>> needed for some other audio machine drivers.
>>
>> I bisected the problem down to commit 49d25364df ("staging/atomisp:
>> Add support for the Intel IPU v2"). The clock driver is basically
>> shutting down all the clocks (see [1]) at probe time, so the
>> clk-pmc-atom driver is seeing all the clocks already disabled when
>> going to check.
>>
>> Any idea how to proper fix this?
>
> Looks like the same code that was initially used as a reference for 
> support of PMC clocks in the clock framework, so now we have 2 drivers 
> programming the same PMC hardware, not so good. We'd probably have to 
> move the atomisp driver to move to clk_get/prepare/enable instead of 
> the old vlv2_clck_get?

See attached an untested change to show the idea on moving to the clk 
API and get feedback (I am not a camera guy, just trying to help - 
compile-tested/checkpatch only).
This code *should* enable the same functionality using existing hooks in 
the kernel (and handle the BYT/CHT clocking difference as a bonus).
I am sure Andy will have plenty of comments :-)




--------------90ECBE380AF0973E05A660F7
Content-Type: text/x-patch;
 name="0001-media-staging-atomisp-use-clock-framework-for-camera.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-media-staging-atomisp-use-clock-framework-for-camera.pa";
 filename*1="tch"

>From 48bbe216d947eecc2fda97d6ca4b5d3225430e82 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Thu, 7 Sep 2017 16:15:46 -0500
Subject: [PATCH] [media] staging: atomisp: use clock framework for camera
 clocks

The Atom ISP driver initializes and configures PMC clocks which are
already handled by the clock framework.

Remove all legacy vlv2_platform_clock stuff and move to the clk API to
avoid conflicts, e.g. with audio machine drivers enabling the MCLK for
external codecs

[Compile-tested only - for comments-feedback]

Reported-by: Carlo Caione <carlo@endlessm.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/staging/media/atomisp/platform/Makefile    |   1 -
 .../staging/media/atomisp/platform/clock/Makefile  |   6 -
 .../platform/clock/platform_vlv2_plat_clk.c        |  40 ----
 .../platform/clock/platform_vlv2_plat_clk.h        |  27 ---
 .../media/atomisp/platform/clock/vlv2_plat_clock.c | 247 ---------------------
 .../platform/intel-mid/atomisp_gmin_platform.c     |  63 +++++-
 6 files changed, 51 insertions(+), 333 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/platform/clock/Makefile
 delete mode 100644 drivers/staging/media/atomisp/platform/clock/platform_vlv2_plat_clk.c
 delete mode 100644 drivers/staging/media/atomisp/platform/clock/platform_vlv2_plat_clk.h
 delete mode 100644 drivers/staging/media/atomisp/platform/clock/vlv2_plat_clock.c

diff --git a/drivers/staging/media/atomisp/platform/Makefile b/drivers/staging/media/atomisp/platform/Makefile
index df15763..0e3b7e1 100644
--- a/drivers/staging/media/atomisp/platform/Makefile
+++ b/drivers/staging/media/atomisp/platform/Makefile
@@ -2,5 +2,4 @@
 # Makefile for camera drivers.
 #
 
-obj-$(CONFIG_INTEL_ATOMISP) += clock/
 obj-$(CONFIG_INTEL_ATOMISP) += intel-mid/
diff --git a/drivers/staging/media/atomisp/platform/clock/Makefile b/drivers/staging/media/atomisp/platform/clock/Makefile
deleted file mode 100644
index 82fbe8b..0000000
diff --git a/drivers/staging/media/atomisp/platform/clock/platform_vlv2_plat_clk.c b/drivers/staging/media/atomisp/platform/clock/platform_vlv2_plat_clk.c
deleted file mode 100644
index 0aae9b0..0000000
diff --git a/drivers/staging/media/atomisp/platform/clock/platform_vlv2_plat_clk.h b/drivers/staging/media/atomisp/platform/clock/platform_vlv2_plat_clk.h
deleted file mode 100644
index b730ab0..0000000
diff --git a/drivers/staging/media/atomisp/platform/clock/vlv2_plat_clock.c b/drivers/staging/media/atomisp/platform/clock/vlv2_plat_clock.c
deleted file mode 100644
index f96789a..0000000
diff --git a/drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c
index edaae93..17b4cfa 100644
--- a/drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c
@@ -4,10 +4,10 @@
 #include <linux/efi.h>
 #include <linux/pci.h>
 #include <linux/acpi.h>
+#include <linux/clk.h>
 #include <linux/delay.h>
 #include <media/v4l2-subdev.h>
 #include <linux/mfd/intel_soc_pmic.h>
-#include "../../include/linux/vlv2_plat_clock.h"
 #include <linux/regulator/consumer.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio.h>
@@ -17,11 +17,7 @@
 
 #define MAX_SUBDEVS 8
 
-/* Should be defined in vlv2_plat_clock API, isn't: */
-#define VLV2_CLK_PLL_19P2MHZ 1
-#define VLV2_CLK_XTAL_19P2MHZ 0
-#define VLV2_CLK_ON      1
-#define VLV2_CLK_OFF     2
+#define VLV2_CLK_PLL_19P2MHZ 1 /* XTAL on CHT */
 #define ELDO1_SEL_REG	0x19
 #define ELDO1_1P8V	0x16
 #define ELDO1_CTRL_SHIFT 0x00
@@ -33,6 +29,7 @@ struct gmin_subdev {
 	struct v4l2_subdev *subdev;
 	int clock_num;
 	int clock_src;
+	struct clk *pmc_clk;
 	struct gpio_desc *gpio0;
 	struct gpio_desc *gpio1;
 	struct regulator *v1p8_reg;
@@ -344,6 +341,9 @@ static int gmin_platform_deinit(void)
 	return 0;
 }
 
+#define GMIN_PMC_CLK_NAME 14 /* "pmc_plt_clk_[0..5]" */
+static char gmin_pmc_clk_name[GMIN_PMC_CLK_NAME];
+
 static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
 {
 	int i, ret;
@@ -377,6 +377,37 @@ static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
 	gmin_subdevs[i].gpio0 = gpiod_get_index(dev, NULL, 0, GPIOD_OUT_LOW);
 	gmin_subdevs[i].gpio1 = gpiod_get_index(dev, NULL, 1, GPIOD_OUT_LOW);
 
+	/* get PMC clock with clock framework */
+	snprintf(gmin_pmc_clk_name,
+		 sizeof(gmin_pmc_clk_name),
+		 "%s_%d", "pmc_plt_clk", gmin_subdevs[i].clock_num);
+
+	gmin_subdevs[i].pmc_clk = devm_clk_get(dev, gmin_pmc_clk_name);
+	if (IS_ERR(gmin_subdevs[i].pmc_clk)) {
+		ret = PTR_ERR(gmin_subdevs[i].pmc_clk);
+
+		dev_err(dev,
+			"Failed to get clk from %s : %d\n",
+			gmin_pmc_clk_name,
+			ret);
+
+		return NULL;
+	}
+
+	/*
+	 * The firmware might enable the clock at
+	 * boot (this information may or may not
+	 * be reflected in the enable clock register).
+	 * To change the rate we must disable the clock
+	 * first to cover these cases. Due to common
+	 * clock framework restrictions that do not allow
+	 * to disable a clock that has not been enabled,
+	 * we need to enable the clock first.
+	 */
+	ret = clk_prepare_enable(gmin_subdevs[i].pmc_clk);
+	if (!ret)
+		clk_disable_unprepare(gmin_subdevs[i].pmc_clk);
+
 	if (!IS_ERR(gmin_subdevs[i].gpio0)) {
 		ret = gpiod_direction_output(gmin_subdevs[i].gpio0, 0);
 		if (ret)
@@ -539,13 +570,21 @@ static int gmin_flisclk_ctrl(struct v4l2_subdev *subdev, int on)
 {
 	int ret = 0;
 	struct gmin_subdev *gs = find_gmin_subdev(subdev);
+	struct i2c_client *client = v4l2_get_subdevdata(subdev);
+
+	if (on) {
+		ret = clk_set_rate(gs->pmc_clk, gs->clock_src);
+
+		if (ret)
+			dev_err(&client->dev, "unable to set PMC rate %d\n",
+				gs->clock_src);
 
-	if (on)
-		ret = vlv2_plat_set_clock_freq(gs->clock_num, gs->clock_src);
-	if (ret)
-		return ret;
-	return vlv2_plat_configure_clock(gs->clock_num,
-					 on ? VLV2_CLK_ON : VLV2_CLK_OFF);
+		ret = clk_prepare_enable(gs->pmc_clk);
+	} else {
+		clk_disable_unprepare(gs->pmc_clk);
+	}
+
+	return ret;
 }
 
 static int gmin_csi_cfg(struct v4l2_subdev *sd, int flag)
-- 
2.9.3


--------------90ECBE380AF0973E05A660F7--
