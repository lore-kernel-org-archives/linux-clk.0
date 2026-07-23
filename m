Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023098.outbound.protection.outlook.com [52.101.127.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2142D7386;
	Thu, 23 Jul 2026 09:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784797968; cv=fail; b=tWS/JQIhwjJl+acYPi47zTNnLvND3PV91XU5Fm8tTmOC+loQdm1cq7RvNZdL0ELJ8GLkbkJhwJG1NUNU5IQj5gl18qdJgsIMAf5gv29kmUr5K4GL3xwOmjvdQZGU3y2qeiDPmYJSOmwyItjgHeAT3xDG4xj0krGuqnz3ApPNuxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784797968; c=relaxed/simple;
	bh=mzjQfTmt7gP54D2rM47h19Fw30UayfHuOr2YAt0PLp4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DeUVVwBUBXLJpMa0c9GBA4/mDu3cLtsHry4K498/ywZn2k7G/TWp9fwx6ttOek62gWGEhEm0QPZeHK8sU+GQNESZW65YoIp553bljgxpAzb2Sk25Uflb3gONh2iuAN+xsp+CSg9r8ZlsfZYcecRfCde/hJ39sNP4hqFPkiD7XZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F5vQutM+9FT1ooOw4x0rUlnIPN9EfOIMYJ8BjfJ7pb8fte54JGU9Ax+c/TnDRdnswic5LCY6npXmuas9GJHClVtdHufVtcWLFe4K4ZvaPe5bau0SRHj4isJRgz7pTB1deGcRPeWddH4lu3xyER/En2aSp64Ni1phrnt6Gv4jvduBHvgpnpFXK2/M+AmKPKJUMQB9homWmemgpeETdklKQnbJDblUdtr07OBLs9OYZACsQcnGyJjxZI+f9FGodIrqbn78jLDasrhINMVx0pV+cju+7HzazK5MXjUuxxnh85cnnjpLWaE90cLekBIU+SmM/vV4oV3Ma3kBnZHnDSornA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDZffqsCZo58RWzt9yrUJl4khkOUa/WQYOIhBM9hIgA=;
 b=H+gfBqUjrndmK6shnVzr36dMp/TsTEhQBTQK2tsycoOsyBrba1DZoSOq+Tj4l9K89AIdl49/Qy6vby2Wr8Se6onPNJgtLCLg7k9UPl6nGQpb6SqiZSqgmPAPzzhdoACyL6vBsIJxFhEvpM1NItzeTzcLC/A8eKpVB20dwmON8XpsDxQJIne16yg7Hq5thFJ74GjaEGQTGoDa3AU4f++h8STxQRzjrlyfpWIREM3hhp+h5U2pW7qg/qSB6G50P84GmH1bgnJxYl8PfzYU9VexHiAi6k6E5oxIyxNNCTscQkpj8DSJxCorb867mtEadNx8/+wA3AuZR3QFox6cTFIudw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com (2603:1096:101:df::13)
 by JH0PR06MB7200.apcprd06.prod.outlook.com (2603:1096:990:9a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 09:12:43 +0000
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364]) by SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364%5]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 09:12:42 +0000
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
Thread-Index: AQHdGAa+uATadAQ190WzEUhpNkaxArZ4jFaAgAA5c+CAALPkgIABXHnQ
Date: Thu, 23 Jul 2026 09:12:42 +0000
Message-ID:
 <SEYPR06MB622646932266B104660278F882C02@SEYPR06MB6226.apcprd06.prod.outlook.com>
References: <20260720051505.1252774-1-joakim.zhang@cixtech.com>
 <20260720051505.1252774-3-joakim.zhang@cixtech.com>
 <al_vGXIW2bP8uGJ5@redhat.com>
 <SEYPR06MB6226C74C33B3EE124E3E0F2C82C12@SEYPR06MB6226.apcprd06.prod.outlook.com>
 <amC2MY4QaCfCBdm-@redhat.com>
