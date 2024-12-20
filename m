Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2073.outbound.protection.outlook.com [40.107.21.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A2B7DA6C;
	Fri, 20 Dec 2024 05:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734671451; cv=fail; b=FSnyK8jPbeGBFvM38FzCnYyr69GtWRi56sBNE9Hx14DuiwugRA/HuEPXIMhfwCO88p7njvEbK6NwrabxtUShLPWqjFr0cdFm2ZdeM4xu3bNbQdHo4pg8nzJl9qu6XUsKZeleq8ntnKvqKzvpB9pe5/3mWibV6XHWrNe3LNhl6fA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734671451; c=relaxed/simple;
	bh=zRpCTy5Daj5Vd1e45eOfSsyU9UlIvRhWlc8AueNnrEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Z4IS7kaE589inrGNuf1Pj2qmMFUH0bkn+F3EDo10Ep0p/iVwWj/xRhVMqyCNb1i5Qo1Z8t+V0v+9Cs7PUgRjx+FpbZMTExfjz4H0ndjPhI5CR+PYQOU1Vdo2pik6btzIMdiuxz80roP2TekUeevFRj5De8UQqiwpj0fdV/afZWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DXyjVjHp; arc=fail smtp.client-ip=40.107.21.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DXyjVjHp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RO9muhKXObSRA3PbMeV+d065jYT1Z047P4/3bwX5naG+S+3bw+85SjVS46iLdTH6rqTgQD5AHf5WHvXGtLK8pP/x3NjWco5uoNoLesO7tU0MCO3/daMz+A72+s3UHbb7O4pJrNjt8a70ijH/icsH3gv52mDJJ9XEt6A03CRJgZqVp6PtbZg3wmQndMsBUE9CuwuVtRAifAfW0NBOiYWKuvD0dueZY3wcAPU42Ip06fx6kYNvrgcJC957pCU1JUKIkjU5RJnQmZa/dN4WdsI1BQJTcJynBi1/I8u98iopyeI+9FF0+94dGm4rTNEA23H+MiBJZZbh6Hii11NAbWUpaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5tZp3yVU5FXE+Gh4WUwNb9dAja9Y7ik70Q3ovZHoopU=;
 b=FKpWiHOAGfHMyt6KGvuGFeHKWMBdV28mWS5B0CLPhRjwXg2Hb+755zaXX65Nrv8g99WNE4i7kx2uLPdo4ztKkana/Cq/uzmK1GYQiGxudoCt964DsXfWMaUE+lCr7w/s0zSbhBr5zcAWFvZxlsUbUmChdQt5f3502TrP+qkWDfWh8/zAWR0EVQdh0zOxJXDIUG9XUDoUBqsHPoVBIHwKBOt7QBEphvNp2zgE6zFM7Odej1QoPSxoCvNEm1MI+IkJwj2YUj6wcvzuusXqk8O/q0vBpFaXQ8p1fzfjpI7YkuEaD5o8+GU0EYvw/iWP96/cpxgA9H3ZINSieKOIkZ+x5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5tZp3yVU5FXE+Gh4WUwNb9dAja9Y7ik70Q3ovZHoopU=;
 b=DXyjVjHpfQFcFIJMpH1sBmZes74mrJXjDZjm9RFhQxRdIYWvkefuAdzaYgdGy0lXySsL9VCGfz+4KWOiNK1ZfeIbrf/jrPfomMvgca0wzB2nM28lSyDi7+2C/Q8ccwxl3J9Rrkpcw7zVMEdFmOz4LAKVPh4DrJYZQUcz/xUrLm2OOIyte7/nKm681JRY/s99bFpM0+IfCi2KJP3XkSKNK1Uzf523CvGOQR1222bkOV685FenTLJiDhSpKEBYA5JIOdklNhTU+TPAFU69h0HNjpz4r7Dh12FrqqUFk6Et7l1fGmHJgKWVHiCY0nbFrmSl4CbcPu3mvRSKeukQ3+MSRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI0PR04MB10232.eurprd04.prod.outlook.com (2603:10a6:800:241::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 05:10:45 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 05:10:45 +0000
Date: Fri, 20 Dec 2024 14:16:13 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Abel Vesa <abel.vesa@linaro.org>, Marek Vasut <marex@denx.de>,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] arm64: dts: freescale: imx8mp-skov: switch to
 nominal drive mode
Message-ID: <20241220061613.GB8295@localhost.localdomain>
References: <20241219-imx8m-clk-v1-0-cfaffa087da6@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-imx8m-clk-v1-0-cfaffa087da6@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR06CA0018.apcprd06.prod.outlook.com
 (2603:1096:4:186::8) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI0PR04MB10232:EE_
X-MS-Office365-Filtering-Correlation-Id: 401f72b8-a021-4e8b-d47d-08dd20b4a86d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0x6/zvb8Fi3etEYH2MsQb0cCMoNXqkQkR879JhaUoPS6OZDn6KwwZMXnPpnf?=
 =?us-ascii?Q?Mqsjt3+hRdfIPlFKDvv3ASJdVtbKTxx10sQ+LQ3kYCbiA0X1Od/SN9AZUDBP?=
 =?us-ascii?Q?dQFJghUfnRs5Mwde8/dacEayTHCtSbLvY3D+WpiG5svw4s9S/yObzpdsmPGr?=
 =?us-ascii?Q?o1aXsk8KdU/rSxiFUe2HNqXiNEr/y8ruz9VOOPVlsdDokAnH7cu2i41jSxrn?=
 =?us-ascii?Q?9U1sprcCmPj/hfNJ19FC/JEEl9fh4FKlzMEijuL4TFDZP0zxeWYmutzkOAph?=
 =?us-ascii?Q?h1kqAsB6/AoN2qKi20r00URo+aFBwrjRTQ0OjQ1riHqiS9IgPYXTTaJl3VeK?=
 =?us-ascii?Q?7+1c0ohXLR7texzyRLtJ7A/obCdqZcg/rQJTBi8umTM+lqb7xclXWeHNNloG?=
 =?us-ascii?Q?cyLNG5IK3wERl7lpPPLLR8EPn0Dq2IRpCuOmL7sWe48xeVl+ykIqNnvjq+nB?=
 =?us-ascii?Q?azMP78ON26GnACs4fwEDpYyYT9F8luKPN+sB+S6WeDhQO2UmKiJaHgHK38uS?=
 =?us-ascii?Q?1xQTWEeKyShn4T1Tj53BndulHmvkIUGVSwFiIVqAqRS61r53CT8oaL3Rmj+e?=
 =?us-ascii?Q?rMsvxziQDbDYOwsrOjErhdCIPU9cGutDiLwN2fOBbxdBU+dbpgZ9NfWCVKqo?=
 =?us-ascii?Q?hiPCJpv5maLlC2VqBWYePkMJNYsAyUbGBy0/jVW+etB2ygp0/D04JKQB0/u+?=
 =?us-ascii?Q?0lVGAvECjwpKFOu9nuBNAyY8G9ZQ4c/RfAJ+2DtH3NDXRr6Ey4+mkKxuectv?=
 =?us-ascii?Q?vLasJn+JlAwWoUMK1f+F+BfiiMiyJLxoqUEfbsXSTfKQHKPhKK0KIEnsqsSl?=
 =?us-ascii?Q?tp7scIm3ljnr1k0vMg9rSXAnZJMuyQSTleVFsu+6It5HHDnT+evR1/exOzVB?=
 =?us-ascii?Q?tZxJrhGpnGyPXF+apxpbG1rEX0lUU/3A4+lG9Ur1YWD7fuqDnLdqaMU6no4v?=
 =?us-ascii?Q?VluH6G4D1q0NTtXpbZy8O8Vr2QBIJIwyW6lwLgAWsUwEEOKEP2eqiZ1/6Uyp?=
 =?us-ascii?Q?1DeQwWrXg3KfW+bA8s1EXK7FcplUm0Y89RGrg75fi3h/78QiMjGO4akTUdlx?=
 =?us-ascii?Q?ryiMuiSZiu1mXuh3SvAxTiO++VObXR2IqX31MeRdm1IXZ7WnwvXnYqRTJF1/?=
 =?us-ascii?Q?aLBoTG6bvPW3WOSjVGpEZsg8XNAx2WqCokTBLLggxYNI9CLaaexntBFQ+khf?=
 =?us-ascii?Q?RYe2tEz8Ga9Dm6ReVI0ojy3zxq/PXyq29lMuP3ZPfbgJr3TSidBI3bifVb4Z?=
 =?us-ascii?Q?tizeEiG9tbqMlPm3TAA5TCArLWJep2jxlwvd37oDLm4m4GtvjQYSF9Qjv09K?=
 =?us-ascii?Q?Q5RJfSP9GdlgmmVJBJ6gXIZSqtj9fuPzhmZCKtvLbE/dd/2/5Tahnr1tSh84?=
 =?us-ascii?Q?QRPDbkItIqkyIVsWDEEdIMGTZsCw/HUvSKrOKYyuc0Q45NYyH0FEoBg+vkjJ?=
 =?us-ascii?Q?x9eXehSvTYhjTsyapDxsbNpAUwj3LLj+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3Wjrby5ff6HACuoK09Y9xJhPdJhFbvz5RevJx4vsmC1FIdAu3Hwcc2RpLjGa?=
 =?us-ascii?Q?R7XMM62RY7pdwAfqAlAh4RXX3z8SYv9Ic+icJ3RCqpg9T02M/or2h6qdg1Fd?=
 =?us-ascii?Q?agaczWIj0mFa00oH/+Go1w7CztXyyvJmodbik6r98d/3i4w8jtFiXOTIa5kT?=
 =?us-ascii?Q?cZMWOBMVywKmVass8f7Om2UZgsNS0qdZLpeN/P70i2Q527DQhjw6oDodqih0?=
 =?us-ascii?Q?RS+FuFj8jwQokFjZX5IitgK0huxfLHhx6VJwJEe2fFrRvyo9LX5xnnCDn7tm?=
 =?us-ascii?Q?lMlmEoRau8pSU/w3QKiOC8M1QNIZYi/COuTeKvVuLjsoZV8U/TMwYIOXmb7P?=
 =?us-ascii?Q?aQhzsBax/BmO6YMrKcyo9ehwezgOk4Jyq/zGRqtmOKG190wRCZC1YwjOxHFm?=
 =?us-ascii?Q?MV3JkyUvCBNlR/P9BMYrc3J4kslxXyssY4O8t0bEfYXrZol+vtHsn3JdaKOt?=
 =?us-ascii?Q?RabAOUAsc6celPf/wlFnAPwg3zHNrSZNPh7XGOl1mssRyUddfu6IC1HXzTQ7?=
 =?us-ascii?Q?Lq8kZlk9u3QTp2+VVvsKOf4xHnjjIkol+yUHjNwSjPQpqiC3ys74OxB11Lvp?=
 =?us-ascii?Q?jrzpHjR/4+KFEQDW2opiWZibBbifiYbLTPoWtB9FeZV02erIDDHb2U7q6pMx?=
 =?us-ascii?Q?HzNzNrpeSNjrNhIcNhLCZjGEMmrNBnQ15kBXSeXHom/kT2FFl9golIhslc51?=
 =?us-ascii?Q?ZyNexpMTWgFl7OrZnmnDIMkQ8YUJY13S3YaGxfOKrRWIwzGu7q0kaVvKb8RC?=
 =?us-ascii?Q?utRyEl7glQN6UtC+QjA9T4TASVCLvoa+6kxXJAsr87BP2NukOtx9v98+zQ9I?=
 =?us-ascii?Q?etkBfkyxO4X4KeKeyU4kLi3AjwJZkaq2lMdLCGUJKvk5bL6IjoscTXGzbXjf?=
 =?us-ascii?Q?V3iOCK8gP79HfxZrvofRXeU9e/JZOzs1uoettxDqeTF0r2FwKph2S9byL4/L?=
 =?us-ascii?Q?mVouBnuAOYdmVdFrULjMZwYqGcSDgCWmp4Wlyrys0kqpn1bV4LyFUASni+OD?=
 =?us-ascii?Q?HcHmjWTv2eyKNv/9pMYx3gz0zi2Cbs6mxBZX+NVnkPTLPzk42pm2APU0cEPA?=
 =?us-ascii?Q?RlNTmXycU2nP0i21GMHD4b740QT4xDMVJi8I398oF40QgUavFolmT1bDYT5X?=
 =?us-ascii?Q?QiXgjvbcGgXt+cYZVSelT9TDiqOZr3BBSShk68KvhK9eAf2D8zc1OYnBvRe2?=
 =?us-ascii?Q?Civ30AnKgXwoDkOIFktS2BB3OixZ2IrSx+/H9gLtyP4T0HMzZ5IJ/FIoQL9Y?=
 =?us-ascii?Q?2yws9KcgpvUbfFoEwxOsKksPpfYoLBg9rJynZh5wbkc0kirPBYZ8e7y3omC7?=
 =?us-ascii?Q?nIvxJUgNHc1YmV6bHCbaojfdy2CTvJXcEzmTxSV6Ts+aOCGT0lOa3U+7UFAI?=
 =?us-ascii?Q?gC+wjNcp1mV11ICOlnYZYG6l+E5q+Kg7SNeFBEWeyFg7kSVaW7+VRMp+0lXD?=
 =?us-ascii?Q?b/KgkXp2ORdsmFBH8g4oj1CbYKBRv0TXhVPeldSP5QtA+qJNXVe6beMFmc1s?=
 =?us-ascii?Q?qOK2CgrsH4NJFVt6S+iOIiLYLv22vKJZdMUj1KwvAutKG2d2nCS4W95fOea7?=
 =?us-ascii?Q?Q5RvO0+r2mcrZFwbW6IK3TUdjd2CU2tNqA6rFhvX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 401f72b8-a021-4e8b-d47d-08dd20b4a86d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 05:10:45.1014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xcfhmlGGgRpvGjXZsKCt69h4fJ0+rwf6S8/LkDE8d2KwcF/9Riq6FtuPOyW1SKkNQI3gmKbqUfqW0eYCjjil8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10232

On Thu, Dec 19, 2024 at 08:27:31AM +0100, Ahmad Fatoum wrote:
>Unlike the i.MX8MM and i.MX8MN SoCs added earlier, the imx8mp.dtsi
>configures some clocks at frequencies that are only validated for
>overdrive mode, i.e., when VDD_SOC is 950 mV.
>
>For the Skov i.MX8MP board, we want to run the SoC at the lower voltage of
>850 mV though to reduce heat generation and power usage. For this to work,
>clock rates need to adhere to the limits of the nominal drive mode.
>
>This is done by this series: A new imx8mp-nominal.dtsi reconfigures
>the imx8mp.dtsi clock tree to be compatible with nominal mode, an adaptation
>to the Linux clock driver makes it sanity check the actual clock rates against
>the SoC operating mode's constraints and finally the Skov DT makes use
>of it.
>
>Actual configuration of the VDD_SOC rail continues to happen prior to Linux
>as well as PLL configuration that needs to happen earlier than the kernel
>running. See the corresponding barebox patch series[1] for details.
>Note that the barebox series didn't yet include VDD_SOC reconfiguration
>to 850mV, that would follow once the kernel changes have been merged.

Good to see this. I had same plan to support i.MX9.

I see you introduce a new property, how about using a boot pararmeter,
saying "mode=nominal" or "mode=overdrive". Then drivers could
act accordingly.

Regards,
Peng

>
>[1]: https://lore.kernel.org/barebox/20240503103717.1370636-1-a.fatoum@pengutronix.de/
>
>---
>Ahmad Fatoum (6):
>      dt-bindings: clock: imx8m: document nominal/overdrive properties
>      arm64: dts: imx8mp: Add optional nominal drive mode DTSI
>      arm64: dts: imx8mp: add fsl,nominal-mode property into nominal.dtsi
>      arm64: dts: freescale: imx8mp-skov: fix LDB clock rate configuration
>      arm64: dts: freescale: imx8mp-skov: operate SoC in nominal mode
>      clk: imx8mp: inform CCF of maximum frequency of clocks
>
> .../devicetree/bindings/clock/imx8m-clock.yaml     |  14 ++
> arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi  |  64 +++++++++
> .../arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi |   5 +-
> .../freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts  |  19 +--
> drivers/clk/imx/clk-imx8mp.c                       | 147 +++++++++++++++++++++
> 5 files changed, 233 insertions(+), 16 deletions(-)
>---
>base-commit: 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
>change-id: 20241217-imx8m-clk-9467763dfcd8
>
>Best regards,
>-- 
>Ahmad Fatoum <a.fatoum@pengutronix.de>
>
