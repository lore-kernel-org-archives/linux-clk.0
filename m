Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023074.outbound.protection.outlook.com [40.107.44.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C64F1EDA0F;
	Sat, 30 May 2026 13:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780149097; cv=fail; b=lHnJdbX12jfHsxQSRcTKB/xJ2Aao/4+sjmt/75OqnTaVt+uz4HKoQrv8+OO4lAV1J6V2F4rt9s0nWLA6weDVOScKtToeQ7f1k2noA2krrA8I0kk2g0pxbeOOtYTnbYzaRDXSgmWuWZRiPhqy1uQA5HfINSjHuFGnfBuLZkQ+ojA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780149097; c=relaxed/simple;
	bh=/TQBgZowrrC4XcJ0q1baMLVkEMjdaVce+RbWBj9uwl8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SMY5tWd1W6d4z5455+QLsuMaFs00QkBNVyY9+b4iYqh6hiJ3w9EXf8bc99bzjbz4TzEzVfie4dcXpTnMPf2RUbUKzKY1/aNwFpi84P0VgT+qmT8lzFwDjf5imsJXlQdUY3DIOQsJ6KTGJ+cZyzFjyHGiY/cec4lzGSajhAm4BVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LbCEFjwx7dnuW+/xEfslOtnflUHybLJwFmuvrtlDnagsnBRq8dzJhn1AQJbJoJzkS9uen1h+QWZysgC5cjhg8EoyndOG8V0WI7pr6v3pOu5jWbMsKDKY0Tc8ntoBg+ROXo7QvzLZyTTZqt8DAP9bRQhkyzGCUMFTCq3SVjJ7n3xe/zEvOHkoxivUkHVrnWNuJBtYvbBlKMA0tWP1XMvJOLsc/7KSTQvEeXAa//BqRes8vkD0Vf/p8+qUX/VDCykB2fuXyY2YsZJuLrxgUim3K9VzTEmVi9lXqLY3r5tT+rNxGj/X1iB3VdXYM1Lh1EXA74xcucIqOdkbRSWCntQLGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M+RM1wwsCpvSH7Ne/W37XnhhINATLQAXysu9CCMNz60=;
 b=AqXJIMfusNMHcIzRSs9BLoHAiyY7IKdxxDKtOgXWhWeVe/nhffelLS3cXeS+QwSZGiGzHJLMiPnWpYsXeAYZjQiX9i6cgv8+Ei8dozzZPeybC0r/iovTi0lJQeWST9alAQYulhUcFoernfo5IUy/6LdGcDufz/z1geUk69JfyzBymVkztAHj9P1p5QFIvffId0N6V2ZfcSJj7v0UVgApLDSV6HZo/vHE0KH5BJKTqXS2r5exLzwpJaNsHCLx7IO9VOhupuPDLyIUbhnfL1YD9St2oRw+vLBtcPdJ6fiYIWHqOti+MJ2Zd4K0u/o6b5RQeJzSSsaKoM4WUbqkgCYg6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com (2603:1096:101:df::13)
 by TYZPR06MB6191.apcprd06.prod.outlook.com (2603:1096:400:33d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Sat, 30 May
 2026 13:51:30 +0000
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364]) by SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364%5]) with mapi id 15.21.0071.015; Sat, 30 May 2026
 13:51:30 +0000
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
Subject: RE: [PATCH v1 4/7] dt-bindings: reset: cix,sky1-audss-reset: add
 aduss reset controller
Thread-Topic: [PATCH v1 4/7] dt-bindings: reset: cix,sky1-audss-reset: add
 aduss reset controller
Thread-Index: AQHc79pg3e8btjBSt0qe7LG9PgjwBbYmSNcAgAAu4SCAAAXugIAAGAEQ
Date: Sat, 30 May 2026 13:51:29 +0000
Message-ID:
 <SEYPR06MB6226F49E303DD786090B715282172@SEYPR06MB6226.apcprd06.prod.outlook.com>
References: <20260530021642.64059-1-joakim.zhang@cixtech.com>
 <20260530021642.64059-5-joakim.zhang@cixtech.com>
 <dba033ec-1939-40b8-8aa0-26750b9bd591@kernel.org>
 <KL1PR06MB6236ED153961B695117A0B9A82172@KL1PR06MB6236.apcprd06.prod.outlook.com>
 <55df95c3-4c63-40d4-8da5-9b33f52d1f5c@kernel.org>
