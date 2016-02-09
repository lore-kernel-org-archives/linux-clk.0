Return-Path: <sboyd@codeaurora.org>
Date: Mon, 8 Feb 2016 17:07:08 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] devm: add helper devm_add_action_or_reset()
Message-ID: <20160209010708.GI10791@codeaurora.org>
References: <1450873640-12489-1-git-send-email-sudipm.mukherjee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1450873640-12489-1-git-send-email-sudipm.mukherjee@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/23, Sudip Mukherjee wrote:
> Add a helper function devm_add_action_or_reset() which will internally
> call devm_add_action(). But if devm_add_action() fails then it will
> execute the action mentioned and return the error code.
> 
> Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
