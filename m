Return-Path: <sboyd@codeaurora.org>
Date: Wed, 1 Nov 2017 23:46:01 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Amit Nischal <anischal@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Rajendra Nayak <rnayak@codeaurora.org>,
	Odelu Kukatla <okukatla@codeaurora.org>,
	linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: Modify RCG shared ops to support freq_tbl
 without XO entry
Message-ID: <20171102064601.GE30645@codeaurora.org>
References: <1509434380-24372-1-git-send-email-anischal@codeaurora.org>
 <1509434380-24372-3-git-send-email-anischal@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1509434380-24372-3-git-send-email-anischal@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 10/31, Amit Nischal wrote:
> There could be some clock sources where there is no entry corresponding
> XO in their frequency table, for such sources rcg2_shared_ops would
> wrongly configure the RCG registers during enable/disable, which leads
> to mismatch between the hardware and software rate so modify the shared
> ops to handle such cases.
> 
> Signed-off-by: Amit Nischal <anischal@codeaurora.org>

The shared rcg ops were orphaned and then deleted recently.
Please bring this topic back up again when you have code that
uses these ops. We can bring the code back in the proper way
then. Also, don't hard-code 19.2MHz into the code as the CXO
frequency. We've experienced that change in the past, so
hard-coding those things just doesn't work.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
