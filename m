Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011063.outbound.protection.outlook.com [40.107.130.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D5E3822AD;
	Mon, 20 Apr 2026 06:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776667462; cv=fail; b=fOw3oAqcNlSZ/zzd5Vl47VOCwrJPWLjjCFioKtvxBHdBu7lDsqrmw6/V+DfWJuZZw/AvqbVgrB6gypFxhAmwArp9whKrRJ6AvF6OtzMguIe4tW1NM/a84rAt0fpSXmaCPUBLqs7ON4ShJHXjyZKuRGOyQS3a6YZV0KJdB71CX18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776667462; c=relaxed/simple;
	bh=JwPbEffRX4TZGxqNUAStzIZzMO7I3BQYmdJBZNHY7yA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dgo71ueQhpOM0JC/j/UUmWkpRxoqsvWwKaJuZt/Q4gEPwJagi4+RJpJdhm3MO/UfI5zD9Xdgj8PSP1OJcpyeX+UnQp/hbloZGjBU3rhsmyRbFgxepO8GEgP7xtMe9+t9vviQdsOTMrJnqpiRSJBqfZMT94RY1oKidXWN+f256Dk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AgxsbS+4; arc=fail smtp.client-ip=40.107.130.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AgxsbS+4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=os1TuAk3sO21T4Xi7dATO2pOprOoAoE6VwmuutRW0vUmuHSXMquhdAT77Ymc9YAtlmizshFkSQtwth8U2iQSLzeRKiGPiFac+v1/qfEJeYfmRb8Q7Z6X7vNaYOUGPYrtBdbi1DQrMinOpYxsde+SHQKpekjr7vVo0LtQ1fGI7Y5t+Fa4kONZ+L0fbx2g4eHxEGsSNbqq8EhIkdxSLrRf/ir6yjO/p3FQDAwHGM5E66pQvFbh1OT8bCDrEc6HJW7fDL2VefFkY7MpHkwnp1yI3+++q7FlbYXH6rPZSfkhJ+uTgK8SYp5zoKaZRSdTSdLt5wSOsm5PVKGMp7zO54sRwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wmmyU2brNtnCubFWu9v1xZW7BpwBCbyol9VOYydOkr4=;
 b=JNwsdRhnAuZ5bWTMYtjAPlphjpHVfzYa3Ih7KFpk9xPKaSToIdsdJHD3UMXT9Wa08rp2y/M8tPT5OmT0Ha9ybAq9QSMrKnox1pBowOmACY6/X/8Imv5/1421cPq4aR1I8NklAyb5opIgUhNkErN3ncLJ5WHepG9F8pwRH0OEHZX4/N70hgrGg3qLH0SjZnVRTsWnU4wk/qypg2i97gUV9oc1lG5VKyDv/DQ4NzzH7mAHpk2YGwnLu3wnVbGnb/OG5zP16qYUgZC2kze9LHMIN43mmbFqvgz3dg3KJXPqk927F1VZToSAjXPl6RyPxdojQeAh2bQHAmQQpVz4sx/G5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wmmyU2brNtnCubFWu9v1xZW7BpwBCbyol9VOYydOkr4=;
 b=AgxsbS+4wvHu67V2KH+yHDhxmkXsu+rPWJyVtgD4+J49vq2j+6whadUblXWabSxGLFCtDlVV5TBkoYGzoE+6/evj+oqa7RTIUa/wGSzcPUi+ev3fHGfeAH6pO5FC4Yuu4XB7FgK5bwSXKNWOIwM5LYjMI2m5lW3PZmSQBqKOWVmsaYGkdbZ2PIh1sPJmXxJ32htkxBvcXlKIVgW/rz7rJ//mjlbhM+0cltMDGR/7AGnU2GJ8Aw/0fux3HkmvoPx4l//o7wAScVL/vNor72wLWiHY/GFYOnr8usKimD1qHSgjmVcOEXfxaEw4woCp6UpxxxV0T7IL3DpoV7SWjvLqog==
Received: from AM0PR04MB5220.eurprd04.prod.outlook.com (2603:10a6:208:c2::19)
 by DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 06:44:17 +0000
Received: from AM0PR04MB5220.eurprd04.prod.outlook.com
 ([fe80::cbbc:93fd:f7b0:76e5]) by AM0PR04MB5220.eurprd04.prod.outlook.com
 ([fe80::cbbc:93fd:f7b0:76e5%4]) with mapi id 15.20.9818.032; Mon, 20 Apr 2026
 06:44:16 +0000
From: Hongxing Zhu <hongxing.zhu@nxp.com>
To: Peng Fan <peng.fan@nxp.com>, "abelvesa@kernel.org" <abelvesa@kernel.org>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, Frank Li <frank.li@nxp.com>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "imx@nxp.com"
	<imx@nxp.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>
Subject: RE: [PATCH v1] clk: imx95-blk-ctl: Fix REFCLK rise-fall mismatch on
 i.MX95
Thread-Topic: [PATCH v1] clk: imx95-blk-ctl: Fix REFCLK rise-fall mismatch on
 i.MX95
Thread-Index: AQHczkP/2tDj/rWRvEKEo2F74GRsJLXi+qSAgASIknA=
Date: Mon, 20 Apr 2026 06:44:16 +0000
Message-ID:
 <AM0PR04MB522097492BA08F9C55A2EE348C2F2@AM0PR04MB5220.eurprd04.prod.outlook.com>
References: <20260417082910.489995-1-hongxing.zhu@nxp.com>
 <PAXPR04MB845979CEDF7426A07BCB6FA388202@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To:
 <PAXPR04MB845979CEDF7426A07BCB6FA388202@PAXPR04MB8459.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB5220:EE_|DBBPR04MB7737:EE_
x-ms-office365-filtering-correlation-id: 22b36902-4536-429d-d6e8-08de9ea83e08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 ykT9sksqRETz876k8oA4jQIoap9vZejQ+5h+Nry8JLx+LhIS5FEaR/9eCu6jJ7MfHQHDIxB24h9gZ9smzdY9+B+Lu9UCi0NiwbRi72TShmJ+4zEJcQRHm3ISGJfuWST9ya5On6Yb2ZrlnR3E6VPrufjU6le/Zz1TTQb9pwFWI857T9f9HBGLDeQZQGaLfHbB1gmWZ0rPA5K3TyJ3MDar9pBvKGfs2rsLKmQC+erfQyfcHuC83ZP73SelSPZxHFQaVrQg9gYdYAPIIdzSmPJUPyK2w4YNl+zkNErUgQzmYndhMWCDRcD/1+3iuia16qExv8mhlxwBUf09U6yMzL8gDZby5K+o7ul4VIfF/wYN6S24mra+95fSLKmTRty1xddpBl1Ndh6DBWI5WWuNO93BJuEBqFuv0/2Dm/CZO6kqyIQXt7qLFSoObG1mkaukpx2hEhpBVXQODUijAFcrdXXrEm90BKyECGk3BX875sVIcdCXw5mz58UNIDkotHIhpRIsYALykfLdt3eU2XHEVTWoEm6cPF5fa/f7ihNPEwEh0nYk1GXbUfycxahiwRZda4xsFPvtutxI2JlkJH6cSPgiAtSmDKnTEbXDR9qj0KPksL/LVP+vFwm7VeR0t8qyowwJXH2OZCP+GVBOIOWbGfAvE+ZezwVm8gZheLxQj8np/4g2zkzlt0/AyxwCnCVCPq57SQEY0de7I0TyZurk1N/tRaLgOSUOLx1qNs15GcbDxVSrz+snyXlUaObLumKtcRwEVtkXGJiKFbhFGP4RhuPRWyCDQkhmk/tV42VCcEUz06c=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5220.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ILP1EY0JfJm+AKPkqHxK3vHoecqrrtN5MpHiu2PILHHcBb8tY9Z+LM1HDmzP?=
 =?us-ascii?Q?YV4U8NZH+OjKAp083h6hwH7AUz6E+RDDP1AxWUVWxZXk+lY5WkGYp3tzpiZd?=
 =?us-ascii?Q?0HGA/oFcTtaPBqqdxxA8U6OP5BFGW2PD080W/wSMAfJxKfpNRcYVou6DMfH/?=
 =?us-ascii?Q?3ZXfk6wQoVePnnavojT4xe6IMq2U7ZHlT86a8gseXqGtajaIBsI3u71dkuyL?=
 =?us-ascii?Q?Cxni9kGmteXjb7Zq9WULPe+3PBs/PEQ1NpFzrTokvc3i85imhZZPW3BCZjsQ?=
 =?us-ascii?Q?BIW+x1lkt0YLwu+CR10785+CaCLiz6N8mTfL0x54WIlvaAMyJWMLpIK6l0Pz?=
 =?us-ascii?Q?w6UGCq/35zs+uA+cnoYMRPvMz05TaZytgtOQaa88e7NPQyRm73PyXuj/fFsH?=
 =?us-ascii?Q?mtZFEa4wXQH5yah+UAChrxJ3MghiuOSCSve+0gezSPKDmAeXt9NBXrCdmvZW?=
 =?us-ascii?Q?5hSiGON2lF1CMGgOvCFrNX+/tU9WFupiDc9wLsWCECRp75YwocXatWTL4kFQ?=
 =?us-ascii?Q?xBbFyWmxH6OwJNZRigh/MSXRoBNP3DHDajXwWSIZ2gywjndax7mi7U1/THN2?=
 =?us-ascii?Q?VO3yTGW4Col5pCMqsAv5D+UsgFMYkPm/Z1ZhsMB7wIpZlJuzavL7OgPCJz+Y?=
 =?us-ascii?Q?hfcpR5mgRsYKKEbnlXd+iiuB8XE33K6/Y8/VmBtWlCZi2Q7T+67/sLgU54OS?=
 =?us-ascii?Q?zdOhTOSQkPEYC2J6oKWiDxY9Ya5hibdfM2iZeT6JyASdVoBvQd1gbkpKehV7?=
 =?us-ascii?Q?qQmFmF11AndyQnh7o+DOSLKE/zYHfV1kg9uCt5H0UOGiioqm1JEprQJN8gaf?=
 =?us-ascii?Q?iXRfn7uiKsvSE82DpQ0dyTi3ZXVsL+EcifGlPkuRlEyfpgTkIXctSAfQ807D?=
 =?us-ascii?Q?ugyr9ExDFJ+TxFp1VT3SzU6p5CGV8RqZCAGEpKxMuENxbx+GKEuOEGO2Eclu?=
 =?us-ascii?Q?DaNutrkKALfM2TgaxCdNkmqYT2JU79C1yDw9Yry6dyWMJe0nXf2Nr3gvNJ0e?=
 =?us-ascii?Q?2bY5Y+kVx2KC1lsxzJ4dnTtE4qGvIFiLDL/ZihPBAUt/hTiXXgeptPcL5g/y?=
 =?us-ascii?Q?IWMiiZQ2IwHiuM2mRhN5eu7GR1Wm9yXzt8IY8qmODVsZvnfOXsIvshFicnSK?=
 =?us-ascii?Q?lDIcuMHzUwRc2d00HcgKu/hxevcUVB8OasxnKomRcuICjoCa42yRC84tQjgJ?=
 =?us-ascii?Q?tJiPyzR9qQuQkpI0qD3jHei/qGrjPjHun51f/Z2ViTMhjuoFPfLpWAJOT4bm?=
 =?us-ascii?Q?R2RTbIR3IdqkOfWmqlQ2BBgkLLsPI4dfu20sXT2U4FIplcpOhjElisLa6vgX?=
 =?us-ascii?Q?3h8bBVfp+8YAE3EEgsBmUA3bSaVtlRl7wrYrJ5c1NI9G3Eax1fEDHy6vIsfn?=
 =?us-ascii?Q?o9RUuERUOawshKWlhDlxYYGRXP4OXBkMlLgxevBVBOblPOshDAhD6wxd3rlE?=
 =?us-ascii?Q?pmqjmefK1WFXY7I7Qj/vJqt6W7L4vTkcvItMpUz/rmnW8D6bpXYX10crXGtq?=
 =?us-ascii?Q?kt1QeXKB+qgyPhyZ7JBsYeodFvYpN6kgZI0JaT109o/AVlTig8F/PPfF6QsI?=
 =?us-ascii?Q?QKoCx61cufHgvNl7/Q++ueIl+tzW1Q+2ouZ4O3eNLxNak1RMAHK7PahhBeTV?=
 =?us-ascii?Q?dGMYFtxpLtc37IY4fWbTZ8Jh17/diGlTPCRmGQbF3RvBfsdaTzQbsCDE47l1?=
 =?us-ascii?Q?NMBRegCVMw5b3eWFmiVMAy44MZOlr+el+8qq+SAPux+tW1OL?=
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
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5220.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22b36902-4536-429d-d6e8-08de9ea83e08
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2026 06:44:16.5346
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g8aE6chUAza+5VFcXym+Fce4sTZ8p7TT+0qlRcC/g9bsMMUlp/tK2qDSDfOl2MLwOVt7WyE4pV8fUIaWN8eQOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7737

> -----Original Message-----
> From: Peng Fan <peng.fan@nxp.com>
> Sent: Friday, April 17, 2026 5:22 PM
> To: Hongxing Zhu <hongxing.zhu@nxp.com>; abelvesa@kernel.org;
> mturquette@baylibre.com; sboyd@kernel.org; Frank Li <frank.li@nxp.com>;
> s.hauer@pengutronix.de; festevam@gmail.com
> Cc: linux-clk@vger.kernel.org; imx@nxp.com; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; kernel@pengutro=
nix.de
> Subject: RE: [PATCH v1] clk: imx95-blk-ctl: Fix REFCLK rise-fall mismatch=
 on
> i.MX95
>=20
> Hi Richard,
>=20
> > Subject: [PATCH v1] clk: imx95-blk-ctl: Fix REFCLK rise-fall mismatch
> > on
> > i.MX95
> >
> > When the internal PLL is used as the PCIe reference clock source on
> > i.MX95, a REFCLK rise-fall time mismatch is observed during PCIe Gen1
> > compliance testing with the Lfast IO analyzer.
> >
> > Fix this issue by configuring the IREF_TX field to 0xF (15), which
> > adjusts the transmitter current reference to meet the PCIe
> > specification timing requirements.
>=20
> BLK CTRL in HSIOMIX should be save/restore for the settings you configure=
d in
> probe phase.
Hi Peng:
The register containing the pre-configured settings is the same as the
gate-clock register. Therefore, its value will be saved and restored during
the suspend/resume procedures.
Thanks.

Best Regards
Richard Zhu
>=20
> Regards
> Peng.
>=20
> >
> > Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> > ---
> >  drivers/clk/imx/clk-imx95-blk-ctl.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c
> > b/drivers/clk/imx/clk- imx95-blk-ctl.c index
> > 1f9259f45607..bc6957299cec 100644
> > --- a/drivers/clk/imx/clk-imx95-blk-ctl.c
> > +++ b/drivers/clk/imx/clk-imx95-blk-ctl.c
> > @@ -44,6 +44,8 @@ struct imx95_blk_ctl_clk_dev_data {
> >  	const char * const *parent_names;
> >  	u32 num_parents;
> >  	u32 reg;
> > +	u32 reg_init_msk;
> > +	u32 reg_init_val;
> >  	u32 bit_idx;
> >  	u32 bit_width;
> >  	u32 clk_type;
> > @@ -289,6 +291,8 @@ static const struct imx95_blk_ctl_clk_dev_data
> > hsio_blk_ctl_clk_dev_data[] =3D {
> >  		.parent_names =3D (const char *[]){ "func_out_en", },
> >  		.num_parents =3D 1,
> >  		.reg =3D 0,
> > +		.reg_init_msk =3D GENMASK(10, 7),
> > +		.reg_init_val =3D GENMASK(10, 7),
> >  		.bit_idx =3D 6,
> >  		.bit_width =3D 1,
> >  		.type =3D CLK_GATE,
> > @@ -410,6 +414,9 @@ static int imx95_bc_probe(struct platform_device
> > *pdev)
> >  		const struct imx95_blk_ctl_clk_dev_data *data =3D &bc-
> > >pdata->clk_dev_data[i];
> >  		void __iomem *reg =3D base + data->reg;
> >
> > +		if (data->reg_init_msk)
> > +			writel((readl(reg) & ~data->reg_init_msk) |
> > data->reg_init_val,
> > +reg);
> > +
> >  		if (data->type =3D=3D CLK_MUX) {
> >  			hws[i] =3D clk_hw_register_mux(dev, data-
> > >name, data->parent_names,
> >  						     data-
> > >num_parents, data->flags, reg,
> > --
> > 2.37.1

