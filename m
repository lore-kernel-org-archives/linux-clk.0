Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012038.outbound.protection.outlook.com [52.101.48.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0902EA173;
	Tue, 16 Dec 2025 02:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765853005; cv=fail; b=lSBpQitSLuTqoZwO0t5jY3reIWaV3FXold8qskqfmQjbCeUQDRmbhWVZWeD2lXaEv2BarOGPZWikw7Ikp52k4KBdGNjbopfF/VTmmmXJd/jb2Uo5Cazo9vyR/lPAz8FTB5ppNFVRhcudMgSVLa3mZPXdBRVaGEZIDZX+U4sgeww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765853005; c=relaxed/simple;
	bh=Z0ZbwNNT3cEgzLwA8VNnfbY81iOP3c7RMJUpjGJiFgI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qziTTeLlptP+7jtoOJ2zJIvadmtO9g3vfYF6zxPpbJmx0pu3I2p79JnnqrGpW/hgk2RWVUgde89quwgfjS8nVaBcJizp5qj+BRk+lAbw4XQsaH/CRuFAccfghnR20HbLsgxJ/S9GdxKiDhKQ5mXBhxgnVnDNcOXF8j3+dLu/H4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=oSqn+GQ0; arc=fail smtp.client-ip=52.101.48.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="oSqn+GQ0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OgHmnCH1pD0fHsLpLIWcc9QH4LENF2JryeNV2n+qS64uCOAokpVGeNrGWByl0cU0dFtM/s0CD/inuEiykDDQ8VxCgL7fUxlhqu8hlXjcEqBYtE9w0D3spZtK1oicMQAQplAiCC73VGjtqNqkONAOTeQzXOnIP3Xx/pHb0fx1i2f3MuqW2PLyN/hIpElrTafR6ob6a1t/Qs9weKobuMlo/f+AtlExEFa96OZ16AwcbnYme137sOFqMbuiuOlCx9sWvyG1Urp6/e5/QBvHTvE4eFAHFML6CTSb+C1H9Zq9cItlp9h974al3GvqWG3FWkiOc6TF/XWerTBx0u9An3BI+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOa7hW6GDMblRWQVncjIyFH25gscflfdpDrX4rFwr64=;
 b=cxDZoA1w0/iBGGH/QP/ih1XfOE6B/O3vmClx81zP77jVNe6/xBtpj31gHQpD940+nB1w/A6a5Madl3krYDz97tpklY9D3i8d1KB4ZvJ99tGISUlE7f8LTy3yxsdcbZyC8adUkzks9NQZTCaiRcYIRu5IyKj/mn4X3pIE0SNjyuxce5C12yQCDrJ5bAKdOrbZ3OEnYf3+Aye+lOw0gL0HFwi6FMAp30Z08c9F9FK8MVK/QQqpyojaYV/ruaRp18rFEMLImWL3IbrU+LZjUiCcIRQKkNzVznu/AHvlba+QCXUPOHpIoCVmoNqxcDvm0NxM71kaqpi6Uk7ub3KroQj2JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOa7hW6GDMblRWQVncjIyFH25gscflfdpDrX4rFwr64=;
 b=oSqn+GQ0RzP/ID1t/3Ro7w0SWnUrYUyg5TS1APZZ6g9Zw4Nm7R/73y/CSAGKTijyN80DqUwxtZ3BCHD74J1H9Yic3NFyfDWQortwR0mZCaJVElryAbjsxhrorkKmDIf8PawdIS8Lc7ex9JlJU7Mm8Dw1eD/uh/o2HBVgg2vOGh8=
Received: from CH2PR02CA0027.namprd02.prod.outlook.com (2603:10b6:610:4e::37)
 by BL3PR10MB6138.namprd10.prod.outlook.com (2603:10b6:208:3b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 02:43:19 +0000
Received: from DS2PEPF00003441.namprd04.prod.outlook.com
 (2603:10b6:610:4e:cafe::c6) by CH2PR02CA0027.outlook.office365.com
 (2603:10b6:610:4e::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Tue,
 16 Dec 2025 02:43:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS2PEPF00003441.mail.protection.outlook.com (10.167.17.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Tue, 16 Dec 2025 02:43:18 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 20:43:11 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 20:43:11 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 15 Dec 2025 20:43:11 -0600
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BG2h52c3405277;
	Mon, 15 Dec 2025 20:43:06 -0600
Message-ID: <6252026b-15c8-4243-8db7-efa0ef0b2fd7@ti.com>
Date: Tue, 16 Dec 2025 08:13:04 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] firmware: ti_sci: add BOARDCFG_MANAGED mode
 support
To: "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>, Nishanth Menon
	<nm@ti.com>, Tero Kristo <kristo@kernel.org>, Santosh Shilimkar
	<ssantosh@kernel.org>, Michael Turquette <mturquette@baylibre.com>, "Stephen
 Boyd" <sboyd@kernel.org>
CC: Gregory CLEMENT <gregory.clement@bootlin.com>,
	<richard.genoud@bootlin.com>, Prasanth Mantena <p-mantena@ti.com>, "Abhash
 Kumar" <a-kumar2@ti.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <u-kumar1@ti.com>
References: <20251205-ti-sci-jacinto-s2r-restore-irq-v3-0-d06963974ad4@bootlin.com>
 <20251205-ti-sci-jacinto-s2r-restore-irq-v3-1-d06963974ad4@bootlin.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20251205-ti-sci-jacinto-s2r-restore-irq-v3-1-d06963974ad4@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003441:EE_|BL3PR10MB6138:EE_
X-MS-Office365-Filtering-Correlation-Id: b64a5ad1-9ed7-4cfa-b466-08de3c4cdeca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|7416014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cTM3UDJJRHpqRHB4LytrZTdIWjAzcFhlSmR1NXQ1c0htenZ6dW5DY016cndI?=
 =?utf-8?B?WXVNSWFxS2RGZlZvOWFwcXZSOTYvKzlLQWFTckhFZm9hZWFBSmJmdXNqNHZv?=
 =?utf-8?B?ckFRMFJ6ZzMzeVZBS0lGVm8zb1hUWW9Kc3pka3FCa2prSE5VL3pCWkxRMXp2?=
 =?utf-8?B?MW1YbnJKcmxjRU1LcWpqUktZUlYvb0pYaWVWUEE2OE1SdUs4WXg2TCtzUkJi?=
 =?utf-8?B?MjQzN3BqOTFTVHB0bVIzK05NQXlmb1U4STMzNi84M1Juc0xlZmtTeU1zTzI5?=
 =?utf-8?B?RWhsQ3FjMEZ1M3VRSnFNSjEyVld1cFFJQUNNNHdpKzB1TVY0WjdWZzFQZjhX?=
 =?utf-8?B?ODd1K29LZXNHYldwdSt5SUh2bG9Xb3djV1poRHovRTQvR3lpNXl4MUIwU2l0?=
 =?utf-8?B?eERRQXFmVzlBQ3h2N1RpNHAxdGl2T2NGY2x6VnFFRndQTDM4MTNkWDd2NWZB?=
 =?utf-8?B?VWw5VFhQeGhGQ1gxL1F2OGl2RFIzcjRKc05BRnZueXJlaG9yZmFXMDJxRUow?=
 =?utf-8?B?VEFVajliSlFsRHYzZ2JROTI2ZmpLSWRFbW1aSEF1Mm04ai85NytHeXN6QXhK?=
 =?utf-8?B?a1NJUXd2ODRZb1hLUWQ4Q09wMVlZbkNPUXZMSFNCWUJ0SzBCSUtMaUo4bmZx?=
 =?utf-8?B?MmJvM1ZsUjZuWm9udmhPZkVrOTBOelIzMjFLVFVoRHRvY042M2tqYlZhNkFW?=
 =?utf-8?B?Ky82bnhUUHRrNUtJWEpLckJNaGgzOEhLa2JzWDhxcnFlSWZYeG5oOVVFRm1W?=
 =?utf-8?B?RHZUU2JEdzNNc3ZNZityQ2lYUzZ0a1VtVnZtc216V0VoMG1uQmNtZFg1amtC?=
 =?utf-8?B?VEhYRTg1ZkpQQVpISTdiVUdWeEZWSUh2QXZBckUzRXBlZVV6T2c5SmVWZjFt?=
 =?utf-8?B?ZE94empkRTVxVDF4TWY1bTFCcVRFQmpDZ2FtRGxiM2VqTEVjd0VwQ0hZVnRr?=
 =?utf-8?B?OGhhSHl4MWZzbzEvaEhWWGorblJXdlBOTFM2S0RRZ2VzQnlMYnBqUmtEMzN2?=
 =?utf-8?B?L0pCcFcranJmQndSNWNRS0c0QTBSUE5MVWgxNHcxUWtBU2tLamdPYzlRWmI0?=
 =?utf-8?B?YTVRNmU5OTczM3RqaWRoYlZ3VFk3cTdvMlN4aysyeU5vcHZ6SVJocmhuWkVR?=
 =?utf-8?B?dEwwbExaRStZSm1SY3BaYlhERCtWSHU4Z1ZvVGQ0cHpyMlN4a1NreEhvRFRN?=
 =?utf-8?B?bnlka2d2UlBjbHlnL1VZQWxmeFRES0h4U0NBRzBxeXFPNlRjQk1GRDlLNWpB?=
 =?utf-8?B?aDkwdks5cjErU1hDR1IrT09nSzltWkFkREdSTE40QnAyMWxFaUZsZTFuazZB?=
 =?utf-8?B?ZWlpQ1lkbXV3SEhxeVNGSmZWVTR3QXhkYTNLdllIZnBXNnpwbE9BQ3BCVkhV?=
 =?utf-8?B?QzVsRVpMSnVBM0xaUGhwTnJqYmF3a1pMRjdJNWs5N0tmSUpTRkpsODhCd1NT?=
 =?utf-8?B?ODA2aGthcTl4cUlVYmpSS3J3VUlyTmlpY1JPN3A2bVlmdEJPeWI4MmxYelEx?=
 =?utf-8?B?TFgyZjRNekJMVXltSHowZ1VJcEI0YlpnS0FUVW1lQW16V1htdFRPZkhSUzB0?=
 =?utf-8?B?T0I3N09QQzZpWHNwancxK3Vtc1FLNW91Q3AvNjg3TVk1ZTBLZGJob1BNNDlk?=
 =?utf-8?B?NSsySi9CSXNOQTRFZk5sZjBCL084TEFSbkJBa0oxZ3VZemh3UnBmYnRuK0pz?=
 =?utf-8?B?TFlYUkxLM21jbXNZU0RUTzVFYWx3NkJ2UDdsdENwZEltWUllODVUUlZBaU1Z?=
 =?utf-8?B?SDhtT2NYM0FjOTlPbzliQzBEWllJNXlHb3dEU25BYy9lUzBHZUZWd2k2UlJM?=
 =?utf-8?B?TVhOYlVpd2lUM2Z5cEpPc21ETXV4cVFqZE9zak1XZVIxWG9Ub3VYOEhvdHd0?=
 =?utf-8?B?a2puZ1dma0Y1d3Vmb1RaVzdPWGZUaTIrdlRnLzRFVnNyM0tEc2k2MnNjbjBn?=
 =?utf-8?B?bFo5a0Z2MDVXSmx1dGlEcHNmZVRUOG8yd0pWUmdhRkk0djcwOVJDOHJqcEI0?=
 =?utf-8?B?SVlVUVRlUDdaL2l2QWN1Ym5jTmRwQ0Q4Umx0Ull3T2dJSnVORVZVR3E3Z0hY?=
 =?utf-8?B?eC9Gb3lWTnd4RXRNaktRTzBIeFFhWkxzdmlHNjk1cjIveVFVZmMxYm5YV2Rv?=
 =?utf-8?Q?PQ4Q=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(7416014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 02:43:18.5579
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b64a5ad1-9ed7-4cfa-b466-08de3c4cdeca
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003441.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6138


On 12/5/2025 7:58 PM, Thomas Richard (TI.com) wrote:
> In BOARDCFG_MANAGED mode, the low power mode configuration is done
> statically for the DM via the boardcfg. Constraints are not supported, and
> prepare_sleep() is not needed.
>
> Signed-off-by: Thomas Richard (TI.com) <thomas.richard@bootlin.com>
> ---
>   drivers/firmware/ti_sci.c | 10 +++++++---
>   drivers/firmware/ti_sci.h |  2 ++
>   2 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
> index 4a277937211f6..d77b631d9c855 100644
> --- a/drivers/firmware/ti_sci.c
> +++ b/drivers/firmware/ti_sci.c
> @@ -3772,8 +3772,11 @@ static int ti_sci_prepare_system_suspend(struct ti_sci_info *info)
>   			return ti_sci_cmd_prepare_sleep(&info->handle,
>   							TISCI_MSG_VALUE_SLEEP_MODE_DM_MANAGED,
>   							0, 0, 0);
> +		} else if (info->fw_caps & MSG_FLAG_CAPS_LPM_BOARDCFG_MANAGED) {
> +			/* Nothing to do in the BOARDCFG_MANAGED mode */
> +			return 0;
>   		} else {
> -			/* DM Managed is not supported by the firmware. */
> +			/* DM Managed and BoardCfg Managed are not supported by the firmware. */
>   			dev_err(info->dev, "Suspend to memory is not supported by the firmware\n");
>   			return -EOPNOTSUPP;
>   		}
> @@ -4011,12 +4014,13 @@ static int ti_sci_probe(struct platform_device *pdev)
>   	}
>   
>   	ti_sci_msg_cmd_query_fw_caps(&info->handle, &info->fw_caps);
> -	dev_dbg(dev, "Detected firmware capabilities: %s%s%s%s%s\n",
> +	dev_dbg(dev, "Detected firmware capabilities: %s%s%s%s%s%s\n",
>   		info->fw_caps & MSG_FLAG_CAPS_GENERIC ? "Generic" : "",
>   		info->fw_caps & MSG_FLAG_CAPS_LPM_PARTIAL_IO ? " Partial-IO" : "",
>   		info->fw_caps & MSG_FLAG_CAPS_LPM_DM_MANAGED ? " DM-Managed" : "",
>   		info->fw_caps & MSG_FLAG_CAPS_LPM_ABORT ? " LPM-Abort" : "",
> -		info->fw_caps & MSG_FLAG_CAPS_IO_ISOLATION ? " IO-Isolation" : ""
> +		info->fw_caps & MSG_FLAG_CAPS_IO_ISOLATION ? " IO-Isolation" : "",
> +		info->fw_caps & MSG_FLAG_CAPS_LPM_BOARDCFG_MANAGED ? " BoardConfig-Managed" : ""
>   	);
>   
>   	ti_sci_setup_ops(info);
> diff --git a/drivers/firmware/ti_sci.h b/drivers/firmware/ti_sci.h
> index 91f234550c438..5f5c1ae7a19a8 100644
> --- a/drivers/firmware/ti_sci.h
> +++ b/drivers/firmware/ti_sci.h
> @@ -150,6 +150,7 @@ struct ti_sci_msg_req_reboot {
>    *		MSG_FLAG_CAPS_LPM_DM_MANAGED: LPM can be managed by DM
>    *		MSG_FLAG_CAPS_LPM_ABORT: Abort entry to LPM
>    *		MSG_FLAG_CAPS_IO_ISOLATION: IO Isolation support
> + *		MSG_FLAG_CAPS_LPM_BOARDCFG_MANAGED: LPM config done statically for the DM via boardcfg
>    *
>    * Response to a generic message with message type TI_SCI_MSG_QUERY_FW_CAPS
>    * providing currently available SOC/firmware capabilities. SoC that don't
> @@ -162,6 +163,7 @@ struct ti_sci_msg_resp_query_fw_caps {
>   #define MSG_FLAG_CAPS_LPM_DM_MANAGED	TI_SCI_MSG_FLAG(5)
>   #define MSG_FLAG_CAPS_LPM_ABORT		TI_SCI_MSG_FLAG(9)
>   #define MSG_FLAG_CAPS_IO_ISOLATION	TI_SCI_MSG_FLAG(7)
> +#define MSG_FLAG_CAPS_LPM_BOARDCFG_MANAGED	TI_SCI_MSG_FLAG(10)


I think, you already noticed, this should be bit-12


>   #define MSG_MASK_CAPS_LPM		GENMASK_ULL(4, 1)
>   	u64 fw_caps;
>   } __packed;
>
