Return-Path: <ukl@pengutronix.de>
Date: Mon, 7 Sep 2015 11:50:29 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, patchwork-lst@pengutronix.de,
	kernel@pengutronix.de, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/8] clk: imx: add common logic to detect early UART
 usage
Message-ID: <20150907095029.GB9999@pengutronix.de>
References: <1441382419-4343-1-git-send-email-l.stach@pengutronix.de>
 <1441382419-4343-2-git-send-email-l.stach@pengutronix.de>
 <20150907090603.GU9999@pengutronix.de>
 <1441617354.28391.5.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <1441617354.28391.5.camel@pengutronix.de>
List-ID: <linux-clk.vger.kernel.org>

Hallo Lucas,

On Mon, Sep 07, 2015 at 11:15:54AM +0200, Lucas Stach wrote:
> Am Montag, den 07.09.2015, 11:06 +0200 schrieb Uwe Kleine-König:
> > I wonder why you need an array of pointers to pointers of clocks. Isn't
> > one indirection less possible and more easy?
> > 
> No, this is not easily possible if we want to use the auto-discarding of
> the clocks array and a simple static initialization. The clock pointers
> are only set up after the clock drivers probe routine has run, so if I
> want to point to the actual clocks I would need to dynamically populate
> the array and either dynamically allocate it, or would need to pre-size
> the static array.
Ah right. An alternative would be to just store the indices, but I don't
think this is nicer because then you additionally need a reference to
the clk array. You don't happen to have this anyhow, do you?

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
