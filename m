Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013006.outbound.protection.outlook.com [52.101.72.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F793A63E4;
	Wed, 13 May 2026 05:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778651433; cv=fail; b=UnixBna87XnJdM9QjpJYxkTi1iJPMiq0rjltX7OijUY1xLks75vYHHPXY7yRjt/oq66EbYzUMtCzMeoFFJF6lFPvOeilUmrXp7nCGUAUqzdF+aUiYK0E4KZtD4yHPLofl+GgcnpnL1GZ6tzj+7uf+l6vK4OJvoPzdX5PZGI5vno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778651433; c=relaxed/simple;
	bh=t2WKjm/ymRRZ4TMtMWRe6bUtPGAvpDhEknF5yCVZU7Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WTcVYf4QcrMs9liMo9v7lZ4U5I0LjQk6Dkdug5Ak43dYSPTfzXaXNsVrj3xuFPh0jkGXyGnareJR/iZd+6duztV6KW/yU76oBih5b/Cciv50o60J5moEqpD49QV+b6KhSsxBBoD7vgFqlgaSzjGR3/yxndKnINrR1TWQrbmxbIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UX3q7RSd; arc=fail smtp.client-ip=52.101.72.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UX3q7RSd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TVZ/Du+q6ruGpNp2h4bU6YtK4JV2mYfYEYF40CvZBexhV2cvD7pryA2rS0ak2jWSDNg4pVzZwwhQrWz8YvMM2jhtJbvCNrASpVAj+AgaWSskDHRHztIeKYZtpSxMVr9THtjN+Hg0rEgzvpmdG+kHgi2Qi95LBYfQ2J4RWnGLrZt9c+UxtM9pOEtndQpt2z9s0dUgzTOGQtxD2D0hT5ihwhk4Z8M6C/72qt4SnMifFBVUFYpRZ+rlm5jaQA0taw0R4mh9pv5brH2NIBN9qYYkNPWMlVq/vmlByOu4eJiFoF9M3CevvtTn30Ja7W85ETFeI/6ZwAVi6BX4KvpFx217rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CUVgSGrl0tpYCaDN1gwv8cvt16Zs+BQz2pc9BzpsaBA=;
 b=MVUYuIIBpRPRwkeNVA/qxWD/v8l24Eqh5ClY3bQuOd5GQBrkNC2+W+XbCmVUfZkWYf8s6Rv93JaXxfL4C6V153ko/mdN21BJeDrQK4rDKoa6R/FwL/SfK1NiEmbUEmOHNgL9rPJdnYztoy2rN3bCanzd/6MaGrqmd+Ch4fm95L0fPiNzsI7L55SN1asEHNHLBodDGiFltgu7WI54SUerzN3+jLwK+jczaEATlZvrlOYwgt9dyV2kDUrC6NrlgFa39qS36rQNJ5P30zOG+tL0KkQ49NrhaJQ8GA5rLVF4eO5h5RM1Pk8Wi2lvGoGy6FCVG+1r/uZ6ZXIphtR/p4rn6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUVgSGrl0tpYCaDN1gwv8cvt16Zs+BQz2pc9BzpsaBA=;
 b=UX3q7RSdGpgw1cTTnUVLk1MKICclsroYX3M1ty9Y5Bc9iqo/NsUAoIVmTQpPMjf6s4Y+XlVUaW40WNhHCV20+ECDldZzIacxsWB9PlBwgtpCSgT+8jsomJTZRFq2x9lrGCyO8ZThBym97xCQ3iLH3AKk559f8SnIE+WtAv5qxqKurKxCcaeum1CyWV0bRCpwNaLX5oKPwWzAGtdONqeHfNA5dQizRaIRqH3+T72SLVg8CjKm3I2N1NRVn/XQ55wMsme23tVt8BgfFYsnmYXua988XNZHMgF3Sk1uWlclmNrVDWFCOFSH5t5qfyTEOnv3lwDMdiiKE5PXmXsJiyon6g==
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by VI0PR04MB11069.eurprd04.prod.outlook.com (2603:10a6:800:266::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 05:50:26 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9870.023; Wed, 13 May 2026
 05:50:26 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: Bough Chen <haibo.chen@nxp.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>
CC: "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: RE: [PATCH 4/5] arm64: dts: freescale: imx952-evk: Add IMX-AUD-IO
 board support
Thread-Topic: [PATCH 4/5] arm64: dts: freescale: imx952-evk: Add IMX-AUD-IO
 board support
Thread-Index: AQHc316FQAHw/cYacEW3Yh4PY1lvnLYIf1sAgAL35VA=
Date: Wed, 13 May 2026 05:50:26 +0000
Message-ID:
 <AM9PR04MB8353EEAAD71EA8AE5CF0269CE3062@AM9PR04MB8353.eurprd04.prod.outlook.com>
References: <20260509024846.2094049-1-chancel.liu@nxp.com>
 <20260509024846.2094049-5-chancel.liu@nxp.com>
 <GV2PR04MB122722970C97CBA8B5FDFCFBF90382@GV2PR04MB12272.eurprd04.prod.outlook.com>
In-Reply-To:
 <GV2PR04MB122722970C97CBA8B5FDFCFBF90382@GV2PR04MB12272.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8353:EE_|VI0PR04MB11069:EE_
x-ms-office365-filtering-correlation-id: 4493837f-e34e-40ce-b905-08deb0b38851
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|19092799006|56012099003|22082099003|18002099003|11063799003|38070700021;
x-microsoft-antispam-message-info:
 Q9Gp/s10SKOM4QqnkFESqSFsizIQ2ZhWtYMrwbqkNHlyiyqpl9YWS77EqXEbDRFkXknplkwq/9tKq0Vt+lg3XzM84xQXJRfC/PG6eNGfRr0e70cGmogXlb15//vOEG9lGqUGHCg2sz6vFC2tJmlZis1l0LudEfsXn4y8GkZXoe2m0mB1JDJKk/5C8JoII91jdJHhvMXu8zWpoRoDcfwNRW0NkRaaGi1HNKPzeAB3YXvQAAqfERlsr3mnC5Cv3UdzwE80YpiwDtVlpy8lefZOtPzVUsfnizDnJS0HajNKmg8bpXtTFlyDtXpbX94kBpfilU6ZAwEVJ3ttdPYwfnYNEKxa9GtsRQaP7Wu6iQ25gUFUdWIId25D8lxMfh3RhIyEu1WVS5UexhtcBUQh+XbjD+4H+ojr4cZZnpoM2KT5wwfnK3JAmDJbKN5nxKgZa+vq2SRiUPWxevCmBA6b3OkMLTNzF1BwCdfombsQG7ep39Aiv11n2bXsQ95bKnF8D3VvdTmNuyxlIUj3q9ZIhkJK1DOYVyUdIqgq5yDEwjRRIcC7SePgMjYuJ6fAZ4BgZI5A+juLsmGPo56ZFPLzMx1uh5uCd8lc8gMXfEcldHAM0EQbMpbempRCEjFo3WZfeOVZtJRMzP8vQInhTO0RsmKuMfwDFerlFPXaQWVyemt7O3oy4QY8MMIIvr0ZwHU1seHAAJaBeduigDmrf2RcfxKQbAcAtXSuktjnVG03H+jTtP9WkDNDTIjkd6+CX5FOlA12
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(19092799006)(56012099003)(22082099003)(18002099003)(11063799003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?C0uBIupvmlcGYkI8kT5r+HdRP3gxmv7DyLjM4frdZTEwZAV6C9YaFo1hhW2N?=
 =?us-ascii?Q?Mo1iwWqQ/iTCUCH1kPe7t07dIgWCDSD5RN+Go3bsZzd6rI5WK+6bYms6gakG?=
 =?us-ascii?Q?YUre/0lKdcBFQcwjKND9aoiPWdO06AqR0FtS/DuGeV1ZQmINQr1J54tLkRzV?=
 =?us-ascii?Q?sPEpB+IYPxRH5PU/z6rQ8FwMcOLs/y3cAUF7iPSxh9RJI5e8rFnW1k2RvtLD?=
 =?us-ascii?Q?OR5CeIE2sICQ3REXNsUlL3+gkMrOMHCg7yi7/Q+55J4ymMHtv6ujV6VyJioQ?=
 =?us-ascii?Q?Y3py3BVJvFJjQIILeAWHqoX33b4+I6CxFt664GxiZWEvtLMhaJnjVwab6iMM?=
 =?us-ascii?Q?lCkuXFUWko9lu0gNXsyrQAP2IJeEdRJ28Oea4k+MJMwpn4zIcZHsEIliW726?=
 =?us-ascii?Q?MxuSRMKx7Jz+VnHgHd5MBQ5c6wzGBoVMFkxDTkB4V3JTqO6cuFea2WYBsGRI?=
 =?us-ascii?Q?J7s1pwsmjvUjkEvrNI0XUkcLCzoSsvvb0A2dB+W9pN7gOK63evG535DNWatF?=
 =?us-ascii?Q?hssfucFx+5boSJTcbLzT0ovZz0q3FS42+RuNlW5ZoLsnR1h+DjuaDyQo+pkY?=
 =?us-ascii?Q?/37jyCvLWs15r4FO/lLx8i5yfY1Ibm2Gpo87zFafrpZ4ha7bB4uNl9nGqWP1?=
 =?us-ascii?Q?xOsnzXW/eCNIY6Jj9/8qlcgrPMQaLtdedru42AtDkshtd7Ah5x/3m/Ggszwa?=
 =?us-ascii?Q?2qfTjFapExjjrOQ6o9y1RB/oOqOtmpcMxg8tM/YuuHHlC0/PDVsXwJqzpBGY?=
 =?us-ascii?Q?6+uhjYbsCLJySvo35NUto0xgm4qd8EtLlvJviBoKxTHRTCGORNRB4AHkL4l6?=
 =?us-ascii?Q?DFRIupkVw+fMjJ59mi7n7RviO6rpsgN9DLwyiPKIrSpRhQMDCKnEgF2uqCkS?=
 =?us-ascii?Q?xh82BZdTzl8sbiNoPFQ0n3moBrYGOhzLQ3WcSAkC5G1Weat9Zaz9a1Vr6tt0?=
 =?us-ascii?Q?vYtE01jyY1cMtUFN1AFGI7NUy//OOhk6PgoZ0cCHLfUAFYz5vK31veR3WJyl?=
 =?us-ascii?Q?ll5MRMi5iu22kTyE+bNLHUJigf0KUASmo1qS6uBtY9qp77VfFgStiD+YDA8E?=
 =?us-ascii?Q?zMchBunb6zMoB9qYtR/GXoybvJ5PScDd+DMHx4tOnZdHSvzguIszPzxmTwD7?=
 =?us-ascii?Q?GsRmq/ecdMd+Ng+x4q0zXcxlsrt44tAooiLizExax6IDvOpXhsJMjwn2nmXw?=
 =?us-ascii?Q?GhM5MXPhoJBbobEPS1ZN5uCvgForNzxC7iMn7ElrhC6zI7gNANb+v6TOWMJZ?=
 =?us-ascii?Q?dKbZTmh6eGjwltG1fXZlu8Qjg2QUPZyNkryPu+9dn2UnjGQ7oXRXh0RxfPmO?=
 =?us-ascii?Q?rfrBpbGnYem4P7HtachlQF6hVawwaXer0nSQzJgzHijdEKP7z7RlBxkGipGn?=
 =?us-ascii?Q?a5EiBIfYWG+m3rgU4vyBIMVjPjT0ZE8yHfxhKom5WfAvLVjfy0WCvr0xGER1?=
 =?us-ascii?Q?uBfeHXImM+mVcmkMpkckIr49jf3ld0U5Vcn+aoFo4C/uCQV8jqk3vXiNGkko?=
 =?us-ascii?Q?qIcmZfHPcoVtma1LAFacu3aTCNz6zskr3YWThQ11K1HWzVhQ5maUaDf3nvCC?=
 =?us-ascii?Q?t1zDkFHJnE6bxcd3ruYlvZrAyakB4OP6XYdjl7oKypxKdYlUGu9uKcWns0G7?=
 =?us-ascii?Q?iWGIxCLAc76uSqhjRCGgfnjcSv8Fq7Ge6zcnaf6l4iy6//8oMDgShaP2B1JL?=
 =?us-ascii?Q?Nnv+F5rjS5vSLrcazGZUcJaDcHGR0GsI6yZimr4H6RfFU/Xz?=
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
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4493837f-e34e-40ce-b905-08deb0b38851
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2026 05:50:26.5580
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MuOZA5Pq5S4COTv9aSx47yPOG1XG5TBqnhbZ1qz23KEkAYSjSnhpOb4yGVDgvd/t6ePk82EXz8OgLRONbWMuhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11069

> > diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts
> > b/arch/arm64/boot/dts/freescale/imx952-evk.dts
> > index 62d1c1c7c501..bb1d8d5f5fcf 100644
> > --- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
> > @@ -43,6 +43,17 @@ aliases {
> >  		spi6 =3D &lpspi7;
> >  	};
> >
> > +	aud_io_conn: aud-io-connector {
> > +		compatible =3D "fsl,io-connector";
> > +		gpio-controller;
> > +		#gpio-cells =3D <2>;
> > +		gpio-map =3D <0 0 &pcal6416 8 1>;
> > +		gpio-map-mask =3D <0xff 0x0>;
> > +		gpio-map-pass-thru =3D <0x0 0x1>;
>=20
> According to the include/dt-bindings/gpio/gpio.h, there 6 bits definition=
 for
> GPIO flags, here you just pass through bit 0, should it better to use the
> following value:
> gpio-map-pass-thru =3D <0x0 0x3f>;
>=20
> Regards
> Haibo Chen

Good point.=20
For this connector on the base board, the intention is to only pass
through the polarity flag (bit0) in the GPIO flags cell. Other standard
GPIO flags are fixed on the base board side and won't be propagated
across this connector.=20

To avoid confusion, I'll add a short comment in the DT to explicitly
document that only the polarity bit is passed for GPIO flags on this
connector.

Regards,=20
Chancel Liu

