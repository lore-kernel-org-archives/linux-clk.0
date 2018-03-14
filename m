Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Tero Kristo <t-kristo@ti.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <06cc5fe8-cecd-2b6c-415d-74f533c75be0@ti.com>
Cc: linux-clk <linux-clk@vger.kernel.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "tony@atomide.com" <tony@atomide.com>,
 Santosh Shilimkar <ssantosh@kernel.org>
References: <06cc5fe8-cecd-2b6c-415d-74f533c75be0@ti.com>
Message-ID: <152106412431.179530.18028994453678074314@swboyd.mtv.corp.google.com>
Subject: Re: [GIT PULL] TI clock changes for 4.17
Date: Wed, 14 Mar 2018 14:48:44 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Tero Kristo (2018-03-08 02:13:38)
> Hi Stephen, Michael,
> =

> These patches are targeted for 4.17 merge window. I grouped both =

> omap+keystone clock changes into single pull request.
> =


Thanks. Pulled into clk-next. BTW, I see that some of the 'basic' clk
type code in TI driver isn't used anymore. Is there a plan to delete
that code in the future? For example, drivers/clk/ti/divider.c has
ti_clk_build_component_div() that nobody uses.
