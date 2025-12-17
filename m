Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012055.outbound.protection.outlook.com [52.101.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0771DFE09;
	Wed, 17 Dec 2025 05:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765949389; cv=fail; b=LYNayZ8vIkL60W5QuuR36jSSM8gBDHCb7QUPtSbOK6JoxXY+iVabOmslbe6BcZvsKoE/0J0eWEwlxxQJs838b7O+S473G5q4ReQhwTfuv7M2r0z11QT/lO7J4yRZEjXIoxVYzJF+K9iJUSg4FGIqgw4y9mPcCkyD8z4/4g7dJyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765949389; c=relaxed/simple;
	bh=RIKkTNV0LFZQdqXZ6I0KcXNuu7+VuOTwES/rviHJS6w=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mSI5A7oBHTmxSNfY+hQaqH5EnUekFhSC81OYFHMW33zTcRRaLPHuhcz8osaxbTZnsB7oHEukG6hM+vJDFX4i/332xwfx7aDzkQJHks1WYppFxzbF+Xy/r8evMCbaEj5XrneKzeBmWyT5bgQEme2uaiFrGFcABdYNAJwLGGpOO9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=fail (1024-bit key) header.d=ti.com header.i=@ti.com header.b=T8w7/5kg reason="signature verification failed"; arc=fail smtp.client-ip=52.101.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="T8w7/5kg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LyWAmwedBFqjslnWPhVa5GnYmxPl38n6mDTrDmsOFE5JrtrVoesYY1SWfe40/1KNwj+ySlI5zbR36OpWI9cELWyDGWw2XGRuw2jxUCXe2HSgp3hA0Bj6PGmrqBOufriyIkJWiqzNgh07p0RD3LfAoUdcDje53ZiDlnFma+jbodCwY/ztKjVtgYhIJrq/Etsm+FORGwdUF5FoJylXtfUGRYfiL5+ZmitvNizcU1mxa6yWl35F4+f0/SaW+RzOjR6FgHjuhRr0uVF06q+AM/L5sNzrVBgCn+FQ9+81lxu77uHbzMnp/6tdn0naJ/383RDfYszHGrAOJlM/Ew3/sMS46A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RbtmaOZfo8DyWQreH/kIst2H+pTtWPHiinAYxxB+wQM=;
 b=L+R9/NTR58CkRSLlDduhcfHeB9ag+mSs3qpSAh3VE6t7NKO2eVHu5D7a4N9ezimh6Sx8ZzXLL/wAyT/SdHoMfDuc0+3+iy8YCIFG9H+nQVXN18Ke4zYmB0xZpi3KuXzW+6wymcL5UUoAC1ax1W6Ie2FL4cLRuUEzVStz22udOUCbdv2j3oLc5GZhcKgaPlsKcCwzR1BVldDhRRZ29DeRCq0gMcTDsazhJYqdye3QUG2NAgTdFydQyeGvhb6PXN1QKQ9JYRwnr+2NcRcabO0t7bFMfg1TrWp5F4W9N4GhlidXAf6gAV40ZQq43fO1PtfDHLhOB85vA/0HM9ykhEbM2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RbtmaOZfo8DyWQreH/kIst2H+pTtWPHiinAYxxB+wQM=;
 b=T8w7/5kg7GOJk7xrT7C3ODtvAdO0T4wTNECC0X3OxhU17uUfURKCFoZKk7vK33hFJB8j4vfiV6tacoq5nPMgetcnYHlBSrNc3aN9hrvYhI/8B1gXN1wsXoOhekI4b0nbvEc6/VOY/YvDQzSyE3R6TNk+7fqsKvtETgrHAbrVqNk=
Received: from MN2PR01CA0040.prod.exchangelabs.com (2603:10b6:208:23f::9) by
 IA1PR10MB6097.namprd10.prod.outlook.com (2603:10b6:208:3ae::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6; Wed, 17 Dec 2025 05:29:44 +0000
Received: from BL02EPF0001A0FC.namprd03.prod.outlook.com
 (2603:10b6:208:23f:cafe::f5) by MN2PR01CA0040.outlook.office365.com
 (2603:10b6:208:23f::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Wed,
 17 Dec 2025 05:31:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF0001A0FC.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Wed, 17 Dec 2025 05:29:44 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Dec
 2025 23:29:40 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Dec
 2025 23:29:40 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 16 Dec 2025 23:29:40 -0600
Received: from localhost (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BH5TdHs1070514;
	Tue, 16 Dec 2025 23:29:40 -0600
Date: Wed, 17 Dec 2025 10:59:38 +0530
From: Dhruva Gole <d-gole@ti.com>
To: "Kumar, Udit" <u-kumar1@ti.com>
CC: "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>, Nishanth Menon
	<nm@ti.com>, Tero Kristo <kristo@kernel.org>, Santosh Shilimkar
	<ssantosh@kernel.org>, Michael Turquette <mturquette@baylibre.com>, "Stephen
 Boyd" <sboyd@kernel.org>, Gregory CLEMENT <gregory.clement@bootlin.com>,
	<richard.genoud@bootlin.com>, Prasanth Mantena <p-mantena@ti.com>, "Abhash
 Kumar" <a-kumar2@ti.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
Subject: Re: [PATCH v3 2/4] firmware: ti_sci: handle IRQ restore in
 BOARDCFG_MANAGED mode during resume
Message-ID: <20251217052938.fpgclxhmyydvw7ce@lcpd911>
References: <20251205-ti-sci-jacinto-s2r-restore-irq-v3-0-d06963974ad4@bootlin.com>
 <20251205-ti-sci-jacinto-s2r-restore-irq-v3-2-d06963974ad4@bootlin.com>
 <bcc7a3da-3cb5-451b-98eb-4f7896c615a1@ti.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bcc7a3da-3cb5-451b-98eb-4f7896c615a1@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FC:EE_|IA1PR10MB6097:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e3b6659-374b-4e63-a2a3-08de3d2d4947
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?kk9sBROu03uvtxlIXBKmuV/u+JP2TluC5z1kWdl4NME+WP/zRtDgbE9VSj?=
 =?iso-8859-1?Q?l455YDcZUTcRAFjOnf13jwB32W86Kw2lGoBYD59I0+n2kdakUsTzVYKeSa?=
 =?iso-8859-1?Q?UzUAq91/dQhFk4MYCX7svdmsxp8CPPhitsp+whZDNDSHb3qr2RjLiscpoq?=
 =?iso-8859-1?Q?ydFYgeMdU/TkzzQZL3L1Md/4I9QHaJWFm7Jod7XdSiUzZTwWbEVv5vn4O0?=
 =?iso-8859-1?Q?Tf1gM4hypAboWXz+vN0cgVj3gpHhcSMIPPsfcBai/QE96l1FMMqrjy5+76?=
 =?iso-8859-1?Q?gmnE5DzNAL8vWOR9DJO5eEbwEXLm5rl1H4xWIBU03LQ/hS8yKgyUzpQ6gN?=
 =?iso-8859-1?Q?wDYARdMnCvsp7VezlgTTE9zYx/BaO69vygfpepZddd2bJsjvEnGl3f3wke?=
 =?iso-8859-1?Q?KbY3Dpnsw7F04XsBTj7YZfK9dCCAgRvc2ZspX2x614iKrqrrVZitTX/Q/K?=
 =?iso-8859-1?Q?uTiaH51GRTztdyhs9BZTyeSbEtFejp+JHzdXmJk5otYuuwbDAAECQLR+dY?=
 =?iso-8859-1?Q?E02PPipJFhrmCov7G8tmX5Hi5RWBsuK9nxD/MrPd6jhj3Drtql8AYB3s1A?=
 =?iso-8859-1?Q?63GifsNLXbl4/wjb0LWjj1c2ROZlRJIL0b6mCPPibXG+6dXW55hWqbP7j+?=
 =?iso-8859-1?Q?punGKmrMkLN6I6W+RQHgkDDZyVLFobnh81b7usDxtf1gSlzQ7XvfOfL9wt?=
 =?iso-8859-1?Q?hSfynT8FltigPDO8TIA83gdU3sPkR9FWwlV9lMZjRGcLsdg54tdQFN32e7?=
 =?iso-8859-1?Q?fn4aveF1Q91BjdDBswrbccXGg6RNiCiWIYGpL87pp3INlS+HDps3UoR+q7?=
 =?iso-8859-1?Q?Qt+zqx0Pt1kaHs+K56RFpAOpHHI+7PcyrmPnT8GhKdrRYs/aYCq1qIEQRQ?=
 =?iso-8859-1?Q?xEkb3DqnDxHpkmMFoGe+M1ETIyLVzB6Fd3lBu7m9DZ6bZtE8qvJjuHx3/t?=
 =?iso-8859-1?Q?Opeuozq8oqKJOBDJ4GJRtHLwFHTpe2tDK48MzgFAPk3OGEE2m23V6km05j?=
 =?iso-8859-1?Q?uZXFx5xFCOtiaF0lR/ZjdwSpsozHs+AWaWd/Q44RvaAaFzRspKrBRfSlLx?=
 =?iso-8859-1?Q?VXbKGFXnpyIme+KD25c15ZNx9md2n0798DJa4g6TME6H95IqTvpzb8x/zP?=
 =?iso-8859-1?Q?XczV+fmUHB3OxiMygzya6DXdPwzcltIgY0DQRuVGO9vaA7G2AK169eyApZ?=
 =?iso-8859-1?Q?/aLcwgdOcluRVJxiIDkksx6miJZdxCpgE9+LU1QNyl8KCPAvSVTOSRj47l?=
 =?iso-8859-1?Q?p/79/5JXAEPWr+dd/+EZjenu+o6gaNdz8gwjMAOlU6nBUwnTPv8zOas0yg?=
 =?iso-8859-1?Q?F5k2Thw+j7jAfk7U2jXlTED7C3fDqmVZvubS9JuX5CvDM1Y4IzuyHB4zqo?=
 =?iso-8859-1?Q?AEYS7oVa0k3MAzkl+QqZZ3f6xL21k2UKRjp0mInm+enBF4P57NdeewJ9Ci?=
 =?iso-8859-1?Q?JMX8ysSdRPlk7aIeb5R4F6ebiIBmTJ/UvLAgck1QxJ1W5ipESNcp2p6z8n?=
 =?iso-8859-1?Q?joay6sYXryI/fQHu8IW5PD2aE1HhOROXavClcJZPFYhBO2IJT1EO+qdhfz?=
 =?iso-8859-1?Q?YPUsoV35HY3snWIF1hzs6vhXy57qndssJJwk2uB5z5iHvRJABrRKHauqym?=
 =?iso-8859-1?Q?+OKuONl0kfwh8=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 05:29:44.4270
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e3b6659-374b-4e63-a2a3-08de3d2d4947
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6097

On Dec 16, 2025 at 08:17:24 +0530, Kumar, Udit wrote:
> 
> On 12/5/2025 7:58 PM, Thomas Richard (TI.com) wrote:
> > In BOARDCFG_MANAGED mode, the firmware cannot restore IRQs during
> > resume. This responsibility is delegated to the ti_sci driver,
> > which maintains an internal list of all requested IRQs. This list
> > is updated on each set/free operation, and all IRQs are restored
> > during the resume_noirq() phase.
> > 
> > Signed-off-by: Thomas Richard (TI.com) <thomas.richard@bootlin.com>
> > ---
> >   drivers/firmware/ti_sci.c | 147 +++++++++++++++++++++++++++++++++++++++++++---
> >   1 file changed, 138 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
> > index d77b631d9c855..8d94745376e2a 100644
> > --- a/drivers/firmware/ti_sci.c
> > +++ b/drivers/firmware/ti_sci.c
> > @@ -12,6 +12,7 @@
> >   #include <linux/cpu.h>
> >   #include <linux/debugfs.h>
> >   #include <linux/export.h>
> > +#include <linux/hashtable.h>
> >   #include <linux/io.h>
> >   #include <linux/iopoll.h>
> >   #include <linux/kernel.h>
> > @@ -87,6 +88,16 @@ struct ti_sci_desc {
> >   	int max_msg_size;
> >   };
> > +/**
> > + * struct ti_sci_irq - Description of allocated irqs
> > + * @node: Link to hash table
> > + * @desc: Description of the irq
> > + */
> > +struct ti_sci_irq {
> > +	struct hlist_node node;
> > +	struct ti_sci_msg_req_manage_irq desc;
> > +};
> > +
> >   /**
> >    * struct ti_sci_info - Structure representing a TI SCI instance
> >    * @dev:	Device pointer
> > @@ -101,6 +112,7 @@ struct ti_sci_desc {
> >    * @chan_rx:	Receive mailbox channel
> >    * @minfo:	Message info
> >    * @node:	list head
> > + * @irqs:	List of allocated irqs
> >    * @host_id:	Host ID
> >    * @fw_caps:	FW/SoC low power capabilities
> >    * @users:	Number of users of this instance
> > @@ -117,6 +129,7 @@ struct ti_sci_info {
> >   	struct mbox_chan *chan_tx;
> >   	struct mbox_chan *chan_rx;
> >   	struct ti_sci_xfers_info minfo;
> > +	DECLARE_HASHTABLE(irqs, 8);
> >   	struct list_head node;
> >   	u8 host_id;
> >   	u64 fw_caps;
> > @@ -2301,6 +2314,32 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
> >   	return ret;
> >   }
> > +/**
> > + * ti_sci_irq_hash() - Helper API to compute irq hash for the hash table.
> > + * @irq:	irq to hash
> > + *
> > + * Return: the computed hash value.
> > + */
> > +static int ti_sci_irq_hash(struct ti_sci_msg_req_manage_irq *irq)
> > +{
> > +	return irq->src_id ^ irq->src_index;
> > +}
> > +
> > +/**
> > + * ti_sci_irq_equal() - Helper API to compare two irqs (generic headers are not
> > + *                       compared)
> > + * @irq_a:	irq_a to compare
> > + * @irq_b:	irq_b to compare
> > + *
> > + * Return: true if the two irqs are equal, else false.
> > + */
> > +static bool ti_sci_irq_equal(struct ti_sci_msg_req_manage_irq *irq_a,
> > +			     struct ti_sci_msg_req_manage_irq *irq_b)
> > +{
> > +	return !memcmp(&irq_a->valid_params, &irq_b->valid_params,
> > +		       sizeof(*irq_a) - sizeof(irq_a->hdr));
> > +}
> > +
> >   /**
> >    * ti_sci_set_irq() - Helper api to configure the irq route between the
> >    *		      requested source and destination
> > @@ -2324,15 +2363,43 @@ static int ti_sci_set_irq(const struct ti_sci_handle *handle, u32 valid_params,
> >   			  u16 dst_host_irq, u16 ia_id, u16 vint,
> >   			  u16 global_event, u8 vint_status_bit, u8 s_host)
> >   {
> > +	struct ti_sci_info *info = handle_to_ti_sci_info(handle);
> > +	struct ti_sci_msg_req_manage_irq *desc;
> > +	struct ti_sci_irq *irq;
> > +	int ret;
> > +
> >   	pr_debug("%s: IRQ set with valid_params = 0x%x from src = %d, index = %d, to dst = %d, irq = %d,via ia_id = %d, vint = %d, global event = %d,status_bit = %d\n",
> >   		 __func__, valid_params, src_id, src_index,
> >   		 dst_id, dst_host_irq, ia_id, vint, global_event,
> >   		 vint_status_bit);
> > -	return ti_sci_manage_irq(handle, valid_params, src_id, src_index,
> > -				 dst_id, dst_host_irq, ia_id, vint,
> > -				 global_event, vint_status_bit, s_host,
> > -				 TI_SCI_MSG_SET_IRQ);
> > +	ret = ti_sci_manage_irq(handle, valid_params, src_id, src_index,
> > +				dst_id, dst_host_irq, ia_id, vint,
> > +				global_event, vint_status_bit, s_host,
> > +				TI_SCI_MSG_SET_IRQ);
> > +
> > +	if (ret)
> > +		return ret;
> > +
> > +	irq = kzalloc(sizeof(*irq), GFP_KERNEL);
> > +	if (!irq)
> > +		return -ENOMEM;
> > +
> > +	desc = &irq->desc;
> > +	desc->valid_params = valid_params;
> > +	desc->src_id = src_id;
> > +	desc->src_index = src_index;
> > +	desc->dst_id = dst_id;
> > +	desc->dst_host_irq = dst_host_irq;
> > +	desc->ia_id = ia_id;
> > +	desc->vint = vint;
> > +	desc->global_event = global_event;
> > +	desc->vint_status_bit = vint_status_bit;
> > +	desc->secondary_host = s_host;
> > +
> > +	hash_add(info->irqs, &irq->node, ti_sci_irq_hash(desc));
> > +
> > +	return 0;
> >   }
> >   /**
> > @@ -2358,15 +2425,46 @@ static int ti_sci_free_irq(const struct ti_sci_handle *handle, u32 valid_params,
> >   			   u16 dst_host_irq, u16 ia_id, u16 vint,
> >   			   u16 global_event, u8 vint_status_bit, u8 s_host)
> >   {
> > +	struct ti_sci_info *info = handle_to_ti_sci_info(handle);
> > +	struct ti_sci_msg_req_manage_irq irq_desc;
> > +	struct ti_sci_irq *this_irq;
> > +	struct hlist_node *tmp_node;
> > +	int ret;
> > +
> >   	pr_debug("%s: IRQ release with valid_params = 0x%x from src = %d, index = %d, to dst = %d, irq = %d,via ia_id = %d, vint = %d, global event = %d,status_bit = %d\n",
> >   		 __func__, valid_params, src_id, src_index,
> >   		 dst_id, dst_host_irq, ia_id, vint, global_event,
> >   		 vint_status_bit);
> > -	return ti_sci_manage_irq(handle, valid_params, src_id, src_index,
> > -				 dst_id, dst_host_irq, ia_id, vint,
> > -				 global_event, vint_status_bit, s_host,
> > -				 TI_SCI_MSG_FREE_IRQ);
> > +	ret = ti_sci_manage_irq(handle, valid_params, src_id, src_index,
> > +				dst_id, dst_host_irq, ia_id, vint,
> > +				global_event, vint_status_bit, s_host,
> > +				TI_SCI_MSG_FREE_IRQ);
> > +
> > +	if (ret)
> > +		return ret;
> > +
> > +	irq_desc.valid_params = valid_params;
> > +	irq_desc.src_id = src_id;
> > +	irq_desc.src_index = src_index;
> > +	irq_desc.dst_id = dst_id;
> > +	irq_desc.dst_host_irq = dst_host_irq;
> > +	irq_desc.ia_id = ia_id;
> > +	irq_desc.vint = vint;
> > +	irq_desc.global_event = global_event;
> > +	irq_desc.vint_status_bit = vint_status_bit;
> > +	irq_desc.secondary_host = s_host;
> > +
> > +	hash_for_each_possible_safe(info->irqs, this_irq, tmp_node, node,
> > +				    ti_sci_irq_hash(&irq_desc)) {
> > +		if (ti_sci_irq_equal(&irq_desc, &this_irq->desc)) {
> > +			hlist_del(&this_irq->node);
> > +			kfree(this_irq);
> > +			return 0;
> 
> 
> IMO,  you can restrict saving of irq and list management to fw having
> 
> BOARDCFG_MANAGED capability.
> 
> Dhurva ?

Yes I agree with Udit, we should gate hash operations by firmware capability.
Everywhere else you'll need to make it conditional accordingly.

Also, how much is the IRQ count usually? If IRQ count is typically small (< 50),
then won't a simple linked list be more efficient than a hash table? The
code becomes a bit more readable too that way IMO.
Take a call based on if there's really that many IRQs that LL's become
less practical.

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated
