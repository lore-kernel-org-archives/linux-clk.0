Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:42710 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750880AbeDNKZJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 14 Apr 2018 06:25:09 -0400
Received: by mail-io0-f194.google.com with SMTP id d5so12891847iob.9
        for <linux-clk@vger.kernel.org>; Sat, 14 Apr 2018 03:25:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180316175354.21437-4-icenowy@aosc.io>
References: <20180316175354.21437-1-icenowy@aosc.io> <20180316175354.21437-4-icenowy@aosc.io>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Sat, 14 Apr 2018 15:55:08 +0530
Message-ID: <CAMty3ZBOSXu=+jQpsdnykioDGsp=VphSnzQdDDs_hh3Y1FPKyg@mail.gmail.com>
Subject: Re: [PATCH 3/7] bus: add bus driver for accessing Allwinner A64 DE2
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, Mar 16, 2018 at 11:23 PM, Icenowy Zheng <icenowy@aosc.io> wrote:
> The "Display Engine 2.0" (usually called DE2) on the Allwinner A64 SoC
> is different from the ones on other Allwinner SoCs. It requires a SRAM
> region to be claimed, otherwise all DE2 subblocks won't be accessible.
>
> Add a bus driver for the Allwinner A64 DE2 part which claims the SRAM
> region when probing.

Along with this bus driver, we also need
drivers/gpu/drm/sun4i/sun4i_drv.c which can usually drive the
pipelines like mixer0 and 1 are the cases for A64?

Jagan.

-- 
Jagan Teki
Senior Linux Kernel Engineer | Amarula Solutions
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
