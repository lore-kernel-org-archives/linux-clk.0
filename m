Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.csie.ntu.edu.tw ([140.112.30.61]:48640 "EHLO
        smtp.csie.ntu.edu.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751274AbeABIL3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 2 Jan 2018 03:11:29 -0500
MIME-Version: 1.0
In-Reply-To: <20171230113043.30237-2-icenowy@aosc.io>
References: <20171230113043.30237-1-icenowy@aosc.io> <20171230113043.30237-2-icenowy@aosc.io>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 2 Jan 2018 16:11:04 +0800
Message-ID: <CAGb2v64V7KYw5W95-E=b=Li13ZFXy7JakK4+Dx1dsrXXSJZ+wg@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH v4 1/6] ARM: sunxi: h3/h5: add simplefb nodes
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Sat, Dec 30, 2017 at 7:30 PM, Icenowy Zheng <icenowy@aosc.io> wrote:
> The H3/H5 SoCs have a HDMI output and a TV Composite output.
>
> Add simplefb nodes for these outputs.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> Changes in v4:
> - Dropped extra clocks (bus clocks and HDMI DDC clocks), only keep the
>   clocks that are needed to display framebuffer to the monitor.

Looks good. I assume you've tested this? It does continue to work
with the bus and DDC clocks disabled, right?

Thanks
ChenYu
