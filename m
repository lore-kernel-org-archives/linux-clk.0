Return-Path: <linux-kernel-owner@vger.kernel.org>
From: "Ken.Lin" <ken.lin@advantech.com>
To: "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "sboyd@codeaurora.org" <sboyd@codeaurora.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>
CC: "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Peter.Stretz" <peter.stretz@advantech.com>,
        "Peter.Chiang" <peter.chiang@advantech.com>,
        Akshay Bhat <akshay.bhat@timesys.com>,
        Jason Moss <jason.moss@nxp.com>
Date: Thu, 6 Oct 2016 16:26:30 -0700
Subject: The possible regression in kernel 4.8 - clk: imx: correct AV PLL
 rate formula
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
References: <03B5A3CA1724CE4EAC32B27E39292A677FC5A390AE@AUSMAIL1.AUS.ADVANTECH.CORP>
Message-Id: <WM!ea1806249edeb2cf70790bb7482fb813b9b7cef636576d9ca4b01897c8831c3650f71356a13ce9ba5e358a69b86f6a82!@dg.advantech.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi,

We found a possible regression issue (not seen in kernel 4.7-stable), which has to do with the new NXP commit ba7f4f557eb67ee21c979c8539dc1886f5d5341c when we did a DP test (1920x1080@60) with clock source PLL5.
The DP desired pixel clock (148.5MHz that is calculated from the input of PLL output frequency) would be correct again when we reverted this commit.
Could you please help check if the commit has the side effect since it would have impacts on our on-going project when it requires moving from kernel 4.7 to kernel 4.8 or newer version?

Please check the following URL for the details
https://www.dropbox.com/s/7wc5jdp8unlsiob/possible_regression_for_clk_imx_correct_VL_PLL_rate_formula.pdf?dl=0


Thank you

Cheers,
Ken Lin

-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.
