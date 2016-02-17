Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Fabio Estevam <festevam@gmail.com>, "Anatolij Gustschin" <agust@denx.de>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <CAOMZO5Cwed8uOKz6=Odu=jaaBqoNzUxm2Xv3+6TAxKGsa27Mdw@mail.gmail.com>
Cc: linux-clk@vger.kernel.org, "Shawn Guo" <shawnguo@kernel.org>,
 "Stephen Boyd" <sboyd@codeaurora.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
References: <1455734900-1913-1-git-send-email-agust@denx.de>
 <CAOMZO5Cwed8uOKz6=Odu=jaaBqoNzUxm2Xv3+6TAxKGsa27Mdw@mail.gmail.com>
Message-ID: <20160217195725.2278.96780@quark.deferred.io>
Subject: Re: [PATCH] clk: imx: correct pwm7 clock name in driver for i.MX6UL
Date: Wed, 17 Feb 2016 11:57:25 -0800
List-ID: <linux-clk.vger.kernel.org>

Quoting Fabio Estevam (2016-02-17 10:58:13)
> On Wed, Feb 17, 2016 at 4:48 PM, Anatolij Gustschin <agust@denx.de> wrote:
> > Don't capitalize p in the pwm7 clock name.
> >
> > Signed-off-by: Anatolij Gustschin <agust@denx.de>
> =

> Thanks.
> =

> Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>

Should I apply this to clk-next or is someone (Shawn?) gathering patches
for a pull request?

Regards,
Mike

> --
> To unsubscribe from this list: send the line "unsubscribe linux-clk" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
