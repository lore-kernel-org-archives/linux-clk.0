Return-Path: <wens@csie.org>
MIME-Version: 1.0
In-Reply-To: <1444682610-21482-4-git-send-email-maxime.ripard@free-electrons.com>
References: <1444682610-21482-1-git-send-email-maxime.ripard@free-electrons.com>
 <1444682610-21482-4-git-send-email-maxime.ripard@free-electrons.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 14 Oct 2015 17:20:51 +0800
Message-ID: <CAGb2v67wc3E-eBU3KA0jDPMHy3H2chd872QZxcm5s6AsLrh6ig@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] clk: sunxi: pll2: Add A13 support
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Emilio Lopez <emilio@elopez.com.ar>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Chen-Yu Tsai <wens@csie.org>,
	Hans de Goede <hdegoede@redhat.com>, linux-clk <linux-clk@vger.kernel.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Tue, Oct 13, 2015 at 4:43 AM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> The A13, unlike the A10 and A20, doesn't use a pass-through exception for
> the 0 value in the pre and post dividers, but increments all the values
> written in the register by one.
>
> Add an exception for both these cases to handle them nicely.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
