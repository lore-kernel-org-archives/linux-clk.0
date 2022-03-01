Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08494C433EF
	for <linux-clk@archiver.kernel.org>; Tue,  1 Mar 2022 19:32:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236325AbiCATcn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 1 Mar 2022 14:32:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236202AbiCATcn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Mar 2022 14:32:43 -0500
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4BAA6A041
        for <linux-clk@vger.kernel.org>; Tue,  1 Mar 2022 11:31:59 -0800 (PST)
Received: by mail-oo1-xc34.google.com with SMTP id j7-20020a4ad6c7000000b0031c690e4123so23681241oot.11
        for <linux-clk@vger.kernel.org>; Tue, 01 Mar 2022 11:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OhkKbjXQRtr8cgG2YtwNCXV0fM/H/tNTVmzFq7kxqEs=;
        b=rsq0gRFmRYXhijTGz6DmP0W3Fl50LFrhfxPhGW5/J2n324ApNP84JmyO2FXFv/pKKt
         hKaoZ3lVzP5KVhl6JieJVJkxnBtbVVpeV2rsjar0hijIZjLEjQpUjZrvOMwM+kAX711U
         miIhetocVb6BLwE62lHjzVvBGeGgUixUD3tLSZ4su8TJtPlyKz8B/fCogV236DVvdYLO
         BDBNii4S2qn/eF55CELY1cbueNrKCWUH2Ht77SFpd71xI9DWwmU8qucSop61abB185ke
         VlwOGEeDV7mvsmMmaUlNE0fKFNVlCdpPnokx8Rlbvld0PFwwleqFdVDjXNF8LokCPMVX
         XLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OhkKbjXQRtr8cgG2YtwNCXV0fM/H/tNTVmzFq7kxqEs=;
        b=FrkQSfFtdAp6JsiTgBRsH2Q2vHToRjritHYPT7RxzLk7IoJ/Pnvth9iI+GG8o+/LpH
         wStNiRxOM5YEcnXZERQcQgtR3xFbgfZKGP+CvgDqfIs2aBj3eLrA4wO8oW6mCidbWkqH
         K0J1JgDP9qcipxqajUFvBKBo5AzGxQlrhLTCNKkAcz9l52InuO+UYS8Um1+Jux9aP2aA
         7VAYjil5OW3kUowqQSQbFw3XrrKwv2hnIyTcv5llzrhP04QSGYSumDyDuZcLXo8lK4lx
         uUE3AP6679+//vp+d3h/E3dS03vCCOOPSJJWJlZzVdKJpvKNau3PcNq7SsDGKpkqPqHI
         Kc4A==
X-Gm-Message-State: AOAM5313Lb+IK5jirbSmMFrRlLyFTQsiPJFjcdP7oZ6FBF3xk91IhbnM
        n7Zyh4DA7SrE18rsxQYUPwN90cwMn3OwZlE88h33dQ==
X-Google-Smtp-Source: ABdhPJwnaa8BzyVfV18C2z53t5huHKOd/h4d/Z8gv3zm7mUkkA1bDOpI74xw0xVSz19DWMVQ7pSoGE/8vD/vOidmloE=
X-Received: by 2002:a05:6870:4508:b0:d7:162f:6682 with SMTP id
 e8-20020a056870450800b000d7162f6682mr8058828oao.126.1646163118705; Tue, 01
 Mar 2022 11:31:58 -0800 (PST)
MIME-Version: 1.0
References: <20220126221725.710167-1-bhupesh.sharma@linaro.org>
 <20220126221725.710167-3-bhupesh.sharma@linaro.org> <Yfh5qrT2dAMpFk2s@builder.lan>
In-Reply-To: <Yfh5qrT2dAMpFk2s@builder.lan>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Wed, 2 Mar 2022 01:01:47 +0530
Message-ID: <CAH=2Ntz837KwreQX4JBf1E6J0SWnV0v-YqtRAn2nU-Dse+f3Gw@mail.gmail.com>
Subject: Re: [PATCH 2/8] net: stmmac: Add support for SM8150
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, agross@kernel.org, sboyd@kernel.org,
        tdas@codeaurora.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org, davem@davemloft.net,
        netdev@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Bjorn,

Sorry for the late reply.

On Tue, 1 Feb 2022 at 05:37, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>
> On Wed 26 Jan 16:17 CST 2022, Bhupesh Sharma wrote:
>
> > From: Vinod Koul <vkoul@kernel.org>
> >
> > This adds compatible, POR config & driver data for ethernet controller
> > found in SM8150 SoC.
> >
> > Cc: David S. Miller <davem@davemloft.net>
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > [bhsharma: Massage the commit log and other cosmetic changes]
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
>
> The series can be picked up by 3 different maintainers and e.g. the
> network patches seems ready to be merged.
>
> Please facilitate this by sending it in 3 different series (you may
> combine clock and dts in one series, as I merge both).

Sure, I will send 3 different series in v2.

Regards,
Bhupesh

> > ---
> >  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > index 2ffa0a11eea5..8cdba9d521ec 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > @@ -183,6 +183,20 @@ static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
> >       .num_por = ARRAY_SIZE(emac_v2_3_0_por),
> >  };
> >
> > +static const struct ethqos_emac_por emac_v2_1_0_por[] = {
> > +     { .offset = RGMII_IO_MACRO_CONFIG,      .value = 0x40C01343 },
> > +     { .offset = SDCC_HC_REG_DLL_CONFIG,     .value = 0x2004642C },
> > +     { .offset = SDCC_HC_REG_DDR_CONFIG,     .value = 0x00000000 },
> > +     { .offset = SDCC_HC_REG_DLL_CONFIG2,    .value = 0x00200000 },
> > +     { .offset = SDCC_USR_CTL,               .value = 0x00010800 },
> > +     { .offset = RGMII_IO_MACRO_CONFIG2,     .value = 0x00002060 },
> > +};
> > +
> > +static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
> > +     .por = emac_v2_1_0_por,
> > +     .num_por = ARRAY_SIZE(emac_v2_1_0_por),
> > +};
> > +
> >  static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
> >  {
> >       unsigned int val;
> > @@ -558,6 +572,7 @@ static int qcom_ethqos_remove(struct platform_device *pdev)
> >
> >  static const struct of_device_id qcom_ethqos_match[] = {
> >       { .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
> > +     { .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
> >       { }
> >  };
> >  MODULE_DEVICE_TABLE(of, qcom_ethqos_match);
> > --
> > 2.34.1
> >
