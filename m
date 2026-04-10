Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011025.outbound.protection.outlook.com [40.107.130.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC351A5B8A;
	Fri, 10 Apr 2026 04:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775795718; cv=fail; b=Bbk9SA52T5xosKTJl4Ur1mAgr2WBUNX0utQf06b6C8LN4LKJUf7foADszlGqLbC9YKB5SdfPDwKBgLNAqi0QO7JD1dzIRNKoi4nwWFkZmxKg/bn7CgrawSMN4UqfM5wKn7raAGodxbRF94xVAnQRG+o8e3RMadAM++q2U8v6PYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775795718; c=relaxed/simple;
	bh=gPtcU0tdjwkI7Oi76nLZRda3lVgg/M15sIbQcUYTH7I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=k/29mfpyoy8I1RnomQxslL1GsZ2I12svPVYH9PuDIRQrMAVRCecelQP/FGp3ELM4bRtn34IPwxbMEy1wWbW3jyId9w7eCwx0yU0cXwDTlxQ9bLB7eikxrXyOTnVCDWudpv8mHkPLPSzAqR85jATR4UKTuuwiH/U1vClPr0b0jxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MGyTm7ug; arc=fail smtp.client-ip=40.107.130.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MGyTm7ug"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r0aqO37C47f1/1jjABRKyxTP++jnbhagw+wrX+yxmwECVquG+u73fc16shIHxFwljYuPEY7kktaVYNmCD3QRSGmb/V3eJCA1UQQqoP+Lsb8aoyDKV7Va0ODdhco6p+D5PumamUIEt6plcxPfiubjL/4G1NQQPdqAMn+eOsyBrKfRQB8Ok2Xquyw6TY5wJa4L0KWVJcCMCWoIbFE2Yczbp4VyVMCMNdJG5W38W9TpRG/0SInFq8FvMMEfHF7tERbdkzSsmtn4dewdcFIr0pxa0UphSUNMAOAD3EbSfBG1d2FHy1xPIJWsUz6vyG0FIeq2uHkNN50W2bJrbOUU8jiwmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gPtcU0tdjwkI7Oi76nLZRda3lVgg/M15sIbQcUYTH7I=;
 b=DA1avcuwsl0NVyoiPde8Y+cEEwjsf+e7nEyxETL3PMLR1QdJiqZLVshnpDL861IlbPoUcyTvFCUeR1EL3O2wxigyEm40Ndu7U2dNbDEzPU3LhOyC3AqrcFvyyv/Ehqd/MYrWmdDEnH/A3URNaGuGbOZGex+NkkDGCEk1DH5UcANi9ZRQrNx45ytymRqiibImQtQvpmwBOBsqJ0KZvel5FtaPARDwFiB1aUHrqcO6evxnpfGDcSF3SxifAhOKg5h5mEBOB0ZbH0FO5jziysubzpB8WUePRlt5VAdhBEnSLFHGMHs5L3YP9EG6HJpO/oq5WwfE6mA+Uie9CuU06TxDhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPtcU0tdjwkI7Oi76nLZRda3lVgg/M15sIbQcUYTH7I=;
 b=MGyTm7ugmQ6K5SrwDQicHUT0HQ8Tqtc5MuQyz1OXCKWz+60EpBeVFOJ8t4AEYcT2Oz7sobascu+cW6pq3aBJrCT3xsMYtd4kFViRmo83/pMANNNfPA6ZyFmo22i9tN+LX8dypjdfoyJgMNHvI5olq9Y0Cwl0URAWlDSTDjWZ63YuzCIqbZAtATnzNmmGmL9LKwLrOnlrbgzQMTKPQunBxc5VSAzhY5OlX9xmZ1rCzrZuYFXweJnI0fTRwSKaVF7nX2UeB3Y47il5iVWZnVaAgSpo0YEF6Fx0R7/v4KzGozSseEOJOwbvwqeIP8DsyYdCdJqUIOTqGeVHc2DvEeRQ9A==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AMBPR04MB12207.eurprd04.prod.outlook.com (2603:10a6:20b:75b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 10 Apr
 2026 04:35:14 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Fri, 10 Apr 2026
 04:35:14 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Hongxing Zhu <hongxing.zhu@nxp.com>, "abelvesa@kernel.org"
	<abelvesa@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>, Frank Li <frank.li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "imx@nxp.com"
	<imx@nxp.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>
Subject: RE: [PATCH v1] clk: imx95-blk-ctl: Add func_out_en clock for i.MX9x
 PCIe
Thread-Topic: [PATCH v1] clk: imx95-blk-ctl: Add func_out_en clock for i.MX9x
 PCIe
Thread-Index: AQHcyJhTB9fYU+1lS0mqTMDZtSZhA7XXtSBA
Date: Fri, 10 Apr 2026 04:35:13 +0000
Message-ID:
 <PAXPR04MB8459C5F6CD0A8A18BBFA306488592@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20260410031656.2578632-1-hongxing.zhu@nxp.com>
In-Reply-To: <20260410031656.2578632-1-hongxing.zhu@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AMBPR04MB12207:EE_
x-ms-office365-filtering-correlation-id: d6274b86-4216-4984-293d-08de96ba8f0e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 pqtzO9hy2p5LkJzyUdLaXNS1y1cbt2G0aVGiFCjmMZaAI/iWkuLbX0RtYQM6WzOt1ZP8gdwyPKZh3wzQzRfwGYFobrhu3AQw5W9HtSCnrP996ASE16MGoulcJGqPeb3lCC8xTLxgwL2YbSl/F/R00XB4RFFj6oElHqTJGGWZCtYvsj9ZOg8PxvAKbXwGiF5eA/V27ciQZ4XE0rY0VhSQFyke/mEvX0k1eeARdK4I7FtySvULknjIIKxvLHp++IkIRki8mLPKZVaPLpLxRJrAPfvNkG2QyhvaBikAeD+tkp8yDrgHbx67lIUL+EKQDWYs79tK83vlZG2PKFTZGk8jv0T+L2+kpO+wBks/qEPZOuWiVQuZop5rWWAOwtiCKWNpK5WLinyBEbOurC326WHmsHxF8q++8rXH7Zn+V1dTLXAa5OyVya5Xu84NMV/M7rxD4TSmIU2msYm0gfUrSa+GqCpiEwbZtlCNQ+YB3vlH4XtQidB6UaGsC0kp5BwveSZYv5fNj7fonvto86hfPwEXyHum46vuXgl0wqeCy9ld8H5UwTh1zC25rpbXliXPCIWCQvGKUUOO4GtW9nm548KWb4I5firH+DyPbI0c+gz8y+pZb1g3Gby9It/MEEuu0cO19ewjFsjUmFcDB0/fII09g0l2Q2zT1d4vDH+pnWnxy78kNNb9+SKCZ2SyToE47BukUjIT2+Tvgl5bAHUCtJVZtVO4cSPmr42ol6u5bAbUVXqsq47hTHrF2rOlChlsMV145rfUKXwFNgUgbgJAI2WbC21hih7eelLgExLcTVsxUuo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?F03aIPagTaJkz3DHkS0zsKbIW6UJFNBfagDsjmTfF68Cqd2Hy1QlgbfE0fX9?=
 =?us-ascii?Q?x4G0U5149twVdJswWQrc4s7I0mKTFcA32Zz2yOlkqU8Oda8hf5RhdHaSHuyA?=
 =?us-ascii?Q?l7jbIHpQSO5uPbvJCx9ZRgz/B9fxDU9196aiy0u0kMJp3YFIJ+EbU+54Seb0?=
 =?us-ascii?Q?rAP6SIAhD8yMghRJrM4L4I4so3xmdiDjbS0bZTNaZrfEVGewBaAyXsAgkmkI?=
 =?us-ascii?Q?6Kmntxy86MEVGXAaAvjr9spx0m30HtIEjijkem3Nee/3E0bmvBrESULOBydV?=
 =?us-ascii?Q?htwV8Yu+42LW0abzutjtxBD0pXHgswCCNaky+yN74TA+m3EhdYj80IKXlwrV?=
 =?us-ascii?Q?suZLCKe2RyQJLafLZ0rxsZNnVYWEngIEP8d9R7vd9T67d5ZGL9VVaeGPtWzQ?=
 =?us-ascii?Q?Vr+JTfcltEsIkrV314fyQSGqQ/Q2e2tsi6qTU6iEhAp4mY4ujn3Lpj1LRxtc?=
 =?us-ascii?Q?2/+d2/aInKYK5KzBwfu6a+QtZHAvKhFK0EFwcaS6/dFHMfebtrwquwB97wq4?=
 =?us-ascii?Q?gvsuFMGS2T0QJ/q+roiFokOFUtKDLFL/Cm6H/yQURePRsAsbZm6mvTQfCqPw?=
 =?us-ascii?Q?ba/0d3htWdmWEpeDu10IFNOs6HlCp4V66uGi8MmOTuOJPsZchzIe03y8QQI4?=
 =?us-ascii?Q?cUW1brKfPqksxin/SwVtncMPEcSJeZwweT8BZK9Yn1nWBr2a9IvmmOU8Klvc?=
 =?us-ascii?Q?5bpZU3Iugr8fayhRu33Ixyo07lBcR7At9U85I7sMuqX53p3gFUfoJxAJ1TwD?=
 =?us-ascii?Q?djS6aerv6WwR5YVfiE4TgzyLCYefJK2r5L49L0jTVNXtUHei/dFJRUfArPQL?=
 =?us-ascii?Q?3pYxMuMKqNcjtoHhpbQ8wqoUm4oWCtH/IS3bWvwG/2EiPDioFxbWfsd7si29?=
 =?us-ascii?Q?79r6+V/Us+16YImJwHefCU7Qqig7UenCbCRXCHklI+5hzsFAbJZ++x09esOj?=
 =?us-ascii?Q?MzCLvmbFS8qZgzB3NbUoT3HA7pZ+74Vu4qH/hxjWFpLPVv4K+Sp4z9Fb4zGo?=
 =?us-ascii?Q?eiWzlQ26OT1CqKZ65+neHLngvlJOjT9O5HDGnaeZ5ZBC6ngH9dL2hErfcFSB?=
 =?us-ascii?Q?fnO8U+AOTuXBFJ8eaI/D7LXcIuAzZMkHboWwh968PY8D6nwoKXqR5tV1Z+VX?=
 =?us-ascii?Q?vk3BYl5KRhQxfJL8ibW617fj/HDuwKisvC/Zp1OmP5hJlASrpPy3Ure4ijfW?=
 =?us-ascii?Q?bztfJZPDZOfwoedwtG41N2adJT2ejPLq65wKDetg0QoEwZl4ZipCZub2I36b?=
 =?us-ascii?Q?gSJ7oaFoNa+TsBejbNglgZayscBcOQeS77C7TAtPNP5Bg5UjSGISMwtE7HSL?=
 =?us-ascii?Q?aI7zVLkhdO/2Mlo0UR5oxECMDOujpfMqnqQAQCPnn7rcTzMhXZgHapf6EKD2?=
 =?us-ascii?Q?Csrq7nrwtjgO7fQu3OYYslS/e/lyHqmk0KWd7SE0MBt6tJUQv6ku59RDnOp0?=
 =?us-ascii?Q?rIrgg00fMZ8kBeVcVYEovpaVdE22tfpndOXr91j9HhMePLT/nzRRskwSxjwn?=
 =?us-ascii?Q?5Cl3C29HkCqYK0Va7QuPMoomQyHxU61iWrrYX5PZgEqielgk3xTB22k1v+Sl?=
 =?us-ascii?Q?OL00DbgWdiQD8EzRZ//WDKAyYXmsPqYLLoqql3b1xJagxtNq41N9n7umzDVm?=
 =?us-ascii?Q?hQEHPMXXS69jUsBadGPuwifwFfHoKYkNStE6evYNkcXW4FuvMpvzHiqhqbCk?=
 =?us-ascii?Q?t9lDrvxSniJMgfkmQJg8VAOKhtNr8dhYf8UJMCkFwZdfGdoA?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d6274b86-4216-4984-293d-08de96ba8f0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2026 04:35:14.0704
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nCPxzSLQ6iHvghZUnQ7izxyRp5Zwf9p1g0vbxINpJpD1akGU4Cvdkksr066nLSFRjjLWNwPKhzYSegXd9LfS1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12207

> Subject: [PATCH v1] clk: imx95-blk-ctl: Add func_out_en clock for
> i.MX9x PCIe
>=20
> When internal PLL clock is used as PCIe REF clock, the BIT6(CREF_EN)
> and
> BIT2(FUNC_OUTPUT_EN) control the PCIE_REF_OUT_CLK.
>=20
> If the default value of BIT6(CREF_EN)&BIT2(FUNC_OUTPUT_EN) is 1b'1.
> With the typical 100-ohm termination on the board, this results in
> approximately 6mA of power consumption.
>=20
> When PCIe internal PLL clock is not enabled, these two bits should be
> cleared to 1b'0 to eliminate this power consumption.
>=20
> Add a func_out_en clock for i.MX9x PCIe to serve as the parent gate
> clock of the CREF_EN (BIT6) gate clock. Both of these two gate clocks
> enable the output of the internal 100MHz differential reference clock.
>=20
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
