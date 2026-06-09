Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022096.outbound.protection.outlook.com [52.101.126.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4593D4104;
	Tue,  9 Jun 2026 06:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780986351; cv=fail; b=DOrZoToIOjr0RSAMQ5TXYUtSNSHDkV/VuDtnoq+QYIYGGtawWJfdsYbifElUp1muNi3MvVcXWHgy6byMWIPFL6vOzSFSLzdF93tZQXOmlfgPup3TXrKrEjhU54EHDQXfwC7jDUnYs8vtLygA5JQwbjYoaZxWvCAOMR2QxHjZITs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780986351; c=relaxed/simple;
	bh=2vhUpx+ax6moCoGbX8Oi73m0zj9Cye0XSdUBJ7aXKIc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=onbmEd6Ux6Ae5SgeNt0A6aTNuBrKGQvsXIFDym7mZtdw5rkBARGYR/qS/sDtKAorRv8Vi2RQO6LSiKODudiOYdvHsqe0tE2Ka453QCYJfWjfF99OZAAogDEjeMGc5Lgm65qGvbzS2/G99llsaO2pe8T2MobEn4XIfWYTyImZeas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rDWfnBIa96Xznr8iy3cuZDmLuxWdQ9K3uPkiWIksPjg7ZhBF3ItPKHsmKgZMNchPOcwvzpe6dn7jJ7gx3yjLgfE9xBC54NTrac9NWIVkDKdXvbtvRJSnsWN2PEuwegbNpFzQAV/AALef43fBmmtMMfnP4JspPqKeFBFvETkirdc/iHbk7Ultp3bWdG8MvrxlFsosxDeKRe2dwp/r7GP/CbcsmcyOZn1Eokgh6Z0YweXAoCvAWooUsuO7fKQXahROCNSB/4IZ/EWfKeDaK0iJYuhMKn4sZofAs77ohlbQsDbjFGAu+mt7N5w6q+/gIY7QGR1PsZud407MAOTfkYPxkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FczHvhrYj7C64xmKiqGmvnWAV8hunN4iminN/71tLLY=;
 b=AIVDm8cMVSSZ0fvPf7tllLrB6BblXvJ4rsCt9+HNJdY9w0t6fFIWwFK69l3POcbUbhPIxJHm+wykCi1i5fMd9AgwvcWQXKp/RHuRahHpWoxkwgoi6wT2yzcPgnXJYNxCA3eCLl47a6AEqQRT6ZX421/MUww6HpXxpSdF3ODj86oNvXxDqo/xQWptXYJnR3FL4GDtHqKST30O7OV2stC/u4UQcESKwhbFjIUOOJ7iEhCyLlDjMgoA2QdOHH/KRPVxAHP79H4u1Q73C8Nwdh02Jjl4pjJ4eeFHbVf8ym0s3Z3x0Qlx6x4vF0oa2pzeUJ+ioPTN0knfEe3rHqvoC6DESQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com (2603:1096:101:df::13)
 by KUYPR06MB8554.apcprd06.prod.outlook.com (2603:1096:d10:8e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 06:25:46 +0000
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364]) by SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364%5]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 06:25:46 +0000
From: "Joakim  Zhang" <joakim.zhang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"bmasney@redhat.com" <bmasney@redhat.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, Gary Yang <Gary.Yang@cixtech.com>
CC: cix-kernel-upstream <cix-kernel-upstream@cixtech.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v2 1/5] dt-bindings: soc: cix,sky1-system-control: add
 audss system control
Thread-Topic: [PATCH v2 1/5] dt-bindings: soc: cix,sky1-system-control: add
 audss system control
Thread-Index: AQHc9Jq2rirJyAP+U0uJTk4kNpzTyLYvr06AgAAAuwCABc7/YA==
Date: Tue, 9 Jun 2026 06:25:45 +0000
Message-ID:
 <SEYPR06MB6226BAC1C66BC730713765EC821D2@SEYPR06MB6226.apcprd06.prod.outlook.com>
References: <20260605032225.523669-1-joakim.zhang@cixtech.com>
 <20260605032225.523669-2-joakim.zhang@cixtech.com>
 <17528d9a-738c-48fe-ac24-b8d90875a74f@kernel.org>
 <b005d5cc-3b9b-47a6-b6fe-91ace2db4089@kernel.org>
