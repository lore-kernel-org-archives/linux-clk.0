Return-Path: <sboyd@codeaurora.org>
Date: Thu, 4 Jun 2015 15:50:33 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-kernel@vger.kernel.org,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Mike Turquette <mturquette@linaro.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] drivers/clk: convert sunxi/clk-mod0.c to use
 builtin_platform_driver
Message-ID: <20150604225033.GD8099@codeaurora.org>
References: <1431287385-1526-1-git-send-email-paul.gortmaker@windriver.com>
 <1433358578-9579-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <1433358578-9579-1-git-send-email-paul.gortmaker@windriver.com>
List-ID: <linux-clk.vger.kernel.org>

On 06/03, Paul Gortmaker wrote:
> This driver builds based on obj-y and hence will not ever be
> modular.  Change it to use the non-modular registration so that it
> won't suffer a compile fail once a header move places the modular
> registration within the module.h file.
> 
> Cc: "Emilio López" <emilio@elopez.com.ar>
> Cc: Mike Turquette <mturquette@linaro.org>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> ---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
