Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2118.outbound.protection.partner.outlook.cn [139.219.17.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3911B306775;
	Wed, 13 May 2026 01:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778634130; cv=fail; b=ogCo4luWwEyk5o0HMttG2kEKFeCVc8RuwmegY4wglURWbFkmBTU06+Pv8uPjiIdaCGQiwDfOG3HsgIdX4i9IOHvqB0Vg7Y25qyZWFvKoOFLD+j7zPixonKd+NZB1Wyww8Brod6tQ498RG4af5Er+fYODwJ6OIi9l5SH9UCx48Rg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778634130; c=relaxed/simple;
	bh=/OZEFb90atK0RukdNidWgSazc51LiPXujRrNlWjMMlA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XEyJ30m602qa4KJOFS/+PNNDB3BfIWcrN8UHlgU5ZGGv2FevIl/kOJbIfMfwJBhscGZBb5ct9vA68EJNFoYPMfslPMYX+fPVAjV3pEoIuzFHiQZwo3ez0+05NYHrTnOnZZ4xxmgK4trQNr8NvVlm4mnUA4DNo5rzk2xjQPmzqa8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IYs9vihhKE5tx7TL/D875lPXwIQ3at6I+PxNo8vwbLhB7b1ePCR+ely3MBcuyoR7PZBzGVbgxpo+YnDgIG0crinmPSngNkjljVKFmH7UIavaq0IZraraDsMd4sy1VapWCWHqD0e6FCpVlEW0kh1LIjy6RuFVpqakDQr3luDxznYVw8pkd+usMtzpvUZHSaGVynNvg+SIcEunThI+To0diO/or3wtFCuO2AKS+f1PFE79KdlF8n0KRUXR9HmEf2UdUbxm6W/zec6qdjmu+usXrnJ9tCu1XSn3RT+lxe1AJgkw81ifNAIjvf8uNwVWfsQRf/YX4Z6CCJ7mhmdGYA5hIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fqPBFXMU0PAeCSX7HLlFdaSDdzv9njWv/zYwbn2IU4o=;
 b=DJSyN4hlkT8XSXRoge0p0YY53XBsODRE/x80AQ2+vCe1gI9m7JyFAEvqssG+eHxWPmK+PKwRKXegYZ7NWEDYqgP8ISQwSmEYn5bi3wgbkOjKZUfwi4bCP0QK02rWtiw9VHnwRp2xWZh+ENuHwSnHZvxBRUlK8Vh+GfuGiGQAoL+lcKp2fUuhjatp6Al+bOhJ0VggWdrsOuAPb+/HGBZLh5+kh0CE7QMYc9jGyT17+F5Qf3gFY0ryWwFmjuDzW9lP4APCK6TquCnt5whQ9d27ThDOFg795CY1AG2NoOWyAzlj69wTfBef1jItvlgVljXMp6Gh7jFxiujec1ammhSNFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1155.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.24; Wed, 13 May
 2026 01:01:47 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9891.021; Wed, 13 May 2026 01:01:47 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: Michael Turquette <mturquette@baylibre.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Brian Masney
	<bmasney@redhat.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, Emil Renner Berthing
	<kernel@esmil.dk>, Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
	<inochiama@gmail.com>, Alexey Charkov <alchark@gmail.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Keguang Zhang
	<keguang.zhang@gmail.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 11/12] soc: starfive: Add socinfo driver for JHB100 SoC
Thread-Topic: [PATCH v2 11/12] soc: starfive: Add socinfo driver for JHB100
 SoC
Thread-Index: AQHc4epWeSXninZZ8UOuEt2E6vxAdbYKqmKAgAB57HA=
Date: Wed, 13 May 2026 01:01:46 +0000
Message-ID:
 <ZQ4PR01MB120205CCC0A3229824701640F2062@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260512083521.3448-1-changhuang.liang@starfivetech.com>
 <20260512083521.3448-12-changhuang.liang@starfivetech.com>
 <20260512-mushroom-helpless-0815d0885abb@spud>
