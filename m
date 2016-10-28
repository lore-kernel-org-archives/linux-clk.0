Return-Path: <festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20161028181316.GI16026@codeaurora.org>
References: <cover.1476267249.git.emil@limesaudio.com> <4d2e3a91dfb74209735c940b51d7efc9ba2ed69b.1476267249.git.emil@limesaudio.com>
 <20161028014127.GD16026@codeaurora.org> <CAOMZO5Co32XUpNFz4Hd2DEmNnMBvD5fKmsyjcmsgawea4dJR9g@mail.gmail.com>
 <20161028181316.GI16026@codeaurora.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 28 Oct 2016 17:32:07 -0200
Message-ID: <CAOMZO5CLMtyZStgDzdiSHo9s8BhXyiapWqDx1L_TmMpH13043g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] clk: imx: fix integer overflow in AV PLL round rate
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Emil Lundmark <emil@limesaudio.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-clk@vger.kernel.org,
	"Ken . Lin" <ken.lin@advantech.com>, Anson Huang <b20788@freescale.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Fri, Oct 28, 2016 at 4:13 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:

> The clk-fixes branch is for patches that fix problems in code
> merged during the merge window as well as small one-liners and
> things that are causing great pain for people on the latest
> release. Given that this fixes a regression in v4.8 and we're
> trying to stabilize v4.9 it looked like it could wait until
> v4.10.

The regression affects 4.8 and 4.9.

> So is there something going on here where the pain is too much to
> wait for the next merge window? If so the commit text should

Yes, people reported HDMI issues because of this bug:
https://www.spinics.net/lists/arm-kernel/msg535304.html

> mention something about what's causing that pain. Perhaps by
> referencing the commit that merged outside of clk tree that
> caused problems.

This patch clearly states that the problem is caused by ba7f4f557eb6
("clk: imx: correct AV PLL rate formula").

Since this is a regression, I don't understand why we need to wait
until 4.10 to get it applied.