In-Reply-To: <b005d5cc-3b9b-47a6-b6fe-91ace2db4089@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6226:EE_|KUYPR06MB8554:EE_
x-ms-office365-filtering-correlation-id: db46095b-b2e6-4003-e8a8-08dec5eff0b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|56012099006|4143699003|3023799007|38070700021|22082099003|18002099003;
x-microsoft-antispam-message-info:
 W4WcGdrWCP+oWChC+bFYdPu9/GPD/1WxjLDaQz67zPJhVSHWvSbQBMpPsG3a7B9+tieMLYCEhDAdTwnBOobEui6itTwSZHWAAEk2DSFDBg+kII5jFjJmUxyBfLsoJurmkhBtU4yTtNESoZTDtP5aoZJKTxtYBMqyX5Y1DKtjpn4n9100EpKkK3gdrj6aZX9qZvB3tbvYebq+fTXHjn52DlA1pH7Kcti9XS39ozYmdr1gz5fYS/82WPmEn5NBg8ZDfb6nJrTBkxo1mC/hpDLQvlFgvbeK+ntzSevYTrXOCR0nzOrmW7a+INuJjiqalRMCOf+SkkOkPD0Q0kJv/KDgnnprQJvbskHpj1X9ZrFcczS11w4Dmiwr+swlP7vS0rHw/dKiEgWbqbTcSKbD9sfSFIq7KcDN99liD+ubXjydyD+5JckFjwtCch+xiNfaT8xUdCINZf3QWlyvSCH17lm7kXu9Q8ABtkG8h+ffjj1Nbpcy3NARXI+UU0xiz/cx20sYO2prPaYRS7qZsAtlK0KrnHhlHeQUx8QSRaex9iqOYucqJyjc539KseqZvxh4Zm3b7+U10k/VouKS/NsxlrpV+rth2Dj54BPYyn5SGgcDRz13B5iBE3zVYAOQIA50zvhE8Ai/J8i6YljN5g5AndTdMNLueOcv+fWqJzd20YyPryghSpPnMtcE9tTz/bkGjcodByZ2yG2PaOUism8SvVnMQTq0/zHBiHkjz6CyEUHA1Bp0GpYfHxW6K3vXTJqn3S4k
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6226.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099006)(4143699003)(3023799007)(38070700021)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?vPTiIhRwy8wkckjqlfnKQIn/MyjPk2358WUisFZGvz2NWq8U85sBbifcPvYe?=
 =?us-ascii?Q?C9B8271mvm+5KkaeJw1uaTOr8hgvinTPhfnyCPIg3g2jUAR9qRsuPgismz8u?=
 =?us-ascii?Q?Iq2YEUBkCuJiOp9v/bdAI/wMWDZR+bbUYg4P+3hMNluZVxPX13sfhZdGj8Wo?=
 =?us-ascii?Q?9EW0F6JuzgWCnJ2h7LFTouMgpDhhh7GdxGkxQb0BsCxQ02Cnymze2cPw3cGo?=
 =?us-ascii?Q?w5u/ntdxPKrvZ2k7JhdckiehASFulpd8LJPrTAjrZO80veT9bw4WQvtCFF8g?=
 =?us-ascii?Q?javrklQuulsWmioRL2kQ0eTddrat4ZVQC8ReYQHLMPHExjE3kUNgYPGiSCMy?=
 =?us-ascii?Q?ge9rH15f5Sxg2elEHBmQ4QWOkq/W6e00JZlOzKdcWVox6grjrTABYuUevRe1?=
 =?us-ascii?Q?HlXK2WIxppRa4aGoMVNhRQIxHPFRWPwnRDhG0BUJSdJBaBVeoV5hn8A3sOtZ?=
 =?us-ascii?Q?cN7LzJVG/d9Lk13v8/dil+xGk4h6HindzEReM+LXF0muGS4YhUaESRZOTfJe?=
 =?us-ascii?Q?kDYMMwib9H+ylQVXlZ6KxKwAznHdaZl1NzL5ZISub5tNroidRNCAmuSMA5PU?=
 =?us-ascii?Q?YXbDbgUhNo92Tyg8vPQ39rd35nOjY+IwCtK5koKP+u++MR6J6va4LtOANSOg?=
 =?us-ascii?Q?zFtkgVOnqpEOB+ifpvtI85+u5qWvBoCnZn5dOi58WI7Z4B+2Ch40tWw+MceV?=
 =?us-ascii?Q?lrMaeh2ptLRxTe8iPzIyQqQHtzlXUJ+13yPPTEs5wLN+BQjEQUcn7Mpo10AW?=
 =?us-ascii?Q?MtEIkAWO41BS5Oyrqc3OnQnWba4ycdupQ+DtovLJ47eskNFfjR5CrQ45tZV2?=
 =?us-ascii?Q?mev5FyK6jbuWU9/03tnVkIoPflWMAQPc2miEw23MYQulXqNSMzYhE+uAJzA3?=
 =?us-ascii?Q?e5YkP6dDGTkHjlguLZSR+OTI+vdzp1XS/cUep+WN4YjJVFcji+ptAE2y6V+o?=
 =?us-ascii?Q?PTIffC0jSesmGxM++Ut+digL8+wuqEKCUJt0Mzd3fvXOz5Fj6+D51BJ2oqDX?=
 =?us-ascii?Q?M4BNTKKUHhdCKzE5VRN6agWY6a+c1f1V6fIIz/nxgZwB2mC+abL1okeuH7sv?=
 =?us-ascii?Q?/hw1oIz9ArvX++pK4DZsJQqCfZMVBjsydxW/VJ0OQrHRW8XJTNZWe2S6PnwU?=
 =?us-ascii?Q?vt7LkBOPJSQwCUA6dq7HPJl9WB5IGpVovuJOxlIyhXCcruAPYE906uARXeWY?=
 =?us-ascii?Q?Vv67zweaQXjBHYJPNimLva8+XQT6Otb5GWj4EC92R2XkZYRqzzF/gfkKA+jL?=
 =?us-ascii?Q?QiV9OefDJpJUO1euapsBl45MVOa+vwrMON5CYPPQZ6hp3oYqWx+UxT5lGL6Z?=
 =?us-ascii?Q?9KgmDima2Mo3RfYkAXGDx586vYBIjmg/poUI+vfYhAkd3f8MFnEdlMhFvVL7?=
 =?us-ascii?Q?lJxLBKOiJ3/U2IetPKuMk3rfnMxOXGLjG75HPE80lAdM+R0BBHim+AQJMtYp?=
 =?us-ascii?Q?VRwZzVMRlhz46schHunJhQK+nEhLzHBqTMoZP+HEDcz8t01ak8pmh04UEd62?=
 =?us-ascii?Q?r8MmxX1US2W+fHpZC2cFM6Q5n6UzU+PyQXbKIwjItfS7k+HRsZEq5r6kEdEf?=
 =?us-ascii?Q?p/058a7Q7cPI9u0Im3dCXbDMBXeIdHA/qXIEoI2krxqe+3cKPJ7R1QdwzxOh?=
 =?us-ascii?Q?5FTl05ABusoO+LPHmkGkDWM4l+0g4u7T8u9geVYPYcuJPQKd2dsBmpB0sg0Y?=
 =?us-ascii?Q?9v1UfRcE21Gh3RjbmODXHuRbO2ErmHtnrupsapVdWz+urhIUrgAQn8Y+fRQq?=
 =?us-ascii?Q?ycLEG0nKqg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: db46095b-b2e6-4003-e8a8-08dec5eff0b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2026 06:25:45.8953
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SQp6oF4pXiKZi3po0lFAqr4x0+DazMXLEHGkgZSPb1fpk/6gSDBpfzXSkDqyqyZE2HyRGWd78F6EM4+HSEjoCj9f89arSiFoqSttuDb/SAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUYPR06MB8554

