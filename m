Return-Path: <dcb314@hotmail.com>
From: David Binderman <dcb314@hotmail.com>
To: "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@codeaurora.org" <sboyd@codeaurora.org>, "mcoquelin.stm32@gmail.com"
	<mcoquelin.stm32@gmail.com>, "alexandre.torgue@st.com"
	<alexandre.torgue@st.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: linux-4.14-rc1/drivers/clk/clk-stm32h7.c: 2 * possible typo ?
Date: Mon, 18 Sep 2017 16:37:27 +0000
Message-ID: <HE1PR0802MB2331E50765AE7D68D32A85759C630@HE1PR0802MB2331.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Hello there,

1.

linux-4.14-rc1/drivers/clk/clk-stm32h7.c:387]: (style) Same expression on b=
oth sides of '&&'.

Source code is

    if (gcfg->mux && gcfg->mux) {

2.

[linux-4.14-rc1/drivers/clk/clk-stm32h7.c:413]: (style) Same expression on =
both sides of '&&'.

Duplicate.

Regards

David Binderman
