Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2100.outbound.protection.partner.outlook.cn [139.219.146.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0062736B93B;
	Thu,  8 Oct 2026 03:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791430259; cv=fail; b=jWOPXDqtiCDJLNqFnPrnQyqEteVLgtoqbkHuTOxO0Ct+RjR7ci+cWWLHLDxr6iA4J7ffvoL7LkpB3Q3tK4fHDzKhZWWg5uET7/cpLyKc1LeR4a3aUKqw36fIJ4E4K77IMCUpPEVL+b0jEoXYieIbFtxNWDQkpdNVcacDETyxmao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791430259; c=relaxed/simple;
	bh=bAL33paeM4Z/ZRx9aV/td1HAHXRuMBIHSj1MulnrnkE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RQ8jAO+uLI5jGtnp8UMtpgMh1VZdqsEiM2TV27FiC13Fy9gtciTsBkxDXycX5kEYR4M25nYqHUjys+1EFHnPiav81+oDAB5nv7DGt+9Lei0+I61QWmLgUAckngSa9h0hvBNwV3jtxPH2v6EeGbAqZeVAOdwYMy4SLrKw5r5JPXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VdcH/9RO/vSp4qMZxTCuNTm7lf4HGd7EzcYMbJSuFFFL43g0LkVmyQFUtd2QrpB6lqkRGXHtjGNg5un5KCtn0TbB9WyULiJzBT608Jyh/TRifzdfQbLQ9ol+WDUb3ZGSvAdzRYQe4s4GnhTmkzARh2SC+ecigJUwibvMf6U/wPrIv345rLZ3HyxG7/4Rr6HHPtBb/lLjq9oGEoPQGGr+NcAeCBmIpQt0Te4PBXxnYKzC7iLBbjE8TmeGcyYD2Ykh5M6SBwbEx7KObSGJ+0bv+CZTZkCguFCdSwEuHksJjpL3itPei8kOY3o0WZNm1F/9IOfpKMLWbfvcbG5e/hNNBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A2Y/Em41Atgv8hyRlVMFMU6Az/HfQv0Eftxoqga4lNk=;
 b=JnSwBV2xSMMwk2+BSHzQDPUEso5TUI6cmmCNsXvoNpyd+xzyEfZSjXCJPxmhYrP6kl0VIJGokagVRSxMgyo7tmKcpj8VhQ8d+Y8UMjKzeCXU26Izn48Wu4YGuD1qOIhZ5XSDFD0qp7EzXIpcBiIOLNUR6V2ZuUzwuiOk2QUFM5bD3lOIO6vJQL77FzzQlsCO+VOBNI1Z8jU70F7FXeM58zN6UU8U5xTDYIgba4ZGSsefmXvjwq28OoKfw2BFaWwAm0auKHntHam4lBylyBibkLFylUCtlno77pSiP1xuh6l0Dd0xQKPjy5kns0E08kFeIMoJ9bXDMePI47LoUUbFsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1313.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Thu, 8 Oct
 2026 02:57:01 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0496.015; Thu, 8 Oct 2026 02:57:00 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Jerome Brunet <jbrunet@baylibre.com>
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
	<linux-riscv@lists.infradead.org>, Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v5 2/8] clk: starfive: Add system-0 domain PLL clock
 driver
Thread-Topic: [PATCH v5 2/8] clk: starfive: Add system-0 domain PLL clock
 driver
Thread-Index: AQHdNtN7NA8V7U+etEm3PQ/xHlQDfLbnBYkAgATaQaCAAwgzAIAES7tg
Date: Thu, 8 Oct 2026 02:57:00 +0000
Message-ID:
 <ZQ4PR01MB1202E24B7DC2817AF0C691F3F2932@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260828095608.19955-1-changhuang.liang@starfivetech.com>
 <20260828095608.19955-3-changhuang.liang@starfivetech.com>
 <179075859479.1471718.5492634704694937513.b4-reply@b4>
 <ZQ4PR01MB120246C3208C10BDEFD32BCFF2882@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <1jh5j07bbd.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jh5j07bbd.fsf@starbuckisacylon.baylibre.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1313:EE_
