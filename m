Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022077.outbound.protection.outlook.com [40.107.75.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B153BF66D;
	Thu, 11 Jun 2026 11:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179039; cv=fail; b=oim0+kd53Uf2DhsGYREd9ec6RaJfRMkTYJLXOzMUCBxigH/ZmKp1+w6grcv6IvtOW05O9mP8pabirBl3yHwstnXItLPI/x9K1amEiirxT5FxxVqCs3O4SJQGxkWjgD2BRVIO1Y4EBrHpYEeB5G/Z45bS3bvP/41QIim9C5qMGSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179039; c=relaxed/simple;
	bh=y8eRjKWjDbI+XjE6xlNqNs4AIwjOt/59YvrPRhVfiEg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mizcVSKiLRGUjKkg3AsgqigPuPmOeaHg51347rqV8n00xoT9r+KvK0qnKQmbp1UWyuqUVVKNLmpx2+ew+wGEanjwCFJJGg0UZejdhQ/nCLu8rBewWhIRH7RPfqVd+jLBjnxoBp+UbRgu1MNJi9Y2zzH5e7qcA87iGmaCq4a8gj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C2/luRzY/94td6CfbDVEDkdXdsr1YhgxLnadUgKXJl8g5NfIKx2FMIiVIB4GakfcwXwf6V3JwpAC+Z7zfMe4nqIA/qK2gKHY8j304hyGmTclIMRJm2SBw1S2SVLUpBB3HrVGh1CifvgjtS70A7iuV/OCcmMZoKxufaNY28/gbrCbaDiZFjiDtADBpud74jb1JvixpgifW98TjLBXpY7EZxWLocdX5nTdT1vHmQ/ufJLqaPlvL0ml+yBmwv5AOTK9/8JCIWmjQJUL2cHpIuMqiEv5val+mFKnMOieRe9eP1MybqkKA8TtzagcaqGcMSqTcOSQDguMBkB+wFPI4m7z/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zh0nJ5tb6CVA8yOu82MdVVz6LuQtaDm1BiHrBfWzLBk=;
 b=gFMZm0ToPpE8eANKXGWw9hR6893TR50yj7zW3XCD4kBMaBN82gPHq0zoGxqZHy8NH5cnJyhEHZhPFIRnSFCAu3fXy+WmRsYi41m/jTlD/lePb8I43u1Uul3jbGoc0OqXTN+vY1Ue1nk2k1skGy7ecRIHXYMbmbu9K61Xk/VgqyfxGD2Fy8fcQeaug5DuXq2CeeIrtiwPB0+FxVnP3xuXlCHxPqFBbrdEbJYjHKtYYwAsdOL9ZYeRALLFreqEDMBWGQQeTsdTIfTxWXOXMP0GIiA3xmdGDNolwOvbLOz7xQ+xvTXzONBNpUi6oNgmtoQQVRhggTA1zF4cy8uK92N21w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com (2603:1096:101:df::13)
 by TY0PR06MB5846.apcprd06.prod.outlook.com (2603:1096:400:277::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 11:57:13 +0000
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364]) by SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364%5]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 11:57:13 +0000
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
Subject: RE: [PATCH v2 3/5] dt-bindings: clock: cix,sky1-audss-clock: add
 audss clock controller
Thread-Topic: [PATCH v2 3/5] dt-bindings: clock: cix,sky1-audss-clock: add
 audss clock controller
Thread-Index: AQHc9Jq591VKQm5fVEipnbHv8Jekj7YvsPmAgAXmAsCAA2ssgIAARoNw
Date: Thu, 11 Jun 2026 11:57:13 +0000
Message-ID:
 <SEYPR06MB622617F35B562A50D4357C51821B2@SEYPR06MB6226.apcprd06.prod.outlook.com>
References: <20260605032225.523669-1-joakim.zhang@cixtech.com>
 <20260605032225.523669-4-joakim.zhang@cixtech.com>
 <6c87641d-d505-44ff-a994-eeabf55f4c73@kernel.org>
 <SEYPR06MB622688915CBD1AA9B65FFB33821D2@SEYPR06MB6226.apcprd06.prod.outlook.com>
 <992261bb-6e2e-4662-96f2-c5b18d513b32@kernel.org>
