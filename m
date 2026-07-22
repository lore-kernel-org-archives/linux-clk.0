Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022076.outbound.protection.outlook.com [40.107.75.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45C7318ED2;
	Wed, 22 Jul 2026 01:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784684760; cv=fail; b=Pa0+Ku9JNxG8UyyoC1vNdudOp5YqpCCiqbhsAlqF57n9DwRBu9i1aGO3cUPZLHZIurfbyZ/PDalCCIuog3+Diic8N96vm9vfvYDeAxhUIaEJbe5BaeYCwxXIQp/R8F2VVUq49A78ntuUHONicoOXHsHUGL4+gLlv6lKt+Ch4YO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784684760; c=relaxed/simple;
	bh=ho5m6Y9x0Z/nRHz7u6W18Q4JkfFzO0SKOtAWM7fWq1U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=R9uUR89F/u5WAxuf/OZ+fc+XnXFXd2lZp6l5SfRe1z9xQDHdF1Y5v+7g1TJuiDMNusHyYNEkB+qnxhXneZuAs7fNO/wnbQDgyW6DAhVYswjZZOqtwiYU7PR6xmapgPWPYFLJpfOePOEY9/K+Z3G6rPHf/epxCnB4sYWllscfPd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yA4HQhNGUGbUl0REELsgOVBdChLArPeXIDBEV9ZSF18JHnLPDTg+s5Xyr0a3GLvGQrZNirolDSDstHYYNZk3xePJV8ti6dp1io8KQCYfigzJ3gf1sDfnnL3lgxXwULjYTAHgUn8XEXp66fJgNR/n/flpkCxVOiyZqi4GF7Y0Y82opOZuHQPRUJix/eyGX+Svz6Ozdc8hpnUUZXtMvCnWQuifTohzsFlxI3IGQ/LmEcrRr2YWt3v4IHiej2jv0Ee7JrgN7I/lxvqhpl3+0NjKu+SnIooAzuR4rBF/ZqvftYta8DLew6RpFRZOeMbSjSHD4n830bPFl0JHPCn1TaRLAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/F3Cx1xcn3Z8bkcwc/qbIs6lHXoXeL+G0duvvALM5Y=;
 b=xARl0jCjZrI42h/9iuM0lC0xFVxMj8TJ6rw0x8hGY0Zf4vNFMoWZG9ltUWVu/rqLwpdk3w04n0ro1TofUEOgPjTsVqpH9tMDyamElpPWrOG2OctnNB/+yrWiaCOtlOMf/T5jn/q0awoFjGdfkzw4YGJTp8SRgpq/8G3pE5jR66wdL/rdFzykyR0p4jqkoLuIgS6KhcI2DnDt8HF0YU3Hl8/sm2m9VhLNj/p1vrJBRbqWBhtTSLYaOirIbTWirRf2euUd+PGBiP4G57+bVnWayOMREUVp7sAJvMBxZCI1H8EmakJNrN/5ITKXLp00sWeXtouh8SWeD/cblyK2vlSJXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com (2603:1096:101:df::13)
 by OSNPR06MB8955.apcprd06.prod.outlook.com (2603:1096:604:49d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 01:45:53 +0000
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364]) by SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364%5]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 01:45:53 +0000
From: "Joakim  Zhang" <joakim.zhang@cixtech.com>
To: Brian Masney <bmasney@redhat.com>
CC: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v10 2/4] clk: cix: add sky1 audss clock controller
Thread-Topic: [PATCH v10 2/4] clk: cix: add sky1 audss clock controller
Thread-Index: AQHdGAa+uATadAQ190WzEUhpNkaxArZ4jFaAgAA5c+A=
Date: Wed, 22 Jul 2026 01:45:52 +0000
Message-ID:
 <SEYPR06MB6226C74C33B3EE124E3E0F2C82C12@SEYPR06MB6226.apcprd06.prod.outlook.com>
References: <20260720051505.1252774-1-joakim.zhang@cixtech.com>
 <20260720051505.1252774-3-joakim.zhang@cixtech.com>
 <al_vGXIW2bP8uGJ5@redhat.com>
