Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD4D8C433DB
	for <linux-clk@archiver.kernel.org>; Mon, 28 Dec 2020 12:04:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B1BD207B0
	for <linux-clk@archiver.kernel.org>; Mon, 28 Dec 2020 12:04:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727489AbgL1MEs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Dec 2020 07:04:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727452AbgL1MEr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Dec 2020 07:04:47 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43322C061798
        for <linux-clk@vger.kernel.org>; Mon, 28 Dec 2020 04:04:07 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id 23so23330712lfg.10
        for <linux-clk@vger.kernel.org>; Mon, 28 Dec 2020 04:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZjuT0G8Deh5asm7sfYMBjjSxHyD941dcHmbaN6rf58s=;
        b=N1BqInflZaVkvS7OFqtKtFNbJwXS2drGzzeilgbCkGVgaiLQmFNXnkD3V63iRuyHKz
         udNkBwZ36/VzHCTQyP5bca9C20HcAso3QK8/CgxbDfL9OgeajAJUeSjw2nfvsjeNC2nK
         MpWHHj0Ja2brGRTMNCGa+srTnvBBf7TjyqD+CG+8WP38Ii9f2Ww72QkibJAOmqsDkcug
         0uj7e0+zoKOdP6t7uYVhJCFNvM7mYGIFyqwUi5GV0xzpTU8WT7Q2IXfwrXzGjuuQAb0T
         8MDzKyjIDVpeLaC5XGDwD1NQrPeq+RcpUnitfgupN5enVgEkOZNiowEEYOGnkRqVzfPg
         og9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZjuT0G8Deh5asm7sfYMBjjSxHyD941dcHmbaN6rf58s=;
        b=TdvHZi2c9vDv02+Lxh74K5RVFBzK3kS1VmCUETEx3ji33YNYK0ZCy7vsmDOHC43YP/
         TZaGvb1Qoofv8GqkgMoryL/Wn9A62n0zC/LOmlIhn1P/XNaf0xXiYrqPHWmSU+9Pk4Sk
         SwOM+/ZTsG5MfIXcJ5WM576WTYOt169B5sr/EzOdpQXl0O33lKmcTMXUOdwW8g/GVSqQ
         Ukco+kd+0LbBLnPvudBznR7zpZZe5H8M4TBcKt+CsCMBGGLl0y9EjRn0QkI29BEEndCD
         xCaukhOuc+v2LQ+p19jl1OVibUvzM0fZ+vaW8BOF8irjEj6zp6Q7+Mhi2pjyXFlqWp9K
         5MNA==
X-Gm-Message-State: AOAM531CeSpXiXnRCXBcpXP95uRepIX5hXOp/R6Tk2hDx+aOuJ8+18ux
        AFZ1ao+VLCVSDkXASJsh3yA7sXR0Gv9UiKbJ7Yi2qQ==
X-Google-Smtp-Source: ABdhPJwYYejAn6DdechGz0yOHYEnzIsJPixk6roStHOZHb1jzFU8Cj9/i9DfQ/AmCZ4lIUR/9bTbJuRcfbZzNPP4pyU=
X-Received: by 2002:a05:651c:22b:: with SMTP id z11mr21023290ljn.38.1609157045775;
 Mon, 28 Dec 2020 04:04:05 -0800 (PST)
MIME-Version: 1.0
References: <20201213135056.24446-1-damien.lemoal@wdc.com> <20201213135056.24446-7-damien.lemoal@wdc.com>
In-Reply-To: <20201213135056.24446-7-damien.lemoal@wdc.com>
From:   Anup Patel <anup@brainfault.org>
Date:   Mon, 28 Dec 2020 17:33:52 +0530
Message-ID: <CAAhSdy1Hud+6m6Pqrj9808G4+j54Y0KK66b2cX=dFBWoJ31X1Q@mail.gmail.com>
Subject: Re: [PATCH v10 06/23] riscv: Fix Canaan Kendryte K210 device tree
To:     Damien Le Moal <damien.lemoal@wdc.com>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
        Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, Dec 13, 2020 at 7:21 PM Damien Le Moal <damien.lemoal@wdc.com> wrote:
>
> Remove the clocks property from the cpu and clint nodes as these are
> ignored. Also remove the clock-frequency property from the cpu nodes as
> riscv relies on the timebase-frequency property.
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  arch/riscv/boot/dts/canaan/k210.dtsi | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
> index d2d0ff645632..354b263195a3 100644
> --- a/arch/riscv/boot/dts/canaan/k210.dtsi
> +++ b/arch/riscv/boot/dts/canaan/k210.dtsi
> @@ -38,8 +38,6 @@ cpu0: cpu@0 {
>                         i-cache-block-size = <64>;
>                         d-cache-size = <0x8000>;
>                         d-cache-block-size = <64>;
> -                       clocks = <&sysctl K210_CLK_CPU>;
> -                       clock-frequency = <390000000>;
>                         cpu0_intc: interrupt-controller {
>                                 #interrupt-cells = <1>;
>                                 interrupt-controller;
> @@ -56,8 +54,6 @@ cpu1: cpu@1 {
>                         i-cache-block-size = <64>;
>                         d-cache-size = <0x8000>;
>                         d-cache-block-size = <64>;
> -                       clocks = <&sysctl K210_CLK_CPU>;
> -                       clock-frequency = <390000000>;
>                         cpu1_intc: interrupt-controller {
>                                 #interrupt-cells = <1>;
>                                 interrupt-controller;
> @@ -101,7 +97,6 @@ clint0: clint@2000000 {
>                         reg = <0x2000000 0xC000>;
>                         interrupts-extended =  <&cpu0_intc 3 &cpu0_intc 7
>                                                 &cpu1_intc 3 &cpu1_intc 7>;
> -                       clocks = <&sysctl K210_CLK_ACLK>;
>                 };
>
>                 plic0: interrupt-controller@c000000 {
> --
> 2.29.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup
