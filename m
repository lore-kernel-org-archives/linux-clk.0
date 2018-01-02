Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hermes.aosc.io ([199.195.250.187]:36321 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750736AbeABIOw (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 2 Jan 2018 03:14:52 -0500
From: Icenowy Zheng <icenowy@aosc.io>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Subject: Re: [linux-sunxi] [PATCH v4 1/6] ARM: sunxi: h3/h5: add simplefb nodes
Date: Tue, 02 Jan 2018 16:14:37 +0800
Message-ID: <2823749.lCJ0TQNemj@ice-x220i>
In-Reply-To: <CAGb2v64V7KYw5W95-E=b=Li13ZFXy7JakK4+Dx1dsrXXSJZ+wg@mail.gmail.com>
References: <20171230113043.30237-1-icenowy@aosc.io> <20171230113043.30237-2-icenowy@aosc.io> <CAGb2v64V7KYw5W95-E=b=Li13ZFXy7JakK4+Dx1dsrXXSJZ+wg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

在 2018年1月2日星期二 CST 下午4:11:04，Chen-Yu Tsai 写道：
> On Sat, Dec 30, 2017 at 7:30 PM, Icenowy Zheng <icenowy@aosc.io> wrote:
> > The H3/H5 SoCs have a HDMI output and a TV Composite output.
> > 
> > Add simplefb nodes for these outputs.
> > 
> > Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> > ---
> > Changes in v4:
> > - Dropped extra clocks (bus clocks and HDMI DDC clocks), only keep the
> > 
> >   clocks that are needed to display framebuffer to the monitor.
> 
> Looks good. I assume you've tested this? It does continue to work
> with the bus and DDC clocks disabled, right?

Yes. This patchset is tested in Orange Pi PC and SoPine w/ Baseboard "Model 
A".

> 
> Thanks
> ChenYu


