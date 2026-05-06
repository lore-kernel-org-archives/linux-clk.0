Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010050.outbound.protection.outlook.com [52.101.193.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41B748123F;
	Wed,  6 May 2026 14:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778076926; cv=fail; b=QLrMkA4jHXTp7WRQ046fRct6/lzS9cBGdk0bTCwDUmzPDrnHGIJ9EmTPu4wmrhfnhM552vv6TrXglqKPrAY0Zu7KDkc2R8IB9ydXehZwvOonhppQJ8aoF2/Gul4mtX28SIsixrwJ9JMwh0LfOZCOHFPConRa3+3yhc4bGAi1Fis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778076926; c=relaxed/simple;
	bh=YOiGcxzMn0dIL5j+4+J0d+AIbP2BDUd2QRdafECwp7U=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=inx65poaBM5MvtexetQ2O/LjgJn6uHCOYPfk9gCnzv6LX1yyDhTDX9aDrJyizp+eGgCqoXuYapm/U8teMmHuaIVGm/VaphM4uI2dk7/YxS7cwpP1Vgb7BqKGQSt961sm+fe2/INWgh8pYhbZ8lE2Y/w/3ywz44hrdIiRmXE9kYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=sOBSZLQt; arc=fail smtp.client-ip=52.101.193.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="sOBSZLQt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iR0QZdaALoHKK5Bipoo3KHu3/VMWw9joO7v9kdEpXY/wWxLT+7Lp+gfok4ECqa8UXz1N2uBGbU0PoCFD4CLarzQK2N7B5SRdTKJDoGcyHUoNlrnpM30/62xbFPIK/CFBE1p5AnCke2nfRKZwILcsxa6FYr+yk41Chxki7y+UqhY78Q13PZ5OVROW9wmQe3T30C7FM1DIiuzyyN461DhMiCRLH9HXywVB/vVunjZWYng/Ec0h5IK5OqmkLXcjCv8tcS+8scHGI1AHwQf9BxOZRtHjtjSj9PslOTSOGyAq2IeryLpyl6TauNpwVQLIGMJLFnqZ3m81oI06cOq37Tq9xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WnThrl+Qqu3j5GecU4BqkBsrN8gbtQgRaGOyADgSPR0=;
 b=vZxfyoDDwQ4huRvSMU4r2FVLvATRHPyqEs2sVpHv02OxehniV8LnQljychAm9Ke/T30hEA3WqVjVWMZgMQH7xIB/Z1lkg6Owl6S/u2irbmxWx8kAkQEgzSnBnw2CQj5PzWJ0YIyx8oRO7wgoyW/SMb97vNF6aqmWSFOLWAKpAerGYBq3DH24V9ki84/+z9PNg0t189L8p7Zpn7nxDMUE3aP7FAnfi2LI/T+6V7/WHJcHU6YfPhZvvRKuj9p7vSAjh9Sl+3Wq39NCBOod7q/u1o9W1Kw8lWosQ85wcUbBzIFvFnUTszFsCiHuxctKC8a39/aTjQVnXSE5sXIiUet3zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WnThrl+Qqu3j5GecU4BqkBsrN8gbtQgRaGOyADgSPR0=;
 b=sOBSZLQtThhuPUS5Es2dkvY7/1fVQ8M8mEiMweVfFQ8AByLdBhlFoskHUdz1M2Sg6+GZXjJaA8hGijFb7AW1xJOsGmS14NHcb7WTxyeGF2MOEPNoEfQkH/bAnW4J9/XmbYXH7se+3LvP09LiVNFv/+rpKhG9Rw3d/mzvOOwGL18=
Received: from DS7PR03CA0355.namprd03.prod.outlook.com (2603:10b6:8:55::30) by
 SA6PR10MB8157.namprd10.prod.outlook.com (2603:10b6:806:438::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.15; Wed, 6 May 2026 14:15:18 +0000
Received: from CY4PEPF0000E9DA.namprd05.prod.outlook.com
 (2603:10b6:8:55:cafe::8f) by DS7PR03CA0355.outlook.office365.com
 (2603:10b6:8:55::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Wed,
 6 May 2026 14:15:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000E9DA.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Wed, 6 May 2026 14:15:16 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 09:15:09 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 09:15:08 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 6 May 2026 09:15:08 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 646EF89v1231580;
	Wed, 6 May 2026 09:15:08 -0500
Date: Wed, 6 May 2026 09:15:08 -0500
From: Nishanth Menon <nm@ti.com>
To: "Thomas Richard (TI)" <thomas.richard@bootlin.com>
CC: Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Gregory CLEMENT <gregory.clement@bootlin.com>, <richard.genoud@bootlin.com>,
	Udit Kumar <u-kumar1@ti.com>, Abhash Kumar <a-kumar2@ti.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, Dhruva Gole <d-gole@ti.com>, Kendall Willis
	<k-willis@ti.com>
Subject: Re: [PATCH v7 2/4] firmware: ti_sci: add support for restoring IRQs
 during resume
Message-ID: <20260506141508.2bko3ntcv7rkqfvn@certainty>
References: <20260506-ti-sci-jacinto-s2r-restore-irq-v7-0-037098a35215@bootlin.com>
 <20260506-ti-sci-jacinto-s2r-restore-irq-v7-2-037098a35215@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260506-ti-sci-jacinto-s2r-restore-irq-v7-2-037098a35215@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DA:EE_|SA6PR10MB8157:EE_
X-MS-Office365-Filtering-Correlation-Id: 9664a763-5b62-4a1a-2873-08deab79e5c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4A8boPl/JS6E8f2+fvTtvuW7mAxSmeLjbQV0RUt6rFAsyhSDuHpSbELzY65zRNejPaOKXWM6BPF8YrAI7bZjEkyA81Zwb2hicZ8VPOlLLnHWs+UG6LwaB00HNN4SdaiLYvsrTb7raM9qWX5oc8kCpQYbc8nkSZ3bJBgIpdiFe9jIUp5jh+3/7LW96PyxdV1finmP/7+FQ7VMMKDbN+h9sTi8y+GIDKUgfGGO12nOO9Kux5De7qrAghrf9pFQfIV/nCRCDwmr78pXSPnsRvSmv4+wf3BtzFzGbn0wK16bhm60kkYd6WUarNGmEBVrrMYlUQeqkNkOU8hSulxsU5iN33sFMbu0GHUEo0kzWfD0nosnElGaRMsGHnaLqwq0sajWi+1UCOOyI2ajPv385RYBx/pLalfPXWUDxktF9qfAzu2pIpvgt9sSlx1dLyEO9PVDCj6rVr5Tm1nIS8ckwjE0YwLGS9Aoo5TcSNhKiUVocIANbXtoBlEbQgE344IzvZ6fg/0EpQk5OGxTRQjYTawnC+QRVU58CUSeQRHjtwabv7dOXZOJdjeabucC4RONknltzkz7CB0LHMQXiimD9TL+XqnfmlOL0x1wRhMZxD7fjU1T7OZpYRUeszBbS+mSgKyxy2shlkm5X0ovePKnd8tGcvBjmgbOEvCHPQJWXt2AbVPEurcYUrrsB02K9MGvMOR9Ekjq3u5QscTjWqMWc/R2EFTLEIEHXTIzkhIUXBFnNI0=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+CIYS36I6zFo4wfrdtPxQSqV7PhhT1tQqadc2U0uUmk5cWGFtDe+vdb3FzDBJ8VEnCx3r+CmZyX49eULpOCx321Hcwmfen9dV+jXYDSLE+srGE1Xu1V70UWWsppJfkxKqqnifHMA+8sQl8PtwoYNuSDJNQ+TtrUjj603GFvR1BXZuf4e6v7LfH0XqZaCRcg50G/tVFcwV1AXNKZJDJ68ng4FISJ+J0dxoTQ6VdTefe18wXbarCKRL/mRAI8aTP/3mifURC3IZ5zjgAYjbDYAo/xDY0eAHw3XaeCZrTbSAQ1h/bTaxGzlFW3cbYNyVCGlnItYB4pssKB/cv5Q0izQJ9ICwFdPx7UhipaYBTg21fV12hGjG8ZBZxUL6yX3kz8uWVDUb4IwYiZfr0NksEpamZz77cVoRkqjSovF09c4B/RCsAkPqiuCQDDCRZEJxUxv
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 14:15:16.6467
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9664a763-5b62-4a1a-2873-08deab79e5c2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8157

On 10:35-20260506, Thomas Richard (TI) wrote:
> Some DM-Firmware are not able to restore the IRQ context after a
> suspend-resume. The IRQ_CONTEXT_LOST firmware capability has been
> introduced to identify this characteristic. In this case the
> responsibility is delegated to the ti_sci driver, which maintains an
> internal list of all requested IRQs. This list is updated on each
> set()/free() operation, and all IRQs are restored during the resume_noirq()
> phase.
> 
> Reviewed-by: Dhruva Gole <d-gole@ti.com>
> Reviewed-by: Kendall Willis <k-willis@ti.com>
> Signed-off-by: Thomas Richard (TI) <thomas.richard@bootlin.com>
> ---

coccicheck reports two additional warnings at this patch:
+drivers/firmware/ti_sci.c:2495:1-7: preceding lock on line 2454
+drivers/firmware/ti_sci.c:2420:1-7: preceding lock on line 2378

>  drivers/firmware/ti_sci.c | 201 +++++++++++++++++++++++++++++++++++++++++++---
>  drivers/firmware/ti_sci.h |   2 +
>  2 files changed, 191 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
> index eaeaaae94142..531ac3aa38b8 100644
> --- a/drivers/firmware/ti_sci.c
> +++ b/drivers/firmware/ti_sci.c
> @@ -12,11 +12,13 @@
>  #include <linux/cpu.h>
>  #include <linux/debugfs.h>
>  #include <linux/export.h>
> +#include <linux/hashtable.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
>  #include <linux/kernel.h>
>  #include <linux/mailbox_client.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> @@ -87,6 +89,16 @@ struct ti_sci_desc {
>  	int max_msg_size;
>  };
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
>  /**
>   * struct ti_sci_info - Structure representing a TI SCI instance
>   * @dev:	Device pointer
> @@ -101,6 +113,8 @@ struct ti_sci_desc {
>   * @chan_rx:	Receive mailbox channel
>   * @minfo:	Message info
>   * @node:	list head
> + * @irqs:	List of allocated irqs
> + * @irq_lock:	Protection for irq hash list
>   * @host_id:	Host ID
>   * @fw_caps:	FW/SoC low power capabilities
>   * @users:	Number of users of this instance
> @@ -118,6 +132,8 @@ struct ti_sci_info {
>  	struct mbox_chan *chan_rx;
>  	struct ti_sci_xfers_info minfo;
>  	struct list_head node;
> +	DECLARE_HASHTABLE(irqs, 8);
> +	struct mutex irq_lock;

No action needed: checkpatch flags this as not documented, when it is
clearly documented above.

>  	u8 host_id;
>  	u64 fw_caps;
>  	/* protected by ti_sci_list_mutex */
> @@ -2301,6 +2317,32 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
>  	return ret;
>  }
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
>  /**
>   * ti_sci_set_irq() - Helper api to configure the irq route between the
>   *		      requested source and destination
> @@ -2324,15 +2366,60 @@ static int ti_sci_set_irq(const struct ti_sci_handle *handle, u32 valid_params,
>  			  u16 dst_host_irq, u16 ia_id, u16 vint,
>  			  u16 global_event, u8 vint_status_bit, u8 s_host)
>  {
> +	struct ti_sci_info *info = handle_to_ti_sci_info(handle);
> +	struct ti_sci_msg_req_manage_irq *desc;
> +	struct ti_sci_irq *irq;
> +	int ret;
> +
> +	/*
> +	 * Lock for set_irq() and free_irq() to keep the IRQ hash list
> +	 * consistent only if MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST is set. Else
> +	 * IRQ hash list is not used.
> +	 */
> +	if (info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST)
> +		mutex_lock(&info->irq_lock);
> +
>  	pr_debug("%s: IRQ set with valid_params = 0x%x from src = %d, index = %d, to dst = %d, irq = %d,via ia_id = %d, vint = %d, global event = %d,status_bit = %d\n",
>  		 __func__, valid_params, src_id, src_index,
>  		 dst_id, dst_host_irq, ia_id, vint, global_event,
>  		 vint_status_bit);
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
> +	if (ret || !(info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST))
> +		goto end;
> +
> +	irq = kzalloc_obj(*irq, GFP_KERNEL);
> +	if (!irq) {
> +		ti_sci_manage_irq(handle, valid_params, src_id, src_index,
> +				  dst_id, dst_host_irq, ia_id, vint,
> +				  global_event, vint_status_bit, s_host,
> +				  TI_SCI_MSG_FREE_IRQ);
> +		ret = -ENOMEM;
> +		goto end;
> +	}
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
> +end:
> +	if (info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST)
> +		mutex_unlock(&info->irq_lock);
> +	return ret;
>  }
>  
>  /**
> @@ -2358,15 +2445,56 @@ static int ti_sci_free_irq(const struct ti_sci_handle *handle, u32 valid_params,
>  			   u16 dst_host_irq, u16 ia_id, u16 vint,
>  			   u16 global_event, u8 vint_status_bit, u8 s_host)
>  {
> +	struct ti_sci_info *info = handle_to_ti_sci_info(handle);
> +	struct ti_sci_msg_req_manage_irq irq_desc;
> +	struct device *dev = info->dev;
> +	struct ti_sci_irq *this_irq;
> +	struct hlist_node *tmp_node;
> +	int ret;
> +
> +	if (info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST)
> +		mutex_lock(&info->irq_lock);
> +
>  	pr_debug("%s: IRQ release with valid_params = 0x%x from src = %d, index = %d, to dst = %d, irq = %d,via ia_id = %d, vint = %d, global event = %d,status_bit = %d\n",
>  		 __func__, valid_params, src_id, src_index,
>  		 dst_id, dst_host_irq, ia_id, vint, global_event,
>  		 vint_status_bit);
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
> +	if (ret || !(info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST))
> +		goto end;
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
> +			goto end;
> +		}
> +	}
> +
> +	dev_warn(dev, "%s: should not be here, IRQ was not found in hash list\n",
> +		 __func__);
> +
> +end:
> +	if (info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST)
> +		mutex_unlock(&info->irq_lock);
> +	return ret;
>  }
>  
>  /**
> @@ -3847,7 +3975,10 @@ static int ti_sci_suspend_noirq(struct device *dev)
>  static int ti_sci_resume_noirq(struct device *dev)
>  {
>  	struct ti_sci_info *info = dev_get_drvdata(dev);
> -	int ret = 0;
> +	struct ti_sci_msg_req_manage_irq *irq_desc;
> +	struct ti_sci_irq *irq;
> +	struct hlist_node *tmp_node;
> +	int ret = 0, err = 0, i;
>  	u32 source;
>  	u64 time;
>  	u8 pin;
> @@ -3859,13 +3990,50 @@ static int ti_sci_resume_noirq(struct device *dev)
>  			return ret;
>  	}
>  
> +	switch (pm_suspend_target_state) {
> +	case PM_SUSPEND_MEM:
> +		if (info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST) {
> +			hash_for_each_safe(info->irqs, i, tmp_node, irq, node) {
> +				irq_desc = &irq->desc;
> +				ret = ti_sci_manage_irq(&info->handle,
> +							irq_desc->valid_params,
> +							irq_desc->src_id,
> +							irq_desc->src_index,
> +							irq_desc->dst_id,
> +							irq_desc->dst_host_irq,
> +							irq_desc->ia_id,
> +							irq_desc->vint,
> +							irq_desc->global_event,
> +							irq_desc->vint_status_bit,
> +							irq_desc->secondary_host,
> +							TI_SCI_MSG_SET_IRQ);
> +				if (ret) {
> +					dev_err(dev, "failed to restore IRQ with valid_params = 0x%x from src = %d, index = %d, to dst = %d, irq = %d,via ia_id = %d, vint = %d, global event = %d,status_bit = %d\n",

space before via? overall this print is needed, but a bit umm.. we have
similar ones already..

> +						irq_desc->valid_params,
> +						irq_desc->src_id,
> +						irq_desc->src_index,
> +						irq_desc->dst_id,
> +						irq_desc->dst_host_irq,
> +						irq_desc->ia_id,
> +						irq_desc->vint,
> +						irq_desc->global_event,
> +						irq_desc->vint_status_bit);
> +					err = ret;
> +				}
> +			}
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
>  	ret = ti_sci_msg_cmd_lpm_wake_reason(&info->handle, &source, &time, &pin, &mode);
>  	/* Do not fail to resume on error as the wake reason is not critical */
>  	if (!ret)
>  		dev_info(dev, "ti_sci: wakeup source:0x%x, pin:0x%x, mode:0x%x\n",
>  			 source, pin, mode);
>  
> -	return 0;
> +	return err;
>  }
>  
>  static void ti_sci_pm_complete(struct device *dev)
> @@ -4014,13 +4182,14 @@ static int ti_sci_probe(struct platform_device *pdev)
>  	}
>  
>  	ti_sci_msg_cmd_query_fw_caps(&info->handle, &info->fw_caps);
> -	dev_dbg(dev, "Detected firmware capabilities: %s%s%s%s%s%s\n",
> +	dev_dbg(dev, "Detected firmware capabilities: %s%s%s%s%s%s%s\n",
>  		info->fw_caps & MSG_FLAG_CAPS_GENERIC ? "Generic" : "",
>  		info->fw_caps & MSG_FLAG_CAPS_LPM_PARTIAL_IO ? " Partial-IO" : "",
>  		info->fw_caps & MSG_FLAG_CAPS_LPM_DM_MANAGED ? " DM-Managed" : "",
>  		info->fw_caps & MSG_FLAG_CAPS_LPM_ABORT ? " LPM-Abort" : "",
>  		info->fw_caps & MSG_FLAG_CAPS_IO_ISOLATION ? " IO-Isolation" : "",
> -		info->fw_caps & MSG_FLAG_CAPS_LPM_BOARDCFG_MANAGED ? " BoardConfig-Managed" : ""
> +		info->fw_caps & MSG_FLAG_CAPS_LPM_BOARDCFG_MANAGED ? " BoardConfig-Managed" : "",
> +		info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST ? " IRQ-Context-Lost" : ""
>  	);
>  
>  	ti_sci_setup_ops(info);
> @@ -4053,6 +4222,14 @@ static int ti_sci_probe(struct platform_device *pdev)
>  	list_add_tail(&info->node, &ti_sci_list);
>  	mutex_unlock(&ti_sci_list_mutex);
>  
> +	if (info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST) {
> +		ret = devm_mutex_init(dev, &info->irq_lock);
> +		if (ret)
> +			return ret;

If devm_mutex_init() fails, the function returns directly rather than
going through the out: label. All other error paths after the mailbox
channel allocations use goto out, which calls mbox_free_channel() for
both channels. Since mbox_request_channel_byname() is not a devm
allocation, those channels would not be freed by the devm cleanup path
on probe failure.

Does this leak info->chan_tx and info->chan_rx when devm_mutex_init()
returns an error?
> +
> +		hash_init(info->irqs);
> +	}
> +
>  	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
>  	if (ret) {
>  		dev_err(dev, "platform_populate failed %pe\n", ERR_PTR(ret));
> diff --git a/drivers/firmware/ti_sci.h b/drivers/firmware/ti_sci.h
> index d90de59e29eb..67f16e8c69a1 100644
> --- a/drivers/firmware/ti_sci.h
> +++ b/drivers/firmware/ti_sci.h
> @@ -151,6 +151,7 @@ struct ti_sci_msg_req_reboot {
>   *		MSG_FLAG_CAPS_LPM_ABORT: Abort entry to LPM
>   *		MSG_FLAG_CAPS_IO_ISOLATION: IO Isolation support
>   *		MSG_FLAG_CAPS_LPM_BOARDCFG_MANAGED: LPM config done statically for the DM via boardcfg
> + *		MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST: DM is not able to restore IRQ context
>   *
>   * Response to a generic message with message type TI_SCI_MSG_QUERY_FW_CAPS
>   * providing currently available SOC/firmware capabilities. SoC that don't
> @@ -164,6 +165,7 @@ struct ti_sci_msg_resp_query_fw_caps {
>  #define MSG_FLAG_CAPS_LPM_ABORT		TI_SCI_MSG_FLAG(9)
>  #define MSG_FLAG_CAPS_IO_ISOLATION	TI_SCI_MSG_FLAG(7)
>  #define MSG_FLAG_CAPS_LPM_BOARDCFG_MANAGED	TI_SCI_MSG_FLAG(12)
> +#define MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST	TI_SCI_MSG_FLAG(14)
>  #define MSG_MASK_CAPS_LPM		GENMASK_ULL(4, 1)
>  	u64 fw_caps;
>  } __packed;
> 
> -- 
> 2.53.0
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
