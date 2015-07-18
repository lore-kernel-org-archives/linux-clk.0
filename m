Return-Path: <sboyd@codeaurora.org>
Date: Fri, 17 Jul 2015 17:52:47 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: dinguyen@opensource.altera.com
Cc: mturquette@linaro.org, dinh.linux@gmail.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCHv2 4/6] clk: st: make use of of_clk_parent_fill helper
 function
Message-ID: <20150718005246.GC30412@codeaurora.org>
References: <1436241546-16731-1-git-send-email-dinguyen@opensource.altera.com>
 <1436241546-16731-5-git-send-email-dinguyen@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1436241546-16731-5-git-send-email-dinguyen@opensource.altera.com>
List-ID: <linux-clk.vger.kernel.org>

On 07/06, dinguyen@opensource.altera.com wrote:
> From: Dinh Nguyen <dinguyen@opensource.altera.com>
> 
> Use of_clk_parent_fill to fill in the parent clock names' array.
> 
> Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
> Tested-by Gabriel Fernandez <gabriel.fernandez@st.com>
> Cc: Peter Griffin <peter.griffin@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
