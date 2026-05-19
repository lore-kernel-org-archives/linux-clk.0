Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011020.outbound.protection.outlook.com [52.101.70.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC41332637;
	Tue, 19 May 2026 02:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779159390; cv=fail; b=fI5yIzcCtxIo60+OmWDWPzww+im6JeuRZtd1S/MvYv5+j1I9iQlW5EcPR+Jutk3ngBsQJ8LmK1FKoixFa2OooMonEcjLG04M6En7KvU8gsrprinbhSEyRyeBRQNtUTa/ch04H1LcDbQumB6lHKfNjENc16F9phPdHY5EnrTtjLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779159390; c=relaxed/simple;
	bh=KQkS0frqjZKUIbV5Kzk+4CmnljKwV/YJkEEtXWlf7iQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=F1jTf9ktF7fMHEKpe3wbSV+S0x4A5PTQcW4YBIw1+Gy1dnHyhpj1OoCA9vrDfH6mxILcbx8x4GGVYx++AWUSnXB00d1oTo85eLeDBwvoP09yV2TXqXiOq5okKeZa2/XXtXvrJi6XE4WJSk6y1pzVr/aJZAmMZ3RPHDNAJL32ctM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HRx7+HU0; arc=fail smtp.client-ip=52.101.70.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HRx7+HU0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bzG17UL6KRjj+fnsO0REr+v3hiTJIBVhGoVTBCwNMAJKdPgXJXZMXt0KiMCGEylEjDbVUMAo6jV1LvYviub7ecsagQZ1FZgjHEVO45pyQHuETH4Ly0blhP78XzQrabu8Vz7b3eelVoDepzbyWQ/IG5jE5DWOyo8l/tMF9OnaHjDa4ph55sddK4gENbpEItzacTGMlyk9Vf6UWcD3E0jLIfwj7my0lmptcVIdv0y22jbyZs6/aX6ES5aYAlNaUL616PUZvd4fyFDQTJsp7v/eKyNzlq1HmZQ5qqVY+MGrLlBXzFVzS4vZDrg4gwMV5Amw6EOTiEqihK+ANivB8SSKvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QsID7ws4fVr+aLcNw3M5NI70HA1odCS1dpeAYMn6EKo=;
 b=d3xjpAyDMUw6lKAlbIqh0vI+s4ndz2uen6CI3LbkseXo6UdtTjDdhnhpSnz/FGaPW44IxYVCultUsDLedS6JcGkaIn+iYoBOgsTNnD/Gdede19/eWSHCIZO2rPETdrCo+0AC/hbOqzMnnaOIt7UY54JjfW6IdMcEQYnDzB0mwGWD+BzEiRgFxgSecGdimn9aTNc6e/Bf+x8vCvqF2WkHlgv8Rd8ypV4pd7rxvijCWT+tayLNPXfRfyiQSPcaY9skNw7LVr1qXbr5CydqIZXPkzFzMwu/pPSAYmW3DUjlBI1UESZq/Ofr3H5RHhFFM9bjfVng/S1r9WREape01910Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QsID7ws4fVr+aLcNw3M5NI70HA1odCS1dpeAYMn6EKo=;
 b=HRx7+HU041RN/8Ca/bx8x8LK0Ro8KgSKf4cfn9JHaoOMf1z0l2+SIz7kT9iQwM5r0ECJVGgnPit/3iWXjv8kNebkagKr8e9wOQeNhLY8zdqOHb/Xk66o6r5WVv95vM+Bg70j/m/Zs/2To1Hsqbjie7gi8zMKiBhbDsZCjSsQKcPVN52rjCJml/0owJBc1SZ+3nb3zUHwIQN++LlHwGpkGBykZlaemAKC3tSAcSrFp6kjgarQHsDjxlo3vy2N4aLStTaWT28bqflct5FxiRc25opk3XSqsJ1EndtdQbenHg/lgAmpJafkBbCX56t7jLQHkqP8/uKb5P2oEOCx1RI/iw==
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by GV2PR04MB12213.eurprd04.prod.outlook.com (2603:10a6:150:336::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.13; Tue, 19 May
 2026 02:56:25 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9870.023; Tue, 19 May 2026
 02:56:24 +0000
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
	<linux-clk@vger.kernel.org>, "Chancel Liu (OSS)" <chancel.liu@oss.nxp.com>
Subject: RE: Re: [PATCH 2/5] dt-bindings: connector: Add fsl,io-connector
 binding
Thread-Topic: Re: [PATCH 2/5] dt-bindings: connector: Add fsl,io-connector
 binding
Thread-Index: AQHc5zsU/NqCypptskSrs2h09QI2ww==
Date: Tue, 19 May 2026 02:56:24 +0000
Message-ID:
 <AM9PR04MB83538C4A07A6835FF8A74793E3002@AM9PR04MB8353.eurprd04.prod.outlook.com>
References: <20260509024846.2094049-1-chancel.liu@nxp.com>
 <20260509024846.2094049-3-chancel.liu@nxp.com>
 <20260515-resourceful-singing-roadrunner-ce25ec@quoll>
 <AM9PR04MB8353FE81D06852D45514E460E3032@AM9PR04MB8353.eurprd04.prod.outlook.com>
 <d2b13e51-1684-4acb-a5ed-294c8aa95906@kernel.org>
In-Reply-To: <d2b13e51-1684-4acb-a5ed-294c8aa95906@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8353:EE_|GV2PR04MB12213:EE_
x-ms-office365-filtering-correlation-id: 4673c762-e119-4e9a-6229-08deb5523713
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|7416014|376014|1800799024|366016|4143699003|11063799003|38070700021|3023799003|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 01mQgD10AGm89Rv0pOUqku1YlFLrbFIQFePnoCQf8TS7vM1BcRaB20FRk+gXDSQHxxk/DKMqio25FCQSaY3uQP2ixpNk4T613kqIOWmDQiKFDumRNo3qdmPC9rmJeAhKRxFldU4lG2FkDpGBJPNr/BpdKG4GMMWHQfBOdlARZvlmG7ZhI95UgFTvtaFTMAr1xSL/79E6HJ0PioX2KbvuyulAPZ+HH4ACeeVL0fhfxBMmaIQHmKyPyYtgda13Xdgr5WiBapH2uOVoiCwLwYNMDhA9hYhu1Vj7XeDdHbbLyzk2jL+RMpFWYKuBkNaEHAQ0+coRyU1p7o6NxvRooB5FZLOhWwr1iZ6U4LfI8X03XUpvAWg17ETmhkx6ndTfUfDjCOABqJBXaJjUXnnyf5GOvx5EScBnSAOaS130mRVpMjYBVskvYh7DSzcWJPYEJu8hCryZLIHEdDErspTPwCmQ++tIRCsdxy8nVURKPLssyLRBvsTV8N/SSz5lhGdkx/ldUzIQaCBMLI4cCZKg/sB5jvYUNBzGioQKVh9X6ZUi2SJBx1B9oMM+HIElEDGRULMOYYZOFHCzpndzOGFltndTJEAHs7UHDD/sq2ieqhs421zYQCeCDtNwxu57+6JFwGIp31oJcpqtaL8Pf2mQfVy1/toHB5auH/mahVTI5eSRMrkk9642em0F9ThaW0TMYk/fh4XD9NYQQ63FTbiVEmfqew==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(1800799024)(366016)(4143699003)(11063799003)(38070700021)(3023799003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?NThqckpDczJxRnQvdmlTNERPT0t1Uko5L0UxZjRPa09VdGQ5anh3dWkz?=
 =?iso-2022-jp?B?VUN5cmVQcm8zUHJzcGhEenI0MWlubzc5SEp2YXZCeE5SQnJhWlk3Qm1E?=
 =?iso-2022-jp?B?VGY5bTUzOXBoMnYwT3VXa08reEpMWjhIbVNnYkhyamRnMHNkUkptN2lu?=
 =?iso-2022-jp?B?QU4zb3BWbUl6akQrTFJJcWZRRG9mY0laeGVWOE13c1dJRGE3dS8xUW5W?=
 =?iso-2022-jp?B?VmN4eEZxbW1GUWsvc2E1YUE3YkhvQzgvV0pGT0pnVFZPQ2VDR1llUlhS?=
 =?iso-2022-jp?B?QS9qMjhJYjJFbnFqM0JxSFk1eTl0VUJzdkhNNzh1QlRMa2hwcGZLWHlK?=
 =?iso-2022-jp?B?ZFJ1V1NMaHFaWENPQXpOcHU4SmsyMXczZ3NvVktLaFNmV2p2UHh1RkRD?=
 =?iso-2022-jp?B?SGZrZXM4aUNGOE5IWEdpa1kySllqZGx5ZFF6Z0lMNHN6OGhCQzhFVWNC?=
 =?iso-2022-jp?B?amNZbDVZeDl1c29JMnBGbHY5Qk5JZEtiSkpkV2FqYTVGV3JIZm1TbExM?=
 =?iso-2022-jp?B?NFlHcXI1MVpGS29vT1ZmNmpJK0ZkNzZJU0RpdHNYTlZQVFA2dHAwZDhu?=
 =?iso-2022-jp?B?U0Vrd1RXSHA0NFZKWVRPeGdXMDdYak9qeDNlUEsxOFBWb0NwU1FqckRX?=
 =?iso-2022-jp?B?NWdjejNmTmljbjZ5NUlzTityR1RERUxLVUgyYTc5cnc1bVBqMTUyUml1?=
 =?iso-2022-jp?B?Y3ZBWC9aR21idHZHNHJpcDNxdVhCZXNmLzEwWHFkK1NrRktrb3d3bkdT?=
 =?iso-2022-jp?B?anBMeDVFRGFJYURXektiZ0FhU2FGZHpzRVJRU00wNlJ1N3lZRzJhV2Nj?=
 =?iso-2022-jp?B?aURwSU1nT0RwTlBKVlpteEkvYzNMSExlM3pQZlRXWG5ZQUNrSGVjSEUz?=
 =?iso-2022-jp?B?WE5SQkdRL1VJeWptY3dqWjMzQm9yZ3cvajh0bGpJVjB1OFVsb1owL2VV?=
 =?iso-2022-jp?B?eEpMUFNiWXp6RFBScE1GZVZLQmhkOWJ4aDNmaWhKa29sZTMzMDFzZUFB?=
 =?iso-2022-jp?B?UDVsakVrZlpuNnExODJ5QkJoQW56bUhvZ2s5UjByTWtyNWNyT3U0R3N6?=
 =?iso-2022-jp?B?TzhFblpFUmdEejNwVFRqc25Ua083NWRucStyejh1UWdpaUJ6V04yNTJP?=
 =?iso-2022-jp?B?d3NrVjVNN2tjQk1xV1hsNkdGcnRYQS9GSGJ1a21RK2hMeFUvd29xdWtx?=
 =?iso-2022-jp?B?cVN0dzZ5bXRhbzZvTk5vRy9JYlBSOE42alROYk5RWWRJdVJFd1pKSUpy?=
 =?iso-2022-jp?B?MkVWdlJpWUtpaXRtL2haVVNHSmNXL1N5bDhLdzlJQnA3eGIyNldCSG5H?=
 =?iso-2022-jp?B?RE9HcnFZRmM4UWszM2E3SUo3WkV5Z0JuNldCVjY4UEhPcnQ3UEdNL3VY?=
 =?iso-2022-jp?B?dTB1VnJzM1RRL3djU1dGVTZ2OFc5NTVCZkhZbjNIVjNJR080b1UwVVRu?=
 =?iso-2022-jp?B?UFRCaDB3L1o3a3pIeDdJL3kwdGhIZjV3ZjByOWU2VDI1cVdzMy9kWFdO?=
 =?iso-2022-jp?B?VlFLc1h4cjJPRmVjQWZ2cVJsRkVKdGsyNk55ZzBuaGRDYUlLV3h6alV2?=
 =?iso-2022-jp?B?ek5QVXd1Tno1a29xakdmT0c1b0dhUWEvTmpCcHl0UzZrSGhSVnU0RGpF?=
 =?iso-2022-jp?B?SllBQ09iT2NNb1BXV09XYmNrVHd0MzJ3SzJTbFFwL2wyQVN0bTBLTXBV?=
 =?iso-2022-jp?B?WUtlR0RTUE1BZWxNNkhjOU5hdW13TS9veHlMRnhvYmRCWEFKbjFkdWVw?=
 =?iso-2022-jp?B?WFR6amIydWYxNkFQSmFjZ2RxVkt5Z0M1TjZrNWZHU1VDYUtJWk1pNGdn?=
 =?iso-2022-jp?B?bVhlaDA3aTNNa1VvODQ1VHpvNWswelBRVnFDQXY4VGZxK25YNXB5OHhH?=
 =?iso-2022-jp?B?cjdQbWxRVEFyYnRWaGhhTG83cU5hc2wyWmFSR0xnTlcvdVNnZmNmcGhZ?=
 =?iso-2022-jp?B?VGROY2NrcGVkNUhoMFRqc0xOdzhycyt2U2lDN2toSnI0Q2FWYmFVQThJ?=
 =?iso-2022-jp?B?U3Y1b3dGY1ZtbGJybUdsTlpWUkRIcWwzY0Vsd0tkR1JINC9iT1QvZTdo?=
 =?iso-2022-jp?B?bExSSVVMU1NqQjVJbC9saDYyMkJUUkMvRW9LakEyWng2WFlHMzhqUWMv?=
 =?iso-2022-jp?B?b242amQ2NDFpNEcxNzc2Y2V1b3dZRSt0dmIvdjJhaktQcHczOFBoQUdL?=
 =?iso-2022-jp?B?VysxekVEaCtGRTFvcHpFNmVCMk1rMnlVcWdYMkdiYmZ5NHJkTkt2V0dG?=
 =?iso-2022-jp?B?eFJaVGZkVzZBMFE0TG8xNFdrZS9ZNzZ3YXJTTE5kVlVzekY4S0JraTR5?=
 =?iso-2022-jp?B?VjJqK0tjZnJxQ3d4b2RFb2RwTVlJbDVsd3RQNEgyeUNnOWRLeER1MW4x?=
 =?iso-2022-jp?B?TGEyWnhXOG04b0tYS1lpMnpuVDFFMUF1UStwWUd3eEdTaFY2cHc5M3Z4?=
 =?iso-2022-jp?B?citHZzVuOEV6VnN6cVhRcDNXZXFLazU2VTJxMDFMaHJpYW1mSzFiOHQ3?=
 =?iso-2022-jp?B?ODkrQ0lP?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4673c762-e119-4e9a-6229-08deb5523713
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2026 02:56:24.9107
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g+LwTJK1bnW40quUZkIWU5mPj6MqFLOcCsdo4sMX4lbX+X6/eSCmxzyUkfZij2CSrFf6WsjWkdl/rH+5HUDeoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12213

> >>> +description:
> >>> +  The NXP I/O connector represents a physically present I/O
> >>> +connector on the
> >>> +  base board. It acts as a nexus that exposes a constrained set of
> >>> +I/O
> >>> +  resources, such as GPIOs, clocks, PWMs and interrupts, through
> >>> +fixed
> >>> +  electrical wiring. All actual hardware providers reside on the bas=
e
> board.
> >>> +  The connector node only defines index-based mappings to those
> >> providers.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    const: fsl,io-connector
> >>
> >> Everything is IO. Everything is connector, so your compatible does
> >> not match requirements from writing bindings.
> >>
> >
> > Yes, this compatible is too generic. I will rename the compatible to
> > fsl,aud-io-connector.
>=20
> aud is not much better. Which boards have it? What's the pinout? What's
> standard? Is it described anywhere? If so, provide reference to spec/docs=
.
>

This is not an industry standard electrical interface. This connector
is present on i.MX95-19x19-EVK and i.MX952-EVK. For example, the
"i.MX 95 19mm x 19mm Evaluation Kit" homepage[1] publicly documents an
audio board connection through which IMX-AUD-IO card is connected. The
detailed user manual (UM12022) is listed as official documentation[2],
but it is behind an NXP login, so it is not suitable as a public
reference for upstream. Therefore I list it here to illustrate it's
mechanism:

+-----------------------------+                     =20
|        Base Board           |                     =20
|   +-----+      +---------+  |           +---------+
|   | SPI +------+         |  |           |         |
|   +-----+      |         |  | GPIO MAP  |         |
|                |         +--|-----------+         |
|   +-----+      |         |  |           |         |
|   | I2C +------+         |  |           |         |
|   +-----+      |         |  | CLOCK MAP |  AUD-IO |
|                |connector+--|-----------+   CARD  |
|   +-----+      |         |  |           |         |
|   | I2S +------+         |  |           |         |
|   +-----+      |         |  |           |         |
|                |         |  | INT MAP   |         |
|   +-----+      |         +--|-----------+         |
|   | I/O +------+         |  |           |         |
|   +-----+      +---------+  |           +---------+
+-----------------------------+                     =20

[1]https://www.nxp.com/design/design-center/development-boards-and-designs/=
IMX95LPD5EVK-19
[2]https://docs.nxp.com/bundle/UM12022/page/topics/pcie_interface1.html

> >
> >>> +
> >>> +  gpio-controller: true
> >>> +
> >>> +  '#gpio-cells':
> >>> +    const: 2
> >>> +
> >>> +  gpio-map:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> >>
> >> You do not need to redefine the types. You need constraints, though.
> >>
> >
> > OK. I will add proper constraints.
> >
> >>> +
> >>> +  gpio-map-mask:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> >>> +
> >>> +  gpio-map-pass-thru:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> >>> +
> >>> +  '#clock-cells':
> >>> +    const: 1
> >>> +
> >>> +  clock-map:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> >>> +
> >>> +  clock-map-mask:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> >>> +
> >>> +  clock-map-pass-thru:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> >>
> >> I do not see these defined anywhere. I also checked cover letter for
> >> references for pulls to dtschema.
> >>
> >
> > Nexus nodes are already in the device-tree specification=1B$B!'=1B(B
> > https://github.com/devicetree-org/devicetree-specification/blob/v0.4/so=
urce/chapter2-devicetree-basics.rst#nexus-nodes-and-specifier-mapping
> > For reference, current kernel has supported it:
> > * Nexus OF support:
> > commit bd6f2fd5a1d5 ("of: Support parsing phandle argument lists
> > through a nexus node")
> > * GPIO adoption:
> > commit c11e6f0f04db ("gpio: Support gpio nexus dt bindings")
> > * PWM adoption:
> > commit e71e46a6f19c ("pwm: Add support for pwm nexus dt bindings")
> > Clock adoption is ongoing:
> > https://lore.kernel.org/all/20260327-schneider-v7-0-rc1-crypto-v1-10-5e=
6ff7853994@bootlin.com/
>
> DT spec only mentions nexuses, but it is only a spec. Each property from
> the spec must be defined in dtschema or kernel bindings.
>=20
> I do not see any dependency mentioned in the cover letter, so how do you
> think we can figure out where is this definition of clock nexus?
>=20
>=20

I initially tried to add support for clock nexus dt bindings in patch 1,
but I noticed there is already an ongoing series doing the same thing.
([PATCH 10/16] clk: Add support for clock nexus dt bindings). Since that
work is in progress, I think it's better not duplicate it here.

I think we can add a dedicated binding defining the clock nexus
properties(#clock-cells, clock-map, clock-map-mask, clock-map-pass-thru),
in reference of existing pwm-nexus-node.yaml.

In the next revision I will also update the cover letter to explicitly
mention that clock nexus support is ongoing.

> Best regards,
> Krzysztof

Regards,=20
Chancel Liu
