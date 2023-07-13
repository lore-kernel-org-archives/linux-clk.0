Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1995C0015E
	for <linux-clk@archiver.kernel.org>; Thu, 13 Jul 2023 13:26:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235312AbjGMN0h (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Jul 2023 09:26:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234973AbjGMN0V (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Jul 2023 09:26:21 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B509358C
        for <linux-clk@vger.kernel.org>; Thu, 13 Jul 2023 06:25:51 -0700 (PDT)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 003DE3F71A
        for <linux-clk@vger.kernel.org>; Thu, 13 Jul 2023 13:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1689254704;
        bh=njPCzRp+gLgGXnuaFscEFk6TNloreb9Z1F7nmpn2GCo=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=g6HWNWPSWnqnwi6oIbL3RJgmEIS/5aD5U7e+1hYvyZGjsIj5qS3zsg/JWIWNRy6Zl
         CTs8Ds4c7Dy1MF3Gv9Kdx2B9hq4zxaFd7W1bQboK+Wb1GNFafjj4HIgq5mvm8ahhNi
         ITqNll5sQDTyDHp7L6kzCk2OhySntpI3BySO8fxGIxQtryJtYAG7qeddWs8T5vDbxx
         oRH1PBz9oL7N+/nGQSBo+6ig9TpCbdN2RvPVab1/iSc5ixjmPIt1GsObrRxGauXFMq
         RHsnmeJwVnsK3UnlwralpBGwJhr9CtAHvslfRhWWaRQAfaeqU2oNveIdLyfDXoTKef
         K89AwWxAE72dA==
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-40327302341so6682661cf.3
        for <linux-clk@vger.kernel.org>; Thu, 13 Jul 2023 06:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689254702; x=1691846702;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=njPCzRp+gLgGXnuaFscEFk6TNloreb9Z1F7nmpn2GCo=;
        b=QLYHLS5SUru0ArkIoMprCB/y0+TCb7mnfSTUFGs1YqZAxhVyibSqjpJWFgV4zWVgB4
         wsr6OOzEEprmK8sb4bi6alVzYH75wzvLa9ol7fDk38AeFHy4hVKP5lZe88Xlk4T2hu9H
         buyRrbPzPMkEnJ08c8hQoFnEEih7mz/A9fwPzwFog+SRj+OTJi8jS0yx3ihjujz9d3te
         V4ZiuoXA6mLhI/Li97bDkcKp6RVA3MfN5/lRhRUpaOo5gSSiwUeKcgU2eemoNSpeJXIz
         mFgPvlYQWgEdQN29NXb5PTVUPLZFYg6iGDR79+aNGnf1PR/P2uoOM9w7sN1olEUuZPOO
         2pYw==
X-Gm-Message-State: ABy/qLaLzLg4oMSuMvcSnXfHyknkCpL7VVawapAgZIDbbq6Q4tVuu9TN
        H8yUIgE861EnEVTOEtzoYStUnLBhJ6VUtDMyFEy1s0AqnzYRy75gE8DYdwuR53ia1jLtElM3KNt
        76XIY17iIrPMiwRP6j8eZN9CaO6NOOovWjZgo40NsJBlOgOMhld2z1w==
X-Received: by 2002:a05:622a:14d4:b0:3f6:aff0:6dec with SMTP id u20-20020a05622a14d400b003f6aff06decmr1750881qtx.32.1689254702771;
        Thu, 13 Jul 2023 06:25:02 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEWYwWyI37hBY/T3E7FV4GEsBkoCOExBvaA0XLzyYLy56YtYThzvj/ApC8dphahHLu8bbys9suJD14jU2FGI2M=
X-Received: by 2002:a05:622a:14d4:b0:3f6:aff0:6dec with SMTP id
 u20-20020a05622a14d400b003f6aff06decmr1750857qtx.32.1689254702551; Thu, 13
 Jul 2023 06:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230704064610.292603-1-xingyu.wu@starfivetech.com> <20230704064610.292603-8-xingyu.wu@starfivetech.com>
In-Reply-To: <20230704064610.292603-8-xingyu.wu@starfivetech.com>
From:   Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date:   Thu, 13 Jul 2023 15:24:46 +0200
Message-ID: <CAJM55Z989XRDuzff14pFa+AFnL6xBsswONFfdFxKbwGy55TwoA@mail.gmail.com>
Subject: Re: [RESEND PATCH v6 7/7] riscv: dts: starfive: jh7110: Add PLL
 clocks source in SYSCRG node
To:     Xingyu Wu <xingyu.wu@starfivetech.com>
Cc:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Conor Dooley <conor@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Hal Feng <hal.feng@starfivetech.com>,
        William Qiu <william.qiu@starfivetech.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 4 Jul 2023 at 08:49, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
>
> Add PLL clocks input from PLL clocks driver in SYSCRG node.
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index 11dd4c9d64b0..cdfd036a0e6c 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -452,12 +452,16 @@ syscrg: clock-controller@13020000 {
>                                  <&gmac1_rgmii_rxin>,
>                                  <&i2stx_bclk_ext>, <&i2stx_lrck_ext>,
>                                  <&i2srx_bclk_ext>, <&i2srx_lrck_ext>,
> -                                <&tdm_ext>, <&mclk_ext>;
> +                                <&tdm_ext>, <&mclk_ext>,
> +                                <&pllclk JH7110_CLK_PLL0_OUT>,
> +                                <&pllclk JH7110_CLK_PLL1_OUT>,
> +                                <&pllclk JH7110_CLK_PLL2_OUT>;

Once these are updated to <&pll ?> or <&pllclk JH7110_PLLCLK_PLL?_OUT>
if you still want to keep the defines:
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

>                         clock-names = "osc", "gmac1_rmii_refin",
>                                       "gmac1_rgmii_rxin",
>                                       "i2stx_bclk_ext", "i2stx_lrck_ext",
>                                       "i2srx_bclk_ext", "i2srx_lrck_ext",
> -                                     "tdm_ext", "mclk_ext";
> +                                     "tdm_ext", "mclk_ext",
> +                                     "pll0_out", "pll1_out", "pll2_out";
>                         #clock-cells = <1>;
>                         #reset-cells = <1>;
>                 };
> --
> 2.25.1
>
