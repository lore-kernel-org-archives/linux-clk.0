Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF6C31E834
	for <linux-clk@vger.kernel.org>; Mon,  2 Mar 2026 22:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772492401; cv=none; b=IyOpeG2gVyxrfQMA5wFhr2fob+7qYEAmQOpyHSANlenJcSbanieAGpxvbiEW2qb7oVo8nq7oQqcwwQsEIMVK6X+9hXnjDW3UQRHwcg3KsTgzjlclW2x+VHsz4vIqH05GvJn8sWwLGd13nfkPUI9E8+ysuNNWy1dKKWHcXuMpm4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772492401; c=relaxed/simple;
	bh=mTf7y5mdJrDws9f9ehKayRWh/dPyzbKoAMyFm0B1Mck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ODdoqsWoBiMwGrMcXUzmlfb10Wr371y4uAbkZjz6/ARyMKbJ75YZ81RBofDF36yDeN44JtEiXXUIXVP4EptI4sgwzzn9drbFT1G+WFnsp1V+CqJejLVkKYhmnPYwELFzGO3Ppjc8zdObtv5slKr5AR6c55HYFYyg9TXGIPT/UUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=JEvszFQ1; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="JEvszFQ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1772492380; x=1773097180; i=wahrenst@gmx.net;
	bh=3i0kTk9h4Tm7QszjJIXjo1qFSidrNxe30HcG0SNcNOc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=JEvszFQ12SGUs6t10r6bQup5LhwuGOfDoImIHInCZagXWRrnyeCsQea7a+h2223e
	 ZX/44JSjAoUjuHkGXJkSFQEO/Mbf4SavOmpz0Hw7A0Ev9fjH9+JzO3781+BONAdBd
	 /7zqMSXYfzMXOCROV4c9nRBTjRpxSAyW2x/EnCKT9iPhFRaSsDnm6FdBSlwi2m+Ks
	 xqonoywC1BXJslk/bBEn1/c0EfNRDhgSulo6mTn3vTVKspewWVP/YoQbfDJ2k3Oxz
	 xF9Jii+2+i8RwtjOY6wbgY7VnL5S3SFAUG39LyFBQJdeK/SV8JMW64sFjnn8kKLTv
	 ifKteYBRT2wE6zGE1A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MXXuH-1wBJFD2kJz-00MLyB; Mon, 02
 Mar 2026 23:59:40 +0100
Message-ID: <1ac72f71-e742-4754-9400-4a7f26a8b52d@gmx.net>
Date: Mon, 2 Mar 2026 23:59:39 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/6] drm/v3d: Introduce Runtime Power Management
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>,
 Chema Casanova <jmcasanova@igalia.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
References: <20260218-v3d-power-management-v6-0-40683fd39865@igalia.com>
 <20260218-v3d-power-management-v6-6-40683fd39865@igalia.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20260218-v3d-power-management-v6-6-40683fd39865@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1h3Bzt16hbphMMQXb+zgTJ8MNFCC485TK5VhSAWsJxoz11vFXBt
 WnOcRXjLD050pht+F8uwItJkeO3JdgNwP7Trv7LnpRXCYi2gj749STBYaQESbYFbHFR6RZ1
 O25Rdw0v4m/Z6dYKk2sojqPrcHkWVQJYuDKcGR8Qf7JNftakTTSZcrcoj4VbVMW0BphmOQo
 ykvQl8aP8XrX03aCE+ahg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Tou9v1rMmD4=;ek/A2HueG+WPXgjF5SbLca7lFC0
 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

Hi Ma=C3=ADra,

just 2 nits.

