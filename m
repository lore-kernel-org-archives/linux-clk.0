Return-Path: <shawnguo@kernel.org>
Date: Mon, 10 Sep 2018 08:17:25 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Anson Huang <Anson.Huang@nxp.com>
Cc: s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com,
	robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk,
	mturquette@baylibre.com, sboyd@kernel.org,
	colin.didier@devialet.com, clement.peron@devialet.com,
	ping.bai@nxp.com, aisheng.dong@nxp.com, shengjiu.wang@nxp.com,
	matteo.lisi@engicam.com, michael@amarulasolutions.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Linux-imx@nxp.com
Subject: Re: [PATCH 1/7] ARM: imx: add mmdc ipg clock operation for mmdc
Message-ID: <20180910001722.GA21218@dragon>
References: <1535701998-20443-1-git-send-email-Anson.Huang@nxp.com>
 <1535701998-20443-2-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1535701998-20443-2-git-send-email-Anson.Huang@nxp.com>
List-ID: <linux-clk.vger.kernel.org>

On Fri, Aug 31, 2018 at 03:53:12PM +0800, Anson Huang wrote:
> i.MX6 SoCs have MMDC ipg clock for registers access, to make
> sure MMDC registers access successfully, add optional clock
> enable for MMDC driver.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied this one, thanks.
