Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023088.outbound.protection.outlook.com [52.101.127.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BA03BED74;
	Thu, 11 Jun 2026 11:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179025; cv=fail; b=RFtMlChs5nRLuKCe+wtoWxH347x4kBPmcf4XEhmlx7OROYKOT8Kb2kAZtteWT3vbletMdmwPa7Vb+smZZuPh6culfi5Dr7YDd15hrOtSspF+I8LaSQUFb0fVvqqZQkZs4NScxwDFe+QtVtXRfh+oxhczDlVwXCbuGTx+5ZgDV3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179025; c=relaxed/simple;
	bh=wNg7RRTERM8XECcgcrZif9Ho6UtCbxEImfRYfTERX4I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Z0AkrYrNt6hR10uUa/Nf+sdWh2mr+apjFH0zhFDK9LByyFgk9qXiZe05NigDpkdF9XIhEPnd3Yl7Kg3qgfgcTEX6566aZu3QQ6xaPXXUSurjdA0/7pVYKfJ51H5Qc20Y8wXKWN8CSDAhUxMvgbfENDYLT6j2a0MiGXKqGYfbBf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rujure5S0FPi09Dqle7f4NIqSRqslJnVy31p/VlnBeUM3IkM+d5KFHbM7zKnGj3DrjAThRy0UR1fj7QeVM6D/HrW1c3r1Kq4fndvzLewwLDg5Ep1I7EnAXGQPl15Vw/rV7Z9nNGoTcIgn8u+6+w09pTL2KIzFIDtCBaNOYwgHgRKBnsG1mDkfqgYcOwnMHQ8Emay/RBnUydAZMVns43pDoMAG2VMlUWjXcSX1XlSlzTJJ/60krmCnbGq3EzbznODtZr8ADVqKnG4mZ8uJZigGR5ry7gS6APsY597tPN+8KmrL7TiUfQZn3r+ByOBhHoGmfu9OfNHMsmtW9uw6NxCng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RVB/4ybavEvRZdN2CN3FKjd0ZP21s8KSyV8cyuubsp0=;
 b=MMGyncEZiNu8zCfNg+ZS+5nttMvpsKuTIMQ+u9gxqlc6n+u1kwAUl4D2VPIIBTYg+UM/4E2gpKOmYE3O5G/pbGsC3IZ2vQfJXAEBXfxNRyraLfJgaAanHmnvcjTIzylLi1jIBTleTrDYq3Z8AzdyDDfJxA7qjU+e2/WmPtso8x1x9Ini9sw+7vnkgcfeJtiKb2Igt9hi38QJqgCvseAG1EyR8gfCXnW59i5Pbf0fS+P8KV86/5PDn0JMxJt+SnVXluToee7oCs7WHa0f9lGKxKeoTtcESXLPS5P94tppolFofG175f/O9VLG0tMQBlx8dZs62kuFBNGIupCsBh+8vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com (2603:1096:101:df::13)
 by TY0PR06MB5846.apcprd06.prod.outlook.com (2603:1096:400:277::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 11:56:58 +0000
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364]) by SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364%5]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 11:56:58 +0000
From: "Joakim  Zhang" <joakim.zhang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "bmasney@redhat.com" <bmasney@redhat.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, Gary Yang
	<Gary.Yang@cixtech.com>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v3 1/5] dt-bindings: soc: cix,sky1-system-control: add
 audss system control
Thread-Topic: [PATCH v3 1/5] dt-bindings: soc: cix,sky1-system-control: add
 audss system control
Thread-Index: AQHc+K6y3slwiSQbrkGucgpaoVNGMrY4+cGAgABAZxA=
Date: Thu, 11 Jun 2026 11:56:58 +0000
Message-ID:
 <SEYPR06MB6226DBA4F9FD2D9B2373AE4D821B2@SEYPR06MB6226.apcprd06.prod.outlook.com>
References: <20260610075645.3581145-1-joakim.zhang@cixtech.com>
 <20260610075645.3581145-2-joakim.zhang@cixtech.com>
 <20260611-gorgeous-macho-cricket-f1b78c@quoll>
