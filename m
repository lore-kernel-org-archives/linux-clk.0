Return-Path: <sboyd@codeaurora.org>
Date: Tue, 19 May 2015 18:41:33 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Ricky Liang <jcliang@chromium.org>
Cc: Mike Turquette <mturquette@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Henry Chen <henryc.chen@mediatek.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	James Liao <jamesjj.liao@mediatek.com>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC..." <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v3] clk: mediatek: Initialize clk_init_data
Message-ID: <20150520014133.GE31054@codeaurora.org>
References: <1431957632-2182-1-git-send-email-jcliang@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1431957632-2182-1-git-send-email-jcliang@chromium.org>
List-ID: <linux-clk.vger.kernel.org>

On 05/18, Ricky Liang wrote:
> The variable init (struct clk_init_data) is allocated on the stack.
> We weren't initializing the .flags field, so it contains random junk,
> which can cause all kinds of interesting issues when the flags are
> parsed by clk_register.
> 
> Signed-off-by: Ricky Liang <jcliang@chromium.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
