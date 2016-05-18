Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:45237 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751386AbcERXbq (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Wed, 18 May 2016 19:31:46 -0400
Date: Wed, 18 May 2016 18:31:41 -0500
From: Rob Herring <robh@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, tony@atomide.com,
	lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
	t-kristo@ti.com, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 14/14] ASoC: omap-mcpdm: Add support for pdmclk clock
 handling
Message-ID: <20160518233141.GA10395@rob-hp-laptop>
References: <1463579196-5484-1-git-send-email-peter.ujfalusi@ti.com>
 <1463579196-5484-15-git-send-email-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1463579196-5484-15-git-send-email-peter.ujfalusi@ti.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, May 18, 2016 at 04:46:36PM +0300, Peter Ujfalusi wrote:
> McPDM module receives it's functional clock from external source. This
> clock is the pdmclk provided by the twl6040 audio IC. If the clock is not
> available all register accesses to McPDM fails and the module is not
> operational.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
>  Documentation/devicetree/bindings/sound/omap-mcpdm.txt | 10 ++++++++++
>  sound/soc/omap/omap-mcpdm.c                            | 17 +++++++++++++++++
>  2 files changed, 27 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
