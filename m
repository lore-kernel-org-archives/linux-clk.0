Return-Path: <khilman@baylibre.com>
Return-Path: <khilman@baylibre.com>
From: Kevin Hilman <khilman@baylibre.com>
To: Yixun Lan <yixun.lan@amlogic.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,  Jerome Brunet <jbrunet@baylibre.com>,  Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@codeaurora.org>,  Carlo Caione <carlo@caione.org>,  <linux-amlogic@lists.infradead.org>,  <linux-clk@vger.kernel.org>,  <linux-arm-kernel@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: meson: make the spinlock naming more specific
References: <20171204052739.10747-1-yixun.lan@amlogic.com>
Date: Thu, 07 Dec 2017 12:31:16 -0800
In-Reply-To: <20171204052739.10747-1-yixun.lan@amlogic.com> (Yixun Lan's
	message of "Mon, 4 Dec 2017 13:27:39 +0800")
Message-ID: <7hpo7qp9ez.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Yixun Lan <yixun.lan@amlogic.com> writes:

> Make the spinlock more specific, so better for lockdep
> debugging and ctags/grep.
>
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
>
> ---
>
> this patch try to address the issue which bring up by Stephen at [1]
> [1] http://lists.infradead.org/pipermail/linux-amlogic/2017-December/005534.html

FYI... for future reference, it's common to use a Suggested-by tag to
give credit for these kinds of things.  e.g.:

Suggested-by: Stephen Boyd <sboyd@codeaurora.org>

Kevin
