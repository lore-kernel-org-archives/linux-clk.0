Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011028.outbound.protection.outlook.com [40.107.130.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FA8319843;
	Wed, 31 Dec 2025 10:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767175996; cv=fail; b=fA6uSke9LNb2d9+Ph1RVus6bEHtxPKsHdgcjwX2DKE6vw9AKnkBIXD00OBJbcTz9vyzXlgl9ScIEJnIQ/EHlLIn/Z0TeUmTfvYwcxo+RjkYQaCd3yG+SnL6XyfWKuVaBoBB0UbushdJXwCzG9Q7Opi9b9ur7R48lD4BX0qyjICQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767175996; c=relaxed/simple;
	bh=kB67TSZuuzJRePjr5iRMHorjYhW6k5fZVtwVqIMqJ/s=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=HgkXmqdaTD15fn9ugmHf8qwj2EMJbnaPJPFQdS3WbXPFUzaA/78/GNFZgiAshEpkH3YxHe/ADPIvaRQVhrFiXb9n7F52N0znYH5+xtudg/jmlwUUVn7F8g2DYnWRGVpT2OFQCqXBn3eaIQ+LOXsu1dQjIcltCCazotHMPX+3iRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FtRYnP+z; arc=fail smtp.client-ip=40.107.130.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FtRYnP+z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B/KhOELCu2MsksUXG4pzJuosUZGP+M+6GRf2rE/wJ0UEOJMYJtcTz3UpAD73jBg5lQiiJ2Wuf5bW19I/O/AjJvdr3I5gAx3kHHA0EOdEc0MvcSGP6EyBdKaoCyVlGFj4c83wjlCDWRHwpsBYnJtRMFnKNpg/r5wALKmeSEHIFF+78te57OtU3D3ZZuiFY9657hcwSc2u0V8LM1dNT/TyQVazY/ICPVJx4YtNLhLqeL27hN/aIdp/to/P3sI3n+7Sp3aVpWJxfv4LSy4WkSi0fyRM7/V9ob9FrG9SOb7VcOSa0yGiMtJsj0qNaPwfvoXteZn4avPTimDNA6G+8+xNIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i81970+vom462uS8tYxGtC3GoDOTN13DPzoZMDqz77c=;
 b=sJnDK9wk7JRoA1bFcNtEuygkRztZ4aDbvEXz/6khWzetidjPAMh2BtPDfALOgg5D5xtR1Fruttf3FDOFdeiHX3CIsbLZ2j5rl1ZJnXDjG4p3wXUSTftakRdWXuuwz2JpQ4HomgAHkPjqCr/iL7SIj8KMIc+7rWvhhb0zR9j7hTX+AZi+rBltTlwIgECfB5BZBTtSvVLOuafSIyyRPqBq0yexcU4qdVVPZDda0VNVspec6yDkHlkMLvQYrytOpZqUxbMlOj2Zda5+lu9O7U/7gllwrzNwfCW1qwTCT9tc7+PgptLgfsEbGgrvKQ0q2QSooz2L/eWNgpEwRCLfkFY0uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i81970+vom462uS8tYxGtC3GoDOTN13DPzoZMDqz77c=;
 b=FtRYnP+zf7XMWUIylM57xZ+H3beE3jU3Gt9aew/BtVs9nzuhwal58eHGyQKdu+crhjZi/Wf2KAkife4H8BBr3i42eDKYxByREbXgP6H5QCAe2gcekj86buyNZRT8bNZHGLV505m7zl2Rl82iLfP4DSZFWPEwMV2S4f0H1Yoo0hF2D0oUe/WoyP0Tc5H+tfOWPQzmVeSjYsi4RgsAlNw4Vyg9xg4mDMl230mzEm1kYRfz1+wb3sYSqCQhMRHvrFdDXgTj4tSsWMXWQ5fnjKV/f0cWV5mDPck5uB5VFCxKJSLckW1eGkfaX3baTuJVCFUxJ+kbgWKrL1w3goRUprJJZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB9879.eurprd04.prod.outlook.com (2603:10a6:150:11c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 10:13:08 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 10:13:08 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v7 0/6] clk: Support spread spectrum and use it in clk-scmi
Date: Wed, 31 Dec 2025 18:12:47 +0800
Message-Id: <20251231-clk-ssc-v7-1-v7-0-380e8b58f9e3@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAB/3VGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyzHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI2ND3eScbN3i4mTdMnNdQ10TA6OUFJM0y1QzI0sloJaCotS0zAqwcdG
 xtbUAK8ib714AAAA=
X-Change-ID: 20251231-clk-ssc-v7-1-402dd4f9e629
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
X-ClientProxiedBy: SI1PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB9879:EE_
X-MS-Office365-Filtering-Correlation-Id: c5d06fbb-72fc-4867-0293-08de4855321f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YlpKOXNLZDQxRlZVYXdkSVhRNkorbVJqVWtJN3VPaGF4cXhCVy9CWXJ5SU0r?=
 =?utf-8?B?ZlR0NUZ2eEtIM0c3MGdpbEdOOEsxNDRTUDB0ZmNrQVpqbzArV1pTZkdVZU5Y?=
 =?utf-8?B?MWxjNFFkMmRGQzhUaXZXbHpwL0RqSzhraWZjT3RkYVNXdS9wSU9oSlUvc0dW?=
 =?utf-8?B?djVCU2U4RERIcUxwNFhuVjFsVjJ5S1ZMZDZqbWNCYzBuVmtRQThjL2Zsanor?=
 =?utf-8?B?ZXZUNjlDdkIyYy9rYm5qY1JpN1ZzS0xqb3Y4ZDV2KytTaHh5STllYS9XL2JV?=
 =?utf-8?B?b205RUI4SXdpeHh5NU5ublpmRW9BNVdReDdyeU02WkFHZXA0WEhwa0F1REtr?=
 =?utf-8?B?b08vdGhOMnRSQkM0dnlwNDV0SWhpbUlXTGVIQ0tSS2dNUFhFNlc2TWdna3Ja?=
 =?utf-8?B?bmRnNHlaL0VCRVZlU1lZM1ZYU2cyVG1tT2ZnRlM3VjFpWXd1N3pleFBJUE02?=
 =?utf-8?B?V0Q2T0FoS2I4bFlXT1lSems0SFk0S1ZPTjA0K2VFK2pMYytRWXJhVWtPTy9p?=
 =?utf-8?B?VXNMUllmSkZPM3loV0gwRkFDRVhIcjh3dWNtbmdyeVhkSExZV0o0RjJSMHcz?=
 =?utf-8?B?MnNBUzlyOUQrNDlLUVI4U043U01UeU9MQ29rZkxzKy92SkRNS0ZZQndpeWlX?=
 =?utf-8?B?UzhjWFh2Y3hRbzNTWHN1cnJBN1Z0cFlhSlJPOWZzMUJDY3lrU0s2a0dHUkw5?=
 =?utf-8?B?TzFFNTdiUGlzUVQxeVBiMlNYVk8wUk9RSjc2NmNLN2prb21vR0xKNjVadjRH?=
 =?utf-8?B?MituL0VlUEU4NVFFZ0hUUUdSUXlyRzMzaXc5aWxoN280ZHU1eXJqMHBSZmN4?=
 =?utf-8?B?SXZSbEdyUjVNMlE0ZGVvVE9UWHl5SFFoemJ4RFM1MzhTcTlITStSdHFHOUtv?=
 =?utf-8?B?U2M0YzN4WTZ5ME5PVFVHWU9BK1Q5dThjNmtvbXF5R2pXVG9aWDJuTXhqRmtS?=
 =?utf-8?B?aEZucVY4d0dGL0J0MW16amJhaXJUOHpOYkliMnZzTDJ3R0NpOTF4dGhDN3Zw?=
 =?utf-8?B?STI3OXBkRngzRnM4U2RpVU16UnBiWnppNjlBV3BSeGJDYzEreCt1b2pSOER2?=
 =?utf-8?B?aHptL0Jnb1BEN3FnVlZqZkJTenkzbml3MFNSNXA0UmhQYnYxYkg1UFFSeUFj?=
 =?utf-8?B?YW9UeTFVRXl1STBaOHJ6bHgwaTVyamhCV2JhRmhicGlZSXlyNHdXTmdGMk82?=
 =?utf-8?B?YWhEMzhxdHZUTEVRLzRENWhLN1NZWXllU2dKRmNnM2FuRHBtNzdMTGFwWnVC?=
 =?utf-8?B?alRock1ZOFJtdVdJSGJoQllNMVRKL1BXS0ZXTUFkdWp0ZUl6azFDOFF5eTRj?=
 =?utf-8?B?ZmF4cUlMdTZGQk40bDNraHRvUzk5Nm1hQ3M4K3pHV3BEbmY0K2hENUZSaE1S?=
 =?utf-8?B?LzdpNlFsbkg2T0cwQnFOSjBXWXVjQnAxYnVzMDRLOTkyOVArcFJ3WmpOT00w?=
 =?utf-8?B?VjgzTkM0N0EyWStHNjlQR3gvTFBxL2sxeTAwbjIzdFl4Mjc0ZGU1Vk1Na3JX?=
 =?utf-8?B?b256blAwOGUwUHV6aS84WjlxMitlVDNVSEhRK0c0dUlSV090anRrZEkvcFUy?=
 =?utf-8?B?R1U2ZStVL0VTSXFUZGxHL29wN2JndmFrSVZpSlM1eDRtZ1BXUWxnQ253Sm50?=
 =?utf-8?B?OG1RZ1k4dXRhODBicUgzUUMvVUVRbHc5TG9YejRwbEpsSTNlejNncUNocmcw?=
 =?utf-8?B?d2dybUQzZHcyNXBObGZYTVkwRlNEcmgvMFZmWjFSWkxJOWI0YUhvRmk0a0sz?=
 =?utf-8?B?OHgycEJldEl3Z21Ba0I3UlpPVEFLUTNkOERPc0VjT0lUUnkrODEwajhqUm83?=
 =?utf-8?B?bUhUSG5RWXprYmJkT21CY3JiL0FKc21JQTdpdzAzdjdCeDkzT2Q4ODJRRkh6?=
 =?utf-8?B?LzI0UUtsZ0FRbEtncGZoanRtTHZpcWYzaGc3cjMwclpWZk9ra2VEUzcwbDBn?=
 =?utf-8?B?b0c4cG1yTVJHekJvT0M3cDRZZW40NEI1dG1mK0NNdDRSbytWZzd6UUU4U2Zh?=
 =?utf-8?B?K2JDL2JsMG5BbHlJZDYxR1Q5VWJrdWdXVi9FS2VQZ3d5QzlueDFubHdha2ly?=
 =?utf-8?B?eE11clU5ZTFKNk9uTGZnZ1JLemltb1l0WDBpQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjlPR2xNenJicHluQWdpUzVEYXEzTEpOcy9jb1hBZlR6OENKZi9Wd01iVy9G?=
 =?utf-8?B?Z3NxSlc3b21IeTdZSHJiR1ZzVGZCanFPaEd1b29qVHhwRmZRWisxaWZaY2xx?=
 =?utf-8?B?eTROTzJWUmVIWW5xbGdkY1NJUXpVWTRlRldCcWRoVkVIeHE5Y0pwdW9SQU9Q?=
 =?utf-8?B?VGhkVnVqN0hZMDdnaStaZUlZWVF1UHNEM2FVYTBYWVhla3JuakdXREJTcGk3?=
 =?utf-8?B?dUJEK0QyOWhKTnFSdWJmVU9HSWhSQy9tWktwUHByTjRBZEFtb3o1VmozbnNa?=
 =?utf-8?B?cnhtSmVCVEtjOXJyZVFEM28xY0ZXUW9CRHNvd3U2YURML05HejFYV1kwQ09S?=
 =?utf-8?B?SHlkZDB4RlNrM3pvVW1jZm03T2k4RHdnbURPbSt6NEo1NW4zdEpIVUJUV2xk?=
 =?utf-8?B?OTBiQWlGZ25MUWtIZm9NYUthQ3dRQjN3VFgzYWFqUEtGZDRMWktreDJEakhO?=
 =?utf-8?B?cnJsOEtZdVVZQy9lYWFuMDhmdGZUU3NEODM3YmV4TElaZGZLc1BUNHZ5dmZD?=
 =?utf-8?B?U29tNHRVNjZYeFdtakxveTVaQ2lFWVdjYUwvNklYeUVUeWI3SkxOVVZkNDFH?=
 =?utf-8?B?WWZuNEZrRlJqemVKR0xXNWt0amVTSTFVNUdzbjJzSlhxVUJMdTN6VjRVLy9C?=
 =?utf-8?B?OG4zUXlLL0RUREJneUxObXA5RmNadjg3Y1dWZHJIMmV1RTV4SUpoRHR3bGk5?=
 =?utf-8?B?akNuMGFWTWh5MnhwcC9RVktGRHZ3YnZGQVlmNnN3czhBcnd4RjlBbXNnVTJV?=
 =?utf-8?B?NHlxZHVqdTBScVVnWDNoeEhySDI1eC9iZFZoNnNGcjh5V2xtcWNpNnQwNFh0?=
 =?utf-8?B?eDVSb2oxUVd0bGtHeFpLV1ludmZvNVROZzFtMENKdVFsVzBTZFgrNTZBSFRZ?=
 =?utf-8?B?RXR0Zk9pakY5cFFCV29CeG9rRmVRS3NOd0dkNkV5Z2JpRWhMbldzN1B4R0o0?=
 =?utf-8?B?a3ROK3BkSTRvQStWRVNqa2cyMlJZNlhFa0czd3BYNSs1V01rMC9sTENZUXp4?=
 =?utf-8?B?NVN2cXhnajZOU2RDY25kMHB2cXJDOFprOGd3d1ZyenVwRGc0MTZMSkRNYnVR?=
 =?utf-8?B?M1lxeFVUbkd2WHRUV3dGUzBKdmdER2ZqM002SGJYWWtuK01DaS9Ha1lUOGdw?=
 =?utf-8?B?bTg5Y0ZCZXBKQjFBazFITStHam14RHRKMHFJYWVnZ2ZhN3BSckhLdU1weVZw?=
 =?utf-8?B?NmdrK1dxR1o5S2xuRmhKcXArVW9zSVBnVmw4ZmlpNlYwQXQ1N1RiQTF6a0hi?=
 =?utf-8?B?VkR6dzV6VzZJNjQ3UldwaWRJdWo5N3RqVjkvYWZ5TFROem04OUN3aEtwZURL?=
 =?utf-8?B?Ni9VSHFEc00weWg1SlptMm5TVkgrZS84czRaUzkwbk5YSEZMRHNVc2pOZXpF?=
 =?utf-8?B?ZUNGeHRGL2syQTZ6b2EwWGhUZURJS1VHTzNjSURseWF0MWJyTHp6dEFlY0RM?=
 =?utf-8?B?cXpBbFphcDl1Vm4vQzNvSzRoR0NYV0tpTGVSL0xtWHlvUnVUVjhUbDVyTzVZ?=
 =?utf-8?B?OXl1RTFRdmRpUDIxQ3ZrZlJOWW56MTRJZnJtSkhNbmFxRUZtWllNckJCMUxr?=
 =?utf-8?B?VFFjN0xackNCMEptRUxHN2RpS3J1Y2lna09naVdZeEpHa0UzLzZrTVVRRDZ3?=
 =?utf-8?B?MEU5bUp3WGJvUmtiTjVLUk5QU1NHWEZza0NvWG5QYmJubTRuU2ZGMlF5WGUx?=
 =?utf-8?B?VENXQkF1ek8yNW1IUmNBV0VkYlR5RzgxcjVQUHZZUnVRN1U2dk51WitPcUZ5?=
 =?utf-8?B?MldpUVJLSEIrZjErMGFmcXZZZkcwZDAyUGlIRVU2Ri8wVUY2cjZ5UWpmMENw?=
 =?utf-8?B?Y2tnMnZZaHdpVHUvRnBMZlNUYTJNZjJCT0N4OUdxbW9JSjZ0TWo3WFdqcVVH?=
 =?utf-8?B?R284bXVlY0duWUJEcEIxaEZmbmhOcStDQTZEaUZ0aStNZTE3RVUraGdFeTlH?=
 =?utf-8?B?MWEvalJJWWM3aHg0b2p5N2RvMy9UcGtFK3AxZTJnZjI3blV4NVh1NURkeE9w?=
 =?utf-8?B?Y05hNlpqTUtmSHBYdllYV1pwcFBBOXFsUTUvcS8zZll2YzM5MGZoTmVSN3hn?=
 =?utf-8?B?elBrRXZTQW0zN3VwNjgxSFZnTXJaR3haWEVKN1JMNWhDbVhubm50UDQxSUJM?=
 =?utf-8?B?cDdlM201ZGpWNXJZSyt5VGdlZG5FNWliVFJJc3JRN2txN254RWp3ZWp2c0xr?=
 =?utf-8?B?akcyUUE1cEZxVDB1UzdQMzZkVEdFZERUTldLV3FWYjRaUmN4WXI1SHpyRHBh?=
 =?utf-8?B?cjdhOXV0djBDb0VtQUFERnVMZkNFVUdRek1YajJMWDZjdlBXNlA0aUFZT2ZG?=
 =?utf-8?B?T1ZFQjRWQ1NGNnBhRDFuMnc5eE90bXplQ2g0OGh0K3R1L1h6aUQ1Zz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d06fbb-72fc-4867-0293-08de4855321f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 10:13:08.6377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aii/OjK27TjGPv0rOMInSolOuHUAxc3lON/RRADJiKMre9Sd4w+lHUzThutJiObg6bxcVqhM0dWdkqT+I5/EsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9879

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
 drivers/clk/clk-conf.c                             |  75 +++++++++++++
 drivers/clk/clk-scmi-oem.c                         | 103 ++++++++++++++++++
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
 24 files changed, 586 insertions(+), 32 deletions(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251231-clk-ssc-v7-1-402dd4f9e629

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

