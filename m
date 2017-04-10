Return-Path: <dcb314@hotmail.com>
From: David Binderman <dcb314@hotmail.com>
To: "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@codeaurora.org" <sboyd@codeaurora.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: linux-4.11-rc6/drivers/clk/versatile/clk-icst.c:290]: (style)
 Redundant condition:
Date: Mon, 10 Apr 2017 08:27:07 +0000
Message-ID: <HE1PR0801MB1865E109A0F06F599FA02A3A9C010@HE1PR0801MB1865.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>


Hello there,

linux-4.11-rc6/drivers/clk/versatile/clk-icst.c:290]: (style) Redundant con=
dition: If 'rate <=3D 25000000', the comparison 'rate < 29000000' is always=
 true.

Source code is

        if (rate <=3D 25000000 || rate < 29000000)
            return 25000000;

Suggest new code

        if ( rate < 29000000)
            return 25000000;

Regards

David Binderman
