Return-Path: <sboyd@codeaurora.org>
Date: Fri, 12 Aug 2016 17:57:54 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	tdas@codeaurora.org
Subject: Re: [PATCH v2 08/10] clk: qcom: Cleanup some macro defs
Message-ID: <20160813005754.GF361@codeaurora.org>
References: <1470904858-11930-1-git-send-email-rnayak@codeaurora.org>
 <1470904858-11930-9-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1470904858-11930-9-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 08/11, Rajendra Nayak wrote:
> From: Taniya Das <tdas@codeaurora.org>
> 
> Move all
> '# define XYZ'
> to
> '#define XYZ'
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

This was done on purpose. Please drop this patch

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
