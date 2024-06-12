Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EE016D9A8
	for <linux-clk@vger.kernel.org>; Wed, 12 Jun 2024 09:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718184666; cv=none; b=a5PZf8i7MXDDx6iRzQyevXMVDTvPARc2WYQ6ZcISn9COcONdtTDdk0pYhuoaXYT47B7hMkmSZNoWiQHRdVfv4GGxteEqi+h9GIVYADkT97JTdreOc8NecnPG6IbDBzH2JXtcDCBRyBwSVVOto5XgGBbc3yiwDdKZwbUgt6pNIH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718184666; c=relaxed/simple;
	bh=FbTNRCWKW+BuxfkEMiJp2eYFRAIAL1si4NRKBdAsVZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=G3Z8C2GZxBaAk3oXLo/fXLrjaAc9e5XI7TZk4OvK5/B7togOoZfjL84eSQrYv1lxWUvzINeTRuWGN/NagzAb4l2GfOJxcFpElnwEXRkhP9lXLV9KPphNbT4fbFQmiuNcycp9cddwVO8OPbbHDVmvPygmD68lLQRefmed13wxloY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=gZQHGO/z; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="gZQHGO/z"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45C3ibv6001970;
	Wed, 12 Jun 2024 05:30:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=uwq+N
	V8ZY6mO4Cc/095eCF6ern9jxcJPg4S8N2tA/E0=; b=gZQHGO/zNLl6M9Jetm+bQ
	v76aQxpMEbSoG8LDOnu1a9YzFa2m3t/NTSR+CSYe0rOz8BTMxO/AUXRwB3fEKCI6
	nqkyQXSEED9HZSscqp6iOPeO3H0dDeu3+Q3E0u1lI1dp29MvZGPWVLMd6V0hi5tZ
	8un/Ma3GMop7zdMihRbOiYx5afp43f9OLF8q8SyL/BMqyhMgmTlg7ZUqYVMutByd
	pU42IIhum03nDhUGnXy1ACgJ0fwZ7hOaW3yzY2YIYycWbcM450vNeRcST6ddGrkn
	Mbxwihw1OC7NVYVk39SXHU1QljZH/8ebaTLU1b4RbBnYSfqqtj/NntQoO9Lste0K
	A==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3ymm726jxn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 05:30:50 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 45C9Una5029508
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Jun 2024 05:30:49 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Wed, 12 Jun 2024 05:30:48 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Wed, 12 Jun 2024 05:30:48 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Wed, 12 Jun 2024 05:30:48 -0400
Received: from [127.0.0.1] ([10.44.3.54])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 45C9UcNY006288;
	Wed, 12 Jun 2024 05:30:43 -0400
From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Date: Wed, 12 Jun 2024 11:34:26 +0200
Subject: [PATCH 2/2] clk: use clk_core_unlink_consumer() helper
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20240612-dev-clk-misc-v1-2-7ad8b58f2ea2@analog.com>
References: <20240612-dev-clk-misc-v1-0-7ad8b58f2ea2@analog.com>
In-Reply-To: <20240612-dev-clk-misc-v1-0-7ad8b58f2ea2@analog.com>
To: <linux-clk@vger.kernel.org>
CC: Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718184866; l=687;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=FbTNRCWKW+BuxfkEMiJp2eYFRAIAL1si4NRKBdAsVZI=;
 b=V+uq/stKQpDmb18/T7QJ+OJd01DWEKFAeqP/Aj2sh+wCJkCV0meT/xTi3fC0OXLln0XP7NcN1
 A7B2qngQrCLBXsaw82C/6YbFfTx1GtgQH/YLdBsvoZaIxH2bW7igm1b
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: Sw6XUAc9OMmncX-ZZ1wqAeDZiF_b9R2u
X-Proofpoint-GUID: Sw6XUAc9OMmncX-ZZ1wqAeDZiF_b9R2u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_05,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0
 phishscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 mlxlogscore=661
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120068

There is an helper to remove a consumer from the clk provider list.
Hence, let's use it when releasing a consumer.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/clk/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index b11beeca7e55..ed0731a4b773 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -4764,7 +4764,7 @@ void __clk_put(struct clk *clk)
 		clk->exclusive_count = 0;
 	}
 
-	hlist_del(&clk->clks_node);
+	clk_core_unlink_consumer(clk);
 
 	/* If we had any boundaries on that clock, let's drop them. */
 	if (clk->min_rate > 0 || clk->max_rate < ULONG_MAX)

-- 
2.45.2

