Return-Path: <sboyd@codeaurora.org>
Date: Mon, 13 Nov 2017 17:58:47 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-clk@vger.kernel.org, Loc Ho <lho@apm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] clk-xgene: Delete an error message for a failed
 memory allocation in two functions
Message-ID: <20171114015847.GK11955@codeaurora.org>
References: <1440d17a-ae7d-0a9c-49b4-611824df5e87@users.sourceforge.net>
 <2a6fb281-932f-e043-f084-355a3020411a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <2a6fb281-932f-e043-f084-355a3020411a@users.sourceforge.net>
List-ID: <linux-clk.vger.kernel.org>

On 09/26, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 26 Sep 2017 21:19:19 +0200
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
