Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.csie.ntu.edu.tw ([140.112.30.61]:39944 "EHLO
        smtp.csie.ntu.edu.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751225AbdL0EKH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 26 Dec 2017 23:10:07 -0500
MIME-Version: 1.0
In-Reply-To: <20171222122243.25735-1-icenowy@aosc.io>
References: <20171222122243.25735-1-icenowy@aosc.io>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 27 Dec 2017 12:09:41 +0800
Message-ID: <CAGb2v653n_Q-spOSP9RTXBrL7CtrYiV7dAyRAVYCxg3KpzRvoQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/11] Allwinner H3/H5/A64(DE2) SimpleFB support
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, Dec 22, 2017 at 8:22 PM, Icenowy Zheng <icenowy@aosc.io> wrote:
> This patchset adds support for the SimpleFB on Allwinner SoCs with
> "Display Engine 2.0".
>
> PATCH 1 to PATCH 3 are DE2 CCU fixes for H3/H5 SoCs.
>
> PATCH 4 adds the pipeline strings for DE2 SimpleFB.
>
> PATCH 5 to 7 adds necessary device tree nodes (DE2 CCU and SimpleFB)
> for H3/H5 SoCs.
>
> PATCH 8 to 11 are for Allwinner A64 SoC to enable SimpleFB.

Changelog?

ChenYu

>
> Icenowy Zheng (11):
>   dt-bindings: fix the binding of Allwinner DE2 CCU of A83T and H3
>   clk: sunxi-ng: add support for Allwinner H3 DE2 CCU
>   clk: sunxi-ng: fix the A64/H5 clock description of DE2 CCU
>   dt-bindings: simplefb-sunxi: add pipelines for DE2
>   ARM: sun8i: h3/h5: add DE2 CCU device node for H3
>   arm64: allwinner: h5: add compatible string for DE2 CCU
>   ARM: sunxi: h3/h5: add simplefb nodes
>   dt-bindings: add binding for A64 DE2 CCU SRAM
>   clk: sunxi-ng: add support for Allwinner A64 DE2 CCU
>   arm64: allwinner: a64: add DE2 CCU for A64 SoC
>   arm64: allwinner: a64: add simplefb for A64 SoC
>
>  .../devicetree/bindings/clock/sun8i-de2.txt        | 10 ++-
>  .../bindings/display/simple-framebuffer-sunxi.txt  |  4 +
>  arch/arm/boot/dts/sun8i-h3.dtsi                    |  4 +
>  arch/arm/boot/dts/sunxi-h3-h5.dtsi                 | 43 +++++++++++
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      | 65 +++++++++++++++++
>  arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi       |  4 +
>  drivers/clk/sunxi-ng/ccu-sun8i-de2.c               | 85 +++++++++++++++++++---
>  7 files changed, 202 insertions(+), 13 deletions(-)
>
> --
> 2.14.2
>
