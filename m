Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E8819F10A
	for <linux-clk@vger.kernel.org>; Mon, 11 Nov 2024 14:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731335645; cv=fail; b=onCUbOOZaCfdEbDbJOZTrlNGtGsEsQC0AfTfQCs6n/Oq+/NFcAD3ZQhTkOUWA4EPGYjSFRc6E7hJ4BZ7acBtHJGNFe8D8oWM8itmJ3y4GuRiK0I/ezxrn+oazWB2g6vpb2OAb8Xv8W3jhiYSFQR9p2AFeY9jz4SQEA7L4WQoazw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731335645; c=relaxed/simple;
	bh=/EtoA/akdW2Tec2ADfwaKu1tim6rOisos+pgaECCZus=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nPJqRBDEUwb/dRjFAtQSQqw9NsOgTx8U2Jt88oY3lfpZq5fGYpW/nfKqXucGPqP5kTFhF62zaOcIyp0192BFImApZxDuwituNor9U+yoUZqfay9JgKFI35r46buXzhyc6+pTP5Pake+5j9S2upG5+5Z1+DUSkefMOYd6nD87/2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4v5mRdvF; arc=fail smtp.client-ip=40.107.93.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4v5mRdvF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lFsG/6G5N9dZOm2OAH7ovVfNzD5SX1oO3ru7Wfn2ChrRHf2dJKyPAK5UTgVpX96phaNlhXnRyEM3xhnUlPV7UY0d5pgjDKoolomsxA84aftZtGut8g5QM9p6H5AOPNZHQcCIjhi1qzxV74XpdpbgOCFCWdhxfhUQkrRJZX84Uwi24xNqzT778jTfLXF+xzODwntE+Egpz9XuibTZlNlbIMAOmVyT3D3UH5sFSfr7ZUtZV0UHBretrNckw9IyRVpK4TD+ZBdrFbch2e/6I6BKBEcDDav5u+IZABsG01YMDSRnCc4DebpCJE0axjjBlpyXCOQ/ZJ5vDHl8QqQL2xGHEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUp/S9XgZDQ8uiej0BqMrmz+T4itIlhnCA9UGusEku0=;
 b=WsOl3FYwyxawZJqk7w0/a+PANOKbtr+T6qbVuj0H7jz5A3LJNDYwOR3uFisiVjrXzYM0QTwmeNIvbC1ZAxOBq/7AqXoyP5+96O3GcWXx7xEqBOCbsig0Ka0kRk19Kkh1lZJmWnEkha2WfhIPLJWqq5U3hYTNDyQuiXvlNLXrdibNXhuNcO+psAmMMrOUHsXsOnHJrrM2LwH+0Ct1bCA7X0s0OjkYhgcetNx6mEb1nYJ9nD6/NsW8S6d+XJtL2pVS5XeDTKloBiE6iCGtvyksEis54zLmKj0G4BZnaH/IQTCFowmk3QvkC964FGEjaMO3yPUmiQvEgVm2eFllGVm8Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUp/S9XgZDQ8uiej0BqMrmz+T4itIlhnCA9UGusEku0=;
 b=4v5mRdvFIizMew3rxMFRAs6Yr2K2Dq9lrDcLizSeqdUXJS6JbPY98BlZ/h7e7yQquKZnCvBmoWZj9h3HqnlxKEcleCYBUtypy6/Q2FkPAvzT1mh38GgR9WaGqvVKWQj3tRMIRVtZszbJsjVx9NVRxM0eBgDg53QRTMA1n4btPlc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5969.namprd12.prod.outlook.com (2603:10b6:208:398::7)
 by PH7PR12MB6693.namprd12.prod.outlook.com (2603:10b6:510:1b0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27; Mon, 11 Nov
 2024 14:34:00 +0000
Received: from BL1PR12MB5969.namprd12.prod.outlook.com
 ([fe80::fe76:56e0:4c10:9a3c]) by BL1PR12MB5969.namprd12.prod.outlook.com
 ([fe80::fe76:56e0:4c10:9a3c%4]) with mapi id 15.20.8137.022; Mon, 11 Nov 2024
 14:34:00 +0000
Message-ID: <dd4cb501-5fc7-4430-9ffc-9c8c910df425@amd.com>
Date: Mon, 11 Nov 2024 15:33:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: zynqmp: Work around broken DT GPU node
To: Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
 Michal Simek <michal.simek@amd.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-kernel@lists.infradead.org, parth.gajjar@amd.com,
 "Allagadapa, Varunkumar" <varunkumar.allagadapa@amd.com>
References: <20241031170015.55243-1-marex@denx.de>
Content-Language: en-US
From: "Sagar, Vishal" <vishal.sagar@amd.com>
In-Reply-To: <20241031170015.55243-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0133.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::11) To BL1PR12MB5969.namprd12.prod.outlook.com
 (2603:10b6:208:398::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5969:EE_|PH7PR12MB6693:EE_
X-MS-Office365-Filtering-Correlation-Id: f5919a81-bd98-44f1-c94a-08dd025de212
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VU14TDljWWZyNzFsNEM1YmRDeUdQZ1hvQnkyYmdWUUw5OEF6cEtVVWN4bzBF?=
 =?utf-8?B?QzB5RUNpa2htbHlPTlVKWm1FUWRTd2t4YnB6dVl2RFhRaE8wd2xzTzlqb2Rn?=
 =?utf-8?B?YiszRnFmcUNoWkNLejYxZTdGT3NuN1JabW96RXBwNEorQm1PaStIUTZCd3R3?=
 =?utf-8?B?WXk0TGF5M0dhSDV4YzhkY21KYUVKQ21QZVQ1NEtueSt1VGdQNmFva0ZqUlR2?=
 =?utf-8?B?aGNiamlSdHhKWUdFU2VNa2V3dDBjMjZWUC95dk5IYlA4N2pTNjZ3Rll6dWVW?=
 =?utf-8?B?ZXFvTURuaXcrSmJLWHdpbU01RE5GSnVmZ1E5dnEwQzc1VmRjTTBEOXRrQ3NC?=
 =?utf-8?B?M0UxcVI5WGZ6SlFhdURiY0RGKytWb1ZlVzd5K1R5bjBQZ294d2dxRzFJWnpm?=
 =?utf-8?B?Uko2bTk5NzhkNnlIT3hlUlVSenh2Y3M3L0pQZUN1WkNKSlhUbExhdjJlLzBu?=
 =?utf-8?B?N00ycFVmK29xb3UyRThDeU8vZ2kvMjEwUkwzK2M4Sk9MaG51Y3lMMEVBYUtE?=
 =?utf-8?B?RVNXaUdXemZwOHZnVFR1Nk1NTXpsdEwwS25FVkF3NSt0WVVzWWxMbUFNeXlK?=
 =?utf-8?B?bGo1VzdzWW85YVU2ckpqVHhycGRQd29oVU8rSWM4VEloZk1LVHJmOHZxLy95?=
 =?utf-8?B?MzRscVc4S29EQnNSSVhDV2dBSzhYa1JXdnQ3RTlNeGhHRWhZRll5RCt0RVp3?=
 =?utf-8?B?aSszdS85L2w3aTNWYmtmbHBTSHR4WTl1bTloUFVHV2Y2YUxUb2pBUDJoaG10?=
 =?utf-8?B?MGZZWkpWUGxzQ3pELy90QTZFUDZhS1pJNlBXUk01R0JpUzBoUlZJa05Gakdn?=
 =?utf-8?B?anNxWlJPTVBhb2FXckxNdkE2OHBWV1pHMWxyZFlaUlRReUJwUEI0SXpJSHRG?=
 =?utf-8?B?MkRXRkl4a3l2OWdxU2twWDQzRzBTOTRrWFhnZGxBcnZVWWJ0cklLVVNRK2t3?=
 =?utf-8?B?OWdtQjVCQS92Yk1FdTMrUTVENnZOZ1NrMEhZOG4xbzViUkFnSklZMVFJMEM2?=
 =?utf-8?B?Wk9Sblc1WFV2NFM4R28yMGJwNkpXRWRxSHpZWS80K1ZjUzl3TXFLOFN1WktF?=
 =?utf-8?B?aWU4UTg3eVVKR3RwVHhrZHZweGFVQUdxTmV1cG5EQXJBeHE2T0grV3FIenNy?=
 =?utf-8?B?Zys4NkJUelhYYmdHNDhCa1ptaElSeUU0QldwM3JHUnRCdUQzUUlJT3FMTjN0?=
 =?utf-8?B?ZFRYbnkycTVoYTk5Skg4T2Z2SDZIUGJqdFlOeE5pQlE5eDltL0ZOT05abXdS?=
 =?utf-8?B?VFJpQkJEZSs1TElyZXJWTUsrNzJVUzFyblhVTmRVRmZwMUdVaTFIcitqREdy?=
 =?utf-8?B?SWZsQlQyY1ZFbzVjb2thYVFwME40M3lDekR2TFZKQWhBNktQL0hhdnZhSVVm?=
 =?utf-8?B?bjlwZHJVdlEyV0hwVUpKNy9BOFJFWURiM1M0UG5nY0xUWlFNMGFsSXZXM2VK?=
 =?utf-8?B?ZktMQkxkSDUvWjhnM0NLWnhjcS9POGUweDFmYWNyWEcrSC9uVndYby9nRjBm?=
 =?utf-8?B?Smk0UjB6MVFTS1o3U3FQNUNZaFFXU3NZaDFmNytwT2RhNHR6enNvTnpJdlBV?=
 =?utf-8?B?OXB3RFBFTDBKYzREOXhHcVc2WG5haXZnRXBCaDdha2VxdUw3V3Bra29QK0JW?=
 =?utf-8?B?MzJxekpKd1VnWTNQamhZaXBLK3FodmN4MDZ6ZTRaNTdVdjNiSzNnSXFmYWVk?=
 =?utf-8?B?WkwyWVBneFJjQkJrUnRJZVUycVZiTlJsSTlVSXEzVW8vTkhCLzJjeE9sZWxE?=
 =?utf-8?Q?zaVsUGSSHUK2cKOoUPUjdjxp0/khXKSoKf5GFjk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5969.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGtYY2dhMzJqL2VUaEV3Rk5Nb0ZORGV5bnVmYWlzTVE3OUl0WG5ZcFVYbDd2?=
 =?utf-8?B?ZStiS2RMTWtqd2JpZE9MZlVQZTJVbCtQSS9NTkE0dVhHVHpiWmp2L2ViRmxu?=
 =?utf-8?B?cHpLMFF3ZXVTeVRUVUhLTUtYUEFQaVh5YUhlZ1BkcXhGTUxwVG1mYUFTdEpK?=
 =?utf-8?B?TXowczc2czJvbnl1aXgzQXljWkp5SitFQW9Od2hhZDMvU1dTaDQ5M2RBWERL?=
 =?utf-8?B?WDJqbXVwelRUYzF1YzZSZGV0ajBzeW54UjduRGNaN2o1R1FjRGhIVXU0N1Za?=
 =?utf-8?B?a0Z5UlRraDdSV21oRWpJOXFBd1VvSjdXTUR5Y2Z5Rlk4TkE5SlEvUnZZckdO?=
 =?utf-8?B?cDRUUm1ldFBHODZmTkJvR01EVVhpTXpxVlNLWU5wKzlqQTI1V2ZDNXo5Sk1N?=
 =?utf-8?B?MEJxVlkvWEI0aWF5TGF3cXc2WFVxbUttVWZ1RUJFS2xKblRoaHpGTFdsaHcz?=
 =?utf-8?B?enNYb0x3cmlqT1B0WGVpcXNEck9mcy9pWUY5SEtjVXh3aDYyMTZZRzdCMFc4?=
 =?utf-8?B?TW13d3JDdFhCc1JyTmJ6UEhSQXFEUHZCempUQU5BYitNZkhwdWRoQnZNUkxy?=
 =?utf-8?B?bUtsQStORnFCUllCeVIvQUozYXBjRlNiZlR3SytvOWlqL3RiTGlJRUFQUkRD?=
 =?utf-8?B?VU9RRTB6YXRITjQyOGwrdVY1eUFrd3NuWmlCQ3pFRGdzeHBDYThOeFl6YXI0?=
 =?utf-8?B?WUdKTFdxOGtYSTNHdEN3bzRiWWtXNzhieTZSS1o5SitTUWxVKzlyWVlCUllo?=
 =?utf-8?B?MFlhc0c1N09OQTlkQjNHTEpsNUFFOGlkeDY1clBGSVhPaUhCUlFHSnAzZGZz?=
 =?utf-8?B?ZjJRdlBFM2wxOEIxMWVodDN5TThKa2NyQk9EVDdKQ25jK3JoV1BjODQvdXho?=
 =?utf-8?B?OTdBbnpKK0toK3hUTHNkNDUwbDMvZFRvRnF2c3ZMYWhoWmNta0VVb1JTMjgv?=
 =?utf-8?B?cHZ4T0dBY3NSVk1KcnhwNUcvNGpZQWM1U204Y2dCcVVRaTZPZ0dQU0VWb2dR?=
 =?utf-8?B?c2tOcldEdDhHMHJNaWs3SHdGTzhJSkZ2ZmZNNTZ1MlI0U01jeVNUSVRleGRj?=
 =?utf-8?B?bE8zZ1prZGdtZC9FUXNCMFlGbkRDTXNlQzlhWmlnL1NrV0hiYjd0Zmo2VGxW?=
 =?utf-8?B?VjJEZTNuUkFkRG8yRHV4UEJOeEc0R1N3cVM3R0lLblpGcG9ncmlXeVdMc0Rn?=
 =?utf-8?B?VEczc0JWRWU1T2c2cGloa0hpQnVZMHdNdHF2ZDF0NDl2TEowR1RIU0UxcXVt?=
 =?utf-8?B?U0I4ZDM1bDRaemJkL01hR3JiTXcvNlhXSkhwT3kraHoxSFpXZDRkV0YvVXk2?=
 =?utf-8?B?Z2lSNXJON1pZU1JoaVQ4RnNOeFYzalF1VVJYczhrcGMvVTMwNXpRTzhka1Q2?=
 =?utf-8?B?MlZPNk0wQkR1RjZzU2luUzZ4T2JTZnZuV0lmNDduejQzekViMFBRUWpPd3NM?=
 =?utf-8?B?d0phTnRiWGJiRkRuOFBUR1pORGZTNElZSDErTlgwWHJCWTQ1RitqM1U5RTNj?=
 =?utf-8?B?NWdhZnhremI2a3NKM3JXMXFiNWRCT3NEV0hUM2FWb3B2d3E4dk5XNUcxak10?=
 =?utf-8?B?c1dSWHlLaTFKcU01Q1BMNUozSW1GVVhQWGZWdkFsRkFaekNqNmtrRWNOTHVH?=
 =?utf-8?B?cmlpajVFamlXVDRQb05VYlBSZjJBUklhb2hzOUExK2t0YVdQQldkeTZINkNa?=
 =?utf-8?B?UGQ4Vkh0ZXlwOFlDVW8yZ1haZCtoZWxHUytYeEY3NU5wTCtzVW9lLy9NeGRj?=
 =?utf-8?B?MVNTc0ZrZnlxMjBVQnZadDQ5Y3BaNHFKVHlUek9QU2k3UW9LemVTcnd1VWpO?=
 =?utf-8?B?bHNRVlNSVUhCaHhaNTZvSSsyVFZtL0E5aStDSTlGNEU5WmRGQkRldnZmc0Jn?=
 =?utf-8?B?OTIvZFFWcUZjMUV1NitsRHRZeHhKUEhxOEs0S01uNHlCU2ZMeCtEVlFVejhP?=
 =?utf-8?B?Nnh3bVJrVjBHR2FmOE0zcTMvTmdidmxDU3JLMjIzNXVBWFpEN2ZVR1ViSSts?=
 =?utf-8?B?c3BXK2tmYlpHR0t3ekd2MjNRZnY0NVJiMVNwMGx2dUwyZS9QeCtFZi9yRUhk?=
 =?utf-8?B?TlZDSHJPM3dOdk56Ui8wMlpQVVNLeTN1L29TdEdTSlR4ekd6eFlDNVV6Qjgy?=
 =?utf-8?Q?pBQA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5919a81-bd98-44f1-c94a-08dd025de212
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5969.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 14:34:00.7495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XanB1Ffy6WVjP2/v/peouEk+BuzeGNr+dMw/qC3LwEvQWMyUdQ3kGGf2J3dKwst7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6693

Hi Marek,

Thanks for sharing this patch.

On 10/31/2024 5:59 PM, Marek Vasut wrote:
> The ZynqMP DT GPU node clock description is wrong and does not represent
> the hardware correctly, it only describes BUS and PP0 clock, while it is
> missing PP1 clock. That means PP1 clock can never be enabled when the GPU
> should be used, which leads to expected GPU hang even with simple basic
> tests like kmscube.

Could you please share how you tested this?
Please share the dt node too.
We will also check at our end and revert for this.

> 
> Since Xilinx does use generated DTs on ZynqMP, the current broken DT
> implementation has to be supported. Add a workaround for this breakage
> into the clock driver, in case of PP0 enablement attempt, enable PP1
> as well and vice versa. This way, the GPU does work and does not hang
> because one of its pixel pipeline clock are not enabled.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Michal Simek <michal.simek@amd.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
>   drivers/clk/zynqmp/clk-gate-zynqmp.c | 17 +++++++++++++++--
>   1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/zynqmp/clk-gate-zynqmp.c b/drivers/clk/zynqmp/clk-gate-zynqmp.c
> index b89e557371984..b013aa33e7abb 100644
> --- a/drivers/clk/zynqmp/clk-gate-zynqmp.c
> +++ b/drivers/clk/zynqmp/clk-gate-zynqmp.c
> @@ -7,6 +7,7 @@
>    * Gated clock implementation
>    */
>   
> +#include <dt-bindings/clock/xlnx-zynqmp-clk.h>
>   #include <linux/clk-provider.h>
>   #include <linux/slab.h>
>   #include "clk-zynqmp.h"
> @@ -38,7 +39,13 @@ static int zynqmp_clk_gate_enable(struct clk_hw *hw)
>   	u32 clk_id = gate->clk_id;
>   	int ret;
>   
> -	ret = zynqmp_pm_clock_enable(clk_id);
> +	if (clk_id == GPU_PP0_REF || clk_id == GPU_PP1_REF) {
> +		ret = zynqmp_pm_clock_enable(GPU_PP0_REF);
> +		if (!ret)
> +			ret = zynqmp_pm_clock_enable(GPU_PP1_REF);
> +	} else {
> +		ret = zynqmp_pm_clock_enable(clk_id);
> +	}
>   
>   	if (ret)
>   		pr_debug("%s() clock enable failed for %s (id %d), ret = %d\n",
> @@ -58,7 +65,13 @@ static void zynqmp_clk_gate_disable(struct clk_hw *hw)
>   	u32 clk_id = gate->clk_id;
>   	int ret;
>   
> -	ret = zynqmp_pm_clock_disable(clk_id);
> +	if (clk_id == GPU_PP0_REF || clk_id == GPU_PP1_REF) {
> +		ret = zynqmp_pm_clock_disable(GPU_PP1_REF);
> +		if (!ret)
> +			ret = zynqmp_pm_clock_disable(GPU_PP0_REF);
> +	} else {
> +		ret = zynqmp_pm_clock_disable(clk_id);
> +	}
>   
>   	if (ret)
>   		pr_debug("%s() clock disable failed for %s (id %d), ret = %d\n",



Regards
Vishal Sagar
