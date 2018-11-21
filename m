Return-Path: <SRS0=GqaR=OA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D79CC43441
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 15:00:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EEED8214C4
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 15:00:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="cLYTXf+7";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="DCaCwogt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEED8214C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730958AbeKVBe6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Nov 2018 20:34:58 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:47090 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728499AbeKVBe6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Nov 2018 20:34:58 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 35F8060B0D; Wed, 21 Nov 2018 15:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1542812411;
        bh=LSj9wS2TYTvRBkJvucmVUQiUi7QVz+CvZ0aUoUGPeiI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cLYTXf+7b4xA9IF3V720NW/Aneep/THegT88dKLk336VRt19FG5v4nAeQ2VCfLtRR
         9ygVUNYQzYOlhyKffhRpP9uFOKR6Ro3rW+EytYdeoBpsWvtBGZmcVZqf8tQtjjNeL2
         IE7eLDZWH18nEEaHD4WlWaW5yEtpQIe8T1q03uYU=
Received: from jcrouse-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0278F6053B;
        Wed, 21 Nov 2018 15:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1542812410;
        bh=LSj9wS2TYTvRBkJvucmVUQiUi7QVz+CvZ0aUoUGPeiI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DCaCwogtUb52ahLV432JDoyEOy8ZyRhlLOzOtaYf4k9MlDwiQOaZNPS6DDyGuofBP
         6YxlCecQC1nUM7oyqvOig6eYE83+oUQ2CpKFeIHERSo93mqcrlyXPaIXlBmZSDibeD
         c3sqdXxwkERaoIdVtpfqhr0cOLCIV1PLMG9NpbKs=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0278F6053B
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Wed, 21 Nov 2018 08:00:06 -0700
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, andy.gross@linaro.org,
        david.brown@linaro.org, rnayak@codeaurora.org,
        okukatla@codeaurora.org, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.orgi, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, robdclark@gmail.com,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 4/4] drm/msm/gpu: Attach to the GPU GX power domain
Message-ID: <20181121150006.GH31792@jcrouse-lnx.qualcomm.com>
Mail-Followup-To: Stephen Boyd <sboyd@kernel.org>, mturquette@baylibre.com,
        andy.gross@linaro.org, david.brown@linaro.org,
        rnayak@codeaurora.org, okukatla@codeaurora.org, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.orgi, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, robdclark@gmail.com,
        freedreno@lists.freedesktop.org
References: <20181119234706.5821-1-jcrouse@codeaurora.org>
 <20181119234706.5821-5-jcrouse@codeaurora.org>
 <154278688660.88331.17378009987496625085@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <154278688660.88331.17378009987496625085@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Nov 20, 2018 at 11:54:46PM -0800, Stephen Boyd wrote:
> Quoting Jordan Crouse (2018-11-19 15:47:06)
> > 99.999% of the time during normal operation the GMU is responsible
> > for power and clock control on the GX domain and the CPU remains
> > blissfully unaware. However, there is one situation where the CPU
> > needs to get involved:
> > 
> > The power sequencing rules dictate that the GX needs to be turned
> > off before the CX so that the CX can be turned on before the GX
> > during power up. During normal operation when the CPU is taking
> > down the CX domain a stop command is sent to the GMU which turns
> > off the GX domain and then the CPU handles the CX domain.
> > 
> > But if the GMU happened to be unresponsive while the GX domain was
> > left then the CPU will need to step in and turn off the GX domain
> 
>       ^ left on?
> 
> > before resetting the CX and rebooting the GMU. This unfortunately
> > means that the CPU needs to be marginally aware of the GX domain
> > even though it is expected to usually keep its hands off.
> > 
> > To support this we create a semi-disabled GX power domain that
> > does nothing to the hardware on power up but tries to shut it
> > down normally on power down. In this method the reference counting
> > is correct and we can step in with the pm_runtime_put() at the right
> > time during the failure path.
> > 
> > This patch sets up the connection to the GX power domain and does
> > the magic to "enable" and disable it at the right points.
> > 
> > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> 
> The pm_runtime gymnastics is scary! But I'm willing to go with it.
> 
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 41 ++++++++++++++++++++++++++-
> >  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  2 ++
> >  2 files changed, 42 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > index 51493f409358..ca71709efc94 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > @@ -1142,9 +1169,15 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
> >         if (IS_ERR_OR_NULL(gmu->mmio))
> >                 return;
> >  
> > -       pm_runtime_disable(gmu->dev);
> >         a6xx_gmu_stop(a6xx_gpu);
> >  
> > +       pm_runtime_disable(gmu->dev);
> > +
> > +       if (!IS_ERR(gmu->gxpd)) {
> > +               pm_runtime_disable(gmu->gxpd);
> > +               dev_pm_domain_detach(gmu->gxpd, false);
> > +       }
> > +
> >         a6xx_gmu_irq_disable(gmu);
> >         a6xx_gmu_memory_free(gmu, gmu->hfi);
> >  
> > @@ -1203,6 +1236,12 @@ int a6xx_gmu_probe(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
> >         if (gmu->hfi_irq < 0 || gmu->gmu_irq < 0)
> >                 goto err;
> >  
> > +       /*
> > +        * Get a link to the GX power domain to reset the GPU in case of GMU
> > +        * crash
> > +        */
> > +       gmu->gxpd = dev_pm_domain_attach_by_name(gmu->dev, "gx");
> 
> Are there a6xx devices that don't have this genpd? Just curious if we
> could always assume that if it's an a6xx gpu then this must be there and
> we can always call pm_runtime_get/put on it and avoid the if (!IS_ERR())
> checks.

Mainly I was trying to be backwards compatible with the device tree. I didn't
want to derail various development efforts. I don't mind the checks (though I
wish that pm_runtime_* was error tolerant) but folks really hate them we can
replace this with an error return and force people to update their device trees.

Jordan

> +
> >         /* Get the power levels for the GMU and GPU */
> >         a6xx_gmu_pwrlevels_probe(gmu);
> >  

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
