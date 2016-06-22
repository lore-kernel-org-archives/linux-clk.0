Return-Path: <hl@rock-chips.com>
Subject: Re: [RFC PATCH v2 6/6] drm/rockchip: Add dmc notifier in vop driver
To: Chanwoo Choi <cw00.choi@samsung.com>, heiko@sntech.de,
 mark.yao@rock-chips.com, myungjoo.ham@samsung.com
References: <1465207986-17888-1-git-send-email-hl@rock-chips.com>
 <CGME20160606101348epcas1p468b2019b1d69887a154b60c3afa2edce@epcas1p4.samsung.com>
 <1465207986-17888-7-git-send-email-hl@rock-chips.com>
 <576A3A38.3000306@samsung.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kyungmin.park@samsung.com,
 dianders@chromium.org, dbasehore@chromium.org
From: hl <hl@rock-chips.com>
Message-ID: <576A83A0.3080908@rock-chips.com>
Date: Wed, 22 Jun 2016 20:25:04 +0800
MIME-Version: 1.0
In-Reply-To: <576A3A38.3000306@samsung.com>
Content-Type: multipart/alternative;
 boundary="------------050702050500010700080902"
List-ID: <linux-clk.vger.kernel.org>

This is a multi-part message in MIME format.
--------------050702050500010700080902
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Chanwoo Choi,

On 2016年06月22日 15:11, Chanwoo Choi wrote:
> Hi,
>
> On 2016년 06월 06일 19:13, Lin Huang wrote:
>> when in ddr frequency scaling process, vop can not do
>> enable or disable operate, since dcf will base on vop vblank
>> time to do frequency scaling and need to get vop irq if there
>> have vop enabled. So need register to dmc notifier, and we can
>> get the dmc status.
> If you want to know when ddr frequency is chanaged,
> you can use the DEVFREQ_TRANSITION_NOTIFIER notifier[1] (merged to v4.7-rc1)
> which includes the following notification:
> - DEVFREQ_PRECHANGE
> - DEVFREQ_POSTCHANGE	
>
> [1] "PM / devfreq: Add new DEVFREQ_TRANSITION_NOTIFIER notifier"
> - https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=0fe3a66410a3ba96679be903f1e287d7a0a264a9
Check the code, if the set target fail, it will not send 
DEVFREQ_POSTCHANGE, but in our case, whether the target
setting sucess or fail, it should send message to vop driver,  tell vop 
driver dmc have finish frequency setting.
>
> Thanks,
> Chanwoo Choi
>
>> Signed-off-by: Lin Huang <hl@rock-chips.com>
>> ---
>>
>> Changes in v2:
>> - None
>>
>> Changes in v1:
>> - use wait_event instead usleep
>>
>>   drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 43 +++++++++++++++++++++++++++--
>>   1 file changed, 41 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
>> index 1c4d5b5..8286048 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
>> @@ -31,6 +31,8 @@
>>   #include <linux/reset.h>
>>   #include <linux/delay.h>
>>   
>> +#include <soc/rockchip/rockchip_dmc.h>
>> +
>>   #include "rockchip_drm_drv.h"
>>   #include "rockchip_drm_gem.h"
>>   #include "rockchip_drm_fb.h"
>> @@ -116,6 +118,10 @@ struct vop {
>>   
>>   	const struct vop_data *data;
>>   
>> +	struct notifier_block dmc_nb;
>> +	int dmc_in_process;
>> +	wait_queue_head_t	wait_dmc_queue;
>> +
>>   	uint32_t *regsbak;
>>   	void __iomem *regs;
>>   
>> @@ -426,6 +432,21 @@ static void vop_dsp_hold_valid_irq_disable(struct vop *vop)
>>   	spin_unlock_irqrestore(&vop->irq_lock, flags);
>>   }
>>   
>> +static int dmc_notify(struct notifier_block *nb, unsigned long event,
>> +		      void *data)
>> +{
>> +	struct vop *vop = container_of(nb, struct vop, dmc_nb);
>> +
>> +	if (event == DMCFREQ_ADJUST) {
>> +		vop->dmc_in_process = 1;
>> +	} else if (event == DMCFREQ_FINISH) {
>> +		vop->dmc_in_process = 0;
>> +		wake_up(&vop->wait_dmc_queue);
>> +	}
>> +
>> +	return NOTIFY_OK;
>> +}
>> +
>>   static void vop_enable(struct drm_crtc *crtc)
>>   {
>>   	struct vop *vop = to_vop(crtc);
>> @@ -434,6 +455,13 @@ static void vop_enable(struct drm_crtc *crtc)
>>   	if (vop->is_enabled)
>>   		return;
>>   
>> +	/*
>> +	 * if in dmc scaling frequency process, wait until it finish
>> +	 * use 100ms as timeout time.
>> +	 */
>> +	wait_event_timeout(vop->wait_dmc_queue,
>> +			   !vop->dmc_in_process, HZ / 10);
>> +
>>   	ret = pm_runtime_get_sync(vop->dev);
>>   	if (ret < 0) {
>>   		dev_err(vop->dev, "failed to get pm runtime: %d\n", ret);
>> @@ -485,6 +513,7 @@ static void vop_enable(struct drm_crtc *crtc)
>>   	enable_irq(vop->irq);
>>   
>>   	drm_crtc_vblank_on(crtc);
>> +	rockchip_dmc_get(&vop->dmc_nb);
>>   
>>   	return;
>>   
>> @@ -505,6 +534,13 @@ static void vop_crtc_disable(struct drm_crtc *crtc)
>>   		return;
>>   
>>   	/*
>> +	 * if in dmc scaling frequency process, wait until it finish
>> +	 * use 100ms as timeout time.
>> +	 */
>> +	wait_event_timeout(vop->wait_dmc_queue,
>> +			   !vop->dmc_in_process, HZ / 10);
>> +
>> +	/*
>>   	 * We need to make sure that all windows are disabled before we
>>   	 * disable that crtc. Otherwise we might try to scan from a destroyed
>>   	 * buffer later.
>> @@ -517,7 +553,7 @@ static void vop_crtc_disable(struct drm_crtc *crtc)
>>   		VOP_WIN_SET(vop, win, enable, 0);
>>   		spin_unlock(&vop->reg_lock);
>>   	}
>> -
>> +	rockchip_dmc_put(&vop->dmc_nb);
>>   	drm_crtc_vblank_off(crtc);
>>   
>>   	/*
>> @@ -1243,7 +1279,7 @@ static int vop_create_crtc(struct vop *vop)
>>   		ret = -ENOENT;
>>   		goto err_cleanup_crtc;
>>   	}
>> -
>> +	vop->dmc_nb.notifier_call = dmc_notify;
>>   	init_completion(&vop->dsp_hold_completion);
>>   	init_completion(&vop->wait_update_complete);
>>   	crtc->port = port;
>> @@ -1465,6 +1501,9 @@ static int vop_bind(struct device *dev, struct device *master, void *data)
>>   	/* IRQ is initially disabled; it gets enabled in power_on */
>>   	disable_irq(vop->irq);
>>   
>> +	init_waitqueue_head(&vop->wait_dmc_queue);
>> +	vop->dmc_in_process = 0;
>> +
>>   	ret = vop_create_crtc(vop);
>>   	if (ret)
>>   		return ret;
>>
>
>
>

-- 
Lin Huang


--------------050702050500010700080902
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Hi Chanwoo Choi,<br>
    <br>
    <div class="moz-cite-prefix">On 2016年06月22日 15:11, Chanwoo Choi
      wrote:<br>
    </div>
    <blockquote cite="mid:576A3A38.3000306@samsung.com" type="cite">
      <pre wrap="">Hi,

On 2016년 06월 06일 19:13, Lin Huang wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">when in ddr frequency scaling process, vop can not do
enable or disable operate, since dcf will base on vop vblank
time to do frequency scaling and need to get vop irq if there
have vop enabled. So need register to dmc notifier, and we can
get the dmc status.
</pre>
      </blockquote>
      <pre wrap="">
If you want to know when ddr frequency is chanaged,
you can use the DEVFREQ_TRANSITION_NOTIFIER notifier[1] (merged to v4.7-rc1)
which includes the following notification:
- DEVFREQ_PRECHANGE
- DEVFREQ_POSTCHANGE	

[1] "PM / devfreq: Add new DEVFREQ_TRANSITION_NOTIFIER notifier"
- <a class="moz-txt-link-freetext" href="https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=0fe3a66410a3ba96679be903f1e287d7a0a264a9">https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=0fe3a66410a3ba96679be903f1e287d7a0a264a9</a></pre>
    </blockquote>
    Check the code, if the set target fail, it will not send
    DEVFREQ_POSTCHANGE, but in our case, whether the target<br>
    setting sucess or fail, it should send message to vop driver,  tell
    vop driver dmc have finish frequency setting.<br>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <span style="color: rgb(0, 128, 0); font-family: monospace; font-size: 13.3333px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: pre; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(255, 255, 255);"></span>
    <blockquote cite="mid:576A3A38.3000306@samsung.com" type="cite">
      <pre wrap="">

Thanks,
Chanwoo Choi

</pre>
      <blockquote type="cite">
        <pre wrap="">
Signed-off-by: Lin Huang <a class="moz-txt-link-rfc2396E" href="mailto:hl@rock-chips.com">&lt;hl@rock-chips.com&gt;</a>
---

Changes in v2:
- None

Changes in v1:
- use wait_event instead usleep

 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 43 +++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index 1c4d5b5..8286048 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -31,6 +31,8 @@
 #include &lt;linux/reset.h&gt;
 #include &lt;linux/delay.h&gt;
 
+#include &lt;soc/rockchip/rockchip_dmc.h&gt;
+
 #include "rockchip_drm_drv.h"
 #include "rockchip_drm_gem.h"
 #include "rockchip_drm_fb.h"
@@ -116,6 +118,10 @@ struct vop {
 
 	const struct vop_data *data;
 
+	struct notifier_block dmc_nb;
+	int dmc_in_process;
+	wait_queue_head_t	wait_dmc_queue;
+
 	uint32_t *regsbak;
 	void __iomem *regs;
 
@@ -426,6 +432,21 @@ static void vop_dsp_hold_valid_irq_disable(struct vop *vop)
 	spin_unlock_irqrestore(&amp;vop-&gt;irq_lock, flags);
 }
 
+static int dmc_notify(struct notifier_block *nb, unsigned long event,
+		      void *data)
+{
+	struct vop *vop = container_of(nb, struct vop, dmc_nb);
+
+	if (event == DMCFREQ_ADJUST) {
+		vop-&gt;dmc_in_process = 1;
+	} else if (event == DMCFREQ_FINISH) {
+		vop-&gt;dmc_in_process = 0;
+		wake_up(&amp;vop-&gt;wait_dmc_queue);
+	}
+
+	return NOTIFY_OK;
+}
+
 static void vop_enable(struct drm_crtc *crtc)
 {
 	struct vop *vop = to_vop(crtc);
@@ -434,6 +455,13 @@ static void vop_enable(struct drm_crtc *crtc)
 	if (vop-&gt;is_enabled)
 		return;
 
+	/*
+	 * if in dmc scaling frequency process, wait until it finish
+	 * use 100ms as timeout time.
+	 */
+	wait_event_timeout(vop-&gt;wait_dmc_queue,
+			   !vop-&gt;dmc_in_process, HZ / 10);
+
 	ret = pm_runtime_get_sync(vop-&gt;dev);
 	if (ret &lt; 0) {
 		dev_err(vop-&gt;dev, "failed to get pm runtime: %d\n", ret);
@@ -485,6 +513,7 @@ static void vop_enable(struct drm_crtc *crtc)
 	enable_irq(vop-&gt;irq);
 
 	drm_crtc_vblank_on(crtc);
+	rockchip_dmc_get(&amp;vop-&gt;dmc_nb);
 
 	return;
 
@@ -505,6 +534,13 @@ static void vop_crtc_disable(struct drm_crtc *crtc)
 		return;
 
 	/*
+	 * if in dmc scaling frequency process, wait until it finish
+	 * use 100ms as timeout time.
+	 */
+	wait_event_timeout(vop-&gt;wait_dmc_queue,
+			   !vop-&gt;dmc_in_process, HZ / 10);
+
+	/*
 	 * We need to make sure that all windows are disabled before we
 	 * disable that crtc. Otherwise we might try to scan from a destroyed
 	 * buffer later.
@@ -517,7 +553,7 @@ static void vop_crtc_disable(struct drm_crtc *crtc)
 		VOP_WIN_SET(vop, win, enable, 0);
 		spin_unlock(&amp;vop-&gt;reg_lock);
 	}
-
+	rockchip_dmc_put(&amp;vop-&gt;dmc_nb);
 	drm_crtc_vblank_off(crtc);
 
 	/*
@@ -1243,7 +1279,7 @@ static int vop_create_crtc(struct vop *vop)
 		ret = -ENOENT;
 		goto err_cleanup_crtc;
 	}
-
+	vop-&gt;dmc_nb.notifier_call = dmc_notify;
 	init_completion(&amp;vop-&gt;dsp_hold_completion);
 	init_completion(&amp;vop-&gt;wait_update_complete);
 	crtc-&gt;port = port;
@@ -1465,6 +1501,9 @@ static int vop_bind(struct device *dev, struct device *master, void *data)
 	/* IRQ is initially disabled; it gets enabled in power_on */
 	disable_irq(vop-&gt;irq);
 
+	init_waitqueue_head(&amp;vop-&gt;wait_dmc_queue);
+	vop-&gt;dmc_in_process = 0;
+
 	ret = vop_create_crtc(vop);
 	if (ret)
 		return ret;

</pre>
      </blockquote>
      <pre wrap="">



</pre>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 
Lin Huang</pre>
  </body>
</html>

--------------050702050500010700080902--
