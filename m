Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailoutvs3.siol.net ([213.250.19.136]:40708 "EHLO mail.siol.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752673AbeABIbM (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 2 Jan 2018 03:31:12 -0500
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: linux-sunxi@googlegroups.com, icenowy@aosc.io
Cc: Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [linux-sunxi] [PATCH v4 1/6] ARM: sunxi: h3/h5: add simplefb nodes
Date: Tue, 02 Jan 2018 09:31:05 +0100
Message-ID: <3000562.rVDEqMHngn@jernej-laptop>
In-Reply-To: <2823749.lCJ0TQNemj@ice-x220i>
References: <20171230113043.30237-1-icenowy@aosc.io> <CAGb2v64V7KYw5W95-E=b=Li13ZFXy7JakK4+Dx1dsrXXSJZ+wg@mail.gmail.com> <2823749.lCJ0TQNemj@ice-x220i>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi,

Dne torek, 02. januar 2018 ob 09:14:37 CET je Icenowy Zheng napisal(a):
> 在 2018年1月2日星期二 CST 下午4:11:04，Chen-Yu Tsai 写道：
> 
> > On Sat, Dec 30, 2017 at 7:30 PM, Icenowy Zheng <icenowy@aosc.io> wrote:
> > > The H3/H5 SoCs have a HDMI output and a TV Composite output.
> > > 
> > > Add simplefb nodes for these outputs.
> > > 
> > > Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> > > ---
> > > Changes in v4:
> > > - Dropped extra clocks (bus clocks and HDMI DDC clocks), only keep the
> > > 
> > >   clocks that are needed to display framebuffer to the monitor.
> > 
> > Looks good. I assume you've tested this? It does continue to work
> > with the bus and DDC clocks disabled, right?
> 
> Yes. This patchset is tested in Orange Pi PC and SoPine w/ Baseboard "Model
> A".

I think DDC clock is misnamed and according to DW HDMI binding should be named 
ISFR (clock for special function registers). I did few test tests when writing 
U-Boot driver and it has to be enabled all the time for driver to work 
correctly. I did few additional tests few days back - if only DDC clock is 
enabled and PLL video/HDMI clock disabled, DW HDMI registers are accessible.

I guess DDC clock in your case is not needed because controller is already 
configured correctly.

Best regards,
Jernej