Am 18.02.26 um 21:45 schrieb Ma=C3=ADra Canal:
> Commit 90a64adb0876 ("drm/v3d: Get rid of pm code") removed the last
> bits of power management code that V3D had, which were actually never
> hooked. Therefore, currently, the GPU clock is enabled during probe
> and only disabled when removing the driver.
>
> Implement proper power management using the kernel's Runtime PM
> framework.
>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
>   drivers/gpu/drm/v3d/Makefile      |  3 +-
>   drivers/gpu/drm/v3d/v3d_debugfs.c | 23 ++++++++++-
>   drivers/gpu/drm/v3d/v3d_drv.c     | 84 ++++++++++++++++++-------------=
=2D-------
>   drivers/gpu/drm/v3d/v3d_drv.h     | 17 ++++++++
>   drivers/gpu/drm/v3d/v3d_mmu.c     | 10 ++++-
>   drivers/gpu/drm/v3d/v3d_perfmon.c | 18 +++++++--
>   drivers/gpu/drm/v3d/v3d_power.c   | 83 +++++++++++++++++++++++++++++++=
+++++++
>   drivers/gpu/drm/v3d/v3d_submit.c  | 19 +++++++--
>   8 files changed, 198 insertions(+), 59 deletions(-)
>
> diff --git a/drivers/gpu/drm/v3d/Makefile b/drivers/gpu/drm/v3d/Makefile
> index b7d673f1153bef16db3800e50b2bfaf36bf8871b..9cb1fd4e4091dbb56e6a73e2=
b8a51fa0d242698b 100644
> --- a/drivers/gpu/drm/v3d/Makefile
> +++ b/drivers/gpu/drm/v3d/Makefile
> @@ -13,7 +13,8 @@ v3d-y :=3D \
>   	v3d_trace_points.o \
>   	v3d_sched.o \
>   	v3d_sysfs.o \
> -	v3d_submit.o
> +	v3d_submit.o \
> +	v3d_power.o
Please keep the alphabetical order.
>  =20
>   v3d-$(CONFIG_DEBUG_FS) +=3D v3d_debugfs.o
>  =20
...
>  =20
> diff --git a/drivers/gpu/drm/v3d/v3d_power.c b/drivers/gpu/drm/v3d/v3d_p=
ower.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..f3d30ef5de4ea6ecdbd21c43=
8b8af54bdf4d0dba
> --- /dev/null
> +++ b/drivers/gpu/drm/v3d/v3d_power.c
> @@ -0,0 +1,83 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/* Copyright (C) 2026 Raspberry Pi */
> +
> +#include <linux/clk.h>
> +#include <linux/reset.h>
> +
> +#include <drm/drm_print.h>
> +
> +#include "v3d_drv.h"
> +#include "v3d_regs.h"
> +
> +static void
> +v3d_resume_sms(struct v3d_dev *v3d)
> +{
> +	if (v3d->ver < V3D_GEN_71)
> +		return;
> +
> +	V3D_SMS_WRITE(V3D_SMS_TEE_CS, V3D_SMS_CLEAR_POWER_OFF);
> +
> +	if (wait_for((V3D_GET_FIELD(V3D_SMS_READ(V3D_SMS_TEE_CS),
> +				    V3D_SMS_STATE) =3D=3D V3D_SMS_IDLE), 100)) {
> +		drm_err(&v3d->drm, "Failed to power up SMS\n");
> +	}
> +
> +	v3d_reset_sms(v3d);
> +}
> +
> +static void
> +v3d_suspend_sms(struct v3d_dev *v3d)
> +{
> +	if (v3d->ver < V3D_GEN_71)
> +		return;
> +
> +	V3D_SMS_WRITE(V3D_SMS_TEE_CS, V3D_SMS_POWER_OFF);
> +
> +	if (wait_for((V3D_GET_FIELD(V3D_SMS_READ(V3D_SMS_TEE_CS),
> +				    V3D_SMS_STATE) =3D=3D V3D_SMS_POWER_OFF_STATE), 100)) {
> +		drm_err(&v3d->drm, "Failed to power off SMS\n");
> +	}
> +}
> +
> +int v3d_power_suspend(struct device *dev)
> +{
> +	struct drm_device *drm =3D dev_get_drvdata(dev);
> +	struct v3d_dev *v3d =3D to_v3d_dev(drm);
> +
> +	v3d_irq_disable(v3d);
> +	v3d_suspend_sms(v3d);
> +
> +	if (v3d->reset)
> +		reset_control_assert(v3d->reset);
Shouldn't we handle the error case?
> +
> +	clk_disable_unprepare(v3d->clk);
> +
> +	return 0;
> +}
> +
> +int v3d_power_resume(struct device *dev)
> +{
> +	struct drm_device *drm =3D dev_get_drvdata(dev);
> +	struct v3d_dev *v3d =3D to_v3d_dev(drm);
> +	int ret;
> +
> +	ret =3D clk_prepare_enable(v3d->clk);
> +	if (ret)
> +		return ret;
> +
> +	if (v3d->reset) {
> +		ret =3D reset_control_deassert(v3d->reset);
> +		if (ret)
> +			goto clk_disable;
> +	}
> +
> +	v3d_resume_sms(v3d);
> +	v3d_mmu_set_page_table(v3d);
> +	v3d_irq_enable(v3d);
> +
> +	return 0;
> +
> +clk_disable:
> +	clk_disable_unprepare(v3d->clk);
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_=
submit.c
> index 794c3571662de7eb566bf4c0561571d7618dd234..fea7573505cd0d2b84d21efd=
a88ed4da657d18d4 100644
> --- a/drivers/gpu/drm/v3d/v3d_submit.c
> +++ b/drivers/gpu/drm/v3d/v3d_submit.c
> @@ -103,6 +103,9 @@ v3d_job_free(struct kref *ref)
>   	if (job->perfmon)
>   		v3d_perfmon_put(job->perfmon);
>  =20
> +	if (job->has_pm_ref)
> +		v3d_pm_runtime_put(job->v3d);
> +
>   	kfree(job);
>   }
>  =20
> @@ -184,13 +187,13 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file =
*file_priv,
>   				if (copy_from_user(&in, handle++, sizeof(in))) {
>   					ret =3D -EFAULT;
>   					drm_dbg(&v3d->drm, "Failed to copy wait dep handle.\n");
> -					goto fail_deps;
> +					goto fail_job_init;
>   				}
>   				ret =3D drm_sched_job_add_syncobj_dependency(&job->base, file_priv=
, in.handle, 0);
>  =20
>   				// TODO: Investigate why this was filtered out for the IOCTL.
>   				if (ret && ret !=3D -ENOENT)
> -					goto fail_deps;
> +					goto fail_job_init;
>   			}
>   		}
>   	} else {
> @@ -198,14 +201,22 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file =
*file_priv,
>  =20
>   		// TODO: Investigate why this was filtered out for the IOCTL.
>   		if (ret && ret !=3D -ENOENT)
> -			goto fail_deps;
> +			goto fail_job_init;
> +	}
> +
> +	/* CPU jobs don't require hardware resources */
> +	if (queue !=3D V3D_CPU) {
> +		ret =3D v3d_pm_runtime_get(v3d);
> +		if (ret)
> +			goto fail_job_init;
> +		job->has_pm_ref =3D true;
>   	}
>  =20
>   	kref_init(&job->refcount);
>  =20
>   	return 0;
>  =20
> -fail_deps:
> +fail_job_init:
>   	drm_sched_job_cleanup(&job->base);
>   	return ret;
>   }
>

