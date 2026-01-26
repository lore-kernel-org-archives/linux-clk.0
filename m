Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013034.outbound.protection.outlook.com [52.101.72.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5ED827CB04;
	Mon, 26 Jan 2026 06:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769409279; cv=fail; b=bEDwMRf4FmQn+WFQgdF7Uq+RFpI25z8EOGnsf+aM8yfFo4BPLIa60lAY6WPtRRNePry65XRXUFD8XkgAGSSw9P2gByLdslhSuCqJUBgQQE1nh07z0a5Qy2M1Th/N1tm3VT9IZh67vWDz0/CnpiSbhK1qXvJ/hZASuBOQaaPhOPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769409279; c=relaxed/simple;
	bh=CaZI5jTlEC69CNiZ4mdk86r2Jw7gMRti8zfYI1FjSD8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cJozgraFq+F5hZt1hiI3g7S99t2tzRCBmUN0osD9sNBqm+iehtoEtVA/cQpFwUydW+ppTej7+bkSXgzxqmewMMRqklLxskqtEZv6lGP4RxrOiHe6guwqlnh0lBQE2Bslb1gi1Z1iSD92B4AuI3Qz3uS2fjkYozZxcseBO2R5mBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GET0xCft; arc=fail smtp.client-ip=52.101.72.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GET0xCft"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hl2fCS5zf3UwheDwyOBhOIWc7596FG6dTSbV3Z/Wth/flRQoFYBmu4uZJDpTDqv1Km4UEVK7B9M1XrmLgqigYN+fRc+2gmYOqnFCWQznO3dw8KkhyASUCUqM5hE57wMnVnEkNvNZdUoCH1+wjymnHAx+KIHYDuwLHahHgvWjx0uLiJPcs1sU6VDPDziSzy0Kw0pLy7DlM96Z3dpBxTF7lcPbhzubSp/zlaKNMtMrd3+g7fAKYFQ/DQY7UJMtjhXTadpADCaHMoxoGpEeagEn+d3NDWs507k7xV4kKBuRmEMPdNs816mOuFsJyACqmtIAxAgFGoe3FAdjuqv46suY8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EsCVTgnRX6zlzuE5f3q/Y3qlT4AflOBvfWof7pdwat0=;
 b=YsmOZIqU31FS99W9NsfhJVJqAIIFCcBEdntwzDQVCVa1gnheYdPKFAoOl6RUBNmzX05kMqgFYgIN3SeNLbmUMTO9pqJ+4SaM5lAbEAOIKXBvHZSsx6CfXHx/EAeIkeUe0i0YeWCDFwGOcVKlsh065Brw5dNSEgoqc0gqRW3N0iWEP/Q3xi0ZYrfx6r6hOyrZWPsNdtfTOsgSCv9DTZdakKAz9fR3qDspty/shSDKyjoEBz+8yRyK5pefjgkyaTm7tAEuxVZ0vTaGca0TBL+McjNKkcpKRpuCbiAS0IcFIPfEgCyxq2mg0ZXgl+quGpAEvazda8UjL1V5nJMqOtCisg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EsCVTgnRX6zlzuE5f3q/Y3qlT4AflOBvfWof7pdwat0=;
 b=GET0xCftHafUV534zT6IO++hpJSylNDYRGEKqYFNkJ+QnBPxRAhpr+h4ul1jlYUwK0670uv9hai5TS0CzJ141itot5MRycs+FnTQe+R3TCqcyaOFnxxZQGeMjgvNNtWBTdHHm+wX7kdNXUcEJTobNQf3JCM2aN9Fp1Okui0VybJHjAwjrc3+rrOXksFomRZOeMnLzx97NV7KCC0LJZJaWuHcb86Tzh5mgPiPl2VcDG3pWkykpLcOGKL0Xm3Qabf5yia9+z1fA95vWHQz29/D0Bl1EWfKBSZg6bOZNrgHClf8SRlgxYo3ubh5qHvGogmUvpwMwyoqBV/C/YZ6Wg80/w==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV4PR04MB11974.eurprd04.prod.outlook.com (2603:10a6:150:2e8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Mon, 26 Jan
 2026 06:34:34 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 06:34:34 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Lukasz Majewski <lukma@nabladev.com>, Michael Turquette
	<mturquette@baylibre.com>, Abel Vesa <abelvesa@kernel.org>, Stephen Boyd
	<sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH] clk: vf610: Add support for the Ethernet switch clocks
Thread-Topic: [PATCH] clk: vf610: Add support for the Ethernet switch clocks
Thread-Index: AQHci6AKjykLDAXxdUSpRkHNbtLt57VkA/ag
Date: Mon, 26 Jan 2026 06:34:33 +0000
Message-ID:
 <PAXPR04MB8459D29C90848DB101F726DE8893A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20260122130649.4150338-1-lukma@nabladev.com>
In-Reply-To: <20260122130649.4150338-1-lukma@nabladev.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|GV4PR04MB11974:EE_
x-ms-office365-filtering-correlation-id: b94f6b80-7588-4055-ecf5-08de5ca4f81d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?U169Zr7jep8dt+aWuB9V83RMbGfKWO4/GcbZg5QmzNNvOEQmkZyd/oYXwtxN?=
 =?us-ascii?Q?hq0Ne5f/3B/L8BKy/YSRkDC3tSMRwvcMv955W42gae0OBxMmajgFz9FU6hMu?=
 =?us-ascii?Q?5Z2I8Ihu6FHCB3weDzJry0b59bb8d20HlPwGp+RzXSoj3bzwkIPXWX7ODLWv?=
 =?us-ascii?Q?ldkhybFD+gjrhY4cNRzA9sHiobcEIOG1OOfYdh+H3HD0pyLD9jieT+g2+Ln7?=
 =?us-ascii?Q?p48qZQIeFO3gAkG9ct9O/AatGtPhgF8cKKfGbqXUG5IY0amN93J/7y4MyNzX?=
 =?us-ascii?Q?7SN+Adhf8y6cSLVBsQS+rvt6XkqV7ZnHOfkHCWv0SlOYQ9btp1PCkrUPistv?=
 =?us-ascii?Q?eTQv2V0vyQyXxKRcNe1KCfir5CDxx+vwW7XDZ99KF/JPtvBaGS7XjmydlqGu?=
 =?us-ascii?Q?Ut/X+xVCh7pQRf9KZsEUssrOBPBUm1YkWsdj7H0mgBsn1St46gEi0idJlqYr?=
 =?us-ascii?Q?lEPZ+J4GgZIDzuz7rfdRE9Eby7kGIalKhmQaTS+5x1xm3xkIbEFIMYk1EolN?=
 =?us-ascii?Q?YGbUXkSZrB4ObgZEosBeKkQ/KtH71rh+Q5Td2MOJZrVy9QS46/QGV0/TsscT?=
 =?us-ascii?Q?4tqhKpe/fUQbY1hl9tKv/VFafAN7W7T4skODOL+BQi6fiOCfyddsbhUplvJB?=
 =?us-ascii?Q?SmSxcoffrEaALUoBib4pqk1Qc9DutZlwJH3JFSvFYxpUQB4ezW9zbQJcNBZV?=
 =?us-ascii?Q?ZT2GAPthQkUDZncU1/yny0ygWWYi0trwnsTu6+RsrgpS68SuspSb3XrW6/md?=
 =?us-ascii?Q?eCAXLyShlhuHiDx0QbyCyk7KFTvmjtLIrsyd6G02M82kt7Ka6vDmjDRBl/l2?=
 =?us-ascii?Q?L9e4nn4v7GtM6aClok5LRgUwPcGM5ylB7bt2KsD93rU09YYM2UCTYAoYEqgb?=
 =?us-ascii?Q?Ut7hgBfrMUKR5btrG9U3zqd7ltRUUNBINmbOy4QyyJWG88RSlTFE3LU1+c7O?=
 =?us-ascii?Q?vdNknl+LWo6HmWmAYdhHxzUUpVF/syIj39iz33EWxMj/hfd0a5UIXWpCZtRg?=
 =?us-ascii?Q?0ZgcgUi2o71DKymjt/RlDAZ2fgBt+J9EvnQ5SP6xQTg6yaTIyfHzKt48fnuF?=
 =?us-ascii?Q?Z4tbvz6BiLslW4x3tUasDizmkRvfkNZlXY3WoxZGsRlkLy8rEat63ibNhc4d?=
 =?us-ascii?Q?sG2mkyLuzvDDIlPZLgZpAr7z3zkhEYyHuvmtANBucO+c+4XWXAOVM4DV9QyH?=
 =?us-ascii?Q?eZmfhVoLYmsRbXRtHNsOc+uJYm6xjZhMsdDLkM3xcC31dBLGUF5Kh8YNll/o?=
 =?us-ascii?Q?ecxsuJhXPhuth5jo95viCgrt+lP83vllguMEhjn3PFwBqrSyto3CD6vBoPgk?=
 =?us-ascii?Q?BWpKcRUrQkqEA2B0ux6TBRtPZrbughAGnagifpGS2kPwv1H4D+UxK9+2ujFL?=
 =?us-ascii?Q?EbUQat6wKL3EubPh6ifBqtA1519mi4OBQkgHWAh4hVZT74nqLECrwg6O0xBG?=
 =?us-ascii?Q?0XXoaazbQsSY7vJH/pqv36qHZbsE/gZC9Rm/Fk76X4b3ZTwS3+TMd3rIJj4h?=
 =?us-ascii?Q?jqrGlCjDKXxiVMA0hPosiGx/lv5EGyja6MI9lzlzsWzi9OSspMR9pH2LNcMj?=
 =?us-ascii?Q?hkFgX7ptiVYVgrjNQ12W3uVPCoOjzhgEc7ezPb+dT9t3O3JgQbQ8eAM91w6k?=
 =?us-ascii?Q?BRgKRuYhbUchiENn0rEJMgs=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?BEGFn//3bhtUIAPgsAqDSPttA6Xc7Z8xxehmaaanoKY+FXr9ATcB3fVv3PEE?=
 =?us-ascii?Q?7xiwfST8rCQaQHlOblo83y2k6MRq7R9uD8eTZPlJgP4ily99JYSVKuWkOaGs?=
 =?us-ascii?Q?Rs/Scx4zaqJb9JhvZnNxTHkZyadQ85bSggspGrM1x5xHT1tEdPXPxwaYwXtR?=
 =?us-ascii?Q?WSX/v3EXpfuuVguwJF3ZfNwmKz06SvqH+iCTOSTtaTQHzfvw5MKj0RqrsPpM?=
 =?us-ascii?Q?2dfhL3/xB0xNXp53+HqyQ0tQHMGlm8GNYq14zOoM3uuD/+pKzq0n+K02wdAL?=
 =?us-ascii?Q?m6ehGOz2RnE+0rB4ntIqf1+bk6QHwIv/rQZfzy9m8WHcD2RftZzeXaDN3uMd?=
 =?us-ascii?Q?MXUvvTdTqvd+SlUQxo9+CTQJDP3TN3WhwEMYPmICGfq75VSFRtLTqeLz/09L?=
 =?us-ascii?Q?ZOYuwKP5a/U+SpGFA9K7lyWpAatDruWSgM4KhnpkQRKhs4SUt3zFQmvlM6vt?=
 =?us-ascii?Q?O4HuywMZ7Qbmy0MRw9Bo2ANF3htnJsb1iPx4de2INvoNfbgVASZ71ec9xZ9/?=
 =?us-ascii?Q?ieNoJT5k/sd8hN+xVBgml2oJS1rF91LQqrgHmE9xGBjMpc7wNgwJ800/G3FX?=
 =?us-ascii?Q?lKM1juVLj84RkBZXgknNT8NOmJYuLze4r5KpRuJ6X940pT4z+xFqxLMyYNI8?=
 =?us-ascii?Q?HHJWUvVV8/Gon8Efdcx1whipmJC7cDqG7GhXsLis/pDV7yeZnJM4g7Ajfacr?=
 =?us-ascii?Q?8Voidi+3KMsxbbTl/23NMA7znwsbQT3ZqFUBJRluDgzn/cSlJyU4qKZJLbpl?=
 =?us-ascii?Q?LczhKDkENmjW0QIS+Ol9n+XB/EH703y09i4sk6Wfu0DJ4qcSgR6xYgiiXb6/?=
 =?us-ascii?Q?kqgUqJgKLS66mLSxWDhhrkbV3glrd7BJ0Xjd+8bIMv5t369q0HRZySkPBQpJ?=
 =?us-ascii?Q?4L5Bla+9h4O5qpt19qoALfZK9q8H5VE/uSpj/npFoMdD4NoqBj/x/6SPqAeZ?=
 =?us-ascii?Q?kJ/+om/fVu1XS3T7vLrEFHrudcnPvdO9dvATlde5le1tomtouGOi/jApmdfu?=
 =?us-ascii?Q?jw5QoCtlVGPtqjaVCo8ilyOUh12o5ALiHoTk+2nP6n6zzfexVuv+1/jflaZq?=
 =?us-ascii?Q?Xqzs+OwKFQm4/lDvz4czZCNwy9wKKeBOEh5s9TjZun61UMEfbDLGWdTYJxli?=
 =?us-ascii?Q?gJLU7WDLcycYsfZtwnB6LeZRw7kqlRWbbMvDsZUVjqUA98+/tTc6ndV4v5B/?=
 =?us-ascii?Q?jOnbDPRFpvh6uub4ULSCDPBJAfLwl5dCYQK/WkHLypFXrrasPKQ1cFRU5S+y?=
 =?us-ascii?Q?1K6IRdjNZlxmhngif+aNT+A7Nf9+l18AnTrarZe3duhVT4W1RQ2BIR/15HaY?=
 =?us-ascii?Q?QOPqFXAlibPzjN4n8aWKmlR88zanWPlRnJimZWI/3bFnGqynRnHiHH9c4oUx?=
 =?us-ascii?Q?6oq1T6R9IpgZ3I3XDD3TEsU98lW43DJHrLAPEkKXUZ5cZ8vM8pEaq2SaB8tO?=
 =?us-ascii?Q?+N/ummL4zuED3Hy8x+6kdYPF7Np5sibFiTOdh8otNSoyS0p4z434Jj7VVlCy?=
 =?us-ascii?Q?P/f5Ueh5+0idBMnb60YiaePgS2slRLi5Iaq7UbQHJ+Fp4BoVW7ZtqH+Dcf7O?=
 =?us-ascii?Q?Vu8gd2gswmPGienUx5ITgmBfP+Hbe9GLDayNVHT0x42loWFVq+WyGhZmnHXA?=
 =?us-ascii?Q?DhExYff0wy8YxXcfr9FqXesVER3CyNYnyPJVrrOYy+9Xq+Q9gMUQwwfaB7Vo?=
 =?us-ascii?Q?QJEYyxKSM1IhcHtPL0mNqaVOhqlb0WQ0sDtXDQqodF05LK+I?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b94f6b80-7588-4055-ecf5-08de5ca4f81d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2026 06:34:34.0058
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jEK1u9ek8WjRE25AG3ikwXxp9pNZwjfbykfw4f+3kFNKCT6o+isDx1MI/aEVRq1ezluhPaqCVnoOcoY6TD5GAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11974

Hi Lukasz,

> Subject: [PATCH] clk: vf610: Add support for the Ethernet switch clocks
>=20
> The vf610 device has built in the MoreThanIP L2 switch. For proper
> operation it is required to enable ESW and MAC table lookup clocks.
>=20
> The MAC table spans from 0x400E_C000 for 0x4000 and it is necessary
> to provide clocks for each AIPS1-"slot", which size is 0x1000 (hence
> four separate entries).
>=20
> Those can be enabled via clock gating CCM_CCGR10 register
> (0x4006_B068).
>=20
> Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
> ---
>  drivers/clk/imx/clk-vf610.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/clk/imx/clk-vf610.c b/drivers/clk/imx/clk-vf610.c
> index 9e11f1c7c397..88c9b656f244 100644
> --- a/drivers/clk/imx/clk-vf610.c
> +++ b/drivers/clk/imx/clk-vf610.c
> @@ -309,6 +309,11 @@ static void __init vf610_clocks_init(struct
> device_node *ccm_node)
>         clk[VF610_CLK_ENET_TS] =3D imx_clk_gate("enet_ts", "enet_ts_sel",
> CCM_CSCDR1, 23);
>         clk[VF610_CLK_ENET0] =3D imx_clk_gate2("enet0", "ipg_bus",
> CCM_CCGR9, CCM_CCGRx_CGn(0));
>         clk[VF610_CLK_ENET1] =3D imx_clk_gate2("enet1", "ipg_bus",
> CCM_CCGR9, CCM_CCGRx_CGn(1));
> +       clk[VF610_CLK_ESW] =3D imx_clk_gate2("esw", "ipg_bus",
> CCM_CCGR10, CCM_CCGRx_CGn(8));
> +       clk[VF610_CLK_ESW_MAC_TAB0] =3D imx_clk_gate2("esw_tab0",
> "ipg_bus", CCM_CCGR10, CCM_CCGRx_CGn(12));
> +       clk[VF610_CLK_ESW_MAC_TAB1] =3D imx_clk_gate2("esw_tab1",
> "ipg_bus", CCM_CCGR10, CCM_CCGRx_CGn(13));
> +       clk[VF610_CLK_ESW_MAC_TAB2] =3D imx_clk_gate2("esw_tab2",
> "ipg_bus", CCM_CCGR10, CCM_CCGRx_CGn(14));
> +       clk[VF610_CLK_ESW_MAC_TAB3] =3D imx_clk_gate2("esw_tab3",
> + "ipg_bus", CCM_CCGR10, CCM_CCGRx_CGn(15));

Seems you post dt-binding in a separate patch. It is better to
put in one patchset.

Regards
Peng

>=20
>         clk[VF610_CLK_PIT] =3D imx_clk_gate2("pit", "ipg_bus", CCM_CCGR1,
> CCM_CCGRx_CGn(7));
>=20
> --
> 2.39.5

