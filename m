Return-Path: <sboyd@codeaurora.org>
Date: Mon, 8 Feb 2016 17:07:20 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: qcom: common: check for failure
Message-ID: <20160209010720.GJ10791@codeaurora.org>
References: <1450873640-12489-1-git-send-email-sudipm.mukherjee@gmail.com>
 <1450873640-12489-2-git-send-email-sudipm.mukherjee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1450873640-12489-2-git-send-email-sudipm.mukherjee@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/23, Sudip Mukherjee wrote:
> We were not checking the return from devm_add_action() which can fail.
> Start using the helper and devm_add_action_or_reset() and return
> directly as we know that the cleanup has been done by this helper.
> 
> Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
