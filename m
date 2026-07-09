Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023093.outbound.protection.outlook.com [40.107.44.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4960F3DCDB1;
	Thu,  9 Jul 2026 11:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783597300; cv=fail; b=Mpq+6PkBa0XvN1ID1Mk28e5tmHjMsfhZBfC5rgxseguE+2FmoFn2WL0xHUBFSCHHCeJQNmUuJBSUvTfeTHK5Xp1SNcFNwCEqtvWI3Ji7q679CsBlMzRg6WMk8aVGic8pZZS+ueiRrALlUVvV2NXFLCpkSz1X78S99FvdFb7THcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783597300; c=relaxed/simple;
	bh=c/1RiAH0qqfRF/Lmkvqjqyvpsibxezih2r9H+oD4BRQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gWvPOUUfDYFkjISnADx/tqaFyR14LDw0HF4nvzVKI27vYGvYfohmj+8djx0CFiKTQMEU+2FGVodGgcoD/JrVdIoYoA0V1G7ohQLmUT9zbm/rxEP7vqTOobAu9a5IS95lSBvuN83drZGviwKAKk8e73U29/SVToDpvDyNlpk+cK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZwCwzp1Sf8S8w9BphnTtruE8aWGSjOHA0PMKy94FoCW5wo96Hk7DD62Ng84X0jUWj5zO6yw7lGaoBZ3VaMfKeXkuG+iMYeKg4G0wIx+dFOTRUpuTk6ku/syQVH40kHZ733h7ospQ/h1gLSMD6YUxPwH/akPP6+p9ATJF3MXwj8Q8hfI9exV4PdT3SPX5RS27SwRefOEo9pkzN5CwBt2Plf8DFjMu/L/9J/3m4uxjT/QOUFABGO7IEGVgIerHYovYquCxoxVT7L77dY/5HCAluEVj4THPsveeDioA4LV2BSp/l/K2G18z7Xm7TbwTzvjAvC6+Qe6Lf6zrBA7VLbeo5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fi3dpORxWc7BEXzXZ0HZ/zfVNxMLiZDKAOqZRnaJFeY=;
 b=vzMwC8irziet6022UwbEzHDeEH9l6lJTRnqn0lBRdf8FrIaX1ZQtifo/Dt8ysuavVIpqe5emmbcrupJoDrXGs6xmg6SfSTyOqB+gTaJGb31IUlvH+7wk58+l5MWX4aHPGOo+9p52cqP5DP8YL/Blfd350IUFi3WDMXVcoZIk814GMwks45gf5FlfgDwvi/YIfE+CsnOi2KzKKMJBvis0m2p8MU96V8zh3DInAindEnFHksBhR97BIE7sTqJnaTNcQI/MfygzikR2VdLL/BIOwTYOhnXczIpZmjY3QqZFtWoZS1oOjnpOKnq32GzDXmxpMv6ZbPD/gDUrIf4oMiausw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com (2603:1096:101:df::13)
 by SEYPR06MB5205.apcprd06.prod.outlook.com (2603:1096:101:8b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 11:41:32 +0000
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364]) by SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364%5]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 11:41:31 +0000
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
Subject: RE: [PATCH v8 2/4] clk: cix: add sky1 audss clock controller
Thread-Topic: [PATCH v8 2/4] clk: cix: add sky1 audss clock controller
Thread-Index: AQHdCI4sgJ5SELj9hUii2FK6GmyvibZiTCcAgALSB3A=
Date: Thu, 9 Jul 2026 11:41:31 +0000
Message-ID:
 <SEYPR06MB6226AAAACF3A737EE7109F2182FE2@SEYPR06MB6226.apcprd06.prod.outlook.com>
References: <20260630124413.1814379-1-joakim.zhang@cixtech.com>
 <20260630124413.1814379-3-joakim.zhang@cixtech.com>
 <ak0q1pWZREYsvJ4f@redhat.com>
