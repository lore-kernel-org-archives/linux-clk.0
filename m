Return-Path: <sboyd@codeaurora.org>
Date: Thu, 26 Jan 2017 16:14:41 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: John Crispin <john@phrozen.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Erin Lo <erin.lo@mediatek.com>,
	James Liao <jamesjj.liao@mediatek.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/2] clk: mediatek: add missing ethernet reset definition
Message-ID: <20170127001441.GS8801@codeaurora.org>
References: <1485175707-58528-1-git-send-email-john@phrozen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1485175707-58528-1-git-send-email-john@phrozen.org>
List-ID: <linux-clk.vger.kernel.org>

On 01/23, John Crispin wrote:
> When the clk code for mt2701 was merged, we forgot to add the reset
> controller of the ethernet subsystem. This series adds the missing code
> and header files required to reference the bits from within a devicetree
> file.
> 
> John Crispin (2):
>   clk: mediatek: add mt2701 ethernet reset
>   reset: mediatek: Add MT2701 ethsys reset controller include file
> 
>  drivers/clk/mediatek/clk-mt2701-eth.c     |    2 ++
>  include/dt-bindings/reset/mt2701-resets.h |    7 +++++++

Any planned DT users in the next merge window? Should I put this
into a topic branch? Do you want a clk maintainer ack? At the
least we need someone like James to ack this first.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