In-Reply-To: <20260611-gorgeous-macho-cricket-f1b78c@quoll>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6226:EE_|TY0PR06MB5846:EE_
x-ms-office365-filtering-correlation-id: 66c1f2e3-49fb-4ccb-d252-08dec7b08a66
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|4143699003|5023799004|6133799003|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info:
 yCHkJBsg5nm8mSQns7Wwj9IC66MNNBGBnCYvM/PEHvjX81cHDHE7Lu1do6cMDg2Xo55TKocQJVU+ypi9+XAhchpX2BDoJQ5MUR3rBVUxtdPTMQF4BVB8Qeov7aigqV4/CGqsO6veFp9Gx/f20HNcrLXLrmtlgDRwBvSOxl9OJzghIwGyED168dvqAbm/Rlyzao5Oh/SMkKh7iyXEh/WN4ZQTUcFLyHHmdSyHmm6g2a4KA5fsxt2YidaqywsnsYGu+Jeb9Fnc09BfifzFdBAX2vLBDRNJB8R91b+Ml8VJguoJuCEqHL5omtGoxjvWehh+0UOYic330YEZyLaORp6QGAyyGOw4i0u66unhbtGsk/9e43ZgqyHHFcO4A9rFm5pIKaVLFtykQvu6LduXU2VK4QvzzQVAfZeFLHWRygbqqPOIpeQSMnBz66YeYaYy2ryNGVYqG1SB1pCuWyVzLT6VRMJf7qM1b1lmtCPrDn/4ol0WiM3l0HCjJqBWjJGg5eWUYBjKKq6tSWE4epyXYWwC0mnHMTGnIpb2R8ZSaj+g0cRG6b6w9jJHQ7NBwlDHh9alM2p3ENjZI1UqM1Criqy5KBFio6Njr9Ny/SHJPOl5kUEpjlm4/B+PbeKy5qkok9UCRqbQV8slV2odtfiDxlS+0Pdx/EAVZM2KX2WWkHKliA/yFxqawmmRbf6inO3VlR5deXiHHTi763adgcwzr1SNukWvq2ou/lSx0ymS6+r0uaOhkuByFmScDseIdwqELLRl
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6226.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(4143699003)(5023799004)(6133799003)(38070700021)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?+LIx3ZrWXhrKLOb2FBjd1cTDJcaMdwJG7H2YsN76ixVjsvJKwzTCZtd05A4/?=
 =?us-ascii?Q?DhigZ1Rd6y3LbVZHBC4Z7HSmeqJAZIMY7tIQipbGUnK0bbYG8aJCZKSsoFO5?=
 =?us-ascii?Q?gZ4BZvvuApUVexwt8MNiVgXOoSKIRLQJ9SmVFu9V+PywUR59Vtc3tDJWSm3v?=
 =?us-ascii?Q?xV203owBKda7s0J19eM09TPqnsKokavAjfPfe6p6xDqaY9L+rj/vxAKor/X7?=
 =?us-ascii?Q?z2XOlZ14/xMTXVg7r4odmMbW9lj4+B8Ulfwfp9vG+GiffAafyVJfdHZ2czzr?=
 =?us-ascii?Q?gIJ9w4iAddFxeb7R5Y2U5LlEyYmpyUlB+MfnqBS86LZ2Kto20gumihKt8BWe?=
 =?us-ascii?Q?yTAcRsefCtHJ9GXYeaYfuGwQ7pf1yx13WoLDnmPZmXyBIUIKVO88nZhM3TQw?=
 =?us-ascii?Q?mpjYAvwY5GwklwkPr4sxUSdDzqxgqdc1dF1JzrKMT/NtxTX9IYnKO3ooSzaS?=
 =?us-ascii?Q?Sf3khqQIry3lpT8H8KttSE1w8g/FJHBaB7gRNZCAuBKuaaQbj6OKlK5uLV/0?=
 =?us-ascii?Q?CKXVmUIW60ID4g/uH744uykJ4aPP2kZ+9heS4jzPYycEtv3Cuk287yy9bZZR?=
 =?us-ascii?Q?niyukNiBsLK4jpd4O2DM/Ob9i88NNyYaI7ft/5Ub1OML6Cy3n/jFkCezSicv?=
 =?us-ascii?Q?InLueH7tiBtjhx3T1isSkixcFSR7uL7AGArscxf1R1xTmFNb6XrW0Rz0uCTY?=
 =?us-ascii?Q?dmlJHksBQYQsqMfLjIlwFu60TC619owvD3SnheQVSyX7J6J8R/+k+YT4ntsR?=
 =?us-ascii?Q?4pSZmpLCVU7KXmHE1hQOogg2X6rO8/ODSfnwRKg8OrP075kzePK/7jl6M4a3?=
 =?us-ascii?Q?vdDa4NrCS27pMBBVKG/0dlvQRqFl1uOrH3kNRPtcAFExUcPNI/ev0pGvEF0N?=
 =?us-ascii?Q?BTgZ43LCrXDFjcjPvkMnhRj/0sV6ZQV2pbjU/96ZvlXZchE5daS4Z5mZ4YWA?=
 =?us-ascii?Q?ZBnWWcGplwW/q6xTI6ExMN2x+/tuP57Cv0XdlwR46nHEJqSwudG/rEDoUQXB?=
 =?us-ascii?Q?ZHrHZb2bBFqX2JVBQcZsI1svEeq75S9IbYkq1ryC3yM7Nj5w27w2rxzfIVzA?=
 =?us-ascii?Q?FiOTkqpTU1oI7OL4Ncv8q6c67g/ir6u2fRt9f7rmtDEpueuTgkzqQaqBnv8q?=
 =?us-ascii?Q?/lm3lGxIDKVSBvvdsqFMiCH4NrYZ8v87UAtel6rZWBP/WcWBC718U1ykdTog?=
 =?us-ascii?Q?SXV4txGWAOZY4QGHzE5PDNM9XB5c5gj+0XB/QMkD55Xnl4BYnL/pRkBLXLrI?=
 =?us-ascii?Q?H+zQkw4Eg8wpYC+8m76eTIFFYT05VnsK8+JuEVjGPQy+sPD4MfC9q0VSDduE?=
 =?us-ascii?Q?yPHbC2irZzrZmVvIofohABCMCT5gklDRMaXfR1nxamu08JxZ0wl4maFbb+yb?=
 =?us-ascii?Q?K7tJIrGgfrwbpkxRp/D1l68fGf8fpMfvIgbHIivPiOMVF9bB0t9BCh+DjFGa?=
 =?us-ascii?Q?8o6dlUbA6vjMhjaUMVatF5aJvDKDq4Al0TtRQK0r7wCXaVLyR+1E502NQPIN?=
 =?us-ascii?Q?pFzvOg9mi50DzEEnJSmRYhAqsPOXiM9Gk/63N4sZBdZYP60BSf9V8XtARhy5?=
 =?us-ascii?Q?a9ltAC9qiQ/OKeKYhkIq/L8XPvNJTU83cxdaihcxQ69AKlgUkt9aYV6X7iwm?=
 =?us-ascii?Q?cCrqVfisgDQZvEclEz0utplfTubdTrCO8gSOe4oPjAUOZ59D3kWmNnUIRhNx?=
 =?us-ascii?Q?ya3qcojNuw8TmW7oPn68H8gL10S2cVAH3rJUnd8h7CCTXwVijCtp4See2NB6?=
 =?us-ascii?Q?XMRt7fmMKA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 66c1f2e3-49fb-4ccb-d252-08dec7b08a66
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2026 11:56:58.2796
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kUIHPkME4Gk2M137LIdB87+c4/vOGgFzWwplSf0i5IxwscIJGpjSk+zke7gixhP46tqF1et4CFnBvkcePmN7kRcHLVgXQ1FEscSS9ZZcDSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5846


