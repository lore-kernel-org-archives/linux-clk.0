Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20170508193348.30236-1-eric@anholt.net>
References: <20170508193348.30236-1-eric@anholt.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 8 May 2017 23:42:54 +0200
Message-ID: <CACRpkdZUQX2MBiyd=m9P6HsxnNsf446RNR=R3-O_zm5GQXXOOg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/pl111: Register the clock divider and use it.
To: Eric Anholt <eric@anholt.net>
Cc: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Mon, May 8, 2017 at 9:33 PM, Eric Anholt <eric@anholt.net> wrote:

> This is required for the panel to work on bcm911360, where CLCDCLK is
> the fixed 200Mhz AXI41 clock.  The rate set is still passed up to the
> CLCDCLK, for platforms that have a settable rate on that one.
>
> v2: Set SET_RATE_PARENT (caught by Linus Walleij), depend on
>     COMMON_CLK.
>
> Signed-off-by: Eric Anholt <eric@anholt.net>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
