Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011000.outbound.protection.outlook.com [40.107.208.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7FE31F983;
	Mon, 18 May 2026 13:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779110564; cv=fail; b=rpZVPd4GWvSacsjtjFBY4MSZlE0oAKo6Wm809w3gkYQNVKCg9i237cTTNilrmBW/6iBAropsw9zo2BT4IFNzDPKgEKzN3spglbsZ7imBx+KoNFvX2/BdGZffINdFm+/sMWbLsSUnzX0w0x5SVzvR1ap1JffWiCtCCCBPkZfa63k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779110564; c=relaxed/simple;
	bh=nz1kSx9+6yNGBI1mMlyJ+kDnLy2jPX9iicIIP3XkNtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XvkIJI8vPB+WHCK1JHOlPexb9j7pgYYfpBiWgUyPgAPkJ0I8xynwRjj3ilENxvTCUT/EKpQTWEXi+pFyY1QzyPLWY9ZEQG4hwLo8rDqDrF0ZM5i3E6X3OrPuzbfi/1VXzfmCl4Kqbc+2qHGondeZ6tqCIHVl6qsGT35KJm1C7mE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=hwDwtm/w; arc=fail smtp.client-ip=40.107.208.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hwDwtm/w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/iOvzIgVe6b2/TBsvoUuyG0OzRoxgsYkZqrn/SnljoYNessCrLZHgHc3QkXMEu481GnLUdQGyeSrzhyl1T9cuM0kTlz9nGWiISpYAByytJxXS+/HRSzPNxy+dbtniyTMd5aOoOO6fG9Eu8Sgg9UToh6p7sGc7tVcOqCC81OfFsKyy/SAUgPtSyGQXVvyW5/zoPLV8R4g1KzdK973N0aDuodGR0EbP/zqEoZk79n9eVEhC+gOiJ0fZVcpeU9pCjqN7zEeficAd5w7hvVfTF5IIZdWKax63UPEIRobwQMnFns8UjsvRVq/iSbbyDbJw5ewX1imeKKsU4HI6ONbR/iDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZcOdpdoLw45XsrEt8n63eqY+BeCred7b4848JUv1Qsw=;
 b=hr21/jjkm5fcz7N+RVJmU+YI7eN4hYqMUUd6uLEXyyo4mSw1+tRcI2/EbRX+P1ksZi57U5FnhjSqt+hCfOffO1T8bJ6VZK13HpMjPukeqy2Lvnm90BVaAXdoU5bEFPxwut7R85yOeuyCUT90gx5PmnP+VhrJY0pSjScxObhOMd6HcXHi7Q9Jk+gLCeJbZY1pUeU31M2N+0SAfIz2QTn4t/rcA8Qu8h5ryI+zvBaUo/sy+tMb+q02e2+vvr6Iw4GdFYEoM54Iroli+ihEjr84pZ+++FG7TUlxLiQcs7YqY4t75PN/1wS4h2if6Un/dHFKAW7V/4is7S8JAckwRn6nMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZcOdpdoLw45XsrEt8n63eqY+BeCred7b4848JUv1Qsw=;
 b=hwDwtm/wIj8tvR8JoNrzG//v4vvNpIvuEOXNc1SSb9Fd7tFkudoxXyQ/eMsnmnLmkxAG6T/viNv4crHk9ZdT9qxsLhIJKg6VejVm33JdfkkpP6wbW+x/54PrjV4ub3V2L7Dtoak2Dm7yP5BfhoLyvu0/4hKflu4In5kvPloMVus=
Received: from PH8P220CA0059.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:2d9::7)
 by SJ0PR10MB5742.namprd10.prod.outlook.com (2603:10b6:a03:3ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Mon, 18 May
 2026 13:22:36 +0000
Received: from SA2PEPF00003F66.namprd04.prod.outlook.com
 (2603:10b6:510:2d9:cafe::ec) by PH8P220CA0059.outlook.office365.com
 (2603:10b6:510:2d9::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.24 via Frontend Transport; Mon, 18
 May 2026 13:22:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF00003F66.mail.protection.outlook.com (10.167.248.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Mon, 18 May 2026 13:22:34 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 18 May
 2026 08:22:27 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 18 May
 2026 08:22:26 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 18 May 2026 08:22:26 -0500
Received: from [10.249.135.81] ([10.249.135.81])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64IDMCe51951923;
	Mon, 18 May 2026 08:22:12 -0500
Message-ID: <495082a3-1a08-45d9-90f0-4723837ec4be@ti.com>
Date: Mon, 18 May 2026 18:52:11 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/4] firmware: ti_sci: add support for restoring IRQs
 during resume
To: "Thomas Richard (TI)" <thomas.richard@bootlin.com>, Nishanth Menon
	<nm@ti.com>, Tero Kristo <kristo@kernel.org>, Santosh Shilimkar
	<ssantosh@kernel.org>, Michael Turquette <mturquette@baylibre.com>, "Stephen
 Boyd" <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
CC: Gregory CLEMENT <gregory.clement@bootlin.com>,
	<richard.genoud@bootlin.com>, Abhash Kumar <a-kumar2@ti.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, Dhruva Gole <d-gole@ti.com>, Kendall Willis
	<k-willis@ti.com>, <u-kumar1@ti.com>
References: <20260513-ti-sci-jacinto-s2r-restore-irq-v8-0-195b27f91519@bootlin.com>
 <20260513-ti-sci-jacinto-s2r-restore-irq-v8-2-195b27f91519@bootlin.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20260513-ti-sci-jacinto-s2r-restore-irq-v8-2-195b27f91519@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F66:EE_|SJ0PR10MB5742:EE_
X-MS-Office365-Filtering-Correlation-Id: a5b3532b-173f-4c2f-3387-08deb4e085e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|7416014|1800799024|56012099003|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	bK8u08H2ZbLqjlez619fVnEz7/RlJio7EhlnghuaW9IQYqUbkKe2N1SfHP1wO6oZpA42jwXpanQgZf+tDzPHPe2zMOEFyr0Gpx1f+So9ZyIswCB0+mbDWdw7nK4AmPioAC0orUHArVjv9VWWl3BDB/atFEZNNbMAAAk7sL7ChxmTShC6LJbOpbPtgG4ra59EwEdkcwHAFVOvX6x232oCdV6z/mlCr4431rZ1YjQsX18J1V4AHnZWDStogpilmOU4BhvhTIfnXFf7vHnZqf6k6SYmNaW9Jk+I+HShsexPzV7t15MjEdFPvbHgi7e4M0czqLUDhxs/UncWU9e/C8Ee9iS6y5Kpj+emphD2G1K6MvQzl56+PY4Ly1N5xRkM6Skh3ZPJseObSgMzikEt7ZjwHDnqfokJijEX6O2fSt6gF7y1U8ewVsJf9LSD667qmyX8k8FOAtKMNcwSlkOkP6rpLPpNtabjwArpvh6fLKNju2iyLftMslKdfxrVkYfvWzwt5GlQ2LI4hsSUgANYLvue8tGkmygSKWmaMhFBw2NnXnwnzmSP83FWYvWUJ/z+o9G6O1gDERC9FP2dkKkMwUSWHVzKCbHLZe6ENRdk+NPLRIzWzIgV00O0rUb76U8Jop97hSlH75EDOcKK68FwD7sj5dvbWY/DOtBldq8gZ+/9Oh6OEP7o7OjbFMR6FjLdKLtCKUPm6j1FuaYonh5GTTj36qoGLYi/PoAXIap2IkETmiw=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(7416014)(1800799024)(56012099003)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	viUdqPK5JibixM+QecqZhI1BdAS06G1B+oSLPvhZuTh2C/6SnF6w50zkK0d4Sfp/iTKQznAvg+lAX9uXtwrQD/uMvqhMPJiVzfMHTQvl5VgJPoLHIwJVojo0Yx2phR1vEr47sOxngFy1xU+UTudwvX9G7BmfS4IeDLveLnaBSYEEKsEhUNS+SqTLu/7AXXfSXb8HdhdUECgRwTXi1XIP7Ub+KgM1XqX01RoSt1m+mNJbDsY7W74MYL397i12q9CLXPd8NVTNik9Xa7tZB4yZCapZcBgBiNV+B75oYAWQe4ef38F+BnARW3tdMlgtERA0vXeR9JagkKklfL9gl0rc1vcu/IZ7VwD45CKZ9kICAxv7SVmz2bk3q8FKRL00bbjlleHK6xm4k6Kf5rpa3IF9ZMwR3xHYxWCTMzlZeoY7cHzcn6xYcem54RYfb4ZzcYou
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 13:22:34.4634
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5b3532b-173f-4c2f-3387-08deb4e085e6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5742



On 5/13/2026 6:16 PM, Thomas Richard (TI) wrote:
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
>  drivers/firmware/ti_sci.c | 201 +++++++++++++++++++++++++++++++++++++++++++---
>  drivers/firmware/ti_sci.h |   3 +
>  2 files changed, 192 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
> index eaeaaae94142..35ee8cc830c8 100644
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

Could you check, recursive header inclusion header warning
In file included from linux/printk.h,
                  from linux/srcu.h:85
                  from linux/notifier.h:16
                  from linux/reboot.h:6
-drivers/firmware/ti_sci.c:31: warning: recursive header inclusion
+drivers/firmware/ti_sci.c:33: warning: recursive header inclusion

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

One of script report errors, you might need to document hashtabke.
However warning is unrelated
CHECK: struct mutex definition without commen

>  	u8 host_id;
>  	u64 fw_caps;
>  	/* protected by ti_sci_list_mutex */
> @@ -2301,6 +2317,32 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
>  	return ret;
>  }
>  
[..]