In-Reply-To: <amC2MY4QaCfCBdm-@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6226:EE_|JH0PR06MB7200:EE_
x-ms-office365-filtering-correlation-id: c4db185d-a1eb-4d38-c945-08dee89a8d6e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|56012099006|10067099003|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 zKdqu0bGAb381yyc9CWssrmXtR0JKOQh6RRSoivRcu3G/OHOaGcPPYtcyr709yIE+Q+qdLqxiHf1d0TvfnCXr2vBQLpe4c3ohVDoiZgpf4i26aeYYM0Yymb/9oliG0KiFZixgt+OoddmTKaLBbwIcSffWenZQaUp5HDImPVNsbf91DiXsKE4W2jnYrm3Xanqoki+bAZAKGzEpvLYYqlFLgWUSoSPxEtbiwHIkQzwEvMsTRqJK3szOCKv+nF2h8um8GctAN528kRHZO/IDwhCZNnJCmkQe9sXnpRkiDpaR69Tmz4dAdfUBHw6rmwKxN6LwZq/NFT0KT/6WKV3MXt+HumP4HalfeQS59vkseDNyVOePWkmD9IvoXly9RLFYyqoLV2O2p2PvlWy06VFQVKSprj2eNPa8apSGzkUxFdoK1doI/4Q2AJRA82iIIXfTEP7ma02rICDbQCIFFyIpP2C2grWBYHQoC23SVEwlUU2i7P8oujy3mnK+/Y96LHwoscvSUM8s2qbbtAkLZFFmQt00GEk55epoCwluCVeAO8rd4faGNjBdfy0DpezeL/twavUbs3OYXoCWH5Jq4RCn61JkOJYDwsoAJ7S+XsFHokvvpYSVt674ds87K5pwWf474c8bY4BAGOHPP568imua8NGhhIowztg4phE8FuPDSNBBZ/NeBPP9KgHDTXnTJiJatap3r/uj+Y11iskm0FFDiEUU0xV7zsvZ+2l54zQ3vnXsfc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6226.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(56012099006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?wyk1/tjHAyxWmpsX8QhfOEyVdWxpWmME/RxwYFGif+ttohheImnanZiXq2dN?=
 =?us-ascii?Q?6dxeCtR9015Vntv5orswmpcouSUG+WnTWpfuT8r4WJ/qXUdHXuyU8EGYdGLC?=
 =?us-ascii?Q?ZzaCEEls6Lqdg9yW9C3iN0rw5gvlxL3U9FAxi6ReWIEX0yPQYT8BfCczFFeH?=
 =?us-ascii?Q?HG9ibjOEJ2w44U6J1tCIyBtHoOAv1/Kimk4ItIl/MP8B1ARzvZz+iVvnyPhs?=
 =?us-ascii?Q?hSK0tos+/KvdbMeU8V1f90AIMC7xNvxQSD796g2/fQhbu3yCPfil9xTrn4Bl?=
 =?us-ascii?Q?VcZee/Kkj3LYTHffQuNlRvksqQA1aHQVO3ZDuleXyLk/eQRpMwR/sFjR8p7x?=
 =?us-ascii?Q?xXodbkOG2ttdPIecq6A5GG33EhoE4XHZFYr6FcxYTI4kSjp8QT9URIdfqFDW?=
 =?us-ascii?Q?bl5jtbTeXqPpLpPPqYpeCEciNLrDWSR6HKDanWlFKE106zyb0+rUjtIzD7cB?=
 =?us-ascii?Q?dChl9uk17GBss1hBgl7O4k5+55InFdVQHNKhZCVwYFiX/5P6tOCINoF9nJ+P?=
 =?us-ascii?Q?7U22B7PKjegF1yOO6X3nhm4G+bpWf7169VfAtXs/gVZGOUOeWOUkfik1IOAK?=
 =?us-ascii?Q?O6p1OyLu9EXKr585O1XvfiPm34PuBmHCoFEoQdwcCuiLFDzgU7oBARtJ5Ss9?=
 =?us-ascii?Q?MVQvFiF+1mPMAuwdh19VFGyFzD+buCtsBIF0G99GxeO6mNzEUBOsAeBy+KrF?=
 =?us-ascii?Q?2rSlvw36IfWl64e+6Wf02H0iOCCpOcRZ0vKZH+ujTeIrfH5RyGTLKDVglXKr?=
 =?us-ascii?Q?XGLg0A4Iiwo/mK1cBTEHfNYYYpfQY+oO1uUlkD7OzrviBlhBZlh32p6S/g/D?=
 =?us-ascii?Q?kMeTwW2YzyDMC1yJEg6rdrio5chMWRfDGP5PuxbhHuuS4ZnBBQbOo5E+uDKE?=
 =?us-ascii?Q?GWTutALfO2ShyfoDhjoY9MH17J6XuEJppjnMaW0eqUuXMlKGLyXWcY/l288b?=
 =?us-ascii?Q?GjRXXKXn0JDgKOfNCQ6JdE+u17vlSy69zq4yuqWJvIruPjpZxt+L3ZMNm8Kc?=
 =?us-ascii?Q?KyrP5ph24gZF8QL6hBV9W9HObLdi2yTx0BaxCI1rUcySXUfdXPY0t3FVsmT3?=
 =?us-ascii?Q?3yApeJCJ2lk49kwb/LFzj3pfP0yygf6KnWwrz5AAEPIZS4QMsLwA3i5b7Mg3?=
 =?us-ascii?Q?PZTJf35jbSDXkTRDB8lPJQSShYjb0zTmYpSm7Ri/K3T7vb1bhWztk+Qydby+?=
 =?us-ascii?Q?BE5taVkU3C+8PR57klZ+5OUDE7j/h/mopAtBytdk8AdpDcPI0aEYNvmWvUoo?=
 =?us-ascii?Q?0MEY+JGYt6fdN6N0K59j7H+ouZy740p9W0N7dsoVaHE2vFy2Nx2ysjUD0T3x?=
 =?us-ascii?Q?QqLp4S71VibMSoPvLcBRbMVs8G7RlQdQBGtgISgnuSeD2NfgkXJQmCkiz20S?=
 =?us-ascii?Q?n8WhlaOI9doo8skxynOYwyfZtm5dXWiZfLNUPyh2grcRp9RpH9tLI04sLxq1?=
 =?us-ascii?Q?KTOmdS5AKsl3+nxtmv4b26LY9hgtlNm7R2Q2AGL47CvE37sNqZIgqD1xUpGY?=
 =?us-ascii?Q?4mx2q12zp5opyiVlaKL6N0m7YjCIW20SO4lnvEESkTEjjwt/mt4lEK5dwvJe?=
 =?us-ascii?Q?cBzmLGCub8xcg7Bm4qEjYGMw9i+axWakMTwlmcYmOYW2yVyhtH715PjjFtjV?=
 =?us-ascii?Q?XcntzbrJWMH1RGI8AtyEeTfnBjxkgR4CMfyOCYPnfaXOrs5lqJ/Jyuk4qhm0?=
 =?us-ascii?Q?tibFmqqrfnFgPjIdmDdzoraOe6uqAaoPTaCdUedHe4rn4XuxkNr0+/L8mBTq?=
 =?us-ascii?Q?QDOr3uGOVQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c4db185d-a1eb-4d38-c945-08dee89a8d6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2026 09:12:42.8363
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kpnhHRWr5ttyYqKBBKjYM0npklxsG77HfEhsBWbZyQwcXomzBvRbbi79b5anMZEpKT3Igy1441SqbKQp4UBsur+oklV/xLLVW+QvMekYtRo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7200

Hi Brian,

> -----Original Message-----
> From: Brian Masney <bmasney@redhat.com>
> Sent: Wednesday, July 22, 2026 8:23 PM
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
> On Wed, Jul 22, 2026 at 01:45:52AM +0000, Joakim  Zhang wrote:
> > > > +static void sky1_audss_clk_gate_disable(struct clk_hw *hw) {
> > > > +     sky1_audss_clk_gate_endisable(hw, 0);
> > >
> > > pm_runtime_put ?
> >
> > No. Runtime PM is handled by CCF: rpm_enabled is set when the provider =
has PM
> enabled before registration, and clk_prepare() (as well as set_rate/set_p=
arent)
> already calls pm_runtime_resume_and_get() on the provider. That runs our
> runtime_resume before clk ops touch the CRU, so extra get/put in the clk_=
ops would
> be redundant. Doing get/put in .enable/.disable would also be wrong becau=
se those
> callbacks can run in atomic context and must not sleep.
>=20
> OK yes I forgot about that. Yes, I see it now and agree it's not needed i=
n the driver.
>=20
> I think do the two other minor cleanups I mentioned and I think this driv=
er is good,
> at least from my vantage point.

Thanks for the review and for confirming that part isn't needed in the driv=
er.

I have already posted v11 with the other two minor cleanups you mentioned. =
Please take a look when you have a chance. If it looks good to you, a Revie=
wed-by tag would be much appreciated.

Thanks,
Joakim

