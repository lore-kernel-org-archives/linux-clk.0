Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F37DAEB64DA
	for <linux-clk@archiver.kernel.org>; Wed, 12 Jul 2023 18:11:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231528AbjGLSLG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Jul 2023 14:11:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbjGLSLF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Jul 2023 14:11:05 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AB4F19BC
        for <linux-clk@vger.kernel.org>; Wed, 12 Jul 2023 11:11:04 -0700 (PDT)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1C4D93F189
        for <linux-clk@vger.kernel.org>; Wed, 12 Jul 2023 18:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1689185463;
        bh=jZV4lxXU1ZB6Js3u/270T4FZAtmvDEeFk82+tjv5Ytg=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=SBPU4RbR1cCYIXtRcX+8LhsJs7NtDfzUpP6E1Ru5hYAyxkK+BK+Ft1Qwhz+gGfuxR
         f5qXiaY7xM0LcOLM6lZNhIC7JhtnrBOQ1TlmROJqxIGyZISpTmrml0ePQp4ArQYNzV
         qr4wTpyJpSW9MufsbsIdOt7t6lJXOAEwhW5enfY1c9ueHRK9rspX3ekCy9tz79x54+
         vtL6g+Xu6+cbOqIODqq5QsX+hWNE5wjHs4KzAkwmuI19ivcx+i7zlblNbVZ9kzPe/X
         pG3OAqdAG2IRa8Vr7v+Z2ixwd/5I47FD0mlBuPROWSBNr01WI7darnff4qCVEC/zPJ
         8cIdt4aFL0Rtw==
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-403c1294d95so18308941cf.0
        for <linux-clk@vger.kernel.org>; Wed, 12 Jul 2023 11:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689185462; x=1691777462;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jZV4lxXU1ZB6Js3u/270T4FZAtmvDEeFk82+tjv5Ytg=;
        b=TYV0MoMlBBA+cf5DwrjIY9LJ44yDl0E9OkRrOAF9IWFkQ3WMrDB/rtErEdr64Zywb+
         b+4df8AlEp8jRSzL0Mr/jaWkZ0Hlp6j+9qff/2vqBARtu53gF9VCzyWRRIlsh/8rYcvr
         7+ctAz73K5pTorNbaIOrSKK5qRmpIX/Dl5eI0umVUx+5NFNluEtucXyVgDDaQczWYrgM
         CBjGTLCxQ2vEuChwbZa1+Xz8gnGv2AeO4aSVfMzvt7KCB8PeMp9f/bmPNJExRsYNAr9B
         3+EKqHF9XAQSIP1i7F2sPsY8WUOviiHYRwFX8PCpqT72n3mPhr1Yj7OVWbF3Gnn+jJB/
         txkw==
X-Gm-Message-State: ABy/qLY0psCPty+UZv7ULKxMVIijVSfjc69dMAcy3Sgm3PK6oaxL/xk5
        4ww6skCS248So3qeuCo2JWXdNQyPnrunHvnOhqFXSRtz6d0aMaHAbkUeD7V43xQP24UZ/T/TPd+
        xGKWBWO5RAwrT9OFQepEwHOAl1vbb/rkX81Y9DNJNn73/rn4+cA+JiQ==
X-Received: by 2002:a05:622a:144d:b0:403:b395:b3c0 with SMTP id v13-20020a05622a144d00b00403b395b3c0mr9913187qtx.3.1689185461751;
        Wed, 12 Jul 2023 11:11:01 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHEi6ZnXrU4jchYntQmVhlI+BbvJ58VQ34IJb9Ptwwjd3rb28kvuNYpTLkLgpIcX7In9qBHKfW1YR3dXyt8LFc=
X-Received: by 2002:a05:622a:144d:b0:403:b395:b3c0 with SMTP id
 v13-20020a05622a144d00b00403b395b3c0mr9913166qtx.3.1689185461476; Wed, 12 Jul
 2023 11:11:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230712092007.31013-1-xingyu.wu@starfivetech.com> <20230712092007.31013-9-xingyu.wu@starfivetech.com>
In-Reply-To: <20230712092007.31013-9-xingyu.wu@starfivetech.com>
From:   Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date:   Wed, 12 Jul 2023 20:10:45 +0200
Message-ID: <CAJM55Z_DVgYuLBXMb=_V5nmYDCGnzty2TCJ5FLwNXHFRdaVi4Q@mail.gmail.com>
Subject: Re: [PATCH v7 8/9] riscv: dts: starfive: jh7110: Add DVP and HDMI TX
 pixel external clocks
To:     Xingyu Wu <xingyu.wu@starfivetech.com>
Cc:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Conor Dooley <conor@kernel.org>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Hal Feng <hal.feng@starfivetech.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 12 Jul 2023 at 11:22, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
>
> Add DVP and HDMI TX pixel external fixed clocks and the rates are
> 74.25MHz and 297MHz.
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  .../dts/starfive/jh7110-starfive-visionfive-2.dtsi   |  8 ++++++++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi             | 12 ++++++++++++
>  2 files changed, 20 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index fa0061eb33a7..de0f40a8be93 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -38,6 +38,10 @@ gpio-restart {
>         };
>  };
>
> +&dvp_clk {
> +       clock-frequency = <74250000>;
> +};
> +
>  &gmac0_rgmii_rxin {
>         clock-frequency = <125000000>;
>  };
> @@ -54,6 +58,10 @@ &gmac1_rmii_refin {
>         clock-frequency = <50000000>;
>  };
>
> +&hdmitx0_pixelclk {
> +       clock-frequency = <297000000>;
> +};
> +
>  &i2srx_bclk_ext {
>         clock-frequency = <12288000>;
>  };
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index ec2e70011a73..e9c1e4ad71a2 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -197,6 +197,12 @@ opp-1500000000 {
>                         };
>         };
>
> +       dvp_clk: dvp-clock {
> +               compatible = "fixed-clock";
> +               clock-output-names = "dvp_clk";
> +               #clock-cells = <0>;
> +       };
> +
>         gmac0_rgmii_rxin: gmac0-rgmii-rxin-clock {
>                 compatible = "fixed-clock";
>                 clock-output-names = "gmac0_rgmii_rxin";
> @@ -221,6 +227,12 @@ gmac1_rmii_refin: gmac1-rmii-refin-clock {
>                 #clock-cells = <0>;
>         };
>
> +       hdmitx0_pixelclk: hdmitx0-pixel-clock {
> +               compatible = "fixed-clock";
> +               clock-output-names = "hdmitx0_pixelclk";
> +               #clock-cells = <0>;
> +       };
> +
>         i2srx_bclk_ext: i2srx-bclk-ext-clock {
>                 compatible = "fixed-clock";
>                 clock-output-names = "i2srx_bclk_ext";
> --
> 2.25.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
