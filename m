Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013054.outbound.protection.outlook.com [52.101.72.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E624E15ADB4;
	Fri,  6 Feb 2026 00:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770336677; cv=fail; b=fVBUoOsslMgxWLvlmvFTLbx9fceWRE5OZ4dSDl3+sAmgrdOHiiMjqc4nPyevG/F/irxxBuK2im0cN9UbvkDCGf01eMAhQOmJgwsR4I+GNgPFrQ9XFstdQpZNUoxovu8sCF3vWxEWNJv0iN9ZNqBZ7GhuzmUnklnyW4bSHa8zKd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770336677; c=relaxed/simple;
	bh=GNSv5OmZ9Tlv8JvHKwqJxNY5nxREpqBY+WKHZpUvPuM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=f/S7kiuCRebsEUUAsMSPakqzyTmyINlaNtavkPRhKtviyroarzWuo2pvrC++/s7MifDyboIEBoXEXdcIWCYTuYCdEDTh8ZchtM3qYJzfCRShdyqXEsjnZ2xTmsFBWKoOxFUFEo72nOQVB8YXKXLK7MqFjSLePe5fTG9fLajvPpk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jH4KR77T; arc=fail smtp.client-ip=52.101.72.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jH4KR77T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ABms9RLC4paailqVS6/WVLBee0LpQAOEizM1J/Ak2ErjS32kMagtcTkeVMMww1oXQm5jPV9SaqL6u9Z2uTxjavMUWUmxKHtouLAJCtjkUgtxSBQNYY5Q23y9geyr7HiCb5XzzGqFlhnUpfi8y84ePbN3lkucEmgPqDZqdBjoR1CAoatubJeYNobPZTfhO9f6dRCJBISACxRAiBEE9xTTUEUYYh9NEnqdhqLdP+Zfb8+8EDQh0cGe8AGl6g2841e7Hbm1YG18mHwZgTTEDyL0Vc5QSjSlTvnUJFQ1XMglTw8m58fV6E4rd2nMQ6Qj3rVS4AgBTeAhCtGYMnNsG4rwvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfeRaD8GQllPFKvIVEUXK2m2msjCiurgcjviSoH1Xbo=;
 b=FM7eLQ15OmJSIx887R/K0DaNG2aoDaTjn3t9shnr9SijlJP861Hej6WFtvxDurmnXXOJa2paiyMOYHnA72IbY5Rr0Ucwru1ZuIbmxP0EI07ybGiNg6rrz9+uKB28sjIIWw+2YMqerVtoUPeYbQqMbAwvG5m3UBX7unSlUnVDY6GuYEv0D31DmMkIKMGogGdRmzqQzXGdR2YTTL2kZnhWvA72yLjZtv/h3g70lJdxU+XOLYfcJdlfqlKfpXB0sdfu9N6RBnVOjRajnKN4IlS9i9p1Rc5wDbsUETI6mZx6E2KxfdilY/itaC95kVIIUtM3Q3bL4p5FHhA7jMYYipqRLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfeRaD8GQllPFKvIVEUXK2m2msjCiurgcjviSoH1Xbo=;
 b=jH4KR77Tp30HIoPukq7rDJZlNdXpecSG8QAhVr+mzHWyV9A3Mds+XxF6S/ccZHvrNWg67SU2s/9QMiT7Bz1F/cimkcpA0vSl9V2TmXatEuwssnsrxJpcOwPbpOsKddztHlITQIuBbFQQUjR5rdqeNzJMaZuNX48gDwgpUvFEMyW90RpcX02qCcQtIp1bujoFcrCzDty0HKFMjnZjI83IJD4rcE8gx8LieN98kulkm301bEdikOZWut0ACIrjyw/58GP1tZQVSTJCrpRzUGrsns3SD56CVYzdsnF7CJyBvntLGz918f3WnlEr9BGsKHoO1RGGNocHN7aEWV5f43Hsow==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 00:11:13 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 00:11:13 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Felix Gu <ustc.gu@gmail.com>, Abel Vesa <abelvesa@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Frank
 Li <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Lucas Stach <l.stach@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>,
	Akshay Bhat <akshay.bhat@timesys.com>, Ranjani Vaidyanathan
	<ranjani.vaidyanathan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 0/2] clk: imx: imx6q: Fix device node reference leaks