x-ms-office365-filtering-correlation-id: fe9205a4-635c-4966-4c0b-08df24e7d324
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|1800799024|23010399003|376014|38070700021|56012099006|4143699003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 t5tC0esNDD5euEu8oVx3jzOsQ+eZcpAfu4t5cXmECc1zO3Qf0Y1V4Ydjb9niWCyx8V0eu1QCxXBNG/qT7HXFG4+xxav26PEXm88ynH4MosSEqawZlIQTiuB+TmDB4bS+F8zKLdhqn/I6L49S87hYwVxl1OI8U1R/HtmC+DfpV+oLXw+/iVTv8ETZ5ZLkJ99NpjmiJy7mwDh3btvCyLced78YZXRkq5m90C25AQMOWP3wlGWzIhX3ZRKFNCypV4tJlZNz/rEe2meELhlprQ12bLk/5Lq/Ik+Ky1P13HRMsJ+/6DQnude0C914G05zshqYBgubydTw6+UDV/DBwPpx701y06eFNn76dtwJHIqq9GHh2E+8FTsI27Rheld8zZuvwiE0ARbl2DcMswb/zpID0/ta4u6F8XaEC13T+Oc16TZvF8jPDqOerkStOWEpSBBa65KJz1MEUaPqhtRb8nWyTX/GKDeHCZj8nHfDX7oXvWTqQ9Yj6jF58RPet0e9M65uKZ7JKrxiQ+AUYbKiomvvy20PyyV+PobyBabzCd1V+dUKIf6pcUqJCaT4fS2rCYZh
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(23010399003)(376014)(38070700021)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?cuMRrnJpb2NlCF84FDKGqIj1Uao82DJ6b1HfOsgonznzwxQ0I9hwk9BKWArl?=
 =?us-ascii?Q?zJBvrbrTqsBi1/EWtO7zygZoob38rzkQAGLhVsdYaBk5hTHsxJZaCE4PH6ty?=
 =?us-ascii?Q?SgzwY2eJfYJHtICNb6dQf8PIOvUfeqjEHNLk323P6wggxdmUjWqrc+PRzhM3?=
 =?us-ascii?Q?F0Xd/2bPisdpQJgbqsqnwNBifABz37WmxOscyvOARf2sNJtTWfmiGTA3VAqO?=
 =?us-ascii?Q?rDTFM2AdN+UBeG/yXNuzFGEI6Ue/DbrfD5Mt/fTi6hS0U3ehNX2pzsZPyD1X?=
 =?us-ascii?Q?ANRvfk2ThMm5k+yrxnadUpZvYDuAxIO2fyQ+jzNPzwas7UEzwkCxgbwuBgWf?=
 =?us-ascii?Q?5LYjM8dBXVmMQ35Eut9lyc8MyelDYO5/jWyE6RzjGw/IPSK5971vDXbLOL5K?=
 =?us-ascii?Q?B/Mh01fywPa/ps8R+qbprYrtR51qERhR67ElsGf7+AMc7Y4KevlCqnAzzG3P?=
 =?us-ascii?Q?QEGrofly6S8CyiIpSPzSwNru6VSQWJltzReByO97Jio02qL/qYDfNL/QYy7d?=
 =?us-ascii?Q?uAuAzczO1oX6kNAXBJgoZkga9eGTJTicTa+yl+cPwtsbVxz6ItvtRwQMKbB3?=
 =?us-ascii?Q?YGYzxWP6EJQISxqJTbiquRJRYcjxNZ5Uhy20PVEH90nG8JHchsvrF2+RW8Sy?=
 =?us-ascii?Q?1FVNIrvo1rcdmjUEJIST0+hQRiB2SAyi3tKwT0wcEo1bomtwBUYMxWJgXyRy?=
 =?us-ascii?Q?qZWtrY8v2PiX1IT0TKyOGMXaSw7i3E8IbcJQ+h1aSCrWVkkA7tOEAA8tE+Ud?=
 =?us-ascii?Q?fhjHauUcXefEkfK4wvt4+d+qaoUFIU/aJ6DGFbFQvT0DYriwsYy8yoY+hHgt?=
 =?us-ascii?Q?P4DrODLeS+Xg4ZZWi6xfqDOUQg5caNEBwts0vM/jicPWZrUka585Jzc4lYwQ?=
 =?us-ascii?Q?NT4f0GWFA7kioYaGggrQT5pidhsctlmIOb4X+BlsM3vG/lG02IP5DTlZ/2jy?=
 =?us-ascii?Q?4esFM0C2mGcOpgHknASPqIUkGxSMKiRzMf+sHprxmQOojg+4Pbx9wslse1Mk?=
 =?us-ascii?Q?18G2harmB0VRlw6S2mdCukZkGTb8ZtYVn8GYbbzph7SbvYbmsdgRoof9GHJi?=
 =?us-ascii?Q?Hf5JIwJZ9k6EtACGU2XX76BQpl9bau+pnMw9lHLCC0EnoeZiN8w7POI5kRJr?=
 =?us-ascii?Q?Br+XJupNR/zuBt6jhq0yNK/BFYnzl5ZDd5JHEfic0NNCNefRqsENVMW8i5pQ?=
 =?us-ascii?Q?c9XjI8I30wj2alBrOFafI4e//3JwvaEs+5bUm4u29hSuZI8bslTuPyWikmoz?=
 =?us-ascii?Q?cHaVKh+t8rfUTRYToiFwacywIkg3lhaZVWHOJ764yd/lxRetAW4OjDJEPNO9?=
 =?us-ascii?Q?uLzBXCTWFZlKwj7rNIIG2FWPmFSjmm9Fv6HWVfjgDtuv3ZaoS2dfSCi79FAz?=
 =?us-ascii?Q?gzHMNg7MN0RJ/+cWgKIuCJbVfrvpiCAfmWVIOs/leW+2yq/6EFnn1Zm8VCaT?=
 =?us-ascii?Q?X7PkGSaLX+PBFSCR4/33bXhYuxegetbn8dcemsc/a7tXObAqZIdAcmxVP5W8?=
 =?us-ascii?Q?Iy+B7RfODFveglprou0G2/QJ9gs3HmEVHk3AU1O7RUEoXTuQRTxdcRm3yvTd?=
 =?us-ascii?Q?+//z4Mq0rXvRxV6TiajHrzhgvrgQUiN8pIt06I9ioU65kRNZ9pMlALgryWXG?=
 =?us-ascii?Q?2l4UN9EYl/JS+YHIMCKEv0uiKJR+2nMODvHcOjtH2ooB6aoVU3+oi0C6PtZ3?=
 =?us-ascii?Q?jELU6whogxMiAUhW2xHStuANZDK/vDxyYLt4iyp+yLBeowlNSvQnRVg0W8AF?=
 =?us-ascii?Q?XoBLB/xuk/Kl7LuL8HQzGns5zKAxWBE=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fe9205a4-635c-4966-4c0b-08df24e7d324
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 02:57:00.8017
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R7wiSPDWBF3WPcRNIQkVMAESPtENKPHRscAzib+J4WBHT0PQ357gy2jjz7WjyYJAecdzcpYxl2apAgoJBPEy4lqQF/SD3tkcZbMx5gw3A3sUsEtmTs+cC3PVaWzL1k1p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1313

