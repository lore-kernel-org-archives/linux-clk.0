Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:48847 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752681AbcDARGE (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Fri, 1 Apr 2016 13:06:04 -0400
Date: Fri, 1 Apr 2016 12:05:55 -0500
From: Rob Herring <robh@kernel.org>
To: Jean-Francois Moine <moinejf@free.fr>
Cc: Emilio Lopez <emilio@elopez.com.ar>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] clk: sunxi: Add sun6i/8i display support
Message-ID: <20160401170555.GA2962@rob-hp-laptop>
References: <cover.1459358017.git.moinejf@free.fr>
 <2b347763e38cfeeb7a2d6af6357eaea6c4ec07ac.1459358017.git.moinejf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <2b347763e38cfeeb7a2d6af6357eaea6c4ec07ac.1459358017.git.moinejf@free.fr>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, Mar 30, 2016 at 06:43:29PM +0200, Jean-Francois Moine wrote:
> Add the clock type which is used by the sun6i/8i families for video display.
> 
> Signed-off-by: Jean-Francois Moine <moinejf@free.fr>
> ---
>  Documentation/devicetree/bindings/clock/sunxi.txt |  1 +

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/clk/sunxi/clk-sunxi.c                     | 38 +++++++++++++++++++++++
>  2 files changed, 39 insertions(+)
