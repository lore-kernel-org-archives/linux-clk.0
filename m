Return-Path: <scott.wood@nxp.com>
From: Scott Wood <scott.wood@nxp.com>
To: "Y.T. Tang" <yuantian.tang@nxp.com>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>
CC: "sboyd@codeaurora.org" <sboyd@codeaurora.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3] clk: qoriq: added ls1012a clock configuration
Date: Thu, 24 Nov 2016 08:21:15 +0000
Message-ID: <DB5PR0401MB1928925ACE6E6E066961C64A91B60@DB5PR0401MB1928.eurprd04.prod.outlook.com>
References: <1479955015-37514-1-git-send-email-yuantian.tang@nxp.com>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On 11/23/2016 08:50 PM, yuantian.tang@nxp.com wrote:=0A=
> From: Tang Yuantian <Yuantian.Tang@nxp.com>=0A=
> =0A=
> Signed-off-by: Tang Yuantian <yuantian.tang@nxp.com>=0A=
> ---=0A=
> v3:=0A=
>   - rebased to latest kernel and re-sorted the code=0A=
[snip]=0A=
> @@ -1316,6 +1334,7 @@ CLK_OF_DECLARE(qoriq_clockgen_2, "fsl,qoriq-clockge=
n-2.0", clockgen_init);=0A=
>  CLK_OF_DECLARE(qoriq_clockgen_ls1021a, "fsl,ls1021a-clockgen", clockgen_=
init);=0A=
>  CLK_OF_DECLARE(qoriq_clockgen_ls1043a, "fsl,ls1043a-clockgen", clockgen_=
init);=0A=
>  CLK_OF_DECLARE(qoriq_clockgen_ls1046a, "fsl,ls1046a-clockgen", clockgen_=
init);=0A=
> +CLK_OF_DECLARE(qoriq_clockgen_ls1012a, "fsl,ls1012a-clockgen", clockgen_=
init);=0A=
>  CLK_OF_DECLARE(qoriq_clockgen_ls2080a, "fsl,ls2080a-clockgen", clockgen_=
init);=0A=
=0A=
You need a better sorting algorithm. :-P=0A=
=0A=
-Scott=0A=
=0A=
