Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 14 Jul 2015 17:28:36 -0700
From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
To: Stephen Boyd <sboyd@codeaurora.org>
CC: Mike Turquette <mturquette@baylibre.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] clk: qcom: Set CLK_SET_RATE_PARENT on ce1 clocks
Message-ID: <20150715002836.GE32767@usrtlx11787.corpusers.net>
References: <1436918964-3895-1-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <1436918964-3895-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue 14 Jul 17:09 PDT 2015, Stephen Boyd wrote:

> The other ce clocks have the flag set, but ce1 doesn't, so
> clk_set_rate() doesn't propagate up the tree to the ce1_src_clk.
> Set the flag as this is supported.
> 
> Reported-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> Fixes: 02824653200b ("clk: qcom: Add APQ8084 Global Clock Controller support")
> Fixes: d33faa9ead8d ("clk: qcom: Add support for MSM8974's global clock controller (GCC)")
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---

Thanks, test ok on 8974.

Tested-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>

Regards,
Bjorn

