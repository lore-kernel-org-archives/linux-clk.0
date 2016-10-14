Return-Path: <festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4d2e3a91dfb74209735c940b51d7efc9ba2ed69b.1476267249.git.emil@limesaudio.com>
References: <cover.1476267249.git.emil@limesaudio.com> <4d2e3a91dfb74209735c940b51d7efc9ba2ed69b.1476267249.git.emil@limesaudio.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 14 Oct 2016 10:33:43 -0300
Message-ID: <CAOMZO5BdtKb7fOceRz0yiDyBedV_7p+e7f9FoNJY2CsvSv+oBQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] clk: imx: fix integer overflow in AV PLL round rate
To: Emil Lundmark <emil@limesaudio.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
	Fabio Estevam <fabio.estevam@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-clk@vger.kernel.org,
	"Ken . Lin" <ken.lin@advantech.com>, Anson Huang <b20788@freescale.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Wed, Oct 12, 2016 at 7:31 AM, Emil Lundmark <emil@limesaudio.com> wrote:
> Since 'parent_rate * mfn' may overflow 32 bits, the result should be
> stored using 64 bits.
>
> The problem was discovered when trying to set the rate of the audio PLL
> (pll4_post_div) on an i.MX6Q. The desired rate was 196.608 MHz, but
> the actual rate returned was 192.000570 MHz. The round rate function should
> have been able to return 196.608 MHz, i.e., the desired rate.
>
> Fixes: ba7f4f557eb6 ("clk: imx: correct AV PLL rate formula")
> Cc: Anson Huang <b20788@freescale.com>
> Signed-off-by: Emil Lundmark <emil@limesaudio.com>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
