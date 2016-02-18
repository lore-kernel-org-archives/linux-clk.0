Return-Path: <shawnguo@kernel.org>
Date: Thu, 18 Feb 2016 22:14:26 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Fabio Estevam <festevam@gmail.com>, Anatolij Gustschin <agust@denx.de>,
	linux-clk@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] clk: imx: correct pwm7 clock name in driver for i.MX6UL
Message-ID: <20160218141426.GZ6756@tiger>
References: <1455734900-1913-1-git-send-email-agust@denx.de>
 <CAOMZO5Cwed8uOKz6=Odu=jaaBqoNzUxm2Xv3+6TAxKGsa27Mdw@mail.gmail.com>
 <20160217195725.2278.96780@quark.deferred.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160217195725.2278.96780@quark.deferred.io>
List-ID: <linux-clk.vger.kernel.org>

On Wed, Feb 17, 2016 at 11:57:25AM -0800, Michael Turquette wrote:
> Quoting Fabio Estevam (2016-02-17 10:58:13)
> > On Wed, Feb 17, 2016 at 4:48 PM, Anatolij Gustschin <agust@denx.de> wrote:
> > > Don't capitalize p in the pwm7 clock name.
> > >
> > > Signed-off-by: Anatolij Gustschin <agust@denx.de>
> > 
> > Thanks.
> > 
> > Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
> 
> Should I apply this to clk-next or is someone (Shawn?) gathering patches
> for a pull request?

Yes, I'm collecting i.MX clock patches for a pull request that will go
to you later.

Patch applied, thanks.

Shawn
