Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023134.outbound.protection.outlook.com [40.107.44.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A7E3D47C2;
	Tue,  9 Jun 2026 06:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780986446; cv=fail; b=LtB0f6yJ7+BQsIogMHOn/i4zswOU1S6iyq9R+vzJS77+ZsR6Mi+t/LYW/90hFdZzwnqnoh1j/ftNrGvH+wl8n4oa9YUzOCuim6Udee1g/NrjMaee00goulR88MqfJDF7KOBy9hVLWagTTszGzYMTGs1+DTO97AvQCL31YKSdyW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780986446; c=relaxed/simple;
	bh=w/AmEQGasAAoznpkBSYrR4nqi5J9loXeslT7hTcjzkQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UY2pK029tdxCdFjEEAClYvTUuE5VYYLv3pFCVE1FE1O3LFf4aeF5Nc00ZkSzw7UYOViPZw1vORuW4wN2vTWM7EnJFJEFp2+38fXTdi67uHPer6k4Bq651bBRIvUnFEpeBlygKkVQIuHhxMF2Siys6hLIZVSHkgiLItsMmPkYdLI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJrtWxOSEvc34VPi4W3g11l90X1YuLfZkM96zGyhtTzIY0lGRhjjedxNH4BIaUhhJkin6SXr78pkzf5hA3c5A/nMEKCW76jetqdZQdFCRAGHifKr9gqNYzJqn/dIe4914yFrvHyDEhwmXEFU0UI4c8tmcEFRiQhnHgPzKbTdkxkg5l/gawoyj9UqxEd49bukk1FiO9q7KgBYJAtci/GifeHvrdZZAYITWTMEvFw0qnGK5D+jyH7MaP3SMWHRypuYl7Cas+KxJlfy4GsEabE5uQzUaBy+2o0QWdluZXDjdDJncEom+vlSGU2ZgqAAwKayOI7WEcRZVbhOCnndeYm6rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CVODiw4fAagCc8F9Y8W3ftY8xsdsYa3eZ8Jian/vhU=;
 b=rXYp/9nEw9Ebk4SVYR+tLCpM7xDLdWx3lbovkak3ft9kr22QqTNUio456cSMTQBP2qsai4GGYSN7/TqEVypoZ4IKbD30Y4veqlkeCNKxOLDA7wwujwPORDaYLs2/5yn+nX9WZLvRLeAAKrkl7EwzH/hB0MSfv2WLcG8QIkgw2UwFROadqNhiF0kojGN9B8OjYgiHpaYuAWF6hADMBUELYabnX2H2RdWNFGIrFeJDMGi1WN99OT3b2M0xLyDuRbRb3V3pk7hUYTEU2yHtU9GPDyZkGuJzx5gbPhYDjO4P2o8vWqhKtPnJwgsNMYX3DIAalYmVgEY82+x4mbP9ZIXd8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com (2603:1096:101:df::13)
 by KUYPR06MB8554.apcprd06.prod.outlook.com (2603:1096:d10:8e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 06:27:21 +0000
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364]) by SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364%5]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 06:27:21 +0000
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
Thread-Index: AQHc9Jq591VKQm5fVEipnbHv8Jekj7YvsPmAgAXmAsA=
Date: Tue, 9 Jun 2026 06:27:21 +0000
Message-ID:
 <SEYPR06MB622688915CBD1AA9B65FFB33821D2@SEYPR06MB6226.apcprd06.prod.outlook.com>
References: <20260605032225.523669-1-joakim.zhang@cixtech.com>
 <20260605032225.523669-4-joakim.zhang@cixtech.com>
 <6c87641d-d505-44ff-a994-eeabf55f4c73@kernel.org>
