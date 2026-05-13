Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013001.outbound.protection.outlook.com [52.101.72.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782712DC783;
	Wed, 13 May 2026 03:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778642382; cv=fail; b=TwMDRG54FT3ngGihbEOJVYDhkgAWxMFe+Cr87zN4lh1VrLv+j28q4Y9E5+exPTe66h8xAynJ2D6EEnY38wQlQ15A1Kjy+c5FFbXUlbfTEihdH+/mJvf2rPloeYoHW4CpApAUvo/yZtC3GkZPQqri+u7qrwo97b9A2XYck2uRXB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778642382; c=relaxed/simple;
	bh=NOh9oyXNtrKNUzOUCcNXX3mmGaIirn1BWzB6gVayLOo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WcpW4dguoGEgsjrTXc1KfUbaSv5zCJaZSyBXFKLuSBh7lRbhNq6tHFLuQSpXekJeZL3FWacJyH+phFuH/gSBf19lUhcq3+SygDRYu7sWoax6Oi1LLNyk9X35P8V+gDH1moDc88yGIZt93vN4wXN/T8RRxVlCNMd8HjVViN9rfjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NhCPGl8t; arc=fail smtp.client-ip=52.101.72.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NhCPGl8t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H7avIj/6VmfsgtBw5ppYHCL89cSwQVYg2VpG0aNTa/yT5PCbXFDZmGK5d8vOfPSjgQHAglhkT4GChFgfXaF+jnVHResjN3/OQNNb0l5gNlbeGk15a4lT2yAVaocPN1li+ZtEawhd7G7GBJ0OhflVINH3tTxKy9NsGydSUHX3jhLyyLuj6qkTABRHoqCr5oJFUVEejG2an0/TKilSH1kv1DlDtoZNS8gHpBXrqG8m1vdEkv+PYvlgAfgqUJ8Pp2QakN2+gRl/bcCEo57/HqhArboW9GXuS/i7aqXNknUnw8wzyr+9G71MjrsWYjRDjLmpMBLJDDCwhoOvd9s9XM4G9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7HfzTTvIslIljk1fIwY8vvlobMaEcqsDqYgimgdYkuc=;
 b=VZ1Lqq+CaV12aA/v8R08L61U9tP5ocn4GgsPGVPD8QUjANFSXvSLQXWsJvl89+DWp9CDPiltJwcjS7kPoZCc9xbG1bYGm694xhDsBnapF8qK5mLIftN5TdJTdY4Mnzwzh0Ncs3NwXxBHcWyJND7gRj9SWMXI0hY/TGGsWtLiZN+t/K7U6LxmTSCJEwUP0+iB6yA72MeBTRDXAk4/mGXdcTqGyVE9njZxnpNlwLyB0O1aTHbzbcfgcz2NePlOVLfPImXYbyn01tI9LpJ+8CHGzRBCzAixQKpCRZQkLUMCAU8HQOoxg6ozExD7JRQDp0vkvSLmudF8EuCSG92Py6OVYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7HfzTTvIslIljk1fIwY8vvlobMaEcqsDqYgimgdYkuc=;
 b=NhCPGl8t4YwRW2q/hsB4nD3wXGbEDnsePLPWSQNc8lEjpNGxbIRNBm/ko22wqsOJ8m7dNC7PeCqu0k3bmuyTZCl2Xynu2CJAIIzFPf8Wzh1jPMFwh3OdGxL6i17CmGwwtTlxuXPRQ7y1zJxeSJK2qKD4MgLUIeLIv86Mf04SokwjomxUx+elfW1F0gBRj43Am/eaqQHbbgYrKs3JgKQWLCDHz2ds0K2u00SdpOlcjc4giKmPzWd/llt1zBH7Ub8uM1KxqRzxeNIVWBXYb0iRRPapIsJjNUnI65Jy/dHW37s2Kiq+uV48ALOAyzgMRQ6CFuSkw6arjZd6+omm/PvCrA==
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by GV4PR04MB11903.eurprd04.prod.outlook.com (2603:10a6:150:2ea::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 03:19:35 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9870.023; Wed, 13 May 2026
 03:19:35 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, Frank Li
	<frank.li@nxp.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>
CC: "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: RE: [PATCH 1/5] clk: Add support for clock nexus dt bindings
Thread-Topic: [PATCH 1/5] clk: Add support for clock nexus dt bindings
Thread-Index: AQHc3158VfB70hHkmkqSrDXWncQcGLYLTw3A
Date: Wed, 13 May 2026 03:19:35 +0000
Message-ID:
 <AM9PR04MB8353787A307A3064C669BD94E3062@AM9PR04MB8353.eurprd04.prod.outlook.com>
References: <20260509024846.2094049-1-chancel.liu@nxp.com>
 <20260509024846.2094049-2-chancel.liu@nxp.com>
In-Reply-To: <20260509024846.2094049-2-chancel.liu@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8353:EE_|GV4PR04MB11903:EE_
x-ms-office365-filtering-correlation-id: 0153fcd5-f07e-4ac8-6717-08deb09e7597
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|19092799006|11063799003|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 VvzIDJYaGBDYvRnM6nRBej4JVZG7gKATrEM25WBd8dBRfUsAHamR8RMMafqh04JAnsjAcNEndk09N4X1jUXPHIx/lbWzPW+czvgrzX1/NEe4dACfHDt+WgUsyO86cFBfMTNWwuXneC+7Zb1fW8wJ7UyeIL3oD6djdK0KV7wEzIpmSclM6dXkDZfkHwI/y7BQDcJonvQAhxpVD+dZ9olJb8BLhgh3cZNC9gw8vNXEkoyw0ZCzY+aYhLtANL061aYuvebXobCXXVueK6A8D8zKS/a8DUjgFeS90JJzEE85aOhTSyoRQI8ENra45mpj9FeDglL+492+ZOAxdEaJowOx8TF519Dv7E1LZ+7L3i19UmH09VVdCfBD4apywOZlHzf9S9HXjHzO//do2IQw/oXk/UvRgtEYr/x5woGMbDQ6QzgJ+Qdenrm+CvUCyLRm5x4lrM+Xvnb1+URIf2eOH90xE5coAneW/3eaQ6nmSviNa2owb6loUchwLm6osLfYLIJ2AmJLsrekLYcUHFU1mXBzrHtjtk4P0f/MFPvIWVfB/6iyHD3G9n53Zw3m2O5ht65qjd3sWfi9LOfxOZCMHK1NnyooXb3swKZfSbXRk4Efv+bHo9PLX+a0wKuW1pA2A9mv2YuW/HB0/6EtptMeAwMwwZ5+8Lhptj0s/40Tv7b8nu+03kacGtHWavtEiLE3LV8xbRa9fGNGN/1KzRd7WtLz2bYO918+4JOChesk4Lj6FyYem/h4P/je6TQ/dzoMojTX
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(19092799006)(11063799003)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?o7QeS8gSeM45vRZ4IyvecbZHe9DT/rTx2W0DSY9TdQCwQ5c2GHve5mH7kp?=
 =?iso-8859-1?Q?/th8XTSTbRmiYKUhyRw9bv0bV5jDZOlpegNXYyr9zzDiNeRHF8nfDOfpiz?=
 =?iso-8859-1?Q?xaSFYSHwFEeD0J0snFFET+o65xf9H1vw1s0rmHyW9p5IgLuaYswK/bIfxC?=
 =?iso-8859-1?Q?vVY4ucUxV0OH3Ne+RMZkjIvpD0TSHMlAZ5xbeC2eYRG4GYqN5F5eYwYRmg?=
 =?iso-8859-1?Q?mUvAIEQSvliYWY1+d1VNVRRdmDtR+K0kkLG6EzpyaUS0Uok/u1GB9axZHh?=
 =?iso-8859-1?Q?YQbjOmHU2mNJKXdorX7VBn+YmXO/kY4n/nGjD4BIIdfW9fwicCx8+/wwUL?=
 =?iso-8859-1?Q?G+CN/J+OrxT5/yfGxLBDtBJyLdJzwrPl6Gwksx22vqwvS73QlVIB7+b0YO?=
 =?iso-8859-1?Q?D3s30wNZ0qI6Xc7ckJVyF7kHT1/nQDC8qOval8toHNNvYAlh4vcUezjlha?=
 =?iso-8859-1?Q?IxPqu5g8/9VstKjT0qoS1rq2imDfzaF61Vc50iheF2tLODMwWV0/6ixzk9?=
 =?iso-8859-1?Q?zUpo6rLMFomSaLnXYHGVJmHJEAD+E9iVB70RQJKoGSgIoHPzc3A328uein?=
 =?iso-8859-1?Q?7VyXXGbn3IBnjsNV1ouBNC7YmDQjPfpAiB/eSwJPa2+jRUV1L0O0wM1FSq?=
 =?iso-8859-1?Q?pO47+hjezie1ajbD9Aw8wd8jK59e92FPVfoMG/3nMQca2rRJzvB1NSbIpm?=
 =?iso-8859-1?Q?rnFSXZxPIrnPRSFRQ24+aCK53tcWPOnHJbUp7uCwQ3NnuOKsFp0sU+tQkZ?=
 =?iso-8859-1?Q?RMGzZkKGrf3C1o9nISzL5de7Jep19GVH+kFX0ZAC3s+kVOFwNhamZ4BwVs?=
 =?iso-8859-1?Q?8y/q0h8x6l8/1bLIUOPocrxIiiLBMltObnzVcTIlkkCoIUBqonIelYy7uW?=
 =?iso-8859-1?Q?5JopPCbPi08o5aO8ZMUIspHAnGgLb89qlvAnjEj+2Js+mjo3QmywsJnAmJ?=
 =?iso-8859-1?Q?VCCtXWMYhtnNYlokRQktnoD6YyRLCTcgor/CzTcKwZD8SSH5kTf5yZnhKd?=
 =?iso-8859-1?Q?CK23DhNO3DbhTMHZMX2nth6gKKFtmjb5gdjXAESFcgvxR5HuD768v22UeA?=
 =?iso-8859-1?Q?XF1+adV8FRKfJWAxCjUXJxJUBgOYvyTx/7R2wahmLBPAW5CCzsBqBIudNl?=
 =?iso-8859-1?Q?PrBUUkczbvf64gxksiqipOivWcfFXS9zTIIyLHGN2LTh9KNjHv/Bwh0gIR?=
 =?iso-8859-1?Q?Jppjmaw+ma+5rZfxFc5MaIik2r7z92iZSf0Ax9V9s/UoCsSEzMwqGjv4VS?=
 =?iso-8859-1?Q?9tCarb2KDPqtLE34HJBgT7+PeIFlqXnk4FuqPvaJCjvP0xXHHm7ehyhdkl?=
 =?iso-8859-1?Q?s8d8vskxLh+6wk8IUOQqzRZmbGvkyt5U381VPTFIrCXfaju9lSVj+2DfT+?=
 =?iso-8859-1?Q?fCDNf8VNb6HNFY1IAFEg2IEQ7BDImV4Kahg3dbet19ToazV14Yqy2dz2A/?=
 =?iso-8859-1?Q?mRv3VrDcO05CtOxO7NST4MMQaEZccJPecaDOCJN/RByDMbrcke+pcMGZDo?=
 =?iso-8859-1?Q?vgkugG/XYt51qYTBDcgdelenMsl3oesv0GAtRW3VT7KJj5JfOasUMty6tc?=
 =?iso-8859-1?Q?uL0jNH0H7KTumWlMp7P2WAfnO5qclYnLsc01WkEPm16jtqk/S2b5GXbrJx?=
 =?iso-8859-1?Q?zYL1kKMyXzv3MmVDTXfbV5RvkaZh09EfvA7zNXRutBmHN9RG4tdEo1W14y?=
 =?iso-8859-1?Q?3lVONjSOhYMVRa6p1ZgGSroO2bPIbjCLZ5d4VFE1IgWFqAoxgG7W1fRktF?=
 =?iso-8859-1?Q?bD+Fdog5w82n60myoL89OeQNMBY/Moyddi6sHnXDGdht/6?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0153fcd5-f07e-4ac8-6717-08deb09e7597
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2026 03:19:35.6870
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iVQ25XFILN1Ul6Cqfn3zIAxDsDkbpQsqysrc2Nb/blCQ0rjyFcrz9Xnooa/mLOdy/vA1z77FUa3EuhBLFJFDuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11903

Hi all,

Please ignore this patch.

I noticed that the same change was already posted earlier by Miquel Raynal
as part of his series ([PATCH 10/16] clk: Add support for clock nexus dt bi=
ndings):
 https://lkml.org/lkml/2026/3/27/1983

To avoid duplication, noise, and wasted review time, I will drop my patch.

Regarding the questions raised by the sashiko review (e.g. assigned-clocks =
/
assigned-clock-parents behavior with nexus nodes), this aligns with the
ongoing discussion in Miquel's thread so I suggest we continue the discussi=
on there.

Sorry for the noise.

Regards,=A0
Chancel Liu

> Platforms can have a standardized connector/expansion slot that exposes
> signals like clocks to expansion boards in an SoC agnostic way.
>=20
> The support for nexus node has been added to handle those cases in
> commit bd6f2fd5a1d5 ("of: Support parsing phandle argument lists through
> a nexus node"). This commit introduced of_parse_phandle_with_args_map()
> to handle nexus nodes in a generic way. Currently the gpio subsystem
> adopted the support in commit c11e6f0f04db ("gpio: Support gpio nexus dt
> bindings") and pwm subsystem adopted the support in commit
> e71e46a6f19c4
> ("pwm: Add support for pwm nexus dt bindings").
>=20
> Change the function call to use of_parse_phandle_with_args_map() that
> parses the phandle lists of clocks to use the nexus variant. This
> allows remapping phandles and their arguments through any number of
> nexus nodes and end up with the actual clock provider being used.
>=20
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  drivers/clk/clk.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 048adfa86a5d..4240f059bec2 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -5206,8 +5206,8 @@ static int of_parse_clkspec(const struct
> device_node *np, int index,
>  		 */
>  		if (name)
>  			index =3D of_property_match_string(np, "clock-names",
> name);
> -		ret =3D of_parse_phandle_with_args(np, "clocks", "#clock-cells",
> -						 index, out_args);
> +		ret =3D of_parse_phandle_with_args_map(np, "clocks", "clock",
> +						     index, out_args);
>  		if (!ret)
>  			break;
>  		if (name && index >=3D 0)
> --
> 2.50.1

