Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013025.outbound.protection.outlook.com [40.107.159.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5191EB5E3;
	Mon, 18 May 2026 04:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779077928; cv=fail; b=fKqb6Giq4XqlBje45WXgC1MsbjUn9mD2i6XJUH0HLA5ehhe0HIMb0yi+HXaceVokGTgCtc6plLriA/2bNITR0DEOersLhhyJLOfsssXtM7u4IJM+coROhnP8pm2jXHJDvxIEyWAcADPszFb06/7ghbep8BGCOe22btxUU+Bf0l0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779077928; c=relaxed/simple;
	bh=NcfQbBzkSojfY/DOdSSC8GiyFfKgVUA/ocOf302uFCQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=h7SKWQBkS4rEiGxwDU4N8wZ9/l6JWlCJDRCMO8W0FuwQdpNPxyZ0jzU2BHNc9P+LvF/gCns1WXhHrfInS4t9vcGyQ8ZPQ62t7cjY6Z9BAXj+rsG1HUbge7auhjGnnPkcxAq461qVSm68vC2wnEDF653nlN4oY74kpxJGYx7bIGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=M4EU6BJ7; arc=fail smtp.client-ip=40.107.159.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="M4EU6BJ7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QKgI00+J7ldYxzJlM3slQ4EOoBRjkB0D9f7Lm5kmGi5PMvmm8Ero1EL6MN2DKvhIujpD78kcLIIW9W4DduBD9nnLg+dAPNoaQq3NodFufgnV2GRj8BhOKoOKzmVfpOf9jhw6QjPKCzTlyBW8YT80US6VWtev5amfqfbU5rnQPvt3UWHcqvnHLKDHw/aLo1Rcb675PlrGCC5FX3e3rlcQnv+crQEuQpfEbGOZmnT1vb9yiX2tbv5EyaIto17DjIi7ZqJbnlN8i45LBz0Ye/7O3MD3E11jXSTXepIeDRESLhtxGEZXQ21stimnfFfbscTp07hxOiAsaAjoHLE1u0a0vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ex0r4WZyGfDpvpYrnHdf07tit+pDUnyzI/K+zXWvwFs=;
 b=qeAVYM+nulwgn0UcsUkq9Y9qOZaY4jmJ/TiDCq2b6ZZMCmLh8e2L7kd6g+jwpWLfLkyVOUWn9UWDcGPwOeGk0OPZNIFMWL1sp2cuLSvLkwzsZuKYVhNWM/9zyi1G/uoF7e6T8K2YOlFl3wISgyDnvQ5s7UTVLRXvcOJmLesbnt6XV/e6Q6l60Fij+2xUuohljBLESQqMUBWfnOZ1A2TStHrtj2yvpWIpqH1qsREDkAooesRoD4ho4fwhqBn3+spwnhf5o8SBAjnXHoNdhMpQfitc6I3gacvRex95vE93qUzw0rD/RinSCPIAn3s3z08bvcLAXnyBdHwn6vPgx8qhMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ex0r4WZyGfDpvpYrnHdf07tit+pDUnyzI/K+zXWvwFs=;
 b=M4EU6BJ75BKAnxU1pkgQrSmBK36gxpJzUhYG1y0xu9lC5UUIbs7iK5ppmw4ukNGrh/1f3+g8LldCUreOqlpfDuMkxh0SKwOZvHINyPv2D7CiUotyQnjuFeULI76lGf1KopvGoPXenrBBcJmmIu5BlzCW849Fp8BtPgE3Jr9TARsQqIkrAQj+xW0+8cABVmzT87MPx/P4VVDZvZPoOxm1al7ZVaucHzKRm83V5PoIMBVg9Ic4iYGGyIlwYDwPc72uZ1HSJgY8zDJUCgNDbvy1Ehv85vjtM1ojWcZ3jvm6KWxegk+2djCl2caTuCnt294Xhqsw8N8sEtumUSlcIwkcog==
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by PAXPR04MB8736.eurprd04.prod.outlook.com (2603:10a6:102:20c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 04:18:42 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9870.023; Mon, 18 May 2026
 04:18:42 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, Frank Li
	<frank.li@nxp.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: RE: Re: [PATCH 2/5] dt-bindings: connector: Add fsl,io-connector
 binding
Thread-Topic: Re: [PATCH 2/5] dt-bindings: connector: Add fsl,io-connector
 binding
Thread-Index: AQHc5n1pty7/LSRdrUW3u+5nFpCvBQ==
Date: Mon, 18 May 2026 04:18:42 +0000
Message-ID:
 <AM9PR04MB8353FE81D06852D45514E460E3032@AM9PR04MB8353.eurprd04.prod.outlook.com>
References: <20260509024846.2094049-1-chancel.liu@nxp.com>
 <20260509024846.2094049-3-chancel.liu@nxp.com>
 <20260515-resourceful-singing-roadrunner-ce25ec@quoll>
In-Reply-To: <20260515-resourceful-singing-roadrunner-ce25ec@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8353:EE_|PAXPR04MB8736:EE_
x-ms-office365-filtering-correlation-id: f9730fb4-2d6b-4967-c2d8-08deb4948bd7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|56012099003|22082099003|18002099003|3023799003|38070700021|11063799003|4143699003;
x-microsoft-antispam-message-info:
 p2WMC/0lWjRWfHsQXD2KvGWaO+9rqrXvk4muGUfR1VHLi8/zCtg99i+iQenSdlbUcmU+sVd+TeRLwXIlg1FrAs1lXpU0NryKvuotU/tyvxDuflad1umyb+SHRG/dXfDxZKLA5SqAHNepzFU5PeDgxT9snetgyJkH/Yz44mfSxAl05xAosuoVHkOiR8LCDvInpBDt6SY2GhSJKBrb0sk0RrFI7OrlrRguoMpUz/7Vr4kW1/AWjkytNkMCTmTPDfoYaYEP8bgZgCt4r7R+rI4/N7eySUZA5XCCbio1VadNQ89ODYCNeY3QZHe1db4V6U3qlJ8/uFvqxh8Q+/VOUhODF5eOVARGIWNnFT/+x3jhvUguvH8WUy3WWDyaOGRsYr1GVVKr7/1IkQ/o9fj9xYqfVXnmcyRhhgspxXVgU0Ac5ofpO0D0fa+vBZNb4SiAaXYIvp2cwv5tsEFPj8gVryKNwvE+XcYG2zabGOcXqQnidypqFyYB1iMSl9aay/pBFjLEx6cWD89V4sGRItwwc7ELB3v2eoKmlTSWLdIw4iAX57UVkOd3yb1wagzq1luUwmpfxE9C9YYDdgC58Flox6CgjsVHw42gBC2hsbSTt7HJbXpgfOJMC/MO9+w+ATZWaaEl/GacAh6PJ8ctEHszeII1K+Kfe4RjnV2/PbZYqanQsilxARsBQB07Z0tnyTNi/bUhQki9RxxF3LImUFS2wIsJzg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(56012099003)(22082099003)(18002099003)(3023799003)(38070700021)(11063799003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?N2RJTVprSzFSVCtBZnJtYjQrbTkzdTRubmhoSTZva25OenZvYzlPVVVC?=
 =?iso-2022-jp?B?ZWhtTUlmVTAweWFQM2ZoMndTZ3dURVlOWlpHYXY1T1pIU1NaK0EvNkRV?=
 =?iso-2022-jp?B?WGtwY1g1bkFyS0E1eTBsN2U3OVpZNlZEazdwTUtLQlVqMW5hQzFCb3JD?=
 =?iso-2022-jp?B?MGRsVkpZWmxKeXR0RitwZXBLSlRBZEs2UGFleForcTBNRWdVVzRmQnRx?=
 =?iso-2022-jp?B?NDFMZGgybzIxMzI1eFZLYUJjb3ROczhQU2hSTWlRUDdBdmUwNll1dlVo?=
 =?iso-2022-jp?B?aDFzWEMzekFlRGVoL2lVSFRVdlNZaVViTGpLd2J6ZHBLS3c2djZwdDNm?=
 =?iso-2022-jp?B?VHFSRzArNFoydWRDb0lnUkVwL0JXQ2VmMWhOUysvVWtocFU5aW1qZVQ0?=
 =?iso-2022-jp?B?VDJ0Q29hVnRyZWlZSmtvL3RjQmpRZjZsc0xXUGVwVDJ5NHEvMjZzRkNo?=
 =?iso-2022-jp?B?R2RSaVRoam5lVWFFb3o0MUZzTlp0Z3FNSG5VRk9VVXhPNkZGb045YTU1?=
 =?iso-2022-jp?B?cnUwR3dtTzlOYVdQSGhIK0hyYUF3aVhWVEFJRlFwT2xXMU0wcE5sMlMx?=
 =?iso-2022-jp?B?OU50RU9JZ3c1K0MxV3kzUGZibjgrWGdEcCtpYThSZ0llMWZDN0FLcU1C?=
 =?iso-2022-jp?B?dDZoMzJKZWRQanVZeDZ1VjUyNzU2QTRCNG1HcTRzV25ROWUweDI3YjlK?=
 =?iso-2022-jp?B?ODM1VFVCWFJyLzdyU2pIS2VyU0xWUGo3TFJUakphR0FGVEtNd3p6TzBB?=
 =?iso-2022-jp?B?TS83WW4xV01JQ3VwdUpXNHhYVFk5MTgzSmplMFkrbmRNTHpHcUY0VFdK?=
 =?iso-2022-jp?B?RXI4V0RjYnVXYVNQeTU0WEFvM1pYL2NqaTIvcWNkTzJtWXgrNnk5NzJK?=
 =?iso-2022-jp?B?VWdCM3NYOG5ZdDJrajZlT0pvVVZ1VTBodUVpUGlFV05GcldYdk1CK2FR?=
 =?iso-2022-jp?B?bVZTNTZ5OE03a2tMZy9tbmxETXVaM1ZmdUt6dVN4dDI4MHcyUFdKb3Z3?=
 =?iso-2022-jp?B?SFJZUWlGTDJIVEwyQnhPWUxIcWJBK3E3M09qbnFISmtPR21rK1QrZzVw?=
 =?iso-2022-jp?B?NWlTTWdHQmlGRnVnSCt4bzI5Tm1GbGlzY3FIQzNxTlMwZ2l2NFVKSkFx?=
 =?iso-2022-jp?B?U1Q4UUcvajBORXltQW9xZFdnRnphcU8renZSLzNLVU1MTFRBbm5rT2d3?=
 =?iso-2022-jp?B?azdrRUFGbnQvWWhkUHVlQmVrSTdpQlBNMnVwWnFmWjRjZlI1aUJjR0Vh?=
 =?iso-2022-jp?B?MEJCOXBHMkNYTHlPY21xQnprZWxscVNSYTE0UW5WQ0FEQkEyOWxWTktv?=
 =?iso-2022-jp?B?b0RXTWJEcVVHbjdPWk1DTnRaWUd2NkQ3aUdYVGs0cUxNMkUvTHdDRXFj?=
 =?iso-2022-jp?B?bkNVWVFuc1dHdnJEelp2S3VtT1BrZ3N6bkhveUpjaHVaa2dqUzNWNEtC?=
 =?iso-2022-jp?B?bXRLckpmSXlHTlJPbWNDZkV2T2FxdEFMSUN4YzVycGRqVVpkQVlsRGd0?=
 =?iso-2022-jp?B?QjVJL0ZyQWlKN2VITXlHSnl6bm9vYlRoWThYMHgyNXFUUHBMaSt2bTkx?=
 =?iso-2022-jp?B?WkQ3ZGxtYkNGcnl5Wi9ZK0VSS0dPRUpKTnVYbXk5ZUlVeVl6eWM0WVRm?=
 =?iso-2022-jp?B?VStOcXlDWUJOV1hJKzRQV2xUTW0ramN1NUhWZ2E4OGkwZEdiVitRaWdP?=
 =?iso-2022-jp?B?OEpSS1BmTDc1SGVFa3dsTDhYYkNvNWRLaGk4Slg1NFY5Qmt3NWFraFBL?=
 =?iso-2022-jp?B?c2t5eFRrUzFXZkdZUjA3ZkFiY0JRYlVkRmQ2MHh1QUo1cnNnRE9qdjNo?=
 =?iso-2022-jp?B?ZGxHR2I2YkYwcncwOFpWVkZ6bFo4SjlSMm1vQTNTU0Z6RnEwbDNsYUlt?=
 =?iso-2022-jp?B?ZXRNZEI5TENNdUM5TGtjYzhXcTdPL2t2TUxzSk1Td1VzajI1WEZ0aDdq?=
 =?iso-2022-jp?B?RlNjd0xmc0dQemFlZmVsYnZkbXhmVXAvdEMvQ0NPelk3VUh3SS9BY285?=
 =?iso-2022-jp?B?QTcxeExkdDdxZVEwanJET2hKSmYyRXY5NGsxOFRXYUFBRlRnczhESGFV?=
 =?iso-2022-jp?B?NmRsd1hyZ1VZM2VwUWJXdkFBRFFjUU1MK0lhSloxY09wb3BiMUY4OURl?=
 =?iso-2022-jp?B?bk94RXJPYkgwdzdPUmNtdFBVWHllSEppekRQdjU1aS9ZNEhDR0dKVHNM?=
 =?iso-2022-jp?B?YWlDbitvSU92NmlBcHFBY0xmTytoayswTjNNN3NqZjY3WUlrdUIwcUFD?=
 =?iso-2022-jp?B?VTRWZ0VJSXdCcXAzWWY0ZmcyMk5uZnBNWmZzV2pCeXBZTlBYbWpKb1kw?=
 =?iso-2022-jp?B?dk84VGNZK0M0TlE3QjcrK1VvenhsREdNcGdwZDlCSHJxNmVoRWtqNEZn?=
 =?iso-2022-jp?B?aVJhL2JtL1Y1VkljT21UeHM5ZnNYM08rTU1MZVUvOTJEUG5vK1dRK0Qv?=
 =?iso-2022-jp?B?WGJlUmZ3cEpONWlaeHZ6NFB1TTQ0ZHZTRU9VZ2o4YnNlQS9zNDQ2bmhB?=
 =?iso-2022-jp?B?d1YzR2E0?=
Content-Type: text/plain; charset="iso-2022-jp"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f9730fb4-2d6b-4967-c2d8-08deb4948bd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2026 04:18:42.7426
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /qJuQzLs7v0K4dVaio5Gxbcvydc4CtBfBOuxoJ1zM9FuLUwnhCcFWPwA/U5e+jcAV4O0H8/nw6fxIBn1uXivIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8736

> > +description:
> > +  The NXP I/O connector represents a physically present I/O connector
> > +on the
> > +  base board. It acts as a nexus that exposes a constrained set of
> > +I/O
> > +  resources, such as GPIOs, clocks, PWMs and interrupts, through
> > +fixed
> > +  electrical wiring. All actual hardware providers reside on the base =
board.
> > +  The connector node only defines index-based mappings to those
> providers.
> > +
> > +properties:
> > +  compatible:
> > +    const: fsl,io-connector
>=20
> Everything is IO. Everything is connector, so your compatible does not ma=
tch
> requirements from writing bindings.
>=20

Yes, this compatible is too generic. I will rename the compatible to
fsl,aud-io-connector.

> > +
> > +  gpio-controller: true
> > +
> > +  '#gpio-cells':
> > +    const: 2
> > +
> > +  gpio-map:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
>=20
> You do not need to redefine the types. You need constraints, though.
>=20

OK. I will add proper constraints.

> > +
> > +  gpio-map-mask:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +
> > +  gpio-map-pass-thru:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +
> > +  '#clock-cells':
> > +    const: 1
> > +
> > +  clock-map:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > +
> > +  clock-map-mask:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +
> > +  clock-map-pass-thru:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
>=20
> I do not see these defined anywhere. I also checked cover letter for
> references for pulls to dtschema.
>=20
=20
Nexus nodes are already in the device-tree specification=1B$B!'=1B(B
https://github.com/devicetree-org/devicetree-specification/blob/v0.4/source=
/chapter2-devicetree-basics.rst#nexus-nodes-and-specifier-mapping
For reference, current kernel has supported it:
* Nexus OF support:
commit bd6f2fd5a1d5 ("of: Support parsing phandle argument lists through a =
nexus node")
* GPIO adoption:
commit c11e6f0f04db ("gpio: Support gpio nexus dt bindings")
* PWM adoption:
commit e71e46a6f19c ("pwm: Add support for pwm nexus dt bindings")
Clock adoption is ongoing:
https://lore.kernel.org/all/20260327-schneider-v7-0-rc1-crypto-v1-10-5e6ff7=
853994@bootlin.com/

> > +
> > +  pwm-map:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > +
> > +  pwm-map-mask:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +
> > +  pwm-map-pass-thru:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +
> > +  '#address-cells':
> > +    const: 0
> > +
> > +  interrupt-controller: true
> > +
> > +  "#interrupt-cells":
>=20
> Use consistent quotes.
>=20

I will fix it in next revision.

> > +    const: 2
> > +
> > +  interrupt-map: true
> > +
> > +  interrupt-map-mask: true
> > +
> > +required:
> > +  - compatible
>=20
> You need to require the properties. You have a FIXED connector, so it has
> fixed set of features.
>=20
> Best regards,
> Krzysztof

I will make gpio related properties required because they are mandatory
for DT. Clock and interrupt mappings are board/configuration dependent
so I prefer to use dependentRequired when they are present.

Regards,=20
Chancel Liu
