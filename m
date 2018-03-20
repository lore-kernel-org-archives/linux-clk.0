Return-Path: <sudeep.holla@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: scmi: use devm_of_clk_add_hw_provider() API and drop
 scmi_clocks_remove
To: Stephen Boyd <sboyd@kernel.org>
References: <1519403030-21189-17-git-send-email-sudeep.holla@arm.com>
 <1521547867-23808-1-git-send-email-sudeep.holla@arm.com>
From: Sudeep Holla <sudeep.holla@arm.com>
Message-ID: <1d9ca586-1284-8b12-31d8-80950f29837c@arm.com>
Date: Tue, 20 Mar 2018 14:42:49 +0000
MIME-Version: 1.0
In-Reply-To: <1521547867-23808-1-git-send-email-sudeep.holla@arm.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On 20/03/18 12:11, Sudeep Holla wrote:
> Commit aa795c41d9cd ("clk: Add devm_of_clk_add_hw_provider()/del_provider()
> APIs") adds devm_of_clk_add_hw_provider which takes care of deleting the
> clock provider when the clock providers device is removed.
> 
> This patch makes use of devm_of_clk_add_hw_provider() instead of
> of_clk_add_hw_provider() so that we can eliminate the need of explicit
> scmi_clocks_remove for just doing of_clk_del_provider()
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/clk/clk-scmi.c | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
> 

Sorry I forgot to mention before, if this looks fine, please
provide ack so that I can take it via ARM Soc.

-- 
Regards,
Sudeep
