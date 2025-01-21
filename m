Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023113.outbound.protection.outlook.com [40.107.44.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA671459F7;
	Tue, 21 Jan 2025 02:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737427808; cv=fail; b=cJRlJrPpPd/9jENl3IEUhOKltowSinq/rPLFL+U4zFp1GtR/BCZE4wk/6YrSUOn7qOtnr8OpaxsDHB8Kisf7EMxnEFEVSIEgp1xUM1t8nzmVhDWbA3jQ+Jx4uwu8UD056fYycF5cPxuy4sVj/35IeNKni2iibVbYNmI0oVNJIc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737427808; c=relaxed/simple;
	bh=jWOxcPov6TibOSxUlcUpjIDEvdl+3iRU1hzrT0gpahI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pKrsnrsHfgSV+w5FLwZMQ6XGNPElejHKMzEGvekaD1HMFxLmJ7QsBhy4V67q3CsYtNJ57TvDELGCd5/wI/c+Ej2vxdo4kzqVQslJMHSGNOpqXOUIigr1PR7iBLHDuobQWiHsa92tKZP+JbzXV7dI5bwUaPBBXnXbD1RK8P9A6lw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=sCfeG+ZT; arc=fail smtp.client-ip=40.107.44.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="sCfeG+ZT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IDRANBkzjIlOzLCtB9mL9+VUDTkJjzC4tdY4t+9Na1JJ8kBZ3LAfohWYufWEtWYNaRrPiVO76qp83F4/6IZ2ihufp1fdZ6mDTB4dYDuUysjSzdCwL2LSSzOq2qY73UiQqqRDpDEcSCwb+lBP7Qfezfoz4c5nfC/EF5U+SbhEfcbk2x1V0hwQWz4HgtTbSV9P92timPmn5hyFrJUoM3KUMkVHwUZYgzNP6Bfv1KWVLiHgCrx9G4nBeT0T+n/+MVhT1WNmcDescMbF7uxbAnIi7aYeEf4t9stRrYhwVQCKU4I6C2BHn/6Sz0V/wigmrrF2nHcqUsu3Pl8oSYUDaJJnaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OM1fHNQjdeig9s+opZK+7X+6LbbyFxicS5Tq1FiSa9Q=;
 b=QPXEbn2SQ6U8i7W/RFXnW4uLOBJfWpG2icddPCROlBQZlsZzcg8D3DP1FnK9bneUPz94iN4CM8UFeB2V/SDfZVKVh+Rh04qwsVozPvXtda5C0mfCQqEkI8TVyw6XONVQorN22ET1Sf+BgRq7cnoYPGK/ArqVO3ZZ0eqzmTXUxIEx3mewHhZVPliG9CgPMen7cum2AsC3n1qyuYUpzzcFcA8GqhQNv3X5+o7vw+cve+hmxHm4LExW6yfKbQld1kHkXQg9dcluCwNGJzC1CwMA5WS+8svP6yrgebKnkGhuTfXfie74sRe5eXba7S7NMKse/v7E1+L8of5u7FEfyWtn9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OM1fHNQjdeig9s+opZK+7X+6LbbyFxicS5Tq1FiSa9Q=;
 b=sCfeG+ZTD+QgfkKI6KtJGva6A/mrcXvyrhmbA+pec+d/o8Q1HoaOnd8daX/epXlrSMkDq/FDUnK5wL5/LhslA73+Ef33YeHMEhTktJAfQQ2NeWjHez2u3JFieJD/Q32SXP+dDJTKFlK2NIjS2ONiP6CIoA5oijKK1YHAL0Ere3YW+JLE7CWRwwm12TTz0gJb+KlKqTum0FGJal6trg97hIASDEN++GfvcvBxFE2ced9AYY3zV8CMYSYvgUOqs0KkGSTWuvKsfkShqQzRM9HlpJPsD9nZrMbh/uJ+JX7n0wFjRu/IsGLlwzzDIWDx+Cq6Mb0gcFjwdAbqV1iZtTX02Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by TYZPR03MB8192.apcprd03.prod.outlook.com (2603:1096:405:26::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.17; Tue, 21 Jan
 2025 02:50:02 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca%4]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 02:50:02 +0000
Message-ID: <3472d255-be08-4c6c-a1fa-7fba19c571ab@amlogic.com>
Date: Tue, 21 Jan 2025 10:49:50 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] clk: amlogic: s4: remove unused data
To: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250120-amlogic-clk-drop-clk-regmap-tables-v3-0-126244146947@baylibre.com>
 <20250120-amlogic-clk-drop-clk-regmap-tables-v3-4-126244146947@baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20250120-amlogic-clk-drop-clk-regmap-tables-v3-4-126244146947@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0129.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::33) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|TYZPR03MB8192:EE_
