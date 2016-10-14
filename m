Return-Path: <festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <66f5967187f915fe7039f4dbfb77db88a2423094.1476267249.git.emil@limesaudio.com>
References: <cover.1476267249.git.emil@limesaudio.com> <66f5967187f915fe7039f4dbfb77db88a2423094.1476267249.git.emil@limesaudio.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 14 Oct 2016 10:34:23 -0300
Message-ID: <CAOMZO5DuT4QAOLc9mv4HkpTZN1v_TguDDDcZwy0pR2FTwH4BPA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] clk: imx: improve precision of AV PLL to 1 Hz
To: Emil Lundmark <emil@limesaudio.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
	Fabio Estevam <fabio.estevam@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-clk@vger.kernel.org,
	"Ken . Lin" <ken.lin@advantech.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Wed, Oct 12, 2016 at 7:31 AM, Emil Lundmark <emil@limesaudio.com> wrote:
> The audio and video PLLs are designed to have a precision of 1 Hz if some
> conditions are met. The current implementation only allows a precision that
> depends on the rate of the parent clock. E.g., if the parent clock is 24
> MHz, the precision will be 24 Hz; or more generally the precision will be
...
> I reckon this is the intention by the design of the clock rate formula.
>
> Signed-off-by: Emil Lundmark <emil@limesaudio.com>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
