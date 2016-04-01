Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:49088 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753209AbcDARIv (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Fri, 1 Apr 2016 13:08:51 -0400
Date: Fri, 1 Apr 2016 12:08:47 -0500
From: Rob Herring <robh@kernel.org>
To: Jean-Francois Moine <moinejf@free.fr>
Cc: Emilio Lopez <emilio@elopez.com.ar>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] clk: sunxi: Add sun8i PLL audio support
Message-ID: <20160401170847.GA4480@rob-hp-laptop>
References: <cover.1459358017.git.moinejf@free.fr>
 <8ba2e0d78c70ea4c54fb25969956fc31674df612.1459358017.git.moinejf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <8ba2e0d78c70ea4c54fb25969956fc31674df612.1459358017.git.moinejf@free.fr>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, Mar 30, 2016 at 06:57:16PM +0200, Jean-Francois Moine wrote:
> Add the PLL type which is used by the sun8i family for audio.
> 
> Signed-off-by: Jean-Francois Moine <moinejf@free.fr>
> ---
>  Documentation/devicetree/bindings/clock/sunxi.txt |  1 +

Acked-by: Rob Herring <robh@kernel.org>

And the 1 by 1 sunxi clock bindings continue...

>  drivers/clk/sunxi/clk-sunxi.c                     | 48 +++++++++++++++++++++++
>  2 files changed, 49 insertions(+)
