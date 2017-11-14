Return-Path: <sboyd@codeaurora.org>
Date: Mon, 13 Nov 2017 17:59:29 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] clk/ux500: Delete an error message for a failed
 memory allocation in three functions
Message-ID: <20171114015929.GR11955@codeaurora.org>
References: <d23a685d-f8a0-f4ca-078a-414d7b8674ca@users.sourceforge.net>
 <db799483-7084-8e93-2bfe-2da0e426d08b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <db799483-7084-8e93-2bfe-2da0e426d08b@users.sourceforge.net>
List-ID: <linux-clk.vger.kernel.org>

On 09/27, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 27 Sep 2017 20:23:58 +0200
> 
> Omit extra messages for a memory allocation failure in these functions.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
