Return-Path: <sboyd@codeaurora.org>
Date: Mon, 24 Aug 2015 14:28:28 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] clk: Add missing header for 'bool' definition to
 clk-conf.h
Message-ID: <20150824212828.GD14330@codeaurora.org>
References: <1439882205-10978-1-git-send-email-wens@csie.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1439882205-10978-1-git-send-email-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

On 08/18, Chen-Yu Tsai wrote:
> of_clk_set_defaults uses the type 'bool', but clk-conf.h does not
> include its definition.
> 
> This results in a compile error when only clk-conf.h is used.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> Cc: stable@vger.kernel.org

Why is stable Cc-ed? Is there some sort of compilation failure on
stable kernels?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
