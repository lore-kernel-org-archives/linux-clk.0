Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Sudeep Holla <sudeep.holla@arm.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1521547867-23808-1-git-send-email-sudeep.holla@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1519403030-21189-17-git-send-email-sudeep.holla@arm.com>
 <1521547867-23808-1-git-send-email-sudeep.holla@arm.com>
Message-ID: <152156297081.254778.8373273607540232473@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: scmi: use devm_of_clk_add_hw_provider() API and drop
 scmi_clocks_remove
Date: Tue, 20 Mar 2018 09:22:50 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Sudeep Holla (2018-03-20 05:11:07)
> Commit aa795c41d9cd ("clk: Add devm_of_clk_add_hw_provider()/del_provider=
()
> APIs") adds devm_of_clk_add_hw_provider which takes care of deleting the
> clock provider when the clock providers device is removed.
> =

> This patch makes use of devm_of_clk_add_hw_provider() instead of
> of_clk_add_hw_provider() so that we can eliminate the need of explicit
> scmi_clocks_remove for just doing of_clk_del_provider()
> =

> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
