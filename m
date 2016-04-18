Return-Path: <sboyd@codeaurora.org>
Date: Mon, 18 Apr 2016 11:53:39 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Michael Turquette <mturquette@baylibre.com>,
	kernel-janitors@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Luis R . Rodriguez" <mcgrof@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>
Subject: Re: [PATCH 1/5] clk: qoriq: add __init attribute
Message-ID: <20160418185339.GC15324@codeaurora.org>
References: <1460991338-9845-1-git-send-email-Julia.Lawall@lip6.fr>
 <1460991338-9845-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1460991338-9845-2-git-send-email-Julia.Lawall@lip6.fr>
List-ID: <linux-clk.vger.kernel.org>

On 04/18, Julia Lawall wrote:
> Add __init attribute on a function that is only called from other __init
> functions and that is not inlined, at least with gcc version 4.8.4 on an
> x86 machine with allyesconfig.  Currently, the function is put in the
> .text.unlikely segment.  Declaring it as __init will cause it to be put in
> the .init.text and to disappear after initialization.
> 
> The result of objdump -x on the function before the change is as follows:
> 
> 0000000000000000 l     F .text.unlikely 0000000000000071 sysclk_from_fixed.constprop.5
> 
> And after the change it is as follows:
> 
> 0000000000000480 l     F .init.text	000000000000006c sysclk_from_fixed.constprop.5
> 
> Done with the help of Coccinelle.  The semantic patch checks for local
> static non-init functions that are called from an __init function and are
> not called from any other function.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