Hi Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Friday, June 5, 2026 5:21 PM
> To: Joakim Zhang <joakim.zhang@cixtech.com>; mturquette@baylibre.com;
> sboyd@kernel.org; bmasney@redhat.com; robh@kernel.org;
> krzk+dt@kernel.org; conor+dt@kernel.org; p.zabel@pengutronix.de; Gary Yan=
g
> <gary.yang@cixtech.com>
> Cc: cix-kernel-upstream <cix-kernel-upstream@cixtech.com>; linux-
> clk@vger.kernel.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel=
.org;
> linux-arm-kernel@lists.infradead.org
> Subject: Re: [PATCH v2 1/5] dt-bindings: soc: cix,sky1-system-control: ad=
d audss
> system control
>=20
> EXTERNAL EMAIL
>=20
> On 05/06/2026 11:18, Krzysztof Kozlowski wrote:
> > On 05/06/2026 05:22, joakim.zhang@cixtech.com wrote:
> >>    compatible:
> >> -    items:
> >> -      - enum:
> >> -          - cix,sky1-system-control
> >> -          - cix,sky1-s5-system-control
> >> -      - const: syscon
> >> +    oneOf:
> >> +      - items:
> >> +          - enum:
> >> +              - cix,sky1-system-control
> >> +              - cix,sky1-s5-system-control
> >> +          - const: syscon
> >> +      - items:
> >> +          - const: cix,sky1-audss-system-control
> >> +          - const: simple-mfd
> >> +          - const: syscon
> >>
> >>    reg:
> >>      maxItems: 1
> >> @@ -27,6 +32,11 @@ properties:
> >>    '#reset-cells':
> >>      const: 1
> >>
> >> +  clock-controller:
> >> +    $ref: /schemas/clock/cix,sky1-audss-clock.yaml#
> >> +    description:
> >> +      AUDSS internal clock provider (cix,sky1-audss-system-control on=
ly).
> >
> > Are you sure this patch builds? Your cover letter should explain
> > merging
>=20
> I am sure it does not...
>=20
> I recommend switching to compatible-style of defining subnodes in parent
> schema which would decouple patches.
>=20
> example:
> https://elixir.bootlin.com/linux/v7.1-
> rc6/source/Documentation/devicetree/bindings/display/msm/qcom,sm8750-
> mdss.yaml#L41

Thank you for your guidance. I will study it further.

Joakim