In-Reply-To: <6c87641d-d505-44ff-a994-eeabf55f4c73@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6226:EE_|KUYPR06MB8554:EE_
x-ms-office365-filtering-correlation-id: 656df530-4206-469e-9856-08dec5f0297b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|56012099006|4143699003|6133799003|38070700021|22082099003|18002099003;
x-microsoft-antispam-message-info:
 kWS46od/bPF65NDbBB9wqF7Pc/PQF80ncwx/BqZdTg1ID5Zij0R1Jd03DDf+vPSj+qSJqFF5GNwy1Bz7BtmMF2zEKLeLFtrgvUKdgiSakXPF3enYpPiVyB71fWygqVhWvHj3y/lc4rwQSqnxIQSX7M85wCMunuXvfIIjh+6QGhvUHY2QdBqNIr6NJap+kcJ29Go5bu2ekuXCb4zz/9D84B2SRv9j1sh9AprC6rvs5RuuuVOu9kRz0EDr3wgaHeoZbXXBloyPPxOWHsc/TXQFPsEZlwVE6rd7w1BHCulXkZwlbGfq7dkRXXg6fgxa1TPeSuHgStFddiwN3Tj5MHpasacoq6ek+ZAzQgDcsCol3qDRk5TUrLh9xz4B6OqVdB2NRsvqFQqlnH0NIgOUV84z61ACpfZUtt0InVTrB1+L/dDPua+zb08NuztTZG6hjK19sUXEAdin4oFxWoWBUb5bbInaEXA0JIR2yjMBOIpQAOboqQBKaz+oNUYPb0cShRyXrM91V9ihKK5OXnzYCJjublim/snmLJVWU9IRtuu8dF9YGHNl7ITyhNE81q12pEeLrIgRsFHSOz1j4fBp341cLnVeceJbxFzhRVH3sttp2bqmZrhJ0NEXetVPRgpNCsttvlvMT5EFORWpR81rfJXQCWMXo1Ub2HOE05ThjBC470UykovQMAUgMkz2a6OF6169UHhMfp1xa5F4vdCzjCWiA8L3P/QpFDpFvPEok4I3D/3UqQNnRbKP0I+74esLCr8h
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6226.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099006)(4143699003)(6133799003)(38070700021)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?urAHTIxAw9UAnPzKkeTf7YkUsxBy7zwiqKlaoOSzGUl42Z+4JqkHROxjMvLx?=
 =?us-ascii?Q?f3n8MJQqgvOmbyABv4e9wVwNbTI6NWrmOqWgirxJj2hPAbovENW2paIm3Pj+?=
 =?us-ascii?Q?FWFqSQ98oE+Uw0xQEY2ZmK7guUFnvTsnKFXErla7JeALJm9F08Q1atpTq7pu?=
 =?us-ascii?Q?ZLoBA7E+hs5qgmYFUfNd1IsnJVtmP1DIlpvOm44GCpq+5LDXb59xOXT/TVJh?=
 =?us-ascii?Q?UZ8ERnNtO5gHKhGIbFpgu7hzhcGX/t2xYy8UqxKG8V3jMX7BJg9+LNQ5so3t?=
 =?us-ascii?Q?7yIOuJ+7WyeZJVvh+WGqyEBbANJuTLdJ48EYGABrz51HRJCeiAEP9aaRHwqr?=
 =?us-ascii?Q?7DuO/Bn4K+G+PocrN4rB27F20qogcK+rHvrGQvNzeAe6+Gg90SRlD+7nJjeB?=
 =?us-ascii?Q?VZEcdvJIh/R3vaaIoWJZ9LtW7HZRiK5oc0cHl4yfgaxUCcReH5Zi4xVCGwpl?=
 =?us-ascii?Q?mrN4KivX0KF6/vy5mlLesBqXduWThn43TR/bWOavQ5JBfW3nGhA+2dFl9RUs?=
 =?us-ascii?Q?UHFxSEYzsJ2dUv0yOllaUOrRNXqeveXcrpj7RRaM6A02Sue4oFQXctyETdx4?=
 =?us-ascii?Q?kZpdhEiXAAhd9FJZ1x3w1bR74kkwNWB2pXuDF7uC2rHLMS1iGAnubd/UZj7p?=
 =?us-ascii?Q?GqN0JT1tlfQfQH5Rx2rQsx/rmd/Jbl/wyumCB9vpBYe0tqYu5dhEAEN1Npm3?=
 =?us-ascii?Q?dbKbn2K53y4ayUOg8bsxNR0+MDMoszezhAklZ7Zyl0EQyrK5z3ZzYTa3aHUG?=
 =?us-ascii?Q?UYA5k/4m/8SkV3KVTpglTXfE9z9rYl3XdlKz1K0oTXBHNi4YRzrz5pAoYB2u?=
 =?us-ascii?Q?BSYwuHdTcxH35FAyp85deXlykO68EV5kIncY3+483khR9QSDoK8xWOqudPZG?=
 =?us-ascii?Q?UVvwkXb+uDusnN+xk0h0ntGboiv4MV2W9TuekrlW2zx+btlm2HI+RT5ZwCws?=
 =?us-ascii?Q?xJCuti9Le3S623aiJshfOIVRuIYs5oZLr8VfJBfHlnb8QH1R1Sh3QMZe+a1k?=
 =?us-ascii?Q?SnOuIRzRRO7PekvJkRzE/hgwwNkwgaoIDhTJibNsAvheSEXGZ/xj/WnfOEW2?=
 =?us-ascii?Q?7MfcOJ2746y7hH8Hzl1SNt2uVkL9b7rl62/ngRuOgixmdLW6iYe/rr5mQrOq?=
 =?us-ascii?Q?2S4Ve5WfMqV5Qb2FYmHoG9fW6RQljNfJkNOzry0Phgmr5ddNbMhoxUhSYLZb?=
 =?us-ascii?Q?zxtM+dJybNZlGxnBtd9oUdlEp0N2yXzYMNQ5mIlKPcm04TAvyMlVDDeLySl4?=
 =?us-ascii?Q?YmNd25caMFJa08+8Bxw2IoE8cpdTCFAe66LxOjriMG5Jol2QK8xxtuWJYZe6?=
 =?us-ascii?Q?tckcJB9SM38ju1AHfqEpPK0Gbsz0Eujzup4ST3ALKclb7q9JSceywKBEWPzX?=
 =?us-ascii?Q?20PNSQpu76U8aLhBmbQZrQS9+Bj2BYnC5ElbqEqAauUYnnhkoi+s2vlzr+Db?=
 =?us-ascii?Q?h0MkYEpLB021GctNA8DhVPoURqEtMPV+7i2ViQgHb+GZVUDDC7nKIWgZFAwy?=
 =?us-ascii?Q?6fKcYSohPea7hFoHNiX1O0V1eYROK6MGnkeadVbF0mhmSTaFjb9ZOs2GgVms?=
 =?us-ascii?Q?IkrCkwt6n53XR1Dfm1UQ7wGnHiGamlVan2r6WkFCet15zUsQhmndWx5SamCS?=
 =?us-ascii?Q?bqG9KVHwaG/YzHS+E+98UqfKCzxZK4Tb4Fe6hRtYzeDHOyn74oYLgIlxg8y6?=
 =?us-ascii?Q?fpKEWraOQExar+kXNQvB1LCHYxK2li/jNin27Bg8hcghEpn25Dg5/YGJ1I9a?=
 =?us-ascii?Q?q2Bakguajg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 656df530-4206-469e-9856-08dec5f0297b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2026 06:27:21.1700
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nlLcf3bzOLxR5osicJpT/FbOx3s2faLarEhSE3jC5EnIXxzdsMra/2Oyt+Foc15DLJasWlFjOLWAN8VLlFVPeZRAW3mU5dYRSjNfBKyzmVA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUYPR06MB8554


