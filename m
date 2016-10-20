Return-Path: <wens@csie.org>
MIME-Version: 1.0
In-Reply-To: <67333887b86b7fd838dd9d6523dc7e3d9a9ddeb4.1476196031.git-series.maxime.ripard@free-electrons.com>
References: <cover.024e1b023e41efe548dc6a004f7a946408d5c9a2.1476196031.git-series.maxime.ripard@free-electrons.com>
 <67333887b86b7fd838dd9d6523dc7e3d9a9ddeb4.1476196031.git-series.maxime.ripard@free-electrons.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 20 Oct 2016 22:35:18 +0800
Message-ID: <CAGb2v67CWEEcC+AQ9MqsyKokTx2ZVXKqBSUFW_x7CfjHrL_JFA@mail.gmail.com>
Subject: Re: [PATCH v4 3/9] clk: sunxi-ng: Finish to convert to structures for arguments
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>, Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Tue, Oct 11, 2016 at 10:28 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> Some clocks still use an explicit list of arguments, which make it a bit
> more tedious to add new parameters.
>
> Convert those over to a structure pointer argument to add as many
> arguments as possible without having to many noise in our patches, or a
> very long list of arguments.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
