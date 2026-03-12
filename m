Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011046.outbound.protection.outlook.com [40.107.130.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF02C1DE8AD;
	Thu, 12 Mar 2026 06:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773298645; cv=fail; b=JhcbmWBV1rE42V9qR12Jbhmc20t5eUENmz0q2idBwrvNU1Pub+dY2uyAgP2Hrmj3qEb7/3LZKW+CnvhzGjR51DhxumrTVWnOezPP09HjxI/PU7LToxnEpBQCSfyKAxmLAT6qV/Gvcixzn3SPOw7q2hrG2sxvEC8zkD7W2hDzzQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773298645; c=relaxed/simple;
	bh=Jj+kM1RYBn0I19k2zfO1HeYsPF0gpixfus6k8Z/GzpI=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=P4U/E0ZlRf0ho/iCzyFuMicX09Ubpl0/06iOTSjrnmZQvTMUu17z4zSeC/cZWNca5BIQVOWMmTyum/EOqGYJnh9BLcPcRxi2jRQsru4YGv5jwWnyO9BfSp4vTmiOTL9sOkvYEcdz0bdyebpjI88oWTOCZ19qma7jvUc+d4K8a38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Jf3FUdoR; arc=fail smtp.client-ip=40.107.130.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Jf3FUdoR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C2sPkNh5tKuw1ZrQP9VWUkZb+w94OdqlSzSr54o1TorSjRUT/FyS6WoboUklOGr68uzZ9V7KUaTW0AtCbz5hf0V7FJV9WedoTKweS+c5m+SS37aWk6KdiK3J567bSwNyKd4VFd0AAl6TtNcRIwejCVtdyVc5Zx7LO3XYJ1W1PPg6YZHhWY2IAoq+TqjCHa17VGE4DNsRCaY9wEt0BucF2JzZ/ORrY3K7IxtpPx7MZ2Zct3US36WjErD86XhpDI5UeZ5buO2fHrOprwmQZGKQAEpQjrJ5xAtFcZ9cJhdOhZhdjUVHnsbfCPr+vRQopOFqtyl1aQX5t5O16WsKhg/wMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AefXxZtTmrBYwLDanqYdkA4XfVD47jzFbMOiiwRCF9Q=;
 b=phOJuDFz1x4UNtkxrV/4S1LUEqcPq7rmalW2JlhhIqsPnPGszlbH0cajalJeTldefz2vNj3NpocnPtIGH29nDrwJkLpFkSBaMe9GVT9+Qx06pIXDJXv+7ebxMxJw8O9Tn/NiRAmLqflo2AKs+8sIth5yz+McZFd5RiaWUaT4zBWxf+ek21/KkbMm4DmaAgMOpS3chxcDT9KrGwP+xLroFepQ9O4HFN5z99nUn6l0muVvPYnrhCcYf5q9PKisKENHbXx3MghV5R9xlOqZ6W7DU+1sVL6vi1Fs2dNoMNDzBg7O88XvWW7PltxCDveMky2I5NKQsCKm15+hG7GOEjJ0OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AefXxZtTmrBYwLDanqYdkA4XfVD47jzFbMOiiwRCF9Q=;
 b=Jf3FUdoRLxth27l0voIvPzDsPSa0zpeZDnLrJVSy5/uWt9sqDMyayzo/DkXrQvmYVzQBZ9CPstXbJmayPhQQKssQ5PEZIuKCrQozPMdVuxfFzSDL24wWwj1/VGO7i0EiH+tH+dlonKHlQK69gamFibeQC5NBB1PmjIpxs+lXM/k4n67nrfxTsOZm/orHp/3zHdLlb1ZJm8RbIzfpi7xLWao57dWTPJ03a7xXFpVbBCn9oZiA61Jva6SxnEAcoSRirc/5Qgf/ZOaYt1Po/I/ZnSDcP8HHB94zoh7oLOVux3FNGQ2BufE2aUjoKfSfS0fZnUvIP0V2JgBizCuZCrVNcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM7PR04MB6997.eurprd04.prod.outlook.com (2603:10a6:20b:10d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 06:57:18 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 06:57:18 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v9 0/6] clk: Support spread spectrum and use it in clk-scmi
Date: Thu, 12 Mar 2026 14:58:16 +0800
Message-Id: <20260312-clk-ssc-v7-1-v9-0-0a9d2e188d9e@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAlksmkC/3WM0QqCMBSGX0XOdYt5NnV21XtEFzaPOaopWwxDf
 PeOQgRBNz98P3zfDJGCowiHbIZAyUU3eIZ6l4HtG38l4VpmQIlFjioX9n4TMVqRKpELLbFtdVd
 TiTWwMgbq3LTlTmfm3sXnEF5bPVXr+yfEI4UyksylMNxTRz+Nezs8YM0k81FLqST+qIZVVEWpt
 Woq0varLsvyBgr3NSbhAAAA
X-Change-ID: 20251231-clk-ssc-v7-1-402dd4f9e629
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Sebin Francis <sebin.francis@ti.com>, Brian Masney <bmasney@redhat.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MAXP287CA0017.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::35) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM7PR04MB6997:EE_
X-MS-Office365-Filtering-Correlation-Id: 8de3323e-6477-4920-1d2a-08de800499a8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|19092799006|7416014|1800799024|366016|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	QsGzhC7HcwhBgDxY0afwDJARivBBSc/RXP+XG2RdXj02WLmtOza6+g5QC2bG3aVbDMajdCwhZd4IlT5Hmi4+DGkxHtIMT/uzEMt1WwzDQoZXp28CnZLGSQ8aQ8tktfc8m6VXsbyFTL0BWmxZKBBkyzWo3Z8ganSKPdFkXf+OUtO4hLkOXjI0kEhBOOq79WEdXhRBjamHByM43sR2RN8vtvEKlOeHLgU+kdVJXXWKsl/vLbXhjQKMzjznW0Xj/Fy+KuHX06iPhgBp6oSqGeUZOz9+MlTAPd7VUa7MxjpcBVIPTcfifPH/00ZIr4iWJUf8XhkmdGpMkzjUabwPjTfJGjvIIlUGUBn/7tyMfMp2m24Wu3zXa+CI49FkN1FGl5QELLrvwOrv/G+vC0sZykLgZ1FuMOknTC+IozMe2fuDho+Ev9TuXr7FNWycsuZjp3fpF5V+8rO5+osn/exQREsmP9k2xr633L+e1BdcgQAo98zfi+aTkoK0KU8hPP54OZDSuDbR7FG4t8GF2b7V89PgjUXqn0l0JSKPjABFkRBXe/jrEtCKJRdshCoc4okSoP5RjxrkrxX8zLdc4Z6Za5QouKa3Si2jCGRhmdPdyZGCz16V7gr6m8cUedU/TouxO+9pyuzyeee++p81gdUiZIvlWLH36sLUleuSI7pgkbnEkrMS8yOIJIkbbJ2e/afSGTctXPkljTmU1bmhhvzOiZzXkyTouqxMi4qxW7FoenTQYTeBDND1xezLCMkqP+jV0FRS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(7416014)(1800799024)(366016)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2x3b3JMR3Q3NlVDRzdxM2tjMHlES0czcExTdmY0RzRnTmdBOWRId29PVDFU?=
 =?utf-8?B?UWNrcnE2a2ZOMm1oZ2pvL2Z0OVJEaUc0YlJGT2s0ZkVnU2ZTMDluWnJqajZm?=
 =?utf-8?B?U2pBK2ZzTWx6NTR1WkhvWi9TQUtNWFVzSkRhVGdLY0VmeHVvbW1LQnloTWFM?=
 =?utf-8?B?VWZkbVZRaUpBQk91b085VVRjTW9TQ1hyQXRzc09YVFRnbGp1VGhSYStBMk5h?=
 =?utf-8?B?VmNxNzJ5dlZzdVNTYzM4WkNFUkhGazY4ZEFKL0lIOXNycGIrbmhjQ1FLZURG?=
 =?utf-8?B?MG1OZi94Nk1GWDMzQjFWS3pjS3ZBNEtRK1ZKcWQwOERTUkxsMWt1dHFtMWlB?=
 =?utf-8?B?WXRvWmRXUmlZcGJQYXJsN1BKSERqcUJOTGRadWlBZnJoM0hMWWZ3a2Y0Z1ZO?=
 =?utf-8?B?UWs2eEp0QjYyM01kNG0rVUtkR1BBSlBqdUJERFZzdnFzdHdrVUZlSUcrT3lw?=
 =?utf-8?B?cjhsZUI5NjlWWUJsdFI0TTZSMVRwMnlSTDFCbDBEWlpNdnlhS0ZNVi82ZEFT?=
 =?utf-8?B?Z1hnTjlmQktBOEtITGFaK2JMYjZFRzExcEZGb2VvOStrVUd4amdXSmI4YXNR?=
 =?utf-8?B?RVlFMzJUSUovb0RqbFp2b0J6N05xSWRRV25ZV1k1anFEQkRkWlRUdWlpNEd6?=
 =?utf-8?B?MUhjc0lzZ1diMnkwTExzUEQ5WFYrLytIL3lRUFM3MU5sMjlWRmlhbllvUHdF?=
 =?utf-8?B?MUloZlFUWW1BYVdEb21jSUlPaW40cW9FSGF5MmxQbElIOVNUcENMSG5VQVVU?=
 =?utf-8?B?OEhwRk5EVkh2czVLYTVBZWdzWmRUbzhtTjkwbjBObldtWXF1cFVvVm0xUTFE?=
 =?utf-8?B?VW9KUnF1djBKNXk5QmdTTHNVc0NaczhiZEtvNEIzaUg5Um5WOXhOd3BrdnhQ?=
 =?utf-8?B?b1FMNm9PUkw5eFdyVjU0MVhZSlVDNkVuWE1QR01JYXlQSzFRSWJadzFCNjUx?=
 =?utf-8?B?ZkpUWlFkRXRKQUREVWxuVmRqNEtmSFdacjc2Zng1L2VEODhRdXZ6RkllSDBr?=
 =?utf-8?B?LzRQQmV4djJYNVNTeHBwR2VJSUY0OE42WnV5MTNwY1pxRCtwZDhlOTNrb0Z2?=
 =?utf-8?B?cE9qa080amxSbGU5VlZZU0hkMUFmM0xKbGhIN2wrV2JvVlVpWnJlZERTZUR5?=
 =?utf-8?B?SlRCNnF6Ym5icURqMjN2R1NYT1RpZVp6aVNLU3ZsOXZFOUlPTkpvOCsrcjdx?=
 =?utf-8?B?SjFBVnhYZTdoMEVaa21taDMwSDU5MlcvZjF0VkN3UmhzdFdPYUVWN2JVSGF4?=
 =?utf-8?B?clJFY1ZvSC83cmUxUlZ6YWZkQjdBQVVqaU5nVnZEb21MS2xSbHRjcWdrOFBJ?=
 =?utf-8?B?ZDJtallvZTdSWS9NMlVVRWdMSUNzUkttSFdBS2ZjK0ljQmFWNkdFUHNPcXhX?=
 =?utf-8?B?eG1md2FkTDQya1lGZ0FmUmVaTit3YUtnZEgvWXkrRCt5eFFBVkcxY0dHTzBo?=
 =?utf-8?B?ZHdxdE1CY2VCT3RvMXV4Ums2UWpQc2pwRjNCUFpxTUlmekRIVTM5M3VoV1F4?=
 =?utf-8?B?UHZJWnc0WXU0N0d4RkFPSXAyTnF0aVJxQ2Fmb0RrR1kvUHdVVUFWYjZkd1ZJ?=
 =?utf-8?B?eEloYTdhUGt3S1BEaTRhc0ZvaG51dnFPbE1kOFNpOFEvYjhKcEl6c3hDd2k1?=
 =?utf-8?B?STRnV0QvUlI0M0l6d1A1eFNrckR6M1NaQVFZczZ5WlpVNUtYa05uSll2R2tR?=
 =?utf-8?B?MmU3TGFTZFNuR3dRMnVpdDdLei9zT2RBdXJ1ZjUwamFOVTlNUng3c0R1bUFY?=
 =?utf-8?B?cVR4RHhmVHZYSXJaM0s2Q2hiUCsybWw0d2VkaG80ZTRRZ2JCRDNOQThmb2oz?=
 =?utf-8?B?UW5LQzhyME16UmNaSjhHOWp2Y0hjS3dPRFZVZlhDbW10YngwRXB5M0FITmxQ?=
 =?utf-8?B?U0RuNHRvazBQSUMreFJBRXZQZDV2dnplRFEyZDZLamF4b1V1WFVoMnpqbWZm?=
 =?utf-8?B?OHhyamhlbWpWeG5sbWRLd3BaRXJYWi9aVlUzVTFWbWZsYU9Hc3o4S1dkTWxh?=
 =?utf-8?B?bTBRRjd2bmQzRXpldmZsVVRuYmo2aGxuenlWQyt5S1kvS1JUS1V6emtudjVN?=
 =?utf-8?B?VytKMTMxdHB5RW1MREk1YndVYVF3L1JEcHN6UjluSE9jYVFFYTVYZGZHb2Vp?=
 =?utf-8?B?NWgzQXpvcEE2VXIyTXFTUlBBM2xVcFNnTW9pczZmYmxqOXNvZ1hRV0dLdHV5?=
 =?utf-8?B?Y0xFQkg1WmRSeGZkeFVRQ3UxK3JwUmx3Tytod1R5bnVKNnFCMDBoT2lsM2d5?=
 =?utf-8?B?SWpieXZBVThEMWZUeHdGNzV1YkVsejNCd2VyQzY3VWRnd1RkV1ZQSFYrT1h1?=
 =?utf-8?B?aDJ1cG1jcXJVeDZ3VU03eDQzSXV3Z1kzanpFU3haN1hsK0VWNDdLQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8de3323e-6477-4920-1d2a-08de800499a8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 06:57:18.1375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hh351uUyyLe393aOGyxaJN0H0tPEEL9bgvkxAhoFFVgBQe8ht0CYwOpn9zfEg4Rm7rUsx7/ShA2p+GLFXYx2AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6997

