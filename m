Return-Path: <dongas86@gmail.com>
Return-Path: <dongas86@gmail.com>
Date: Mon, 8 Jan 2018 18:33:42 +0800
From: Dong Aisheng <dongas86@gmail.com>
To: Anson Huang <Anson.Huang@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-imx@nxp.com, shawnguo@kernel.org, kernel@pengutronix.de,
	fabio.estevam@nxp.com, mturquette@baylibre.com,
	sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com,
	stefan@agner.ch, linux@armlinux.org.uk
Subject: Re: [PATCH 1/2] clk: imx: imx7d: add the snvs clock
Message-ID: <20180108103342.GC32635@b29396-OptiPlex-7040>
References: <1515078402-22135-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1515078402-22135-1-git-send-email-Anson.Huang@nxp.com>
List-ID: <linux-clk.vger.kernel.org>

On Thu, Jan 04, 2018 at 11:06:41PM +0800, Anson Huang wrote:
> According to the i.MX7D Reference Manual,
> SNVS block has a clock gate, accessing SNVS block
> would need this clock gate to be enabled, add it
> into clock tree so that SNVS module driver can
> operate this clock gate.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Acked-by: Dong Aisheng <aisheng.dong@nxp.com>

Regards
Dong Aisheng
