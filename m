Return-Path: <ukl@pengutronix.de>
Date: Mon, 30 Nov 2015 09:15:43 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: "Mutharaju, Prasanna (P.)" <mkarthi3@visteon.com>
Cc: Kukjin Kim <kgene@kernel.org>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3] clk: s3c2410: removed unneeded variable in
 s3c24xx_clkout_set_parent
Message-ID: <20151130081543.GI10431@pengutronix.de>
References: <20151130075219.GA27737@jci-VirtualBox>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <20151130075219.GA27737@jci-VirtualBox>
List-ID: <linux-clk.vger.kernel.org>

On Mon, Nov 30, 2015 at 07:52:22AM +0000, Mutharaju, Prasanna (P.) wrote:
> From: Prasanna Karthik <mkarthi3@visteon.com>
> 
> Remove unneeded variable used to store return value.
> ---
> v3: Modified subject and changelog comments
> ---
> 
> Signed-off-by: Prasanna Karthik <mkarthi3@visteon.com>

Everything after the first triple-dash doesn't make it into the git
history, so you are expected to write the S-o-b line above the list of
things changed since a previous submission.

Other than that the patch looks fine.

Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