Since the assigned-clock-sscs property [1] has been accepted into the device
tree schema, we can now support it in the Linux clock driver. Therefore,
I've picked up the previously submitted work [2] titled "clk: Support
spread spectrum and use it in clk-pll144x and clk-scmi."
As more than six months have passed since [2] was posted, I’m treating this
patchset as a new submission rather than a v3.

- Introduce clk_set_spread_spectrum to set the parameters for enabling
  spread spectrum of a clock.
- Parse 'assigned-clock-sscs' and configure it by default before using the
  clock. This property is parsed before parsing clock rate.
- Enable this feature for clk-scmi on i.MX95.

Because SCMI spec will not include spread spectrum as a standard
extension, we still need to use NXP i.MX OEM extension.

[1] https://github.com/devicetree-org/dt-schema/pull/154
[2] https://lore.kernel.org/all/20250205-clk-ssc-v2-0-fa73083caa92@nxp.com/

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v9:
- Rebased to next-20260311
- Fix kunit test by setting return value to 0 when there is no
  assigned-clocks in patch 3
- Link to v8: https://lore.kernel.org/r/20260302-clk-ssc-v7-1-v8-0-2356443a7e4c@nxp.com

Changes in v8:
- Add R-b from Cristian for patch 5 and patch 6
- Add comment for scmi_clk_oem_info in patch 6
- Rebased to next-20260227
- Link to v7: https://lore.kernel.org/r/20251231-clk-ssc-v7-1-v7-0-380e8b58f9e3@nxp.com

