Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.63
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795524149;
	b=q0sOeeuEkuPYLvR0y/PiNTrJJ3XllxJNgumYigmRqEXsVKm7Qy9UZEo1dNQWN8RIW98W
	 7FaqpX1l9Z+I3YlGVrcMAybszO+BN2xaKvI0muOmr8431z3FC9FlO5CFo4+wRjXodoKAs
	 4sHIPI0qo3FTnBcXgloPC9VWMLCo8rRYRMfcr+dLlqYQSPSKMgGG6o7boJ4kLFHWVDcft
	 fgNMjejyYNopPtC/ghXzTthhbBbGtVacAIXtW6xml9VVferpRnYZ1zOHbpBWATK7jjP4C
	 82W8gBxYQa3awBzneqFMUNLcUvip7c7FVptNj2KvPa9KfaIH/iUOWrb3uzOGvutRRbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795524149;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-atpmessageproperties:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=rZEa+qzX9rH7XLp5CAOA5jvimRKqEbt245rn53R4Ofc=;
	b=s1B0ci6/ESuCEUQonU76f+SpNqjd+XbwzhmV6SnBiGPemwGCeBo2auINGjEMYaGdkJx1
	 adokVzrEpVSxhYLfFHakjS4i1tcK6STmmjCykSnbcwJsbRYsbtBVWNG9Nvy4xE9QSjM5w
	 JqHwaiYBY3vjqN3sbzb9ysUW+5tieyvjTZa0DXBz8GVAt1mcbuemeQUn3oInSd5CfhHhm
	 QCZ8pHl7X1NE/jN0M4OBKU1YeYQy1XdK7+QSNOglsLhp59Arfp8eF9sEN8KZJwUlp3vIJ
	 Cl21kw0QAE1Pod4Y6z71HCE9hrkcTRRr5/J+DKJxjF274cm2LrkPd1chP2JMnbgw+vg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=einfochips.com;
	spf=pass smtp.mailfrom=einfochips.com;
	dkim=pass header.d=einfochips.com header.i=@einfochips.com header.a=rsa-sha256 header.s=selector1 header.b=YQgHF0s2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.63
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010063.outbound.protection.outlook.com [52.101.61.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AB7606A32A
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 12:42:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52AB7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=einfochips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=einfochips.com header.i=@einfochips.com header.a=rsa-sha256 header.s=selector1 header.b=YQgHF0s2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vQI8xmZ3DYSn/ugcaEpSY5deOZSKeELpl2KbdsBpy1XABWs9Uf7g3EaLTsP4WbSGml3IlvQn3Ep363Ij6cMzUFboG3r911/xVscoHzg1X8civJwtkfTt9ghvpCVs9c02VCRLGFxS63mGd6iGipWBh6ixL0npO80H0kbzUHCDfyGdIev2GGWytUv1dM3rhp0B46sUSZ/PdEDKYW0o+ItaKlz7C9lDpj0jLHJ+/lbQUFxZlyjk8yyJFT6aLtPXF4O6d+fIUU/8rtEFYmzUh+gyg/tKdoaSubXrIayD0rjAPJiXCryy1aCttIWsg6xm5HycWqQnO+fingeeqIw7Mdqppg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rZEa+qzX9rH7XLp5CAOA5jvimRKqEbt245rn53R4Ofc=;
 b=movMS4qHgPy/b+ky+f29IDeXWC8lBNWvHrbvakDBzY351kIYszlpU80HD+3PXhgZWzM59CvhSWuPJinwHFPEnU/Txvl2jbQLFeixVBrmVh+9lRliHB/5RZdSMgJqV+D3uRHsffnRZDe6ldPXkCMC4sHtFCGFPQVh5cM0I4ppuvnqyFIEjpdbW/te7KIe7dcbo0U5xpoWOT/F8p+tj+RvVwhbaVdyFHRzfr1sBJS25MdkGFDpH7i8efCet8VVYoQQ53KbtAjIx+VSMlPAQMM3DjCJmqvMCoDl6cca4bVm+kjOmvDYYX+B03UcUwMCkC4piMqSQ/7SKYiN93NLvo9l7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=einfochips.com; dmarc=pass action=none
 header.from=einfochips.com; dkim=pass header.d=einfochips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=einfochips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rZEa+qzX9rH7XLp5CAOA5jvimRKqEbt245rn53R4Ofc=;
 b=YQgHF0s2F2FYVe5cxPjjWqjjpQy0enj9W81DFrl8VgzsTMui2DUW6ENJLWMQht5lUW0E/qrmu7MSSfc2FOKAnjahUtykFFfjxXWVwevuZmizS44UWo4E0a2ECSfywEsG1tbVLCiRm447VYip029iMylewlPuRwKKJcGBQdnNizM=
Received: from BY5PR04MB7025.namprd04.prod.outlook.com (2603:10b6:a03:22f::17)
 by MN2PR04MB6991.namprd04.prod.outlook.com (2603:10b6:208:1e1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Tue, 24 Nov
 2026 12:41:42 +0000
Received: from BY5PR04MB7025.namprd04.prod.outlook.com
 ([fe80::97f1:60bb:2ae8:6f01]) by BY5PR04MB7025.namprd04.prod.outlook.com
 ([fe80::97f1:60bb:2ae8:6f01%4]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 12:41:42 +0000
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Xuyang Dong <dongxuyang@eswincomputing.com>, Mervyn Pretorius
	<mervynpretorius.oss@gmail.com>
CC: Yifeng Huang <huangyifeng@eswincomputing.com>, Stephen Boyd
	<sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Min Lin <linmin@eswincomputing.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: Re: clk: eswin: eic7700: EIC7702X hangs when disabling unused D2D/PVT
 gates
Thread-Topic: clk: eswin: eic7700: EIC7702X hangs when disabling unused
 D2D/PVT gates
Thread-Index: AQHdfBEniw+7uRn+bkCKUnyRkg4ltw==
Date: Tue, 24 Nov 2026 12:41:41 +0000
Message-ID:
 <BY5PR04MB70255D351C0220CFEAAEAAB983442@BY5PR04MB7025.namprd04.prod.outlook.com>
References: <20261122191830.2183513-1-mervynpretorius.oss@gmail.com>
 <5808e2e6.c22.1a2073e88d2.Coremail.dongxuyang@eswincomputing.com>
In-Reply-To: <5808e2e6.c22.1a2073e88d2.Coremail.dongxuyang@eswincomputing.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ActionId=f78cc870-a736-4e30-bf84-bede62cab7a2;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ContentBits=0;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Enabled=true;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Method=Standard;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Name=879e395e-e3b5-421f-8616-70a10f9451af;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SetDate=2026-11-24T12:39:04Z;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SiteId=0beb0c35-9cbb-4feb-99e5-589e415c7944;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Tag=10,
 3, 0, 1;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=einfochips.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR04MB7025:EE_|MN2PR04MB6991:EE_
x-ms-office365-filtering-correlation-id: a5d151bc-03c6-4db7-9fe6-08df4a284aa6
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|10067099003|5023799004|56012099006|261021135927099003|261102123227099003|261022075727099003|261022115727099003|261022113327099003|261026121527099003|261022105027099003|261021123027099003|261021130227099003|261021121427099003|261026135527099003|261028144727099003|261021133027099003|261026140227099003|11063799006|261026130827099003|4143699003|261009220027099003|261009223327099003|261009221727099003|18002099003|261009223027099003|261009221227099003|55112099003|22082099003|13003099007|3023799007|4133799003;
x-microsoft-antispam-message-info:
 cTq8vDaAaIuKd+ReBqgOKYP0qEwrT1RsFK+C6t0XzXSvU6HpjYS39me2rK/0EFiyx7N1kWngrRKlCsWrHShaiWpiPNtFyWbEVj5SSIhHQQbO1uYV/A9SxFL3EkvNjfmmaoZyKTJWK9DoThKXile7VoTY+Ht9BLHSnCbMSWZZXa3XoPn4SmROho7cWFTs1Z1PI5N3/iQsEhYv6tolg+fpADOtw+WW7PpXsI1OYV1DFrpjdMsBtEkbAlMoSztWgmZPWmgucKhgiNcHfZI7M7d6kWlRcTsf1L6h0pCHeqvZWErxBIHoo+/sJht50JniFhg/Ab7hmkfaVnSFjzUbP3t7x+Rc7Aqq/3jD94Q6KJ2wMbSII4tXmebqGNZFPC4fdhlOEQBR1wKyt7Wijwx/8qHQfwp7B5qdxtnK+gcL6CLW5RdOga1zc6V1w1rBpP7nfV0isKrCPlsvFZnfW889SWGORQf1ya1D0o4+dhQ51EwgYpNiXr7t0jE2jBFbb7dfb1Hnb6Dc7CdsDTn4wOXJBnIN1X9N2HFZg6TbuCz5zrK2uonlNkFYu70I3CqFxZyDLnQo4V5waTiH1w0zns1DyxzGCMd7QWI88q+NRH1qTenWz+Qh4f5ONrxMiUYOafR7detqgTSWtBpv3yaZWvaf3xua4nzMxfqW3PJg64mE5DZJaus=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR04MB7025.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(10067099003)(5023799004)(56012099006)(261021135927099003)(261102123227099003)(261022075727099003)(261022115727099003)(261022113327099003)(261026121527099003)(261022105027099003)(261021123027099003)(261021130227099003)(261021121427099003)(261026135527099003)(261028144727099003)(261021133027099003)(261026140227099003)(11063799006)(261026130827099003)(4143699003)(261009220027099003)(261009223327099003)(261009221727099003)(18002099003)(261009223027099003)(261009221227099003)(55112099003)(22082099003)(13003099007)(3023799007)(4133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-7?Q?Q5lDBt0G8+ZqT8qO7Nfi4C06BcKWc0GzV/5iJzk1XU4kdDJdkMqQ6Y+aPs?=
 =?iso-8859-7?Q?HRbCrgkm9LEBdBsRLTHcTPEfE7QDdtWW4WbgBj3uRW5uaNgwcXtNqJPjNN?=
 =?iso-8859-7?Q?e6nJau7NAxazzhW4fUP1zBpoSofrk+51Eq7fwr+Wxfa6K/6ZoIqJWZPwKU?=
 =?iso-8859-7?Q?MbXmD/FlNdnSa6vUVncbD+2K+/wiQFiZFi810+/+TxInyj9E3/NO2/lEMj?=
 =?iso-8859-7?Q?VXZXzgzNptTx8gnuFIAkvkwMykbOrOsGNjpwvO+ZYfeKSCvoyqIDREjTcB?=
 =?iso-8859-7?Q?9W4EwnnUjtMcIz4iVBNriAlR3mTrjWZwWwvb8qOQTaOq0MU8tmHLdRkJin?=
 =?iso-8859-7?Q?k8J3Ou1fAxz6x0br5oEc+8pGIdHfzwUNrFTt5pnjCubg6UmcUT/CUTOoGP?=
 =?iso-8859-7?Q?0WoR+iD6PJch3fkRIV90kOQgMhl/uFy2xGDQ9z3TTNt9xe0DFM66OMrKtI?=
 =?iso-8859-7?Q?NZGlGMRsxvUXN5NArxsKywdlE7tfNLk8wxIl/w5+lxzSc3ZlhJJ2DSkFp+?=
 =?iso-8859-7?Q?IQKxB7cm2lKv7SHxE6XcZFqIhGck9DCragWSaD/H7+wHBLAN5W8BLUUw1N?=
 =?iso-8859-7?Q?xATkXVGsXng1GZ/CyITnLK8lvl+qzqe2zj2PLRAbZk/iEjXLejKQNnmJnf?=
 =?iso-8859-7?Q?66bG3ZwTmQNY3wDccA1pESjNCK1uTDBCqzNLD9RggQJ29qMp9g55RJPaZ7?=
 =?iso-8859-7?Q?vQl7Opogk7i5VjCY5fWGH0Jh2cKzo+Fi8rt0PbPq8L6PZsAHTS+8ZP406S?=
 =?iso-8859-7?Q?9QbB299G7slR+zr1F+Wd5uZgh+ef0eCUWM2V5GmjTU4PEZGwaU9GmUFi58?=
 =?iso-8859-7?Q?sQIc5VYlpyl1Vw1QjroWM1JV7jCrbo48zJFrqyUHEqo2YamH/JyvSWxmfR?=
 =?iso-8859-7?Q?KgUPKpnSLuoaIxuKFEJreQK0ICwy882jNPoFDM12e6FdF6LqdNjQ64/KZY?=
 =?iso-8859-7?Q?J/vq0BdT9StaaymtnwfUwjkTJE1zZhl9IHVgRsnfHXOSXqDom/Vpwfq415?=
 =?iso-8859-7?Q?DIGX2Ut/YjCPmGrGc9AyBXfaTL4BQKr1kWGany823yyVaKkHwUrNjOIbmM?=
 =?iso-8859-7?Q?RUz024PgVo6A/viBNYcnyY2MCSxjgA+/iUnCtHJ6HzAHEaz/cVx9oyJPL1?=
 =?iso-8859-7?Q?zeHA64qJFz2r/eVrP1llJFry6rllaBrc+Dmp88Zlnd67h13sL4uxG+GBhI?=
 =?iso-8859-7?Q?c9NVT4abL9Rn7wOYjVZVj7LHxwVbaA+vU54BIysRcXtAOHB8xqfV2lp2L9?=
 =?iso-8859-7?Q?c+dhP/O3klSAWZEE2m9N8n6hS3xVD65HvOH+E0jDDQEDW+QLc1BYy80RM5?=
 =?iso-8859-7?Q?yB1bfGyou4IlKV5HJ+WXKwOXA16TOO4/QOX6+9v1qKWDpKLbeFphU9ykIv?=
 =?iso-8859-7?Q?zoNCpMS36zQhg1cO4Cw5ewG1PHL/m9Jmub4o9fSRe9gwbQsq+8WSG+lY2d?=
 =?iso-8859-7?Q?v+BkqE5cMC2Lz+hlQ0De05rkMys8gO9v8M6fE5swIYtAnDQk7AAA89lKsd?=
 =?iso-8859-7?Q?wJNf1WQi5SrwWfsLr5Pn4sRNPa64VHackBvFqKumZ/enDEOGHLvlI7JQcA?=
 =?iso-8859-7?Q?+XDrYbCYRt7LTgpi7P2UyCTNBUFxNh0OG8fpl6Tzb4kdylOyk3Ndmn3Ope?=
 =?iso-8859-7?Q?pGiOEdblBYxSu+GWhccDzYqe/8LE0cDPylki3fSKs4CQbynCttGAQfFRin?=
 =?iso-8859-7?Q?vNz9409vxs8svmtKhJEu2TlnXta4PNKGvBJvsciLQuokC4HYDn70Q56prK?=
 =?iso-8859-7?Q?Ntoe2Z529Wtapap5jc5abNpHjQQWBfQZhxIQWmDBriFqSst/u0Qql88YyH?=
 =?iso-8859-7?Q?VXlJejq3gDbMru/klk2v0ig9Mff3C0w=3D?=
Content-Type: text/plain; charset="iso-8859-7"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: einfochips.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB7025.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d151bc-03c6-4db7-9fe6-08df4a284aa6
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2026 12:41:42.0809
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0beb0c35-9cbb-4feb-99e5-589e415c7944
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O8NIw9wfz7pYqskx8HfBpYg2JFG1JsjfixX6xkAj0amnpTXxKBkbBPm3TIyRd+p7uUAeLV+l+AYOep0+ks+u8HOfOfz2PJOCdtKSThKs1OE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6991

Hi Xuyang Dong,

> >
> > On a DeepComputing FML13V03 board (ESWIN EIC7702X, i.e. two EIC7700X
> > dies, 32 GiB), mainline hangs during or shortly after
> > clk_disable_unused() unless clk_ignore_unused is given. Marking
> > gate_d2d_aclk (and, as a precaution, gate_lsp_pvt_pclk) as
> > CLK_IS_CRITICAL in drivers/clk/eswin/clk-eic7700.c fixes it here; I'd
> > like to know whether that is the right fix or whether something else
> > should claim these clocks.
> >
> > Setup:
> > - v7.4-rc3 (4843f6873f7c) + "riscv: eswin: eic7700: Add support for
> >   clocks, resets, pinctrl, HSP bus, I2C and watchdog" v5
> >
> (https://lore.k/
> ernel.org%2Fr%2F20261015125454.1381941-1-
> pinkesh.vaghela%40einfochips.com&data=3D05%7C02%7Cpinkesh.vaghela%40e
> infochips.com%7C9f6219599d3d4f295c1208df4930f49f%7C0beb0c359cbb4fe
> b99e5589e415c7944%7C1%7C0%7C639310146764444639%7CUnknown%7CT
> WFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXa
> W4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DpuM
> LCt0JpVLM4WJSQfDc4WJoL8FA6Rt%2BB%2BmfMJccjfk%3D&reserved=3D0)
> >   + a minimal local board dts: die 0 only (4 of the 8 harts, uart0,
> >   the firmware reserved-memory regions).
> > - defconfig + PINCTRL_EIC7700, DW_WATCHDOG, RISCV_SBI_V01.
> > - OpenSBI v1.3, U-Boot 2024.01, D2D firmware 1.51, GRUB (EFI). Under
> >   EFI the kernel takes RAM from the EFI memory map, so it also uses the
> >   second die's 16 GiB although the dts only describes die 0.
> > - Plain command line: earlycon=3Dsbi console=3DttyS0,115200n8 rdinit=3D=
/init
> >   (initramfs only). To find the clocks I used a local debug-only option
> >   that keeps named clocks on in clk_disable_unused_subtree() (not meant
> >   for merging); some of those boots also had keep_bootcon and
> >   trace_event=3Dclk:clk_disable tp_printk, called "traced" below.
> >
> > What I see on the serial console:
> >
> > - gate_d2d_aclk: every boot that disabled it failed to reach init: 1
> >   traced boot that left only this gate out of a larger kept set, 3
> >   plain boots that kept only gate_lsp_pvt_pclk on (2 with all 32 GiB,
> >   1 with mem=3D16G), and the stock boots with nothing kept (32 GiB and
> >   mem=3D16G). With 32 GiB the traced boot stops right at
> >   this gate. With mem=3D16G (Linux on die 0 RAM only) the boot stalls
> >   before init; ~21 s later RCU reports a stall, and CPU 2 then does not
> >   respond to the NMI ("After 10 seconds, these CPUS still haven't
> >   responded to the NMI: 2"). Keeping only this gate on, with every
> >   other unused gate disabled, boots to an initramfs shell with 32 GiB
> >   (2 boots) and with mem=3D16G (1 boot).
> >
> > - gate_lsp_pvt_pclk: intermittent. I have 10 boots that disabled it
> >   while gate_d2d_aclk stayed on. In 4 of the 7 traced ones (which make
> >   the disable pass much slower; 5 of the 7 were earlier mem=3D16G boots
> >   with other clocks kept on as well), the D2D firmware printed, within
> >   tens of milliseconds, the following (from one of them; colour codes
> >   removed, and the first line's "D2D NOTI" prefix was interleaved with
> >   kernel output):
> >
> >     D2D NOTICE: =C4T 60.691=B0C (prev 46.329, curr 107.020)
> >     D2D FAIL: T:107.020 sts:00000007 rx:00e60001 rx2:00e60001 [RX ERR
> > ALL|RX LOCAL LINKUP|RX REMOTE LINKUP]
> >
> >   and Linux hung. In the other 3 traced boots and in all 3 plain boots,
> >   disabling it caused no visible problem. I don't know why it is
> >   intermittent. A jump from 46 to 107 =B0C between two firmware samples
> >   looks like an invalid sensor read once this clock is off, but I
> >   can't see the firmware side.
> >
> > - With both gates marked CLK_IS_CRITICAL (diff below; no other change,
> >   no debug option, no clk_ignore_unused) and the plain command line,
> >   the board boots with all 32 GiB, and 92 previously enabled unused
> >   gates are disabled (113 unclaimed gates were on in a clk_ignore_unuse=
d
> >   boot; the 21 left on are the 19 flagged CLK_IGNORE_UNUSED plus these
> >   two). Writing and reading back 27 x 1 GiB in tmpfs (so the second
> >   die's RAM is in use) gives identical checksums, and reboot -f returns
> >   to the firmware.
> >
> > - gate_pvt0_clk and gate_pvt1_clk were disabled in all of the boots
> >   above that kept only one or both of the two gates, without preventing
> >   boot. I have not checked whether the PVT sensors still give live
> >   readings with them off.
> >
> > Not tested: single-die EIC7700X, suspend/poweroff, the second die's
> > harts, anything beyond an initramfs shell.
> >
> > Questions:
> > 1. Is CLK_IS_CRITICAL right for gate_d2d_aclk (at least on EIC7702X,
> >    where the D2D link is in use), and for gate_lsp_pvt_pclk? Or should
> >    DT consumers (a D2D node, the PVT node) claim them instead?
> > 2. Does the D2D firmware read the PVT sensor through gate_lsp_pvt_pclk,
> >    and are gate_pvt0_clk/gate_pvt1_clk needed for live readings?
> >
>
> Hi Mervyn and Pinkesh,
>
> Thanks for testing and for raising these questions about the EIC7702X.
>
> On question 1: for the EIC7702X (dual-die), gate_d2d_aclk should be marke=
d
> CLK_IGNORE_UNUSED/CLK_IS_CRITICAL. That clock needs to stay enabled in
> the dual-die case.
>
> On question 2: you can add a PVT node and let the PVT driver manage
> gate_lsp_pvt_pclk as well as gate_pvt0_clk/gate_pvt1_clk. The PVT driver =
is
> already in 7.4-rc3 (with compatible =3D "eswin,eic7700-pvt"), but the dts=
 in the
> [1] series does not include a PVT node.
>
> Pinkesh, could you check whether a PVT node should be added in the [1]
> series?

We are planning to add PVT node in separate patch series once [1] series ge=
ts
merged.
[1] https://lore.kernel.org/all/20261015125454.1381941-1-pinkesh.vaghela@ei=
nfochips.com/

Regards,
Pinkesh

>
> We haven't submitted dual-die support upstream yet. For dual-die support,
> you can refer to the patches below:
> https://github/
> .com%2FDC-DeepComputing%2FDC-linux%2Ftree%2Feic770x-v7.2-
> rc4&data=3D05%7C02%7Cpinkesh.vaghela%40einfochips.com%7C9f6219599d3d
> 4f295c1208df4930f49f%7C0beb0c359cbb4feb99e5589e415c7944%7C1%7C0%
> 7C639310146764474657%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGki
> OnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoy
> fQ%3D%3D%7C0%7C%7C%7C&sdata=3DAM0pvGSH%2FOJnUcF30RnTQ6kWBYX
> qdX1KkQtXtZyQajw%3D&reserved=3D0
>
> Thanks again for your work on this.
>
> [1]
> https://lore.k/
> ernel.org%2Fall%2F20261015125454.1381941-1-
> pinkesh.vaghela%40einfochips.com%2F&data=3D05%7C02%7Cpinkesh.vaghela%
> 40einfochips.com%7C9f6219599d3d4f295c1208df4930f49f%7C0beb0c359cbb
> 4feb99e5589e415c7944%7C1%7C0%7C639310146764496253%7CUnknown%7
> CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJ
> XaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D7a
> ubF9Jz%2BHXHAO2ZByp5YkUhYivHNsUZniA956OR8lQ%3D&reserved=3D0
>
> Best regards,
> Xuyang Dong
