Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012047.outbound.protection.outlook.com [52.101.48.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C25D33D4F0;
	Tue,  5 May 2026 13:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987237; cv=fail; b=UWslkQxIA8YJT/HxsTGDEIcVH4Wf6II1cTqWn8pP0cGqs58XuICrZsjcNbqd4jQtbaZR3nJswUl4UwVQSDxGTKm/01pQGOZmPfL9+UVsB6XuOkGyXoVJ4hvFaCZdopvxDsMxSwrX6FIh90ZoStwEl8ByVSkXCJw/k4EsY31PRcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987237; c=relaxed/simple;
	bh=S9lhrwhqDuWYKYrdInw5IuvmadYKAGB2Z6fZoh6785I=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/7+IUvcpTzHwonXa0N/DEgfdRYqH8FcXmEw29gxZx75HhYcfYVrdsbOB8z/+FHPH8gR6RjKDUUAHoKIgxw/2sP/9G9pP/i5V+YH5JyWwzIieDGmvIGcBVu91IT+Nhim3RcJnL8hYzM7Dz5rXidhvMiWoUkCSSzs8pYtnywI9ZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=XMgQsPgF; arc=fail smtp.client-ip=52.101.48.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="XMgQsPgF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=khUk067qiVMrvimRxfgg0SN+lpXn7MMCCZpHiHdr9CZTyzsHDa98oLJcav33ZxQKUrJKqTkxGHQlEfJRf+xRpSYErZYUxSkYZbBM/j8SKIbgWy0e+pEgX4g4HvQLCkORBnnsqpyzeE8ch+lBF2/+00BS43dzWB3Gea+UtgVHRm11xFTITRUnhQj0PqJb/QWbfXIYIc/NRf1TSo9hRXObEgEctiTxfJtPv/SB532+r0k2NX4TbHkamcLI0Hw6arO9L8zm2lcSFBX7gANITiG7rEGk0f/jmXD39QsQlhDRmTx0jM2Z1Vz7C2FTrmzfTGTKrhwGxExMZIgf3yagtbv+Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8UzirRma+d3QgUVH3Rcj8o+UEs7DfTYjvKVQ54lqT8=;
 b=wfKTHlqcDE4F1+ZyWrsqYj5gEnFjsFSXyQ4awEXMcJuUO/4lBTjvyVZzeVjBo4YWu7hl2OyukvTk+rBSOfYfDpqEuiXaaTWlwJ+SDT5948l9zO3XjKnJb5cYI7f7tQmhMEkMfbJbmDA49ClcFoUyhSBMXYZtts17Ic2NMuNXO89WUI683msoZ7z3UkozO7E5JtY2JdxyF6HKpCKcMULrilcy21zdCbkq9UIjsneg/swvPcocl0MZUNyqbzjnWBzLL88MQSSKz75zSUZjCneyh7kIKC1Ytf+/DVihD0uKK8/s9o2CGjJ0c+BS4ApuCBirAgxFqW69BH040sCDqwHCsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8UzirRma+d3QgUVH3Rcj8o+UEs7DfTYjvKVQ54lqT8=;
 b=XMgQsPgFR0LBwxvKClGCUefBenFhRbrYGDT4Uad1fyKhy2XmVIyyAbjb7s5IJBGGU/Wstx03dBvB7fK2/vQqhW6KKPVfpDqPkUldDXm11KUiJJg1pHH9Hb3C1TYFaoveqWgbhUBgn31NauiJkhl24WRJYKG13mA/K0bZWq3dzjQ=
Received: from BL1PR13CA0260.namprd13.prod.outlook.com (2603:10b6:208:2ba::25)
 by CH3PR10MB7260.namprd10.prod.outlook.com (2603:10b6:610:12e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 13:20:31 +0000
Received: from BL02EPF00021F6B.namprd02.prod.outlook.com
 (2603:10b6:208:2ba:cafe::e6) by BL1PR13CA0260.outlook.office365.com
 (2603:10b6:208:2ba::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Tue,
 5 May 2026 13:20:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF00021F6B.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 13:20:30 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 08:20:28 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 08:20:21 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 08:20:21 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 645DKLGZ3324103;
	Tue, 5 May 2026 08:20:21 -0500
Date: Tue, 5 May 2026 08:20:21 -0500
From: Nishanth Menon <nm@ti.com>
To: Thomas Richard <thomas.richard@bootlin.com>
CC: Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Gregory CLEMENT <gregory.clement@bootlin.com>, <richard.genoud@bootlin.com>,
	Udit Kumar <u-kumar1@ti.com>, Abhash Kumar <a-kumar2@ti.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, Dhruva Gole <d-gole@ti.com>, Kendall Willis
	<k-willis@ti.com>
Subject: Re: [PATCH v6 2/4] firmware: ti_sci: add support for restoring IRQs
 during resume
Message-ID: <20260505132021.6qv37kom7oo6fc7r@pointless>
References: <20260427-ti-sci-jacinto-s2r-restore-irq-v6-0-72c6468cb2ab@bootlin.com>
 <20260427-ti-sci-jacinto-s2r-restore-irq-v6-2-72c6468cb2ab@bootlin.com>
 <20260505113213.fz7qrovpgn4lbesn@zodiac>
 <9fe10a63-3dc5-4bbc-bbd0-08cc3f625975@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9fe10a63-3dc5-4bbc-bbd0-08cc3f625975@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6B:EE_|CH3PR10MB7260:EE_
X-MS-Office365-Filtering-Correlation-Id: c905f9be-a4bb-414d-29e8-08deaaa914eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|1800799024|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	q8cD/5Rbhn14ehiOY/eyGKIVQr9E55XQFONp2A/mAD7WPJJIGRwZvNfI37nigcSGE3/Dd424raRktpTmVFDR6La58217CfCN9s7sMqEFja812bMA050hI3Zcc8V3xF7O1k8bglFcO1KI3TKbJHqyUQhP1sOQnz8VITVblLqrYYxmpsuIaZPDHnznypw/Yn+eTAUU4JRFZl9otQwERJdknxB4X+g4JJi1Lt2yyR39xFU+o7UFLkHO6BlcINQhRp3Z3QfVVrZwh6z2Z+nOS3RUSxe4JFNpoBLo72aYPO2ueZRrxUu/+3Bl1cNpchW63HYc7lbRYj+LYkdOEIKi3OPr3EAyFsd9uMAzyjL//Xcl7gTP3AJo0x1w3DrPbY3eUcdE7kgLrHzOL7maXHAuP12amD4OlbbX6n0u0sC8fvmgUIJk5m9K9aVcD3dW0ix3oL2hYsiWabox0fPbZ497NDtjwDCFAKr+0vI0qU43yt30XGxZdAWTHCiMEF9vj+y6C5tt3Iy5blUztOBp43onf4+2taLzSJZcPpjj5i2qsIkdd+iLDCVHRQhW7Idr4YpRTRkan+T6pvulIUy9vEmX8bvirnBp4XFRbMuOMe0UVdRqUf5Mt9ASLErvmvTkAG8BechQ24bGVi/8oaYI63JW9AIcY7Ch/JYIOt8DP4vd3G/9Has246akFYN0OxlrTr9dt3WZrwbNE3AOgzx52AZVMdEujzGXZ3v1ARKmFwlGGKbGLGg=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(1800799024)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Pu/0b5TQ76r+yoYXxSPKnqq7xCFehW1nAEs/HQHAgafqCwHyhMZh3/ZEkDj0zrQYzUuhR+4sWi6tsaj3IC55ysh8uEQZ6MyYCVe8vEYlStpk+vyvWgE6ruCtz3V/90oUDZ51e7TzUT3CBrt+n2OpeanasFFT/mnqMQBmW55vxKtVvgP81KRr68igaxSb34qrYUOWhkZkQM7O5ZLMr66Rrv6W5nBpQjfk5At/efaZq/5NgNiTG3V62GQR2/KEAteBflO19yH7CI3O+/4rLlJYZqT38wCCRGY1LuqihKoy7IcWfyeVoCFYIkq9gF8EsrgqGc4Dve5FCWNjkKcZNpr3h/O68WbZ81d4sv2ES+v8b81ewyHxX6/SSmfWSFziBZDhNr6T6QnomnzhrJjbU8OAvSper3SNGhM+91IbNGsR5xcZWW6MpLgOFQf613jsaB9K
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 13:20:30.9199
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c905f9be-a4bb-414d-29e8-08deaaa914eb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7260

On 15:16-20260505, Thomas Richard wrote:

[...]

> > 
> >> +
> >> +	desc = &irq->desc;
> >> +	desc->valid_params = valid_params;
> >> +	desc->src_id = src_id;
> >> +	desc->src_index = src_index;
> >> +	desc->dst_id = dst_id;
> >> +	desc->dst_host_irq = dst_host_irq;
> >> +	desc->ia_id = ia_id;
> >> +	desc->vint = vint;
> >> +	desc->global_event = global_event;
> >> +	desc->vint_status_bit = vint_status_bit;
> >> +	desc->secondary_host = s_host;
> >> +
> >> +	hash_add(info->irqs, &irq->node, ti_sci_irq_hash(desc));
> > 
> > No locking? set_irq can be invoked in parallel paths, no?
> > Further, should'nt we check if the same src_id and src_index is already
> > present before adding to hash list?
> 
> ti_sci_manage_irq(TI_SCI_MSG_SET_IRQ) is the lock. If it succeeds we
> have to add it in hash list.

Do document it in code. it is not an obvious path.

> 
> Can set_irq() and free_irq() be invoked in parallel paths? In this case
> maybe I should add a lock for set_irq() and free_irq().

Yes - drivers are running all in parallel, right?

[...]

> >>  
> >> +	switch (pm_suspend_target_state) {
> >> +	case PM_SUSPEND_MEM:
> >> +		if (info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST) {
> >> +			hash_for_each_safe(info->irqs, i, tmp_node, irq, node) {
> >> +				irq_desc = &irq->desc;
> >> +				ret = ti_sci_manage_irq(&info->handle,
> >> +							irq_desc->valid_params,
> >> +							irq_desc->src_id,
> >> +							irq_desc->src_index,
> >> +							irq_desc->dst_id,
> >> +							irq_desc->dst_host_irq,
> >> +							irq_desc->ia_id,
> >> +							irq_desc->vint,
> >> +							irq_desc->global_event,
> >> +							irq_desc->vint_status_bit,
> >> +							irq_desc->secondary_host,
> >> +							TI_SCI_MSG_SET_IRQ);
> >> +				if (ret)
> >> +					return ret;
> > 
> > Do you want to attempt to restore the rest of the entries rather than give
> > up on the first fail? Maybe just log the error for debug and attempt the
> > rest?
> 
> In this case, if I get more than one error what value should I return?

Probably the first one (or the last one - i wouldn't think it matters)
- we might need to log the other errors though.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
