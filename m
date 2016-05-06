Return-Path: <sboyd@codeaurora.org>
Date: Fri, 6 May 2016 15:30:02 -0700
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
Message-ID: <20160506223002.GE3492@codeaurora.org>
References: <1461590572-4027-1-git-send-email-maxime.ripard@free-electrons.com>
 <1461590572-4027-2-git-send-email-maxime.ripard@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1461590572-4027-2-git-send-email-maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 04/25, Maxime Ripard wrote:
> The A10 SoCs and its relatives has a special clock controller to drive the
> display engines (both frontend and backend), that have a lot in common with
> the clock to drive the first TCON channel.
> 
> Add a driver to support both.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

Unless I can merge this into clk-next? Wasn't clear to me.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
