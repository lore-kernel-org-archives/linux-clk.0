Return-Path: <SRS0=GqaR=OA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DDF5C43441
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 07:54:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 55DBC21479
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 07:54:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gzn7R/+0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55DBC21479
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728355AbeKUS2P (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Nov 2018 13:28:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:58694 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728220AbeKUS2P (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 21 Nov 2018 13:28:15 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5CE7D2145D;
        Wed, 21 Nov 2018 07:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1542786887;
        bh=6Wl+dgLaxlLgY52fKRlq1k2DkOHdmG0yXaPZ6oknEQw=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=Gzn7R/+0sppeL2sE+RL2m1PunVtoh+TJSyxPd2N6ibaBJMmh4OV+uoLECjTclkft/
         cUhw18zesSOz0yte/L1ANcKJtrUPoA1XRouc/xBeREQkE4Lx/ZeeoryHm6yQLz00oH
         1EFvf4N85ie48rPjXCNuLJHSHfRkppUEZXzGtLdE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Jordan Crouse <jcrouse@codeaurora.org>, mturquette@baylibre.com
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20181119234706.5821-5-jcrouse@codeaurora.org>
Cc:     andy.gross@linaro.org, david.brown@linaro.org,
        rnayak@codeaurora.org, okukatla@codeaurora.org,
        tdas@codeaurora.org, linux-arm-msm@vger.kernel.orgi,
        linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        robdclark@gmail.com, freedreno@lists.freedesktop.org
References: <20181119234706.5821-1-jcrouse@codeaurora.org>
 <20181119234706.5821-5-jcrouse@codeaurora.org>
Message-ID: <154278688660.88331.17378009987496625085@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH 4/4] drm/msm/gpu: Attach to the GPU GX power domain
Date:   Tue, 20 Nov 2018 23:54:46 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jordan Crouse (2018-11-19 15:47:06)
> 99.999% of the time during normal operation the GMU is responsible
> for power and clock control on the GX domain and the CPU remains
> blissfully unaware. However, there is one situation where the CPU
> needs to get involved:
> =

> The power sequencing rules dictate that the GX needs to be turned
> off before the CX so that the CX can be turned on before the GX
> during power up. During normal operation when the CPU is taking
> down the CX domain a stop command is sent to the GMU which turns
> off the GX domain and then the CPU handles the CX domain.
> =

> But if the GMU happened to be unresponsive while the GX domain was
> left then the CPU will need to step in and turn off the GX domain

      ^ left on?

> before resetting the CX and rebooting the GMU. This unfortunately
> means that the CPU needs to be marginally aware of the GX domain
> even though it is expected to usually keep its hands off.
> =

> To support this we create a semi-disabled GX power domain that
> does nothing to the hardware on power up but tries to shut it
> down normally on power down. In this method the reference counting
> is correct and we can step in with the pm_runtime_put() at the right
> time during the failure path.
> =

> This patch sets up the connection to the GX power domain and does
> the magic to "enable" and disable it at the right points.
> =

> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>

The pm_runtime gymnastics is scary! But I'm willing to go with it.

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 41 ++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  2 ++
>  2 files changed, 42 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gmu.c
> index 51493f409358..ca71709efc94 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1142,9 +1169,15 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
>         if (IS_ERR_OR_NULL(gmu->mmio))
>                 return;
>  =

> -       pm_runtime_disable(gmu->dev);
>         a6xx_gmu_stop(a6xx_gpu);
>  =

> +       pm_runtime_disable(gmu->dev);
> +
> +       if (!IS_ERR(gmu->gxpd)) {
> +               pm_runtime_disable(gmu->gxpd);
> +               dev_pm_domain_detach(gmu->gxpd, false);
> +       }
> +
>         a6xx_gmu_irq_disable(gmu);
>         a6xx_gmu_memory_free(gmu, gmu->hfi);
>  =

> @@ -1203,6 +1236,12 @@ int a6xx_gmu_probe(struct a6xx_gpu *a6xx_gpu, stru=
ct device_node *node)
>         if (gmu->hfi_irq < 0 || gmu->gmu_irq < 0)
>                 goto err;
>  =

> +       /*
> +        * Get a link to the GX power domain to reset the GPU in case of =
GMU
> +        * crash
> +        */
> +       gmu->gxpd =3D dev_pm_domain_attach_by_name(gmu->dev, "gx");

Are there a6xx devices that don't have this genpd? Just curious if we
could always assume that if it's an a6xx gpu then this must be there and
we can always call pm_runtime_get/put on it and avoid the if (!IS_ERR())
checks.

> +
>         /* Get the power levels for the GMU and GPU */
>         a6xx_gmu_pwrlevels_probe(gmu);
> =20
