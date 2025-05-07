Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010004.outbound.protection.outlook.com [52.103.67.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DE1149C55
	for <linux-clk@vger.kernel.org>; Wed,  7 May 2025 01:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746582176; cv=fail; b=EiQy2OJnMZXVIpnYVZ4ua221A4yXOq6kvduhM6IurJoEH2WGbIAq9wXYDJG99QjhTHxYK+ieDcntWq6KvZbeBf6bgFPvK1z1z9t5PkRHC4OxUqaACpziwMmqi97R9lDMRI1UhcZt/6P78FFsm6FEjm1jBLpVrFuOCd+sVTddX7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746582176; c=relaxed/simple;
	bh=hL3decSVQiWMSO21chIJ9Vztl+gIjzQojedFQYP25QU=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=WBr3+3pWxJ0TqCAV8CaJAlJGa2hIlZMBg/Wu7FuD0BazzUrB8f4RAxggKRL6TRA2UGA+0q66ux1joAORSu1/fQl2n4QIFEn/GsDG6Vj+1lIww2vBmOYqREbbBo1MUUQe70jtK5tKG5nwpOcw479lLaW0stbzgEgPl6Od9I4/AjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=E7Cy1/Cx; arc=fail smtp.client-ip=52.103.67.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="E7Cy1/Cx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WJcBZwPHeMayQNAaO4eqLHIulXbIsYCdgK4nkyzSog9ICuW6rwpb/2GW1pgHnv3wKBALR0SnaXMv6QkJBu2OPjMp9UOJlDRg6NKEskJp7fZkkterEX3gVplXdwhaXJRZ3sj/4jvOwaz94wCgQ5lNqdi5oEC1cQk/neOFH3Vk1Kc25SVX7W9LEzoI954jwCEbsssDy4Js78dASPUHFJ8xl6og7eOLsX/wKFvwV68dgdvNbkiNImCbr2fV5QeSi6rJj6F9DU6Y13o2SrskgolLsly+AnkpD3zq9SOo96oaM5jdm520edPT7EIOv2+S5TMd82SV6c9JEuelBeZCB8l0RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/iasRjX1Ye1z0wDT/jcpNk3qiBjlfh5ysr5HDdnpXg=;
 b=ZY2/Gh1IQVHTmznMEV5l7hF7QxvxLeM/JUYL5PT0VOSDf86uIiMcyhvj0VzalTOSJY/M7ByYKx1Q5TKUdKrTktnzEt1V7Y6cj9k0ofnptf96yPzYPtYsYmBnBHo9VM3fYzY7rGKNZKMIrHZdMG2iZU2t+j0k3RcA8X6HxJCKJ6LjsvcdocLAH5QwFE+4TLeRiQdC45J4sOUuP0ThnlO1YTiSDbdHrB2t5iPEsGvHZVGmd25bcEbDJsDqiwfTW0YfzTgt9EqeQiNxj5SAaEdZsaLsW+eypgBRXeE90QSAtRMGJw4qS3xPOfaTjEbeI/pfGie3m/y2ti/yAN3Hmlb/3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/iasRjX1Ye1z0wDT/jcpNk3qiBjlfh5ysr5HDdnpXg=;
 b=E7Cy1/CxoBulmH+pQPmkqntEBLoWRvDcKYLcsH8oV4tO3ebJxT//W22bqG/wVE4+jnuMf/5Ooi8yKXYnHF0Y7CFac3TzZtgNfyERmEsW0/wUP99pKfY2j1RS054YJ7s8AdknPBjJc46bft0cx09UmO0DEhImq2OsOwksNtGSRdgpDqSFimZ0xZ5M6NTk34hOQVoDNC+iF8RnUaN3N/eTmp7p1GiFdBV1stNXvHzaMzevPrdW7blWFYDK6ytgfgim4mcVouPQv1e8k+QBtmxukPlTtWVqG1Rnh4iOlI7eLizpiyUCDIItH6Qdw0i0Hf23NgasHlxQ9gmFU1z2FFIuJA==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN3P287MB0322.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:d4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.20; Wed, 7 May
 2025 01:42:49 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8722.018; Wed, 7 May 2025
 01:42:49 +0000
Message-ID:
 <MA0P287MB226259FA30EF915465BE2759FE88A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 7 May 2025 09:42:46 +0800
User-Agent: Mozilla Thunderbird
To: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc: linux-riscv <linux-riscv@lists.infradead.org>, sophgo@lists.linux.dev,
 Inochi Amaoto <inochiama@gmail.com>, Chen Wang <unicorn_wang@outlook.com>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: [GIT PULL] RISC-V Sophgo clock drivers for v6.16
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TY4PR01CA0008.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::9) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <e920648e-02d1-4350-afb4-1a4d3bb1ff98@outlook.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN3P287MB0322:EE_
X-MS-Office365-Filtering-Correlation-Id: a20784e5-76d9-406a-dafd-08dd8d08797d
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|5062599005|6090799003|15080799009|19110799006|8060799009|7092599006|461199028|3412199025|4302099013|440099028|10035399007|34005399003|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YlN2Mjg0MVp5Q05zaU0ybXVLSWpaTEZSeVBHVFdEWFlZdTYzMWd5OGtWUzRP?=
 =?utf-8?B?d3YxNUZ6c2RwalhzTE1GeEY1Z1V6Z2xZcTJQbmtwRjJBVVRUN2hYYUkrTHp5?=
 =?utf-8?B?K2paSkJFalBJYlRHMG5NVkc1VmhJVS9vWWo2WWpiNDUwRGhsaUk5Z29FbHpl?=
 =?utf-8?B?MDI5V3ptTDZtOFloenlMM2F1eFpoUm93M2tXdHdTamNlQXorYmpaenVmOGRD?=
 =?utf-8?B?SGxJRjBQTnlUeGVYUWo3S2NUb1dmK2JzYkpwWUh2WFlBQnJyV2hueFM1a1Nr?=
 =?utf-8?B?WUxaUHNNaC90U1BYNjE3b0NpMXlvem5yM1NvMGN6Q29yN3dqL2lNT3NrNVdN?=
 =?utf-8?B?STlDaVA0cjE1MlYxUVJSQWdkYXNWbjZoVXB0dVpnWWhzVGVsL0VkVWY0Zmha?=
 =?utf-8?B?WlR4RDJCQmhrVno2SkdsZEQvYmxkWjNFb3VWUE10UEVYQysveWNZNVE1cThM?=
 =?utf-8?B?WUJNWDV2VkNFcmFrMXhEY1JqUnNUdS9iN3VXempQRjZ2anNGZ0EweWhuT3hy?=
 =?utf-8?B?OURtT2ZDeEROS1ZGdXlieXdSRVU4eTJiS0s0bGVZVElhcGpwT3l1S1IzOFN6?=
 =?utf-8?B?a3N4bWM5NDQ5NlFjTjAybzBYeTdzVDFWdTd4WlVvRllrY2pFc1FwcC9ZeUpB?=
 =?utf-8?B?aG1rOW1aYzcxQVczUmZocDBhY3FDTFFSaWpLNzZKRmhxVGMxYmlDOXNFMjlK?=
 =?utf-8?B?dlpXS3ZxNVFaNUZsYWdUbnVGNS9XdU1aMy81UUtyeFRzemdZSDJmdFNyWm1j?=
 =?utf-8?B?VDE2Mkd3VFd5d3ZvQVp5MjVJeHVsWXFwNTBBNDN4b21yOThURmhQV3B5YkNp?=
 =?utf-8?B?Q2VQNVNYU3puZjQza3lyaU1qVkxJZDdFZGMvTXJ2M2NDWG1GTSs4eFlzdmd3?=
 =?utf-8?B?SEhEbjBxSFFzMm9vNmMrSm5uWnFJTWcrMjA3Q3RGSjU0ZEN4Rk1DTklTOVVL?=
 =?utf-8?B?a0pCOWl6WGFHeWJZVXFPdlR4ZDhwcFVKMXMyNzBKM2syMlB0MDgvZG54Yjk3?=
 =?utf-8?B?RVZ6U1NrSTdsTTBkMDJ6MitTWkZxNHAxaFRPVGxia283SXJSV2lLRW5vTkZl?=
 =?utf-8?B?R2g1eUtGV0lFU1NidVI5RHhtT2FJVStjd1pGQ0RqWDIzamdoWWtWMTY0TXNn?=
 =?utf-8?B?WjBkNmt0Wi9mak9YZ3I1VjlVNW9GbUYyZFRySjhPZFNadjNsUlJ1MVI0Z2xy?=
 =?utf-8?B?dHZQb3F2djJLUGZUaU42Q3Y3d2NxUGVCVE51MG4xMFBRUGlFQzVDQlN3Vita?=
 =?utf-8?B?NlBXN0V1R2JvakRDb0ZnaDJYQS9KMVJ1M1BVYTQ4dFQzSGI1OFdYTkNCUXc5?=
 =?utf-8?B?UXpMdGEybEpBWDJKNFJvTXdoN0tEOVJiYkU3RS9odUxMbmFDZ05aQ2hsTDl6?=
 =?utf-8?B?OEpQcWxvNGxUaUw1SW9RT3FlZDVheU52MTh3SS9rbEVIZmw3a0xNSlRMWUxj?=
 =?utf-8?B?VFZXNGFBd0pHREZyUnVDQmNMNlp3WGlqa0lXbkUyUlZCRUd4NjU5cEQvTC85?=
 =?utf-8?B?bFg5ZFNJTTVyTTk0Yjd0dlRzZWx2WUFLSkxKbThmQTBnQ1VuSUloelB1VWd6?=
 =?utf-8?B?QnhVelNWUGhUVXRqU2xybUtISlNmK05vMG1CZDZOMEtWQWNDZmF5TEJQL0pU?=
 =?utf-8?B?QmQydWdjWTJyK01TaFN0SHdiYTh0UVBTK1VEeStDZWU2bXZkUjJFZlMrUGg0?=
 =?utf-8?B?VGQ3c0ZBT2hLQWxQQUZpOFY0Ymg5dTNLYVYySnV1RGpYSnczSCtHMXE5b3Nv?=
 =?utf-8?B?QW4rRzJzVEEzbElkcXJVL2RONzY4a216eVpBcFFhVHhFaDhtVlhyVUplMWtl?=
 =?utf-8?Q?DxWt7u4fwDath4FswWrrnqef7gRBM0hyPO7T4=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlMvdmxUQk5uaklpMlBmbXJDY0pYVHRPeXRRa0FydVhwZzFvdXZSSkpRczNF?=
 =?utf-8?B?WnBDU0lQYVNVMW91b2RvVUYzN0pYT0FWTzdOQnJ6NjJoUCswbzBNWUkxOU9J?=
 =?utf-8?B?WWpDT0RIa1hFbzh2cERsY21jbzZGT0dJU21OMEZIc2ZtOGhwcUlzSysrZEJJ?=
 =?utf-8?B?TVUvcm9qMjhiRTZoSytITmtmTmNOY21HNnQweTNWVXNJTisySkFqcmFjSHpG?=
 =?utf-8?B?QkJXOFd6ZzVKM05RaEtJM2pDSlI2MGJkc3h3Z1NVaEJOQUI4L05uSEUzNzlk?=
 =?utf-8?B?L2pRSnB3clJRRm1USEhLZm9Rc3h3NXNYVkhBbVc0ZDRKYlU3UmIvU0svS2l5?=
 =?utf-8?B?VUZmV1hKei85NVk1R2tiUzJDbW9vaEtuaW5xeFErS01sVVhxMUM3WmQ0RzUv?=
 =?utf-8?B?YWdqUCtSK3pSWG13OWNoMTBTd25LNENhY2xBdnR2Y1FCdDQ2MlhONFdYN1gz?=
 =?utf-8?B?cmczRkhhczhieHo2cWx5WGpES1E1RStLT0lwODNVQ3RkbUVUMWp4dXBYVjRX?=
 =?utf-8?B?Q2txZndxZUozbVBWdUl4eFVzK3NLY0V4ckNiQ2RZd3kzSGsrcWh3ZVNIUWND?=
 =?utf-8?B?dG9aMDlFem00R1F0Q3JLOFl4UEU5dUFScjNBczNvb3VyTTNCK1AvbXAvbVpx?=
 =?utf-8?B?MUdBYkh3K1E4eXNyemo2Q3BJanBab3pWcHNWalhsQlY0OFZncDNiaHZ5MFJC?=
 =?utf-8?B?Nkp5VjV3bGZPdnFNNnA5TmE2STBqcU5xUEFjWmd2UGJ3Rk8xVjJyaS9TbFFs?=
 =?utf-8?B?THQwTXpsNU93Y3VTeFBGL3NneGx5UFR4V2lCMThrQTZ1U3JWS0UvclZDTXpE?=
 =?utf-8?B?WnRFTnpOTWdTK3BGNitqK1k1ZFgxV091VXdCYVBPQlZDeTBxOVlrd0RnRVN3?=
 =?utf-8?B?UTIwK3A2UVFKQ3JENE5XelhpeHZaZDVYc1BZWXA5a0dLWEtJdEREYjF4RHhj?=
 =?utf-8?B?NExMTWxKcml3Rmd1aC9kb3pXOEFyYU1JcGRvVFdJQ1NRLzkxTysyODNYLzFG?=
 =?utf-8?B?TVFBemY4MDBhVDhBd3hZeGQwblYvOEtiWG9Hc05GbHFMR2tMQjVKbE96S2tY?=
 =?utf-8?B?ZyttTElIQXVERHBJdHQ3OUFqc3NuWnJoTDVTZzMxYVpDNUdOZGVucWtOY2Va?=
 =?utf-8?B?YlJaQjdQS2I0QVNQL1BoQjR1UERHNVVOcUdWNWoycEw1QUdmOTBYaWg2dWRL?=
 =?utf-8?B?alJwQjNoUmd6RDhWMUxWMnArRGpEeWZkMDAzY21FelhSK3BQUnpmZXZIY3Ix?=
 =?utf-8?B?NEJVU0xxdyswZDRkSHZRbWZ5SUVzRVFZY0oxWmYyajF1QnpmS0s0czVnd2ky?=
 =?utf-8?B?aVloZEZxYmtIM0VlUnUrNXpidERoY2Q4NUxya0JxZFU5TjYvMm5reVFCeUZO?=
 =?utf-8?B?TU1ITy81YndVTmh4Z2RsbEhKbWM4Y0pIUFA0YmVqRHQyaDlYTTRuY0YwWTJ1?=
 =?utf-8?B?cEUyaFhtcXZjTGxiYWQ2UlJEQWJHVERXLy9aRndqRTByS0NWVmJUOW1mM2Vl?=
 =?utf-8?B?ZVFSOXZSbncwUnFqcmlSU01KUXp5K2NGb2hzOGc5ZHlNazNWT3ZCOUNrODc1?=
 =?utf-8?B?KzhHMnFmb2EzZDllZ09zN2NtSDVqWmczVnRBL0dYTTJnTDdVOWdPc2RuNjRO?=
 =?utf-8?B?bGU5eVJLWnVMNjliNGR1YWVoQk5xdzFLQjlLR05UeXpMamovZ2pmSTYyeFg3?=
 =?utf-8?B?UWphMHFSL08ycmdyVy83TmhEdUE5T1FleEZXUW1tVnFZY2djQmZDdEw1eE9K?=
 =?utf-8?Q?RbWOWdcuPVgsrALYTUW4VP7ROQi6IzpdKwogqjg?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a20784e5-76d9-406a-dafd-08dd8d08797d
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 01:42:49.7153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0322

