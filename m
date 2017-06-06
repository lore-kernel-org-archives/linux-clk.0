Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <151ddece1e1427d0b69c4ff11b86a69b6a035d0d.1496730576.git-series.stefan@agner.ch>
References: <cover.b62c3a17bd60de48d8fb2ade6dde4f2bc60aaf3c.1496730576.git-series.stefan@agner.ch>
 <151ddece1e1427d0b69c4ff11b86a69b6a035d0d.1496730576.git-series.stefan@agner.ch>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 6 Jun 2017 13:34:52 -0300
Message-ID: <CAOMZO5Ai-_5j3gQviaq19y7MJmirRgBtUp59UYmuGaN3Fd5Sag@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] ARM: dts: imx7: add GPMI NAND and APBH DMA
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
> Add i.MX 7 APBH DMA and GPMI NAND modules.
>
> Signed-off-by: Stefan Agner <stefan@agner.ch>

Tested on a imx7d-sdb:

[    1.303543] nand: device found, Manufacturer ID: 0xec, Chip ID: 0xd5
[    1.309999] nand: Samsung NAND 2GiB 3,3V 8-bit
[    1.314467] nand: 2048 MiB, MLC, erase size: 256 KiB, page size:
2048, OOB size: 64
[    1.346007] gpmi-nand 33002000.gpmi-nand: driver registered.

Tested-by: Fabio Estevam <fabio.estevam@nxp.com>
