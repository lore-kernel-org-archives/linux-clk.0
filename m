Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011063.outbound.protection.outlook.com [52.101.70.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A7A2C3769;
	Fri, 28 Nov 2025 03:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764299675; cv=fail; b=fLZDZFFAJ8B+0AHTBUzB0ciKyZxKEPp6csEYAruYVCYxmzKnu1rsjZe23HUlbPRggKhdxrCs7ZDVKuxnJp8bUfaSA6RLvUzULNjQ6p6XFaC3n6482NFnC4O1fUeRH2KOw72Rxg848lmgJNw0P4ATJfB1QIKvUzzniBZdy/e+0DI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764299675; c=relaxed/simple;
	bh=gWpGlSUweXzK5Eq80tcO9lZqrJ3hL5QibReFJkBecdE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ZWJyQUudNpMXLm8FOM6jUV1PvCLu/0bcerLsnjUzb7PHYSQiI2rIWS95qmakr0n8RCKRNVnoNPcELyFqio/uRB3J5U7C0fB67o5wGiBWaWF78jzBiS6MmCYDCBBbkWEHtFdvfB/jhCW+frenOwABrgpI6xMr9590WhoWxefNG1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=C05Q2Qbn; arc=fail smtp.client-ip=52.101.70.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="C05Q2Qbn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yxzaW3eFtGFJgyiGMWyOEU2aaK0Y6GarSHhY5eHxmIaF3dAxC9E/EhtKZm3K63Z2grjWtlkFwhya9i/wfGHclw2xSdkiaVt4eajjfY8O/9L5xLpQkeNmguiAW/uYpQXQrD650uSGI/eU1pBUvI/BeKpfA38IfTbIgBXxGrwkzWGgFP05jGWLzljBWaCtEbOjpWpXTHO3e3HG/VOQ8Ml6MAf9yN8A42JBZivKknCrd3XqiarkGOtrZcZEwIgDOK8c8Nwy4Mve23AomuZjktpI3b75gOr0wU8/AjhszEb2rIn4WV0YAl0KuYx9UBUBo7OtisnW/47A0oNWuXtFEc1Uig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7mrPE6FWDgG20UprDHcXbB90qG6Rs9tldg9oClPTpI=;
 b=Fh9RkSumNG4Zj/qwmeOPBvb5ZlyiHL2L5vkoUDWz7bBcPYzfqpLzWFBVoXIxSjSYHjq9L12hwr2pn3ezpPUYUvVzS37gMMJRekjjsY99/FzndzRd/Tr7anPu6wE951W+fsGe45XR3h74YEzj4g/X4qAr46wsjySBAFmfdHGCgoANUaN1U3VzMBKa5NkGxozFm2ow+iTH/wY30e28bL4bO+r/ib915rigQx3wEfJ82AUcwWASiZTWhKX5AlU1YYPKkGnnQeuvLe2k1gcij5dH/CMlf9/zlLly3sDojZ5l/g4F1/919dryBD3Yc1V89lGPRbnonF5J02M5G9H56546YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W7mrPE6FWDgG20UprDHcXbB90qG6Rs9tldg9oClPTpI=;
 b=C05Q2QbnP9hqpsWr12iQUNDCl0V7+mzPRS48GgEc3dMyvNOcbXtoKl5QRcwDK5Lda4BQsDWIDbQo4wUS6wT3MLYHzjWw+1tKrJMUvjbZxqm3cQVqCWwKboZ4t/xEt1w9AmX6OLdBspnQ/O3u4bLXLp3HtbMaUxIdd5j1KZpuG5IiEKWMIqVzSnQj++tF5/TKhjC4ASTS3aaff5SxpDXDJJ0Y7UEqExbk/U5qYrH7/0RFlbqAh45snNJsZdq5dsFx+D5Xl7GOJ/lml4fBnJhRgtrMWPFYyiAQ8zFVIzIBCI25v9Ptu9Ym6yvX/8P1dMm8K8Otvudb8wZklKismPK6aQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by DB9PR04MB8429.eurprd04.prod.outlook.com (2603:10a6:10:242::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.15; Fri, 28 Nov
 2025 03:14:30 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 03:14:30 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 28 Nov 2025 11:14:10 +0800
Subject: [PATCH v6 1/6] dt-bindings: clock: Add spread spectrum definition
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-clk-ssc-v6-2-v6-1-cfafdb5d6811@nxp.com>
References: <20251128-clk-ssc-v6-2-v6-0-cfafdb5d6811@nxp.com>
In-Reply-To: <20251128-clk-ssc-v6-2-v6-0-cfafdb5d6811@nxp.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Sebin Francis <sebin.francis@ti.com>, Brian Masney <bmasney@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:3:18::19) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|DB9PR04MB8429:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ad2ed14-a343-41c3-9e06-08de2e2c3f2e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RWwyUUdDZU9PaHBYdlZ2UnJwQmVJK3NQWVNnSURzYTB1OTkxSUFtWmdJVnRm?=
 =?utf-8?B?MG9nd0VwUGlWZDlpdEtTQ0F2S0tpc0RFN3FzVkM3Ukpma3h5TlFSUjBrL29J?=
 =?utf-8?B?T1NmaVFveFBGUEQzZXlYQ1FXRlNIeFVzU3pGM0UwaGJxb3Zqa2tvOEkxcDdq?=
 =?utf-8?B?WUloSWIwczN5cUZsZHF4emh5SlYzZmNoM0pxb0NqY1JrQnYxRTVPMmo5MkRD?=
 =?utf-8?B?KzdEdmRiVWtrOExIajhUUFE1VWhHS00zZFg3OHF5aEFlRzQ2cjR6WTVBUjZT?=
 =?utf-8?B?Wlg5ejFvTjV4MW5OOUI3M1VsM0pNYll0S3didkt1MjM1bEhBZnFKaTlaeEc4?=
 =?utf-8?B?ZTY3dDNYNWhoSWw0dkpYQzhsUzFTOW95OTNVQ2daNTZxNFZ5emVqTTcyK1BZ?=
 =?utf-8?B?ekxNUFpDa01tWE85cjhwZ1JMMVhLRUpKYTFObzNhVmptRVRQcnpnUHZrMGdv?=
 =?utf-8?B?eGV5R1M3Qlc5N0NrN0pZUnZsUjdDNUQ3WW1Pano0NGQ0a0pSdFZKN0hNbEhF?=
 =?utf-8?B?eHMwVzRhaStzb3E5M1dTaTFIQ01jb0w2SkxieWN6T3oyK1JmN3lpYjhSdzFs?=
 =?utf-8?B?c1RhaGJLanF2Z1J3SmxlSHFsTzBhd1l0TVlseEhTeDcwRU5vb2VMeCtoRXhp?=
 =?utf-8?B?eGFqRlZZaFRJSjF1cE1rREQ1VlZITUJpdjdpcXdKdytUTjA5YmhmM3RBdTZN?=
 =?utf-8?B?Z0N6WmJQazRvdHgzd0wrN3duelZUaCtlcHN5NHM1cTdvb3RveWlvdTlDRDBN?=
 =?utf-8?B?dHZMamdEQVJaNlZNcDlyOFdaaGNDcFowRFkvaEJueUU0SjdoM0FUTENwNVB0?=
 =?utf-8?B?RjVLRnhnZDltdjVOS2ZpYkkxUDduTTJOV0xkQ0N4S3BzNkNrQjZrU0RPY3VO?=
 =?utf-8?B?TDE5T2xiNXdZSGYzTExJM0dmSkFkNktNenVTYWtQTTdwWjlvelh3czk2bnhZ?=
 =?utf-8?B?MkdCb05PM0hMcG5QdHhTLzQvT01TK1BReG9uRlRTaVBmWTBtdzJ4VWsrTUpJ?=
 =?utf-8?B?em5uQnR0TTU4MXZuMS9EYTh1SG5sRGRSTWwraDZXV21TUFZabjVxdFpqUU5U?=
 =?utf-8?B?OGhoRnoyQnV0ZjU2a1lxRlZ1bjVHbXFjUXorcmpsdXNDWjZvTWw4L3pvcEU5?=
 =?utf-8?B?SWxhSVZuMFNXNk1yVDh6LzZqWkh2bUpPai9heEVLeWZJZ2lRWVBVa3ptd0NW?=
 =?utf-8?B?aWtSZkpKREdqWTZKMXJYankyQTZYM0JXZXRSNUV0cXlScnFZS1RsMHRDOHZG?=
 =?utf-8?B?N1h2RjFJZytFY3lCWHFwUDFMQUNkWjJmNWFhUmtSRyt5MG1DQytWbGkxQW1X?=
 =?utf-8?B?QTlvcEYyYk9qc1ZKOG9vQy9MQVpIb01Xc0dWdkoyYVo5OFJTNFVUaDNtN1RD?=
 =?utf-8?B?RmhDYkNIK1hQVUowYnJwN0dwVDNWa2gycHRQbTVZN2FKaEU1WklzZ0xzTGlG?=
 =?utf-8?B?OGJLWGU3RC8vWHdSckpjYndzVjc4Ym9HSENCVEZuU3pCNmsxaGdRMjgzblY0?=
 =?utf-8?B?WmlMYmJMLzhRYjlEL09xUTVDZ09henVtdE5Ua3pYdVFsSjVCWm9rNklucTR2?=
 =?utf-8?B?TzlGVkpHUDBrbXVObWRUU3RlRlB2eFAzaGpaOEZ6YW9rTG5yQkVkSGFBMkZ2?=
 =?utf-8?B?RkNxS3NVTHE5S1A1TmNEN1VyYVI4SFlvak5LL3U3RzcwdmdncWlsbWYrUzMw?=
 =?utf-8?B?VGVXVVJmeWNIb1JvL29ZYldWUnQ0L0tjcWdvc2FpK24wa1NpSGhCTVllc1Nx?=
 =?utf-8?B?Q0VISkcyR1BZc21oS1RUWEdOQTAxWlNGMlV0QkVYQ09Yck9UeTJzbFA5S3Jr?=
 =?utf-8?B?ZXM1eEVBVnhjcHdIUk5FMDdJOUNDYW1ZRVI1ZDgyS0c5bnd4UUM1aTlaUStB?=
 =?utf-8?B?R2pWekhGN2Njb0xYUi9UTHBpTjdldDNHOWxiUU5JVFVWZ3p4bmd5UGpncVFq?=
 =?utf-8?B?ZytqTmxVQ0NVcS9ITFlOOEFXRXVoeTBGSlhKWTJIMk01aGJGR1kyT1UvbGpN?=
 =?utf-8?B?bzdTbFQ2dXAvbkZ3MmhPQzN3RXNxcWJuMVNjVzYwR1M2Zm8xclhRL1FoWXlB?=
 =?utf-8?Q?TlhMVs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEVOREt6VWFFUm5iQklrMGZiU0lXeldkYmV4YlVKZG81Mk8wS3REL2JKd1Y1?=
 =?utf-8?B?cjBFRzNXTVY1emc5RDZGTFpLWFozMjIyK1VIeG9CUTc0ZXpmTitiVTd5Kzl0?=
 =?utf-8?B?QU5pNFZrU3E1VEYwbEtNTDQ5dEM0dk5DalNFV2FsU0ZRMkZjNy9jOEZQVktF?=
 =?utf-8?B?UjZhUFdialZ5a2hPV1IzYzJXeW12VzJVNFhNeVBvMEZUMjBtYmhhM1diVzJt?=
 =?utf-8?B?bTFxcDI2ZXY2VXlhNDdmTGo1ZVVhMUMrWnAvNThHWis2Zyt1anVpTFpGSC9z?=
 =?utf-8?B?c2pON0VsVGNXd25KeUZ3d2xJOWJSc2hGdUl1eVExWGNreG5yUlJCcldEWHBD?=
 =?utf-8?B?N2gxMkh4bndNY09KaUpKd2htQ2pwQ3JhbjgzSEZ2S3dvWWllcFRjeWlESTNN?=
 =?utf-8?B?c29iZllKYXMvWTJocVE2ZDRsVHdKZmd4VFZjMTJ2UmNsT1VaQlRsNVRyVHcz?=
 =?utf-8?B?QmZEYWpEQmQ2cE8xWDU0NjJCaHJRODVtL0dWZWxFWTF3TkxyNVMwbDBaZGlB?=
 =?utf-8?B?eWtyOTRQeGxWUmVLZW5LTjlVbjBKS0JqcmJwS1BzNFdLdy8rRldBSVBvZWJQ?=
 =?utf-8?B?K3MwUFZRY2l6a3lZaGRpOTZoZU9ScmxYN1RxVk56SUttamdQSDJFS3YwVWI0?=
 =?utf-8?B?bGdWMVNiUGZaa3NuaXpzbmFYZUxQODIxSWZtbDBPOVZPWWtxUGdyNG1ETDR3?=
 =?utf-8?B?TjZ5NkUvUG1CdDV1NVBUS3ljTzRodUFUMUtLVmVEd1FvWUUzK3hKU3c4eUJF?=
 =?utf-8?B?NkErSjd2UDJYd21NMlcxcHk4ZkgwU2ZlUjFLaDdZRHRtczlkQkJVTXVqWVRP?=
 =?utf-8?B?T1ZkSVpmTjBKSEwxbGQreHFMeUlreUh3NTE3ODNzNmVjVlM5VjJPZCtIcmtY?=
 =?utf-8?B?YkhVZ3NWczBnUlVJeFl6bTRJVG9yVTVlTTd5M0dnTDlpK28zN2tHcnFqU3hp?=
 =?utf-8?B?elQzZ0lnOU1uTTVYSTdPd1A5WktMN083TG10SmNLN2tEZm9KMGtwREtTZ0I4?=
 =?utf-8?B?KzFzYWV5NG9XSGttS24vZlVtWmRaY3RML2FYNlRwMllDTG5UZ3BQUFY3YU9F?=
 =?utf-8?B?aUNRQk02QjNHK2x2bWlvQzJLS05VeDR2ZmFRT0lDRW5WSmJHVWY5aGxIVFhi?=
 =?utf-8?B?N3grK2EvMWxNMEIrakx3YVZQaVlPMW1nYkZuelE5STlJUzZhUExRWVB0c2tO?=
 =?utf-8?B?RWlJRytIOXFPY2tsR2hreTVDcFVZRE13UFN5RmRETVgwR0M3emhiWFFJNzg1?=
 =?utf-8?B?RnBieUJxMm53dFhTZHBmQ2FGQUtJS0o4a2VJbHBvNnllV2xHWE9aMHVmalpM?=
 =?utf-8?B?aUFjQ29ESkdWNU9uNnhaQ2psNG1hd0I3RERoZ3YrZFY0b2NCV3llVGIveGFu?=
 =?utf-8?B?U1ZzWG1KZ204SGVCdytCV0xFWXBTa1k5WTVvNG5Pc3lrT01VZkl5R3RlNkJ4?=
 =?utf-8?B?eHExUWpLazJRQjYrTjdzUnF6Mm9jSE1rdVIzT01kVlBGaHVtU2dRSlZ3VFBv?=
 =?utf-8?B?clZ3V3VCTCtMOWcvQnZGZS84cStEWHA3dnlnTytyWW0vWUo1NFF1SW1QVzVO?=
 =?utf-8?B?OHpEZDBERVE0ZWNJSVlEdUc1ZVh6SlZxOGdZUXdkWDB2T1AzY2M3YXowWlFC?=
 =?utf-8?B?QTdETnZZTDhGWnVDN09SdlExYXZCK2pya3dRU3FLNjI0YU9YQ0swMTRrNHBy?=
 =?utf-8?B?aThiZndIeG5vUVJhSEdpZ2dkbDYzKzNUOWVnYXdqZS9TZXJzWnNheFJqdktt?=
 =?utf-8?B?MGNpY2ZLU2t4dkU5SEFkN2Z4bHphWmZlaUw4anFMeG13Q0huTE9PQzJYVCtq?=
 =?utf-8?B?WkVCT2FORUtBRzdoM25SV2FvanRlb1pBRlVKVkFYRkdRVW5LN1h4S29JOW1H?=
 =?utf-8?B?S2VPN0pMdFViVkFpeksvaXFrbG5wTEJtMjJwQ0FiMGtPZXpYNDJIZzJjS0xT?=
 =?utf-8?B?dTBDNGt5VE9yMnJWWUZzYmVJeklROHdsZ3cyUk1aSFAvNU0xeXU2VGxwb1Ey?=
 =?utf-8?B?dFQzOEtpOU1FQm9DOTRLS2U0RU9TYWdteUhkcHF5a1dGN1hLTnFaK3JqWjIz?=
 =?utf-8?B?LzJQNHF1bkZEc1g1NHFlcUFNNm5NZlZ6My95UWxUUXk0YVFGeThvOGNRc2dJ?=
 =?utf-8?Q?fn+hFe2B/Rg0OHfHgh7YxJa1X?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ad2ed14-a343-41c3-9e06-08de2e2c3f2e
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 03:14:30.7860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OATsJbUUZH+qwHdr5pDvyn5FtXCC5Qn1m3wlN1q2OY63terX0rGqQxFcZyaNfH+eqMo+lPtZSXgyO221wgmtMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8429

From: Peng Fan <peng.fan@nxp.com>

Per dt-schema, the modulation methods are: down-spread(3), up-spread(2),
center-spread(1), no-spread(0). So define them in dt-bindings to avoid
write the magic number in device tree.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 include/dt-bindings/clock/clock.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/dt-bindings/clock/clock.h b/include/dt-bindings/clock/clock.h
new file mode 100644
index 0000000000000000000000000000000000000000..155e2653a120bf10747bd7f4d47f25e0493e0464
--- /dev/null
+++ b/include/dt-bindings/clock/clock.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_H
+#define __DT_BINDINGS_CLOCK_H
+
+#define CLK_SSC_NO_SPREAD	0
+#define CLK_SSC_CENTER_SPREAD	1
+#define CLK_SSC_UP_SPREAD	2
+#define CLK_SSC_DOWN_SPREAD	3
+
+#endif	/* __DT_BINDINGS_CLOCK_H */

-- 
2.37.1

