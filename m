Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DB623EAB0
	for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 14:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769438268; cv=none; b=ac+P/tKU4pqDr2A5FFutje+6EnzA8dRzlpuowp/50Mq0LoIj61F9MxvK49cNOW6LopO6wU9fzwzFAlw3dqU7+zo6i9CY1bqtPorpqZGL7wO2yY1stzPsUam15SDgcc5EDWY4kcTOQgyqmbSqio+QVczNq7t59NUSsNldFbRklc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769438268; c=relaxed/simple;
	bh=LqmvUJxgygMCMM1QXohCXFffwDL4lx7ArC1QXugKHcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mKRmjmvYRf6P8iV5jaPIVqSkOeFnnaipeBZUlNkjvjTic5e8Myjxpdupypu8b+z6V/mONyFhjQJ9OlsQETj8XtzXGlYUBLtAUVcX1bbUvvyP7wWkq90gHX50/ACcNVGsaOIhJmwBl3Am6dhGzqmYoRxdmRw7mtXCisurVB5fBwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=X7WcTSlY; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="X7WcTSlY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ohRzKpCOE3E8J9nZGk2Y/izfwbFO+2Fvsxc99tR8BIs=; b=X7WcTSlYyDTAwgolMpX2FaDrXz
	VQc+a+MTfMRlUMDbF1RiXjElsBvlOKaET2SpkkonslPuEvLTpjAREQlf3bpUBN94PZbWgnNGY4KID
	mytPj9L6w3ZYLFvzWYH5xibvTuPQwWTGR6gg2xk7Y2SJzIkyzv7WPMsifV1Z1Od8QkXBlD8djx0CS
	xurl6S0FDABa0CDZp9EbrzASrxcJXsTt+l70NnSLw7NHaODWFCf2mQnpuXlOkYCIJnWorUAmege7t
	X9ULMTu2b4AugKQ07e917V/RTZzUjrOHr7260TdAIQQWJFfJ1POSQJ2U+L1nyf5GIaadypD2AJod0
	7PaDCWQg==;
Received: from [187.36.210.68] (helo=[192.168.1.103])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1vkNid-00A5DG-42; Mon, 26 Jan 2026 15:37:31 +0100
Message-ID: <8aa12b00-d024-45cd-9f56-b826270616fc@igalia.com>
Date: Mon, 26 Jan 2026 11:37:23 -0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] drm/v3d: Introduce Runtime Power Management
To: Melissa Wen <mwen@igalia.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>,
 Iago Toral Quiroga <itoral@igalia.com>,
 Chema Casanova <jmcasanova@igalia.com>, Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
References: <20260116-v3d-power-management-v3-0-4e1874e81dd6@igalia.com>
 <20260116-v3d-power-management-v3-4-4e1874e81dd6@igalia.com>
 <c9cbf372-3ca6-4fd3-b5ec-3c97a31e096e@igalia.com>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Content-Language: en-US