In-Reply-To: <55df95c3-4c63-40d4-8da5-9b33f52d1f5c@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6226:EE_|TYZPR06MB6191:EE_
x-ms-office365-filtering-correlation-id: 801f930c-a7d5-4d7c-e9ba-08debe528d43
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|18002099003|22082099003|56012099006|4143699003;
x-microsoft-antispam-message-info:
 Oz5rq/svmRYuJnoWVPDQaAfGSvn5v405HzaRuHmVG4SYXTpWvyQa6tjT6dgnDkJPoW1p6FN43CsSPRNRgni+PomzQjmlOIxTOXP11BFgPFLg/5hwgr+Ib0Hzp10NdnLma9+MhPgDFiIMg2tElVceMJx1zO6DrDrKcVGhLWt0O24NGr2NgH9vj9GH/3qgFVuYoyQCEezef6CZohG57U5GmM7vU13McqmMXnVoFZ7bRqavI3NNHxxMGMink+GCtVGX+L45jXTgsaPcEeSsd7OXMza66I91KohQB8cnP7mcKS/QLe6p3mZFmPfZii0Od1fgjNMVR6i5p91sVQuoboN5chLo+4drAXmDjQpeouNHBZRCFXGd1MU03Ti4g4NAd7Wokfn5tdZ2x8DxgSyFyovoHcYEm9nY5bD8knF7zp7TPG9Y7EYkzKTTwMvSzWsL1L7tQF5ljTJ3LNbKuxNJ4qFWzcW3sMYD3O4TWdLOPwBM/+8HTVCtGvOdQ24qknwpY0VI3K4oNlxCTq8uMBczqRE6zsAcBHS/Dlts92mtGFSSQTsR+q+ysR1r+wmOGbvb253bKbBg2RdKkmmWsC4LMYTyOQAk+mWMGzgsLrsDBRNojrH/+Uw9Q2mGD0JbKyZTidO7tAUOWpednFNclDoVc6B59Z+TEyM84S2grRDvLXSWNWEe22lmzcEh/tCG+kIja5wt2SBngG2iudYezx+aH4su1FoQcA6TDcMUHqMAEB4VOZ3GkFzzpROR1D2KyDc8CJV7
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6226.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(18002099003)(22082099003)(56012099006)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?60Gh7Qb5/0nBkjTQnMk6TCb4jiwy0YULgsw8Qw3y6Rr2zo6nb7/QxzLiXMNe?=
 =?us-ascii?Q?Ux5z8SJcj5ysidezQ/bwNPPtRaWIEBKnpw8vs8CLhCv+oBgndK+Y4GjQztH+?=
 =?us-ascii?Q?uc9zlQ9EHHpj/JKC1Ns94PG/LWyWWI/m8JkDQe/ENK4NENTNdyOBAC/+euzg?=
 =?us-ascii?Q?vZACme3YNe4NjaQ3RuQjj1rZtaF//iE3l+7RLlOcWCw/UFD4lyYOGHaBOFx3?=
 =?us-ascii?Q?WQfHzpB2q74ITeWSSxvgse1eon0jPgHJYNv+xirWXckE43BMDmq39JfZpU21?=
 =?us-ascii?Q?ej2rb2WMppDt+plTRZj0lCxV4uQ8FGY4SyiTwltj367E9Tvs3ltkurz9UcL0?=
 =?us-ascii?Q?XaxVfe/xGtL6h1ocJIkmZtFHbFIsCXA3tBh+RpModVDQqyzJhp5t+pCHtShf?=
 =?us-ascii?Q?6+tkgEgbeFF5MdSspOjMONf8DME2K0BiYkEVeMy8ErDGKiC7WYnYVVXWfNBS?=
 =?us-ascii?Q?m7IWj1egd1rW4OfdXnzRy984Kbt5Weo7U0U/gID/7/SwDrf8kLBs9BQ4p1PH?=
 =?us-ascii?Q?P0E5bYsFygBCh6qxNjd58+D+2rADvRL+5jT8sfcLOAwkJ8xJ9wpx06oP/d/H?=
 =?us-ascii?Q?4WvwNgAk/fA0w5Rx3Yb/Vso/TxqiImCc5zKU/bDUVYNoZkOYpyoRv2iyUs+i?=
 =?us-ascii?Q?5FGvUYOAClhVcA0wNtnRckX51MH8KpvYI7D7lXu3nx950QCrHWh5WEI6B0bB?=
 =?us-ascii?Q?xYooiojsnf/wwT70rTz9omQJSJZ0ShTuCI1i8MeDO58hYdVAlyLUPrz3s+Dd?=
 =?us-ascii?Q?fFnyJJ7vmsiRhbEhzb5qx9jLOUGRtRxvs18DzeXg5O6zGa1dkaQL5RvJR2TN?=
 =?us-ascii?Q?Q7fbBI+Kut4QaqcFTbPzs7sDCTDrabjoVPxMsAPOBCdBKItLifzKQHwoyVv9?=
 =?us-ascii?Q?e6Sbo/HHdxSe0qzKZ9qkOMhjtfEcLkRTzvDgBvUzZGpVVUSmBvk9d4SAYPqj?=
 =?us-ascii?Q?txaiH0eQ0GEGuA4QSJYPLpVKLglxD/S/qfdPAeDvs0Uf2Hyg5KPXyHK4maqW?=
 =?us-ascii?Q?yycJjxrd8djLFdxeutcbXmQ0zGvsKgebKqVq0uB/RnmUNDRMeVkZLu6Lcm2U?=
 =?us-ascii?Q?A02LY6MPBU5cVtWzKxDwzCWVO9C9ksKIlYDhoy51j/+CF3lDXaNdXnx+e54v?=
 =?us-ascii?Q?krnOE5YZW7haQUDUjlOKBKcSs2p57vXtP26mEMt5kh+aCScaUaYbdVFfEkpe?=
 =?us-ascii?Q?dVacTYHflXjSFWfwBKp3WoFm3NSkuFi/4Z3aKgcT4xQ/sgRurd+CB811Four?=
 =?us-ascii?Q?wb4WJgybD0ppYPA+RNNiniGZqHfFaHuDwM0NQ/CoEC4OHDjRbacOUWVD/x6D?=
 =?us-ascii?Q?9BhSl1n29GmEDYaVKxKjNAjCyQoOhfQD7UoSZVYxIf+h+5O9O3rWYkfDbJ4y?=
 =?us-ascii?Q?ZLBj2B9pIqD/T3cvn0kMRIpc6umC6Y2doObZK3AHzL8BuHJShvPoJVcIIe3h?=
 =?us-ascii?Q?TjAdClCgWfIaaf7Hq4sE0CMEFv7K92uSR7/xL5PerXD/M4RjHI38i+YOnL9Z?=
 =?us-ascii?Q?xmt2WZirDgSBnFBFHvi65UWXvD6shZYzg5pu435CvSFoGRi/0Nney0/9L7Ce?=
 =?us-ascii?Q?K/wZn/VQqeatCGJ0ZclZSepRGaHUsHj31nIi/op6kS5xj7hoPOWUECPD6GUM?=
 =?us-ascii?Q?JWlllVIc20KFBYvu3dfR3A+yp29rhdh3td57DlcptJKMRNz4+a/DVVLh+PeL?=
 =?us-ascii?Q?zrxSiQQj4OZrtkPJrhOaFnyWNEIYQaWYlx673eVidg6WMk5qmtlkB6kilyTo?=
 =?us-ascii?Q?hAL4V25fwQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 801f930c-a7d5-4d7c-e9ba-08debe528d43
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2026 13:51:29.9803
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R3vqWse1PNZTS+FCERY9+YNdX6YmCKs+0FTksl0qrJbQNXdWHOxawRWHwy7mt+/QqsA1yXg/AGLEli9tw+NRtmEDD7+sLPxGZZgPeohHzvE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6191


