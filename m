Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1515759368-16946-4-git-send-email-patrice.chotard@st.com>
References: <1515759368-16946-1-git-send-email-patrice.chotard@st.com> <1515759368-16946-4-git-send-email-patrice.chotard@st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 15 Jan 2018 02:07:24 +0100
Message-ID: <CACRpkdYRXhfwZW6t3zoGg8dhizGw2ktQ1-pFh7mFZ++sab8ddQ@mail.gmail.com>
Subject: Re: [PATCH 03/14] mmc: mmci: Add support for setting pad type via pinctrl
To: Patrice CHOTARD <patrice.chotard@st.com>
Cc: Russell King <linux@armlinux.org.uk>, Ulf Hansson <ulf.hansson@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Alexandre Torgue <alexandre.torgue@st.com>, linux-mmc <linux-mmc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-gpio@vger.kernel.org,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Andrea Merello <andrea.merello@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Fri, Jan 12, 2018 at 1:15 PM,  <patrice.chotard@st.com> wrote:

> From: Patrice Chotard <patrice.chotard@st.com>
>
> The STM32 variant hasn't the control bit to switch pads in opendrain mode.
> In this case we can achieve the same result by asking to the pinmux driver
> to configure pins for us.
>
> This patch make the mmci driver able to do this whenever needed.
>
> Signed-off-by: Andrea Merello <andrea.merello@gmail.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

Nice and clean way to use pin control for this.
Hats off!

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
