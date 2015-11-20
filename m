Return-Path: <sboyd@codeaurora.org>
Date: Fri, 20 Nov 2015 09:17:28 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: versatile: remove unneeded error message
Message-ID: <20151120171728.GM32672@codeaurora.org>
References: <1448009548-30317-1-git-send-email-sudipm.mukherjee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1448009548-30317-1-git-send-email-sudipm.mukherjee@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 11/20, Sudip Mukherjee wrote:
> If kzalloc fails we will already have many messages in the log and we do
> not need another message to know that kzalloc for sp810 has failed.
> 
> Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
