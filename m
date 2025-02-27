Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010070.outbound.protection.outlook.com [52.101.229.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD111DDD1
	for <linux-clk@vger.kernel.org>; Thu, 27 Feb 2025 06:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740637486; cv=fail; b=P8rrGGEdvv6eAJThwY7+uaZACG1Gre74PtRWS9X/L0tQHDa9cjUoMJMvXT2Ua4gcx/tK7imTjKM/i5aYg61vCAKsC+yjumwCfEqiAua/bOcsnBSwA3w57oh5Q86k7Br/Rx5fF3Lg7Ijo1cftVvVKNoPnw4fF6nL6N0GzoiLumpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740637486; c=relaxed/simple;
	bh=KcIUFaRooUXvgduyaBMQ/H4uZvY9PdIu7VEHXQQYfTo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BcpphHWqjkUaVB+/IexrZhrLbTDF5OsAJvFZigi7rlJycJO0ZZxTLz3vikRleRuHVBIl4DEswpgPMThV4g6yfl6g1JUJXzliinG+cz/YTxrkL5cuvPWIWYq1VP481bgQWvbPAja5adRw39qteVJuU5xeBKl8QwR3U7JgYTxSj2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=lZ1KAhLk; arc=fail smtp.client-ip=52.101.229.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="lZ1KAhLk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=isKu7u4cGN0OD8rWDHBeUvHrt0F4xAISpdBDiALVvjOWUdmUh8E5ZXJQoFHf7cgRpkU/bIGWz/eNQm9gj4iuguyyXAhs1OkJtU2nC/6+y7MYOnnZHPs1ZZdtR2tqQ+nbJcvym7zNiyKZAfNV2oBkTdgjdZ1PMjrkiU5rINl97fTffoSPOXOUkyMCD0am6sq3UcwIxjD/iZMNRFUI/S54cdzfeoyZA5l/F/EI72j1QiL8+vsAaRdG4slnCBMcOyq0xrfe7rN5WYqqRMHrfLc0YZlf6VJYk7inYmSQ+bg3m0bGu6+adgdy4BOlVE6KE776Y33reVNuDy9fdZlxopl8UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KcIUFaRooUXvgduyaBMQ/H4uZvY9PdIu7VEHXQQYfTo=;
 b=qTIBRif1N0fFvHVSp6tW7p6+cvddKpF+Cv/PT/hXXTBL7JLr+sHPu67ph7MPGmEt7oMedwaR+BfdSb8BLCa+KeSDbIqN3mwft/CiywTp0pFFvJ2OJdn7NELYSguDuNBrlaWZIxz1yt+yrWscwbs/+ZxbjZOa5aKtY7+pc6e+sTz7iAoOq5ECOLS40RnIQAeDLqziX/DhSy1pII/O9ejR485FCDsht6s+LaVrqqMfqqGOeb25xzRLp+wbT8R0TBete/gfstR3qHNgt+gDW4JjaLIs1pJIQhLWJ29Sd8VFDDLagqkjgO3rCsps7hoYRBPf3ho+gbAyz1Yo+N8sXKrh1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KcIUFaRooUXvgduyaBMQ/H4uZvY9PdIu7VEHXQQYfTo=;
 b=lZ1KAhLke/sM2sDTCQrIxYqNWyTnesVW8UB779qMyXkZPSaJlbHKzLWkhShqZkE+/pV5Wpn7qGALRLlInR/8HLmVqB/J4B2sjg3vU3VOLG/W40QjDeFtxpV/hlqIfPosEGQmyF3U+Qc7i57E8WObXWl7eHIjzGg9/PBgHjQV03g=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB10242.jpnprd01.prod.outlook.com (2603:1096:400:1d4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Thu, 27 Feb
 2025 06:24:37 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 06:24:37 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Stephen Boyd <sboyd@kernel.org>, David Lechner <david@lechnology.com>,
	Michael Turquette <mturquette@baylibre.com>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, biju.das.au <biju.das.au@gmail.com>
Subject: RE: [PATCH] clk: davinci: Use of_get_available_child_by_name()
Thread-Topic: [PATCH] clk: davinci: Use of_get_available_child_by_name()
Thread-Index: AQHbdMPTRjI0hpq3/kSb99eeACxGcrNaaYcAgABtRhA=
Date: Thu, 27 Feb 2025 06:24:37 +0000
Message-ID:
 <TY3PR01MB11346E326D540668174C8C62886CD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250201161018.41084-1-biju.das.jz@bp.renesas.com>
 <76e67776d562acfc9e55500d512c4583.sboyd@kernel.org>
In-Reply-To: <76e67776d562acfc9e55500d512c4583.sboyd@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB10242:EE_
x-ms-office365-filtering-correlation-id: d704d6a6-9c77-4687-32fa-08dd56f76906
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TkF0ZnFyb0czRDFqcHhzTEFsc1R3eEMrSlRmbUxrRU5iWjFLRDIwRmludnhR?=
 =?utf-8?B?SFNYUU9TMGo3Nllmd01nMXI4bG5KQ0h0R0paTDFQMC9DSk1xS0NGZHhKR1RK?=
 =?utf-8?B?UDJxMUtDNFhsMk9hQU5qT1dyc0w5aEJYN2pUWE9HVzhqWHVuYkx5TlA5ZjdP?=
 =?utf-8?B?WWV6OFo4aDhwcTVPSHRsc2dSWGk4RE9HVFBiYXVZQU5FaXFuV1dZYVYydE1k?=
 =?utf-8?B?UzY2cTBGOWpBNnJYaDFOeXNpOUJ3TUVTUkxmN002UVoyazVlNERTTVRVb05I?=
 =?utf-8?B?K1hxMTZocWFQdWxMa2phNWlWL2pORkxOZG4rcVFUbnc4TWxPYlZxMFRlbXQ0?=
 =?utf-8?B?dnlnZEk2UlJxRmpDNU5nQU9CVjZCeUxoV0NTNWhpMGp3Qk8zSVdqRGpFeVJ5?=
 =?utf-8?B?ejM2eS9lZzhVQldOTzZXVmFIbk9Hbllqck5jdEZHOVYxV0lQdTRRSDFXaVFB?=
 =?utf-8?B?OG1mMlpmVi9VSkhhVGpWbmFuYm1hUDRyTGE2TUtQT0hRNGJDdnFQTklzdmNR?=
 =?utf-8?B?R0J5N0R3amlLM0h4QnV5RDRDL3JDZHdLVW9EV3lkQnlVMEFzWHozbVpJMzIv?=
 =?utf-8?B?bDB5MFQzK3l2NVlHU1dYdHoxaTcyOFhHbldCdC9GU1hOLy9YTDB0MW9CYlRn?=
 =?utf-8?B?dDRuOVdqVXFHUVRjWlNydys0SWNaODQ3Y2ZtZml0MHZlbC9STVdobWFnNVky?=
 =?utf-8?B?ZWdDcjBsUThneGlKSkpZbHlsVkdnRTY0eGVuMEZkRE92UnovQkJ5UUVuQkE1?=
 =?utf-8?B?R3FiT0RJNzdkZWsxM2JSQXIyckY2NjZxRkRMbWZGNkxJdncxWXNBR3VZVFV6?=
 =?utf-8?B?a1ZPcjgrdkVGWTBCT2JlMXNvM1JWWHliVEtqYWlMNVg2b1JIYVIyMmJsYmlU?=
 =?utf-8?B?TXNXQ0ZHK01tcUdnbHByT2tpaXM1a3J4QWs4Z3ZpWVowN1UxQ2k0MHFUUWxI?=
 =?utf-8?B?ZG5QVFEvT1NsaWZ4aXNMSnZGUWVGOGFuUENvNHFOTXhEakZDT3I1QTBYSEZD?=
 =?utf-8?B?ZGkvZXpvU3E5THlKZlZRMkYyM1loRVdsV2ViZytXdjBRTW5yZ3JJUzd6KzRt?=
 =?utf-8?B?akxhUVM3VWhhdkczMmRoVjU1NEpiNjRDM0l6eTJ1dktKTFZZTDFSL0xEMVJl?=
 =?utf-8?B?Y1VEMSswaVFhelNPdjQwL0NyZFhhNW9NSXpibjk0RWxPU0ROc2hrRk5aLzht?=
 =?utf-8?B?VVI1OE9BL2FBZTNOOUZHVXVCMURCYVBtVWEzRDNDMmdlMmdES20wSHlTTlBN?=
 =?utf-8?B?dm1yNzFITGEzKzBFandtNnFENGxNMm5nTjBDTURZZ0hTUHhaM1pFaFRoVkNi?=
 =?utf-8?B?MjhqVWdRUlNYc21mQ3gxQ2lwYTRtQ0JJQTNtaXA2cDR0KzdERXhpZ1Z4Q2Ro?=
 =?utf-8?B?MDQwMGUxdlZTZG9tdFV6WGJwWUJmM0FpSmxyS2RXSDVzQ2FFQ2g4TUxjYUhY?=
 =?utf-8?B?cE1YTms3RHJnY1IxdXV6dHRRNzBreTcvOEhqWTltMFc5TFdYQ2JTK3RsOTFU?=
 =?utf-8?B?K1UvRlFrbS90VjJTTEtNZzEzRVRFbERTckk0em1jKytPVHZKcC9EeGM3czF3?=
 =?utf-8?B?SG9MT3c3ZVJoSXR6YmdIYUpSeG5vZk5OOTNGRHdVY0oyUTFJdlNDdWpzNFhI?=
 =?utf-8?B?OEQzOTRKSzdJMWhOVEwxUVNBelNFb1ltZFMzTHdtK2x5bFp5d3ExK01telFx?=
 =?utf-8?B?SUVxMWRERlpBek45bGxFUFBVdjVXL3YvaXh5UmQwYS91U3liK3R4NVoza3hr?=
 =?utf-8?B?OFJ2RFFuNUZnYnE0cFRCYUwvUU5keVBhSHljSU1YUlFlU09QYjh3cVJ3Ui9w?=
 =?utf-8?B?MDRXNytjUTRKbDIyUUJReDM5d3lJVkhHc2t1RWNvMktOMFhyNm1uZk5lS1Fr?=
 =?utf-8?B?cXFjRFpiakJYbEhCMEtZZktsL2V6aDBCZlNhTzd2ejF1WGZRc0g3KzZ6VFh0?=
 =?utf-8?Q?BO1FPyYsowdTCZqMvhKWBsl0I7lcmgnG?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QlBLOVZRM29MVW1mb3ptZEE4cTlTYk5aWkFPeVdjMzVqa3RVQ2N1WmNMTSs1?=
 =?utf-8?B?ZkNrRVJtRnpTKzNlcnFScUpqeE1ZRUpHWEN5Vlh1aG9Nc1VySlBjbmR6WEl1?=
 =?utf-8?B?OUpyVzBIdmhkNE0ybUtHVTZqUEpzbGprZlJwSERNU3BJVUFlSUdUWi8zQ0pw?=
 =?utf-8?B?dFU0RUxmblhGK3RyZnRhVUNKQ3IvbFhUc3VwRWxHaTBSYnhjUS9WN1JlQVht?=
 =?utf-8?B?bmZwLy9oN1BadW1iWHJjVHk5WTM4a0k5UDZvWk5WQXEyZVV6a3NDUzU2VW5l?=
 =?utf-8?B?Z0hZUXQvTTVpTzMyZUVya2tkQ3ltSHprU2tKR25LVzlWWDRSb1BTSXF4RGRo?=
 =?utf-8?B?MmJreWxkS0lFeG5SNE1tTkpNVTdYQzllZmNPN0xtdmM0Qi9Cbm9yMjk1SFNv?=
 =?utf-8?B?NDVKN3NNLytVVnJaUlZOdmhTM1VWZnlFdERQc3E5cWkvbkNmQW1ySFRaSkph?=
 =?utf-8?B?cUdCREpHL1RBak9qc2FBejBtSHBUanJtWmUwSnR0RWV2RVpzeWZZaTEzM1lR?=
 =?utf-8?B?aTBURUNUVTRCcFROcEJZTWU0amdOYmY2c2diK2tFdjlGZ0NOSjR5RzdyQnlP?=
 =?utf-8?B?NkVEU1dwRGhxTjJ4c296K1BCWVpCRm9icG9LQlorVnNUTGhsQjM0Tm9xQUY5?=
 =?utf-8?B?V1ZwQldaL1JXNWcyNXJLVVlnM1liVUhzSE1DRGdQb2NMbzVnZCtNckcyWlMr?=
 =?utf-8?B?dmZCOS96R2FyWUtVUzZqbHgzbmtudVlBMSs3MEpwM2FPTFRJMWt1VjRBWWZ0?=
 =?utf-8?B?cTdrRTBWREZaSWllQVFndU9LaGpVODZoZWxYMVpNWXEzZ0RtekozQzNZQnN4?=
 =?utf-8?B?ZkRtc3FtNE5mSldkK2t3Ni94Y1NjS2dTMVpKZkxzYjdFek5QLzlmcGUrRkpz?=
 =?utf-8?B?UkczKy9iSTlhaUo0VEhxUVB0VWJwODkwbDZpY0tjMXNER0V4VHFqRTYycVR5?=
 =?utf-8?B?bW8xZVNPUUNXMTN4d3lDaGQzc2xJSStJOU9wUXBScmpraE9sbllHeWJaQStk?=
 =?utf-8?B?YWEvS0t0eWdITnMxRzlHemw1czVKZnVZanVzbTNhb1diL1RKcVFTWXd0M2Yr?=
 =?utf-8?B?OVRvbzFyczVhSFp1dXptaUlZVWVBUlFYYUE2S1BsNlVrVHpPWURzUHV4aisz?=
 =?utf-8?B?UmtISHZRTWZxWHMxYTV1QkM3ZUdvaENvRnR2cEM0dWcwaXljS25Jb09hRktN?=
 =?utf-8?B?QkZkNC9aeGZGWk4ya2o1UmlkWVlJK2lIRzZEeEFhbHBUNUo1SmtOTGY0ZEE4?=
 =?utf-8?B?bWRnS0tpN1NJRTNsM0FSUkw1ZEdDdlFDRXNZa1FPZmRXZkdSVmFuZm5WZGlh?=
 =?utf-8?B?Z0VlVS9HelpkeS9OTXhEQTdMODF2YWFqNW9RalJaTHA4UkQyM2hDWGpYTm9W?=
 =?utf-8?B?clVYODM0bGZrRi91ajBNNVlScExKTWJMUHI1U05nQUZuV0UveDJYY1Ywd0l4?=
 =?utf-8?B?TnowdGttWVBKWEFuSy9FMmtvaUdjSlVadjdIY2JuRktHT0piVXlRVm1VQ0tS?=
 =?utf-8?B?OU1xcXp6dzh1RyswL3FLL1JNQW1UNll3bUh4a2NqRm5TN216YldoNzlma3Ra?=
 =?utf-8?B?QWwxOWw4U3lud0tSUG9uWFZZUGlQQTFTRHdmREVmRHdmOVJERU1pYWdvTHN0?=
 =?utf-8?B?Z1JuQk5YQzR6Mlp3a2lZTW1KWjgzTkgxNkxCNlp4UTBjSHRDTTQ3S3FNNWpI?=
 =?utf-8?B?UWpyT21ZSVk5M0pQVFRWS2h4YWdBeG1TWi9vdCtLY3hwMGVreGJqeWsrU3BR?=
 =?utf-8?B?UmVSZmtiY29UV21TMzJLRlZidlBZWXpEckNvSXMweXpFQnRrZjhhZTZOdW5i?=
 =?utf-8?B?bnU3TzFMY2luRndlTEZWbGdoSUNHd3MyYVo1Ulc3QlFqL3RFc1djYmVDRTFm?=
 =?utf-8?B?T2puR1ViT2JRc3VrUjZ5WG1Kc1ozSDM4T2tEcXlFY0wzNzJQcXpDdjZSMFcr?=
 =?utf-8?B?OVRadThtZ25lM3MrR285bnZURW55RjZsM1RwTVJrQnhLTUZVT2Y2dE1JSjVO?=
 =?utf-8?B?M0RnOHA1VzRtTWE0eVFSSk1sK0E3bXJBWHgreWtFdWpWNFVWdkFzUUx2cDZL?=
 =?utf-8?B?SldMNm5BSzdKMVFBWWRVOW9UckFGSVlsSHZzZXVCNEZxTDRlZlg1U2wxQkFE?=
 =?utf-8?B?bnE5elJveHR2bmVlczg5eTA1U1o3bXU5ZkxaeUNHT2ZxaTg4Yms5eERvZ2tN?=
 =?utf-8?B?OXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d704d6a6-9c77-4687-32fa-08dd56f76906
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2025 06:24:37.4953
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cu0x6TlqSHFWMoEz9Tjcz9XO2bHRnzXNCZuPzLwLyg6jW25FSE+bEfbiiCwQ/gAn/CahYHGC4oBKSrt/0MHN91Cx+qqaMcbTpuF/D+lPQBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10242

SGkgU3RlcGhhbiwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVw
aGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDI2IEZlYnJ1YXJ5IDIwMjUgMjM6
NTMNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gY2xrOiBkYXZpbmNpOiBVc2Ugb2ZfZ2V0X2F2YWls
YWJsZV9jaGlsZF9ieV9uYW1lKCkNCj4gDQo+IFF1b3RpbmcgQmlqdSBEYXMgKDIwMjUtMDItMDEg
MDg6MTA6MDkpDQo+ID4gU2ltcGxpZnkgb2ZfZGF2aW5jaV9wbGxfaW5pdCgpIGJ5IHVzaW5nIG9m
X2dldF9hdmFpbGFibGVfY2hpbGRfYnlfbmFtZSgpLg0KPiA+DQo+ID4gV2hpbGUgYXQgaXQsIG1v
dmUgb2Zfbm9kZV9wdXQoY2hpbGQpIGluc2lkZSB0aGUgaWYgYmxvY2sgdG8gYXZvaWQNCj4gPiBh
ZGRpdGlvbmFsIGNoZWNrIGlmIG9mX2NoaWxkIGlzIE5VTEwuDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4g
VGhpcyBwYXRjaCBpcyBvbmx5IGNvbXBpbGUgdGVzdGVkIGFuZCBkZXBlbmQgdXBvblsxXSBbMV0N
Cj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTAyMDEwOTMxMjYuNzMyMi0xLWJp
anUuZGFzLmp6QGJwLnJlbmVzDQo+ID4gYXMuY29tLw0KPiA+IC0tLQ0KPiANCj4gUGxlYXNlIHJl
c2VuZCB0aGlzIHdoZW4gdGhlIGRlcGVuZGVuY3kgaXMgaW4gTGludXMnIHRyZWUuDQoNClN1cmUu
DQoNCkNoZWVycywNCkJpanUNCg==
