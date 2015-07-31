Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-ID: <55BBC5CC.80406@codeaurora.org>
Date: Fri, 31 Jul 2015 12:00:28 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
MIME-Version: 1.0
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
CC: Nicolas Ferre <nicolas.ferre@atmel.com>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 23/23] clk: at91: Revert "keep slow clk enabled to prevent
 system hang"
References: <1438335599-3301-1-git-send-email-alexandre.belloni@free-electrons.com> <1438335599-3301-24-git-send-email-alexandre.belloni@free-electrons.com>
In-Reply-To: <1438335599-3301-24-git-send-email-alexandre.belloni@free-electrons.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 07/31/2015 02:39 AM, Alexandre Belloni wrote:
> -	clk_prepare_enable(slow_clk);
> -
> -	return 0;
> -}
> -arch_initcall(of_at91_clk_slow_retain);

Can you drop the include of clk.h in this file too?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