In-Reply-To: <992261bb-6e2e-4662-96f2-c5b18d513b32@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6226:EE_|TY0PR06MB5846:EE_
x-ms-office365-filtering-correlation-id: ecc78c7c-9246-40f8-ace0-08dec7b09394
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|4143699003|6133799003|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info:
 Ce2X4AUM3eVQirk6Ov/CnaZSOOEMcvXQxx/XmBt2MaHklEIw++mq3GWhttqgqUrx5tMyVKB3ht/dYgBhWEeXh3uOSd2IS7OVM2oy/S3HdumicHSoumiP3BgUWRcEIuRAmOSlo5YhwUAyZqXYnyVURLgq7vSMUrGwxVnemv6Mb0czugxrGkhIT858dLawrsHQqMIm+XLF95LF7gYCz97TbCi0yHJ3awFotvs75m/XwfRyio2m2LfsNdZEbvGpctgB0W79oOugy/13woAL+n3Zv8fO1I1a6POTIYmoDDBok/SXSs9PMVYV2xadjiKppVDotw2KbEy1M2O3Q/uZemeK2wm+XejXWI5O/UDlaX0d36dqYsMVtrgFVa02tsul5LRBBttANrAi/zpWRzn2KPvYrSc73AHNsTz/mka8hmIFWuDeMGDL7eGmMAdc7yRPEszFDa76K0d5E9vb6BLCKZEmF7kFS2Yxtz+XEfKYcHUZG9a0LeqQiDPQcW+XyCb6KvY3bZaXrJGjxmVI2u3oH/ll13DCYQs/9mmDbxlInw0Y/3ZraoyBy37jqnHWSB0X9MGZuA0qrW1M5oZG1JVcL5ytfjfsNl90TrjQqM+VnQcT+w+Txbb0q8mnpzMl1KYLTVJhDVjcK4rV6kRFzCGFuoUTxPAdft91NNG3Nz+LFr8r/YUH0mfN2H4fKanQJfgeTU1a4pwS0m7GOF8Yvh4Iu545DaLzlmAPTaxSdhDDOCheyEitlSQMsLopvdJr81kSrdLl
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6226.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(4143699003)(6133799003)(38070700021)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?vBnrKo603FD7iL3kmm3JxG0eKO/fUVxZnH98QH2ZkDFQpTFPEHYSBeWCYF/j?=
 =?us-ascii?Q?0Hohycc894MA4qV42anhm45jRF8stLvtXRaJ9312cGuEwpZWSaRpy/qqeHAk?=
 =?us-ascii?Q?VaaTbgGyaNQTZGRbBJNh3EL4QnFkt/ts6BKPMO3CNVd7mF4QR94hfQFr4s3s?=
 =?us-ascii?Q?QpG+J9OaIUm0bRZI0mluXnngIGvblOpKefIiXzpv7i1ACF69lZy9N/jfMOXf?=
 =?us-ascii?Q?1OzPjo8hCddPIiBRO9YBt4FqHuwpHM3MKbMbXpKKnuV5iRE73nOLMgIyRTYn?=
 =?us-ascii?Q?4f1UrgA1Q2SHfjXNLqcI9fkHozFRci5SrCfPK62PdEzxz6kyAuXyuuUIobfs?=
 =?us-ascii?Q?P6BH7G86mE4rHmZJ4fMLzD/tQp1onKJhD5B5GithdisL2dYJ5Fz09oc7J3hM?=
 =?us-ascii?Q?kBZIWEf186uWU4WHeKiJhSldMQw4WLC3oFsynDLEk8mj6kFi2twFGf9SZScz?=
 =?us-ascii?Q?DVXTWAfuYStYsOLCmGhHEJBS+NkKeWREOc8dFT/3qgUZLuDVrqMlD924mAxm?=
 =?us-ascii?Q?stscm1F//I8/iVmxQfrG12l5FUG9KWis+pXbKku2jxOc/tgdXiI27ESS2fO8?=
 =?us-ascii?Q?Clr+UpxUVOCFXt/QynxjvxaXa+eSbJoQ3PLyr9uS52CAulHavrqIwO64Ra+Q?=
 =?us-ascii?Q?ylUje4JI5IOJL/jf9Xo855CFDCxZHQ8u75W2+Y+fqYsdGMDs2mKeoz3VhR4U?=
 =?us-ascii?Q?RoMHoY5/M8ZcnwNzfkQtIV5WHB9y11ZaBdKI2r/Ocnyirdag/Ax0LijdkQtF?=
 =?us-ascii?Q?rr9E+0RAUvStUgIAIED3JHJtOUA5OqqzEsrvWr8t2iRIvTsV3QY2jSqIi1E5?=
 =?us-ascii?Q?+DhKn7bM2GC5wzVwEN8VS5BB0sajqTKa0kr/GbwL/G+FQLlR1IYRgA6XfM4Y?=
 =?us-ascii?Q?KwrL9O7wPDsY9JjFYBLW/quINlmnYbVm74NrzszC2Mm/0tLdHD7h6fgQtiqz?=
 =?us-ascii?Q?7h7ObcAinFUcneYvoeiNl59gtgxz68Y6LQz/3VAR8kcjh38JY0YcfACnftgF?=
 =?us-ascii?Q?VpZ336K7RnKmTR0jMdn7Uao8l9uST/RX+l5p8PV2AOdPIYG2Tw3QQfe0OJgh?=
 =?us-ascii?Q?nHshrWtwmb62n/KaJSfK01YdGnwMFCsU4OI/Y4dsdDbmSh/De+sM0V1V/GgF?=
 =?us-ascii?Q?OBjesUAEwdXP93s7J4B0nOYfRfpWNrPsy09ozSTUJYv/CF+mCAW7VMIp9hdn?=
 =?us-ascii?Q?eqyFl5go4BOguI7fJ61QjKLBq+x7yjTjirEMgq9b+wd3QyeLuKQaaTqIxzoA?=
 =?us-ascii?Q?yX6jsp/L7Li+s5l95zrApbaAp+X5sjQ7mljhiSmJlrIriOc6SC8tounWponi?=
 =?us-ascii?Q?IpjhJI/kdGn8GfbkqFQgBYq5lojkeT4paqLLuz0Q6KK7FB/XycI+tlZOC6aP?=
 =?us-ascii?Q?awm/vfyNY86MJDwlAbs0bn+PnOk8yqQ75zdwrW0PQQuEuLPzMa/JEjRtDzdC?=
 =?us-ascii?Q?l4L2Q2wLpMo6/25NC9GpAh8z1P5GbwJi+FPFB1jgVSUFNI7nKQ6AYo/wpsfo?=
 =?us-ascii?Q?LXw98WMj0tGRYwQU62abP0C3CHMPYdxLauzIYSlXnQbhBm7YJumcFWNna/22?=
 =?us-ascii?Q?Te5haBN+2stvpEq6UncvurxE6QYvR2zt8hLSKWmjNsjNpPtODq3dLZxoTLIV?=
 =?us-ascii?Q?c0E4K0FIxy7QaeVIFjEV7w1MV4uh7Nz8GEiM1HzcxOjnAKSFHywITPVmEcaw?=
 =?us-ascii?Q?CCnG8U8HSgyAsGR0yW4FDmOC6e7RRQCfw9QiGabo1xe9HSSVYv/BbdYSr7oo?=
 =?us-ascii?Q?xSpOIRpwHA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ecc78c7c-9246-40f8-ace0-08dec7b09394
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2026 11:57:13.6152
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rn20G2oyCuFYXlwNaklijfFIEiQK5ydbVHIW+oTSfkP6tF8pzJdqgjkArGvxdtscJS+CHTbXzvfI6KRtVSIJi6Wl9hgP+Sx/Lgn0aTfBDa4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5846



> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Thursday, June 11, 2026 3:41 PM
> To: Joakim Zhang <joakim.zhang@cixtech.com>; mturquette@baylibre.com;
> sboyd@kernel.org; bmasney@redhat.com; robh@kernel.org;
> krzk+dt@kernel.org; conor+dt@kernel.org; p.zabel@pengutronix.de; Gary Yan=
g
> <Gary.Yang@cixtech.com>
> Cc: cix-kernel-upstream <cix-kernel-upstream@cixtech.com>; linux-
> clk@vger.kernel.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel=
.org;
> linux-arm-kernel@lists.infradead.org
> Subject: Re: [PATCH v2 3/5] dt-bindings: clock: cix,sky1-audss-clock: add=
 audss
> clock controller
>=20
> EXTERNAL EMAIL
>=20
> On 09/06/2026 08:27, Joakim Zhang wrote:
> >
> > Hi Krzysztof,
> >
> >> -----Original Message-----
> >> From: Krzysztof Kozlowski <krzk@kernel.org>
> >> Sent: Friday, June 5, 2026 5:24 PM
> >> To: Joakim Zhang <joakim.zhang@cixtech.com>; mturquette@baylibre.com;
> >> sboyd@kernel.org; bmasney@redhat.com; robh@kernel.org;
> >> krzk+dt@kernel.org; conor+dt@kernel.org; p.zabel@pengutronix.de; Gary
> >> krzk+Yang
> >> <gary.yang@cixtech.com>
> >> Cc: cix-kernel-upstream <cix-kernel-upstream@cixtech.com>; linux-
> >> clk@vger.kernel.org; devicetree@vger.kernel.org;
> >> linux-kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> >> Subject: Re: [PATCH v2 3/5] dt-bindings: clock: cix,sky1-audss-clock:
> >> add audss clock controller
> >>
> >> EXTERNAL EMAIL
> >>
> >> On 05/06/2026 05:22, joakim.zhang@cixtech.com wrote:
> >>> +description: |
> >>> +  Clock provider for the Cix Sky1 audio subsystem (AUDSS).
> >>> +
> >>> +  This node is a child of a cix,sky1-audss-system-control
> >>> + MFD/syscon node  (see cix,sky1-system-control.yaml). It does not
> >>> + have a reg property; clock  mux, divider and gate fields are
> >>> + accessed through the parent
> >> register block.
> >>> +
> >>> +  Software reset lines for AUDSS blocks are exposed on the parent
> >>> + syscon via  #reset-cells. Reset indices are defined in
> >>> + include/dt-bindings/reset/cix,sky1-audss-system-control.h.
> >>> +
> >>> +  Six SoC-level reference clocks listed in clocks/clock-names feed
> >>> + the AUDSS  clock tree. The provider exposes the internal AUDSS
> >>> + clocks to other devices  via #clock-cells; indices are defined in
> >>> + cix,sky1-
> >> audss.h.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    const: cix,sky1-audss-clock
> >>> +
> >>> +  '#clock-cells':
> >>> +    const: 1
> >>> +    description:
> >>> +      Clock indices are defined in include/dt-bindings/clock/cix,sky=
1-audss.h.
> >>> +
> >>> +  clocks:
> >>> +    minItems: 6
> >>
> >> Drop
> > OK
> >
> >>> +    maxItems: 6
> >>> +    description:
> >>> +      Six SoC-level audio reference clocks that feed the audio subsy=
stem,
> >>> +      in the same order as clock-names.
> >>> +
> >>> +  clock-names:
> >>> +    items:
> >>> +      - const: audio_clk0
> >>> +      - const: audio_clk1
> >>> +      - const: audio_clk2
> >>> +      - const: audio_clk3
> >>> +      - const: audio_clk4
> >>> +      - const: audio_clk5
> >>
> >> Pretty pointless names. Names matching indexes have no benefits, drop
> >> all of them and instead list items in "clocks" with description.
> > Yes, you are right, I will describe these more meaningful.
> >
> >>> +
> >>> +  resets:
> >>> +    maxItems: 1
> >>> +    description: Audio subsystem NoC (or bus) reset line.
> >>> +
> >>> +  power-domains:
> >>> +    maxItems: 1
> >>> +    description: Audio subsystem power domain.
> >>
> >> So the clock part has power domain but reset part does not? This is od=
d.
> >> Especially that parent is audss (right?) and here you describe that
> >> this is audss poer domain.
> >>
> >> Same question about resets.
> >
> > The reset and power domain takes effect on the entire subsystem, i.e., =
audss
> can be accessed only after powered on and reset released, including the C=
RU
> registers which contains clock/reset/control bits for all device within t=
he audss.
> >
> > Because the reset controller probe does not access the hardware, while =
the
> clock controller does, so at that time, the power domain and reset were p=
laced
> in the clock driver. At present, it does not seem very reasonable either.
> >
> > Linking the "reset" and "power domain" to the parent node requires us t=
o
> ensure the order of the probes. We need to perform deferred probes within=
 the
> child nodes until the parent node has been probed.
> >
>=20
> Please wrap your replies.
>=20
> You refer here to probe, so driver design, but I did not ask about that.
> I asked about hardware design.

Just as you understand, power domain and noc reset for the whole audss.

Thanks,
Joakim