Changes in v7:
- Add R-b from Sebin
- Drop __free usage per comment from Krzysztof in patch 3
- Link to v6: https://lore.kernel.org/linux-clk/20251128-clk-ssc-v6-2-v6-0-cfafdb5d6811@nxp.com/

Changes in v6:
- Add kunit build warning
- Update OEM string comparation per Sebin
- Link to v5: https://lore.kernel.org/linux-clk/20251009-clk-ssc-v5-1-v5-0-d6447d76171e@nxp.com/

Changes in v5:
- Per Stephen, export clk_hw_set_spread_spectrum, use enum for method,
  add const for set_spread_spectrum and rename clk_ss/conf to ss_conf.
- Per Sebin, Cristian, Sudeep, I added clk-scmi-oem.c to support vendor
  extensions.
- Link to v4: https://lore.kernel.org/arm-scmi/aNQPWO6pfA_3mmxf@redhat.com/T/#me81231bf286e2a8e4e00a68707ed1e525a2b4a3d

Changes in v4:
- Add R-b for patch 1 from Brian
- Drop unecessary change in patch 4 Per Brian
- Link to v3: https://lore.kernel.org/r/20250912-clk-ssc-version1-v3-0-fd1e07476ba1@nxp.com

Changes in v3:
- New patch 1 for dt-bindings per comment from Brian
  https://lore.kernel.org/all/aLeEFzXkPog_dt2B@x1/
  This might not be good to add a new dt-binding file in v3. But this is
  quite a simple file that just has four macros to encode modulation
  method. So hope this is fine for DT maintainers.