Hi,


> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Thursday, June 11, 2026 3:40 PM
> To: Joakim Zhang <joakim.zhang@cixtech.com>
> Cc: mturquette@baylibre.com; sboyd@kernel.org; bmasney@redhat.com;
> robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> p.zabel@pengutronix.de; Gary Yang <gary.yang@cixtech.com>; cix-kernel-
> upstream <cix-kernel-upstream@cixtech.com>; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org
> Subject: Re: [PATCH v3 1/5] dt-bindings: soc: cix,sky1-system-control: ad=
d audss
> system control
>=20
> EXTERNAL EMAIL
>=20
> On Wed, Jun 10, 2026 at 03:56:41PM +0800, joakim.zhang@cixtech.com wrote:
> > From: Joakim Zhang <joakim.zhang@cixtech.com>
> >
> > The Cix Sky1 Audio Subsystem (AUDSS) groups audio-related clock, reset
> > and control registers in a dedicated CRU block. Software reset lines
> > are exposed on the syscon parent via #reset-cells, following the same
> > model as the existing Sky1 FCH and S5 system control bindings.
> >
> > Add the cix,sky1-audss-system-control compatible to
> > cix,sky1-system-control.yaml for the MFD/syscon parent node, and
> > define AUDSS software reset indices in
> > include/dt-bindings/reset/cix,sky1-audss-system-control.h for I2S,
> > HDA, DMAC, mailbox, watchdog and timer blocks.
>=20
> All this is pretty pointless - you explained the binding, which answers n=
othing
> why you did it that way. Instead you must explain the hardware design.
>=20
> >
> > Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> > ---
> >  .../soc/cix/cix,sky1-system-control.yaml      | 52 +++++++++++++++++--
> >  .../reset/cix,sky1-audss-system-control.h     | 25 +++++++++
> >  2 files changed, 72 insertions(+), 5 deletions(-)  create mode 100644
> > include/dt-bindings/reset/cix,sky1-audss-system-control.h
> >
> > diff --git
> > a/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.ya
> > ml
> > b/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.ya
> > ml index a01a515222c6..61d26a69fd44 100644
> > ---
> > a/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.ya
> > ml
> > +++ b/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-contro
> > +++ l.yaml
> > @@ -15,11 +15,16 @@ description:
> >
> >  properties:
> >    compatible:
> > -    items:
> > -      - enum:
> > -          - cix,sky1-system-control
> > -          - cix,sky1-s5-system-control
> > -      - const: syscon
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - cix,sky1-system-control
> > +              - cix,sky1-s5-system-control
> > +          - const: syscon
> > +      - items:
> > +          - const: cix,sky1-audss-system-control
> > +          - const: simple-mfd
>=20
> Just so you are aware - this means children do not depend on the parent f=
or
> operation. You will not be able to fix it later, if it turns out that chi=
ldren do
> depend...

