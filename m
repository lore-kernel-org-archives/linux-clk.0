Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27A06EB64DD
	for <linux-clk@archiver.kernel.org>; Thu,  6 Jul 2023 14:25:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbjGFOZ3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 6 Jul 2023 10:25:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbjGFOZ3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 6 Jul 2023 10:25:29 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6966F19B2
        for <linux-clk@vger.kernel.org>; Thu,  6 Jul 2023 07:25:27 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3a3a8d21208so783401b6e.0
        for <linux-clk@vger.kernel.org>; Thu, 06 Jul 2023 07:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688653526; x=1691245526;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UAmC7tTCrZWb1DzQQQJI24HgO/n+4SMWa7GWF0FIrFs=;
        b=FwdF2juC/Rxc/lV8rVRk/kaPXoedO7KxPWSlvBM9kscG+CXbjk9zfb9C4IEjZxM4/+
         HKAJ7fOWSYVrCOfUoxIQn7gHQpkT7TRBZW1O6MoVejzhWhRvxetdtea/B4kM0x+ITOLr
         U01ys52joEOMHFcdn9a6yomWA7/QOkvSChb7l9Ydw8hZHoTCXV6BYCXPx0cCxpNgspHr
         1BBYVOH/GiK1CR550QeFGQ+lgal8a935mvA1sCCqYtQmk/ZyN/MEDR6n59NTzH521Pks
         JiBNvngwzmffAbbk7LDhjy7kuwJBDtPqHc+fjxEA0HOCP0wxcFfaZo11pHHZF/CnH+v0
         kSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688653526; x=1691245526;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UAmC7tTCrZWb1DzQQQJI24HgO/n+4SMWa7GWF0FIrFs=;
        b=XxHTzoHKWXVAkd8OL3iIRcfhQED458AeaW+HgQJzrfPWcx/A6jvxuS5l85nFGYlKwc
         T9nDxaKbJIOATQlytUphnILCaFc6Y+QgtvxP2THp5PqwQP3m7XiiWkye+kbOnIdTOzss
         Me2CbcdDEQv2xwvDsGpM3IT2MTNGgcYK8Yue18vcM1kMFQj1pE11pRRe1QzvIl0UgcuS
         OT0n/B9639LyavkdfrY/yMiAx/fOWkxkSI44uON3ISP7qBvDUIrnGwDZCmvba3avYjS3
         uhM6Sm7an23c4Q3viVuLoYvuKRvrq1rwdhAWluORG/GmrpPPftgQqBZ5nNuzXi6MgU0F
         QDhg==
X-Gm-Message-State: ABy/qLbTCwgLjfw2CFOPPQtdYnuValuSgqYdR8RV9TlTly5Nv3Y94GyM
        ZEJMHNTyKDvBHBruWpR/X+J6
X-Google-Smtp-Source: APBJJlFdNoYBUjh+Ezg1m1BOyuVoeyzEVD2FV1XcyYtOO8uJSHOCruggk9nXlH7io++GgK1ox43y3g==
X-Received: by 2002:aca:2308:0:b0:3a1:b638:9c2c with SMTP id e8-20020aca2308000000b003a1b6389c2cmr1732499oie.55.1688653526139;
        Thu, 06 Jul 2023 07:25:26 -0700 (PDT)
Received: from thinkpad ([117.216.120.100])
        by smtp.gmail.com with ESMTPSA id b15-20020a63714f000000b0052c22778e64sm1373747pgn.66.2023.07.06.07.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 07:25:25 -0700 (PDT)
Date:   Thu, 6 Jul 2023 19:55:18 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        konrad.dybcio@linaro.org, johan+linaro@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: qcom: gcc-sc8280xp: Allow PCIe GDSCs to enter
 retention state
Message-ID: <20230706142518.GA19061@thinkpad>
References: <20230706140842.18059-1-manivannan.sadhasivam@linaro.org>
 <ZKbM4vLpk_T3cGWC@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZKbM4vLpk_T3cGWC@hovoldconsulting.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jul 06, 2023 at 04:17:06PM +0200, Johan Hovold wrote:
> On Thu, Jul 06, 2023 at 07:38:42PM +0530, Manivannan Sadhasivam wrote:
> > With the minimal system suspend support in place for the PCIe driver that
> > keeps the interconnect path voted, the ALWAYS_ON flag can now be dropped.
> > 
> > Also, the PWRSTS_RET_ON flag should be used to allow the GDSCs to enter the
> > retention state when the parent domain get's turned off during system
> > suspend.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> > 
> > Changes in v2:
> > 
> > * Changed the patch from simple revert to changing the ALWAYS_ON flag to
> >   PWRSTS_RET_ON.
> > 
> >  drivers/clk/qcom/gcc-sc8280xp.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/clk/qcom/gcc-sc8280xp.c b/drivers/clk/qcom/gcc-sc8280xp.c
> > index 04a99dbaa57e..c59b0f91c87d 100644
> > --- a/drivers/clk/qcom/gcc-sc8280xp.c
> > +++ b/drivers/clk/qcom/gcc-sc8280xp.c
> > @@ -6786,7 +6786,7 @@ static struct gdsc pcie_2a_gdsc = {
> >  		.name = "pcie_2a_gdsc",
> >  	},
> >  	.pwrsts = PWRSTS_OFF_ON,
> > -	.flags = VOTABLE | ALWAYS_ON,
> > +	.flags = VOTABLE | PWRSTS_RET_ON,
> >  };
> 
> This is not correct either. PWRSTS_RET_ON is a pwrsts mask...
> 

I should stop sending patches while feeling sleepy...

- Mani

> Johan

-- 
மணிவண்ணன் சதாசிவம்