Hey, Stephen,

Please pull clock changes for RISC-V/Sophgo.

I send this PR just want to expedite patches for these clock drivers. 
The patches have gone through several rounds of review.

CV1800 series: [c-v1] [c-v2]

Link: 
https://lore.kernel.org/linux-clk/20250430020932.307198-1-inochiama@gmail.com/ 
[c-v1]

Link: 
https://lore.kernel.org/linux-clk/20250504104553.1447819-1-inochiama@gmail.com/ 
[c-v2]

SG2044 part: [s-v1], [s-v2], [s-v3] [s-v4] [s-v5]

Link: 
https://lore.kernel.org/linux-clk/20241209082132.752775-1-inochiama@gmail.com/ 
[s-v1]

Link: 
https://lore.kernel.org/linux-clk/20250204084439.1602440-1-inochiama@gmail.com/ 
[s-v2]

Link: 
https://lore.kernel.org/linux-clk/20250226232320.93791-1-inochiama@gmail.com/ 
[s-v3]

Link: 
https://lore.kernel.org/linux-clk/20250413224450.67244-1-inochiama@gmail.com/ 
[s-v4]

Link: 
https://lore.kernel.org/linux-clk/20250418020325.421257-1-inochiama@gmail.com/ 
[s-v5]

Thanks,

