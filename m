Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D4BC432BE
	for <linux-clk@archiver.kernel.org>; Tue, 24 Aug 2021 09:51:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A786660E52
	for <linux-clk@archiver.kernel.org>; Tue, 24 Aug 2021 09:51:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235803AbhHXJw2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 24 Aug 2021 05:52:28 -0400
Received: from mail-ua1-f54.google.com ([209.85.222.54]:38805 "EHLO
        mail-ua1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235658AbhHXJw2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 24 Aug 2021 05:52:28 -0400
Received: by mail-ua1-f54.google.com with SMTP id 90so10624130uax.5;
        Tue, 24 Aug 2021 02:51:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aPMkc5tkrrP7KSGuGhzhgFxgFiDjCPdAxtqc5KXrigw=;
        b=gZPoUvW+yWg2W/rJIn2aGK9cgxRZvKRVSrkVdR3gR8v9UHMBKkPo8mZ9T0138MAbVE
         fwrUafb7933yva/7/xUKVkjc4Kx/RHZK76brdvMRzEyPc6b9hRT9xE8zvxR7/vy+sQmz
         /WM2QySspjCazeejQyVy61HCSzPH7xSrJgwEouN5uziig3+bLhKZhYB6VFcHTPqpMCno
         XlEDLPaXtcwWYgg/YUDgaOfnfuky7w3uwIJ5f/ELuZcbshksjBV3MTOkaKUWeeyYVNUv
         ryETPttrnaXrm++5OKexfiezD+07m2fhu0enn1d+cHw2+U4jmJIREySGHj8QBXa/pnUi
         5H5g==
X-Gm-Message-State: AOAM532LjRbIkU36xWP6VKUK/16XdiczkS3ly16Pn72i2AyjAvhzpwIj
        4mBH4qgB3ZGbKqBhbg98+a/eAE99eN5063Rum7o=
X-Google-Smtp-Source: ABdhPJyvTEDivJEYMu7XfKx/XQwcqMgLgi4M7Ikex8hqMaeOHRbq9363DenW2+hH2IWWP/1Z6g70/RPGNNduhIYdzfU=
X-Received: by 2002:a67:ce90:: with SMTP id c16mr5472147vse.7.1629798704259;
 Tue, 24 Aug 2021 02:51:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210810072533.27620-1-shubhrajyoti.datta@xilinx.com> <20210810072533.27620-3-shubhrajyoti.datta@xilinx.com>
In-Reply-To: <20210810072533.27620-3-shubhrajyoti.datta@xilinx.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 24 Aug 2021 11:51:33 +0200
Message-ID: <CAMuHMdU=td=e-tv7ohNQe_VDHB8d6+UUUnj2=nv3DFb6atEn2w@mail.gmail.com>
Subject: Re: [PATCH v12 2/5] clk: clocking-wizard: Add the clockwizard to clk directory
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>, git@xilinx.com,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, shubhrajyoti.datta@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Shubhrajyoti,

Thanks for your patch!

On Tue, Aug 10, 2021 at 10:37 AM Shubhrajyoti Datta
<shubhrajyoti.datta@xilinx.com> wrote:
> Add clocking wizard driver to clk.
> And delete the driver from the staging as it is in drivers/clk.

The old driver is not deleted from staging?

>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
>
>  drivers/clk/Kconfig                 |   9 +
>  drivers/clk/Makefile                |   1 +
>  drivers/clk/clk-xlnx-clock-wizard.c | 635 ++++++++++++++++++++++++++++
>  3 files changed, 645 insertions(+)
>  create mode 100644 drivers/clk/clk-xlnx-clock-wizard.c
>
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index e873f9ea2e65..22817be89bd8 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -390,6 +390,15 @@ config COMMON_CLK_K210
>         help
>           Support for the Canaan Kendryte K210 RISC-V SoC clocks.
>
> +config COMMON_CLK_XLNX_CLKWZRD
> +       tristate "Xilinx Clocking Wizard"
> +       depends on COMMON_CLK && OF

Should there be a platform dependency ("depends on <FOO> ||
COMPILE_TEST"), to avoid asking the user about this driver when
configuring a kernel for a platform that does not have this device,
or can this device be present on any platform?

Despite the original driver having been added 7 years ago, there are
no upstream users of "xlnx,clocking-wizard" yet...

> +       help
> +         Support for the Xilinx Clocking Wizard IP core clock generator.
> +         Adds support for clocking wizard and compatible.
> +         This driver supports the Xilinx clocking wizard programmable clock
> +         synthesizer. The number of output is configurable in the design.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
