Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013045.outbound.protection.outlook.com [40.107.162.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11257307AE3;
	Wed, 28 Jan 2026 04:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769575820; cv=fail; b=H0/9XomXqFGVBqETETvCFpL4003q/S0OBJ/AA2SvKFJVTCZYcfRnuzFMsGwS6E9+TS22CtQP0N3e9WzusplBQPVk8IBR1rnprLhGAFlp0KvyugtmQqOjyCIHfR/LVTDKlubeUlIlgrhIeMgGpmOIZA6WZywT+QEppSOZTkLdQkM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769575820; c=relaxed/simple;
	bh=Q8cAAWfrOLSAyNoLK7CvPy9O4DsFxYVzU74JjJM+p4U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NlogEpQgqyLVh2QUfvXThfMC1TWn8pt+R5SvGKysIcRsgikbP388fCxakllbKzOtUebgv7cDXbO7vBv5biTsKsSRGU7jdNxrWVUa/Robuhh1aglZpUG/+Ofd8Gd2tLyjyUUcLGU9Yby+A4Qk7lNrld0wowlFq/tOh6P6CPRyRcM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Hr4xQ04E; arc=fail smtp.client-ip=40.107.162.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Hr4xQ04E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FGLU64Ffrmj46R8YYBLKJnBabOMX6a8lsS1gOf4FcN2PC+tmpD56VkR37BcItp3Pfe52M92FvfaqGTZz7Qj9PuPJP0TJP+C6xbwj0VABRSt6C6pq4bULoNoEllopHA40ybwc7p9To/XFmjphoMfGWTni4GBL4YJySDBkLMuAnlrpLpEn4k14HoPqLB9wem6P93SBpewADI98qH2Df3Tb5W7UC1zzv5g80fHB37TS1AZmkNEip4pkd78tMDsyYeZ5wm6eCAzHMTW7VAuHHnq2asCeMK7qTri5PqXLKygnIKEGceK35Miw14Z6QJr4J7f8VA55hst+gTL1eczluVKPVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z1OBB/e6U/ueZNz+hZqxDkiCj3WrQx/oUnQUQ9I0OzQ=;
 b=LovEYFrH9emc3XRsVAxLb8rHrKRKiodo9eP3Rwd2WasBZKknMc2ZgKC/i4BYwQwkYxg4JKVz4LmEqsU31H93l0HT9Eo9KLieqUEtg4RC1CWJAoHtZQZ6bLexEnL1n9fQE/x+MjK1hO0sR/uxZFs2YFpy2ve3nUAMm8wRPAzIvd8WTF9ImpSYz2X+TT66Eklv8a80zR8vS3fhoH0rMAIDzSWc4XrWFZPP2+FjMJxxK0is+E/+aYSpjQHjLXIwp7ayVDqelqMInj8PhW5fVfFjUR8PkE9r6jobWW2rUqDIwha8oByGw1Ijw5gjWj0OSvmCw0V4jGy33udkyZBd6OcV8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1OBB/e6U/ueZNz+hZqxDkiCj3WrQx/oUnQUQ9I0OzQ=;
 b=Hr4xQ04EiW7iUaj9muBr4/bNQM9lpp/Af80r9qG7qtj19EFRx0/JELAWC8ck+Ln/D7c9T3YQFjSv8PPKjFmu/jg6RCXPRqMSHuQUmFZcMvAReS3kNPwZhfPdMaqPth5xDtm+MJvmvOBqH9br685V3BfZYhXk/fu+etoFSLHW7UvOxwyVnKt7drvuTngLcfovy0Pawei/kQAoH7olw9YQMAdGC+4wB5bQ/dzpMw7ReTeQni5R/5Cg1n48Xhx95d2zNPz/MRlW/RMipag+Hfiphp5jj2X/56f6elXWOdRDE+XV2EwywvIjTlwDCsRs9m976i/V4bLwbmBYrtpoia37Og==
Received: from VE1PR04MB7213.eurprd04.prod.outlook.com (2603:10a6:800:1b3::8)
 by DU2PR04MB9115.eurprd04.prod.outlook.com (2603:10a6:10:2f6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Wed, 28 Jan
 2026 04:50:14 +0000
Received: from VE1PR04MB7213.eurprd04.prod.outlook.com
 ([fe80::93cb:5423:e3b:9a0d]) by VE1PR04MB7213.eurprd04.prod.outlook.com
 ([fe80::93cb:5423:e3b:9a0d%7]) with mapi id 15.20.9542.015; Wed, 28 Jan 2026
 04:50:14 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: Peng Fan <peng.fan@nxp.com>, Sebastian Krzyszkowiak
	<sebastian.krzyszkowiak@puri.sm>, Abel Vesa <abelvesa@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Lucas Stach <l.stach@pengutronix.de>, Anson Huang <anson.huang@nxp.com>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kernel@puri.sm" <kernel@puri.sm>
Subject: RE: [PATCH] clk: imx8mq: Correct the CSI PHY sels
Thread-Topic: [PATCH] clk: imx8mq: Correct the CSI PHY sels
Thread-Index: AQHcj+dT//pUcASL+EWJ8YPiMRWipLVm77+AgAASAJA=
Date: Wed, 28 Jan 2026 04:50:14 +0000
Message-ID:
 <VE1PR04MB7213B29EE6C74BEB0A6332AB8791A@VE1PR04MB7213.eurprd04.prod.outlook.com>
References: <20260128-imx8mq-csi-clk-v1-1-ac028ed26e8c@puri.sm>
 <PAXPR04MB84592A78A90581A65CFD0F808891A@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To:
 <PAXPR04MB84592A78A90581A65CFD0F808891A@PAXPR04MB8459.eurprd04.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR04MB7213:EE_|DU2PR04MB9115:EE_
x-ms-office365-filtering-correlation-id: f7a5466e-82b7-4f96-accd-08de5e28b9e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|19092799006|38070700021|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ZwaGEfVQRx4qMbIx3K2VYVJN7ctHg+29pRBdtJkNeYP93Jr+HI18scPv/jAC?=
 =?us-ascii?Q?JzhSUkJGd+PkNXa8L47IcLBA7iUMkaeyBL/GYr8lOvafcU3atUx3r59Bak+V?=
 =?us-ascii?Q?KxHNHOnGMH7/OTv54YgK7SgPRn1GIUALPx2LznGLIt74KgcfQ5ctV94mHHd0?=
 =?us-ascii?Q?UajDlqmhq02HAxpshRkiIKlDEXVarNjdaqghGq6xwd+3qR/nEExUjjBW4Sni?=
 =?us-ascii?Q?liXeJ1SRYWvCtBJOum2nu/4Auq8bFFpjPGz7BSEGZUvBIjojJSzgAGN4zxkw?=
 =?us-ascii?Q?5nAivcoiUuPILcMhcJ8OKVUh1RpCxQXUugTeM+6pr07pVRbqLr59z8CVX17T?=
 =?us-ascii?Q?xtQl38gV1G31vRv8qH4Xkr8RUlwHc1ZdSfgbgFQzSBn+r4lrOZbrHHZulty/?=
 =?us-ascii?Q?kMyeu7bXtemIYWq+2RbSOIWUtzOu3KBn04Mxo2WnCZj8pX+azyJdjYIIKIut?=
 =?us-ascii?Q?Ub6ELv0QxflZTP23ER1/Vu0UgyevzJR1rnLu0PJMVT53rDWbpGltTeYmG/p8?=
 =?us-ascii?Q?UkQR0RpA+h1U2BL59k3pvAvxmEj3JPl85dSiFI3Ha+eh7CgGBrgl8BPYfBKi?=
 =?us-ascii?Q?x79BbtVxvt+VagfqLKxowfup0fwGvAxuMJVB9XpmPMA2NLoSN0h/gqyAAaKU?=
 =?us-ascii?Q?GLTqKaQXQ6NVbNK5LhhFWEeo+FlOZgocvmj6UDthhkewZtGOp21CdqPBlmDf?=
 =?us-ascii?Q?QgtkWoR5ebxYeFxSdu533Wn/EzNYGATV+4tsJwJvKmtlSs+X955iIRrPfd5M?=
 =?us-ascii?Q?4sRO8hSkM0Nh5X7ofj/iYPDeMf6y6zz4UOULD+8YvSr9JUV+i31wrF06J9Gv?=
 =?us-ascii?Q?tscZDTnjKm/vkKNTApTatvVUq9bcSp5EJlOMD587hQAT4pZkhrG53im/YGTR?=
 =?us-ascii?Q?kfzp+VYd7OsQBpIAWlY1TFk81CDFKIdftOFmyTTsnKHaTEzLEJnCMu28h2uQ?=
 =?us-ascii?Q?Mh4npksdCHKXQ1nBU3QwN0moxY/MBo8YV9tZvUS+rGf0xZrw5QkwxLwewx8y?=
 =?us-ascii?Q?VUS90GHj3Ge7BvnDXvki8UoAdK40k/bOsb48UxCXAZRWeLsIWLkkkreQy+s9?=
 =?us-ascii?Q?xvL71wPF2ftHsn1zWmkQHwigo1m5BglO05GSbh9qiWdCY/jkeNPLCCAtt0D9?=
 =?us-ascii?Q?Zcq/y+0HxTpOgIr6m9Z/PaBH3+ItsZjLCct68pA/YdlOyQSBYiurIv6b404k?=
 =?us-ascii?Q?jf7s1C9WqYEb3xYUZGPUXGnSyfM7xApiLcxsLli9QpaQWFgbJmKsFyK/bP8k?=
 =?us-ascii?Q?wB+x8omh7n4RgD1ISecCX06wGlJiNzkyx1psit2yNJgtLY8sEopMuJ+cgjrn?=
 =?us-ascii?Q?Z08igoyoHHgo1RHwS/Dhzqc+8XxSuvRdildA0seOoZEOy3MjvjjCjbgwUhY2?=
 =?us-ascii?Q?1c8mNWgwKrNJkc2Td90XehRmwZPB1Gyp1a5DmV5G8+0gBekcHAIYywmznF0b?=
 =?us-ascii?Q?jARKZBZyl4v9MCbYQpPmf51SyWx6QP0Nxdl7B11XHa16PPoiRT8BW/z2LuVA?=
 =?us-ascii?Q?N6iajedShrQXsuBWBq9BzLD3UjKOQQGPtRwyBtloTJUN7SU1lfjAg7HTOug3?=
 =?us-ascii?Q?GCwUwAsc6UBfbrRhp8E8y3XGegV51H8cRZu0+eaWZiIlh9EYczUzuHl3oDdc?=
 =?us-ascii?Q?xdyAAVm8YEVXKSWbSlTOUGTuHTNMfBWDj/fm4/C7T9aU?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7213.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?sc+yZcqQV0lBrJxgmTyXBBDXEQWbYvKdjCClOBa5f7QUxTl0CNhVSL+QH5Z4?=
 =?us-ascii?Q?mGgMR9kQi/CbwICb3osc7cjcw3hGtR4pDhRhdLCTKWkLTxcYHbM75nwP1Rrw?=
 =?us-ascii?Q?SUjB60kQOzbrrk7nGi95wpPISGsn56nBbbT8EygX+iMHsGwBWa3D6r9+2FcW?=
 =?us-ascii?Q?x3PEQs9Bc8ul7pvYesjLUw2QHaKkebwGA3UOPFwFrVOS0XCtFzK7Q3ZicQfe?=
 =?us-ascii?Q?Ndfx/1QdgnfaLrqunuz1EUzkNmKYjBd0bhGtuZdbSoJi+LRzewdTvfoxNjlG?=
 =?us-ascii?Q?b+XmLzbU2Es7VzorekiP3wrUSYS4bjTF+7RpRXtZ0W7sLN01xYzUHM02Q40L?=
 =?us-ascii?Q?Q+cTjNee2DE1E3iwaZ6I8DTnhrL1tQH5qool8Nu6NZYkm0cu9Y70q0SsLqS/?=
 =?us-ascii?Q?BWm3IMnG4GpYj8f9Wnrl6bvTRN9nSoD9ShldnCgzTpqpwQ7JHM0LcBgO2dTU?=
 =?us-ascii?Q?Ea9KDf1yWugx0hcJADUA9PfVRVPEuIEK7CeT/W1qW9bdkcfSN4ocJOKOoMZ8?=
 =?us-ascii?Q?Aj76+rZUe63qY0hleWC9DTsQjrFHnfGTR96QEfSmUP8NzH4AvbkLKbyS6CzU?=
 =?us-ascii?Q?G6h9FzM21YH9KWzZJ7RHwwjEFa868Q0VrwVQkeAq/dOXvuFzjsI2WKNKGKcM?=
 =?us-ascii?Q?7JRSVGRHR2Tfr6DBmJQGj4uV+n2jqIPoQW9oT+qIFHyH++XodEeCC1KWj7jX?=
 =?us-ascii?Q?hqN9oSIzydCAoJnNaIN+6Qd9ZrhB1SvwQJImPCFWNek2DXMv797v6ESaO7/z?=
 =?us-ascii?Q?OQalFc+hfNuH/NqFwvHguOg1YZrdQqteYlyHCz+6LvvFySXM6AFYPx3jW7OV?=
 =?us-ascii?Q?cGmloKKsIkPuA/MHr1b+VgF/FkmtpgO5HGiLZ4I9ktYoEkYmf4UKAt03vWWR?=
 =?us-ascii?Q?aerCPdEOPBMulHcu7drf9NXMfynqPKuSQ8mw0fDPwutGKGFO5+nLx+U9YiX+?=
 =?us-ascii?Q?IeEefvpJ5oH/i3Q+HUALzohLq0caXNbycP1hcfB07Q5t0cvDIG+ILl9cUFBz?=
 =?us-ascii?Q?EPCVFjJMtRjMiPlWzpxBxuYZhazY9CrfwA1fNgkgh2WHUFRBqceqwHXUiGPM?=
 =?us-ascii?Q?Hh3XJtp8j+VmCd1wKuT13Gh4R3QQ/iZJL/OLK6rI1Sp7t5uIfYVbpt7jk589?=
 =?us-ascii?Q?kny40tddOURY6w4p+6T0Zly9dn7UdNTsbOAuSVwObYkOAMuzz2HKhXu3Cqyi?=
 =?us-ascii?Q?gEC66XSEbO6ESOKlK9xN9NbwEyS+Eg9p4Tte8AD2Y/1Zh/LRqg2JVO4HXgkH?=
 =?us-ascii?Q?u/l89W1FKoJ0kiZ50/+DT6RjIZuc1cHaTlTymvALfMOsx3NIYz00LNDMjsQp?=
 =?us-ascii?Q?ORg2pMrlF1+oWuUtbT6nk8XEA070AZt8OEwweIRIoJn1y8hOJLANdz5ZmbQv?=
 =?us-ascii?Q?N0yPWRgCWIdM3Uy3xjcAHUaGe2cBJoiQCNSLvs+YNOJCci2Wbe+M3Iiclpgq?=
 =?us-ascii?Q?uF3guexBM0HdhUaMcZOjZjlVnme+ELZAeQ+6zlLWhreqLajZXPZGajY796MM?=
 =?us-ascii?Q?LksbA65Q3FBA1+AYqNvIQQA39rwHReuNWttEIXlnPBMPNVXLQkt/m794wg3r?=
 =?us-ascii?Q?teEkzABD1e8WrXPLnx5Sd48wboEszEuaOXV2PLRpN5quqL8ksx5T3TMmIBfq?=
 =?us-ascii?Q?T145tJs66m5bg/+aHIauKDbRytv/Lznc4Akpy+g1KHcv4TpuWpBIBL5XhdDm?=
 =?us-ascii?Q?5DCy/ge2Aw9NKvQ7jkaUIHjNnR50nSADckXT/kTr9iWLCtCv?=
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
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7213.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7a5466e-82b7-4f96-accd-08de5e28b9e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2026 04:50:14.3080
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xACE3/SPhID6pJDfY+Aj5/bobTZTQY5QBd2OUVETzS0o9BU9lUkqoGQdxlTdxEiq+ist2b147/kuzcWUwnIAbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9115

> Subject: RE: [PATCH] clk: imx8mq: Correct the CSI PHY sels
>=20
> Hi Sebastian,
>=20
> Thanks for your patch!
>=20
> > Subject: [PATCH] clk: imx8mq: Correct the CSI PHY sels
> >
> > According to i.MX 8M Quad Reference Manual (Section 5.1.2 Table 5-1)
> > MIPI_CSI1_PHY_REF_CLK_ROOT and MIPI_CSI2_PHY_REF_CLK_ROOT have
> > SYSTEM_PLL2_DIV3 available as their second source, which corresponds
> > to sys2_pll_333m rather than sys2_pll_125m.
>=20
> After check the RM, you are right. But our internal doc shows it is
> sys2_pll_125m, so I need to check the RTL code, then back you later regar=
ding
> this patch.
>=20

The changes are correct, the mux select '1' should be sys2_pll_333m.

BR
> Thanks,
> Peng.
>=20
> >
> > Fixes: b80522040cd3 ("clk: imx: Add clock driver for i.MX8MQ CCM")
> > Signed-off-by: Sebastian Krzyszkowiak
> > <sebastian.krzyszkowiak@puri.sm>
> > ---
> >  drivers/clk/imx/clk-imx8mq.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-
> > imx8mq.c index f70ed231b92d..cedc8a02aa1f 100644
> > --- a/drivers/clk/imx/clk-imx8mq.c
> > +++ b/drivers/clk/imx/clk-imx8mq.c
> > @@ -237,7 +237,7 @@ static const char * const imx8mq_dsi_esc_sels[] =3D
> > {"osc_25m", "sys2_pll_100m", "
> >  static const char * const imx8mq_csi1_core_sels[] =3D {"osc_25m",
> > "sys1_pll_266m", "sys2_pll_250m", "sys1_pll_800m",
> >                                               "sys2_pll_1000m",
> > "sys3_pll_out", "audio_pll2_out", "video_pll1_out", };
> >
> > -static const char * const imx8mq_csi1_phy_sels[] =3D {"osc_25m",
> > "sys2_pll_125m", "sys2_pll_100m", "sys1_pll_800m",
> > +static const char * const imx8mq_csi1_phy_sels[] =3D {"osc_25m",
> > +"sys2_pll_333m", "sys2_pll_100m", "sys1_pll_800m",
> >                                              "sys2_pll_1000m",
> > "clk_ext2", "audio_pll2_out", "video_pll1_out", };
> >
> >  static const char * const imx8mq_csi1_esc_sels[] =3D {"osc_25m",
> > "sys2_pll_100m", "sys1_pll_80m", "sys1_pll_800m", @@ -246,7
> > +246,7 @@ static const char * const imx8mq_csi1_esc_sels[] =3D
> > {"osc_25m", "sys2_pll_100m",  static const char * const
> > imx8mq_csi2_core_sels[] =3D {"osc_25m", "sys1_pll_266m",
> > "sys2_pll_250m", "sys1_pll_800m",
> >                                               "sys2_pll_1000m",
> > "sys3_pll_out", "audio_pll2_out", "video_pll1_out", };
> >
> > -static const char * const imx8mq_csi2_phy_sels[] =3D {"osc_25m",
> > "sys2_pll_125m", "sys2_pll_100m", "sys1_pll_800m",
> > +static const char * const imx8mq_csi2_phy_sels[] =3D {"osc_25m",
> > +"sys2_pll_333m", "sys2_pll_100m", "sys1_pll_800m",
> >                                              "sys2_pll_1000m",
> > "clk_ext2", "audio_pll2_out", "video_pll1_out", };
> >
> >  static const char * const imx8mq_csi2_esc_sels[] =3D {"osc_25m",
> > "sys2_pll_100m", "sys1_pll_80m", "sys1_pll_800m",
> >
> > ---
> > base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
> > change-id: 20260128-imx8mq-csi-clk-2da0c4741ed6
> >
> > Best regards,
> > --
> > Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>

