Return-Path: <laanwj@gmail.com>
Return-Path: <laanwj@gmail.com>
Date: Mon, 21 Aug 2017 18:44:05 +0200
From: "Wladimir J. van der Laan" <laanwj@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, patchwork-lst@pengutronix.de,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Sascha Hauer <kernel@pengutronix.de>,
	Fabio Estevam <fabio.estevam@nxp.com>,
	Ilia Mirkin <imirkin@alum.mit.edu>, linux-clk@vger.kernel.org,
	Chris Healy <cphealy@gmail.com>
Subject: Re: [PATCH] clk: imx51: propagate rate across ipu_di*_sel
Message-ID: <20170821164405.GA25915@amethyst.visucore.com>
References: <20170818163058.22252-1-l.stach@pengutronix.de>
 <CAOMZO5BoZNQrmDMXE0CDxLS-v7xVu4z87Ezdma1X1QCV56rPtQ@mail.gmail.com>
 <20170821155412.GA24652@amethyst.visucore.com>
 <4d5dbc0a-56b0-52a3-482d-2b3348c9c53b@cogentembedded.com>
 <20170821163824.GC24652@amethyst.visucore.com>
 <CAOMZO5CrG0HCDyfKokPcWaVTNT3ui+6688BAhNzNTd2bdkxa+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <CAOMZO5CrG0HCDyfKokPcWaVTNT3ui+6688BAhNzNTd2bdkxa+w@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On Mon, Aug 21, 2017 at 01:39:44PM -0300, Fabio Estevam wrote:
> Hi Wladimir,
> 
> On Mon, Aug 21, 2017 at 1:38 PM, Wladimir J. van der Laan
> <laanwj@gmail.com> wrote:
> 
> > Thanks,
> > With that patch and Lucas' patch series applied, I can confirm to have working a console on DVI!
> 
> Excellent! Maybe you could reply with your Tested-by tag then?

Sure!

Tested-By: Wladimir J. van der Laan <laanwj@gmail.com>

Regards,
Wladimir
