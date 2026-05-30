Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023077.outbound.protection.outlook.com [52.101.127.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3583AB47B;
	Sat, 30 May 2026 12:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780142678; cv=fail; b=PSMY9jPjoihM/20jQ2arJ8sZmtycJ9jUgVi6AiTZXKlzxE9d/9ydmyWS5AFpK059dngzPBJoXFMaIsITowzupAZBhcQVABZFJ5ySrsxjCSefhWRaE6JKGIKfud1E5yjNMmGOEU7HHbbmnOZnzJCW60TwGHcbPFa6Lm8YpG67ZgY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780142678; c=relaxed/simple;
	bh=XKcG3H9C/vOMAL4Q8sXWeN5QuUhXDvy/Evyy/9tVLy0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hIecO2v8kOGi/us1OZjDXzfGvqyXndUtZ5vWScCTkwvgP/80CHmWN0k0WuimmltdFXu1+Yfv7VRgJnBsakki9FaREH5NQQufkuDH+/OF0pc0Pb/Htx7iPJFX1sVmY5uvOrQZNvTDLY9lg1ElYrqQ8ctLswhzQXWasxPRQq1gH+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k3RMJS2Q4DnOSCWfjsBtRi+mSbAcZ/HUDmHpWopqJLLJqthpkFoeItSNLA5CzGSpnKeRgbCgBsoNp2ur8WhF4DawUJRUz5kGmFmqOBTvLwmc05eLiQnAcbs/snpke7g92ufE5j2guGDs708GfS8RxnjKmevv/sksCXAnxRwslhnOeFpDT6Ftt8mJKpEYsMva0RHo4zHh1L3lzkjZ6Gn7OFSAyYjYNbDVj7O63yX7UtNbyxtrTij7nrvlHUbQhswwfcJZZaumw4hh6tBXV2ENwGW9iq50xqOz7L+/nO2SZId1UpT+1lX8ZDwXHuBJMhrOrieMVN5T9otpryhxN+diPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fvsz2GCPyGBnQrnohhEJjmlcOkSDXI/IL0I7+Czfhxs=;
 b=Ruovj78DW1Jr1zY7qxKQh/8Q8z7aCVN2XiycLHphQjS7cSbgg0irftE9jhw1pkJOF1cUtu+wXKKFvoo1bl2t4nB38369G5WuBmqS42wrC+PBZr7Xdx2LUGrpXM3w113rvkJsXxrvGj0O+LuwgL+zkHhR7FpPz6bpQ+Z9qtrNSO4ZmOLP4pb75yl6+I+l0vHTDDvB5fgSqBVl1txSaErwZFliVxJKXRpT/0cjaM7gKvqcH/VqD3MeiDMaWM6sPY2tO6+u4RbAFSE3CcEjBAEHBXUqi0vBFD3ueU3XhSjBgQSbbA4VcXTwi1KdBUN5KgESGMB8AldvcpN4VBAqAkMTtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from KL1PR06MB6236.apcprd06.prod.outlook.com (2603:1096:820:d7::11)
 by TYUPR06MB6193.apcprd06.prod.outlook.com (2603:1096:400:351::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Sat, 30 May
 2026 12:04:34 +0000
Received: from KL1PR06MB6236.apcprd06.prod.outlook.com
 ([fe80::2c9b:c257:fe54:16e7]) by KL1PR06MB6236.apcprd06.prod.outlook.com
 ([fe80::2c9b:c257:fe54:16e7%5]) with mapi id 15.21.0071.015; Sat, 30 May 2026
 12:04:33 +0000
From: "Joakim  Zhang" <joakim.zhang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>
CC: cix-kernel-upstream <cix-kernel-upstream@cixtech.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: RE: [PATCH v1 7/7] arm64: dts: cix: sky1: add audss device nodes
Thread-Topic: [PATCH v1 7/7] arm64: dts: cix: sky1: add audss device nodes
Thread-Index: AQHc79phYUnJrue6JkuMF0BZ9FMNBLYmR9KAgAAU9VA=
Date: Sat, 30 May 2026 12:04:33 +0000
Message-ID:
 <KL1PR06MB62366E2FEE6414E6A3F450A582172@KL1PR06MB6236.apcprd06.prod.outlook.com>
References: <20260530021642.64059-1-joakim.zhang@cixtech.com>
 <20260530021642.64059-8-joakim.zhang@cixtech.com>
 <c68f29a0-1d5e-4568-bc70-52926c275623@kernel.org>
In-Reply-To: <c68f29a0-1d5e-4568-bc70-52926c275623@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR06MB6236:EE_|TYUPR06MB6193:EE_
x-ms-office365-filtering-correlation-id: e0fac63a-cc3a-4f32-1f65-08debe439cf6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|4143699003|56012099006|38070700021;
x-microsoft-antispam-message-info:
 Bv8XdVIeKihLW+GgtM8qM15TLmiLpn597sv+K1knPFgfi+38ju69Fe1HSnFKUd22loNioHFzas1f/xYg96V+JzC1wRkh+Kfvt/scjplt4fkf1KrXwokPX9/pByiMBC/QeTz7LuySbsm9nb4lmLEZ//9Q1xCEwuQ5FZCmOqhi1r/ecOTX/RsAv2LOF2RhoA8bySQ61a4Tby4VWLYH1vU20aSaCAdQX+qOrX+Lxmhm3Zz0VGILJ6y2dRZbmDM9u8UmLs74VA+NoE0u2oy9Wm/BjqRWVnUGUE6aaQ07A5jz0G9XsfVV0hd+sWiy7NddKDdYdqoC3KFHtqMlAPjkmU9tOSqpErAdybeW1ZE2KW64SGBGu2Z3SGT7OojIgI/+WstNchoC+dosML7KD/ztt34rO/v5oR5L3jgP1KqyJrSxHCyA4lpxpRYNDMoxgUpMc1smUVz4PlRLr560tAPMlhsDwm8X4ONBB7QnqyhlKE6BQb+BGjrzVXNsj9BuhJdYz20sWx6sJuRueYka5VXa5zysrruPMRa8seIwOGPRyKA/DgUYdtwlfgtYLgwOr25ze4ev4Upnn5mvmB3/Fq8RYxEmM9zpZaitk2sfeNju5IBsQ7+QttdFgG+zzR2mBg/gMgtSLhG9/5ZB3r1X2tEOacxaLTvEQ182T3Dx+VEPncOtLRmAf6zWZYDgRsy4Nu0sYh3GubTybWhud55pEy3YLrRPlodv8u6ckLXO9g09QAQxm68NRRexO0sUF2iFIYgWDFE6
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6236.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(4143699003)(56012099006)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?++eId+1Z5EaolrCKz9d8rZSNbqNYrPHRmt1mZ/z69DanESb/VNmPn0zdnmpU?=
 =?us-ascii?Q?0PpR2qaMoK/H6nYtfSXNzt1kpYrJd8yjVue+X2ND20T08DpknRpX607YevEs?=
 =?us-ascii?Q?2g92sodBdsNvhLXbGORMvzz91prqv1gZ21z81HIic4YhhzFQcoMHWqqkqpR5?=
 =?us-ascii?Q?WSYbTiktJy1oNuuWkpiYiREMmBHaWzGl2nz4fwoJZBUWWz5mj8T3mCFDSyt1?=
 =?us-ascii?Q?L1Y3ux0SCcn2fiYsfHcJV1/nounyCNC7KqtOkPH/ySArzaGghU1PXyFLAb2Q?=
 =?us-ascii?Q?liDwwyOnt92X0B46dXq5h5aj4t1jXZgRZoiDjjokZH/5BGXVyg5kY+S2Gud+?=
 =?us-ascii?Q?MCv79Kne48MUEVIbIqNuyR/lhSIhXaPAOIbYKGMQO0pLak58aglxiDwmGCVm?=
 =?us-ascii?Q?IVjCN2DO2KFH0MQBEjHLdjpsi4KYKx0dAUzhTzQyTPg5ypwyNJylm3z6O166?=
 =?us-ascii?Q?dFiaEgyppPHTPr+qoUu7ZqyOZ3BZ7CEelxHlraUGT7DnsFfUbAooeJWG+4RA?=
 =?us-ascii?Q?/0Q1i84CPu3c8/ORTZrwsnrXTstwXEAWXJB8UJbCWdUnV/gg7ZyVirF/RQ4R?=
 =?us-ascii?Q?yJJydoz+iQs6GHS/q0kkazoMkTjAOIZHpX88DilW+tHyTWGdY2TxU4bklzCq?=
 =?us-ascii?Q?MRmsfmW+exK6LMqxZ+ZjNOYRYLqPT92xhPN9frnAUTiUtyPRkpaBKOLmV2If?=
 =?us-ascii?Q?pLB1XABGQILygH3i6pzsnBl4ptQQMgBSXaFjTTJmAqHEv2gZvzozG0I4NbdQ?=
 =?us-ascii?Q?u00eM5+P7OYUAWXFPtNACPmm52ICM6jkl3UVOo0g3oc3W0Vva1TOD4wEHZ52?=
 =?us-ascii?Q?Ym6ftJoUQ88iUw1SsULPiZHhD6lZ7sgo2flc8w08gtzNaIEspue7wtOMr/gb?=
 =?us-ascii?Q?29GcHnXkMrc6icoMD018w5kWRgye+pOOUukM5lVcfu3fjHoDbale1Q31iW3U?=
 =?us-ascii?Q?UTi9G/To5BleD8Um7O0fBR5/YaOUz4oScskZNnxDnfIVDjvh7ODJj8tIPL1V?=
 =?us-ascii?Q?78ebrKuTpoC2AyFmUuhgZ0QJCmd+7bmUj2tMG63FHVyS2vhIT3mhu0JJhxUI?=
 =?us-ascii?Q?OnGbBgVN+54SCq2GOsaHWX+NyJnJSL1bNnXL4nCweW1WE1VoPYrwgXBEhVtS?=
 =?us-ascii?Q?bMFBaPBwT85DiMVvhAeHDznHvlHCGeKXbCgdaGWE+vD9MxjE3TZlRhYU/nfO?=
 =?us-ascii?Q?0GFexHitjAa4gjES3CmVtnR77Dsrf7cDNplIpdpGtwZppYGKOeZ2/XR82qAm?=
 =?us-ascii?Q?qizek6XO4EK8AMujFBIB8+xqcSdldlzWMLjTT6opuZUWLecxdWjWXqSy9MgK?=
 =?us-ascii?Q?K4sPK5SXfXrTQFSlAm5PNy9XvgSI5RQ6ImVAVO4GcciBmLyN/mqDW28Y8pTh?=
 =?us-ascii?Q?qXa2o1hBBKIFmEKGo2+N28l9Em8inADA85zbvd9Wu9iwFBV7DGC/viZc+Srk?=
 =?us-ascii?Q?hHPpfWIvX9kLeIYeaAjmXy+Edsrn8PMeXmuDsxbX7HTjZMhxp6+CvaDv0Gau?=
 =?us-ascii?Q?ENWFphNrKSltor6pHggIaShK2RBmJV6tzXrTBnPYj+w6Rk4w3u2vSS5YYOUf?=
 =?us-ascii?Q?5z3EQWJ+P+9iO7WuisJme62HKpB6EAZ2OYGm1nCvD9sk+L5CUByvmqK4EFT4?=
 =?us-ascii?Q?aW3pWAd3hwRATFPfrqFy2E84KaAmUsiDqZ0MJlGTquVpcoPJqhqM9o1VLst8?=
 =?us-ascii?Q?VvIWf3VIQ4VNdHvnEANkuH2OHOmb29CzaJc+M1/b+dZGXgnls481Lu/UGQSl?=
 =?us-ascii?Q?Tnvg49pp+g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6236.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0fac63a-cc3a-4f32-1f65-08debe439cf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2026 12:04:33.8288
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5jEZ2lSqM/gFC8M3s2WzuflF2X+mMTxKSQcYUq6rvvQDAGf2ulmgaySCeqPqnnx1l/h63lbXqsHMwwBzD24Epwc42s/CUFKEKC204bc/7EM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6193


Hi,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Saturday, May 30, 2026 5:08 PM
> To: Joakim Zhang <joakim.zhang@cixtech.com>; mturquette@baylibre.com;
> sboyd@kernel.org; robh@kernel.org; krzk+dt@kernel.org;
> conor+dt@kernel.org; p.zabel@pengutronix.de; lgirdwood@gmail.com;
> broonie@kernel.org
> Cc: cix-kernel-upstream <cix-kernel-upstream@cixtech.com>; linux-
> clk@vger.kernel.org; linux-sound@vger.kernel.org
> Subject: Re: [PATCH v1 7/7] arm64: dts: cix: sky1: add audss device nodes
>=20
> EXTERNAL EMAIL
>=20
> On 30/05/2026 04:16, joakim.zhang@cixtech.com wrote:
> > From: Joakim Zhang <joakim.zhang@cixtech.com>
> >
> > Add audss support for cix sky1 platform, including clock, reset and
> > hda controllers.
> >
> > Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> > ---
> >  arch/arm64/boot/dts/cix/sky1-orion-o6.dts | 34 ++++++++++++++
> >  arch/arm64/boot/dts/cix/sky1.dtsi         | 56 +++++++++++++++++++++++
> >  2 files changed, 90 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
> > b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
> > index e39c87774c12..1700ecbfa1ce 100644
> > --- a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
> > +++ b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
> > @@ -66,6 +66,20 @@ pins {
> >                       drive-strength =3D <8>;
> >               };
> >       };
> > +
> > +     pinctrl_audss_hda: hda-cfg {
> > +             pins {
> > +                     pinmux =3D <CIX_PAD_HDA_BITCLK_FUNC_HDA_BITCLK>,
> > +                            <CIX_PAD_HDA_RST_L_FUNC_HDA_RST_L>,
> > +                            <CIX_PAD_HDA_SDIN0_FUNC_HDA_SDIN0>,
> > +                            <CIX_PAD_HDA_SDOUT0_FUNC_HDA_SDOUT0>,
> > +                            <CIX_PAD_HDA_SYNC_FUNC_HDA_SYNC>,
> > +                            <CIX_PAD_HDA_SDIN1_FUNC_HDA_SDIN1>,
> > +                            <CIX_PAD_HDA_SDOUT1_FUNC_HDA_SDOUT1>;
> > +                     bias-pull-down;
> > +                     drive-strength =3D <20>;
> > +             };
> > +     };
> >  };
> >
> >  &iomuxc_s5 {
> > @@ -82,6 +96,26 @@ pins {
> >       };
> >  };
> >
> > +&audss_cru {
> > +     status =3D "okay";
> > +};
> > +
> > +&audss_clk {
> > +     status =3D "okay";
> > +};
> > +
> > +&audss_rst {
> > +     status =3D "okay";
> > +};
> > +
> > +&audss_ipb_hda {
> > +     model =3D "Radxa Orion O6 HDA";
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_audss_hda>;
> > +     memory-region =3D <&audio_alsa_hda>;
> > +     status =3D "okay";
> > +};
> > +
> >  &pcie_x8_rc {
> >       status =3D "okay";
> >  };
> > diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi
> > b/arch/arm64/boot/dts/cix/sky1.dtsi
> > index bb5cfb1f2113..fe096ab95f3b 100644
> > --- a/arch/arm64/boot/dts/cix/sky1.dtsi
> > +++ b/arch/arm64/boot/dts/cix/sky1.dtsi
> > @@ -6,6 +6,10 @@
> >
> >  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >  #include <dt-bindings/clock/cix,sky1.h>
> > +#include <dt-bindings/clock/sky1-audss.h> #include
> > +<dt-bindings/reset/cix,sky1-system-control.h>
> > +#include <dt-bindings/reset/cix,sky1-s5-system-control.h>
> > +#include <dt-bindings/reset/sky1-reset-audss.h>
> >  #include "sky1-power.h"
> >
> >  / {
> > @@ -155,6 +159,18 @@ core11 {
> >               };
> >       };
> >
> > +     reserved-memory {
> > +             #address-cells =3D <2>;
> > +             #size-cells =3D <2>;
> > +             ranges;
> > +
> > +             audio_alsa_hda: audio_alsa_hda@d0c00000 {
> > +                     compatible =3D "shared-dma-pool";
> > +                     reg =3D <0x0 0xd0c00000 0x0 0x200000>;
> > +                     no-map;
> > +             };
> > +     };
> > +
> >       firmware {
> >               ap_to_pm_scmi: scmi {
> >                       compatible =3D "arm,scmi"; @@ -488,6 +504,46 @@
> > mbox_pm2ap: mailbox@65a0080 {
> >                       cix,mbox-dir =3D "rx";
> >               };
> >
> > +             audss_ipb_hda: hda@70c0000 {
> > +                     compatible =3D "cix,sky1-ipbloq-hda";
> > +                     reg =3D <0x0 0x070c0000 0x0 0x10000>;
> > +                     interrupts =3D <GIC_SPI 234 IRQ_TYPE_LEVEL_HIGH 0=
>;
> > +                     clocks =3D <&audss_clk CLK_HDA_SYS>,
> > +                              <&audss_clk CLK_HDA_HDA>;
> > +                     clock-names =3D "ipg", "per";
> > +                     resets =3D <&audss_rst AUDSS_HDA_SW_RST_N>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             audss_cru: system-controller@7110000 {
> > +                     compatible =3D "cix,sky1-audss-cru", "simple-mfd"=
, "syscon";
> > +                     reg =3D <0x0 0x07110000 0x0 0x10000>;
> > +                     status =3D "disabled";
>=20
> What is missing on the board side? Why SoC component is disabled?

Indeed, there is absolutely no need to disable. Will updated.

Thanks,
Joakim
