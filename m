Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011018.outbound.protection.outlook.com [52.101.70.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD8C39734E;
	Mon, 25 May 2026 06:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779690400; cv=fail; b=NilO9q7jMgpUcj9+FtWLM0libpP6A9JuMfn2uhqlS7VyNLe9i5IVZstMeJDHqFvXxuOInXKtVbSXG0qt3qoI0ZkwxI+vnoGQv0FxPryr1VxBFt411JZ+nLr+vgR9nEpJD9zvcnyjwV+p8eblzC1ryY3+XtSLHCJfUkN6DfkJAdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779690400; c=relaxed/simple;
	bh=ZgUfpWz+CPi/0kpF2WinY/VUkCSieWz2g/AhnnuBL3w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hvAGLjNJHKrAwGptJbXAehzuhwAnhQ03e0/ID6HKpJEjVQNh96G7sKMv98IG+pBxsMM3U4wL0JOVOoz9YkqNrgYwp/M6nSi4bbZaHAeSn9RT/BUEs6D4i1LWn2BH7CfFWRN38D5Odq+zjfUKu+wHPqlyHbTT41SVzkv2ohANAxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NL6Tik5h; arc=fail smtp.client-ip=52.101.70.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NL6Tik5h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W1ltQ91YDStNU3VvR1r2vlEGJssaD+f1z4EVkslHdKHHGLpMo/RkB1DqembC6iqW0Nbmwnq5qAiYRUpQz8ONVwyE+LpvGHjcOgBabAIFGJZAtnu5lIdNC6kPODcDuIPSgODczJewMcuFy7iiJo+3PMYXX5ZyEYEO7GGdHTNGHQdqdymNjqekuCUKyQd6kUH8eaMPBBSLMiYOwLE2hPXfh+vSMphC2KPZVY08G3GdizlCueYhjeDejvvUpFI9D/rBdFfQK3ueW1ozimYZDUYrlDwE56A81y8spjbMhXQI3L7NOq64d4ecqBUCQKNscC0KcrvoiNGlEWSx27Y77wxLdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZgUfpWz+CPi/0kpF2WinY/VUkCSieWz2g/AhnnuBL3w=;
 b=Rxr675/ROCAVba3554C4CUTIIOTqphm3jIIrcxnUwGZuN49F6wuEpIVHPf8vTvQtcRz1kv/NeiFq1G0fWW2Zlsgr2M4mgLI/CVprYefaafj9ybAYAx261IxU/R8QK7NKJmQL34Q6EwnTGpY7VxPAS6Z6FPn8ywJzWDDXd7IEITPfu2O1zSdhcdzFWuSNoLmrBFMqbYT3F6d9IWHLQUau5MSyLp4zJfsdvfIziWR6NkG2V8nUtMfvtY2bkfmtMJUXDi1a2I6KJRnLRNy3DM8yUS4qgy8DuiyTmgqLuy86f/JkWdX3Wz/FYz8ZOf5XJ662farbD/unalM6LmaH1uAkCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZgUfpWz+CPi/0kpF2WinY/VUkCSieWz2g/AhnnuBL3w=;
 b=NL6Tik5h9nK3RWl+XJA9lUK1h4O2WEw7Lrwh8LaGHQuxNrLAtqM409sMAjQ6t7paXbmmAOskjdBpF3NCpYDFeA0iuZA5hS8rxk4NgiW44eS+F2gXO43QbweewSgtV3s2tgxUBZOuUexWGlBczJJyAxc8405oXNfcnxgF0Wy8+CQ3RghZ1WvGqh2nbes/d234paGJrAxqqmXxPHSMbkFFTGeOafpc/m8PN5WiUog6WdD04onY3qImPxkm39J2sBo/gopL1D8lpM9kMcEgqkqK8D+uwX1ybXSYFwf0YIM6L6Z6Cj4AkTBguU4Qn9Wih3gw6HM5Q7GPVD60RuCmf3BkEQ==
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by OSMPR04MB11293.eurprd04.prod.outlook.com (2603:10a6:e10:93::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 06:26:27 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9870.023; Mon, 25 May 2026
 06:26:27 +0000
From: "Chancel Liu (OSS)" <chancel.liu@oss.nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Frank Li <frank.li@nxp.com>
CC: "Chancel Liu (OSS)" <chancel.liu@oss.nxp.com>, Chancel Liu
	<chancel.liu@nxp.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: RE: [PATCH 2/5] dt-bindings: connector: Add fsl,io-connector binding
Thread-Topic: [PATCH 2/5] dt-bindings: connector: Add fsl,io-connector binding
Thread-Index: AQHc7A9qL2xwafhBR02bpeFjSD/5CQ==
Date: Mon, 25 May 2026 06:26:26 +0000
Message-ID:
 <AM9PR04MB835333895276201A81251210E30A2@AM9PR04MB8353.eurprd04.prod.outlook.com>
References: <20260509024846.2094049-1-chancel.liu@nxp.com>
 <20260509024846.2094049-3-chancel.liu@nxp.com>
 <20260515-resourceful-singing-roadrunner-ce25ec@quoll>
 <AM9PR04MB8353FE81D06852D45514E460E3032@AM9PR04MB8353.eurprd04.prod.outlook.com>
 <d2b13e51-1684-4acb-a5ed-294c8aa95906@kernel.org>
 <AM9PR04MB83538C4A07A6835FF8A74793E3002@AM9PR04MB8353.eurprd04.prod.outlook.com>
 <20260519-macho-degu-from-nibiru-960af2@quoll>
 <AM9PR04MB8353B563519EBC1AD6C5BFE1E3012@AM9PR04MB8353.eurprd04.prod.outlook.com>
 <e23a610f-e1ad-4536-80fb-8b5707e77f39@kernel.org>
 <ag3GMdmxw60B15Oe@lizhi-Precision-Tower-5810>
 <74eb56fb-546d-4b2c-9bbc-01a40937f5d3@kernel.org>
In-Reply-To: <74eb56fb-546d-4b2c-9bbc-01a40937f5d3@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8353:EE_|OSMPR04MB11293:EE_
x-ms-office365-filtering-correlation-id: e53911eb-9bad-4139-240e-08deba268d10
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|376014|18002099003|22082099003|56012099003|38070700021|6133799003|11063799006|3023799007|4143699003;
x-microsoft-antispam-message-info:
 pDmsqxAhVhhN72h9aPqiF/1kJE0n5EX6jrE3MQYrk/3IUZpbSsAoPjalU8ArxfJ4LLGhimk9aSqeHn/68EyWre3yAf68X9uoGX6NVO2RYYBmQlid6rwJF3h1+kefeP97OXt76+asd2LMMtSpm/PYtQeG1MRmn/1P1GE/BfErgPl3iHLxX4DQgLtbHQ1pwp+Vv8UZ9nMS4XLTcI5SYdiXyYkedc5bw4mfkyK/6JmzR5BD14sJ/kPV5EW08kGA7kJyoj7exJrD6ma/SwhKTg8FRlVinTo2XZTQIFSqZ4PdPjWfwRSrg7eweoTX/fx5AIdUqalLsBApehOGvN/iwTmsaP0W48YFNDM0rKGPmklkM9x8qQZkYt9xa9ry4HboU3kxxn1Fqsum4dgbuA7vFbQCk/xg5SwCdcDJH1Rt1EAIzojCdP1BbY4lDlLoKolFSOXR9Xvo2nxPjmiKpjELQmcAynG4ZtfFp6XiVYDLQMWGP+VuFXpHo5OIXCPy0HMnEPEUVsmfprWd6aGrTRsMJBw6cDvy4xVK3luhLGidrSypbSQlhqHSep/3BtENIMWRsyTqKMvxDZU0DnHOPGYvQpYtLEqTT3RmhrTqXScNh/36na+heF7BJgiLiH5WEW1TgnhLSuTpf9Wb5soXtozybijO5jQ1nw+FY896BBwAVeOEmH1SDEANzGP9Ro/WrKJFMf6FxYdjo29BVbRMRIJ39vLrlFCambW2f0CnTzcRWGX7d+A6ygoDREYRomVlsMBHVkrz
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(376014)(18002099003)(22082099003)(56012099003)(38070700021)(6133799003)(11063799006)(3023799007)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QitTM0p5Y2VRaGpDdGRjaW94Z1Y1ekhTZWJHU0JjT2gxMzJvM0N4Yk9iVWFL?=
 =?utf-8?B?Qy9hL1d6MmlSK1o5aGZUNEZna3lBZ0lQRlNCNHU3Z3JGR0U3TmdaQVZsamRE?=
 =?utf-8?B?ckZ3UnN2Tm5tdEFtRlo4YlpmV29oc2wvRWhKc0tpVGUxTmtPTS9PcWM3TXgz?=
 =?utf-8?B?SCtTUCs3dktSUDJZM1lWTk9RZitwc2twSXB2WjRMekRhUDVISTkvalhqVDVW?=
 =?utf-8?B?YklXR2YzLzV3TzdLM1gveFBteENvbmM1ZXRaeWkvZ0N4WmJtUmNJQXVxblRi?=
 =?utf-8?B?aGxQK1pwOUN3alBGZERuQWYxYVpsT004VEt2a0xYcTgxbkYyM0RHYzdYS2xt?=
 =?utf-8?B?L084aVNwVlRxVFVDenh5SGk2ZGRKa2s1ZSs3T2RCWDJhYjN4b0ZwYzZ3eURu?=
 =?utf-8?B?cXU5REpyNElYK1I2WHZoM0tnUXFPS1pmNWFIOExXcmZ1bFNBTjgrT3p0UWRQ?=
 =?utf-8?B?ZmlOOWlweXlvMk1wS1REaVpmeDltMFUyVXJZYmxHTDNwQm9kM0Q1NnVObE9F?=
 =?utf-8?B?OHVyeEFORHRUM0pLRmsvc2xBRkdIS0JQUWt4bHBvV0QxQVoxemE2ZHZLdVN6?=
 =?utf-8?B?Z2hZQnlPWVFQNDhtd1lJei9xQnJETFYvQ2x3ckVtQXMzYm5rZGNXVGtENnM5?=
 =?utf-8?B?WElod0V4RDRYN0NyeGtaVGFUeUtEb3p2RGpWMU9iVVZwLytncTA0VENFVzRS?=
 =?utf-8?B?TmFBS25WL1ppM25mVWdsdFpNV2tidHJvam04TWY4MFR0RHB0R3V1OWtKU3VY?=
 =?utf-8?B?MGdaK2Qzci9iRXI5SDR1TTR3eU1WRWJoclVjYk0xM3VwNm9XR0FnK3IxaDMx?=
 =?utf-8?B?emxnUVF4cjZjclpINGRQdXQ5eGxFcXdWcWoydXZ5blJ1MVVuajdGOUcvcW5D?=
 =?utf-8?B?dGlVYXBCR2JNZFVRQ1VZUEpabTlxRVRwQkNYM1d2aVhUQncxMVA1eWw4eVJ0?=
 =?utf-8?B?elI3Nm9IN0RBSWNocXMxcis0cmJwZ2c4MjZYWGo3ejUzQlorTGpwYlF0RDJ5?=
 =?utf-8?B?N2ZtNFZ2QnZiRXBOWFNrZDJheUdsQ1BVZElGRFJxNFQzUmswcDc5cFFRQXBy?=
 =?utf-8?B?K2JEamRkOGNhRW1JbnY0NC9JaTFKVmFDQ0VMektnc2Z5UjlVd2c3bzlOVlBP?=
 =?utf-8?B?MTZ1QXBSWVBoMmFuaDVLQjlDVVA0Zjc0MkRvU0ZCemFqZDBZNmF4YUtqK1pB?=
 =?utf-8?B?S0lJOUNscFJwQkF4SnhaTFVENHI2QndVTGhFR2JaL2xUN1ZKaDdRL2VuKzIy?=
 =?utf-8?B?c01CMHZrRkVDQmRxZFphUDhBSGp2TGI4K1FTVU45ZUZNamFWK1FwWTZLQ0NX?=
 =?utf-8?B?K3pKR2drNzVaUXlBU2p0R1Jic2FlQUJIakdseTdTbzhiME1ycEVRb1N2RE40?=
 =?utf-8?B?bXliSm1ROGwxNTJsMC9VYnZreTV5LzgyL0tlQU1FQU5QRU9FSy8wK2J2bjVk?=
 =?utf-8?B?V0hBU2I4ZjlLNjV6TzQ2L01WU1JwRUNSRlZRZllNYUJFOTZORG54UTIrdVdm?=
 =?utf-8?B?R0lmL3lUdjdQYWZzYThVRXg0clhMbEthTFBOeHEzamw0aXFBb2IzNmZ5NFVh?=
 =?utf-8?B?Y05jUVhyS3JxUEN3UEkwQ3Z3WW9OTFpEUEx4Z3MrbWJaLzBnMVd4VENqOFJU?=
 =?utf-8?B?eFd4Y0o0RHVaTkgvNXpTZ09CUjJzaDdOWVU1clZHTGJmZ0x2Vi8rMHh5YXkz?=
 =?utf-8?B?d1BvbDIvZjFPcFY4RUhURVJFcmsvaldNczhzc0trOW5KczdVVityaDZkU0wz?=
 =?utf-8?B?bDBrWnhvUURkZ0w5OEVxNCtzM2tKbjgrN1hhSkczMEFXMVFETkhEZzlsM2lY?=
 =?utf-8?B?aVFGN3IxbENVUnJSa1lPcE92RHo4KzRzQ2lwUnlRa0plb0c4M3FXbHBlZVRQ?=
 =?utf-8?B?dFdvVUNndlhDYXBiRXhFZzJkRzd4aitRVnlwcFR4RUxXekc3OGsza3VaZTk1?=
 =?utf-8?B?S0hZS0JUZW5BSnpqVXJxSUVoWjVOWExpT3B6S1UvSzkrZEgxN2xNSkFCcGhY?=
 =?utf-8?B?L3hsMWZrbEtNbmJqUUZndlpic2swalhvektMbTBBMk5sTGNNOE96NG5PdzFI?=
 =?utf-8?B?eUtPRCtyMEgvRWYyeWE1elFwY2pkVFVtZUt0eTRKVHhaZ0hZc1hlZnRCOGVl?=
 =?utf-8?B?UHdNTDZDRzlrNExpVElGVWthYkhsU2p3czJhU1NMOG5ZbU91RDd1Tzdjbm1w?=
 =?utf-8?B?U21wTXFvUjhuM0tPSElGQWlKZXZ6UWJRN0N0eHluNVUzMFpNV1pTWUZZN2Zm?=
 =?utf-8?B?b3BPRVkzWDFZcHg4VGIzc0JQZXpkSko2UFNoTTdXYTVsWmlWTEZQOE5jSXZC?=
 =?utf-8?Q?wN1sCDpoJGkMHOm7su?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e53911eb-9bad-4139-240e-08deba268d10
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2026 06:26:27.0810
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZDhNXqQtTyGxM2ELt0LkyR1QyoDdr3r/d35xx656saJ3gTsyyirOS5M3jCX5h9d7V/w1rjXQ/Fgzoj7FHJJsNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSMPR04MB11293

PiA+Pj4+Pj4+Pj4gK2Rlc2NyaXB0aW9uOg0KPiA+Pj4+Pj4+Pj4gKyAgVGhlIE5YUCBJL08gY29u
bmVjdG9yIHJlcHJlc2VudHMgYSBwaHlzaWNhbGx5IHByZXNlbnQgSS9PDQo+ID4+Pj4+Pj4+PiAr
Y29ubmVjdG9yIG9uIHRoZQ0KPiA+Pj4+Pj4+Pj4gKyAgYmFzZSBib2FyZC4gSXQgYWN0cyBhcyBh
IG5leHVzIHRoYXQgZXhwb3NlcyBhIGNvbnN0cmFpbmVkDQo+ID4+Pj4+Pj4+PiArc2V0DQo+ID4+
Pj4gb2YNCj4gPj4+Pj4+Pj4+ICtJL08NCj4gPj4+Pj4+Pj4+ICsgIHJlc291cmNlcywgc3VjaCBh
cyBHUElPcywgY2xvY2tzLCBQV01zIGFuZCBpbnRlcnJ1cHRzLA0KPiA+Pj4+Pj4+Pj4gK3Rocm91
Z2ggZml4ZWQNCj4gPj4+Pj4+Pj4+ICsgIGVsZWN0cmljYWwgd2lyaW5nLiBBbGwgYWN0dWFsIGhh
cmR3YXJlIHByb3ZpZGVycyByZXNpZGUgb24NCj4gPj4+Pj4+Pj4+ICt0aGUNCj4gPj4+PiBiYXNl
DQo+ID4+Pj4+PiBib2FyZC4NCj4gPj4+Pj4+Pj4+ICsgIFRoZSBjb25uZWN0b3Igbm9kZSBvbmx5
IGRlZmluZXMgaW5kZXgtYmFzZWQgbWFwcGluZ3MgdG8NCj4gPj4+Pj4+Pj4+ICsgdGhvc2UNCj4g
Pj4+Pj4+Pj4gcHJvdmlkZXJzLg0KPiA+Pj4+Pj4+Pj4gKw0KPiA+Pj4+Pj4+Pj4gK3Byb3BlcnRp
ZXM6DQo+ID4+Pj4+Pj4+PiArICBjb21wYXRpYmxlOg0KPiA+Pj4+Pj4+Pj4gKyAgICBjb25zdDog
ZnNsLGlvLWNvbm5lY3Rvcg0KPiA+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+PiBFdmVyeXRoaW5nIGlzIElP
LiBFdmVyeXRoaW5nIGlzIGNvbm5lY3Rvciwgc28geW91ciBjb21wYXRpYmxlDQo+ID4+Pj4+Pj4+
IGRvZXMgbm90IG1hdGNoIHJlcXVpcmVtZW50cyBmcm9tIHdyaXRpbmcgYmluZGluZ3MuDQo+ID4+
Pj4+Pj4+DQo+ID4+Pj4+Pj4NCj4gPj4+Pj4+PiBZZXMsIHRoaXMgY29tcGF0aWJsZSBpcyB0b28g
Z2VuZXJpYy4gSSB3aWxsIHJlbmFtZSB0aGUNCj4gPj4+Pj4+PiBjb21wYXRpYmxlIHRvIGZzbCxh
dWQtaW8tY29ubmVjdG9yLg0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IGF1ZCBpcyBub3QgbXVjaCBiZXR0
ZXIuIFdoaWNoIGJvYXJkcyBoYXZlIGl0PyBXaGF0J3MgdGhlIHBpbm91dD8NCj4gPj4+PiBXaGF0
J3MNCj4gPj4+Pj4+IHN0YW5kYXJkPyBJcyBpdCBkZXNjcmliZWQgYW55d2hlcmU/IElmIHNvLCBw
cm92aWRlIHJlZmVyZW5jZSB0bw0KPiA+Pj4+IHNwZWMvZG9jcy4NCj4gPj4+Pj4+DQo+ID4+Pj4+
DQo+ID4+Pj4+IFRoaXMgaXMgbm90IGFuIGluZHVzdHJ5IHN0YW5kYXJkIGVsZWN0cmljYWwgaW50
ZXJmYWNlLiBUaGlzDQo+ID4+Pj4+IGNvbm5lY3Rvcg0KPiA+Pj4+DQo+ID4+Pj4gVGhlbiBpZiB5
b3UgZG8gbm90IGhhdmUgc3RhbmRhcmQsIHRoZW4geW91IGhhdmUgYm9hcmQgc3BlY2lmaWMNCj4g
Pj4+PiBsYXlvdXRzIHRodXMgeW91IG5lZWQgYm9hcmQtc3BlY2lmaWMgY29tcGF0aWJsZXMuIFlv
dSBjYW4gdXNlDQo+ID4+Pj4gZmFsbGJhY2tzLiBHZW5lcmljIGZhbGxiYWNrIGNvdWxkIHdvcmss
IGJ1dCBib3RoIGlvLWNvbm5lY3RvciBhbmQNCj4gPj4+PiBhdWQtaW8tY29ubmVjdG9yIGFyZSBq
dXN0IHRvbyBnZW5lcmljLiBFdmVyeSBjb25uZWN0b3IgaXMNCj4gPj4+PiAiY29ubmVjdG9yIiBh
bmQgImlvIiwgdGh1cyBhYnNvbHV0ZWx5IGFueXRoaW5nIGNhbiBiZQ0KPiA+Pj4+ICJpby1jb25u
ZWN0b3IiLiAiYXVkIiBpbXByb3ZlcyBpdCBvbmx5IGEgYml0LCB0aHVzIGhvbmVzdGx5IEkgd291
bGQNCj4gZ28gd2l0aCBib2FyZCBzcGVjaWZpYyBmYWxsYmFjayBhcyB3ZWxsLg0KPiA+Pj4+DQo+
ID4+Pg0KPiA+Pj4gSG93IGFib3V0IGJvYXJkIHNwZWNpZmljICsgY29tbW9uIGZhbGxiYWNrIGNv
bXBhdGlibGUgbGlrZSB0aGlzOg0KPiA+Pj4gICBjb21wYXRpYmxlOg0KPiA+Pj4gICAgIGl0ZW1z
Og0KPiA+Pj4gICAgICAgLSBlbnVtOg0KPiA+Pj4gICAgICAgICAgIC0gZnNsLGlteDk1LTE5eDE5
LWV2ay1hdWQtaW8tY29ubmVjdG9yDQo+ID4+PiAgICAgICAgICAgLSBmc2wsaW14OTUyLWV2ay1h
dWQtaW8tY29ubmVjdG9yDQo+ID4+PiAgICAgICAtIGNvbnN0OiBmc2wsaW14LWF1ZC1pby1jb25u
ZWN0b3IgU2luY2UgdGhlIGRhdWdodGVyIGJvYXJkIGlzDQo+ID4+PiBuYW1lZCDigJxJTVgtQVVE
LUlP4oCdIGluIHB1YmxpY2x5IGF2YWlsYWJsZQ0KPiA+Pg0KPiA+PiBJIGRvbid0IHRoaW5rIGl0
IGlzIG5hbWVkIGxpa2UgdGhhdC4NCj4gPj4NCj4gPj4gZ2l0IGdyZXAgLWkgaW14LWF1ZC1pbw0K
PiA+Pg0KPiA+Pj4gZG9jdW1lbnRhdGlvbiwgY29tbW9uIGNvbXBhdGlibGUgY2xlYXJseSBpbmRp
Y2F0ZXMgdGhhdCB0aGlzDQo+ID4+PiBjb25uZWN0b3IgaXMgaW50ZW5kZWQgZm9yIHRoYXQuDQo+
ID4+Pg0KPiA+Pj4gQWxzbywgSSB3YW50IHRvIHRhbGsgYWJvdXQgdGhlIHRvcGljIG9mIGdlbmVy
aWMgY29ubmVjdG9yLiBJdCdzIGENCj4gPj4+IGNvbW1vbiBkZXNpZ24gdGhhdCBkYXVnaHRlciBi
b2FyZCBpcyBjb25uZWN0ZWQgdG8gYmFzZSBib2FyZCB0aHJvdWdoDQo+ID4+PiBhIGNvbm5lY3Rv
ci4gVGhpcyBjb25uZWN0b3IgbW9yZSBvZnRlbiBhY3RzIGFzIGEgbmV4dXMgdGhhdCBleHBvc2Vz
DQo+ID4+PiBhIGNvbnN0cmFpbmVkIHN1YnNldCBvZiBHUElPLCBjbG9jaywgUFdNIGFuZCBpbnRl
cnJ1cHQgcmVzb3VyY2VzIHRvDQo+ID4+PiB0aGUgZGF1Z2h0ZXIgYm9hcmQuIENhbiB3ZSBkb2N1
bWVudCB0aGlzIGtpbmQgb2YgY29ubmVjdG9yIGFzIGENCj4gPj4+IGdlbmVyaWMgYmluZGluZz8N
Cj4gPj4NCj4gPj4gU28gdGhpcyBiaW5kaW5nIGlzIHRoZSBjb25uZWN0b3IgYmV0d2VlbiBjYXJy
aWVyIGFuZCBzb21lIGFkZG9uPyBUaGVuDQo+ID4+IHlvdSBkb24ndCBnZXQgYSBjb21wYXRpYmxl
IGZvciB0aGF0IGF0IGFsbCwgYmVjYXVzZSBpdCBpcyBub3QNCj4gPj4gbmVjZXNzYXJ5LCBub3Qg
dXNlZnVsIGFuZCBORVZFUiB1c2VkLiBEbyB5b3Ugc2VlIHNvY2tldCBMR0EgImNvbm5lY3RvciIN
Cj4gYmluZGluZ3M/IE5vLg0KPiA+DQo+ID4gTm90IGV4YWN0bHkuIEFueSBjb25uZWN0b3IgY29u
bmVjdHMgYSBjYXJyaWVyIGJvYXJkIHdpdGggYW4gYWRkLW9uDQo+IGJvYXJkLg0KPiA+IFRoZSBr
ZXkgcG9pbnQgaGVyZSBpcyB0aGF0IHRoaXMgY29ubmVjdG9yIHR5cGUgaXMgcmV1c2VkIGFjcm9z
cw0KPiA+IGRpZmZlcmVudCBib2FyZHMsIGV2ZW4gdGhvdWdoIGl0IGlzIG5vdCBhbiBpbmR1c3Ry
eS1zdGFuZGFyZA0KPiA+IGNvbm5lY3Rvci4gQm90aCB0aGUgc2lnbmFsIGRlZmluaXRpb25zIGFu
ZCB0aGUgbWVjaGFuaWNhbCBsYXlvdXQgYXJlDQo+IGRlZmluZWQuDQo+ID4NCj4gPiBUaGUgc2Ft
ZSBhZGQtb24gYm9hcmRzIGNhbiB0aGVyZWZvcmUgYmUgcmV1c2VkIGFjcm9zcyBkaWZmZXJlbnQg
YmFzZQ0KPiA+IGJvYXJkcyB0aGF0IHVzZSB0aGlzIHR5cGUgb2YgY29ubmVjdG9yLg0KPiA+DQo+
ID4gVGhlcmUgYXJlIGFsc28gR1BJTyBtYXBwaW5ncyBpbnZvbHZlZC4gRm9yIGV4YW1wbGUsIHBp
biAxIG9uIHRoZQ0KPiA+IGNvbm5lY3RvciBtYXkgcmVwcmVzZW50IHJlc2V0LWdwaW9zLCBidXQg
aXQgY291bGQgYmUgY29ubmVjdGVkIHRvDQo+ID4gR1BJTzAgb24gYm9hcmQgQSBhbmQgR1BJTzEg
b24gYm9hcmQgQi4NCj4gPg0KPiA+IFdpdGhvdXQgYSBjb25uZWN0b3IgZGVmaW5pdGlvbiBsYXll
ciwgdGhpcyB3b3VsZCBjcmVhdGUgYW4gTiDDlyBNDQo+ID4gY29tYmluYXRpb24gcHJvYmxlbS4g
VGhlIE5leHVzIG5vZGUgZGlzY3Vzc2lvbiBhbHJlYWR5IGNvdmVyZWQgdGhpcw0KPiB0b3BpYzoN
Cj4gPiBodHRwczovL29zc2V1MjAyNS5zY2hlZC5jb20vZXZlbnQvMjVWcncNCj4gPg0KPiA+IEFu
IExHQSBzb2NrZXQgaXMgYSBDUFUgc29ja2V0LCB3aGVyZSB0aGUgc2lnbmFscyBhcmUgY29tcGxl
dGVseQ0KPiA+IHRyYW5zcGFyZW50IHRvIHNvZnR3YXJlLCBzbyBpdCBpcyBub3QgYSBnb29kIGNv
bXBhcmlzb24uIEEgUENJZSBNLjINCj4gPiBLZXktTS9FIGNvbm5lY3RvciB3b3VsZCBiZSBhIG1v
cmUgYXBwcm9wcmlhdGUgY29tcGFyaXNvbi4NCj4gPg0KPiANCj4gU28gdGhlIHRlcm1pbm9sb2d5
IG9mIGRhdWdodGVyIGFuZCBjYXJyaWVyIGJvYXJkcyB3YXMgY29uZnVzaW5nLiBJZiB0aGlzDQo+
IGlzIGEgaGF0LCBtZXp6YW5pbmUgb3Igb3RoZXIgYWRkb24sIGl0J3MgZmluZS4NCj4gDQoNClRo
ZSBJTVgtQVVELUlPIGlzIGFuIGFkZC1vbiBib2FyZCB0aGF0IGF0dGFjaGVzIHRvIHRoZSBiYXNl
IGJvYXJkLiBUbw0KbWFrZSBpdCBjbGVhcmVyLCBJIHdpbGwgcmVwbGFjZSAiZGF1Z2h0ZXIgYm9h
cmQiIHdpdGggImFkZC1vbiBib2FyZCINCnRocm91Z2hvdXQgZGVzY3JpcHRpb25zLg0KDQo+IEkg
c3RpbGwgaW5zaXN0IG9uIGJvYXJkIHNwZWNpZmljIGNvbXBhdGlibGVzIC0gZmFsbGJhY2sgYW5k
IHNwZWNpZmljLg0KPiANCg0KVGhlIGJhc2UgYm9hcmQgaGFzIGEgc2xvdCBjb21wb25lbnQgdGhh
dCBpcyBtZWNoYW5pY2FsbHkgY29tcGF0aWJsZQ0Kd2l0aCBhIFBDSWUgeDggY29ubmVjdG9yLiBI
b3dldmVyLCBpdCBjYXJyaWVzIG5vIFBDSWUgc2lnbmFscyBhbmQgdGhlDQpwaW5zIGFyZSByZXB1
cnBvc2VkIHRvIGNhcnJ5IGZpeGVkIGJvYXJkLWxldmVsIGF1ZGlvIEkvTyByZWxhdGVkDQpzaWdu
YWxzLg0KDQpJIHRoaW5rIHdlIGNhbiBuYW1lIGEgY29tcGF0aWJsZSByZWZsZWN0cyBhIHN0YW5k
YXJkIG1lY2hhbmljYWwgZm9ybQ0KZmFjdG9yLg0KRm9yIHRoZSBjb21wYXRpYmxlcyAoc3BlY2lm
aWMgKyBmYWxsYmFjaykgSSBwcm9wb3NlOg0KLSBlbnVtOg0KICAgIC0gZnNsLGlteDk1LTE5eDE5
LWV2ay1hdWQtaW8tcGNpZS14OC1zbG90IA0KICAgIC0gZnNsLGlteDk1Mi1ldmstYXVkLWlvLXBj
aWUteDgtc2xvdA0KLSBjb25zdDogZnNsLGF1ZC1pby1wY2llLXg4LXNsb3QNCg0KSSB1bmRlcnN0
YW5kIHRoZSBjb25jZXJuIGFib3V0IGltcGx5aW5nIFBDSWUgZnVuY3Rpb25hbGl0eS4gSW4gdGhl
DQpiaW5kaW5nIEkgd2lsbCBleHBsaWNpdGx5IHN0YXRlIHRoYXQgdGhpcyBpcyBhIHJlcHVycG9z
ZWQgbWVjaGFuaWNhbA0KZm9ybSBmYWN0b3Igb25seSwgd2l0aCBubyBQQ0llIHByb3RvY29sIHBy
ZXNlbnQuDQoNCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0KUmVnYXJkcywgDQpDaGFu
Y2VsIExpdQ0K
