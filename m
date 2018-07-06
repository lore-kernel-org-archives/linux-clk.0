Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>,
 Paul Cercueil <paul@crapouillou.net>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180627121459.13987-1-paul@crapouillou.net>
Cc: Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>
References: <20180627121459.13987-1-paul@crapouillou.net>
Message-ID: <153090935111.143105.11886484624639527247@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 1/2] clk: ingenic: Fix incorrect data for the i2s clock
Date: Fri, 06 Jul 2018 13:35:51 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Paul Cercueil (2018-06-27 05:14:58)
> The register field for configuring the divider for the i2s clock
> occupies the bits [8-0], which means 9 bits and not 8.
> =

> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---

Applied to clk-next