In-Reply-To: <ak0q1pWZREYsvJ4f@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6226:EE_|SEYPR06MB5205:EE_
x-ms-office365-filtering-correlation-id: 897a8581-e68c-4669-2085-08deddaf0570
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|38070700021|4143699003|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 V5HEmPCTvARQpM30pq/XsZ+GTo00IF6bZiV2DKO7ePHXl6lh7E3/GJChacmvnsDlDKegoV3CtXuq1cQVvkqcoWnvnyGTgrYReQQUz9j7QzVof20VF3KtbAuTz6GBI4tMrR/7a4W7PAf2du6QAD2JLAdnFt35v/+1QFU6QoTAWpPjqvvdHg4ZI5PJ6ZrnW6XXQfqoOXR72JpIsTm+npGmTRGsKoeTAmiRsguMuq56JfmDpwdkKk9qTYEg/sbRIR5gRXRAM5aN3h0/of7pNG+9N1YxhwbvPRMkQE+ljC8pV/cQFImWNQkcu1kt3HBnsF+SLCTLDaPYME2nFBwm/fpJ9YU9a2H/lmPwYM8gI1rQfc51OKu9ymLU3ZLxr8/BRlo2K8N6UgRmNXAkXb+seKoG29yMLqJ2eM0sctAfRhQQqnyZ+PhIS5zC7gMlNY7S8saGERrkoLRf0jdzCq2X8SAciQMKzJaB29vZ8PbN4rLZTAL+ZjKRKW1r9EvGxU4rpKQF2Uv7ESbtmm9ZjbOjDv7udm06tib33jTKC3YpBe1WX8x4rgI4SGyEjyt61eh7f3662DeydPQ+CXW5mJqIZbRq/o7THuGsoYJ3aSZxkwZt7tTibIsS5t+ROwmxteeA98jLfMefgFiJZUy9UfbW4mScMlfEzTz9CvKcmQXmTVjumG0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6226.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?GVaiIX6iOasCxjEq3djUc9P8mIVA/x9RtlttwVlCV9AiWLt+MLvKoApJlcbC?=
 =?us-ascii?Q?MyPUgkHGvLXOPU6DdzYeQpcLAB9lINLDXak5knYVeZt2nWLMSYUEU39QLbZm?=
 =?us-ascii?Q?6MPlmMNDWyI9fKTTVZ0IDXvUROHWDQ4sCgJpLpHgGDotItajW0I6g27hRxRF?=
 =?us-ascii?Q?DhCABQc8FzCcBTTqD0mvqw89ILfri2raElzy1vTnZVMRlKSKdQKOm/OHroK/?=
 =?us-ascii?Q?uMDYaOcRc4TsaS7IWUmFABLMgN9KLuucSr9EFKDas7O0q+ETm0S/VfvsvR7g?=
 =?us-ascii?Q?1Qug9/Ng3/vF3PWIk6gFcRpO7xEoHAyEL+JMxe7jLk/FLjjekcx8+3IZEiv1?=
 =?us-ascii?Q?AOGfsBmGUiK91No5Qx6T1qheS2188GWNzmjD9t+VxDdV11TqCD3lvytxsaPd?=
 =?us-ascii?Q?yDrA3jDKKC99aKUkOLbQ+d9dfjbEvxjv2TcIxaknSG+Ni6m24fXd8abqVhv8?=
 =?us-ascii?Q?qhyCKC8ZPDcICIRQ084LAku5hlzDSsvnZwk0YASBknRnv0Hv6W5txpUmq0PS?=
 =?us-ascii?Q?WTDmsablJeJ0f6lTpOUJgcUSkWhdw9fga0n6M+eFSsfxM3dxAvnTy+Svtkew?=
 =?us-ascii?Q?w4QfX9AbAu2suKBki5R9x+4YH+a7QfmGoxBtfhRbWBKAIcBDolj0Am3mtDJv?=
 =?us-ascii?Q?6VMnfhTp51efYa2I88XfJAYbVVyTf58baJc1j3BPcrd8W9SjzbvqCZq0SHy9?=
 =?us-ascii?Q?Lscje9zDeAR1BV785m1zfA13ur4ApuQzPS+aW/2EYGuWs5ehVhQFFpGvWzIx?=
 =?us-ascii?Q?QOg3mfkrIKv2uwjbo76Ewxj4JV0WAm8Ln6ZJ408sDsleR3kxMrhrfd0vPQWe?=
 =?us-ascii?Q?cyuRVJhOPyKptixnjDO/J/6oRAosSdCZePtzhrZNmNYSiaTppHcZ5OVz3mD9?=
 =?us-ascii?Q?O1Rs/Na96+pLUeDEeeoVqcERRpgM4m/0p9MZ6jibcJbOlAz/zPey/4XhUP0R?=
 =?us-ascii?Q?2Awep5kBK0YVwtdQP4wgr/ihm9G1dqfAPPBrZEGWM3fuP1qCuHO8MC6XPosV?=
 =?us-ascii?Q?muJzttBbuVbAfvwU7ZkiYU66kL4Z7qPcpnecqxx38EQ4UPvQgIVVelPEhTxA?=
 =?us-ascii?Q?CRbCQ67wYvxf2Yg9WNKeePZQbBzVQlsZgbfucsZoCv1uumRBrl3N28kZySuK?=
 =?us-ascii?Q?BreOk9TvF7wWR+HUep9k2cLlZ2YU2RIG9YHUhh1O++O9ficpCss85X1s+oKA?=
 =?us-ascii?Q?OtSpz1PnXuIzyggob4LA2Ye1phm14FX8qZGEdiB3e8CYQBPVrvjZ46jkYJHj?=
 =?us-ascii?Q?6bUM9flYn6bocEbsrJELw+te4lSGBUIBZAnJ0KV47rUNzv0mVgAlPptEViq/?=
 =?us-ascii?Q?XKy/liufkXKaU/SDAYIs/4le1ZqDI080W7BXFOVnVkA68o/4MdUs2wHiGlKT?=
 =?us-ascii?Q?tQdDCGNcZFqJ164T7OoEIJLm/j1DtR2+rLOliWiU5COD9q0pA3VSw5gtno8F?=
 =?us-ascii?Q?agFpZjqsTb8L4IxXUtrjlINx0Eh4oTnk0oxBAF/sIYBZt8aAFiWw9n1+BkMe?=
 =?us-ascii?Q?mrKy4HeQyW9oIEAQc1L447H23iHeqXckksEckydEk8q1maR9utpKppJfeMtt?=
 =?us-ascii?Q?NogU4vgDhZNjqGgTIC9y1JhhKLHN6myIMVuCLVR5P/LBDFvL6+jDoDrEXZcv?=
 =?us-ascii?Q?vY1SBYcsbSyev/on4WNtH81nFSxswmtd7FKgeIsBrw1h+7je3NwUtrB4+aQM?=
 =?us-ascii?Q?CNca2vSshkc/m4pAUDgdEhigWVf7Cn0YOVnC6YcG5RoiXbOcKXIO/3356QDY?=
 =?us-ascii?Q?/Mpe1DPt5Q=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 897a8581-e68c-4669-2085-08deddaf0570
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 11:41:31.3260
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uLIfahgcR4XZVvwkzFa/qxrxEhEQEe9F6ljcAyMXWU7qnCIsa48CQm5rhlpvoPCP7UPLrnk335GpGI4SJ82B3JTlAHd+xh/XZOI8ko90zh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5205

