Return-Path: <festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1432132237-31004-1-git-send-email-sebastien.szymanski@armadeus.com>
References: <1432132237-31004-1-git-send-email-sebastien.szymanski@armadeus.com>
Date: Wed, 20 May 2015 12:20:50 -0300
Message-ID: <CAOMZO5ByAL=-EXUiEoKnWVWbcpLPKDxQShPf_FPDhmHmiG3bmQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] ARM: clk-imx6q: refine sata's parent
From: Fabio Estevam <festevam@gmail.com>
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Cc: Shawn Guo <shawn.guo@linaro.org>, Sascha Hauer <kernel@pengutronix.de>,
	Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-clk@vger.kernel.org,
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Wed, May 20, 2015 at 11:30 AM, S=C3=A9bastien Szymanski
<sebastien.szymanski@armadeus.com> wrote:
> According to IMX6D/Q RM, table 18-3, sata clock's parent is ahb, not ipg.

Good catch!

>
> This patch is based on branch:
> git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git imx/soc

Please put this below the --- line.

Reviewed-by: Fabio Estevam <fabio.estevam@freescale.com>
