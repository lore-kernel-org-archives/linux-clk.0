Return-Path: <sboyd@codeaurora.org>
Date: Wed, 11 May 2016 15:13:45 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>,
	David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
	Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
	Hans de Goede <hdegoede@redhat.com>, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
	dri-devel@lists.freedesktop.org,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Alexander Kaplan <alex@nextthing.co>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v4 01/11] clk: sunxi: Add display and TCON0 clocks driver
Message-ID: <20160511221345.GF3492@codeaurora.org>
References: <1461590572-4027-1-git-send-email-maxime.ripard@free-electrons.com>
 <1461590572-4027-2-git-send-email-maxime.ripard@free-electrons.com>
 <20160506223002.GE3492@codeaurora.org>
 <20160508200308.GF6167@lukather>
 <20160509223238.GW3492@codeaurora.org>
 <20160509223924.GX3492@codeaurora.org>
 <20160510063618.GI3733@lukather>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160510063618.GI3733@lukather>
List-ID: <linux-clk.vger.kernel.org>

On 05/10, Maxime Ripard wrote:
> Hi Stephen,
> 
> On Mon, May 09, 2016 at 03:39:24PM -0700, Stephen Boyd wrote:
> > On 05/09, Stephen Boyd wrote:
> > > 
> > > Ok I applied this one to clk-next.
> > > 
> > 
> > And I squashed this in to silence the following checker warning.
> > 
> > drivers/clk/sunxi/clk-sun4i-display.c:110:33: warning: Variable
> > length array is used.
> 
> Thanks, just out of curiosity, which checker are you talking about?
> sparse?
> 

I use sparse and smatch. I can't recall which one is complaining
here and technically smatch uses sparse underneath.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
