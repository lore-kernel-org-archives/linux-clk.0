Return-Path: <sboyd@codeaurora.org>
Date: Wed, 10 Jun 2015 14:23:19 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Maxime Coquelin <maxime.coquelin@st.com>
Cc: Mike Turquette <mturquette@linaro.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@stlinux.com
Subject: Re: [PATCH] clk: Move debug_node field under DEBUG_FS flag in struct
 clk_core
Message-ID: <20150610212319.GD29640@codeaurora.org>
References: <1433935707-3621-1-git-send-email-maxime.coquelin@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1433935707-3621-1-git-send-email-maxime.coquelin@st.com>
List-ID: <linux-clk.vger.kernel.org>

On 06/10, Maxime Coquelin wrote:
> The debug_node field is only used when DEBUG_FS config is selected,
> so declare it only if DEBUG_FS is selected.
> 
> Signed-off-by: Maxime Coquelin <maxime.coquelin@st.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
