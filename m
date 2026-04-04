Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013006.outbound.protection.outlook.com [40.107.159.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DE72C1584;
	Sat,  4 Apr 2026 01:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775267460; cv=fail; b=p6hGyPFb0JfUwJ99MELuIRInDiDxcyIt5KM58BudUAITlGsLWBATIHtC6DXCQ9UVrj2thLetCacFuBzohM9vDtO8FwowckJHXbUaN960bNrcr+f1i3pNzB7HdL/CiDbrOgIlQk/RBE6k9T9oFsMH+XHKLOQsDJ5GJZr262W70Ec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775267460; c=relaxed/simple;
	bh=fUTmdNaz4ggsJ8pzAzYQpxWUM3cvcD+j+ljPxujx4Eo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=W7/HP3IYwYfLXB0SkHl84+uGzj/ahFk/S7WILOBscNP3eAFxoQqwavB7ukKmbZ5Wp/kML0Kr9QO0RfpqYe7IytjSSAN1IXPMgHSzSTZtB4JAEatf1yBbYJFnC6jx+NpUJW9bRC/gll7zj3EVlxNRZauXYStMwcsgc9jjFCYc7nY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QSuux0nK; arc=fail smtp.client-ip=40.107.159.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QSuux0nK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SruMO0SnbLiTqw4b8ICwxrl6EIkwbxL4uj7/iysVzB4yWK8bqSBh9YSDwZVd9iCLiNdbtmaKLUa+ruRd/CHUg+WNEB3i9lxY09KAhDhETZW14ZsNFIVZTMeKE8HOYvNCGZVEwOMR5bv8EVxJMjJ8h5mBO01cmeup7hDBNeMt0SXlttaD+wSQMYXjsMAwqyAy249AmXg6C7k1lL3EzVKfgPr/Fbz6lpfTKMFr7cJCFnOtOxsupRW8JFAlF5CSPNbjtPGRBNJIqeQ5Ci00dSCSzNNG+dPQ1+zgsYJLJzzY0AVqJhljqToLF44LNyagmh38m3AtEGhtreIf4UJgINpRpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k02SYCywFKl8Dkl+jhFYzUp1AW6vMoWxo58poDyz+tM=;
 b=KQ2FOeGoUrh436WmthvTI7squYhrkG8qb/oQD5v5KMX86GfEsQauBECRxnl0c2v3Q6dh0uzZoIhhQXFhVbMWIxemJ2Ic8AUIOLhynF6DGUmbQvRZK5K++4t3JqIBnMQKTAmK36GPqf6PhFWj6OgNxkWrHDi9Jwss7iscwhJdcrKqK+5dwdUH8q/cKg6tq7pFHUNNAzWggp7cst/A2X6vJU4PJuWqGqku2apSum2Bww08PFNHtBUqLK52k+UEXpvOjjfQDrVpzb7JwOZfGIsddQPyjqIVkdz/gOFCG6Q8fFtau+YIhyQVzU/HMNKslWuEKoFJJZSTj8M1v5B+N5AqYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k02SYCywFKl8Dkl+jhFYzUp1AW6vMoWxo58poDyz+tM=;
 b=QSuux0nKsl09bs3lI2mWqDV9r2hkEJGXyPYUsMOze4LNgPed0O+oNKJIQpLudUWKkzR8bN2CPSdFS/+6REmxsAr+W4LtaNTNzreWH9ipMeiBFLVhyi3nb6/QFTxoxgaOHhAr9Jh28WZUT1ggumIHY+OVyLHc+812mX+Itp2fMya1q3ytpCWCing17zaZPHjkNLsel5bSKxdowpQt61IPHGkZkY3P6VodhaYV8yzQtNPrncR9RSu+SXjRCDs+6F+7bH9iXa/LMtuHThJ1dmTN3Xu7mogi68haF13qhGxd1DSURjT8K6UJmZblY89m7+6VSQL5RGz4myzKmMjXf0/vxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU4PR04MB10839.eurprd04.prod.outlook.com (2603:10a6:10:592::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Sat, 4 Apr
 2026 01:50:52 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Sat, 4 Apr 2026
 01:50:52 +0000
Date: Sat, 4 Apr 2026 09:53:10 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Brian Masney <bmasney@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RFC 0/2] clk: scmi: =?utf-8?Q?D?=
 =?utf-8?Q?T_support_for_SCMI_clock_rate_rounding_modes_=28per=E2=80=91clo?=
 =?utf-8?Q?ck?= policy)
