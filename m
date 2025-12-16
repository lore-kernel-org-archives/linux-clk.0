Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010015.outbound.protection.outlook.com [52.101.61.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F42CA6B;
	Tue, 16 Dec 2025 02:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765853262; cv=fail; b=lxlXlvWRoBGtGNqbKOZC/1eb3HuDSB2cJyEb9TXh8RRiSTNimjkNcisN1dZz7z+CQgzBdqtzdoF/PaZnt0hZEGJLmKpJiVMqeLTyWVR7LvjNmPnOxVouiUCmfAkZEWsjZqtLVSfB1MbinywMkTMFG2vG6TXWhJNrG7TbRwu8Nx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765853262; c=relaxed/simple;
	bh=h34B4JM2x6iOlf8Zm/xRFdgXfJQccQj1D+7AKo+ZikM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qYfuCwoahVc41YU6WWVDr7kGOT7FXoxCd5CLnZU+Xge7F571jHvNtcnaLCqVW992Q08U80C91380F7qA7k+a+Yka9GQHeSADwxzAKge1/fj1xsiKoBZlmxeUWgWcziCeLni9VIau9FlQ5Asax3VQLbnFmFiL8vgVNnibE74Y/MA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=M3V9/2FL; arc=fail smtp.client-ip=52.101.61.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="M3V9/2FL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TyywCBsA3cmKX52iPYTJ6Wl9Ae3yaQntKPHViceHmxhdIFbPWGcdbA3sDP6NXy9as+wazjBO5YKkcZk8mn7vm0ZzRacxKon3WtufzXp/oeNt8s/qOBKbYF0vSABItYtXQYlt4OlxnOeiXAvtNtYTH9O1Y8kswmdspNYNdUe1ZZLQGZnHV2uPG2rvguGc9pdwT3cJpUSHVU3ZYpws8M4jx8ts0wDWzL2jATyBVVC8yeE0DQiK3yiP6D709sJ6FAENoodg3qHwob3XyuTL9eMvVbrAyAxg17GPkL6ngSAcdkDOt1lMvLp1Shw6VSZKiHpY9vwmSbbyCtT8gdUXnzSw1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mFmwq27Jh6UjHIGZPQ8wDURlVZiNx+GmNfAbKPGHaXA=;
 b=psN1ZKE+M273FSroOk2BDEpaD2QzGL4Do43N8rW/XiRG6TK50nm2r5LmWdNpXiANoKUcrm60mGWlo1hDTUW1LO9HIOYj+CFBq1D0UQ7inbmBpH94ZpNdQkfpVMK0uZE9gOfeCNPgqyT8sh1VNKmkdAkFOHATI5+oCGAHmIv9WqBM9rcEdFVolSJFsofFAmeY3rhhSTmRzt1tg5H46Q7H8QFJyrQGOEVdx30X86emfwSbznKmWICT+xugNfB7wggIKWrxMw1Z88yf5NOuQ+o5XdjD48ws1AKi+q3+yXLET8C7svoZDelUlCkq6v7GhT5YhHp00PW/c10vG+YYnmIXHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mFmwq27Jh6UjHIGZPQ8wDURlVZiNx+GmNfAbKPGHaXA=;
 b=M3V9/2FLP347LYE6fJL5+d+y0IXpm/pk9Rd3+CE8AK82A3UvjlXA+McITC+GpxpggoeQWCaf4p1dw6CTOrtpZ7rNAqobDWO5tmMRdluWTHuwaPPmhCOZYW7xTQugL62A2HRY5oSRMz38nI0jZn5mcEZQ1dYWxhcH8Ob2Mlr2NIk=
Received: from BL1PR13CA0196.namprd13.prod.outlook.com (2603:10b6:208:2be::21)
 by SJ0PR10MB4621.namprd10.prod.outlook.com (2603:10b6:a03:2d1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 02:47:38 +0000
Received: from BN2PEPF000044A5.namprd04.prod.outlook.com
 (2603:10b6:208:2be:cafe::77) by BL1PR13CA0196.outlook.office365.com
 (2603:10b6:208:2be::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Tue,
 16 Dec 2025 02:47:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF000044A5.mail.protection.outlook.com (10.167.243.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Tue, 16 Dec 2025 02:47:37 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 20:47:30 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 20:47:30 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 15 Dec 2025 20:47:30 -0600
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BG2lOK63409889;
	Mon, 15 Dec 2025 20:47:25 -0600
Message-ID: <bcc7a3da-3cb5-451b-98eb-4f7896c615a1@ti.com>
Date: Tue, 16 Dec 2025 08:17:24 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] firmware: ti_sci: handle IRQ restore in
 BOARDCFG_MANAGED mode during resume
To: "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>, Nishanth Menon
	<nm@ti.com>, Tero Kristo <kristo@kernel.org>, Santosh Shilimkar
	<ssantosh@kernel.org>, Michael Turquette <mturquette@baylibre.com>, "Stephen
 Boyd" <sboyd@kernel.org>, Dhruva Gole <d-gole@ti.com>
CC: Gregory CLEMENT <gregory.clement@bootlin.com>,
	<richard.genoud@bootlin.com>, Prasanth Mantena <p-mantena@ti.com>, "Abhash
 Kumar" <a-kumar2@ti.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <u-kumar1@ti.com>
References: <20251205-ti-sci-jacinto-s2r-restore-irq-v3-0-d06963974ad4@bootlin.com>
 <20251205-ti-sci-jacinto-s2r-restore-irq-v3-2-d06963974ad4@bootlin.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20251205-ti-sci-jacinto-s2r-restore-irq-v3-2-d06963974ad4@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A5:EE_|SJ0PR10MB4621:EE_
X-MS-Office365-Filtering-Correlation-Id: 3187d0a1-b5aa-4e72-c132-08de3c4d794e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TURmWFpPZHZmUHI3RFpKQ2JGakVKd3I4Z1ZNd1FZeVJYeGQrTjFSZHF5ZmFK?=
 =?utf-8?B?eFkwK0w0c1ErVm9RSzlzdDNKZW1PWjdKZkc0WDZyTXdBa1VrQU9jSmFuK3dE?=
 =?utf-8?B?SEpoT2hEN2NMaGxzcmU4Ykl1M2JjZStSV1NMejNuWkV0cTBJYU4zelAwRHVh?=
 =?utf-8?B?YS9wTHpkYXBuaVNCMVZ1Z2xLOU0rVXJCbFhTRzM2MlNtcDVoSEd5QkZkT1BT?=
 =?utf-8?B?UjF4N05ZdEg5UVRKdlp2OVFvMk1TRklqMDNQdFp6T1M3bmJaK1UyVENub3lp?=
 =?utf-8?B?a1lFc0xHMmJ2dlc3cWUzM0lzeWZ4a0p0M20zeUwxTDZTVnVpYlNiamRHSStG?=
 =?utf-8?B?VU9CS1dMM28rV21HWkpLa2JUOFMwcHZQVHRtNmloK085ckMzK1FOMkxDUFRS?=
 =?utf-8?B?bEpSdUV6anNrL3dqVmtWL2dDb3IxcDNzOEJXZFRlcFhWVWUyZUNBMEk3aVg4?=
 =?utf-8?B?bTBrcldaZkpzRFF2TjBwTndGd3A1bVdpUXV3NXpaMi9GQUVCMHhVeitCc3FV?=
 =?utf-8?B?K21nYlorVFNBQ3ZMeS9BbzRrRndnMllJbHZveE9YM09JMHpTT0FUdkoyNVQv?=
 =?utf-8?B?TTNGaVZqSDlHOHQxdDY4WTFZVFpSL0prbkZUNEUyS2hhVFVXV05kdTNObGVt?=
 =?utf-8?B?V25KeEZESlAvK3Q5K203UXFXVk5DcWdhMDA1bFhUU3FiL2VqRTlTNTVNSWNF?=
 =?utf-8?B?STV1OXh2WjVQR3RwQUpSNHBjelRrUnVCWDJLdEhISVNJWVZBZW81dFd6L1dW?=
 =?utf-8?B?bzVkOTFqL0F4MXFmOHY5djJkd0U0ZTNpcElYQXFDMWFVbUJzcFBMSDB5VEtn?=
 =?utf-8?B?ZTl6QS9oTlBsd1h2cVpLTFlGZ1pjNzhuKzk0b09KTEU1TmlzZm5KNzlzNWF6?=
 =?utf-8?B?b0kyTTdacmdXN0pBVFM3ZVhBMVR6L2VadEVWVHU4Qlk5KzRqTDA0WDYrU1NN?=
 =?utf-8?B?NEttT0gzTGhEMUhEMDVpZTlSRTNTOHVKdTJZMUhMbmhzK1EvODl0TXZYTWZT?=
 =?utf-8?B?RmNLaGo3RkN5U2Z1dWFVelBLaDZiVEhNVEpjMGE3YlNOZGJjSUZ2K0dCNjRk?=
 =?utf-8?B?bHQxUWdvb0gyVEdtRVZ3NUp5MmpNUHZ2Mm53NHBUaGpGVDROazhXRzhXQlNy?=
 =?utf-8?B?cVJMUVpXQjBobnIzdlJXQzBtL2daRnlraU00TTNZYks2WW0yWjA5NUJtbHRU?=
 =?utf-8?B?MTZZU0FKcHFxQVN5SitWTmMrTmxneVFVcnNwRnNLaDQwR3RmSjdiQXdqSHNq?=
 =?utf-8?B?NEswNW9mbWhEb2E1dkc5WGE4dWhJTDBZNU5ybGlKZStxMU12cTdHNjBHZk1I?=
 =?utf-8?B?SmVEajBtSXZycklKejhGS0tLblVDVjVlSEhndWZBREE3ZUxRWUhpT0p6amJ4?=
 =?utf-8?B?TVRnaXdGT1AyTFVraEo3aHpuNTV6Y1o5V0VpZHpENGo3MkR0TElTNHRDdXNa?=
 =?utf-8?B?QjdNY1ZqbG9OUXhaWUQ0YWd1V2tZVndRVkd6Y3ptZGY1SjNXVFJscHluUDNl?=
 =?utf-8?B?UWNGbmJsVzdkZlRSNmU2NkNsQUs0UDVrSnU3NjRYSWRJUFZsbXhZdmFUZXRs?=
 =?utf-8?B?dm5kL0RmZERPbjVmNG9DNVFMUjJFWUZ2U3dJTlZ0dVFxZy9LSGJLbnp5cXNy?=
 =?utf-8?B?SWtnblhRVCtOd3VhWk4zM2ViZGpIc0VSbUQ5QXBNYkJMcGFOSkZmVi9CbXM5?=
 =?utf-8?B?R29oeEFobW45cUgzYS9uQ0o5U0poRXdwUGRQZ2JzNjNKU2FaMmFFMlI0S2NS?=
 =?utf-8?B?cEVvZy9LV1YyYjZ0R1I5UXBUSTJGTHowbW41eDR4Vis2aEg1UHpNelMvaCtv?=
 =?utf-8?B?LzU5VU9CbXJiUmkwbkhXcTdMQTlZTitLdzBNcFNXSFN5cDAwbVppZk9LSm1I?=
 =?utf-8?B?TFJGczczNkxEdGJlV3FvdXFPYmh5aUdGS0pCRFIvOUJQMlU1dEhMWHpSUktC?=
 =?utf-8?B?Tzk1SmJhZ2x6QWJFNm9xWjhNcHF5VDBmTWJyM3lpYU9LbGVuc3RGVk5TLzF1?=
 =?utf-8?B?YUwrLzgwaHgzUlRPblYzQlQrYy84N3hPSlJFTTc4eWpoRmpOL3E2ZGJkalFk?=
 =?utf-8?B?TlNHQ2FJeWxVNXQwMzZGY3kvLytML253SGt1MGxCS2EwVkNOdk44TnJLVlQy?=
 =?utf-8?Q?FUGE=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 02:47:37.7327
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3187d0a1-b5aa-4e72-c132-08de3c4d794e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4621


On 12/5/2025 7:58 PM, Thomas Richard (TI.com) wrote:
> In BOARDCFG_MANAGED mode, the firmware cannot restore IRQs during
> resume. This responsibility is delegated to the ti_sci driver,
> which maintains an internal list of all requested IRQs. This list
> is updated on each set/free operation, and all IRQs are restored
> during the resume_noirq() phase.
>
> Signed-off-by: Thomas Richard (TI.com) <thomas.richard@bootlin.com>
> ---
>   drivers/firmware/ti_sci.c | 147 +++++++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 138 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
> index d77b631d9c855..8d94745376e2a 100644
> --- a/drivers/firmware/ti_sci.c
> +++ b/drivers/firmware/ti_sci.c
> @@ -12,6 +12,7 @@
>   #include <linux/cpu.h>
>   #include <linux/debugfs.h>
>   #include <linux/export.h>
> +#include <linux/hashtable.h>
>   #include <linux/io.h>
>   #include <linux/iopoll.h>
>   #include <linux/kernel.h>
> @@ -87,6 +88,16 @@ struct ti_sci_desc {
>   	int max_msg_size;
>   };
>   
> +/**
> + * struct ti_sci_irq - Description of allocated irqs
> + * @node: Link to hash table
> + * @desc: Description of the irq
> + */
> +struct ti_sci_irq {
> +	struct hlist_node node;
> +	struct ti_sci_msg_req_manage_irq desc;
> +};
> +
>   /**
>    * struct ti_sci_info - Structure representing a TI SCI instance
>    * @dev:	Device pointer
> @@ -101,6 +112,7 @@ struct ti_sci_desc {
>    * @chan_rx:	Receive mailbox channel
>    * @minfo:	Message info
>    * @node:	list head
> + * @irqs:	List of allocated irqs
>    * @host_id:	Host ID
>    * @fw_caps:	FW/SoC low power capabilities
>    * @users:	Number of users of this instance
> @@ -117,6 +129,7 @@ struct ti_sci_info {
>   	struct mbox_chan *chan_tx;
>   	struct mbox_chan *chan_rx;
>   	struct ti_sci_xfers_info minfo;
> +	DECLARE_HASHTABLE(irqs, 8);
>   	struct list_head node;
>   	u8 host_id;
>   	u64 fw_caps;
> @@ -2301,6 +2314,32 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
>   	return ret;
>   }
>   
> +/**
> + * ti_sci_irq_hash() - Helper API to compute irq hash for the hash table.
> + * @irq:	irq to hash
> + *
> + * Return: the computed hash value.
> + */
> +static int ti_sci_irq_hash(struct ti_sci_msg_req_manage_irq *irq)
> +{
> +	return irq->src_id ^ irq->src_index;
> +}
> +
> +/**
> + * ti_sci_irq_equal() - Helper API to compare two irqs (generic headers are not
> + *                       compared)
> + * @irq_a:	irq_a to compare
> + * @irq_b:	irq_b to compare
> + *
> + * Return: true if the two irqs are equal, else false.
> + */
> +static bool ti_sci_irq_equal(struct ti_sci_msg_req_manage_irq *irq_a,
> +			     struct ti_sci_msg_req_manage_irq *irq_b)
> +{
> +	return !memcmp(&irq_a->valid_params, &irq_b->valid_params,
> +		       sizeof(*irq_a) - sizeof(irq_a->hdr));
> +}
> +
>   /**
>    * ti_sci_set_irq() - Helper api to configure the irq route between the
>    *		      requested source and destination
> @@ -2324,15 +2363,43 @@ static int ti_sci_set_irq(const struct ti_sci_handle *handle, u32 valid_params,
>   			  u16 dst_host_irq, u16 ia_id, u16 vint,
>   			  u16 global_event, u8 vint_status_bit, u8 s_host)
>   {
> +	struct ti_sci_info *info = handle_to_ti_sci_info(handle);
> +	struct ti_sci_msg_req_manage_irq *desc;
> +	struct ti_sci_irq *irq;
> +	int ret;
> +
>   	pr_debug("%s: IRQ set with valid_params = 0x%x from src = %d, index = %d, to dst = %d, irq = %d,via ia_id = %d, vint = %d, global event = %d,status_bit = %d\n",
>   		 __func__, valid_params, src_id, src_index,
>   		 dst_id, dst_host_irq, ia_id, vint, global_event,
>   		 vint_status_bit);
>   
> -	return ti_sci_manage_irq(handle, valid_params, src_id, src_index,
> -				 dst_id, dst_host_irq, ia_id, vint,
> -				 global_event, vint_status_bit, s_host,
> -				 TI_SCI_MSG_SET_IRQ);
> +	ret = ti_sci_manage_irq(handle, valid_params, src_id, src_index,
> +				dst_id, dst_host_irq, ia_id, vint,
> +				global_event, vint_status_bit, s_host,
> +				TI_SCI_MSG_SET_IRQ);
> +
> +	if (ret)
> +		return ret;
> +
> +	irq = kzalloc(sizeof(*irq), GFP_KERNEL);
> +	if (!irq)
> +		return -ENOMEM;
> +
> +	desc = &irq->desc;
> +	desc->valid_params = valid_params;
> +	desc->src_id = src_id;
> +	desc->src_index = src_index;
> +	desc->dst_id = dst_id;
> +	desc->dst_host_irq = dst_host_irq;
> +	desc->ia_id = ia_id;
> +	desc->vint = vint;
> +	desc->global_event = global_event;
> +	desc->vint_status_bit = vint_status_bit;
> +	desc->secondary_host = s_host;
> +
> +	hash_add(info->irqs, &irq->node, ti_sci_irq_hash(desc));
> +
> +	return 0;
>   }
>   
>   /**
> @@ -2358,15 +2425,46 @@ static int ti_sci_free_irq(const struct ti_sci_handle *handle, u32 valid_params,
>   			   u16 dst_host_irq, u16 ia_id, u16 vint,
>   			   u16 global_event, u8 vint_status_bit, u8 s_host)
>   {
> +	struct ti_sci_info *info = handle_to_ti_sci_info(handle);
> +	struct ti_sci_msg_req_manage_irq irq_desc;
> +	struct ti_sci_irq *this_irq;
> +	struct hlist_node *tmp_node;
> +	int ret;
> +
>   	pr_debug("%s: IRQ release with valid_params = 0x%x from src = %d, index = %d, to dst = %d, irq = %d,via ia_id = %d, vint = %d, global event = %d,status_bit = %d\n",
>   		 __func__, valid_params, src_id, src_index,
>   		 dst_id, dst_host_irq, ia_id, vint, global_event,
>   		 vint_status_bit);
>   
> -	return ti_sci_manage_irq(handle, valid_params, src_id, src_index,
> -				 dst_id, dst_host_irq, ia_id, vint,
> -				 global_event, vint_status_bit, s_host,
> -				 TI_SCI_MSG_FREE_IRQ);
> +	ret = ti_sci_manage_irq(handle, valid_params, src_id, src_index,
> +				dst_id, dst_host_irq, ia_id, vint,
> +				global_event, vint_status_bit, s_host,
> +				TI_SCI_MSG_FREE_IRQ);
> +
> +	if (ret)
> +		return ret;
> +
> +	irq_desc.valid_params = valid_params;
> +	irq_desc.src_id = src_id;
> +	irq_desc.src_index = src_index;
> +	irq_desc.dst_id = dst_id;
> +	irq_desc.dst_host_irq = dst_host_irq;
> +	irq_desc.ia_id = ia_id;
> +	irq_desc.vint = vint;
> +	irq_desc.global_event = global_event;
> +	irq_desc.vint_status_bit = vint_status_bit;
> +	irq_desc.secondary_host = s_host;
> +
> +	hash_for_each_possible_safe(info->irqs, this_irq, tmp_node, node,
> +				    ti_sci_irq_hash(&irq_desc)) {
> +		if (ti_sci_irq_equal(&irq_desc, &this_irq->desc)) {
> +			hlist_del(&this_irq->node);
> +			kfree(this_irq);
> +			return 0;


IMO,  you can restrict saving of irq and list management to fw having

BOARDCFG_MANAGED capability.

Dhurva ?


> +		}
> +	}
> +
> +	return 0;
>   }
>   
>   /**
> [..]