Hi Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Friday, June 5, 2026 5:24 PM
> To: Joakim Zhang <joakim.zhang@cixtech.com>; mturquette@baylibre.com;
> sboyd@kernel.org; bmasney@redhat.com; robh@kernel.org;
> krzk+dt@kernel.org; conor+dt@kernel.org; p.zabel@pengutronix.de; Gary Yan=
g
> <gary.yang@cixtech.com>
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
> On 05/06/2026 05:22, joakim.zhang@cixtech.com wrote:
> > +description: |
> > +  Clock provider for the Cix Sky1 audio subsystem (AUDSS).
> > +
> > +  This node is a child of a cix,sky1-audss-system-control MFD/syscon
> > + node  (see cix,sky1-system-control.yaml). It does not have a reg
> > + property; clock  mux, divider and gate fields are accessed through th=
e parent
> register block.
> > +
> > +  Software reset lines for AUDSS blocks are exposed on the parent
> > + syscon via  #reset-cells. Reset indices are defined in
> > + include/dt-bindings/reset/cix,sky1-audss-system-control.h.
> > +
> > +  Six SoC-level reference clocks listed in clocks/clock-names feed
> > + the AUDSS  clock tree. The provider exposes the internal AUDSS
> > + clocks to other devices  via #clock-cells; indices are defined in cix=
,sky1-
> audss.h.
> > +
> > +properties:
> > +  compatible:
> > +    const: cix,sky1-audss-clock
> > +
> > +  '#clock-cells':
> > +    const: 1
> > +    description:
> > +      Clock indices are defined in include/dt-bindings/clock/cix,sky1-=
audss.h.
> > +
> > +  clocks:
> > +    minItems: 6
>=20
> Drop
OK

