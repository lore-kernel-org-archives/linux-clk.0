Return-Path: <sboyd@codeaurora.org>
Date: Thu, 30 Apr 2015 16:20:02 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: mturquette@linaro.org, dianders@chromium.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Alex Elder <elder@linaro.org>,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Max Filippov <jcmvbkbc@gmail.com>, kernel@pengutronix.de,
	Zhangfei Gao <zhangfei.gao@linaro.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Chao Xie <chao.xie@marvell.com>,
	Jason Cooper <jason@lakedaemon.net>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Andrew Bresticker <abrestic@chromium.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Georgi Djakov <georgi.djakov@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Barry Song <baohua@kernel.org>,
	Dinh Nguyen <dinguyen@opensource.altera.com>,
	Viresh Kumar <viresh.linux@gmail.com>,
	Gabriel FERNANDEZ <gabriel.fernandez@st.com>, emilio@elopez.com.ar,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Tero Kristo <t-kristo@ti.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	Pawel Moll <pawel.moll@arm.com>,
	Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v3 1/2] clk: track the orphan status of clocks and their
 children
Message-ID: <20150430232002.GA32407@codeaurora.org>
References: <1429735986-18592-1-git-send-email-heiko@sntech.de>
 <1429735986-18592-2-git-send-email-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1429735986-18592-2-git-send-email-heiko@sntech.de>
List-ID: <linux-clk.vger.kernel.org>

On 04/22, Heiko Stuebner wrote:
> @@ -1401,18 +1402,40 @@ static int clk_fetch_parent_index(struct clk_core *clk,
>  	return -EINVAL;
>  }
>  
> +/*
> + * Update the orphan status of @clk and all its children.
> + */
> +static void clk_core_update_orphan_status(struct clk_core *clk, bool is_orphan)

Missed s/clk/core/ here. I did it, no need to resend.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