In-Reply-To: <al_vGXIW2bP8uGJ5@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6226:EE_|OSNPR06MB8955:EE_
x-ms-office365-filtering-correlation-id: 0b7aa30e-110f-4752-e7c2-08dee792f70e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10067099003|4143699003|56012099006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 8vq3M2FfnCM+QCtw6AVy+6FvIoxNbvF+wHvi5JPTQWsJAkC7V6poEIeqSLRKsbZ1oOZAP865NnBl0dlQegRNZXG90fneSkfc8gfTHz335F5PVaCPznNtTRu6t2CMUC3Zv10aOwN6c8F1DxKZi0MqnFQqvV+9FtBFRgEZox7ndET4XvTtAaOaF0YuNBKQElUkkJEHg9yADPnNH/mNJsHWV1jr9R4+Lfwb1/vS4ZRt5utJVkji4CNcuE+RDkoGP6/U1XHA2iba4fWHNp1NLhwGZxOhtYmI6itue8vIAGWa4Oz/djpmK1QzMPvti7wgl8yN4p5uJuMilgoZ29bjYXIFmOa/Ru65fZt5RXF0kCi6eXTma4dDp2i4rCtDQ+avHJUh5MdzpilsK3VqSE4gF7oGqijF7kSXASo9Kki9Bc5kDHPWpO3BewlXbzDx9IOt9nqe1V/+G2FThn2Egv7wujZTCh0DE89IHCINjxgQ/RP6KqsucnOcWgDqLzaaQINvluyiZC00X59vP9MLh7mYwgh0CBHYVbw3gsyjbMzFY5lVknXnlFfhmLV6Q3OHV3Xpgir934i+OLfBKxe/7qU3m4yv2vD/4zoeRd612LirtkrMMWC15pIXiBdpCb7Wur69WbxMCu0gp+WFHce/yJOpZRs5ObQ4+0GuVj7AQ7osPcEiaTAV3GtbZm2Ayzcffy6pCXdXArHiF1FwUc9dUQ5q+5URsw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6226.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?nWY82NHcpTtwYnZqbKWmYUQaE2l4dySM6JK3w9m/uY+o2Gn5XdpUU7YsNr0+?=
 =?us-ascii?Q?wVDkVsa5M3yi6ckIjog6vPQbTkI4196RuXa8fXwKxwtBwtkyYjP0aHxX1Yw1?=
 =?us-ascii?Q?VUy2f3QhHuu0ppgBi/m/o4iN5Pqf2QZZPLdbeo51Uhv4p4Ock01vY53gjbQF?=
 =?us-ascii?Q?L2YX0tCV8+X6irT4IJDq5vIP8W/eawy84QD/eGL9M8Oae9oa7QiWcNQy+vLW?=
 =?us-ascii?Q?0z/l7OAkgxYXBLNm/8gAFLFBSv2bX2ZMZzvaCRXTlcQTvajSBc5cyfQ2jku7?=
 =?us-ascii?Q?7fOqQ+yrxYammla9CYe9z8QG7EuCna30V7JPTHFYL8UrrBOz/TH9+Y0OA05b?=
 =?us-ascii?Q?dnDOc1/V+mIs/eWQjPBSqLnNKec4CQK29JTMaOoEeFkVbTxQMRq3cEz2cVem?=
 =?us-ascii?Q?lvLdAVCbn1iMTEmBHvnnzS2fUK41zCdA+hL7G+b4WQ29FC9z367Qm90hR8IQ?=
 =?us-ascii?Q?KsxR6VQ++zwVFz9+RIPzo4PD741yPgSOyV0msNWcdooArqPSiO4U7Xdm6ek2?=
 =?us-ascii?Q?l1ly1INGfi0hGN7pvWSwKO/HywyH5OpzKSnIDxPBJlAMV21DnP+dY4UHRFbS?=
 =?us-ascii?Q?wbyKFTTFotz3gkT0j7OQDvXlTb53huTkYrx4F6XSFi85nO+SGVjCBNnb4XQv?=
 =?us-ascii?Q?PTzhqbU8ybveqLwBuhQTlQu2sdJdrIHel14VtmPFdBN45dIjzLBAHEw4X751?=
 =?us-ascii?Q?Ql7JmUegj+ACYYXBvNbvWrDRM2gMWfNIaC0FthQ0ZnptdDIhX+ylMSv4JOgK?=
 =?us-ascii?Q?/KchWxKUfWZtbDwuv3MJE+wR78hGLQK2B56/pOPqfiNtzoeSqt1qksYEpCoF?=
 =?us-ascii?Q?XjTabzXKhUWNYM9aH64kWJTgu35QO/my80rbFmPPJdFE8UEmzlrpmcmNk4/s?=
 =?us-ascii?Q?4JQYaJoSJRzNqcyGmAgMwTKJhhVkpxsz4u8YuZjTKtlf/071yB5u0O71WErw?=
 =?us-ascii?Q?9gLSkdk6VLpyCY7dljF18oys2bOoI219PJIfMuJwIbShWhtbfbJt1ICELEv4?=
 =?us-ascii?Q?K0BfcDT07IxeBLM/ulTLsfvf9VOfMQtRfF0SpnWhGHjctSLGW2c5r++jVYam?=
 =?us-ascii?Q?ELB3aqHlTayOwKg5+tkKHv8Iofmds0yw0MDVNsEAVNBmSRKyDSoXzsWsh9q+?=
 =?us-ascii?Q?U9YD01tr05uxxOllbRkV+faT1mZlAJcq/LFOFMT4XTA/am1rAgIBRLRJL/YD?=
 =?us-ascii?Q?P7WuHqyLAi2tFpgQ7Bywx2iU6yMU+N8jeHRXfTEhqFJzBf9iea3++Lc8dS/X?=
 =?us-ascii?Q?k0T9H/0WQ3DsfVNpm35r7LIJHP03hVE0xAXE823fJy7FQ58RSABTAv6so1Cb?=
 =?us-ascii?Q?crT4yd9AYr4iZG0f5sxjPJP+zQpf2Vmh3mAW7LBYtb8GimqJEqR1c6K8IlMn?=
 =?us-ascii?Q?u3gC+o6pIgRQxVgtoU6hkLFEjNnKi6AlG/sLsDhvm1tQnbAN36/y45g4pWI2?=
 =?us-ascii?Q?yKqBVkQ6K4BlV3pCK8qXa/bNQ9BZq0wV9P868inMh7Abz+KtSgoTG+fcSjUr?=
 =?us-ascii?Q?jgRn+uHugUNc/mEP+OfTgZn0IaXGJDEJ7x4PkCm5Bh5JSn8bIAKBDLCOl3Rk?=
 =?us-ascii?Q?Cp0RnqWtLOCSyy1lHOHuzOdCZV9fmiHtNPNgoWIS41ibN+s8LJf0zoRpDeoL?=
 =?us-ascii?Q?24XuLfV0w+LlGKcwKevszG6QwMEiSSSWNoXbq1xi99g/EtUsC4Jf8rTbcER2?=
 =?us-ascii?Q?rC5Lg1QFPX0giAsT29xr5U6GTIq4QW6Lgp159gdxa2aTtWr6hIA0Kyy+n9xS?=
 =?us-ascii?Q?mwpq4I/0kA=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB6226.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b7aa30e-110f-4752-e7c2-08dee792f70e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2026 01:45:52.8990
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rkJi/doP1DvZOn9GBSJj3MUr/jJ5UJS/ovaiPf1Xy3SPpnZvlen+bh9KjIaCy/0D6fi7vWrM1qk4+0EsXkgV5qjXKDdk0KdlM+W4+MrkGFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR06MB8955