Hi,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Saturday, May 30, 2026 8:20 PM
> To: Joakim Zhang <joakim.zhang@cixtech.com>; mturquette@baylibre.com;
> sboyd@kernel.org; robh@kernel.org; krzk+dt@kernel.org;
> conor+dt@kernel.org; p.zabel@pengutronix.de; lgirdwood@gmail.com;
> broonie@kernel.org
> Cc: cix-kernel-upstream <cix-kernel-upstream@cixtech.com>; linux-
> clk@vger.kernel.org; linux-sound@vger.kernel.org
> Subject: Re: [PATCH v1 4/7] dt-bindings: reset: cix,sky1-audss-reset: add=
 aduss
> reset controller
>=20
> EXTERNAL EMAIL
>=20
> On 30/05/2026 14:04, Joakim Zhang wrote:
> >>
> >>
> >> I am not really reviewing this, since you never tested it and did not
> >> follow the process, but to spare you one review cycle - no resources
> >> here, so this is NOT a separate node. Please read writing bindings or
> >> DTS101 slides.
> >
> > Sorry, that's the meaning of " so this is NOT a separate node ",  could=
 you
> please explain it more, so I can update later.
> >
>=20
> Does that mean you are not willing to read existing guides?

I understand what you mean now. I saw this:
- DON'T create nodes just for the sake of instantiating drivers. Multi-func=
tion
  devices only need child nodes when the child nodes have their own DT
  resources. A single node can be multiple providers (e.g. clocks and reset=
s).

According to this, reset node does not have resources, should not be a sepa=
rate node.

Joakim
