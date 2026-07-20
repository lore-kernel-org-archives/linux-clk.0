Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013014.outbound.protection.outlook.com [52.101.72.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500C93D9521;
	Mon, 20 Jul 2026 09:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784541390; cv=fail; b=Mz8eHKJJywpfghqhW+dcLZOoI96Y5KoidX4gdGx/2+9WBECzMLhfKEzuveZJsVXyv9OLnbgfR3b7A/ZT7gufO+4bwN0ETmf55xbByKdTpHlUa6BOdo1Xkkrw3ZLjvebv+n8XPg6tY0TCzlm/ti6OkHQck0Wixqcbzf45ika7uAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784541390; c=relaxed/simple;
	bh=GurUQJzJvtJT8FF2gPhOa+H7mYaadlr+RdjiABwCVS0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=bNUYt6sV73PECknx52ZIJEKFWaz+9Ou9WA2YZnYQswUN7vADmCNfjdDZQ8IJHA4U7M/BzwMoPk0GU7oDoxLx5skEckBTHtQ6ZBS1Pzg2o1XZsZX3xU01da7JJ/SuyvtLqWdnVTTzRJ9C18x6llRGGd3Lc0XXe8rvvWKEc0frXg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=x2i5EYEa; arc=fail smtp.client-ip=52.101.72.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="x2i5EYEa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zNXOXkEo9+/hLVICSsAx0/PRC1nR8Zx9C4Md1+oGWTXmM+8TINBlHUFzJ+bfvQ/B73f7BmLPorWUga6KJNYCEZ1uD2s+NfCNZqE++J4Vf3rvtsAs8EhwGLkq3lDyVehqes8SdlKKTja2NRiFaLR4ytJTif+lZZ1FCuM41y33qv2uDqxlpzZ872fmWdfhV89E8cq0l6IpOFbp52HWE2dzxo9hmZQXVcnbB1qykpTNxRYlNSAPvGSO4EBajTsiP6ngOltuyyjXwHpW2T1tLWrwi2Qtn9YeuyeWerRdXSTczQLeyN6AL4sYM0G9ZH2+ZVK6eh4z7ILvQ6+o+8uVXxiidQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uV5SLMS3H6B6AaR8xKi61QDL+J00STIokT8tvBZpedU=;
 b=UxwuKfyE85KaBnJV6kTl1yuYeJv8lwee0ScNc77lzUMpYMnfVO8YpyFGyXPWjFuIKu5fiYXWEpyICMuFjn5SfHQBRZ26/m7Y+9aHUwtYZFrBZUQsXxv8tV2OaSW9bqQUOlUIB8XsS4YmE4K/UlBYuf8w4Nf40FCon8VmhwystU47bvzn/tc6dVc0t0rXYHK2kDU5aTTwgwrd9LvtHg2/mGTT2bsi1e7BYi21UX1gMyC23adrlHWJtSA8Ec1ALGmS3CUF/i+IUrUr+3bMkgZo1LprhjTxaugP3U/PSdLYInw+9UkkVkoDo8gXeSvWKtY/jiDmuZKtFawUtF19Z+GV6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uV5SLMS3H6B6AaR8xKi61QDL+J00STIokT8tvBZpedU=;
 b=x2i5EYEa7dgEaaWDzzNXnl8NhLsyXUBPIOm+oNDhsHoIvzqlOF/cg3L0e00lpMJ8sh+Jxcy8ktWMKMNi+uFFrAFE0ZpZQdfMS2FndUYs6XvJuSOF4tQRDOWMk7wEMCearNLCXkpb6q8BqymgPJFgEdgKX4jXNruqAm8zzPVn5OYqqA/yFL8bVvpAjHb6UFpXYiFNHyjXCKrqEO4Ty+cpLl3wshh88iVeXz2CXjo6PuUskY7LJpvkJSVIhAk1oBKFScWPZWr6+D+33S5vqhnm30CpNYlFfF6qWx3JMA3RfVa3qQQ02pUE5szpFoWnm5dyDh4n1jV1iEvKsl0kb22zjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by AM8PR04MB7425.eurprd04.prod.outlook.com (2603:10a6:20b:1d6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 09:56:16 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 09:56:16 +0000
From: guoniu.zhou@oss.nxp.com
Date: Mon, 20 Jul 2026 17:59:46 +0800
Subject: [PATCH v13 1/3] media: dt-bindings: Add CSI Pixel Formatter DT
 bindings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-csi_formatter-v13-1-4dc9a80e4cfd@oss.nxp.com>
References: <20260720-csi_formatter-v13-0-4dc9a80e4cfd@oss.nxp.com>
In-Reply-To: <20260720-csi_formatter-v13-0-4dc9a80e4cfd@oss.nxp.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <frank.li@nxp.com>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Guoniu Zhou <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784541587; l=3877;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=/Ko4SnCdgWFQqzXj40GCNla/+xzXD7beCnJKpA2ezSA=;
 b=+ivtZoqKoyN8Wjw3J/nqjpbN+G0dziRU9mDOO0x92veaFilUX4sBl5NRg90ejYeCiWKjjUZEf
 j10LvuakqRwChL1CayLGkAqbPGVTRVjh3ZFLF4zS6cECPMB4SXG8vfs
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR06CA0004.apcprd06.prod.outlook.com
 (2603:1096:4:186::20) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|AM8PR04MB7425:EE_
X-MS-Office365-Filtering-Correlation-Id: d6a2897c-6185-4a23-b87b-08dee6452369
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|366016|23010399003|921020|18002099003|22082099003|10067099003|56012099006|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
 7FO0RGajvsp6S2gOSHpWyHOQPkZl1eE6ogRKSCUSQ0tCDsinAJLeejZ5t8NZuQMu3WiuwOKc29zqBTikk4L5v8YEQeBwyk9lvq+10mO9EGKEwv6+W6wMASpVmlHCEsYha1Hl5n3QpYKMgvMNnsV5jKYMGU5wOK7YtEH9wXyX4Yib2St4HFi9s9KuKFvf4ykIiDfEZ8ZECiLvE0ChMjWeIOjlfjZTiUkJfucKxRLsha/+0P4NdyfrW6ivnhuXVpvZejTrIzuDcOnTcKSEeE4TiBsGcl8+j51sn5TgEtBCLJUeDibW/TrNwwDLT0i9EDOThEgb6FlhVpMvbl7ywLVrFzM7e39sGf5MezjUKNqs/SOOdMG4UFUuttIFPm2djdh0MMXFXU8RIsS57D/DbsEJ2vV48Q93Wg6y1bjCiYEnaQKSGsZs7X1Z7x34EDiRZJSFtQqrA6nVV5VW1K72WGMoxxgD9Cv6u1A/pQsYKxxitVmqm+1WTT4dMOqq7PbtYCG+6JURji0MAH4CpiGAHoEVFDSsj7zWoa8oxCk1nOLjpJPSapLPRA6LElrbZ1zrQJXKihzUcMu40YAMekr0EZB+3Y1aoiDI8t5pd+Q+d9DfBdRXnRyb28jGBe3L6AlkzAdiiHOFbqm0JRMfJdR4eiHbBCF8Mfmxz8NaIJNhmb3roAc=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016)(23010399003)(921020)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?YVg2ZlZxa3BEMWh5bTRRdjNGM2FzcU85WWt3dnJrZTU3NmRPbTRSUG83TnVB?=
 =?utf-8?B?Q2ZjTXNzMUtGbnIxS0g1K0NXTEd0YWM0Tmp0dk5zK0tTVldoSjVnV2NoNXl1?=
 =?utf-8?B?T2Y1SGpaVldpSzlIL1p5aFZNMzVvRERMQ3grZHJvM3o4MFRXSDlhVjhWTUIx?=
 =?utf-8?B?aDVWclQwT05GWFNXOFpsNWNtYVcwdTJCUnRlcitFb3lTQTU1ajg0bURwM0ta?=
 =?utf-8?B?SStGZTQyL0tZS0hvaHpHUVlsS3J1ZWh5Ukcxd1hPMVNzN0cwK3pHUDV5UzVm?=
 =?utf-8?B?dk5VT1Z5T0JHY3BpbzFHMXoyY2MvT21JU3NTK3VuSEFPT3JuS2NXSG9tcDJv?=
 =?utf-8?B?ZU9xSnYxMm9aUmlqbndvMkxBaGxJL2JNS21qRDk0WFViVGdqUHB5d2toZW5u?=
 =?utf-8?B?NWNxWCs4eThEUUhseUJzcHlqQ1Q4dW5xWDFOaHFiWGtxSzFDdHpJemJWcVBa?=
 =?utf-8?B?K2xUNE0zbGpad1J1TWdZcHlRcCtReE9BTHo4SGNQYkkvZXg5K1FMRnplSVM0?=
 =?utf-8?B?TzV0L3ExT1JIdWhMYlcwUEVJV0NYQ2RtUGRoaHlRNkF3ZXdjZlRzVlYzeSsr?=
 =?utf-8?B?ck4vbGg3M3lOL09HRENZbUg0L2FHN2haNytDMjV2MzVSeVp0am5DT2xJQ3d2?=
 =?utf-8?B?SUJsOERhazJIQnd1K0JoT3d4eE1sRjFOMGNBRVVXMGROOUM2QmpJWkVvc2dD?=
 =?utf-8?B?VXgzRkMwcHBLd29qQjR3Q0lnNnE2eG9TWllkYnZxdXJCRTIzNUFySnVmNWVt?=
 =?utf-8?B?V29DMEF2c3FQREFFYVdjWU5wQXc4eHVOamRqbVkxTHkwcmlWbHZKUlhyNU40?=
 =?utf-8?B?TVh4TXpWWjBnSG56TTVYRkFERWdadWFLYkxhZlc5NVBUZ2NHWkVKSlVkc281?=
 =?utf-8?B?WXY5eXorRnVTSGF2Z0ExMm5OakVhZzdXc2U2RVB2WnZlRVZrUjdWc0tBcHRo?=
 =?utf-8?B?M2JSRExTeVdQS04vZThXT3g2MVVsZ2lQcm9xSXJDVjBxK0M3NGkxZ2tHakRB?=
 =?utf-8?B?TWxkVzc4OTJVV0lTdGtOdGdDY2lzbjBQRzdsYmpzUG1RM2g3Q1pJZzhyeVh2?=
 =?utf-8?B?a0tqd2RnWmUvWVFveE1JdlB6UzdHRU1hRzhaZnFNRnIrdWN3clMwcDRJdjlT?=
 =?utf-8?B?bnBOVzlGVWhBbW4vQkN3NU1MZDRjL0xkQ1FILzMxR3JtS2pGRUhkN1pzdEV2?=
 =?utf-8?B?Vk9lcENrQmFQWGJQM2NWK0NpNUNkR2w4dFcydzBYQW9mYnBLYitsemVoMjZu?=
 =?utf-8?B?UjFxVDg5YVRLeVFrMHh6c2hYNzdNbzM0aDI3akVFUThJWUVkbWNscG0yWHJV?=
 =?utf-8?B?Rjc4bmtKSDJGYi9pSGhmck5vQ25BRlgyK3BwbWZ0OGtXWHRURXUzZjVCQXpP?=
 =?utf-8?B?T1JNZ2N6QzlvY0lnUTlmOWRJYkV3U0ZJWmJWeEhLR2VuZEg5TUcwWXN6SXNr?=
 =?utf-8?B?M2dCWnZ5eFdkV0o5aTZtYXZaTUdzSEZndXdJQjkxTWtSckdoTUUzUFFlVGpl?=
 =?utf-8?B?Uk12NjBIaU9Xd29Qc2dqdXFXMHUxS0dZSU1ZeXU0ZU1UTUlPT0RjK213ZVpl?=
 =?utf-8?B?ekRWS0RWTXFFMDBid1ZvVzFqelo3Zzk0QmVHK0JlWklJSTgydFNTV0E4ZkhI?=
 =?utf-8?B?NzcwbEhoSkpTLzNtL1E0QStpVXowZ25JSjlLc1YxaDlhSjM0NHVsR2pCWm0x?=
 =?utf-8?B?L010cmIwUTV4ckN4dGh3dVo2UUpIcFdmckRkQUtJNEVaT0VVVXhJVnVRWklI?=
 =?utf-8?B?Yit6L1J3N3VSRUxHOUZhRnhWQ0tjN2RPMDFzN29MVGN5MGNIaWdINXNTd29z?=
 =?utf-8?B?MWZ4WWFhbjhTbGZUVzN0Uk45YWl4NWZZVmY0TG1FVE8rb3dvSUs4TmNYZnMw?=
 =?utf-8?B?K0FuNnI5NlhuL1VDWVYyek8zN0RYOU1Ub0dFcWlkZTdLamtnOUljTkcvMjd5?=
 =?utf-8?B?em1FeXM1bk83SWVpTy9FcHFmRHl1elpsSFllWDYxV0U0NUdRazBjNnZZSVNB?=
 =?utf-8?B?SUpJMGRjMzdCcUtMc1RTSUpsNzQrWGVSQklhRTB0NjlFc3VvS3lvcnNaV28y?=
 =?utf-8?B?N0dIQUZwaFdLdDdmQzFEbHU0M25VVmlYdUEzVGhPL0VQREZ1Y1gvenB0NTVS?=
 =?utf-8?B?UVRwbjNWUWVDd1VTalNYelgwWGttMnVTUUtMVWQrRCtIYzMxcVFzTEN0eXhv?=
 =?utf-8?B?N0pycjk3TWMyMldRRWRHVEpHN2ZmMzFjS2pQQ1U2SFlsancxbmpFZFpxOE9p?=
 =?utf-8?B?WFQyRkJiSGtkVkJ1WmFCUkFiWVpJaDJKdkhwdHNsZTN6RDJ1UGdxY0xhdzR5?=
 =?utf-8?B?MHNSdXg3RVdKdnNxdVBQRTBZeVM1UWlXQnYxdnF0OVowdVF3SFZwK2RIRUFB?=
 =?utf-8?Q?uz9edqGXSYUSjUInjtm4MMHdw1l1EhcrCqVRS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6a2897c-6185-4a23-b87b-08dee6452369
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 09:56:15.8536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H6hllnY1UXKD86IJttIUbmwOhcjSRdeYjvbefoGYASaDvwR2Q6DF6gsAw0cRB6tO4Tt6cdMuOGEVS0ZuIoj0zRFVO+6I20UVXRVlPUFR+dcgUEmf/yB3P17JoRA/R+PZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7425

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The i.MX95 CSI pixel formatting module uses packet info, pixel and
non-pixel data from the CSI-2 host controller and reformat them to
match Pixel Link(PL) definition.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v11:
- Add Rb tags from Frank Li and Krzysztof Kozlowski

Changes in v10:
- Drop syscon parent node from example
- Drop Reviewed-by tags from Frank and Krzysztof due to binding changes
- Add description for reg property
- Add space after formatter@20 before opening brace in example
- Enhance the port description with more detailed information
- Delete the blank line immediately following the endpoint in example

Changes in v9:
- Use direct node instead of syscon wrapper in example

Changes in v8:
- Use standard port reference instead of video-interfaces.yaml
- Add parent syscon node in example to show device integration
- Add required constraints for port@0 and port@1 in ports node

Changes in v7:
- Change compatible to imx95-csi-formatter as IP is i.MX95 specific per Marco's suggestion
  Link: https://lore.kernel.org/linux-media/20260511-csi_formatter-v6-0-01028e312e2b@oss.nxp.com/T/#mcd135b3de179b3cb69daa1fd6e0e8e27c85b3332
---
 .../bindings/media/fsl,imx95-csi-formatter.yaml    | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml b/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
new file mode 100644
index 000000000000..58c4e1cc056b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/fsl,imx95-csi-formatter.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX95 CSI Pixel Formatter
+
+maintainers:
+  - Guoniu Zhou <guoniu.zhou@nxp.com>
+
+description:
+  The CSI pixel formatting module found on i.MX95 uses packet info, pixel
+  and non-pixel data from the CSI-2 host controller and reformat them to
+  match Pixel Link(PL) definition.
+
+properties:
+  compatible:
+    const: fsl,imx95-csi-formatter
+
+  reg:
+    maxItems: 1
+    description: Register offset and size within the parent syscon
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Input port, connects to MIPI CSI-2 receiver output (IDI interface)
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output port, connects to ISI input via Pixel Link (PL)
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nxp,imx95-clock.h>
+
+    formatter@20 {
+        compatible = "fsl,imx95-csi-formatter";
+        reg = <0x20 0x100>;
+        clocks = <&cameramix_csr IMX95_CLK_CAMBLK_CSI2_FOR0>;
+        power-domains = <&scmi_devpd 3>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                endpoint {
+                    remote-endpoint = <&mipi_csi_0_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                endpoint {
+                    remote-endpoint = <&isi_in_2>;
+                };
+            };
+        };
+    };

-- 
2.34.1