Hello Brian,

> -----Original Message-----
> From: Brian Masney <bmasney@redhat.com>
> Sent: Wednesday, July 22, 2026 6:14 AM
> To: Joakim Zhang <joakim.zhang@cixtech.com>
> Cc: mturquette@baylibre.com; sboyd@kernel.org; robh@kernel.org;
> krzk+dt@kernel.org; conor+dt@kernel.org; p.zabel@pengutronix.de; cix-kern=
el-
> upstream <cix-kernel-upstream@cixtech.com>; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org
> Subject: Re: [PATCH v10 2/4] clk: cix: add sky1 audss clock controller
>=20
> EXTERNAL EMAIL
>=20
> Hi Joakim,
>=20
> A few questions / issues mostly related to pm runtime usage.
>=20
> On Mon, Jul 20, 2026 at 01:15:03PM +0800, joakim.zhang@cixtech.com wrote:
> > From: Joakim Zhang <joakim.zhang@cixtech.com>
> >
> > Add a platform driver for the Cix Sky1 AUDSS CRU. The driver maps the
> > CRU registers and registers mux, divider and gate clocks for DSP,
> > SRAM, HDA, DMAC, I2S, mailbox, watchdog and timer blocks.
> >
> > Four SoC-level audio reference clocks are enabled as inputs to the
> > internal clock tree. The driver releases the AUDSS NOC reset, enables
> > runtime PM and instantiates the auxiliary reset device.
> >
> > Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> > ---
> >  drivers/clk/Kconfig              |    1 +
> >  drivers/clk/Makefile             |    1 +
> >  drivers/clk/cix/Kconfig          |   16 +
> >  drivers/clk/cix/Makefile         |    3 +
> >  drivers/clk/cix/clk-sky1-audss.c | 1211
> > ++++++++++++++++++++++++++++++
> >  5 files changed, 1232 insertions(+)
> >  create mode 100644 drivers/clk/cix/Kconfig  create mode 100644
> > drivers/clk/cix/Makefile  create mode 100644
> > drivers/clk/cix/clk-sky1-audss.c
> >
> > diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig index
> > 1717ce75a907..cfcaab39068a 100644
> > --- a/drivers/clk/Kconfig
> > +++ b/drivers/clk/Kconfig
> > @@ -509,6 +509,7 @@ source "drivers/clk/actions/Kconfig"
> >  source "drivers/clk/analogbits/Kconfig"
> >  source "drivers/clk/aspeed/Kconfig"
> >  source "drivers/clk/bcm/Kconfig"
> > +source "drivers/clk/cix/Kconfig"
> >  source "drivers/clk/eswin/Kconfig"
> >  source "drivers/clk/hisilicon/Kconfig"
> >  source "drivers/clk/imgtec/Kconfig"
> > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile index
> > cc108a75a900..87c992f0df54 100644
> > --- a/drivers/clk/Makefile
> > +++ b/drivers/clk/Makefile
> > @@ -119,6 +119,7 @@ obj-$(CONFIG_ARCH_ARTPEC)         +=3D axis/
> >  obj-$(CONFIG_ARC_PLAT_AXS10X)                +=3D axs10x/
> >  obj-y                                        +=3D bcm/
> >  obj-$(CONFIG_ARCH_BERLIN)            +=3D berlin/
> > +obj-y                                        +=3D cix/
> >  obj-$(CONFIG_ARCH_DAVINCI)           +=3D davinci/
> >  obj-$(CONFIG_COMMON_CLK_ESWIN)               +=3D eswin/
> >  obj-$(CONFIG_ARCH_HISI)                      +=3D hisilicon/
> > diff --git a/drivers/clk/cix/Kconfig b/drivers/clk/cix/Kconfig new
> > file mode 100644 index 000000000000..c92a9a873893
> > --- /dev/null
> > +++ b/drivers/clk/cix/Kconfig
> > @@ -0,0 +1,16 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +# Audio subsystem clock support for Cixtech SoC family menu "Clock
> > +support for Cixtech audss"
>=20
> s/audss/AUDSS/
>=20
> Or how about spelling out Audio Subsystem Clock Driver

