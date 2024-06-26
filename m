Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45230186289
	for <linux-clk@vger.kernel.org>; Wed, 26 Jun 2024 14:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719413742; cv=none; b=cEYIlhyr24ub8WQVQIyx7U3voiRkffYXlTxQxUHpWr4alQ36Wnro9OXysiLrURg/T7PLWZD0HqEJNqMkLfAX9w5FiC8FCo/O0snwTSxjcLbpd3Fbxk1kTq/AqLgVrmbvRtTX14l+ULcE3dbShOLhqYeOibNKYYdf5DnZzVQCu2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719413742; c=relaxed/simple;
	bh=FbTNRCWKW+BuxfkEMiJp2eYFRAIAL1si4NRKBdAsVZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=evAeJ5wRkLKShhTngy/VhnlyfsXCqom+wYrgSIDcTuOodUBLOgDE5Q4pymEOgmhEiUGH9cvbt9BHLsnGmEIW2nCH8QHkJZ1o/BEXi0L9FJBPqtVBdxKbg1PlWU9ZHDNgTMmrBqxJid3Wqu+a7T9GwPwSTZ69+NnCFNE3yMr9lbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=t/DqCWrM; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="t/DqCWrM"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QDg65f019991;
	Wed, 26 Jun 2024 10:55:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=uwq+N
	V8ZY6mO4Cc/095eCF6ern9jxcJPg4S8N2tA/E0=; b=t/DqCWrMhHZrO6ZBMTVvv
	G28Y/BU63PHUuYGQar7g2AUtP33U2uQjDv0WgHAPe1538BETeXmrVnMfpgyqEElQ
	eAaKc440jE+tmvi64wqWi4WjgpzzqTExKJZ9V3nfAmdeTw23JYVMrrxYcMo6HBF9
	p0/XEJNeXZ3Sav2ew2mYG0Prz5Jw6tXKnyQpeGYDReACyNgMVUcy/eNWOBOLLNtx
	zFoKxH589NoCTfjjAxDpUroixJ7LqH48BJDIgl/aSIPudVLwxPPc1SyAZtUblDjF
	ckOsa3B9NKJqtPaP9C+8eUXk7PdDNwqEzdgrwfuooSkV4NwCswAyE3TUk3sopaWH
	Q==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3ywrf3r183-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 10:55:37 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 45QEta9O025203
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Jun 2024 10:55:36 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Wed, 26 Jun
 2024 10:55:35 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Wed, 26 Jun 2024 10:55:35 -0400
Received: from [127.0.0.1] ([10.44.3.56])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 45QEtQfe015943;
	Wed, 26 Jun 2024 10:55:32 -0400
From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Date: Wed, 26 Jun 2024 16:59:18 +0200
Subject: [PATCH RESEND 2/2] clk: use clk_core_unlink_consumer() helper
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20240626-dev-clk-misc-v1-2-e2975f2abb76@analog.com>
References: <20240626-dev-clk-misc-v1-0-e2975f2abb76@analog.com>
In-Reply-To: <20240626-dev-clk-misc-v1-0-e2975f2abb76@analog.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@kernel.org>
CC: <linux-clk@vger.kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719413959; l=687;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=FbTNRCWKW+BuxfkEMiJp2eYFRAIAL1si4NRKBdAsVZI=;
 b=nJS+nxms3TQey7GvX+g1GS18Hyojc9jm6JWbgpv966Ag2jIecsaSqNip01HFuWTx1ECNhCCKd
 A6UqvaVf++FDzijoVNnrE+sqO15dNk1I7rCU+emjhJQX9ARwJnpbsfv
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: iKdK7d9LXq_Ya50mZHcOXVNXSK-iEp1h
X-Proofpoint-GUID: iKdK7d9LXq_Ya50mZHcOXVNXSK-iEp1h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_07,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=721 mlxscore=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406260110

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

