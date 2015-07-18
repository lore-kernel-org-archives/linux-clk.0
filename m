Return-Path: <sboyd@codeaurora.org>
Date: Fri, 17 Jul 2015 17:53:13 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: dinguyen@opensource.altera.com
Cc: mturquette@linaro.org, dinh.linux@gmail.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>
Subject: Re: [PATCHv2 5/6] clk: sunxi: make use of of_clk_parent_fill helper
 function
Message-ID: <20150718005313.GE30412@codeaurora.org>
References: <1436241546-16731-1-git-send-email-dinguyen@opensource.altera.com>
 <1436241546-16731-6-git-send-email-dinguyen@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <1436241546-16731-6-git-send-email-dinguyen@opensource.altera.com>
List-ID: <linux-clk.vger.kernel.org>

On 07/06, dinguyen@opensource.altera.com wrote:
> From: Dinh Nguyen <dinguyen@opensource.altera.com>
> 
> Use of_clk_parent_fill to fill in the parent clock names' array.
> 
> Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: "Emilio López" <emilio@elopez.com.ar>
> ---

Applied to clk-next with that fix I posted.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
