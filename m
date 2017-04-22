Return-Path: <sboyd@codeaurora.org>
Date: Fri, 21 Apr 2017 19:47:04 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 6/8] clk: Improve a size determination in two functions
Message-ID: <20170422024704.GN7065@codeaurora.org>
References: <94b24eaa-c5fb-80ea-441a-883989d14ef5@users.sourceforge.net>
 <599640c0-d9a1-f1a4-47f3-edaf98f407c1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <599640c0-d9a1-f1a4-47f3-edaf98f407c1@users.sourceforge.net>
List-ID: <linux-clk.vger.kernel.org>

On 04/20, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 20 Apr 2017 09:30:52 +0200
> 
> Replace the specification of two data structures by pointer dereferences
> as the parameter for the operator "sizeof" to make the corresponding size
> determination a bit safer according to the Linux coding style convention.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
