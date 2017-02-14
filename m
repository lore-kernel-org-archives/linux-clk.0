Return-Path: <sboyd@codeaurora.org>
Date: Tue, 14 Feb 2017 12:06:03 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] clk: qcom: Do not drop device node twice
Message-ID: <20170214200603.GX25384@codeaurora.org>
References: <1486854296-23156-1-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1486854296-23156-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-clk.vger.kernel.org>

On 02/11, Guenter Roeck wrote:
> of_find_node_by_name() drops the reference to a passed device node.
> It is not necessary to drop it again, and doing so may result in the
> device node being released prematurely.
> 
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