Thread-Topic: [PATCH v3 0/2] clk: imx: imx6q: Fix device node reference leaks
Thread-Index: AQHclSS+QdwHmUB70keuaMcGCoIoEbV0z8tg
Date: Fri, 6 Feb 2026 00:11:13 +0000
Message-ID:
 <PAXPR04MB8459FEAF3D171751E3A8E0F28866A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20260203-clk-imx6q-v3-0-6cd2696bb371@gmail.com>
In-Reply-To: <20260203-clk-imx6q-v3-0-6cd2696bb371@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AS8PR04MB8833:EE_
x-ms-office365-filtering-correlation-id: 4ad9abfe-7149-4cd9-ea17-08de65143d63
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|366016|38070700021|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?d6DPtF2ip4Wn0vX3OXitKy4NwSk0Ukg9uf9+Qq29Vuzee5FWMePVAUkUFS2E?=
 =?us-ascii?Q?WiOGgx612oC1T6q4OyplYx90XZKUspkVG33DdF3CssMgJbjSxRWz2Ifd3LkS?=
 =?us-ascii?Q?bhin5moBLkeCkpD/kxp4wMis2eQikVYBB5TYy0SsfcNFGSkJyLuq0WI1MLVg?=
 =?us-ascii?Q?U/Ft0XyKeSlRwpbyiVsrVmiUHvqPcAT7piz5ISSTF8Eg7RTFmEEF3iH0SlVw?=
 =?us-ascii?Q?mB4NEE9jG8Ds+K5hf/zymeWPEYOpUEgkkt8IUC88enwyAOtBCWSVACOsf4LC?=
 =?us-ascii?Q?2Thfv5UG+mUBSWRVc431ZqNEKf15mTiaFLeJtaGLzAcjp97ROx7uZHFUfkzO?=
 =?us-ascii?Q?WfW+FxGmTD6W33ED1Mm1PMPb/SHJKuGSMeYk17itOvKQo35lKPoB6K926RWp?=
 =?us-ascii?Q?KVq5VpREciPLBT+X5zNld45jdcaAcZwFKWvSTlS3mQmu8x+9C6F5x3hEnHok?=
 =?us-ascii?Q?3nwcEfM2pERrBVZ8aKz3r6dWJZXWvBeO736+KkZmhdNrOQcgjMPZ2OnWqibG?=
 =?us-ascii?Q?r9XEEsAdtd+XteBad9VmwvxswstugM/DZsl+kKZr3eYAX/zlnl5gCWkoBb6O?=
 =?us-ascii?Q?KGBm3WWnuryNT05D0kuumM66rcn6kISfCxpHFK0PyhXuWo8gFO4HGra8B19a?=
 =?us-ascii?Q?/wO4ROzNrMZqqwKEJ885fl1VJMag1p1s+lvSQCbLAPVoXUKb6IptwWdnctws?=
 =?us-ascii?Q?dad6lHlHLKQpIOBTdLBncPWgSTUUGxCxF46qt8/jGRGfyohW9mYkst/tTQFs?=
 =?us-ascii?Q?D4JskQE7wn2nbpm+AYUhai52PTzLpK0EkPWQpHyLuKu2p2gB9YpeegejQN5o?=
 =?us-ascii?Q?w2dcuT6VDGteKpMmY/fjr7aGETgyvfiak55bGDH7th/noK5CYVWXCTksLQiw?=
 =?us-ascii?Q?dLn5FM7tq/sKATvVXFpybGa278Ji6C6vx0NZuwKT7Zp4XnNIgz9FtQ6h3Nnk?=
 =?us-ascii?Q?MQLzCxdewa6l9RPhLFrCBqCagcqIEL33SJAGkU09pCHY+b02jrrlf+Xj/zpY?=
 =?us-ascii?Q?9cE0Kst0SoNrV40zTgot0FRn3A8vkI3ZvPPF3SxJJjGvNXIowlLUMmIU0r7C?=
 =?us-ascii?Q?nD/c8Q4jqPrhqtpqbnJKVjpE7IoH030twNkk2cuP2JWNGzeIyt0NMUGhQSAc?=
 =?us-ascii?Q?yqHHYhEDSxnvNUYhrPaKUU4yWn4kIDpjzag8lW1Halj2U+TdfR3yyc2csXXa?=
 =?us-ascii?Q?D7rkcpQTUML9Ys2mT+XGP5Dd04l04gu0FHD75oErB+86LgI+d+LwRkNXczV9?=
 =?us-ascii?Q?8QtGxa1vHQZ5YP+8Mak1tf2y9eIt0ln21pMumg2cz20NkYBM2ujQxnXJkuFw?=
 =?us-ascii?Q?etpICfes5QX9kGPT3QZGwsPDtG20hpA2kr8VyuWVQ9gSsOG0rp5nEY5dgqUO?=
 =?us-ascii?Q?pS60uLV8iLS6vsh79gg9v+QClWhHVwSR/+jwERHiYY3T0v1vGrWdL7SqtRRT?=
 =?us-ascii?Q?TdAkjomHMnPeB20cJqjPqnf6c1D1jxk9q7Xth1Qy049547BmrUA2kgt32Hun?=
 =?us-ascii?Q?8hNBxgz3IReTTYEkM7uNTE9dftLFOwBcD8cydzHBVlIdIavXRMGb+lYT5lKQ?=
 =?us-ascii?Q?ciAvCJ98hXryxXTZx3ENeLdeAWHUP3sZNHnRq4Ld/+AzLqMyCtLPXtPVuZNd?=
 =?us-ascii?Q?V1aOta9wn7bTixxYhWrMm8H4iYx9XShOouGUDnt7aIqI?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(366016)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?R91iaReZgX0RUdlts9rgPmR1Nepps1G0zf/HEnVHuTVvTaQpTAsWYXJY81gq?=
 =?us-ascii?Q?Ti9xtZivVait0ByNu3as3w5iou+UwfZ3hDHAZqH7Rw/WyjYIOmmW9pB53eqt?=
 =?us-ascii?Q?7HlRk3CeLruobSQmPWf3rLschWLmUIFe6OpxozA1yrVjBTS/z5Yvs6Y6eoDw?=
 =?us-ascii?Q?7ykhv/hTE2ywYNoNBS9CGIRDS4QaOoQCQJNOPUHIPYXri7gjuJarb5iEdsg1?=
 =?us-ascii?Q?qFzt6Kb1pBBlLO/Aw11IiwNGVuuO9jvATFXcMWibZTTqhvDMX4XWGM839ufd?=
 =?us-ascii?Q?ia7BSsf36KPCAxwcmhjcPIIjXj704QGuiQBuKeGYS1AXOKf7yotRIewFlNfK?=
 =?us-ascii?Q?2xaIKF7K5UVKFw5Fyn1setzeyrx8ms1O1zlsIfLclrNt5RBJu32LjMfs8V50?=
 =?us-ascii?Q?RkXIJdMFkWqrlpJcvonSI2EPuVuJLp5mX8yUsygRMVlRvWiiWUZPIvuUsse6?=
 =?us-ascii?Q?45EDbQAvgBa/MOJtIRkyqzMDfStAGqU2/W5Es97/eRGmgxLzXR/Fu0QWDpy/?=
 =?us-ascii?Q?JlP4qf0cFstJ9ELysV5wUp59ZqjoCo5y4F8/M1kb+6B/GUUo/NLauT07QrEC?=
 =?us-ascii?Q?T/A1+WJ8ECuCzrdWcQE4bcQY6OmTFpPujQ+oPUFRJRMlmHQeqFTI3uxhuB3I?=
 =?us-ascii?Q?WfmNNmxbIm7nLLOsW/HiGnH8YkVNp1CW534M5EbuI6Y8CEcKt7YyDaMHoMHC?=
 =?us-ascii?Q?egRhuzTRWYJspUsgjrnF1r5k+6CDkPnPJcEQ46qzDsadrNtnDF829UIEcTSo?=
 =?us-ascii?Q?rH0ej+Z6r8PGx9yS+cCOmM7lABvCwu1rkc9BdJKmq+ozls5THL22evxiaxbn?=
 =?us-ascii?Q?udM3ycdg78gRYTr7Yy/fmc1YIbMJjyR8FTaWrb+GZSOOiT5dhrKSqu/apTiz?=
 =?us-ascii?Q?JIhDSRa/XwTI1Pc29bGDn3aXUxDng25qRwY75n4BoIJdhWIrq98wGOIQHyQd?=
 =?us-ascii?Q?+8EdnPbN/mfTgnkQomlMaueagUBmYCW2VSG/N/lhESLamOVbkPN2OC/EwKnj?=
 =?us-ascii?Q?1XStbrhiJWEclXQD/gIjy52fqVjJIiL+sr/qFQUlrdywpy9p1jRlEAyHhF5k?=
 =?us-ascii?Q?OdkPFAEKO98Yx5/lHZzJ9W25ozrbD3i9K7+oy7DdhTLgsvMN9/0ZXMhE8ngH?=
 =?us-ascii?Q?SeVHYx2xdpmVsrjSG5J2Daj7Ho/zJ9ib6QehLGNHuiwSXsnColaC91XxsN1l?=
 =?us-ascii?Q?/Ce/iOcmesJUEKvX6jMg8qAJF88+zs7AlMtzci9eKYGdkihee2qOxW94xD2N?=
 =?us-ascii?Q?2dU/s5365I3y4eWoGmxAPiqQ1Rr8F0t2M8pOili+lmB7+XxbSDpntS2815pP?=
 =?us-ascii?Q?pDLBPnTPv/Y4clHZlB5aCFm75bt432d+bdGtnxzWYbM5chd+vJ1WWj+kN+QP?=
 =?us-ascii?Q?fg7qr3QQW5R/8EQtuuiXJoB270u1MZb8FeTDfhD3HgQ9js9sp9HvhwAFZMBV?=
 =?us-ascii?Q?YW/MhPiX7pPwo0jLvJeLQXoplJBYHDE0ppqdX1a/HdEvj2lMMw2oVsGHjDTE?=
 =?us-ascii?Q?weZ7kFWD6infer9F7zSY+MxCD+apvaUROXcscSvkBqsEzKxOdniUjlV9YqPp?=
 =?us-ascii?Q?UsE0o7fhoqjiJEfEnoAlui1Pbn+maasLP/9U8ipKqskZU+px+LtdzXQ+1bJy?=
 =?us-ascii?Q?vcOwq4XRMpoRlsPH9EBnQZaN/jlEH/tMdOEuXZIZUWVMxISlI2TcWjk4sdhF?=
 =?us-ascii?Q?sMHEbODFt6guQf9Ben+5OBhtBzXmtKcyavUGOPW4S69eLa5H?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad9abfe-7149-4cd9-ea17-08de65143d63
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2026 00:11:13.6714
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nl+cb2Yn2vtjcA+6/uyptgkdhTgKuxYa+I9YUsMpTqaY/NVekDykAwnGFiTMCHIu6imJqI6s2r+9Zwms3xozrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8833

> Subject: [PATCH v3 0/2] clk: imx: imx6q: Fix device node reference
> leaks
>=20
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
>=20
> ---
> Felix Gu (2):
>       clk: imx: imx6q: Fix device node reference leak in pll6_bypassed()
>       clk: imx: imx6q: Fix device node reference leak in
> of_assigned_ldb_sels()

Reviewed-by: Peng Fan <peng.fan@nxp.com>

>=20
>  drivers/clk/imx/clk-imx6q.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> ---
> base-commit: 33a647c659ffa5bdb94abc345c8c86768ff96215
> change-id: 20260130-clk-imx6q-9c4b8835fc26
>=20
> Best regards,
> --
> Felix Gu <ustc.gu@gmail.com>

