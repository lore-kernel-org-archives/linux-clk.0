Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011045.outbound.protection.outlook.com [40.107.130.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AD5126BF7;
	Mon, 26 Jan 2026 23:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769470277; cv=fail; b=DHh4hE9tPQPsFM0Lhvm/U+fndKq19uuZ0zxMmKeRr96lzsSnB53ZqnqvHZkIC1Q05JaFBM24uT/Bi2LcFUArWEaI7Ohn7DpEElH48UIL5kQP193FIRyQlROM/Vi+cpFf4QJwXBJTIVo58nKD/v+J4idHCmV9FXBturNa2nADzU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769470277; c=relaxed/simple;
	bh=cyeIjQbhsK5psrr62lZpUQo9w+qjw1La+cgY1pDXMGU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=X9e//ZrZWw7QplVXLXYTX4Nma4bLCruyF/reS31f+mFJG38w4iwOcKA2o7zSWFVjo6QNz9jAooFRQDUIxU3CiPEOtLyzbZy5nU+YOklK+hneURSm1BuMvj6zbDAFaHfwVwVCqlh/8XLjTsuuhAYEpmSCCYNgPDWfASW3J3i6HJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VAsHvdM+; arc=fail smtp.client-ip=40.107.130.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VAsHvdM+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QuKyBCN68CNUuAYuj4cyX1bJs7d9bu40iN57AqoD3CtaE/TOE2BYI6UTHti7Ufj2MDAFtIXe46pFjwCJJOvUsWqvd030IoxyJuZJQL7M6ybnCpx5tb/p6NNfRtEUjan5M1uXQE2OWRToOeJoatA1SksbAD1uhDnLP4e5P+oPYMIC407PFPgsEnk6sd5NKZa5WhjdsqKp8vGt4EO1OvimiqNnRquOv6iPzuXodyo7IobySgIB8rmJTBzkwHi0KapWi6LeyZMxPnq8Jfjum4hIFqWun6C9uTgaM1RNY7nFuRxs3gl32mJ7s3/l38SkXencb2hI/LHNJBDWSN7AOuZolw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cyeIjQbhsK5psrr62lZpUQo9w+qjw1La+cgY1pDXMGU=;
 b=PjYkjb6M0nnpIKvmaF+3akQ3rBZYooMXPhCpHiuXhaiD7YKvczxMGg+3CJOhMSa0mJRzbCUWQuY551q3UYr6tmJ8Lu4p8RMmHY3Ej6lATrGiQH/FgtBphM8y46t2y4EcviUoek1B7W2Jj7Q28FbRzbhUf+bn27oOn847EkUgWsZD0Sdmsxc3kSZprndovDPN5SBklUqVUBjpOzSOOhqPwFHo2gwuq77TRj6pS7gguuTidP0e7GG1iodaTfAZpy1P0Vg3IsniiPliNZ4SyGUSuzpQNYold1r0VyAi3ph3U4JpR8bb7eIvY4mpJyAyikThxXWImGRrl5tm+Yqw0OsoNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cyeIjQbhsK5psrr62lZpUQo9w+qjw1La+cgY1pDXMGU=;
 b=VAsHvdM+UKUfFuub/9wPuJuZ5zQHRneHLO2JIwjatGo4xWcQ0vDj6M2INkbZteN2ID6gzGLhezm+cnOHrAA2v9sCSja2p2eoqot12f6g11wXfuMPv0zqOBZD5bAjsFZ2TmBtIk69UZaNNg5DL+yQDqSDBIwOSHIglrAvrQb8egwbcCpADMCvsNa7/0a3iVBb20nd8wS4Pw37EbSBG9383yseXEwyGZEm1pbYTr14XP07J1DUD5dJsT1ygsXBSTMA77jyecYuDQ8d8eGe/vgXb63WU256ANxGi5cGONp3oH8XD0OVeRJGTonYVRQaCspA+frZNCGcEzkkDIgco2ueDQ==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8037.eurprd04.prod.outlook.com (2603:10a6:20b:2ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Mon, 26 Jan
 2026 23:31:12 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 23:31:12 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Frank Li <frank.li@nxp.com>
CC: Abel Vesa <abelvesa@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: RE: [PATCH v2 1/3] dt-bindings: clock: imx6q[ul]-clock: add optional
 clock enet[1]_ref_pad
Thread-Topic: [PATCH v2 1/3] dt-bindings: clock: imx6q[ul]-clock: add optional
 clock enet[1]_ref_pad
Thread-Index: AQHcT1eeXm7IkE5n0EOdXK7vZOG80LVEWlGAgCBgLACAAN5igA==
Date: Mon, 26 Jan 2026 23:31:12 +0000
Message-ID:
 <PAXPR04MB84593733B9B971529DB368F58893A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20251106-ccm_dts-v2-0-12fa4c51fde7@nxp.com>
 <20251106-ccm_dts-v2-1-12fa4c51fde7@nxp.com>
 <aVwV8/rg2h2x4OwN@lizhi-Precision-Tower-5810>
 <uilxikzky53j7sg2barmsu6fkco2fiwgak3fh6eqc65iggmbge@7oogboikthae>
In-Reply-To: <uilxikzky53j7sg2barmsu6fkco2fiwgak3fh6eqc65iggmbge@7oogboikthae>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AS8PR04MB8037:EE_
x-ms-office365-filtering-correlation-id: 1bf0d878-b74a-45ed-a725-08de5d32fe07
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?R+Hx7MrobziPgG6SX7ruPXQPfSbSbI1KXP0V+0HihN902oTaDr93bdeVJTgw?=
 =?us-ascii?Q?C5VdgC4j6C/cexaKvgaOVvRgHAA3YGYB++/anMZuof1OVjvpLKx9MtTBVAzx?=
 =?us-ascii?Q?1wdIHxfBgXZJjYjxVmKtDhKdSj6oLAO7ofkkmthefziMzhOMzIqWwfE5n8xM?=
 =?us-ascii?Q?lcsgHUjFeb+Ae8LcJfJq8ZR+buBriI52I8xqKN6Yyz4w4RLPVOrjy9YNH5cz?=
 =?us-ascii?Q?NxXBkSeYwDLaJi1SOY3OTiA5+a3oxa+v4xks/VhRLvuSauYxmV/FBOiDeeZh?=
 =?us-ascii?Q?l4fQVmHKOhNpgCWLvauRqdOW8DvIo0OEZM2t/Ko8wM/jrQyYllwYMSVNBxqU?=
 =?us-ascii?Q?0+MaZoJSrD8q0hmJF/B15wGTM/80En9zfwnq3j0sSgkC6AFX9rz9R12eYYP1?=
 =?us-ascii?Q?GWaCe7GtLNJkdhHsbTg6b1VxshlpYmYu2Ta95b82FE2WYdalunEcSfzOJifa?=
 =?us-ascii?Q?vCKLhetVoRSSc0xpdVtNitNpT8t7k1JkfDxYkdFgWiXO1EWXcgaYqzaGuEbq?=
 =?us-ascii?Q?D0BdQPUIO3EladsF1AeCQVKpMdAwwvfKYeZjnqNZ9fjv7GWPg6TIlRVOn7ud?=
 =?us-ascii?Q?0M6oXpL+y2J5r2Hk4jsrx+lO9dd28fLIG6H9BFOQy9eE8ExYTiJObdyxMCQi?=
 =?us-ascii?Q?BXsVp6sCNhK3JrLa2kBos7ZwG7HMv0rvSgAlrP82JqSqVd1rMUcDbyMyX41X?=
 =?us-ascii?Q?TLPs5fJAa8oW4ccZpf7VcyQaiBtGgIqFgY8st1K6Rm7XXhaJ+rniydPcUoqD?=
 =?us-ascii?Q?sHnZNXDliCq1AgYMPJ0wfNgBaHbdilk/K8nZaI7quUpo/X1hMHz6zS4roypK?=
 =?us-ascii?Q?VA9kps/SxxRObGG7z9gvyaHSYOXNm/5ggq/duvXPyCfUfip30cZQcT+v3yqM?=
 =?us-ascii?Q?ara6pvYuSVnIs8v5Ycsp+7ykhvQEshjjVsbWHOF31Jf3KzQUS0hi2Fw6kPkM?=
 =?us-ascii?Q?i6QmMFjSTtzHrXaQI7Lv2UKahpPDOXoH60czetNfpYvbHylWAQlmsHElTysu?=
 =?us-ascii?Q?skF8IjzgR8tCvsy0dNusYRLWf5R7RDK0j6sYUxv5JKYj7gZ62QUmW5/f7TD1?=
 =?us-ascii?Q?GvW51hANXLCQgL2T1vGrkh4ZUx1Stml5BX4eGicq+Ycs+ltucd8LWx0nR25k?=
 =?us-ascii?Q?jU1GWbZy+tSK6M54gxg9q4vq0Z9J07zr3azCKNNYuaNU4NmnzxKX1bdOfA19?=
 =?us-ascii?Q?rDLngcbxiIvVNqBbS8cb1u7494YBqYIW7spWADSCyJdUt5r6PaVVp6bRySOo?=
 =?us-ascii?Q?FZgr24ZsBWGQ1sTMvxWFLGobHGLuAvt4b/LO/rCoPFAPNNesfD4GQcJPyNRp?=
 =?us-ascii?Q?RNy4mur5YiDpmAjZBmzri48PTQHhwFvLVCy7QqO+dfMW9W793EHtyjRV6Axj?=
 =?us-ascii?Q?zjY3dpoyXQGp8XcS9Oka7p24MB6OKBaGo5XIe+UEXdB9cI5EfHP8w/onnklM?=
 =?us-ascii?Q?8qzF8r2x0ofzpwN1m5C/8UfYqyd1okcvWi2SWXQu8mc9XOS9u6Hdga2uIm1i?=
 =?us-ascii?Q?gxbQST43kZdAoTu9Vt0JVM620F5HDIoqwoM8dDx9l4vaj8pg7dgKivRXcRLK?=
 =?us-ascii?Q?ni6EhHI9iiacgZ7URsC2GC+tekI0XjrhH0xUPxOqLbdOfXlRqjU1TAsU/DMe?=
 =?us-ascii?Q?ZgV8TbyE3Ei6hrjm1yVH/AA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?xA4C6K4ItqCb6Ril/Ya9wQE1FiQdC1neLy3Bp+2z7EHtNZD1qyJduzpulcFy?=
 =?us-ascii?Q?31YVNpg+78TV+Zpx2fCMs91shiK6DjhJnrkkj9KOruMXRxg+Sd+GibZeuEbo?=
 =?us-ascii?Q?LUTGFjyX6EOUyXInwFqJsWCz2NWAM9rk6w60W61E+g5Sb8qYxRdDGKkhcK8b?=
 =?us-ascii?Q?1vRLSlRZjaKM7ftZZH4PS+56/gHO5g/J8LUqmsFY3KwT6UC/Y7ajEd6axtmt?=
 =?us-ascii?Q?Y8Rarbx7+83/L3IDG7mzbN8BrKGYLteIuVK1GtG5eqUzloeUfXobfNtGARuc?=
 =?us-ascii?Q?9nkE6UB0KkHFR9dSzHXVUvqaHsNYGKSQze5ihTNBRbzdKuor1gqYBjFt63B0?=
 =?us-ascii?Q?EftfL2ROLPQyO6QRsIMxgmWLjXCfLN6B52aEUjzQ4f7IdIcaGeQZGLbjfYCy?=
 =?us-ascii?Q?/JO+sCEA70xkND2l8WRxT/cgBrcaTI74tUO6dItUlnrggGsMBmw4fEZ6SAjq?=
 =?us-ascii?Q?2KfAjqHC/EbAvVNk1NRLmowAiOXQwB2V6IHcQ+Bs4tjoy+Fb5bPeSQ+kyHEA?=
 =?us-ascii?Q?polpL8SbbYveeHAS9F6oGMNj/uCsMClqMmiJ8Yhgg+Skhf45qGXG/w/f/JQ0?=
 =?us-ascii?Q?+t+qxx9TUBxXD2aMHpQnzghQsYss/p1f8K3JHeCpLGyweMIeMPsE5ZvcyzeV?=
 =?us-ascii?Q?2H1Da9oCdmz4ptjBP6XerktHVPRshrwVfemiHrLsfW6oJOgzEVWR5BEcv44v?=
 =?us-ascii?Q?xOfY9V3E5TsFsPCUvj80fi+x56C2iiOJK7q/jyRtAYfjGPuW48fxFyQRUfSY?=
 =?us-ascii?Q?Zbh7ZhaBBQ2GtMN3CaiiHYllhXnhHV7R4iILnCBC4Phh52qVQ/AG9XMTIFDc?=
 =?us-ascii?Q?RoLgL6BZ5kfApKRkcvzYVpJ0zz9+82zGcHh9oLVChJ7mSJN2IApMrKyy/cdT?=
 =?us-ascii?Q?DOmnfg8R84QYjr8W1AdNV1ej71LQSyl5/9DahvfykwY87oMJcYCRL6k9j5yH?=
 =?us-ascii?Q?Xpco7UvOxQjbWZOs4e6v4RMgM8G5Cxm/Bh432XL20exJSkQcuKDeHlImRB8v?=
 =?us-ascii?Q?jsqYoauqZg+2TlVy2oz4OwYeV7rz4KfTB2KZEmgtX3XnIABSjh9c7c3K8HiT?=
 =?us-ascii?Q?GoM5YB/GeenpAAfMtwZ7coMMqAQmIYNeGrb+1zIQ/ilcOOMHUkftWhY475Y4?=
 =?us-ascii?Q?JSwQViaKfIKgY7EiNdmkW2szLV3p7oAttlUliTHimjCw64f9Bltu+La/HWjv?=
 =?us-ascii?Q?1jkWkAjiQzdXCOU95RdGWBA8kWQMitTAZJfj/Vce/Oq8OnxwYebjRIFzJjDP?=
 =?us-ascii?Q?DuRiOuMaPdnEnrqdaeqXQTDytFuCe1SGt2jHaVAuMs28na2KptAIZzecn5Xf?=
 =?us-ascii?Q?/t5By8v7xINmmlzUq4Sq4BYNGaZkVN3W5goG+sOWUMrowxf0fLu2Va/2HsXB?=
 =?us-ascii?Q?ra9mC1AuPc4zXyh0kueDyXj2zzr8VMtPy2kTMdCo91DrAkExbry/2IieuK/K?=
 =?us-ascii?Q?EvZXZsm4slLZt4/f9jNIYDWs9R9DIAJqjcbmjqyirq1faSwEjqdgk1q9ennn?=
 =?us-ascii?Q?kzRfiD1tkje5L9VeT+ew8pxwRu667E7tak2Yg4v7K3z8wYxm4PB45R8TT69n?=
 =?us-ascii?Q?wj98HfEoNwuylvlE0sZsQiUMBesK5vdGp2OjEFrnQwisX1EOKH5pmSK41q1B?=
 =?us-ascii?Q?aJCLrszkHrCnep1zC1iIT6H0hWLZgwZ+IchwENLLY86Q4sFrbwCiy2mzfAUP?=
 =?us-ascii?Q?1XS6KTs1NuwfwNiFr2aXDaWh1jDUPtm2vIGbUCTCOyDs0MW3?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bf0d878-b74a-45ed-a725-08de5d32fe07
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2026 23:31:12.4214
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M/tcjB079Y/eMBmUEuXE+qoUX73f8qSs2HYsmmeoC1PmtqJ4g2ACx7HCfe3Dz61b30wLsjXLFAyKvuChrU2jZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8037

Hi Abel,

> Subject: Re: [PATCH v2 1/3] dt-bindings: clock: imx6q[ul]-clock: add
> optional clock enet[1]_ref_pad
>=20
> On 26-01-05 14:50:11, Frank Li wrote:
> > On Thu, Nov 06, 2025 at 02:57:21PM -0500, Frank Li wrote:
> > > Add optional clock source enet_ref_pad for imx6q, enet1_ref_pad
> for
> > > imx6ul, which input from ENET ref pad.
> > >
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> >
> > Who will pick this patch? Abel or rob?
> >
> > Frank
>=20
> Missed this one. Sorry.

Just see that there is V3
https://lore.kernel.org/imx/20260121-ccm_dts-v3-1-820ce9b5fa38@nxp.com/

Regards
Peng.

>=20
> Will apply.
