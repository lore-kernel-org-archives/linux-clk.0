Return-Path: <aisheng.dong@nxp.com>
From: "A.s. Dong" <aisheng.dong@nxp.com>
To: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH V3 0/4] clk: new APIs to handle all available clocks
Date: Wed, 20 Jun 2018 02:53:35 +0000
Message-ID: 
 <AM0PR04MB421114F8AFAE56B6D7C2D1E480770@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1527244643-10736-1-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1527244643-10736-1-git-send-email-aisheng.dong@nxp.com>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Ping....

> -----Original Message-----
> From: A.s. Dong
> Sent: Friday, May 25, 2018 6:37 PM
> To: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> sboyd@kernel.org; mturquette@baylibre.com; shawnguo@kernel.org; dl-
> linux-imx <linux-imx@nxp.com>; A.s. Dong <aisheng.dong@nxp.com>
> Subject: [PATCH V3 0/4] clk: new APIs to handle all available clocks
>=20
> This patch series is a continue of discussion from here,
> https://patchwork.kernel.org/patch/9986293/
> that some users may want to handle all available clocks from device tree
> without need to know the detailed clock information likes clock numbers a=
nd
> names. This is useful in writing some generic drivers to handle clock par=
t.
>=20
> Note:
> This patch series is tested on MX6Q SDB cpufreq driver with a minor chang=
e
> to switch to use clk_bulk_get_all.
> But patch 4 only test compiling. Hopefully someone could help test the
> function.
>=20
> v2->v3:
>  * address all comments from Stephen
>  * fix build warnings on other architectures.
> v1->v2:
>  * add clk_bulk_{get|put}_all() which only supports DT platform currently
>  * remove _all variants and the wrapper struct clk_bulk
>  * make of_clk_bulk_get and of_clk_bulk_get_all private until someone
>    proves they need it because they don't have a struct device pointer.
>=20
> Dong Aisheng (4):
>   clk: bulk: add of_clk_bulk_get()
>   clk: add new APIs to operate on all available clocks
>   clk: add managed version of clk_bulk_get_all
>   video: simplefb: switch to use clk_bulk API to simplify clock
>     operations
>=20
>  drivers/clk/clk-bulk.c         | 80
> ++++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/clk-devres.c       | 24 +++++++++++++
>  drivers/video/fbdev/simplefb.c | 66 +++++++---------------------------
>  include/linux/clk.h            | 65 +++++++++++++++++++++++++++++++++-
>  4 files changed, 180 insertions(+), 55 deletions(-)
>=20
> --
> 2.7.4