Chen

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

   https://github.com/sophgo/linux.git tags/riscv-sophgo-clk-for-v6.16

for you to fetch changes up to 41b08610dd262dc4a5e1eff993b2d21eab8b8ba3:

   clk: sophgo: Add clock controller support for SG2044 SoC (2025-05-07 
08:00:09 +0800)

----------------------------------------------------------------
RISC-V Sophgo clock driver changes for v6.16

Sophgo:
Replace compatible for CV1800 series SoC.
Add clock support for SG2044.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

----------------------------------------------------------------
Inochi Amaoto (6):
       dt-bindings: clock: sophgo: Use precise compatible for CV1800 
series SoC
       clk: sophgo: Add support for newly added precise compatible
       dt-bindings: soc: sophgo: Add SG2044 top syscon device
       dt-bindings: clock: sophgo: add clock controller for SG2044
       clk: sophgo: Add PLL clock controller support for SG2044 SoC
       clk: sophgo: Add clock controller support for SG2044 SoC

  .../bindings/clock/sophgo,cv1800-clk.yaml          |   16 +-
  .../bindings/clock/sophgo,sg2044-clk.yaml          |   99 ++
  .../soc/sophgo/sophgo,sg2044-top-syscon.yaml       |   49 +
  drivers/clk/sophgo/Kconfig                         |   19 +
  drivers/clk/sophgo/Makefile                        |    2 +
  drivers/clk/sophgo/clk-cv1800.c                    |    2 +
  drivers/clk/sophgo/clk-sg2044-pll.c                |  628 +++++++
  drivers/clk/sophgo/clk-sg2044.c                    | 1812 
++++++++++++++++++++
  include/dt-bindings/clock/sophgo,sg2044-clk.h      |  153 ++
  include/dt-bindings/clock/sophgo,sg2044-pll.h      |   27 +
  10 files changed, 2803 insertions(+), 4 deletions(-)
  create mode 100644 
Documentation/devicetree/bindings/clock/sophgo,sg2044-clk.yaml
  create mode 100644 
Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2044-top-syscon.yaml
  create mode 100644 drivers/clk/sophgo/clk-sg2044-pll.c
  create mode 100644 drivers/clk/sophgo/clk-sg2044.c
  create mode 100644 include/dt-bindings/clock/sophgo,sg2044-clk.h
  create mode 100644 include/dt-bindings/clock/sophgo,sg2044-pll.h

