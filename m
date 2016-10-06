Return-Path: <ken.lin@advantech.com>
From: "Ken.Lin" <ken.lin@advantech.com>
To: "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "kernel@pengutronix.de"
	<kernel@pengutronix.de>,
        "sboyd@codeaurora.org" <sboyd@codeaurora.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "Peter.Stretz" <peter.stretz@advantech.com>,
        "Peter.Chiang" <peter.chiang@advantech.com>,
        Akshay Bhat
	<akshay.bhat@timesys.com>
Date: Thu, 6 Oct 2016 16:21:08 -0700
Subject: The possible regression in kernel 4.8 - clk: imx: correct AV PLL
 rate formula
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
References: <03B5A3CA1724CE4EAC32B27E39292A677FC5A390A9@AUSMAIL1.AUS.ADVANTECH.CORP>
Message-Id: <WM!045200bfb0110516327d0ae2524b3ef85289c0970f8862a128cf0f640730093100c770eaeaed67dbb4e4b439e95b4165!@dg.advantech.com>
List-ID: <linux-clk.vger.kernel.org>

Hi,

We found a possible regression issue (not seen in kernel 4.7-stable), which=
 has to do with the new NXP commit ba7f4f557eb67ee21c979c8539dc1886f5d5341c=
 when we did a DP test (1920x1080@60) with clock source PLL5.
The DP desired pixel clock (148.5MHz that is calculated from the input of P=
LL output frequency) would be correct again when we reverted this commit.
Could you please help check if the commit has the side effect since it woul=
d have impacts on our on-going project when it requires moving from kernel =
4.7 to kernel 4.8 or newer version?

Please check the following URL for the details
https://www.dropbox.com/s/7wc5jdp8unlsiob/possible_regression_for_clk_imx_c=
orrect_VL_PLL_rate_formula.pdf?dl=3D0


Thank you

Cheers,
Ken Lin

--=20
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.