> > +    maxItems: 6
> > +    description:
> > +      Six SoC-level audio reference clocks that feed the audio subsyst=
em,
> > +      in the same order as clock-names.
> > +
> > +  clock-names:
> > +    items:
> > +      - const: audio_clk0
> > +      - const: audio_clk1
> > +      - const: audio_clk2
> > +      - const: audio_clk3
> > +      - const: audio_clk4
> > +      - const: audio_clk5
>=20
> Pretty pointless names. Names matching indexes have no benefits, drop all=
 of
> them and instead list items in "clocks" with description.
Yes, you are right, I will describe these more meaningful.

> > +
> > +  resets:
> > +    maxItems: 1
> > +    description: Audio subsystem NoC (or bus) reset line.
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +    description: Audio subsystem power domain.
>=20
> So the clock part has power domain but reset part does not? This is odd.
> Especially that parent is audss (right?) and here you describe that this =
is audss
> poer domain.
>=20
> Same question about resets.

The reset and power domain takes effect on the entire subsystem, i.e., auds=
s can be accessed only after powered on and reset released, including the C=
RU registers which contains clock/reset/control bits for all device within =
the audss.

Because the reset controller probe does not access the hardware, while the =
clock controller does, so at that time, the power domain and reset were pla=
ced in the clock driver. At present, it does not seem very reasonable eithe=
r.=20

Linking the "reset" and "power domain" to the parent node requires us to en=
sure the order of the probes. We need to perform deferred probes within the=
 child nodes until the parent node has been probed.

Do you have any good suggestions? I can also serve as a reference. Thanks

> > +
> > +required:
> > +  - compatible
> > +  - '#clock-cells'
> > +  - clocks
> > +  - clock-names
> > +  - resets
> > +  - power-domains
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/cix,sky1.h>
> > +    #include <dt-bindings/reset/cix,sky1-audss-system-control.h>
> > +    #include <dt-bindings/reset/cix,sky1-s5-system-control.h>
> > +
> > +    audss_syscon: system-controller@7110000 {
> > +        compatible =3D "cix,sky1-audss-system-control", "simple-mfd", =
"syscon";
> > +        reg =3D <0x7110000 0x10000>;
> > +        #reset-cells =3D <1>;
>=20
> Drop parent node.
OK

> > +
> > +        audss_clk: clock-controller {
> > +            compatible =3D "cix,sky1-audss-clock";
> > +            power-domains =3D <&smc_devpd 0>;
> > +            #clock-cells =3D <1>;
> > +            clocks =3D <&scmi_clk CLK_TREE_AUDIO_CLK0>, <&scmi_clk
> CLK_TREE_AUDIO_CLK1>,
> > +                     <&scmi_clk CLK_TREE_AUDIO_CLK2>, <&scmi_clk
> CLK_TREE_AUDIO_CLK3>,
> > +                     <&scmi_clk CLK_TREE_AUDIO_CLK4>, <&scmi_clk
> CLK_TREE_AUDIO_CLK5>;
> > +            clock-names =3D "audio_clk0", "audio_clk1", "audio_clk2",
> > +                          "audio_clk3", "audio_clk4", "audio_clk5";
> > +            resets =3D <&src SKY1_AUDIO_HIFI5_NOC_RESET_N>;
> > +        };
> > +    };
>=20
>=20
>=20
> > +#define CLK_MCLK4            40
> > +
> > +#define AUDSS_MAX_CLKS               41
>=20
> Drop
OK

Thanks,
Joakim