Autocrypt: addr=mcanal@igalia.com; keydata=
 xsBNBGcCwywBCADgTji02Sv9zjHo26LXKdCaumcSWglfnJ93rwOCNkHfPIBll85LL9G0J7H8
 /PmEL9y0LPo9/B3fhIpbD8VhSy9Sqz8qVl1oeqSe/rh3M+GceZbFUPpMSk5pNY9wr5raZ63d
 gJc1cs8XBhuj1EzeE8qbP6JAmsL+NMEmtkkNPfjhX14yqzHDVSqmAFEsh4Vmw6oaTMXvwQ40
 SkFjtl3sr20y07cJMDe++tFet2fsfKqQNxwiGBZJsjEMO2T+mW7DuV2pKHr9aifWjABY5EPw
 G7qbrh+hXgfT+njAVg5+BcLz7w9Ju/7iwDMiIY1hx64Ogrpwykj9bXav35GKobicCAwHABEB
 AAHNIE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+wsCRBBMBCAA7FiEE+ORdfQEW
 dwcppnfRP/MOinaI+qoFAmcCwywCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQ
 P/MOinaI+qoUBQgAqz2gzUP7K3EBI24+a5FwFlruQGtim85GAJZXToBtzsfGLLVUSCL3aF/5
 O335Bh6ViSBgxmowIwVJlS/e+L95CkTGzIIMHgyUZfNefR2L3aZA6cgc9z8cfow62Wu8eXnq
 GM/+WWvrFQb/dBKKuohfBlpThqDWXxhozazCcJYYHradIuOM8zyMtCLDYwPW7Vqmewa+w994
 7Lo4CgOhUXVI2jJSBq3sgHEPxiUBOGxvOt1YBg7H9C37BeZYZxFmU8vh7fbOsvhx7Aqu5xV7
 FG+1ZMfDkv+PixCuGtR5yPPaqU2XdjDC/9mlRWWQTPzg74RLEw5sz/tIHQPPm6ROCACFls7A
 TQRnAsMsAQgAxTU8dnqzK6vgODTCW2A6SAzcvKztxae4YjRwN1SuGhJR2isJgQHoOH6oCItW
 Xc1CGAWnci6doh1DJvbbB7uvkQlbeNxeIz0OzHSiB+pb1ssuT31Hz6QZFbX4q+crregPIhr+
 0xeDi6Mtu+paYprI7USGFFjDUvJUf36kK0yuF2XUOBlF0beCQ7Jhc+UoI9Akmvl4sHUrZJzX
 LMeajARnSBXTcig6h6/NFVkr1mi1uuZfIRNCkxCE8QRYebZLSWxBVr3h7dtOUkq2CzL2kRCK
 T2rKkmYrvBJTqSvfK3Ba7QrDg3szEe+fENpL3gHtH6h/XQF92EOulm5S5o0I+ceREwARAQAB
 wsB2BBgBCAAgFiEE+ORdfQEWdwcppnfRP/MOinaI+qoFAmcCwywCGwwACgkQP/MOinaI+qpI
 zQf+NAcNDBXWHGA3lgvYvOU31+ik9bb30xZ7IqK9MIi6TpZqL7cxNwZ+FAK2GbUWhy+/gPkX
 it2gCAJsjo/QEKJi7Zh8IgHN+jfim942QZOkU+p/YEcvqBvXa0zqW0sYfyAxkrf/OZfTnNNE
 Tr+uBKNaQGO2vkn5AX5l8zMl9LCH3/Ieaboni35qEhoD/aM0Kpf93PhCvJGbD4n1DnRhrxm1
 uEdQ6HUjWghEjC+Jh9xUvJco2tUTepw4OwuPxOvtuPTUa1kgixYyG1Jck/67reJzMigeuYFt
 raV3P8t/6cmtawVjurhnCDuURyhUrjpRhgFp+lW8OGr6pepHol/WFIOQEg==
In-Reply-To: <c9cbf372-3ca6-4fd3-b5ec-3c97a31e096e@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Melissa,

On 26/01/26 10:16, Melissa Wen wrote:
> 
> 
> On 16/01/2026 17:19, Maíra Canal wrote:

[...]

>> +    ret = pm_runtime_resume_and_get(dev);
>> +    if (ret)
>> +        goto gem_destroy;
>> +
>> +    /* If PM is disabled, we need to call v3d_power_resume() 
>> manually. */
>> +    if (!IS_ENABLED(CONFIG_PM)) {
>> +        ret = v3d_power_resume(dev);
>> +        if (ret)
>> +            goto gem_destroy;
>> +    }
> 
> Curious, I expected that previous pm_runtime attempts to enable and 
> resume would trigger a -ENOSYS if no CONFIG_PM.

Looking at the code, I see the following call chain:

pm_runtime_resume_and_get() -> pm_runtime_get_active(dev, 0) ->
__pm_runtime_resume(dev, RPM_GET_PUT)