Hello Brian,

Thanks for your kindly review.

> -----Original Message-----
> From: Brian Masney <bmasney@redhat.com>
> Sent: Wednesday, July 8, 2026 12:36 AM
> To: Joakim Zhang <joakim.zhang@cixtech.com>
> Cc: mturquette@baylibre.com; sboyd@kernel.org; robh@kernel.org;
> krzk+dt@kernel.org; conor+dt@kernel.org; p.zabel@pengutronix.de; cix-kern=
el-
> upstream <cix-kernel-upstream@cixtech.com>; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org
> Subject: Re: [PATCH v8 2/4] clk: cix: add sky1 audss clock controller
>=20
> EXTERNAL EMAIL
>=20
> Hi Joakim,
>=20
> Thanks for the patch.
>=20
> On Tue, Jun 30, 2026 at 08:44:11PM +0800, joakim.zhang@cixtech.com wrote:
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
>=20
> [snip]
>=20
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
> > +     const struct clk_ops *sky1_mux_ops =3D NULL;
> > +     const struct clk_ops *sky1_div_ops =3D NULL;
> > +     const struct clk_ops *sky1_gate_ops =3D NULL;
> > +     struct clk_hw *hw =3D ERR_PTR(-ENOMEM);
> > +     struct sky1_clk_divider *sky1_div =3D NULL;
> > +     struct sky1_clk_gate *sky1_gate =3D NULL;
> > +     struct sky1_clk_mux *sky1_mux =3D NULL;
>=20
> Reverse Christmas tree order please.
OK

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
> > +             sky1_div->div.flags =3D div_cfg->flags |
> CLK_DIVIDER_POWER_OF_TWO;
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
> > +     hw =3D clk_hw_register_composite(dev, name, parent_names,
> num_parents,
> > +                                    sky1_mux ? &sky1_mux->mux.hw : NUL=
L,
> sky1_mux_ops,
> > +                                    sky1_div ? &sky1_div->div.hw : NUL=
L, sky1_div_ops,
> > +                                    sky1_gate ? &sky1_gate->gate.hw : =
NULL,
> sky1_gate_ops,
> > +                                    flags);
>=20
> Please use devm_clk_hw_register_composite_pdata() to make sure that
> everything is cleaned up in the expected order relative to the other
> devm_*() calls.
OK

> Please go through the Sashiko feedback at
> https://sashiko.dev/#/message/20260630125936.E186A1F000E9%40smtp.kerne
> l.org
> and I'll do do a thorough review on the next version.
OK, I will fix the feedback which I think is reasonable.

Thanks,
Joakim
