Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D6CEB64DA
	for <linux-clk@archiver.kernel.org>; Wed, 12 Jul 2023 18:12:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232160AbjGLSMN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Jul 2023 14:12:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231827AbjGLSMI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Jul 2023 14:12:08 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FC6111B
        for <linux-clk@vger.kernel.org>; Wed, 12 Jul 2023 11:12:07 -0700 (PDT)
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 00C193F71D
        for <linux-clk@vger.kernel.org>; Wed, 12 Jul 2023 18:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1689185525;
        bh=IiTbBlj0ewF8G4BUt91YuXI1v1SQzafoivmnBlClh7o=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=B7pVUgR+S692n/mMLkIUpast/zcZXlDBi6TfcJfYRs4vIFw31XYsn4aJZP0rKmqTs
         /1jvWJZzP9PT8FH8SBwUHDJckUqyJsQtKxDPe0ZqlcZnk4dSCSqIPwcYIr6G4OoH+Z
         bM2p6sN509DbPAkePEV/i4gsSgLo3kiqlwumbpeydCCiEV+NMNOXBeQ7K+drJERK1w
         F+dUwuEaO6etRJ8l+jve74ngl+zwP6S8+e79jgCXm+3Gud9OAnAPyli/s4bPJuO2sQ
         2HS8/QbAxZ+4bX7EPHNUa9wVLCeiRDmJbN59/TRgncMUJvNTFefM1T0qjyivWArjuq
         ssLwBmJr5I1kQ==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-403ad9d7951so43987291cf.1
        for <linux-clk@vger.kernel.org>; Wed, 12 Jul 2023 11:12:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689185519; x=1691777519;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IiTbBlj0ewF8G4BUt91YuXI1v1SQzafoivmnBlClh7o=;
        b=Ww6vhn18obRzl5TFgTTbkp6pXaRdeMh41qpzNveU+QPqyJ0PLRaQ2pd9HLMfUUnhD5
         1/EHMwiM5E0E+ANJlrzyjUm7HXPWmJE0T5UNAHsGnDvkcsz4S40tY99bVLNVFo8Rl0uB
         MD1xQBd4802a18UyLlbBU7UOs/djZ6rjDNMoZM9iLtuLivEB6yxcZPsFEAqO6PVv8qS3
         iFp6LYrkFxbiCWYgJ0rnXW8Nry2dvjMFMRz9nApnAhk+IwjeoFOEVLAKkK189Zyd2EmQ
         IG3iq5IJ3bMRfuaCBAIcC9BUQjWevLyQfunlw9FfvrF8Ts6UtyfpnEap6NHZgOBu6/PR
         SEiA==
X-Gm-Message-State: ABy/qLbrH9B7AYImncrUtYTIQW2A+WWO2U8yXdxRRrjaIxuQs0h5sQJk
        0wLRn0869TMNLfKAyMxRo8QVNw6vqTiBnlTqXQ/qED6JpFWYy3bBzPrhLW+jKL8zR9+JUYJxw/N
        Z6T4xzhF2Q0OJvJv7k+cEgGSzdYGO/zIgUqgSqJ3Hzf3GFa6Vs2vDmQ==
X-Received: by 2002:a05:622a:607:b0:400:9896:b0fa with SMTP id z7-20020a05622a060700b004009896b0famr23054543qta.64.1689185519445;
        Wed, 12 Jul 2023 11:11:59 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF+yH6SEzFMjdi9+xn1WCS08DTxJsK51NR6l1TztLgLNuwI2JQDigR3T+OItHZ2i/n2iFxsrYmTXZ+OTvDP/m4=
X-Received: by 2002:a05:622a:607:b0:400:9896:b0fa with SMTP id
 z7-20020a05622a060700b004009896b0famr23054520qta.64.1689185519221; Wed, 12
 Jul 2023 11:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230712092007.31013-1-xingyu.wu@starfivetech.com> <20230712092007.31013-10-xingyu.wu@starfivetech.com>