Understood. simple-mfd is intentional: the clock child only accesses the pa=
rent MMIO via syscon and external resets/clocks via phandles. No parent dri=
ver coordination is needed today. We attached all resources audss needed fr=
om child node now.=20


> > +          - const: syscon
> >
> >    reg:
> >      maxItems: 1
> > @@ -27,6 +32,28 @@ properties:
> >    '#reset-cells':
> >      const: 1
> >
> > +  clock-controller:
> > +    type: object
> > +    properties:
> > +      compatible:
> > +        const: cix,sky1-audss-clock
> > +    required:
> > +      - compatible
> > +    additionalProperties: true
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: cix,sky1-audss-system-control
> > +    then:
> > +      required:
> > +        - clock-controller
> > +    else:
> > +      properties:
> > +        clock-controller: false
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -40,3 +67,18 @@ examples:
> >        reg =3D <0x4160000 0x100>;
> >        #reset-cells =3D <1>;
> >      };
> > +  - |
> > +    audss_syscon: system-controller@7110000 {
> > +        compatible =3D "cix,sky1-audss-system-control", "simple-mfd", =
"syscon";
> > +        reg =3D <0x7110000 0x10000>;
> > +        #reset-cells =3D <1>;
> > +
> > +        clock-controller {
> > +            compatible =3D "cix,sky1-audss-clock";
> > +            power-domains =3D <&smc_devpd 0>;
>=20
> My questions from v2 from the other patch are still valid - why audss sys=
tem
> clock controller is outside of the power domain? Why the audss reset is o=
utside,
> but audss clock not?
>=20
> This does not feel like correct hardware representation.

Yes, I agree with your point. This does not really reflect the hardware wel=
l. Both noc reset and power-domain takes effect on audss, should move to pa=
rent node.
=20
Thanks,
Joakim