Hi, Jerome

> On Sat 03 Oct 2026 at 11:02, Changhuang Liang
> <changhuang.liang@starfivetech.com> wrote:
>=20
> >> > +static const struct jhb100_pll_info jhb100_sys0_pll_info[] =3D {
> >> > +	JHB100_PLL(JHB100_SYS0PLL_PLL2_OUT, "pll2_out",
> >> jhb100_pll2_presets,
> >> > +		   ARRAY_SIZE(jhb100_pll2_presets), JHB100_PLL2_OFFSET,
> false),
> >> > +	_JHB100_PLL(JHB100_SYS0PLL_PLL3_OUT, "pll3_out",
> >> jhb100_pll3_presets,
> >> > +		    ARRAY_SIZE(jhb100_pll3_presets), JHB100_PLL3_OFFSET,
> >> > +		    CLK_IS_CRITICAL, false),
> >> > +	_JHB100_PLL(JHB100_SYS0PLL_PLL4_OUT, "pll4_out", NULL, 0,
> >> > +		    JHB100_PLL4_OFFSET, CLK_IGNORE_UNUSED, true),
> >>
> >> Please comment when adding CLK_IGNORE_UNUSED so people have an
> idea
> >> why it is needed and how it can be removed
> >
> > OK, I understand that there is an intention to remove this flag. On
> > our SoC, some clocks are typically not referenced by any driver, but
> > we don't want them to be turned off. We currently use
> > CLK_IGNORE_UNUSED to preserve their hardware-default enabled state.
> Perhaps in the next version we will replace it with CLK_IS_CRITICAL.
>=20
> CLK_IGNORE_UNUSED and CLK_IS_CRITICAL do not express the same thing
> both equally need to be commented so a few years from now, we are not lef=
t
> wondering why this was added.
>=20
> You do not have a driver for this clock today. The fact you still *need* =
that
> clock show maybe you should have one and maybe someone, someday, will fix
> this.
>=20

OK, I will add comments according to the current flag.

Best Regards,
Changhuang