In-Reply-To: <20230712092007.31013-10-xingyu.wu@starfivetech.com>
From:   Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date:   Wed, 12 Jul 2023 20:11:42 +0200
Message-ID: <CAJM55Z_1btuZ3ewLTMgxya8bwZ-HZRVRTHEwscmhv6DcAJFKfg@mail.gmail.com>
Subject: Re: [PATCH v7 9/9] riscv: dts: starfive: jh7110: Add
 STGCRG/ISPCRG/VOUTCRG nodes
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
> Add STGCRG/ISPCRG/VOUTCRG new node to support JH7110
> System-Top-Group, Image-Signal-Process and Video-Output
> clock and reset drivers for the JH7110 RISC-V SoC.
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 55 ++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index e9c1e4ad71a2..0005fa163a78 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -6,6 +6,7 @@
>
>  /dts-v1/;
>  #include <dt-bindings/clock/starfive,jh7110-crg.h>
> +#include <dt-bindings/power/starfive,jh7110-pmu.h>
>  #include <dt-bindings/reset/starfive,jh7110-crg.h>
>
>  / {
> @@ -398,6 +399,25 @@ i2c2: i2c@10050000 {
>                         status = "disabled";
>                 };
>
> +               stgcrg: clock-controller@10230000 {
> +                       compatible = "starfive,jh7110-stgcrg";
> +                       reg = <0x0 0x10230000 0x0 0x10000>;
> +                       clocks = <&osc>,
> +                                <&syscrg JH7110_SYSCLK_HIFI4_CORE>,
> +                                <&syscrg JH7110_SYSCLK_STG_AXIAHB>,
> +                                <&syscrg JH7110_SYSCLK_USB_125M>,
> +                                <&syscrg JH7110_SYSCLK_CPU_BUS>,
> +                                <&syscrg JH7110_SYSCLK_HIFI4_AXI>,
> +                                <&syscrg JH7110_SYSCLK_NOCSTG_BUS>,
> +                                <&syscrg JH7110_SYSCLK_APB_BUS>;
> +                       clock-names = "osc", "hifi4_core",
> +                                     "stg_axiahb", "usb_125m",
> +                                     "cpu_bus", "hifi4_axi",
> +                                     "nocstg_bus", "apb_bus";
> +                       #clock-cells = <1>;
> +                       #reset-cells = <1>;
> +               };
> +
>                 uart3: serial@12000000 {
>                         compatible = "snps,dw-apb-uart";
>                         reg = <0x0 0x12000000 0x0 0x10000>;
> @@ -558,5 +578,40 @@ pwrc: power-controller@17030000 {
>                         interrupts = <111>;
>                         #power-domain-cells = <1>;
>                 };
> +
> +               ispcrg: clock-controller@19810000 {
> +                       compatible = "starfive,jh7110-ispcrg";
> +                       reg = <0x0 0x19810000 0x0 0x10000>;
> +                       clocks = <&syscrg JH7110_SYSCLK_ISP_TOP_CORE>,
> +                                <&syscrg JH7110_SYSCLK_ISP_TOP_AXI>,
> +                                <&syscrg JH7110_SYSCLK_NOC_BUS_ISP_AXI>,
> +                                <&dvp_clk>;
> +                       clock-names = "isp_top_core", "isp_top_axi",
> +                                     "noc_bus_isp_axi", "dvp_clk";
> +                       resets = <&syscrg JH7110_SYSRST_ISP_TOP>,
> +                                <&syscrg JH7110_SYSRST_ISP_TOP_AXI>,
> +                                <&syscrg JH7110_SYSRST_NOC_BUS_ISP_AXI>;
> +                       #clock-cells = <1>;
> +                       #reset-cells = <1>;
> +                       power-domains = <&pwrc JH7110_PD_ISP>;
> +               };
> +
> +               voutcrg: clock-controller@295c0000 {
> +                       compatible = "starfive,jh7110-voutcrg";
> +                       reg = <0x0 0x295c0000 0x0 0x10000>;
> +                       clocks = <&syscrg JH7110_SYSCLK_VOUT_SRC>,
> +                                <&syscrg JH7110_SYSCLK_VOUT_TOP_AHB>,
> +                                <&syscrg JH7110_SYSCLK_VOUT_TOP_AXI>,
> +                                <&syscrg JH7110_SYSCLK_VOUT_TOP_HDMITX0_MCLK>,
> +                                <&syscrg JH7110_SYSCLK_I2STX0_BCLK>,
> +                                <&hdmitx0_pixelclk>;
> +                       clock-names = "vout_src", "vout_top_ahb",
> +                                     "vout_top_axi", "vout_top_hdmitx0_mclk",
> +                                     "i2stx0_bclk", "hdmitx0_pixelclk";
> +                       resets = <&syscrg JH7110_SYSRST_VOUT_TOP_SRC>;
> +                       #clock-cells = <1>;
> +                       #reset-cells = <1>;
> +                       power-domains = <&pwrc JH7110_PD_VOUT>;
> +               };
>         };
>  };
> --
> 2.25.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
