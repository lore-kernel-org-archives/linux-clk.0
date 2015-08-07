Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Fri, 7 Aug 2015 16:55:15 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH v2] clk: pxa: pxa3xx: fix CKEN register access
Message-ID: <20150807235515.GF16477@codeaurora.org>
References: <1438669293-6033-1-git-send-email-robert.jarzmik@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1438669293-6033-1-git-send-email-robert.jarzmik@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 08/04, Robert Jarzmik wrote:
> Clocks 0 to 31 are on CKENA, and not CKENB. The clock register names
> were inadequately inverted. As a consequence, all clock operations were
> happening on CKENB, because almost all but 2 clocks are on CKENA.
> 
> As the clocks were activated by the bootloader in the former tests, it
> escaped the testing that the wrong clock gate was manipulated. The error
> was revealed by changing the pxa3xx-and driver to a module, where tupon
> unloading the wrong clock was disabled in CKENB.
> 
> Fixes: 9bbb8a338fb2 ("clk: pxa: add pxa3xx clock driver")
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> ---

Applied to clk-fixes. Sorry, got busy last few days.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
