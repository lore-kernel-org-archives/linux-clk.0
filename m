Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <c740386a55dc28db37f250eccc11687c1b111554.1496730576.git-series.stefan@agner.ch>
References: <cover.b62c3a17bd60de48d8fb2ade6dde4f2bc60aaf3c.1496730576.git-series.stefan@agner.ch>
 <c740386a55dc28db37f250eccc11687c1b111554.1496730576.git-series.stefan@agner.ch>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 6 Jun 2017 13:35:18 -0300
Message-ID: <CAOMZO5BMXwnMbYWUPDMhzu-eCbNjqj3HWK_q5RsWDXG3+C1O0w@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] ARM: dts: imx7-colibri: add NAND support
To: Stefan Agner <stefan@agner.ch>
Cc: Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Brian Norris <computersforpeace@gmail.com>,
        Boris Brezillon <boris.brezillon@free-electrons.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Richard Weinberger <richard@nod.at>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, han.xu@nxp.com,
        Fabio Estevam <fabio.estevam@freescale.com>,
        =?UTF-8?Q?Lothar_Wa=C3=9Fmann?= <LW@karo-electronics.de>,
        "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>, linux-clk@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jun 6, 2017 at 3:30 AM, Stefan Agner <stefan@agner.ch> wrote:
> The Colibri iMX7 modules come with 512MB on-module SLC NAND flash
> populated. Make use of it by enabling the GPMI controller.
>
> Signed-off-by: Stefan Agner <stefan@agner.ch>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
