Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2079.outbound.protection.outlook.com [40.107.22.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0A836C;
	Wed, 25 Dec 2024 00:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735088391; cv=fail; b=N61ga278hQ5HL1hLvpwFiy099U0yf8EVfFE6E6u6fR/LedfEqzismsDJnAWZDyhjYyicC8ioNRsKEhwgA4hRn7yD1vM+52bQ+DHt/Ru6Zdgl2FPnfteeP68dVxOo6zlCVD6M3p/ZY3ghMWNEJQLleYnuYvSNOJ1gLDqpLmUunFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735088391; c=relaxed/simple;
	bh=Pc3Ixm1LK+JmLRb+OqoIyFoER7ufpGyK9rvbofc9mSo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cJ9ru/UvsZ6I0wIIjJ8ji1+2TbK1pj575gao8nux6IrYsJqis/j/xI17ApGmWhiqke0Xgv+M7T5Pw+RjYbHaUcI3qd4QG8ZDvxbraz+oPODewI0xk5H+wE+go+0/64nSjIBDSHYLEU7lGkTH5qXHLZdKN0edTfPpjZySf37gEbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AjjbkXjB; arc=fail smtp.client-ip=40.107.22.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AjjbkXjB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vdsi3RA2tiFyceEBwPNGwwJIsoG+bvgCcBdZqGwq6Der/33R7282DBFxp1khWwiOZcKc3uDTYPNNxrJDa1+gQXoaQNfTSGeahRKulB81FeLnczmejhuPENCq04YT8ktoaBwNImKeoU3hQyR4D0gIOLw3CvpNjtWaMPgzfmPY8rJLrDeOZbU3T3iTDmRDsKoSaX9bVcn0Li14tH/R2DIQ48FnPhyJCoNrTVigniEJhznXa6xrvdna4QtzWoSnxWbRtsb9JBEoXggT16JO4EvJ+wzXzAYcVYjMeWU5Le4D7H67RQQ8ZhZXTQHCDksFRHyQ40IwR+QwWa4z9gZsx8dTAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pc3Ixm1LK+JmLRb+OqoIyFoER7ufpGyK9rvbofc9mSo=;
 b=ddAYyj3IlsCiWxPwXyw8YT0j7ekM0qBulgbf9Aj5Qz50OsWpx46WMe8AH8U1vDq086+SmTF7GJZ9goxsktTt4I55SAKNxc7pdFJF9MiiqUZZsE7MqqTHqAaIuG1igCw4cRf0dY77sMAuPzc2lxgD8D/dfsI6T9f/44Y7RWVqaJhYg0u8xSIzdoCCDJkdsKIlNYaAPtuyvSRk35DCnCSXj7HeLP2GNYlROYERVT8L7MUoNxqZW+mYWVtkw5DtuQO5zYBS7a48f7udw8MxZO7vkNWZmKPMeOc0tilx6Qy29xgWWw7DRoYkxdiiU5EWfnWfEZRxHbC8xTbQ2RjXshw8gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pc3Ixm1LK+JmLRb+OqoIyFoER7ufpGyK9rvbofc9mSo=;
 b=AjjbkXjBAMEx4Vax2dW5ppNum6AH2AiIkxOiRIIXsSpHaxtjTD81i6S6rRamqbph0hLVJxC5W1C8pHyxAgNemO5pC55T+LjLQ+2Lk4XbCgBFm4XYjh7zt0wFqKXF2Diw4lVYO+jG1KasxNRO713TrSqvRzeLCIFcxCu8KJkOwdZ9aXegHfvaoZ8N6HiDbMwaosNozNl5va5MC7LMAvjyCRAfaaQqba1R+Wo9BNsdKYrTb4Wak0U0I6CcN2I6wZe6kqPkIOepOwagiTfvjnimorGlgkCnsTaoGoTWYmqOfOe/RTHlRIlNXOIbtctlzItHQJKa+dBqyCnh8TKTcnKg9w==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB6830.eurprd04.prod.outlook.com (2603:10a6:803:132::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.21; Wed, 25 Dec
 2024 00:59:41 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8272.013; Wed, 25 Dec 2024
 00:59:40 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-amarula@amarulasolutions.com" <linux-amarula@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>, Fabio Estevam <festevam@gmail.com>, Michael
 Turquette <mturquette@baylibre.com>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo
	<shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: RE: [PATCH v6 10/18] clk: imx: add hw API imx8m_anatop_get_clk_hw
Thread-Topic: [PATCH v6 10/18] clk: imx: add hw API imx8m_anatop_get_clk_hw
Thread-Index: AQHbVJPFtnp/8pSW4UiL300dgYKPYbL0vPCAgACV5wCAANREYA==
Date: Wed, 25 Dec 2024 00:59:40 +0000
Message-ID:
 <PAXPR04MB8459F7FF003D8D43CB1BE94F880C2@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
 <20241222170534.3621453-11-dario.binacchi@amarulasolutions.com>
 <20241224032223.GC20573@localhost.localdomain>
 <CABGWkvrdMF-sUsHt4Af+Wn-OUgwbjpOpUq-yzMfOYo334_BTjA@mail.gmail.com>
In-Reply-To:
 <CABGWkvrdMF-sUsHt4Af+Wn-OUgwbjpOpUq-yzMfOYo334_BTjA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|VI1PR04MB6830:EE_
x-ms-office365-filtering-correlation-id: e4b1818a-b51a-414c-2d0d-08dd247f69a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bmpHcFVVRUg1KzRZTm1MMEtPK3VPbDhnd2pDTGo1MDg3SWhmNy9Gb1BxYkli?=
 =?utf-8?B?a3lzZ0pGOHM3SFo1cEpvSkpta3pBUnBSaEJhM25LUGdzYnFzWXJvNXZjWmhx?=
 =?utf-8?B?TFA0QTd1LzZFM3JRZU15TDJWMk01RU1oK3YrYjNwdjErbWtjRlRqSjUySjdv?=
 =?utf-8?B?ZGphdTB4My9oQzRqbk9IWXg4WmdQdTV2WmMyaTN5VU9tVHk4TUtHNjNiZ1Bj?=
 =?utf-8?B?Z2F3RUxYUmYyMUp3SzRzRENJNVBJSHNOWVFFRFdITUFSaG83WlR3MUFsRjBr?=
 =?utf-8?B?Q0ltVVk5bXdOaEhsUjRvU2U2UTMxNHJZdGdPek5uSlZ4SUN5aXdmblFWZzJJ?=
 =?utf-8?B?MkltczU3cFd0OWRQRnR5RmZDRTFiczhob2xUZkxpejZXUWZpVTQ4UGh3citn?=
 =?utf-8?B?RHA4MGJVbk9nTm9wOUFtMnhUcUhpR2ZxbnlQdlNHdWZIbjlmOCtsYUZRdU8x?=
 =?utf-8?B?UXZ4c2VTcmN3YVIzd0krbWJEdmwvZGJiZzE5VU1xOGpvcXhtQlZtN0NsNzEy?=
 =?utf-8?B?SXlScUFlbVlqdGt0VmgraVFuYmw4aTJhckEyNDdmdno5dnZmU0RHY1BkV0pa?=
 =?utf-8?B?VzJrMkxMeGJDNmxMQUNFVGtTMlVOTXgrN0tHWnFhOUZnWTN5anduRm9mUkFh?=
 =?utf-8?B?ckgvVjhlNUFDbUt1UVpubGNQQnZ0OE56NUkxd3ROdHNkekY3Ty9MSXRnRXZY?=
 =?utf-8?B?WTF2YnVJYzVMUW1vbyt6RnBSYjJRTWFZYUlMUTc3b2ZYaU9rWU91YnBNeDVH?=
 =?utf-8?B?UnpjN1VpZDVzbjVNUUpXWS9SOXZJYTZiYVNzVE1WdVZCVEhzWmVKZXRHVHRI?=
 =?utf-8?B?elBoNzBWT1lnSDdFQzZGRGdta08waE1CVS84dEM5clhoazJjMS9mWmpVaTMx?=
 =?utf-8?B?RFRSS3JjeWZlaWt5U3duTmJGWjlGemF3ODg3cGNQVFNhVzRWQVpyQ1FJdnZZ?=
 =?utf-8?B?dmc1UlFmbStSQXFsNjc3ckhxaW56Q2NSeEx2OHdNMjhqZ0NrWkdqYllnbEd4?=
 =?utf-8?B?MjNTMzFGZk9zT210ZkFZUFptd24vU2pBbnFzU1FTdGpwbFJXbHpsWHA1RUd5?=
 =?utf-8?B?cE9PYVdyVjN5K2lhNEpqblFGQ2FsMFkzOVJXV3dlR09iWlFCSTRmRGNERUww?=
 =?utf-8?B?QVR4aVBJTFhya3hHdXVocndYSEhscEcwSzZwOWFDV2gvL0IxTzNHenJuZlBS?=
 =?utf-8?B?K0RFK3M0Y0Z5OU0zNUkyK2FSaUhuTzk5S1lwMDNqUFBZSmVTT1QwcW9Ec3d5?=
 =?utf-8?B?Z2JlcEZ3NmhaMXVtcDRwRHJTYkxOTkltaS92MFZOQXdhWVpPR0FPN01HZkFT?=
 =?utf-8?B?WmQzUFAwZTBVSmY1WGg3ME1hYVp3UGZnVys3MDNGY0dpanJDcFNiZFRRVDEy?=
 =?utf-8?B?bm9ROVNNMWxyb2tnMXI3VnU1aU5DSUV1KzF5TXo3Z2RhelFDektpOFVXQUVv?=
 =?utf-8?B?YU9DK1gxcFhKRUpld3laMGdQRWtmK0I5VmhIaW9nRkIrMktnRXNTSWFndlJH?=
 =?utf-8?B?TmZnYkw5SitPVnFocFZZZnR4R1hJUFRxbTBscTE1Q1I4VU8yWm1jNHBERHA1?=
 =?utf-8?B?clBmNEM1SWw2dFA2L3ZIQXNDMEE0VEZqYWxwYXRCcVZ5cHB1UCtZQWFpNDIy?=
 =?utf-8?B?VTlZQk5QL0lPa0gxd21IZTZ6VHYyWFF2Ym1DckxqVzRpaWhLKzg0czIzMzZZ?=
 =?utf-8?B?K1AxY21jRGNza1pVVFlCRzlJeHhkMmN1blF4eGJJVlpIU0VBc1JvVGloc2FX?=
 =?utf-8?B?cjZVeUViL29EMEVIMmhSNllTNmdveVpIYit2ZkMxWVpXT1BsQTcwcnFsN3Ry?=
 =?utf-8?B?V2t4SCtrNVhxWitTdm0rbER6RGFxUDE2Ym5ZMzZXUnJIOU5YQ29GdzliWmRr?=
 =?utf-8?Q?3xS0sj/YnI+Vl?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NEVjMDJid0tVcy9IL1RRbnNuZzJhZlMrMklBVE9OdFlmQnBQSUFySGhPVlhl?=
 =?utf-8?B?a3JQRVJnRXVHQmZacm5Eb1BIQnJnMnZmNHA2MlZNK0llcFZKbDBDMG95WVhj?=
 =?utf-8?B?ZEZhR3l6VlBSNkx4c0hWUnJNSXZwQ1NJekNCcEEvbS95MEtkNTh4aHZMNm0y?=
 =?utf-8?B?SEhxNVBTV1BxZ2ZsNWdXdktQQXpVcXo2RlhtTFVINytvd0JKOXhoajNzbVZ1?=
 =?utf-8?B?VUlhZW5kK3h0WG43ZmtaMFh0ZTlVVllYR2I5OWIrWGs4Y2N1MUkrU0cyR3B2?=
 =?utf-8?B?cnMxcTdoaXY3Z1R0Mlk4SkJGWE5xYlFwajViTGxSOFIvSjh2S3hucHRYNWlS?=
 =?utf-8?B?bUR3TUc0U1hEcmJVcG5Yd2RNdTRDelJ4emN4Q2k4bmM1Mm95NlRrUDMyR3B6?=
 =?utf-8?B?MEdhc3NXWUliV0h2ajQ0MWNNZmJCeFhOeENyWDBMMnU5RG9aOEhROTNPampN?=
 =?utf-8?B?QUV5M05kK3NHdFBsazBTeXprdFRMWm5JUG9lQzh2aGx6VzBidjVJeDJxTUJB?=
 =?utf-8?B?SGdHbElHWFBCUVRRWG1VMGJnb2trdjY1M3N0bXAvVUl6YmkxV1E4TlROWGcw?=
 =?utf-8?B?cVc4RHYzRXBYczBkSVVwNGwzaFZmYTNUR1daRmtHb09KQUtxbHQ3TU1BWW8z?=
 =?utf-8?B?SkRvdFg2NWJyYnc3RWlhVFBoZ1dQczA5UE5YSnR0OXhIUzFnL2RFL2pFZDFV?=
 =?utf-8?B?MzBtY0xlWXNCbnNvK3E4S1VOd294dVc4S2VQdW1KMjNSUTV1OWNGSld2MnFK?=
 =?utf-8?B?Sm51bGg5RnMxbHRjTXA5SFhJaWlZVnNacVpMUjhYOFFiS3R2amR2SnZrbkR5?=
 =?utf-8?B?MEdzZXBkNmpCOEtZWHM4MU5WU2x4QU1ETERiQXpsUlJqd0VkL0dXZ2VQV1I1?=
 =?utf-8?B?SHV1Y1RldWpTN0doTi8vL0t5aHlMR0l4ajhUTEVhSERkZXRpY1h4VE1sb0JD?=
 =?utf-8?B?SGN4d1pCbVpjZnZ6UGtVaGpheTQ5b21ydGxOWDM3MWxjSDRQZkFoanVLNlJI?=
 =?utf-8?B?Q2prNHhFWVNpYW1uZGdndXhzbW5uc1V2b2IvTzdMNmJVRTNoaEJ0RWVYcW5P?=
 =?utf-8?B?RVh1U21QdEc0UGtodmRYTUpVVkRtVmUzZ2ZYeUZ6S3VNSTVyRUwrYnlmdFBj?=
 =?utf-8?B?SCt1OVpmdUhmYWJnTUI0Snp0REdjTVJha2VyeGp5TzJlV0duM2RJRGl3UHN1?=
 =?utf-8?B?Y245M3JObkxJa3hOclhBUFk1RUlZQk1BUFdaN0pGdVJST3h0MWt4Z1ZCMUVz?=
 =?utf-8?B?U0NYSHd0ZE5Hb1JGUlFCRFNaK0lVT09tZkJWUjFYaXl6NFlEdXdjR2FuSk1R?=
 =?utf-8?B?U2pLem1JaytxMDBsOTBzOC91bDJabzJ4eXM0enVEb0wwYnJ4VmQ3Z0lPWk5X?=
 =?utf-8?B?dnluWVRiYTRGWlhtc25YMGwwVjVNYzJBbEJET0paNnozOEs1aHVwNmFMdTcy?=
 =?utf-8?B?K3NHWlQzK2gvK0ZFN1NQVEZCSXpjWnBzWmFzd05wL3JPdGVoeDNGMDBmZmJs?=
 =?utf-8?B?ZTBOTHNyV2IyTzBJSFI3eWQ5SzZmQksyWWgzSmttQ3E5MndlVHhiald6Z3BK?=
 =?utf-8?B?SWVncng2amNxd2JMWnVPaXBUUHRBVkNzN0VxSVdNczZ2M3pDenVFQ25ENTkv?=
 =?utf-8?B?amk1aVh1Nm1TbU5KUzB3N1Rla1JlS1BqSlc5QVBJWmRVRm9MN2VyTXpLU0t0?=
 =?utf-8?B?Y3lVcHF5U0JhQk1VTWhYQk1aMnJNM09QZVBIMlp3MXp6SGFDdVVJMHZSVDNX?=
 =?utf-8?B?dEpGKzdhOUR6Ky9idkZmTVVCV1V6ejJJWFU5OEZIalZKK1ZleE92Q2lTT0lL?=
 =?utf-8?B?ZHFXQ09QUHZIbWZNV2pjTTkxNE5LdWMxMTBLelFRNzRxZ3hheG55cGw2Nkla?=
 =?utf-8?B?ODJZSUJlOVE3N1VPZGNENFZRVlcxdS84M2YydW5jWHcwM1BoMkxRb1FwY1hs?=
 =?utf-8?B?YU5sbXc5bmMwNmZWUSt5Z3p2aTB2aFBKUFg1Ly8yNERxa3VzZ3VxSmU1Qy9s?=
 =?utf-8?B?clBtTHQ2cDRJaVo5Q01QUit4MFlueFhYMERZY0c2SzFCSE9lb3dJd01HdE9q?=
 =?utf-8?B?TGViL2N1bDFlN2gxYllxQ2Q4dkQ3R0FwejlSMnEycm9ENUVMTHpHdkNsZEJq?=
 =?utf-8?Q?FbSU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4b1818a-b51a-414c-2d0d-08dd247f69a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Dec 2024 00:59:40.8072
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x+chX/c/RSGUajt/OFhmhB8IHWtYiGD9MwWo0+QmIq/cYO0f1s5Y+e4l+Yxw8uBtwTJpvAGiEFmuR4WpV4+vMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6830

PiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDEwLzE4XSBjbGs6IGlteDogYWRkIGh3IEFQSQ0KPiBp
bXg4bV9hbmF0b3BfZ2V0X2Nsa19odw0KPiANCj4gSGkgUGVuZywNCj4gDQo+IE9uIFR1ZSwgRGVj
IDI0LCAyMDI0IGF0IDM6MTfigK9BTSBQZW5nIEZhbiA8cGVuZy5mYW5Ab3NzLm54cC5jb20+DQo+
IHdyb3RlOg0KPiA+DQo+ID4gT24gU3VuLCBEZWMgMjIsIDIwMjQgYXQgMDY6MDQ6MjVQTSArMDEw
MCwgRGFyaW8gQmluYWNjaGkgd3JvdGU6DQo+ID4gPkdldCB0aGUgaHcgb2YgYSBjbG9jayByZWdp
c3RlcmVkIGJ5IHRoZSBhbmF0b3AgbW9kdWxlLiBUaGlzIGZ1bmN0aW9uDQo+ID4gPmlzIHByZXBh
cmF0b3J5IGZvciBmdXR1cmUgZGV2ZWxvcG1lbnRzLg0KPiA+ID4NCj4gPiA+U2lnbmVkLW9mZi1i
eTogRGFyaW8gQmluYWNjaGkNCj4gPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29t
Pg0KPiA+ID4NCj4gPiA+LS0tDQo+ID4gPg0KPiA+ID4obm8gY2hhbmdlcyBzaW5jZSB2NSkNCj4g
PiA+DQo+ID4gPkNoYW5nZXMgaW4gdjU6DQo+ID4gPi0gQ29uc2lkZXIgQ09ORklHX0NMS19JTVg4
TXtNLE4sUCxRfV9NT0RVTEUgdG8gZml4DQo+IGNvbXBpbGF0aW9uIGVycm9ycw0KPiA+ID4NCj4g
PiA+Q2hhbmdlcyBpbiB2NDoNCj4gPiA+LSBOZXcNCj4gPiA+DQo+ID4gPiBkcml2ZXJzL2Nsay9p
bXgvY2xrLmMgfCAyOCArKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gPiBkcml2ZXJz
L2Nsay9pbXgvY2xrLmggfCAgNyArKysrKysrDQo+ID4gPiAyIGZpbGVzIGNoYW5nZWQsIDM1IGlu
c2VydGlvbnMoKykNCj4gPiA+DQo+ID4gPmRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9pbXgvY2xr
LmMgYi9kcml2ZXJzL2Nsay9pbXgvY2xrLmMgaW5kZXgNCj4gPiA+ZGY4M2JkOTM5NDkyLi45YTIx
ZjIzM2UxMDUgMTAwNjQ0DQo+ID4gPi0tLSBhL2RyaXZlcnMvY2xrL2lteC9jbGsuYw0KPiA+ID4r
KysgYi9kcml2ZXJzL2Nsay9pbXgvY2xrLmMNCj4gPiA+QEAgLTEyOCw2ICsxMjgsMzQgQEAgc3Ry
dWN0IGNsa19odw0KPiAqaW14X2dldF9jbGtfaHdfYnlfbmFtZShzdHJ1Y3QNCj4gPiA+ZGV2aWNl
X25vZGUgKm5wLCBjb25zdCBjaGFyICpuYW1lKSAgfQ0KPiA+ID5FWFBPUlRfU1lNQk9MX0dQTChp
bXhfZ2V0X2Nsa19od19ieV9uYW1lKTsNCj4gPiA+DQo+ID4gPisjaWYgZGVmaW5lZChDT05GSUdf
Q0xLX0lNWDhNTSkgfHwNCj4gZGVmaW5lZChDT05GSUdfQ0xLX0lNWDhNTV9NT0RVTEUpIHx8IFwN
Cj4gPiA+KyAgICAgIGRlZmluZWQoQ09ORklHX0NMS19JTVg4TU4pIHx8DQo+IGRlZmluZWQoQ09O
RklHX0NMS19JTVg4TU5fTU9EVUxFKSB8fCBcDQo+ID4gPisgICAgICBkZWZpbmVkKENPTkZJR19D
TEtfSU1YOE1QKSB8fA0KPiBkZWZpbmVkKENPTkZJR19DTEtfSU1YOE1QX01PRFVMRSkgfHwgXA0K
PiA+ID4rICAgICAgZGVmaW5lZChDT05GSUdfQ0xLX0lNWDhNUSkgfHwNCj4gPiA+K2RlZmluZWQo
Q09ORklHX0NMS19JTVg4TVFfTU9EVUxFKQ0KPiA+DQo+ID4gZHJvcCB0aGUgZ3VhcmRpbmcgbWFj
cm9zLCB0aGVuIHRoaXMgY291bGQgYmUgcmV1c2VkIGJ5IGkuTVg5Lg0KPiA+DQo+ID4gPitzdHJ1
Y3QgY2xrX2h3ICppbXg4bV9hbmF0b3BfZ2V0X2Nsa19odyhpbnQgaWQpDQo+ID4NCj4gPiBob3cg
YWJvdXQgY2hhbmdlIHRvDQo+ID4gc3RydWN0IGNsa19odyAqaW14X2FuYXRvcF9nZXRfY2xrX2h3
KGludCBpZCwgc3RydWN0IGRldmljZV9ub2RlDQo+ICpucCk/DQo+IA0KPiBJIGRlc2lnbmVkIHRo
aXMgZnVuY3Rpb24gc28gdGhhdCB0aGUgY2FsbGVyLCBpLmUuLCB0aGUgQ0NNIGRyaXZlciwgd291
bGQgbm8NCj4gbG9uZ2VyIG5lZWQgdG8gcmVmZXJlbmNlIHRoZSBhbmF0b3AgY29tcGF0aWJsZSBp
biBhbnkgd2F5LCBidXQgSSBhZ3JlZQ0KPiB3aXRoIHlvdSB0aGF0IGl0IHdvdWxkIGJlIGJldHRl
ciAgdG8gYWRkIHRoZSBucCBwYXJhbWV0ZXIuIERvIHlvdQ0KPiB0aGluayBpdCB3b3VsZCB0aGVu
IG1ha2Ugc2Vuc2UgdG8gYWRkIGEgcGhhbmRsZSB0byB0aGUgIGFuYXRvcCBub2RlDQo+IGluIHRo
ZSBjbGsgbm9kZT8NCj4gDQo+IGNsazogY2xvY2stY29udHJvbGxlckAzMDM4MDAwMCB7DQo+ICAg
ICBjb21wYXRpYmxlID0gImZzbCxpbXg4bW4tY2NtIjsNCj4gICAgIC4uLg0KPiAgICAgZnNsLGFu
YXRvcCA9IDwmYW5hdG9wPg0KPiB9DQoNClRoaXMgbmVlZHMgYmluZGluZyB1cGRhdGUsIHNvIG5l
ZWRzIERUIG1haW50YWluZXJzIHRvIGFwcHJvdmUuDQpJIGFtIGZpbmUgd2l0aCBpdC4NCg0KUmVn
YXJkcywNClBlbmcNCg0KPiANCj4gU28gdGhhdCB3ZSBjYW4gY2FsbA0KPiBhbmF0b3BfbnAgPSBv
Zl9wYXJzZV9waGFuZGxlKG5wLCAiZnNsLGFuYXRvcCIsIDApOyBpbnN0ZWFkIG9mDQo+IGFuYXRv
cF9ucCA9IG9mX2ZpbmRfY29tcGF0aWJsZV9ub2RlKE5VTEwsIE5VTEwsICJmc2wsaW14OG1uLQ0K
PiBhbmF0b3AiKTsgVGhpcyB3b3VsZCByZXF1aXJlIGFuIGFkZGl0aW9uYWwgcGF0Y2ggdG8NCj4g
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2lteDhtLWNsb2NrLnlhbWws
DQo+IGJ1dCBpdCB3b3VsZCBtYWtlIHRoZSBDQ00gZHJpdmVyIGNvZGUgbW9yZSBnZW5lcmljLg0K
PiANCj4gV2hhdCBkbyB5b3UgdGhpbms/IEnigJltIHdhaXRpbmcgZm9yIHlvdXIgcmVzcG9uc2Ug
YmVmb3JlIHNlbmRpbmcNCj4gdmVyc2lvbiA3Lg0KPiANCj4gVGhhbmtzIGFuZCByZWdhcmRzLA0K
PiBEYXJpbw0KPiANCj4gDQo+IA0KPiANCj4gDQo+ID4NCj4gPiA+K3sNCj4gPiA+KyNpZiBkZWZp
bmVkKENPTkZJR19DTEtfSU1YOE1RKSB8fA0KPiBkZWZpbmVkKENPTkZJR19DTEtfSU1YOE1RX01P
RFVMRSkNCj4gPiA+KyAgICAgIGNvbnN0IGNoYXIgKmNvbXBhdGlibGUgPSAiZnNsLGlteDhtcS1h
bmF0b3AiOyAjZWxzZQ0KPiA+ID4rICAgICAgY29uc3QgY2hhciAqY29tcGF0aWJsZSA9ICJmc2ws
aW14OG1tLWFuYXRvcCI7ICNlbmRpZg0KPiA+ID4rICAgICAgc3RydWN0IGRldmljZV9ub2RlICpu
cDsNCj4gPiA+KyAgICAgIHN0cnVjdCBvZl9waGFuZGxlX2FyZ3MgYXJnczsNCj4gPiA+KyAgICAg
IHN0cnVjdCBjbGtfaHcgKmh3Ow0KPiA+ID4rDQo+ID4gPisgICAgICBucCA9IG9mX2ZpbmRfY29t
cGF0aWJsZV9ub2RlKE5VTEwsIE5VTEwsIGNvbXBhdGlibGUpOw0KPiA+DQo+ID4gVGhlbiBubyBu
ZWVkIHRvIGZpbmQgdGhlIGNvbXBhdGlibGUgZm9yIGV2ZXJ5IGZ1bmN0aW9uIGNhbGwuDQo+ID4N
Cj4gPiA+KyAgICAgIGFyZ3MubnAgPSBucDsNCj4gPiA+KyAgICAgIGFyZ3MuYXJnc19jb3VudCA9
IDE7DQo+ID4gPisgICAgICBhcmdzLmFyZ3NbMF0gPSBpZDsNCj4gPiA+KyAgICAgIG9mX25vZGVf
cHV0KG5wKTsNCj4gPiA+Kw0KPiA+DQo+ID4gVGhhbmtzLA0KPiA+IFBlbmcNCj4gDQo+IA0KPiAN
Cj4gLS0NCj4gDQo+IERhcmlvIEJpbmFjY2hpDQo+IA0KPiBTZW5pb3IgRW1iZWRkZWQgTGludXgg
RGV2ZWxvcGVyDQo+IA0KPiBkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbQ0KPiAN
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiANCj4gDQo+IEFtYXJ1bGEg
U29sdXRpb25zIFNSTA0KPiANCj4gVmlhIExlIENhbmV2YXJlIDMwLCAzMTEwMCBUcmV2aXNvLCBW
ZW5ldG8sIElUDQo+IA0KPiBULiArMzkgMDQyIDI0MyA1MzEwDQo+IGluZm9AYW1hcnVsYXNvbHV0
aW9ucy5jb20NCj4gDQo+IGh0dHBzOi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9v
ay5jb20vP3VybD1odHRwJTNBJTJGJTJGDQo+IHd3dy5hbWFydWxhc29sdXRpb25zLmNvbSUyRiZk
YXRhPTA1JTdDMDIlN0NwZW5nLmZhbiU0MG54cC4NCj4gY29tJTdDNGU4MjQzYTViOWY5NGE1MzJj
OGQwOGRkMjQxNTI5MjIlN0M2ODZlYTFkM2JjMmI0Yw0KPiA2ZmE5MmNkOTljNWMzMDE2MzUlN0Mw
JTdDMCU3QzYzODcwNjM5NTQ5MTg0ODE2NiU3Q1Vua24NCj4gb3duJTdDVFdGcGJHWnNiM2Q4ZXlK
RmJYQjBlVTFoY0draU9uUnlkV1VzSWxZaU9pSXdMakF1TUQNCj4gQXdNQ0lzSWxBaU9pSlhhVzR6
TWlJc0lrRk9Jam9pVFdGcGJDSXNJbGRVSWpveWZRJTNEJTNEJTdDMCU3DQo+IEMlN0MlN0Mmc2Rh
dGE9MGhNYzlVd2dGcGE4VmhPSnZVVmwzSTNrcmdlRlN6Y0IxNDl6TFJtSFR4DQo+IGclM0QmcmVz
ZXJ2ZWQ9MA0K
