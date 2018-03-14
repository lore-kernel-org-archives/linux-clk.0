Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
 Stephen Boyd <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180312082644.GA26859@dragon>
Cc: Jiancheng Xue <xuejiancheng@hisilicon.com>, linux-clk@vger.kernel.org
References: <20180312082644.GA26859@dragon>
Message-ID: <152106341167.179530.4712744286063403232@swboyd.mtv.corp.google.com>
Subject: Re: [GIT PULL v2] Hi3798cv200 clock driver update for 4.17
Date: Wed, 14 Mar 2018 14:36:51 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Shawn Guo (2018-03-12 01:26:45)
> Hi Stephen, Mike,
> =

> This is v2 of Hi3798cv200 clock driver pull request [1].  It includes
> the eMMC phase clock support patches [2] on top of v1.  I believe they
> are ready to go.  Please consider to pull it for 4.17.  Thanks.
> =

> Shawn
> =


Thanks. Pulled into clk-next with a fixup on top to mark the phase ops
static.