X-MS-Office365-Filtering-Correlation-Id: 4865b4b5-551d-48ef-80aa-08dd39c64d93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M2xQNGxFcm5WWEpYSFNnSUJkSVZ5THVoQzNPRnJlYWxYc1hiYzBKb09CTGkv?=
 =?utf-8?B?S1VKVVNRUC84UVN4bGtWTmNCT0xhRjFDY3pYQjFLcmwwSDlWSExzODgvS21H?=
 =?utf-8?B?Q1FmZVhJWGdCdnBtYk1vZitTR1c3ZjY2VWxrMmVMMkVOVElsekF6aUg1OEJo?=
 =?utf-8?B?UHVGTDlvbStQSTVUbC9JQVdEYkJXVzBEbWV6QWowL2Q1VldCZFNHYXZqOGV2?=
 =?utf-8?B?OHc4MUw5MmVIR1JlY2NzZHJkL3JFMnYwU0tyQTNzRWFoME1mcm5YUWVFdEdC?=
 =?utf-8?B?YVY1TytzL240Y1BhQWcrRlRia2hHVTdTWFZTZDd3YlJ5NmhjZkltOHAyTkND?=
 =?utf-8?B?UXlCNi9uYkpJSnpWYTF1RWJFT1FyV2k0amxyenMwVEMyN05meGJiZ0pJdXlN?=
 =?utf-8?B?WCswcGlPMVI1VmE2WGdoQnJHdTJGTkhJU2pRTXFuV3pyaXJIRmwrVTgzcWc3?=
 =?utf-8?B?aGtGdnQ5TitRYjN6VUgxMjdYVzRZNzNBUFB6TVJzNTNuQjRIZS9GWkRheXJs?=
 =?utf-8?B?a3RkUHFXZ0grQUpXZ0UxamFaMDZWZmwzYnp2cGdaK2JBWVJlU00vMVc5UG14?=
 =?utf-8?B?cU1XWSt2QmRrbDlmZDNOWmJQbVkrZ2Q3VFdhRWh5TE4ySFo2MTlWR0grcEc1?=
 =?utf-8?B?bzhlZ3psNXYyblAwZ2ZqelB1U01lVThDcEtqZUJlOGkrMXFFVXhVRnBtbHg4?=
 =?utf-8?B?NFdmSThtVWczZVBZakxPR0dBRk9tVXNXNHNrY05TZVlOWmk5SDd4d1kxTUg2?=
 =?utf-8?B?emlYUTJaMlhOU1krS0MwQ3YrUGpFUzdnRjNMQ3d1MW9hRXRnMGxjTGY4VDFi?=
 =?utf-8?B?UmVteEVVUGJ2eVZmdVRuaWtnZGpmcDZWMHltYy8zMnhJTVFreXFManhCVi9Y?=
 =?utf-8?B?eTBldDhOK09mTGEyWmwxT2RtempHN0htcjB1elZpcHZ6NlN0VmJPZ29LS1Jw?=
 =?utf-8?B?ZGNmenhOL3FhZ0h2N0l1M0tOK0x3QnZBZHNIZllCQkQ2bGhqSitpSjN1MGEz?=
 =?utf-8?B?QkpwZUR2WFcybVZzVUVXdWtydHlOVFhZQVBxUDBodW5CeE14dytXZWZWNnlD?=
 =?utf-8?B?MkE1K1c0R3djUFQ2aG92QjVqTko4eWo1V0tnWjBpdU9oZWU1dXlUMmtnOUpk?=
 =?utf-8?B?UjdmSnlSdG5CL01lOGMreXcvUUcwTlIvUUdsSGZBNWJtR0Zlc0toMmxMejNU?=
 =?utf-8?B?T0tRSjArRm9GUGxuL2w5a3BGUXBSZW5CdlpoQnlmYXpaUzlMSzhGVXRIdzV3?=
 =?utf-8?B?andFbmtjRENpUzRoZUM2c1dUQThacmpaK21Jd1V1RjA1RWV6eVFmaDVtU1FM?=
 =?utf-8?B?dVQ2TmwwRnk3bDB4UnpqaUI5bi96S1lsRFdpRVluSUVqdDdEZnBqNlg2eDVY?=
 =?utf-8?B?eWNkWHBhUTZ5UHVmT1lTSVVyNUI5Ni9lVlFqWEh4eDdnQVpyNjFRRjFPTHlJ?=
 =?utf-8?B?YXMwUHdmVHhhVjJlT1g0ZFA4aUxNQ0dTY0poWEFieUxTM0xaTXNybnJhNVdq?=
 =?utf-8?B?MDBEMmdWbU1uNEN5NkEwdFVRWGw3RTQ1dnhVTjZHUU9ud05kZkVmZG1RbGc4?=
 =?utf-8?B?R2lGNWdKOUtJZFAxT1IxdjV0Rkw1eVdRMVlRdW55eHBlejVURFI2SWVObDRI?=
 =?utf-8?B?cXBQNkxnRUVlSVkxQ0toR2VENmVvRE5YK1VpTkdTUmd3Z0Zqc3AyNzdxSWJy?=
 =?utf-8?B?M1VmKzhHZDFqS2o5U0FocmkwVkJ6RzI0Vkd4anc5UzRvYk5wejZ2SC9JbGpF?=
 =?utf-8?B?VWY5Y0hsaUlJUWN2TmlIZUdTOTkvalh2cXIvL0lsTC95bklHTFc4UWZudFZ3?=
 =?utf-8?B?QXB6dWJoaGN5QXBrQzBBUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0NDU1dkRWdRNHpCODlEaXZkSDBrL3VxdDdZTGt3Q3ZaKzU2NzVORVExMm1m?=
 =?utf-8?B?S1ZIM2ttQ1hoaFJXV2MxK2hRMHlldTBFYWEySXVOb2tVWUdTWlNTa09DTVJj?=
 =?utf-8?B?ZGZWSGptWDV5dmZVMTBlT09DZEgxVkFIc201dVcyOTJPTE9rMWZWeGZZNGta?=
 =?utf-8?B?Z0h2bFkzNXhNZSt5OGJKdktlSjkyYXVNczdFWSthQU9tNWNQZm1Obzg5Lzdp?=
 =?utf-8?B?a0YyOFhMYUhzZGo5YzUwQW1UcDFPL3UzdmErRVNGYWNzV1ZlbFYxVFF2eHlh?=
 =?utf-8?B?aE1nRmkyengvOXpKN0NydWx2ZCtJSXJQbXNJb0lSaWREN1ZuK08zZVdGbVNT?=
 =?utf-8?B?WnpWTlBDbEV3WW1NNzlJdDhOQW1HdlljUXN3djV4RVRRejgrSWFacUNzK0JI?=
 =?utf-8?B?ZTFBOFJPM2tBVVZ4L0gzNm5kTFBKZzEyT3dNZkQzcHdwTHNLU2lVaUp0QjJT?=
 =?utf-8?B?STFmdTNWY3cvUnJlRkY3UnM1VnRyTVVUd3lKOWNGME9BbmtGekF3cjR5N3Qy?=
 =?utf-8?B?Y0F3bGpib0tOaDZjWHZ2RnUxWUFIT1B0NTUyVGRTSzU2Nm5SL2Z3N2ZLUm5l?=
 =?utf-8?B?MFRZbFJ0WXgvSHJPVVUyc2I1MDRwQ1ZBN3ZmdHRIQ0QrME9pQlN4VEFma0pV?=
 =?utf-8?B?bEplU0J6YU83dXlmN3hpdFJZcVdFMSt1OEhKdklyRU8wUDN0ZWJYQ1hqbmNr?=
 =?utf-8?B?UVNvT0F0UVRSc0IrczBaU2Qvd0lyK0h2alpxRHNhSVBmSlZXWERPSXE5QlBD?=
 =?utf-8?B?a2kyVStFYTVaelV1ZmxubVpNRkVST3hTdGlWUE96UGRINndVblpWb25BQVJn?=
 =?utf-8?B?NFV4M2lvREVNVVdCOEUzTEZ1ajQ5N2dVQVZBNzV4K1NzVzlqT2VYQndTMkIr?=
 =?utf-8?B?Y1U2c3l4NmZDNUJzbldkMlBKZmJhTytJdkN0QVUySXp5Nko1WnlDVkgzd2Jq?=
 =?utf-8?B?QmpRSDVyWkxoWUxFcTJsTFJLNzhrYUY1UVMwVUY4b3g5QzhPZmhUbmlTU0NY?=
 =?utf-8?B?a3R1OWp0cmt2K2lLdmtHbmJYYWJ6ZlczY2xDaTdFNXdwSmtMbUhkczFpY29W?=
 =?utf-8?B?SGpHc0Z1ZCszUFdrZmNiUWp4bU1rOVcvdkNEYXpFSitSc0cyY21vSVZ3aHVq?=
 =?utf-8?B?T3RlbVpNS2pHWThxbkJVZXpvZzBFTU5CQnVGVzlNeDN6WUluR1ZDY0Y5U2Vh?=
 =?utf-8?B?Z0drZTBxVEVlRHVHRFNLYjF2dzFkOFJkczlHOExTUGhTYXlPY2l2NWh4WWFY?=
 =?utf-8?B?MitrYW5IN0gzTnJCRlFsMWZBZ3BrVW83UVF6YmhnZEVOOUJUenNvQ3BRY0Jm?=
 =?utf-8?B?Rk5PaTIxWjhZMXlET3JYa0t0ditldDlzM2lIVkZCamtscmwzYUJ3ZkI0VnZ2?=
 =?utf-8?B?enQ3VDJ5NUNTUCtMUGlacnBEcFcwQ0krZ3MwNVlzeGFNZDk3em1rcWp0emhy?=
 =?utf-8?B?OVNNSWZYQWM3L2lVV3VCYjArYkFQVFBEcFBRNWZwbFN2WDgwVEhCVXFGMEpj?=
 =?utf-8?B?cStiSkF2SktMeXdsWjF2MWZObkJSK0lpNHpkdnc3ZExncFRCUjBXT2IxVGl5?=
 =?utf-8?B?OWJSaSt0T0dBL2c2b3pVaGN2WDBlblRhRU80b0Uwc2YwRXgzRHNvNjNGejVE?=
 =?utf-8?B?TjFNeGVlOUhST0NNTU1xR2JxMFNraEpHNlJoTVdTMTUzbllJcDBNZjF5RjVO?=
 =?utf-8?B?cWZFdko2TlBza0JsQnBjelR6K2pBVGRyZ3BvU0h0Y1FHR084L3V5cmFsU2hL?=
 =?utf-8?B?VnRPM0tiRlJLeWoxTFc3UGJrck1hZ2NIVmJVR0ZSQXY2bXFzWGpUNmUyeVNv?=
 =?utf-8?B?S3FRNlNHWUlUYzhsNEdleStqNG8vODNpMmJMekxsSUhud0d6VzRBblpka0k0?=
 =?utf-8?B?dkNLUmxocFZnSURnTU5jUE9SR0N6N2VqdVIvQm15M20waEVIbDFIUUJ6OEo2?=
 =?utf-8?B?WnRxd1BlbGxtdEJubE4yTHcrSHpncVY2TjdDOGxUVHN0NzdwYjhVOUl2RXYy?=
 =?utf-8?B?VmRhK1VpOG50T0YvRnord0o1Y25hODlza2hqYWhrRVcxc2RHQmdsOUROMHli?=
 =?utf-8?B?NloybHlmcnM5WlhGbDlCbkgzRkl0RGREdDV3emFTK2ppaGZwcTJQSFBQK1lj?=
 =?utf-8?Q?fUBG/moI9BF/yaV1BHfp2qrkt?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4865b4b5-551d-48ef-80aa-08dd39c64d93
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 02:50:02.6253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CxscjL5irtup1GE3QHalniiDoudoR/XFs7NbMYwpQ0LrSNhy7UNJ1GbRCaQOy/MgH7VmuwuYBQkMAFU5/UOKJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8192