Message-ID: <adBvBmOu2IyK0lwn@shlinux89>
References: <20260306-scmi-clk-round-v1-0-61e2a5df9051@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260306-scmi-clk-round-v1-0-61e2a5df9051@nxp.com>
X-ClientProxiedBy: MA5PR01CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::17) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU4PR04MB10839:EE_
X-MS-Office365-Filtering-Correlation-Id: 1826b3d9-2916-4ad0-5f89-08de91ec9a4d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|52116014|7416014|376014|366016|56012099003|38350700014|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KTRVIU77/Xk1ugrjVa/srI6YsTGpk5/OT1MLVAUObT3UYCjto8HBOSYWU+ipCcUvaYZh/JSjFblxhBPJvfbT77p/7ISh6qZYRzMyv4MJ1Y5UxnGL1oSjYfwJACB/0fgeEyEeoqu8IW68Dx+ov8ncHiWlz0SZZ5KiKuyIVBnupM1WA+tfxs5jBdZfHKfTsdeNlCVqHAXTezphe1QciUHkLSvtizG1CGcMa/tBHpIfn98i5HnvYbRux3hqXsuuCjtGiShUEz2gZqU+wUnpFpu+hKLVucGCD38387KZ/p8bP1UCBmMBYDAL2aEeUZAgSAiYt1+AY8VxiQXXmAHLAUWyq0aaRlYKaTA/FzaKjwfaj7fLWSl4QRfr46xGXdWTkumYYE4eAfhjlQq+rpZ7DqkLFt/wb8viR1rXShELsi4aCQX6ka8/Lwfps16cb+5Tto00aWXhLz8oP4ubBjgKNVEKAhUjNzfXMR9YXiz73Uab/8/4J2yiDhmMfgtu60hm7C+cqfepcIuzuJ/eKwR+NF4ryj+MoARUEuLeAPO3yX/jPLYoWniCsDraZN+9Ac58ZMbw1AFA0S125XJ1hI4Y1i8JADAUe8JH6kbUg3dKZ5OAhmUEg8JsvHeR6uIpMRy0uFU058kLO+8lC6Iu8rG5H2smdmYIvIMGJBjZNKEHVXfgZQFcMtZMZ52X73ySoLx9tz3+9mC60tDOZNoYmYPYmYznP1hNdbo8NSrwcCL5VKQOlfcVu8PkLkTuDCOwa3tg+fdu6JL8cqSexpi7mCXjxzdoW1qQmNv3hNbEO8xf0E+T/AA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(52116014)(7416014)(376014)(366016)(56012099003)(38350700014)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUtQeG54emlIS2VveTJXckVpR1dCQ24reGFuV1p4ZWRhSmFJOU5mR1orM0cy?=
 =?utf-8?B?MWtURWo3QXB1TXp6K1RzUnRkb0NIenl6a2ZWQlI2c0ZWSUt0THRuNEZUMWZi?=
 =?utf-8?B?S2UvM21kb2JpbGZRVnV5VFdGZVg4Y2RjaDJuU0ZoT1Ewc0Z4czNQMWsrR05h?=
 =?utf-8?B?aVNTc2p6b3Qra0NFTngxVUsvR0M4N1IvSlZiSUp0U0M5b0F0UXhTekJhS1ZY?=
 =?utf-8?B?TFZETEN4V0ZEL24wSWJjYWk5Rjd3cStXRDNPUjJBMU9xN1JoOFRmSnYxZHdU?=
 =?utf-8?B?RUdjR2FFb0xpOHlsSGZwUExBRkU5ZGd6dEVERVpOVGdZTjJoaGF2WVg1WjRX?=
 =?utf-8?B?TGQxemNta0VRemVCNUpYM2FWalowc0ZNUFovbWljbW5UUkk1N05rRFMyR0JE?=
 =?utf-8?B?SnBJVS8zVkNxTWJsUCtFM0hBck0xMXIramY2UlRBM210cmNKbm02SjFBaWpx?=
 =?utf-8?B?NU1CV0U3NU1YT3dOQmhKdFNWZVkzdjVIZ0JOb1dxelBvQ0NoK1hHL2kzVklI?=
 =?utf-8?B?U3RXdEJRVUVlZmFsOTY2cnZJcnpTWjk5L2tuelBoa3hPWU42T2o1RVpCVHR1?=
 =?utf-8?B?ZXpXaUhJbDhSNHFUY2ppRVZPVEVBenlocTY1YkJVZGpCZzIxTHhxN1FlUkhx?=
 =?utf-8?B?WjFTaERYRGpqZlZzNE9pd3lOekt4TUpybWMvbGpZTVVqY3gvbUlOSWR3d1Yr?=
 =?utf-8?B?Q253ZXlOYlpIdFlXbzhpTUI5L3hzZ0E3UnhHM0UvaTlIOWxrRjZFcy9TTU00?=
 =?utf-8?B?TlduWHhBQXErMm9hVllTM3pRRVdwbm4ycVhyNS9hNkdWaXQ1Z2UzaTZYSWVC?=
 =?utf-8?B?Z1VlQXRmbTdrOVhjVWxmNStDODg0WFZGMFlVUkdRNVpZWGptU2xIV0EwTTJ6?=
 =?utf-8?B?czhTd1o5U0xkeGE5WjFZL0t2aElZbVBkemx3UkdnK3BxR3hhUkxrcHV6Zktk?=
 =?utf-8?B?SGYzZEVsb0I1RE5SZTZ4L0ZvUTFUQitmcWh2aFU4dzBoc2J6OEZOVDNsSHVB?=
 =?utf-8?B?YUJjNVhDajdTa21wMHN3d0dGRXdXY1JSY0E3SzNlY0tXblk4UmlXMW82cDRw?=
 =?utf-8?B?QnZnOTRRVHRscWRoYy9VUURHQWpyRGN2WTB0R2QxYUp4aVJOTllJcURLT0Rm?=
 =?utf-8?B?cWNCZnN3Umc4TU9MTWtBd2UyYXRhREdNR0Q0QjdjT1UrVzZNSWZsWDNHT0VQ?=
 =?utf-8?B?Wm15SkFhMFppSHpyS3pyZEFyOGF5ZEY2VXpuWWwyb1o5aUxWa3dXOE1DZStz?=
 =?utf-8?B?WVh6NkdrSXNqdSsrYTV3bDFtVFNwRlR6WkRFS1ljTFVNRWV5dndFL0dyZEdq?=
 =?utf-8?B?L2cvTDBhNmhVVGI3QXcxeGtQeEs1eFRvK0hkajI1RkNyLzNlQ2xxTGkxVHdF?=
 =?utf-8?B?Qkl4ZjlFMG9ZbkRMOFlnaUo5YnMva3R0TW45cmhqN01NaERGSTVUMTBKV01v?=
 =?utf-8?B?SnhGeUd4MGpXUllneXN1QUpERisyQkZlajVyc0ptWGpleis3YkRsK1QrMnM5?=
 =?utf-8?B?Vk43ZHJFbW1ZUzhUWjdnV2xvQ3pZVjRhWXJBOTgrWm1iSHl3b2pBZ0ZJWUxN?=
 =?utf-8?B?OVBhenlvc1I2T2swRC9OUDBZVGtGTkdwcDh2OVVOb0owRm11T2J3dWg2QjZW?=
 =?utf-8?B?VGN1a0Z3UUtHWDhWNmtjQVEwaGlqekozV0dhUXdvVG5zMmh1dDcrRnA4eGIv?=
 =?utf-8?B?NFFKYXNwUTE5SU5DMmkzYldieHFDRlUyZDN1WU83aldxRjE1amJ5TEdxQUcx?=
 =?utf-8?B?UzlGMDBNZ0EzL0tOR3E0VGQ1bk5KMzdHVXdrMHNZS2tmTk5WVk14NTk2OSt1?=
 =?utf-8?B?bnNZTzVya3VkL1kwcWllVjQ1MGJCOEJ0cDBlSGUyTyswTFhEWHdWdmJra09B?=
 =?utf-8?B?bE01cG5VOC9oOFNxbnEyM01BcjJ2bkl6VXlSU3JFU2dGYm55cFpvc1BtU1BZ?=
 =?utf-8?B?OTFpUFQ0UysrRkFSRkU3SmsvSjZ6alV0TlNUU0ZhMHdJNlpyVUVKS2lsTmF3?=
 =?utf-8?B?K0trM0kyR3JWbW1tWHRHV2FNdjBTU3JMMSs3OE9IWmVlV2c4RGplZ3JabXc3?=
 =?utf-8?B?cjh0bzZtMU1Kek1zWWI2d24yWTN6WUt6S1l3R2ZXbWVLUUZxWVlNcm9iVGpG?=
 =?utf-8?B?OHU0WlhDTXQwRHhGOXI4NFExU25YdzkzTEIwTWpKYXdrdGZORFN3RWZ0d09T?=
 =?utf-8?B?TzU0VmVlM1hVVXRaOG4zZUJXSHgwTFU2TjRTbDRNbVBJNHpIYWkxWFpCZkVa?=
 =?utf-8?B?TkJhR0tZbW1Qb1lUcGFic2JOemkrRzhsTVY4cW9RL3ZvaUhEelMrZzhGdGVN?=
 =?utf-8?B?ZWwxNklJZ0ZnelNlUGJ2TjFuVmpTeThpeVduN1pOMmdRVWd0aXQvUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1826b3d9-2916-4ad0-5f89-08de91ec9a4d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2026 01:50:52.2219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +6pLchEg8LKpu5/vEJ/QeOuufNKNAbU3KaIzmxpU9RFpgaBfEPyTxZFnuT9e3W4i7S/mCo6j50MVAbgr19d/7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10839

