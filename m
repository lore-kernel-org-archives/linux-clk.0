Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1522403054-18691-4-git-send-email-hayashi.kunihiko@socionext.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
References: <1522403054-18691-1-git-send-email-hayashi.kunihiko@socionext.com>
 <1522403054-18691-4-git-send-email-hayashi.kunihiko@socionext.com>
Message-ID: <152296592172.91052.3862230596995737594@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 3/3] clk: uniphier: add additional ethernet clock lines for Pro4
Date: Thu, 05 Apr 2018 15:05:21 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Kunihiko Hayashi (2018-03-30 02:44:14)
> Pro4 SoC has clock lines for Giga-bit feature and ethernet phy,
> and these are mandatory to activate the ethernet controller. This adds
> support for the clock lines.
> =

> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> ---

Applied to clk-next
