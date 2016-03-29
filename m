Return-Path: <sboyd@codeaurora.org>
Date: Tue, 29 Mar 2016 16:31:20 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Matthew McClintock <mmcclint@codeaurora.org>
Cc: andy.gross@linaro.org, linux-arm-msm@vger.kernel.org,
	qca-upstream.external@qca.qualcomm.com,
	Michael Turquette <mturquette@baylibre.com>,
	Pradeep Banavathi <pradeepb@codeaurora.org>,
	Senthilkumar N L <snlakshm@codeaurora.org>,
	Varadarajan Narayanan <varada@codeaurora.org>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 05/17] clk: qcom: ipq4019: add some fixed clocks for
 ddrppl and fepll
Message-ID: <20160329233120.GQ18567@codeaurora.org>
References: <1458770712-10880-1-git-send-email-mmcclint@codeaurora.org>
 <1458770712-10880-6-git-send-email-mmcclint@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1458770712-10880-6-git-send-email-mmcclint@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 03/23, Matthew McClintock wrote:
> Drivers for these don't exist yet so we will add them as fixed clocks
> so we don't BUG() if we change clocks that reference these clocks.
> 
> Signed-off-by: Matthew McClintock <mmcclint@codeaurora.org>
> ---

Applied to clk-fixes

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