Hi All,

On Fri, Mar 06, 2026 at 02:20:11PM +0800, Peng Fan (OSS) wrote:
>The ARM SCMI specification (DEN0056E) defines rounding‑mode flags for the
>CLOCK_RATE_SET command, allowing a client to request that the firmware
>round a requested clock rate down, up, or autonomously choose the
>closest achievable rate.

Would you please give a look and give some feedback?

Thanks,
Peng

>This series introduces DT support in the SCMI clock provider to carry a
>per‑clock rounding policy from the device tree into the SCMI protocol.
>
>Patch 1 adds dt‑bindings constants for rounding modes:
>ROUND_DOWN, ROUND_UP, ROUND_AUTO.
>
>Patch 2 extends the SCMI clock provider to optionally support
>"#clock-cells = <2>", where the second cell encodes the rounding mode.
>The first consumer that references a given clock latches the per‑clock
>policy. Subsequent consumers of the same clock must specify the same
>mode; otherwise, the request is rejected to avoid non‑deterministic
>behavior. The selected mode is passed through to the SCMI Clock protocol
>and mapped to the corresponding CLOCK_SET_* flag.
>
>Patch 2 includes changes to drivers/clk/clk-scmi.c and drivers/firmware
>arm_scmi/clock.c, it is hard to separate the changes without breaking,
>so I put the changes in one patch.
>
>This design adopts a per‑clock policy model, not per‑consumer. The rounding
>mode is applied by the provider per clock (index).
>All consumers of the same clock must agree on the rounding mode.
>Conflicting per‑consumer requests for the same clock are invalid and
>are rejected during phandle translation.
>
>This avoids silent clobbering and preserves deterministic behavior.
>
>Existing device trees using #clock-cells = <1> continue to work and
>default to ROUND_DOWN, exactly as before.
>
>Signed-off-by: Peng Fan <peng.fan@nxp.com>
>---
>Peng Fan (2):
>      dt-bindings: clock: Add SCMI clock rounding mode declarations
>      clk: scmi: Add support for two #clock-cells to pass rate rounding mode
>
> drivers/clk/clk-scmi.c            | 62 +++++++++++++++++++++++++++++++++++++--
> drivers/firmware/arm_scmi/clock.c | 15 ++++++++--
> include/dt-bindings/clock/scmi.h  | 13 ++++++++
> include/linux/scmi_protocol.h     |  8 ++++-
> 4 files changed, 92 insertions(+), 6 deletions(-)
>---
>base-commit: 3f9cd19e764b782706dbaacc69e502099cb014ba
>change-id: 20260306-scmi-clk-round-1615258cf0fa
>
>Best regards,
>-- 
>Peng Fan <peng.fan@nxp.com>
>
