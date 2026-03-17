Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013032.outbound.protection.outlook.com [52.101.83.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3BE3C73FA;
	Tue, 17 Mar 2026 12:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773752380; cv=fail; b=AcLkPcn3srZkgNYzFJ/389gTifike1xpOxED0R7LMzqNL7wl49s8WrpPr2p4cCfHWbVyQN4BHFOABH6GPZh9OH7fbFPJ3jC0/rXov4ruRLe928Ure67tD7H8oifFsYd+SaTMVkQRaB3UTf5r6D9tKnBxP8c2TLpbn6NB1+kCMkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773752380; c=relaxed/simple;
	bh=M2b1jf12SvCsNKbgE7Y7As90SdF1Psrv2L3rnWsyMIg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=u9ZI3g22RbpeI2PVOG54CdRkw2R3jDyAzp1k48uwMNZerfk7pYhtAE0LdDfTELzxN1IfeRMwGuBQccbYjZVbGukMWhu+PG8k07rI+vxDC7hMz4fJCjgIVp+b7K4YQfAm/EUFd6tbGU0WaLd0nvqZZ0apjKh4aiinxSyl5M4OvAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DCBM7R9p; arc=fail smtp.client-ip=52.101.83.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DCBM7R9p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E3HIokBLfPa2Z6vwGl8bAy3R6duCEMD04T0EBoSstOnZUixe8zmgR2LyGZP48srg7m/icAX3n+S6Y21fuZ9pmxDDaZYuoXdkSdznyC7VOrRsFuamqgP75vlKrowJWQmQFCooPLjD3L5DlFVZhBWeBPkHuXj6JiPNuMcn63qLyRi4RVvPu1DcGaNXwfbKMDEtNfWy/xET1xeQbE/cpKhnJMwqDL4WvmcmzUYBWUwPHMt7XfVuHZz/oq1900i89TTiIZDgHOHA5eZlPRKZIcNIDyKuBpk849/w0yZvJmo7RteRSNvojxBR/MsgdRTy6w7aYWYXm4nNE7GNREC1/5t05g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2b1jf12SvCsNKbgE7Y7As90SdF1Psrv2L3rnWsyMIg=;
 b=hBrA9Fx5Omana/qQhMStY3/Rr80wCgjDEwVsrTuo8EBNanZog6qF+UMFrq3MX0e7aSyeEAS3cxgZVlv1wb9bPeg3bMTF71wCab5R0Ex+/0K0L9gpqaBJjHt3WAys6507nM2t+EmlrNiMX3q4apUFicOdJkQhawS61X5jaYMtv6wGP+OIde0lfJTe2BPL6SlvvwJit472iuh3OZajtbphSXBzYxYUBGE+ODUkoGmbW/hAFbJMNiRc2HywoW/vCN53tEXhp6acEBPpP55COUpSVtee+zy562RVA8M25SMBfGwVFyBlacfk+uCejtxAlU3xxfr2tNz3AdyYUOXGpvOWQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2b1jf12SvCsNKbgE7Y7As90SdF1Psrv2L3rnWsyMIg=;
 b=DCBM7R9p0Ur+NnYuAtLwWPf8oq3JtOQu7eZzf/HYHGUb3tnlX8qpSGi2mCYt0QnCFUAyfCZSYAj1oKRzIHmtkemxouxZF4SVEPS/XUGKXjQK2kY6rJHCWhuHPGHYEre5itxJZwIh0wnwaEThkTGyv2G7irhKRFiQBJljyeq/pBl7pg4k5msKoMmIXVt1ZVExwXjO87cIoWupYtWX2L+AaqE+sdFsHBpob86YSW5wus+uAq5NCmS9trK1fI3GGfFu9KGrcVXzW08+6yU2NlRdCWIM9I70GChwCqleROsd7jmTAHhST2NceWX7wkke4gWYnYkHUyQvK+27Rxd/0e9t7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by AM7PR04MB6776.eurprd04.prod.outlook.com (2603:10a6:20b:103::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.27; Tue, 17 Mar
 2026 12:59:23 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.20.9700.022; Tue, 17 Mar 2026
 12:59:25 +0000
Message-ID: <cb6a8102-40aa-4b7c-957f-c7015a79c5c7@oss.nxp.com>
Date: Tue, 17 Mar 2026 15:02:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] clk: imx: pll14xx: Use unsigned format specifier
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260317121953.1100619-1-alexander.stein@ew.tq-group.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260317121953.1100619-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::9) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|AM7PR04MB6776:EE_
X-MS-Office365-Filtering-Correlation-Id: 09555d6d-629d-4e2f-5495-08de8425046a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|7416014|366016|7053199007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8W9fUHZ1rlwoDVIMRZJkbH2ny9I7QaFb8AZhbPBaA8A8eFFXY4kQhqy4e0nuIDckpnG+EWDTVbMhdwW0/J/RtDHN5IGf70j9omCLPj2dYVvY6vpd6Us5X1Tgr3Afc5zSR3TQZrJ/qdRTeKPMHdQMy98klVOxmS/JCBcR9ue90v2Zq8ndiqh0Pu2Z3Oph8MT7jwvVaB5UDapaza1diTJV3ylMDv38hQWS5F2839J6DnIOHd2S91QCvBpJ9mB9fKPm90nU41oyMmYHjG80WuUGKw3j16vEUa77KVVZwecQ8T+u26DcqEjhsTUqx216p974D1R+f4Y4FqFWBk8SCWyHDITvN+61G885EqdY3AMDa5dJlx+XTNhbQGb64xQM8dalC7DrU2bnaEepaEsFNPtSudi42IdJQiv0dVF6KB8TSnAqvj6LhfpraXOYNLAIqEyUbxXMDob60E4U9mjshTTa8MCEb6ULCNJT8MUK8Rg1c+jhD6ib0TADo2y6+g9CxzZp6O1b6rKDeMl9eak29Iv9Rt4GmDs78rGaUNNGG2RawNpd6Dk2jTCNr4CZDbDSUfRhNzbCBPrVSo8Hvm5LOyvjvCc+oBs82LQJVMcvzU24seaXAI4JafWZB23O56eZtrmqaTQyyUuatK5nXCq99z5r23k7Zp7Bc6kaN5XA6tADhVDjZ6WD0snDvPSiHiOPK3FFgkAL62uETFQxBzx/XSTx8jFOWnT2dxXcEAeji4k7Pi8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(7416014)(366016)(7053199007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDFxMjNWaGRmaGs2L1dYTDEvbWhpdlRGbmZzeWJRV3FCaTRKYWY5aHBDNXlu?=
 =?utf-8?B?bmtpMEZZWjE2anRFVnU4ZnFUMXAwUkVPeEplZjE3VGFTN2Rtbkd2cjNqT0ZT?=
 =?utf-8?B?QytjN3o0dk45RTJFNUFiOUNOVUJYUDdLRUJEbGJOUXJ3VklzaXlpWmpqVWxU?=
 =?utf-8?B?dk45VXl6bjh4WG1pSmk2ekM0WXJXWUpXQUFLKy9LU1ZsYytBdFVTZ3ZySUxK?=
 =?utf-8?B?OHg3eHZvSGtFQ1JaSXAwM1dLTDZoWjM1b0Jtd0R2K211cjNMUjZPbmhDNHNu?=
 =?utf-8?B?YU9mMk1XaDZpcjZybGNHaFFaU3J3WjVwTVJyQzVEUXNmamtPc3JnSVNuZDVH?=
 =?utf-8?B?N2U2dGZ2OVZ0dSthdHN6M1d0cUV6TE84aUM4WXJPVjUweDJSS2tOTHdWR3JS?=
 =?utf-8?B?dlRFaHVkclZZQVhJdWxiM094K3VqR1JFaDRSOGxIcmhtcUhOaHh1R1dIQzBC?=
 =?utf-8?B?eFBNMDkxLzRFckdGNVZZRVd2SWVzNnRqNlFpdlU1MkxCUTRwdncyQ2VTR2xU?=
 =?utf-8?B?eFRHSWhYcWdyVHp0cjZLWXdrMVFRby9HSnBva25oVUd1MHVJOGJ5SGVNcm5R?=
 =?utf-8?B?eDhpSFFLMlMzS3lsdkh5amIrZVJoRTlydFVCVUJiL2NmREI4OWR4ZXhxakpE?=
 =?utf-8?B?RmpjS0RWM1JYQUhmcE9Jby9iK2lvRnppTm5DL1plcm1ZS2YvV2wvcnRITUNC?=
 =?utf-8?B?R050U203bDVWc2picUpLa2cvQnVIMTlMNjBNWVpsT0E1b2xFVGJ1UWF6d2Q1?=
 =?utf-8?B?ZzlkbENRNWFoelNVWnFTQkFTdXAwbFVaK3g5Y0h3d2tPOUgwekZ3QmkyRmVQ?=
 =?utf-8?B?Mjl5dVlYa1pLSU5Uc3RXeFlRVlFqUy9vRmRGdTNvaGFpSjdFR0UzRHNaYVNV?=
 =?utf-8?B?MFFNcWFNb3dhc1hDeUtqN1pYby9TeXh5RDB0NTVWTk5hZkEvMXZzd3ljV3lj?=
 =?utf-8?B?eGNpNVhWbzBvN0wwUm51YTdoTTUvdlhITlEvNkN0NWErSmxIbkRReFhxazdR?=
 =?utf-8?B?MGh3aDZ6ZHFIY0RVMTF0cVlPRHdhdTFyQy9LZnJTOUtlbGZKWlk0dTljaDEr?=
 =?utf-8?B?T0dURHBqeE5hbHpKeU1zbUNoRXg0cEMrWDNaUVc4akh5TytDbTIwcm9SL0JO?=
 =?utf-8?B?eFNzWVBoVmJQSm9zQjU1VEkzWHNjRTBaOVdvVTQrN1FmYmMwdlNjTmZza055?=
 =?utf-8?B?Q2lHajMvREIvWEt1YTkvRzlJVHV1STQ2MGZvejcxbHlLZlhJb1l4YUU0cnpR?=
 =?utf-8?B?bThzeXNYcUtsNm1WY1RSYUR2UWFsZXZ6Z1lPVmMzTEc2L0Vsbi9ZM0hDU2Vs?=
 =?utf-8?B?dm5BeDBrZFl2cDhUV1NLT0R1YndlNGtaRTFNUkdJdk41QW81aCt1bUExL1lr?=
 =?utf-8?B?YnVpTnJNZVZoZkx5UEFOTC9rMzZWRWVvVldzZzZsTjdLOXEweUIwaTZERlkv?=
 =?utf-8?B?alMvVDZENG0wbElyK3ptdFpxZjEzMzFlZTVuU29BWlR3UEIydUtWYUo1bHZX?=
 =?utf-8?B?MDlEVGRTaXBBM2t1VTA4UXVjQ09UK08wUDdRenJHTGx0S2xMT0lTNDRWblUz?=
 =?utf-8?B?SVVsbUVIZGdWbE50SnBlNzRRN1o0azM1WXRrcGFvd1YzVWg1ZmFhZUUxSCsv?=
 =?utf-8?B?L25Xd05CSDVYUVd6QldsMkVzaHgwZld3aytKVnREdlExdDR5b2xuYWhVUkVs?=
 =?utf-8?B?cjhlb0ZWcm1WSjZ4VVRycEdGNXc4MGZTQ2VuT1RBVDlXU012ZmJBUWJrbGox?=
 =?utf-8?B?Q3Jnd3lqYjhLM1AwOVJIT0RJRFduTlpDTFJLZko3Qi9aRHhHQ0xsVXF1UDQ1?=
 =?utf-8?B?VDVoK29mMUNiSXYvK3dkMlJITEZ3RytSWWYvcEV4WVZtNFBWMS9HWDBYZ3NX?=
 =?utf-8?B?NkNwMldYelhMNm5XcTBublQvODBJNWhOY3RyQ29DSjROTEZSVlVvU2E3KzdT?=
 =?utf-8?B?YmZhZUxNcndIWU8ra1BYQ0M3cVZQY2d1NXozQ0pCdFRLZzRvUWpWeWFLUXJO?=
 =?utf-8?B?MkNPMTZlKzJYTlBVMnAzOHVpTVAxbzV2RXA1MzNKTm1jN1E5S1FVZEhVMDdV?=
 =?utf-8?B?cTduRnRMeStJdmg4eVlPUGxSdENvK0U1SkpSQ2FKTFRpWXZxVThaa2JrQk51?=
 =?utf-8?B?bFpSdmlYbDVMKzVEbW1hVUlQSjcxQjRaUXA4TzFGRnRXb01mT0tLNlpYemVh?=
 =?utf-8?B?NGg4N3VYbDdTaHUycFNoVm9YY3VGK1NNVnJiS2JhNEJXVTZGV2l3S0c5dUlE?=
 =?utf-8?B?bnMweDVhQURENDBvUUJnNXJRd2VqRDlWR2pxWWF3dytqSU9DWGxnNFFNSXQr?=
 =?utf-8?B?aWxaUE5kQmNrQzJNaEpNdlZmaDVGRFU2R0o5REs5SGx1SjA1Sll3dz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09555d6d-629d-4e2f-5495-08de8425046a
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 12:59:25.8401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B0gk0u4pFE6mrle81NnVd/jQTzdJzjiRCOrk2xlilw5FHLgRF+eHxbl4JNszTLEE18m3j6biYWmdFm6+eMB4iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6776

On 3/17/26 14:19, Alexander Stein wrote:
> The debug outputs use %d for clock rates resulting in negative clock rate
> during rate calculation.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>


