Return-Path: <festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOf5uwnGDzEsK4tG9KD=uJr_sP1J5v_uROdUhy6s3p58=xZ1Dg@mail.gmail.com>
References: <1524258004-28717-1-git-send-email-michael@amarulasolutions.com>
 <CAOMZO5BO_FgPCkJJQf64jyYguqFGaDTDje3=_KTm4sXhwxb0WA@mail.gmail.com> <CAOf5uwnGDzEsK4tG9KD=uJr_sP1J5v_uROdUhy6s3p58=xZ1Dg@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 6 May 2018 12:15:13 -0300
Message-ID: <CAOMZO5DW1zPVrqQ77+W8sRwjrP5EaaGxckL0QWOZs50jey5+Jg@mail.gmail.com>
Subject: Re: [PATCH V2] clk: imx: Add new clo01 and clo2 controlled by CCOSR
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
	Fabio Estevam <fabio.estevam@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
	Matteo Lisi <matteo.lisi@engicam.com>, Stephen Boyd <sboyd@kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Michael,

On Sun, May 6, 2018 at 10:41 AM, Michael Nazzareno Trimarchi
<michael@amarulasolutions.com> wrote:

> I have done the same but those clocks are valid for ULL and UL so seems that
> last clocks in the list seems added for ULL only

Ok, got it.

I see you put lots of 'dummy' clocks to the *cko1_sels and *cko2_sels
list, but they could be replaced by the real clocks instead.

Anyway, this could be improved later, so:

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