In-Reply-To: <20260512-mushroom-helpless-0815d0885abb@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1155:EE_
x-ms-office365-filtering-correlation-id: cbe6d714-3db1-425d-b640-08deb08b3513
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 pZs+qx5J+sh+4eB9xu79+SMvjkGuL5uY0LQV+6vdbUWMnLB4chUUL0oqjZSMcrNGakUVVjThzRxbku8CEDwNxLtBYH/aNftKMx2AIA3KRdV+t5MRh4cnPf7SJgT0qqUvHQkMH4rehQZkijJ2kok70Qut7ObRfTjMCVD3CqgqqOiG6n7sx+f0gFp8HBp0p+D6iDL+4SzUE9Ojha3PVBmyRVgBoCjCm7BdDsxd+nduR7TYMqIuclYpVxg0ZCWcbOAxMwduPb1New/UhKL/2fH3eeOUNP3GNeUpYokIJmtcDDb4J9zHCF/G4WEnOyhgDMe9Hw0CUGdNKq9hFlbWUD1l69NfkMVG2i2FgH80Dcm724y+PGRjTxSgAjDhkcr36hraPBfFoINAC0BP7Re2CCvM9jQBFLHowS6wKkwVa7A8gwAiNkMOcipugTPUpXdY26ce7fHVI0FWK8bvfZBID5H26uEhRPoiBM8S2K43ey4+EHAPIGvEXB5JVkJJZv5Gy43+/CQ1i7U3cQUeXbJSHj/eVg03+q7pvbj8oqNZ4kRCM73TkmgjTTn3vGrTZi7mCOnx
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?zCYoahYlUkMuFZs3bVJiu0l3BfL3n4ep3pCDk5rlmsHuydbEuag4Z5UZkSx/?=
 =?us-ascii?Q?lcf2cHtSfAS0Bz676CoiqHjarsrs3XdwF8nnyKLMGbrVOuZcmzVLpeRBW9Ox?=
 =?us-ascii?Q?VXrqJ6xljjoIDXCKjmZmJvpETNb8MTVarvBHngIS1Yvf5j41VG/H/Zq0dNWl?=
 =?us-ascii?Q?tKyeeLgYHzM8ltcQWixxh8ugr7V4jn1FoyRXxmOqfutWyMa/jCA76DaL0K43?=
 =?us-ascii?Q?wY4HiQYlWhHFbpfUGAxcypyOVjmzBtDy3PZbG2u21Rfs5oLN6HXJEQZvSUvz?=
 =?us-ascii?Q?N56ZCx4qhjXnfQek/2w75FpTczxGb2bSvdpGQX0syZYVS+7EpX3itZGPmgAf?=
 =?us-ascii?Q?sRbq8DhJfOh5+S2sN8Zg+vWSmeGdD6nV42V/t1lLy0gaB0xOHzys6F0TdJqn?=
 =?us-ascii?Q?9tqosRlwcg4QOhqQIjeUOxc4RGAAH9R0gi3NKNbHlvEBoVpPOVLAXC8ZuzVJ?=
 =?us-ascii?Q?e2kpi55AT1+1ykUZanItHLPhXGXfJIGAwSqUwJDZlaUKeFtNtwDw8CLb6/FW?=
 =?us-ascii?Q?ynTpEyrNjxJZb183dQP8Y0OWLtwdCs2n4uxCFbvoisEQ51PQIt7iYZklGld1?=
 =?us-ascii?Q?aGcJU+W3g+6msrRzhqslgzLIfGyzyOqgQjEp86yYYxTIcYjt7Lbt2S3L/zYW?=
 =?us-ascii?Q?jeke1CseC86i+rxt0QRBmLzgjnn3m1fcHhUROzNYFmoGJEGno9HrQ7W3R7o7?=
 =?us-ascii?Q?geTKhAH1hZrri9x1xPFRILhR213XaY4QmHuajcvxFuSAEit2NnQpeIM72+N7?=
 =?us-ascii?Q?Z5g0SHeCQeTRXmh2iEqZMu81WLkLCmxkGMBMJaOkK4GivCybTFT2iETB3bY/?=
 =?us-ascii?Q?I06usGNW57N55wwwuvgxIC3cr3woIxwAr03i0YCpUYe55OdIym4LVqCB8FsG?=
 =?us-ascii?Q?zrj2z5e/zibP39NnQ7X58XMon3P7rvXcTb24kX3KKpv7+M8RsTMS6SZjwmkP?=
 =?us-ascii?Q?jq7k2F0ShKscT2elKsHsOG9L25mRyTRmS2sZGIg63XxqfFx3/OtnjqQ93SaB?=
 =?us-ascii?Q?/FOamN5XCyIuDcy3NfbZAifHG8SCx6LUCFlIRX2pc8qpstvvSPBPzk5cOAnx?=
 =?us-ascii?Q?C0eq2yNWcN0YJDsJ0+AhuSR6RQpF1OoBMo2ZmLQ5pBm5gjN3cBqKHWsq8Xe3?=
 =?us-ascii?Q?FEiCUqjpIx/OJ2GJQRYrTiSEt07RWvHPpOrCFpESRwlyayjwYpPI3lxU5zjC?=
 =?us-ascii?Q?YomsEM1Iz8DgAa880f1iFo4d0mLOoWeC6yElXZIkpCbzOB28XsgexB/mTrTS?=
 =?us-ascii?Q?B5aCZQvlJ18BFCuGG9frxbOR1fXkrnWJ2BnSMurB/RSs3WN7OoO1xOkBy+Ac?=
 =?us-ascii?Q?n0bHZg/kDqhnQp7gq38ArE5oC2ew52VHOCKegXMv47K17RtMpr5gQr4Srj9/?=
 =?us-ascii?Q?vqTiMe+t5P2qtFq07eTnTm7EdRAKFwFQFd8jKzW/cP1PfSOVZTS2g9i+GZvW?=
 =?us-ascii?Q?OrVaA69V3XrK8+rwmvlo52jcv9zo/DZWt6uKg2G0FpDUL/guq393ccvGArkl?=
 =?us-ascii?Q?u07244P6HuoFpRLIVsuhnYZ3dyAOV1uKGa4GngUSXE2cPxRenFhds+C2TaxD?=
 =?us-ascii?Q?92mkcDMizLEOSl51HC+klk5eUJZno4Z+Ueol7P/gZNRxS3p3SYDMEBN8R7A/?=
 =?us-ascii?Q?k8Vo1bOdtqNmg+kw4c4g0KQnv/fKKxQ2VzcForzmagdvHL4k3IoU/PVzdzU2?=
 =?us-ascii?Q?8dJAjsElZodqa3mWo1Ay3PicWtJvZDyMLTUAbCajj+NGDUg1OH39diPgcjCH?=
 =?us-ascii?Q?8T+ENDyaFX2xhsN413IrB7OorogUaUk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: cbe6d714-3db1-425d-b640-08deb08b3513
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2026 01:01:46.9999
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IfkpLgc+nUAVUwQTqhKXbbiGJJwdvMN5qs1cICd42OR1oz9S6r4em4H/QVM/mObfENP/HKTKKMsRaTcsotX/PXPZ94GQVHYYNkiDoXe3p3d7Sij4b7NNGz7ys4Mvh8Jd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1155

