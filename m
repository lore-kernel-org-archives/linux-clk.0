Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012054.outbound.protection.outlook.com [40.107.209.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2836381B02;
	Tue,  5 May 2026 11:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777981373; cv=fail; b=soe3lbsTdK1CJ2UlGhXP4Y7tsm0eQlGbAWt7Agnhn6lQpBzfFGjk1NUP/h0K2MA/IrLBV/6tJhsNvvRhAUAEGc/lZ/g2rNxYMYvIdA/j5QqhQad8xD1zfWj85T/C/u1cIdrxf4ec9JodeIWw/Ypn4DZFnZMe0hXKuDsbeFBn1XM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777981373; c=relaxed/simple;
	bh=8c7Fvo9XfoJgGOdHD3+OTDLV06tqC73QH1xISm+5U1Y=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rCkLEaWhe+EYpJa5Lu+eYpNaH2ChWOGn2B4tmK6+vyjDVxHvuWPoEHlL/T9esIUBqXGlmR4zX6khw5gSk5ZGu0mVZg9o5QXdDi3pq2hn8NEHM8Q7gjK5jzv8nnQW27Tc+kRwyqgt7awdMbRWQxCOHaFa05cSOtAHuD1AL2TjBYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=S3PT3RYC; arc=fail smtp.client-ip=40.107.209.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="S3PT3RYC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MsMKmzYJK67z27LTa1jW9JAmuTpA0VHk+zSSDAr+KDtpaoPbKCv4C4qRRbJukXEofYwq1bTH4AzV1E1KaxHhbAjGRWtGirJn76MKhDlXxJnYELf38xiAQEQQter4ktw5SThaxbwY6tPlqLF4fYYumaPB4li34L49/dJsFlexKQMmm/FNEk/tVCvzw8TnwPb6tuFX9fO9UC2fUkByv+eAU85N04e0bzvLc8vrXJ58d4hA3aht4y3huxqh831kS8ltm6gXaFMqviD2Dtpyf7KnLfc3FJT9DeWOv+v4aYz9DPg/BrLWGkdps1/5/bepbndalRMxBdbEg7KuY4NQaSKX3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yXLWq7djRHm8aAsYMORJa30OUOiucUxK+JszfmcJsW8=;
 b=snAKEzSDppxjxC2RWbcXg1ZzM8JPQAzmkumxgiBui8dYII931W390lgzKoXDpLAfa3tEnq54boQlXgsPE+SwEltoHfVoMTkPljcBizD5slCEknqngH9UY4UljIg0EU7dUKwKcMeIhB0kAOHAmLIud6ReWGvbqVXI16qryOhc/QSJ0cng89IUSU5RGBgqQc3YVIEZKpvM5ChdwFEkFCEtj7LPZh8gwFqatMDPyEAxEbQc7yxb6AKBTbQY13RYZVA2pWOiVr7O4+huMdwTzVKc/1URQxXtQU1ELpvNuxoo7RFrNVp01+VytCgCou2PQ8DVaLsMqG2riqKXpO0X40mk1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yXLWq7djRHm8aAsYMORJa30OUOiucUxK+JszfmcJsW8=;
 b=S3PT3RYCJZllkAW1r4EeqLViHQlfP0o/Y8hokffeZZ5CQrWRvn5lb7R1GQmii4u36ZfcJmYFU/8QpywxXBn/ooqqlL+5jI5ti8u57330tu62FKVOZIRZSP0m+1fMYOKbw5z5BWDg9jQPRNoxpRc8/rbJFVCGmNqk2R82IOZFIJM=
Received: from SA1P222CA0069.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2c1::29)
 by SJ0PR10MB4720.namprd10.prod.outlook.com (2603:10b6:a03:2d7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 11:42:50 +0000
Received: from SN1PEPF00036F41.namprd05.prod.outlook.com
 (2603:10b6:806:2c1:cafe::1e) by SA1P222CA0069.outlook.office365.com
 (2603:10b6:806:2c1::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.27 via Frontend Transport; Tue,
 5 May 2026 11:42:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF00036F41.mail.protection.outlook.com (10.167.248.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 11:42:49 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 06:42:49 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 06:42:49 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 06:42:49 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 645Bgn1X3169764;
	Tue, 5 May 2026 06:42:49 -0500
Date: Tue, 5 May 2026 06:42:49 -0500
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
Subject: Re: [PATCH v6 3/4] clk: keystone: sci-clk: add restore_context()
 operation
Message-ID: <20260505114249.y7svb7jf7w64zflo@concerned>
References: <20260427-ti-sci-jacinto-s2r-restore-irq-v6-0-72c6468cb2ab@bootlin.com>
 <20260427-ti-sci-jacinto-s2r-restore-irq-v6-3-72c6468cb2ab@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260427-ti-sci-jacinto-s2r-restore-irq-v6-3-72c6468cb2ab@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F41:EE_|SJ0PR10MB4720:EE_
X-MS-Office365-Filtering-Correlation-Id: 680cff20-8685-425a-5195-08deaa9b6f67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|7416014|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wIsbcLyDqXN9EcRm8Q7PUGVrRB/JEnBI1/Rz8SsRLTlMY2U6kxLQ1IaF17SqwZA2aU0GOkiq+pgSxL8XgUk+51lZaz4bdSMrQ21tC7Stl4oOjQw9puwu3e4Hwi8b7BCY/rN3vhtUnH+L5CiuZyzuZJLyp6+JPNYkXXKb2umXoh25Ky0X7eSBNM91xfN3j7RpIPH6DagxeDKkwEfmJGH/TyuMWUSkShH/HiGmnZ2pkwX4aPB3FINkFVAWUVydM8Aq3g2NtxyhHRC5Vs/2uwQ/6rbMV7s14aW0IY25W1PmB0Trm+pFO4NDlfD3AfJucSy2RT5A9361Pz221ia21CKJ5if6D+65MnkSuqqCSdpvzmcnVt/dXXdl5pyH6cYtNwdT3GoXiguTJzb6HkJkyGf2tPLQ8ilNfBOMfaAoffmtSaKKB1MldeBvBgrz/ALHXNhfAp8rO/+Dd4LLkMvrqTM8nEi42OrmjJ6yZP2G1Tx6Kc6k83umNGcezQ54flEigsTCVMRsVAW2v1YKp9TI+illzKi41J2RBSKlr97FbpK8xjjpjONond6IxXvHdw1JHxKcqyd+usWfAs86kZCNbaUWjdhnwhP+JsPj6CWzfWF4KFm1qOIfoQTbgQCEkrWG7f8Jjf0Nq0t0vDOPoTWqorDNXeWZQr28E6nUoaVg0qNVDLCVG/Pf/Eh07f/NYxpScd5YQjhGxFD1JHM+XkdAxJchgrP395XFLeFob8cGlIdMH5g=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(7416014)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5JVz+PQv3UJHDB4N4AnAcRTKZ5g9MNii9LXun1XPXGRVz+V/AyEQoCYgyEtrDuCDIC7ElwCrvVM54QPGUlZR5+CiNqlPcR2QUjQks4mpiGTI0CFcFUJEs1Jtj0xlyLCyVD9ZNwI65geMBTYEl8EOWhh1/IXsbIcdrBUzf5NAEpxsoBsYGjhWBLIYlX1wUFfY1QngAHetPAHhPdFVh4ksRGpATugHCCiE13yeWQ+cItPk1DunVFsaUuxK7UCzTkglKKirURZI3Ib5cxanxfIWQOJ6X63qcTZb3EEEdtGj6nastQO9rsPwtsBnB6On95mMr13fOoGmiXYWDlQGj0PXLcSGjBNoH4mqKB7Ld59avEW+j/qMLoi1r2NqZpXT1TKV96TJs80sTdSu5wpMiAyq3rKuqXsjKljl7AlZd0r8WEWsBZLOdqOCiLgIdOZAPqd6
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 11:42:49.8129
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 680cff20-8685-425a-5195-08deaa9b6f67
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F41.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4720

On 14:21-20260427, Thomas Richard (TI) wrote:
> Implement the restore_context() operation to restore the clock rate and the
> clock parent state. The clock rate is saved in sci_clk struct during
> set_rate() and recalc_rate() operations. The parent index is saved in
> sci_clk struct during set_parent() operation. During clock registration,
> the core retrieves each clock’s parent using get_parent() operation to
> ensure the internal clock tree reflects the actual hardware state,
> including any configurations made by the bootloader. So we also save the
> parent index in get_parent().
> 
> Reviewed-by: Dhruva Gole <d-gole@ti.com>
> Reviewed-by: Kendall Willis <k-willis@ti.com>
> Signed-off-by: Thomas Richard (TI) <thomas.richard@bootlin.com>
> ---
>  drivers/clk/keystone/sci-clk.c | 44 ++++++++++++++++++++++++++++++++++--------
>  1 file changed, 36 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
> index 9d5071223f4c..b090edf5f82e 100644
> --- a/drivers/clk/keystone/sci-clk.c
> +++ b/drivers/clk/keystone/sci-clk.c
> @@ -47,6 +47,8 @@ struct sci_clk_provider {
>   * @node:	 Link for handling clocks probed via DT
>   * @cached_req:	 Cached requested freq for determine rate calls
>   * @cached_res:	 Cached result freq for determine rate calls
> + * @parent_id:	 Parent index for this clock
> + * @rate:	 Clock rate
>   */
>  struct sci_clk {
>  	struct clk_hw hw;
> @@ -58,6 +60,8 @@ struct sci_clk {
>  	struct list_head node;
>  	unsigned long cached_req;
>  	unsigned long cached_res;
> +	u8 parent_id;
> +	unsigned long rate;
>  };
>  
>  #define to_sci_clk(_hw) container_of(_hw, struct sci_clk, hw)
> @@ -150,6 +154,8 @@ static unsigned long sci_clk_recalc_rate(struct clk_hw *hw,
>  		return 0;
>  	}
>  
> +	clk->rate = freq;
> +
>  	return freq;
>  }
>  
> @@ -210,10 +216,15 @@ static int sci_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>  			    unsigned long parent_rate)
>  {
>  	struct sci_clk *clk = to_sci_clk(hw);
> +	int ret;
>  
> -	return clk->provider->ops->set_freq(clk->provider->sci, clk->dev_id,
> -					    clk->clk_id, rate / 10 * 9, rate,
> -					    rate / 10 * 11);
> +	ret = clk->provider->ops->set_freq(clk->provider->sci, clk->dev_id,
> +					   clk->clk_id, rate / 10 * 9, rate,
> +					   rate / 10 * 11);
> +	if (!ret)
> +		clk->rate = rate;
> +
> +	return ret;
>  }
>  
>  /**
> @@ -237,9 +248,9 @@ static u8 sci_clk_get_parent(struct clk_hw *hw)
>  		return 0;

What happens if get_parent() fails during clock registration? Looking at
sci_clk_get_parent(), if the firmware call fails, parent_id will be a
valid value of 0? and in restore, we'd attempt to restore it back? I
think that is wrong.

>  	}
>  
> -	parent_id = parent_id - clk->clk_id - 1;
> +	clk->parent_id = (u8)(parent_id - clk->clk_id - 1);
>  
> -	return (u8)parent_id;
> +	return clk->parent_id;



>  }
>  
>  /**
> @@ -252,12 +263,28 @@ static u8 sci_clk_get_parent(struct clk_hw *hw)
>  static int sci_clk_set_parent(struct clk_hw *hw, u8 index)
>  {
>  	struct sci_clk *clk = to_sci_clk(hw);
> +	int ret;
>  
>  	clk->cached_req = 0;
>  
> -	return clk->provider->ops->set_parent(clk->provider->sci, clk->dev_id,
> -					      clk->clk_id,
> -					      index + 1 + clk->clk_id);
> +	ret = clk->provider->ops->set_parent(clk->provider->sci, clk->dev_id,
> +					     clk->clk_id,
> +					     index + 1 + clk->clk_id);
> +	if (!ret)
> +		clk->parent_id = index;

index of 0 is still a valid value, right? same value clk->parent_id will have
even if ret was 0.

> +
> +	return ret;
> +}
> +
> +static void sci_clk_restore_context(struct clk_hw *hw)
> +{
> +	struct sci_clk *clk = to_sci_clk(hw);
> +
> +	if (clk->num_parents > 1)
> +		sci_clk_set_parent(hw, clk->parent_id);

And we end up attempting invalid parent_id (0) here?

> +
> +	if (clk->rate)
> +		sci_clk_set_rate(hw, clk->rate, 0);
>  }
>  
>  static const struct clk_ops sci_clk_ops = {
> @@ -269,6 +296,7 @@ static const struct clk_ops sci_clk_ops = {
>  	.set_rate = sci_clk_set_rate,
>  	.get_parent = sci_clk_get_parent,
>  	.set_parent = sci_clk_set_parent,
> +	.restore_context = sci_clk_restore_context,
>  };
>  
>  /**
> 
> -- 
> 2.53.0
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
