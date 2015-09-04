Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-la0-f54.google.com ([209.85.215.54]:34674 "EHLO
	mail-la0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752295AbbIDQbV (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 4 Sep 2015 12:31:21 -0400
Received: by laeb10 with SMTP id b10so17256865lae.1
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2015 09:31:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1441349872-4560-2-git-send-email-bhupesh.sharma@freescale.com>
References: <1441349872-4560-1-git-send-email-bhupesh.sharma@freescale.com>
	<1441349872-4560-2-git-send-email-bhupesh.sharma@freescale.com>
Date: Fri, 4 Sep 2015 11:31:19 -0500
Message-ID: <CADRPPNQbTPrJ47SKsA=EaPi7xo8+0hQqEpt3wDPKMbL1vTOr9A@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] arm64: Use generic Layerscape SoC family naming
 & rename LS2085A to LS2080A
From: Li Yang <leoli@freescale.com>
To: Bhupesh Sharma <bhupesh.sharma@freescale.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, marc.zyngier@arm.com,
	linux-clk@vger.kernel.org, Catalin.Marinas@arm.com,
	bhupesh.linux@gmail.com, will.deacon@arm.com, olof@lixom.net
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, Sep 4, 2015 at 1:57 AM, Bhupesh Sharma
<bhupesh.sharma@freescale.com> wrote:
> Freescale will be a churning out a host of ARMv8 based SoCs which
> will be based on a similar overall SoC architecture. So, this patch
> converts the existing infrastructure in the arm64/dts, arm64/Kconfig
> and arm64/configs to use the generic convention ARCH_LAYERSCAPE
> in place of the more specific FSL_LS2085A, to save code duplication
> later-on.
>
> Also Freescale is renaming LS2085A to LS2080A.
>
> This patch addresses the above two points.
>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@freescale.com>
> ---
{snip}
> --- a/arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
> @@ -1,7 +1,7 @@
>  /*
> - * Device Tree Include file for Freescale Layerscape-2085A family SoC.
> + * Device Tree Include file for Freescale Layerscape-2080A family SoC.
>   *
> - * Copyright (C) 2014, Freescale Semiconductor
> + * Copyright (C) 2014-15, Freescale Semiconductor

Normally we spell out the whole 2015.  The preferred copyright template is:

Copyright 2014-2015 Freescale Semiconductor, Inc.

- Leo
