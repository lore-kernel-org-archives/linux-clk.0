Return-Path: <festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20160703174813.13970-1-stefan@agner.ch>
References: <20160703174813.13970-1-stefan@agner.ch>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 3 Jul 2016 15:23:37 -0300
Message-ID: <CAOMZO5AghMZ0iV0=0hBrFhhhAAfPpyxH0oj8UT7TqZr9N0+y9A@mail.gmail.com>
Subject: Re: [PATCH v2] clk: imx7d: do not set parent of ethernet time/ref clocks
To: Stefan Agner <stefan@agner.ch>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <kernel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Igor Grinberg <grinberg@compulab.co.il>,
	Gary Bisson <gary.bisson@boundarydevices.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-clk@vger.kernel.org,
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Stefan,

On Sun, Jul 3, 2016 at 2:48 PM, Stefan Agner <stefan@agner.ch> wrote:

> Fabio, thanks for testing v1.
>
> With v2, the warnings should definitly be gone. However, that might
> break some boards...

Still see the warnings with v2.
