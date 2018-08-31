Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Colin King <colin.king@canonical.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-mediatek@lists.infradead.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180806134402.1055-1-colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20180806134402.1055-1-colin.king@canonical.com>
Message-ID: <153567899849.93865.4205043107104480951@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: mediatek: remove unused array audio_parents
Date: Thu, 30 Aug 2018 18:29:58 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Colin King (2018-08-06 06:44:02)
> From: Colin Ian King <colin.king@canonical.com>
> =

> Array audio_parents is declared but never used, hence it is redundant
> and can be removed.
> =

> Cleans up clang warning:
> warning: 'audio_parents' defined but not used [-Wunused-const-variable=3D]
> =

> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Applied to clk-next