Reviewed-by: Chuan Liu <chuan.liu@amlogic.com>

On 1/21/2025 1:15 AM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> Following the removal of the clk_regmap clock table from the s4-peripherals
> clock controller driver, it appears some clocks are unused, which means
> these are not exported or even registered.
>
> In all likelihood, these clocks have not been tested. Remove the unused
> clocks for now. These can added back later when they have been properly
> tested.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/clk/meson/s4-peripherals.c | 112 -------------------------------------
>   1 file changed, 112 deletions(-)
>
> diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
> index 6a736e32e0ed8e2e8a37fbea94f9c5a90ea95fa6..853053b5f0689399a0224d263c30a985df6e1652 100644
> --- a/drivers/clk/meson/s4-peripherals.c
> +++ b/drivers/clk/meson/s4-peripherals.c
> @@ -3129,118 +3129,6 @@ static struct clk_regmap s4_gen_clk = {
>          },
>   };
>
> -static const struct clk_parent_data s4_adc_extclk_in_parent_data[]  = {
> -       { .fw_name = "xtal", },
> -       { .fw_name = "fclk_div4", },
> -       { .fw_name = "fclk_div3", },
> -       { .fw_name = "fclk_div5", },
> -       { .fw_name = "fclk_div7", },
> -       { .fw_name = "mpll2", },
> -       { .fw_name = "gp0_pll", },
> -       { .fw_name = "hifi_pll", },
> -};
> -
> -static struct clk_regmap s4_adc_extclk_in_mux = {
> -       .data = &(struct clk_regmap_mux_data) {
> -               .offset = CLKCTRL_DEMOD_CLK_CTRL,
> -               .mask = 0x7,
> -               .shift = 25,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "adc_extclk_in_mux",
> -               .ops = &clk_regmap_mux_ops,
> -               .parent_data = s4_adc_extclk_in_parent_data,
> -               .num_parents = ARRAY_SIZE(s4_adc_extclk_in_parent_data),
> -               .flags = 0,
> -       },
> -};
> -
> -static struct clk_regmap s4_adc_extclk_in_div = {
> -       .data = &(struct clk_regmap_div_data) {
> -               .offset = CLKCTRL_DEMOD_CLK_CTRL,
> -               .shift = 16,
> -               .width = 7,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "adc_extclk_in_div",
> -               .ops = &clk_regmap_divider_ops,
> -               .parent_hws = (const struct clk_hw *[]) {
> -                       &s4_adc_extclk_in_mux.hw
> -               },
> -               .num_parents = 1,
> -               .flags = CLK_SET_RATE_PARENT,
> -       },
> -};
> -
> -static struct clk_regmap s4_adc_extclk_in_gate = {
> -       .data = &(struct clk_regmap_gate_data) {
> -               .offset = CLKCTRL_DEMOD_CLK_CTRL,
> -               .bit_idx = 24,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "adc_extclk_in",
> -               .ops = &clk_regmap_gate_ops,
> -               .parent_hws = (const struct clk_hw *[]) {
> -                       &s4_adc_extclk_in_div.hw
> -               },
> -               .num_parents = 1,
> -               .flags = CLK_SET_RATE_PARENT,
> -       },
> -};
> -
> -static struct clk_regmap s4_demod_core_clk_mux = {
> -       .data = &(struct clk_regmap_mux_data) {
> -               .offset = CLKCTRL_DEMOD_CLK_CTRL,
> -               .mask = 0x3,
> -               .shift = 9,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "demod_core_clk_mux",
> -               .ops = &clk_regmap_mux_ops,
> -               .parent_data = (const struct clk_parent_data []) {
> -                       { .fw_name = "xtal", },
> -                       { .fw_name = "fclk_div7", },
> -                       { .fw_name = "fclk_div4", },
> -                       { .hw = &s4_adc_extclk_in_gate.hw }
> -               },
> -               .num_parents = 4,
> -               .flags = CLK_SET_RATE_PARENT,
> -       },
> -};
> -
> -static struct clk_regmap s4_demod_core_clk_div = {
> -       .data = &(struct clk_regmap_div_data) {
> -               .offset = CLKCTRL_DEMOD_CLK_CTRL,
> -               .shift = 0,
> -               .width = 7,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "demod_core_clk_div",
> -               .ops = &clk_regmap_divider_ops,
> -               .parent_hws = (const struct clk_hw *[]) {
> -                       &s4_demod_core_clk_mux.hw
> -               },
> -               .num_parents = 1,
> -               .flags = CLK_SET_RATE_PARENT,
> -       },
> -};
> -
> -static struct clk_regmap s4_demod_core_clk_gate = {
> -       .data = &(struct clk_regmap_gate_data) {
> -               .offset = CLKCTRL_DEMOD_CLK_CTRL,
> -               .bit_idx = 8,
> -       },
> -       .hw.init = &(struct clk_init_data){
> -               .name = "demod_core_clk",
> -               .ops = &clk_regmap_gate_ops,
> -               .parent_hws = (const struct clk_hw *[]) {
> -                       &s4_demod_core_clk_div.hw
> -               },
> -               .num_parents = 1,
> -               .flags = CLK_SET_RATE_PARENT,
> -       },
> -};
> -
>   #define MESON_GATE(_name, _reg, _bit) \
>          MESON_PCLK(_name, _reg, _bit, &s4_sys_clk.hw)
>
>
> --
> 2.45.2
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
