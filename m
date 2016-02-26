Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from muru.com ([72.249.23.125]:47370 "EHLO muru.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754096AbcBZTRY (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Fri, 26 Feb 2016 14:17:24 -0500
Date: Fri, 26 Feb 2016 11:17:21 -0800
From: Tony Lindgren <tony@atomide.com>
To: Franklin S Cooper Jr <fcooper@ti.com>
Cc: paul@pwsan.com, t-kristo@ti.com, vigneshr@ti.com,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 4/5] clk: ti: DRA7: Add tbclk data for ehrpwm
Message-ID: <20160226191720.GI13417@atomide.com>
References: <1456439796-28546-1-git-send-email-fcooper@ti.com>
 <1456439796-28546-5-git-send-email-fcooper@ti.com>
 <20160226191559.GH13417@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160226191559.GH13417@atomide.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

* Tony Lindgren <tony@atomide.com> [160226 11:16]:
> * Franklin S Cooper Jr <fcooper@ti.com> [160225 14:37]:
> > From: Vignesh R <vigneshr@ti.com>
> > 
> > tbclk is needed by ehrpwm to generate pwm waveforms. Hence, register
> > the required clock information.
> > 
> > Signed-off-by: Vignesh R <vigneshr@ti.com>
> > Acked-by: Michael Turquette <mturquette@baylibre.com>
> 
> This should be sent to Tero.

Sorry I mean Tero should queue this one as he is already on Cc.

Regards,

Tony