- Add Brain's R-b for patch 2
- New patch 3 to add Kunit test per Brain. Since Brain helped
  draft part of the code, I added Co-developed-by tag from Brain.
- Link to v2: https://lore.kernel.org/r/20250901-clk-ssc-version1-v2-0-1d0a486dffe6@nxp.com

Changes in v2:
- Simplify the code in patch 2 per Dan Carpenter and Brian Masney
- Rebased to next-20250829
- Link to v1: https://lore.kernel.org/r/20250812-clk-ssc-version1-v1-0-cef60f20d770@nxp.com

---
Peng Fan (6):
      dt-bindings: clock: Add spread spectrum definition
      clk: Introduce clk_hw_set_spread_spectrum
      clk: conf: Support assigned-clock-sscs
      clk: Add KUnit tests for assigned-clock-sscs
      clk: scmi: Introduce common header for SCMI clock interface
      clk: scmi: Add i.MX95 OEM extension support for SCMI clock driver

 drivers/clk/Makefile                               |   8 +-
 drivers/clk/clk-conf.c                             |  76 +++++++++++++
 drivers/clk/clk-scmi-oem.c                         | 108 ++++++++++++++++++
 drivers/clk/clk-scmi.c                             |  44 +++-----
 drivers/clk/clk-scmi.h                             |  51 +++++++++
 drivers/clk/clk.c                                  |  27 +++++
 drivers/clk/clk_test.c                             | 121 ++++++++++++++++++++-
 drivers/clk/kunit_clk_assigned_rates.h             |  10 ++
 drivers/clk/kunit_clk_assigned_rates_multiple.dtso |   6 +
 ...kunit_clk_assigned_rates_multiple_consumer.dtso |   6 +
 drivers/clk/kunit_clk_assigned_rates_one.dtso      |   3 +
 .../clk/kunit_clk_assigned_rates_one_consumer.dtso |   3 +
 .../clk/kunit_clk_assigned_rates_u64_multiple.dtso |   6 +
 ...t_clk_assigned_rates_u64_multiple_consumer.dtso |   6 +
 drivers/clk/kunit_clk_assigned_rates_u64_one.dtso  |   3 +
 .../kunit_clk_assigned_rates_u64_one_consumer.dtso |   3 +
 drivers/clk/kunit_clk_assigned_sscs_null.dtso      |  16 +++
 .../clk/kunit_clk_assigned_sscs_null_consumer.dtso |  20 ++++
 drivers/clk/kunit_clk_assigned_sscs_without.dtso   |  15 +++
 .../kunit_clk_assigned_sscs_without_consumer.dtso  |  19 ++++
 drivers/clk/kunit_clk_assigned_sscs_zero.dtso      |  12 ++
 .../clk/kunit_clk_assigned_sscs_zero_consumer.dtso |  16 +++
 include/dt-bindings/clock/clock.h                  |  14 +++
 include/linux/clk-provider.h                       |  31 ++++++
 24 files changed, 592 insertions(+), 32 deletions(-)
---
base-commit: 4095b5b3b22162df4bacade89b1814f774c5df42
change-id: 20251231-clk-ssc-v7-1-402dd4f9e629

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