With CONFIG_PM=n, the stub __pm_runtime_resume() returns 1, so the
function succeeds unconditionally.

Please let me know if my understanding is mistaken.

Thanks a lot for your review! I'll address all your comments in the next
version.

Best regards,
- Maíra

> 
>>       mmu_debug = V3D_READ(V3D_MMU_DEBUG_INFO);
>>       mask = DMA_BIT_MASK(30 + V3D_GET_FIELD(mmu_debug, 
>> V3D_MMU_PA_WIDTH));
>>       ret = dma_set_mask_and_coherent(dev, mask);
>>       if (ret)
>> -        goto clk_disable;
>> +        goto runtime_pm_put;
>>       dma_set_max_seg_size(&pdev->dev, UINT_MAX);
>> @@ -433,25 +421,27 @@ static int v3d_platform_drm_probe(struct 
>> platform_device *pdev)
>>       v3d->rev = V3D_GET_FIELD(ident3, V3D_HUB_IDENT3_IPREV);
>>       v3d_gem_init(drm);
>> -    v3d_irq_enable(v3d);
>> +
>> +    pm_runtime_set_autosuspend_delay(dev, 50);
>> +    pm_runtime_use_autosuspend(dev);
>>       ret = drm_dev_register(drm, 0);
>>       if (ret)
>> -        goto irq_disable;
>> +        goto runtime_pm_put;
>>       ret = v3d_sysfs_init(dev);
>>       if (ret)
>>           goto drm_unregister;
>> +    pm_runtime_mark_last_busy(dev);
>> +    pm_runtime_put_autosuspend(dev);
>> +
>>       return 0;
>>   drm_unregister:
>>       drm_dev_unregister(drm);
>> -irq_disable:
>> -    v3d_irq_disable(v3d);
>> -clk_disable:
>> -    v3d_power_off_sms(v3d);
>> -    clk_disable_unprepare(v3d->clk);
>> +runtime_pm_put:
>> +    pm_runtime_put_sync_suspend(dev);
>>   gem_destroy:
>>       v3d_gem_destroy(drm);
>>   dma_free:
>> @@ -469,21 +459,27 @@ static void v3d_platform_drm_remove(struct 
>> platform_device *pdev)
>>       drm_dev_unregister(drm);
>> -    v3d_power_off_sms(v3d);
>> +    pm_runtime_suspend(dev);
>> -    clk_disable_unprepare(v3d->clk);
>> +    /* If PM is disabled, we need to call v3d_power_suspend() 
>> manually. */
>> +    if (!IS_ENABLED(CONFIG_PM))
>> +        v3d_power_suspend(dev);
>>       v3d_gem_destroy(drm);
>>       dma_free_wc(dev, 4096, v3d->mmu_scratch, v3d->mmu_scratch_paddr);
>>   }
>> +static DEFINE_RUNTIME_DEV_PM_OPS(v3d_pm_ops, v3d_power_suspend,
>> +                 v3d_power_resume, NULL);
>> +
>>   static struct platform_driver v3d_platform_driver = {
>>       .probe        = v3d_platform_drm_probe,
>>       .remove        = v3d_platform_drm_remove,
>>       .driver        = {
>>           .name    = "v3d",
>>           .of_match_table = v3d_of_match,
>> +        .pm = pm_ptr(&v3d_pm_ops),
>>       },
>>   };
>> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/ 
>> v3d_drv.h
>> index 
>> 738a09351c306db33078db1e053cd133d55d2138..32835b83caf0309a9e316d6882f63685f58bb6e3 100644
>> --- a/drivers/gpu/drm/v3d/v3d_drv.h
>> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
>> @@ -3,6 +3,7 @@
>>   #include <linux/delay.h>
>>   #include <linux/mutex.h>
>> +#include <linux/pm_runtime.h>
>>   #include <linux/spinlock_types.h>
>>   #include <linux/workqueue.h>
>> @@ -134,6 +135,8 @@ struct v3d_dev {
>>       void __iomem *gca_regs;
>>       void __iomem *sms_regs;
>>       struct clk *clk;
>> +    unsigned long max_clk_rate;
>> +
>>       struct reset_control *reset;
>>       /* Virtual and DMA addresses of the single shared page table. */
>> @@ -324,6 +327,8 @@ struct v3d_job {
>>       /* Callback for the freeing of the job on refcount going to 0. */
>>       void (*free)(struct kref *ref);
>> +
>> +    bool has_pm_ref;
>>   };
>>   struct v3d_bin_job {
>> @@ -597,6 +602,21 @@ int v3d_mmu_set_page_table(struct v3d_dev *v3d);
>>   void v3d_mmu_insert_ptes(struct v3d_bo *bo);
>>   void v3d_mmu_remove_ptes(struct v3d_bo *bo);
>> +/* v3d_power.c */
>> +int v3d_power_suspend(struct device *dev);
>> +int v3d_power_resume(struct device *dev);
>> +
>> +static __always_inline int v3d_pm_runtime_get(struct v3d_dev *v3d)
>> +{
>> +    return pm_runtime_resume_and_get(v3d->drm.dev);
>> +}
>> +
>> +static __always_inline int v3d_pm_runtime_put(struct v3d_dev *v3d)
>> +{
>> +    pm_runtime_mark_last_busy(v3d->drm.dev);
>> +    return pm_runtime_put_autosuspend(v3d->drm.dev);
>> +}
>> +
>>   /* v3d_sched.c */
>>   void v3d_timestamp_query_info_free(struct v3d_timestamp_query_info 
>> *query_info,
>>                      unsigned int count);
>> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/ 
>> v3d_gem.c
>> index 
>> 1f532030c3883257810877c75da38636bf25f58e..70e488180c4684db3415201f19586099914afb15 100644
>> --- a/drivers/gpu/drm/v3d/v3d_gem.c
>> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
>> @@ -125,10 +125,16 @@ void
>>   v3d_reset(struct v3d_dev *v3d)
>>   {
>>       struct drm_device *dev = &v3d->drm;
>> +    int ret;
>> +
>> +    ret = v3d_pm_runtime_get(v3d);
>> +    if (ret)
>> +        return;
>>       DRM_DEV_ERROR(dev->dev, "Resetting GPU for hang.\n");
>>       DRM_DEV_ERROR(dev->dev, "V3D_ERR_STAT: 0x%08x\n",
>>                 V3D_CORE_READ(0, V3D_ERR_STAT));
>> +
>>       trace_v3d_reset_begin(dev);
>>       /* XXX: only needed for safe powerdown, not reset. */
>> @@ -147,6 +153,8 @@ v3d_reset(struct v3d_dev *v3d)
>>       v3d_perfmon_stop(v3d, v3d->active_perfmon, false);
>>       trace_v3d_reset_end(dev);
>> +
>> +    v3d_pm_runtime_put(v3d);
>>   }
>>   static void
>> @@ -344,7 +352,6 @@ v3d_gem_init(struct drm_device *dev)
>>       struct v3d_dev *v3d = to_v3d_dev(dev);
>>       v3d_init_hw_state(v3d);
>> -    v3d_mmu_set_page_table(v3d);
> 
> Do we still need v3d_gem_init() only wrapping v3d_init_hw_state() ?
> 
>>   }
>>   void
>> diff --git a/drivers/gpu/drm/v3d/v3d_mmu.c b/drivers/gpu/drm/v3d/ 
>> v3d_mmu.c
>> index 
>> a25d25a8ae617bf68e133e1793cd0bb930bb07f6..1699819756aadfc40f7d41ff19847d42ddf10dce 100644
>> --- a/drivers/gpu/drm/v3d/v3d_mmu.c
>> +++ b/drivers/gpu/drm/v3d/v3d_mmu.c
>> @@ -37,7 +37,13 @@ static bool v3d_mmu_is_aligned(u32 page, u32 
>> page_address, size_t alignment)
>>   int v3d_mmu_flush_all(struct v3d_dev *v3d)
>>   {
>> -    int ret;
>> +    int ret = 0;
>> +
>> +    pm_runtime_get_noresume(v3d->drm.dev);
>> +
>> +    /* Flush the PTs only if we're already awake */
>> +    if (!pm_runtime_active(v3d->drm.dev))
>> +        goto pm_put;
>>       V3D_WRITE(V3D_MMUC_CONTROL, V3D_MMUC_CONTROL_FLUSH |
>>             V3D_MMUC_CONTROL_ENABLE);
>> @@ -46,7 +52,7 @@ int v3d_mmu_flush_all(struct v3d_dev *v3d)
>>                V3D_MMUC_CONTROL_FLUSHING), 100);
>>       if (ret) {
>>           dev_err(v3d->drm.dev, "MMUC flush wait idle failed\n");
>> -        return ret;
>> +        goto pm_put;
>>       }
>>       V3D_WRITE(V3D_MMU_CTL, V3D_READ(V3D_MMU_CTL) |
>> @@ -57,6 +63,8 @@ int v3d_mmu_flush_all(struct v3d_dev *v3d)
>>       if (ret)
>>           dev_err(v3d->drm.dev, "MMU TLB clear wait idle failed\n");
>> +pm_put:
>> +    pm_runtime_put_autosuspend(v3d->drm.dev);
>>       return ret;
>>   }
>> diff --git a/drivers/gpu/drm/v3d/v3d_power.c b/drivers/gpu/drm/v3d/ 
>> v3d_power.c
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..285f56acf544bbfd3d9848253e788a138aacf2af
>> --- /dev/null
>> +++ b/drivers/gpu/drm/v3d/v3d_power.c
>> @@ -0,0 +1,96 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/* Copyright (C) 2026 Raspberry Pi */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/reset.h>
>> +
>> +#include <drm/drm_print.h>
>> +
>> +#include "v3d_drv.h"
>> +#include "v3d_regs.h"
>> +
>> +static void
>> +v3d_resume_sms(struct v3d_dev *v3d)
>> +{
>> +    if (v3d->ver < V3D_GEN_71)
>> +        return;
>> +
>> +    V3D_SMS_WRITE(V3D_SMS_TEE_CS, V3D_SMS_CLEAR_POWER_OFF);
>> +
>> +    if (wait_for((V3D_GET_FIELD(V3D_SMS_READ(V3D_SMS_TEE_CS),
>> +                    V3D_SMS_STATE) == V3D_SMS_IDLE), 100)) {
>> +        drm_err(&v3d->drm, "Failed to power up SMS\n");
>> +    }
>> +
>> +    v3d_reset_sms(v3d);
>> +}
>> +
>> +static void
>> +v3d_suspend_sms(struct v3d_dev *v3d)
>> +{
>> +    if (v3d->ver < V3D_GEN_71)
>> +        return;
>> +
>> +    V3D_SMS_WRITE(V3D_SMS_TEE_CS, V3D_SMS_POWER_OFF);
>> +
>> +    if (wait_for((V3D_GET_FIELD(V3D_SMS_READ(V3D_SMS_TEE_CS),
>> +                    V3D_SMS_STATE) == V3D_SMS_POWER_OFF_STATE), 100)) {
>> +        drm_err(&v3d->drm, "Failed to power off SMS\n");
>> +    }
>> +}
>> +
>> +int v3d_power_suspend(struct device *dev)
>> +{
>> +    struct drm_device *drm = dev_get_drvdata(dev);
>> +    struct v3d_dev *v3d = to_v3d_dev(drm);
>> +
>> +    v3d_irq_disable(v3d);
>> +    v3d_suspend_sms(v3d);
>> +
>> +    if (v3d->reset)
>> +        reset_control_assert(v3d->reset);
>> +
>> +    /* Some firmware versions might not actually power off the clock
>> +     * when we set the clock state to off. Therefore, set the clock
>> +     * rate to 0 to ensure it is running in the minimum rate.
>> +     */
>> +    if (v3d->clk)
>> +        clk_set_rate(v3d->clk, 0);
>> +
>> +    clk_disable_unprepare(v3d->clk);
>> +
>> +    return 0;
>> +}
>> +
>> +int v3d_power_resume(struct device *dev)
>> +{
>> +    struct drm_device *drm = dev_get_drvdata(dev);
>> +    struct v3d_dev *v3d = to_v3d_dev(drm);
>> +    int ret;
>> +
>> +    ret = clk_prepare_enable(v3d->clk);
>> +    if (ret)
>> +        return ret;
>> +
>> +    /* Set the clock to the maximum rate and let the firmware decide
>> +     * if we can actually keep it.
>> +     */
>> +    if (v3d->clk)
>> +        clk_set_rate(v3d->clk, v3d->max_clk_rate);
>> +
>> +    if (v3d->reset) {
>> +        ret = reset_control_deassert(v3d->reset);
>> +        if (ret)
>> +            goto clk_disable;
>> +    }
>> +
>> +    v3d_resume_sms(v3d);
>> +    v3d_mmu_set_page_table(v3d);
>> +    v3d_irq_enable(v3d);
>> +
>> +    return 0;
>> +
>> +clk_disable:
>> +    clk_disable_unprepare(v3d->clk);
>> +    return ret;
>> +}
>> diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/ 
>> v3d_submit.c
>> index 
>> 7de5a95ee7ca92d480af1f2996c12f2cefa56f34..7487aff499f4587b2887a886c366d735952cee95 100644
>> --- a/drivers/gpu/drm/v3d/v3d_submit.c
>> +++ b/drivers/gpu/drm/v3d/v3d_submit.c
>> @@ -103,6 +103,9 @@ v3d_job_free(struct kref *ref)
>>       if (job->perfmon)
>>           v3d_perfmon_put(job->perfmon);
>> +    if (job->has_pm_ref)
>> +        v3d_pm_runtime_put(job->v3d);
>> +
>>       kfree(job);
>>   }
>> @@ -184,13 +187,13 @@ v3d_job_init(struct v3d_dev *v3d, struct 
>> drm_file *file_priv,
>>                   if (copy_from_user(&in, handle++, sizeof(in))) {
>>                       ret = -EFAULT;
>>                       DRM_DEBUG("Failed to copy wait dep handle.\n");
>> -                    goto fail_deps;
>> +                    goto fail_job_init;
>>                   }
>>                   ret = drm_sched_job_add_syncobj_dependency(&job- 
>> >base, file_priv, in.handle, 0);
>>                   // TODO: Investigate why this was filtered out for 
>> the IOCTL.
>>                   if (ret && ret != -ENOENT)
>> -                    goto fail_deps;
>> +                    goto fail_job_init;
>>               }
>>           }
>>       } else {
>> @@ -198,14 +201,22 @@ v3d_job_init(struct v3d_dev *v3d, struct 
>> drm_file *file_priv,
>>           // TODO: Investigate why this was filtered out for the IOCTL.
>>           if (ret && ret != -ENOENT)
>> -            goto fail_deps;
>> +            goto fail_job_init;
>> +    }
>> +
>> +    /* CPU jobs don't require hardware resources */
>> +    if (queue != V3D_CPU) {
>> +        ret = v3d_pm_runtime_get(v3d);
>> +        if (ret)
>> +            goto fail_job_init;
>> +        job->has_pm_ref = true;
>>       }
>>       kref_init(&job->refcount);
>>       return 0;
>> -fail_deps:
>> +fail_job_init:
>>       drm_sched_job_cleanup(&job->base);
>>       return ret;
>>   }
>>
> 