Will change the menu title to spell out Audio Subsystem (or use AUDSS).

> [snip]
>=20
> > +static const struct clk_ops sky1_audss_clk_mux_ops =3D {
> > +     .get_parent =3D sky1_audss_clk_mux_get_parent,
> > +     .set_parent =3D sky1_audss_clk_mux_set_parent,
> > +     .determine_rate =3D sky1_audss_clk_mux_determine_rate,
>=20
> Does this need an enable/disable for the pm_runtime get/put?

Will comments below.

> > +};
> > +
> > +static inline struct sky1_clk_divider *to_sky1_clk_divider(struct
> > +clk_divider *div) {
> > +     return container_of(div, struct sky1_clk_divider, div); }
> > +
> > +static unsigned long sky1_audss_clk_divider_recalc_rate(struct clk_hw =
*hw,
> > +                                                     unsigned long
> > +parent_rate) {
> > +     struct clk_divider *divider =3D to_clk_divider(hw);
> > +     struct sky1_clk_divider *sky1_div =3D to_sky1_clk_divider(divider=
);
> > +     unsigned int val;
> > +
> > +     regmap_read(sky1_div->regmap, sky1_div->offset, &val);
> > +     val =3D val >> divider->shift;
> > +     val &=3D clk_div_mask(divider->width);
> > +
> > +     return divider_recalc_rate(hw, parent_rate, val, divider->table,
> > +                                divider->flags, divider->width); }
> > +
> > +static int sky1_audss_clk_divider_determine_rate(struct clk_hw *hw,
> > +                                              struct clk_rate_request
> > +*req) {
> > +     struct clk_divider *divider =3D to_clk_divider(hw);
> > +     struct sky1_clk_divider *sky1_div =3D
> > +to_sky1_clk_divider(divider);
> > +
> > +     /* if read only, just return current value */
> > +     if (divider->flags & CLK_DIVIDER_READ_ONLY) {
> > +             u32 val;
> > +
> > +             regmap_read(sky1_div->regmap, sky1_div->offset, &val);
> > +             val =3D val >> divider->shift;
> > +             val &=3D clk_div_mask(divider->width);
> > +
> > +             return divider_ro_determine_rate(hw, req, divider->table,
> > +                                              divider->width,
> > +                                              divider->flags, val);
> > +     }
> > +
> > +     return divider_determine_rate(hw, req, divider->table, divider->w=
idth,
> > +                                   divider->flags); }
> > +
> > +static int sky1_audss_clk_divider_set_rate(struct clk_hw *hw,
> > +                                        unsigned long rate,
> > +                                        unsigned long parent_rate) {
> > +     struct clk_divider *divider =3D to_clk_divider(hw);
> > +     struct sky1_clk_divider *sky1_div =3D to_sky1_clk_divider(divider=
);
> > +     int value;
> > +     unsigned long flags =3D 0;
> > +     u32 val;
> > +
> > +     value =3D divider_get_val(rate, parent_rate, divider->table,
> > +                             divider->width, divider->flags);
> > +     if (value < 0)
> > +             return value;
> > +
> > +     if (divider->lock)
> > +             spin_lock_irqsave(divider->lock, flags);
> > +     else
> > +             __acquire(divider->lock);
> > +
> > +     if (divider->flags & CLK_DIVIDER_HIWORD_MASK) {
> > +             val =3D clk_div_mask(divider->width) << (divider->shift +=
 16);
> > +     } else {
> > +             regmap_read(sky1_div->regmap, sky1_div->offset, &val);
> > +             val &=3D ~(clk_div_mask(divider->width) << divider->shift=
);
> > +     }
> > +     val |=3D (u32)value << divider->shift;
> > +     regmap_write(sky1_div->regmap, sky1_div->offset, val);
> > +
> > +     if (divider->lock)
> > +             spin_unlock_irqrestore(divider->lock, flags);
> > +     else
> > +             __release(divider->lock);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct clk_ops sky1_audss_clk_divider_ops =3D {
> > +     .recalc_rate =3D sky1_audss_clk_divider_recalc_rate,
> > +     .determine_rate =3D sky1_audss_clk_divider_determine_rate,
> > +     .set_rate =3D sky1_audss_clk_divider_set_rate,
>=20
> Does this need an enable/disable for the pm_runtime get/put?

Will comments below.

> > +};
> > +
> > +static inline struct sky1_clk_gate *to_sky1_clk_gate(struct clk_gate
> > +*gate) {
> > +     return container_of(gate, struct sky1_clk_gate, gate); }
> > +
> > +static void sky1_audss_clk_gate_endisable(struct clk_hw *hw, int
> > +enable) {
> > +     struct clk_gate *gate =3D to_clk_gate(hw);
> > +     struct sky1_clk_gate *sky1_gate =3D to_sky1_clk_gate(gate);
> > +     int set =3D gate->flags & CLK_GATE_SET_TO_DISABLE ? 1 : 0;
> > +     unsigned long flags =3D 0;
> > +     u32 reg;
> > +
> > +     set ^=3D enable;
> > +
> > +     if (gate->lock)
> > +             spin_lock_irqsave(gate->lock, flags);
> > +     else
> > +             __acquire(gate->lock);
> > +
> > +     if (gate->flags & CLK_GATE_HIWORD_MASK) {
> > +             reg =3D BIT(gate->bit_idx + 16);
> > +             if (set)
> > +                     reg |=3D BIT(gate->bit_idx);
> > +     } else {
> > +             regmap_read(sky1_gate->regmap, sky1_gate->offset, &reg);
> > +
> > +             if (set)
> > +                     reg |=3D BIT(gate->bit_idx);
> > +             else
> > +                     reg &=3D ~BIT(gate->bit_idx);
> > +     }
> > +
> > +     regmap_write(sky1_gate->regmap, sky1_gate->offset, reg);
> > +
> > +     if (gate->lock)
> > +             spin_unlock_irqrestore(gate->lock, flags);
> > +     else
> > +             __release(gate->lock);
> > +}
> > +
> > +static int sky1_audss_clk_gate_enable(struct clk_hw *hw) {
> > +     sky1_audss_clk_gate_endisable(hw, 1);
>=20
> pm_runtime_get ?
>=20
> > +
> > +     return 0;
> > +}
> > +
> > +static void sky1_audss_clk_gate_disable(struct clk_hw *hw) {
> > +     sky1_audss_clk_gate_endisable(hw, 0);
>=20
> pm_runtime_put ?

No. Runtime PM is handled by CCF: rpm_enabled is set when the provider has =
PM enabled before registration, and clk_prepare() (as well as set_rate/set_=
parent) already calls pm_runtime_resume_and_get() on the provider. That run=
s our runtime_resume before clk ops touch the CRU, so extra get/put in the =
clk_ops would be redundant. Doing get/put in .enable/.disable would also be=
 wrong because those callbacks can run in atomic context and must not sleep=
.

> > +}
> > +
> > +static int sky1_audss_clk_gate_is_enabled(struct clk_hw *hw) {
> > +     struct clk_gate *gate =3D to_clk_gate(hw);
> > +     struct sky1_clk_gate *sky1_gate =3D to_sky1_clk_gate(gate);
> > +     u32 reg;
> > +
> > +     regmap_read(sky1_gate->regmap, sky1_gate->offset, &reg);
> > +
> > +     /* if a set bit disables this clk, flip it before masking */
> > +     if (gate->flags & CLK_GATE_SET_TO_DISABLE)
> > +             reg ^=3D BIT(gate->bit_idx);
> > +
> > +     reg &=3D BIT(gate->bit_idx);
> > +
> > +     return !!reg;
> > +}
> > +
> > +static const struct clk_ops sky1_audss_clk_gate_ops =3D {
> > +     .enable =3D sky1_audss_clk_gate_enable,
> > +     .disable =3D sky1_audss_clk_gate_disable,
> > +     .is_enabled =3D sky1_audss_clk_gate_is_enabled, };
> > +
> > +static struct clk_hw *sky1_audss_clk_register(struct device *dev,
> > +                                           const char *name,
> > +                                           const char * const *parent_=
names,
> > +                                           int num_parents,
> > +                                           struct regmap *regmap,
> > +                                           const u32 *mux_table,
> > +                                           struct muxdiv_cfg *mux_cfg,
> > +                                           struct muxdiv_cfg *div_cfg,
> > +                                           struct gate_cfg *gate_cfg,
> > +                                           unsigned long flags,
> > +                                           spinlock_t *lock) {
> > +     const struct clk_ops *sky1_gate_ops =3D NULL;
> > +     const struct clk_ops *sky1_mux_ops =3D NULL;
> > +     const struct clk_ops *sky1_div_ops =3D NULL;
> > +     struct sky1_clk_divider *sky1_div =3D NULL;
> > +     struct sky1_clk_gate *sky1_gate =3D NULL;
> > +     struct sky1_clk_mux *sky1_mux =3D NULL;
> > +     struct clk_hw *hw =3D ERR_PTR(-ENOMEM);
> > +     struct clk_parent_data *parent_data;
> > +     int i;
> > +
> > +     parent_data =3D devm_kcalloc(dev, num_parents, sizeof(*parent_dat=
a),
> GFP_KERNEL);
> > +     if (!parent_data)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     for (i =3D 0; i < num_parents; i++)
> > +             parent_data[i].name =3D parent_names[i];
> > +
> > +     if (mux_cfg->offset >=3D 0) {
> > +             sky1_mux =3D devm_kzalloc(dev, sizeof(*sky1_mux), GFP_KER=
NEL);
> > +             if (!sky1_mux)
> > +                     return ERR_PTR(-ENOMEM);
> > +
> > +             sky1_mux->mux.reg =3D NULL;
> > +             sky1_mux->mux.shift =3D mux_cfg->shift;
> > +             sky1_mux->mux.mask =3D BIT(mux_cfg->width) - 1;
> > +             sky1_mux->mux.flags =3D mux_cfg->flags;
> > +             sky1_mux->mux.table =3D mux_table;
> > +             sky1_mux->mux.lock =3D lock;
> > +             sky1_mux_ops =3D &sky1_audss_clk_mux_ops;
> > +             sky1_mux->regmap =3D regmap;
> > +             sky1_mux->offset =3D mux_cfg->offset;
> > +     }
> > +
> > +     if (div_cfg->offset >=3D 0) {
> > +             sky1_div =3D devm_kzalloc(dev, sizeof(*sky1_div), GFP_KER=
NEL);
> > +             if (!sky1_div)
> > +                     return ERR_PTR(-ENOMEM);
> > +
> > +             sky1_div->div.reg =3D NULL;
> > +             sky1_div->div.shift =3D div_cfg->shift;
> > +             sky1_div->div.width =3D div_cfg->width;
> > +             sky1_div->div.flags =3D div_cfg->flags | CLK_DIVIDER_POWE=
R_OF_TWO;
> > +             sky1_div->div.lock =3D lock;
> > +             sky1_div_ops =3D &sky1_audss_clk_divider_ops;
> > +             sky1_div->regmap =3D regmap;
> > +             sky1_div->offset =3D div_cfg->offset;
> > +     }
> > +
> > +     if (gate_cfg->offset >=3D 0) {
> > +             sky1_gate =3D devm_kzalloc(dev, sizeof(*sky1_gate), GFP_K=
ERNEL);
> > +             if (!sky1_gate)
> > +                     return ERR_PTR(-ENOMEM);
> > +
> > +             sky1_gate->gate.reg =3D NULL;
> > +             sky1_gate->gate.bit_idx =3D gate_cfg->shift;
> > +             sky1_gate->gate.flags =3D gate_cfg->flags;
> > +             sky1_gate->gate.lock =3D lock;
> > +             sky1_gate_ops =3D &sky1_audss_clk_gate_ops;
> > +             sky1_gate->regmap =3D regmap;
> > +             sky1_gate->offset =3D gate_cfg->offset;
> > +     }
> > +
> > +     hw =3D devm_clk_hw_register_composite_pdata(dev, name, parent_dat=
a,
> num_parents,
> > +                                             sky1_mux ? &sky1_mux->mux=
.hw : NULL,
> sky1_mux_ops,
> > +                                             sky1_div ? &sky1_div->div=
.hw : NULL, sky1_div_ops,
> > +                                             sky1_gate ? &sky1_gate->g=
ate.hw : NULL,
> sky1_gate_ops,
> > +                                             flags);
> > +     if (IS_ERR(hw)) {
> > +             dev_err(dev, "register %s clock failed with err =3D %ld\n=
",
> > +                     name, PTR_ERR(hw));
> > +             return hw;
> > +     }
> > +
> > +     return hw;
> > +}
> > +
> > +static int sky1_audss_clks_get(struct sky1_audss_clks_priv *priv) {
> > +     const struct sky1_audss_clks_devtype_data *devtype_data =3D priv-
> >devtype_data;
> > +     int i;
> > +
> > +     for (i =3D 0; i < devtype_data->clk_num; i++) {
> > +             priv->clks[i] =3D devm_clk_get(priv->dev, devtype_data->c=
lk_names[i]);
> > +             if (IS_ERR(priv->clks[i]))
> > +                     return dev_err_probe(priv->dev, PTR_ERR(priv->clk=
s[i]),
> > +                                          "failed to get clock %s", de=
vtype_data->clk_names[i]);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int sky1_audss_clks_enable(struct sky1_audss_clks_priv *priv)
> > +{
> > +     const struct sky1_audss_clks_devtype_data *devtype_data =3D priv-
> >devtype_data;
> > +     int i, err;
> > +
> > +     for (i =3D 0; i < devtype_data->clk_num; i++) {
> > +             err =3D clk_prepare_enable(priv->clks[i]);
> > +             if (err) {
> > +                     dev_err(priv->dev, "failed to enable clock %s\n",
> > +                             devtype_data->clk_names[i]);
> > +                     goto err_clks;
> > +             }
> > +     }
> > +
> > +     return 0;
> > +
> > +err_clks:
> > +     while (--i >=3D 0)
> > +             clk_disable_unprepare(priv->clks[i]);
> > +
> > +     return err;
> > +}
> > +
> > +static void sky1_audss_clks_disable(struct sky1_audss_clks_priv
> > +*priv) {
> > +     const struct sky1_audss_clks_devtype_data *devtype_data =3D priv-
> >devtype_data;
> > +     int i;
> > +
> > +     for (i =3D 0; i < devtype_data->clk_num; i++)
> > +             clk_disable_unprepare(priv->clks[i]);
> > +}
> > +
> > +static int sky1_audss_clks_set_rate(struct sky1_audss_clks_priv
> > +*priv) {
> > +     const struct sky1_audss_clks_devtype_data *devtype_data =3D priv-
> >devtype_data;
> > +     int i, err;
> > +
> > +     for (i =3D 0; i < devtype_data->clk_num; i++) {
> > +             err =3D clk_set_rate(priv->clks[i], devtype_data->clk_rat=
e_default[i]);
> > +             if (err) {
> > +                     dev_err(priv->dev, "failed to set clock rate %s\n=
",
> > +                             devtype_data->clk_names[i]);
> > +                     return err;
> > +             }
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static void sky1_audss_clk_rpm_cleanup(void *data) {
> > +     struct device *dev =3D data;
> > +
> > +     if (!pm_runtime_status_suspended(dev))
> > +             pm_runtime_force_suspend(dev);
> > +
> > +     pm_runtime_disable(dev);
>=20
> Take a look at pm_runtime_force_suspend() in drivers/base/power/runtime.c=
. It
> already calls pm_runtime_disable(), so if it's not suspended then there i=
s a double
> disable here.

Good catch. pm_runtime_force_suspend() already calls pm_runtime_disable(). =
I'll drop the extra disable (or only disable when already suspended).

Thanks,
Joakim