Hi, Conor

Thanks for the review.

> On Tue, May 12, 2026 at 01:35:20AM -0700, Changhuang Liang wrote:
> > Add socinfo driver for JHB100 SoC. Currently available for
> > distinguishing between the two reversions, A0 and A1.
> >
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > ---
> >  MAINTAINERS                                   |  5 ++
> >  drivers/soc/Kconfig                           |  1 +
> >  drivers/soc/Makefile                          |  1 +
> >  drivers/soc/starfive/Kconfig                  |  6 ++
> >  drivers/soc/starfive/Makefile                 |  2 +
> >  drivers/soc/starfive/socinfo/Kconfig          | 11 +++
> >  drivers/soc/starfive/socinfo/Makefile         |  2 +
> >  drivers/soc/starfive/socinfo/jhb100-socinfo.c | 80
> > +++++++++++++++++++
> >  8 files changed, 108 insertions(+)
> >  create mode 100644 drivers/soc/starfive/Kconfig  create mode 100644
> > drivers/soc/starfive/Makefile  create mode 100644
> > drivers/soc/starfive/socinfo/Kconfig
> >  create mode 100644 drivers/soc/starfive/socinfo/Makefile
> >  create mode 100644 drivers/soc/starfive/socinfo/jhb100-socinfo.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS index
> > 6f6aac7cea95..66175f453d20 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -25613,6 +25613,11 @@ S:	Maintained
> >  F:	drivers/reset/starfive/reset-starfive-jhb1*
> >  F:	include/dt-bindings/reset/starfive,jhb1*.h
> >
> > +STARFIVE JHB100 SOCINFO DRIVER
> > +M:	Changhuang Liang <changhuang.liang@starfivetech.com>
> > +S:	Maintained
> > +F:	drivers/soc/starfive/
>=20
> FWIW, this is not what I asked for in v1, this should remain the full pat=
h to the
> driver. I wanted you to add this directory back to the "STARFIVE SOC
> DRIVERS" entry, since it's me that'll be applying patches for this driver=
.

Sorry, I misunderstood what you meant.

>=20
> > +
> >  STARFIVE JHB100 SYSCON
> >  M:	Changhuang Liang <changhuang.liang@starfivetech.com>
> >  S:	Maintained
> > diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig index
> > a2d65adffb80..b3b01fc38139 100644
> > --- a/drivers/soc/Kconfig
> > +++ b/drivers/soc/Kconfig
> > @@ -24,6 +24,7 @@ source "drivers/soc/renesas/Kconfig"
> >  source "drivers/soc/rockchip/Kconfig"
> >  source "drivers/soc/samsung/Kconfig"
> >  source "drivers/soc/sophgo/Kconfig"
> > +source "drivers/soc/starfive/Kconfig"
> >  source "drivers/soc/sunxi/Kconfig"
> >  source "drivers/soc/tegra/Kconfig"

[...]

> > +	pr_info("StarFive %s SoC rev(%s)\n", attrs->soc_id,
> > +attrs->revision);
> > +
> > +	return 0;
> > +}
> > +
> > +early_initcall(starfive_socinfo_init);
>=20
> Does this really need to be an early initcall btw?

Yes, there are some drivers that need to use soc_device_match() to match di=
fferent=20
revisions, in order to handle the processes caused by differences between r=
evisions.=20
So there's no harm in initializing this driver earlier.

Best Regards,
Changhuang
