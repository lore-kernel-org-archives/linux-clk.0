Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B4F49632
	for <linux-clk@vger.kernel.org>; Wed, 26 Jun 2024 14:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719413744; cv=none; b=nWHs5sfL94ASHj6PnSFxkb2p7sflCttn7tGypHMINlGDRK4ay9FtyGO6Xnlfkm4USFy4PGdwejrxB9pxOMmfRx27sn3YSH06sa/IsgAFqc4IIef37mBjTD+Qwc1aplphBPVZ5f1Ggj10crdKOAAUPqYQpOAmWAkuONlmnkjZrDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719413744; c=relaxed/simple;
	bh=Q7h3YVE7EOL5cpS3L6FvOBUczJpEnYf6NPIGtfreBSw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=X47hr3yQqEOkbXi2BHSXDW5JyxcX6Qtu7GZIJ18aiNJIn5JQcJf+sVBpFgRyywuWeXnQySsL41dJYTerywWUdfSYt5q2Vq479d+jU8HcSsFXq+qFBzcYDoZ1J60tLbDvQXuIvpxDBfpDA1BGzigERHwTk9c6feOj6uH5P0J8abo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=qSAYnMKw; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="qSAYnMKw"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QELVCD000313;
	Wed, 26 Jun 2024 10:55:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=eppe8
	D4NdMkozioT93xDSI5IePEiKMEnonmrMoRuBgw=; b=qSAYnMKw16xl78UAjiyTP
	WmDYXqpB5ZYimN7tX9t6iBglCnzTWro+q5IrsQlQOFigNx0aQwHURI/WKuuUhtsT
	O3Q6ZXoU1gAJbeYLnpDg1u5wAFJmNnaifkUHl5FylnLQ0awaviHKJw+G+YM3+18+
	E9LyuYwAFH/DdRmVWiie1oricV0uNGrATtj54Q3pOzk7cz89NOZMSECa3QooFeYT
	Yr0x2ic2h/mo3aR0UNs3H5SEHc7QOYCpO/DdRJAiLZLWfA8zL4ISR8pTeH8oixpV
	eS5M1tSbqLb1AHQUhEQd8KVXQQm0C8n4uLrCJ/y1V+NqIFH2/Fm+9Ac9t3loERfM
	w==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3ywuh2qfbc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 10:55:38 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 45QEtbpL025207
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Jun 2024 10:55:37 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Wed, 26 Jun
 2024 10:55:36 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Wed, 26 Jun 2024 10:55:36 -0400
Received: from [127.0.0.1] ([10.44.3.56])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 45QEtQfd015943;
	Wed, 26 Jun 2024 10:55:31 -0400
From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Date: Wed, 26 Jun 2024 16:59:17 +0200
Subject: [PATCH RESEND 1/2] clk: fix clk not being unlinked from consumers
 list
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20240626-dev-clk-misc-v1-1-e2975f2abb76@analog.com>
References: <20240626-dev-clk-misc-v1-0-e2975f2abb76@analog.com>
In-Reply-To: <20240626-dev-clk-misc-v1-0-e2975f2abb76@analog.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@kernel.org>
CC: <linux-clk@vger.kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719413959; l=1101;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=Q7h3YVE7EOL5cpS3L6FvOBUczJpEnYf6NPIGtfreBSw=;
 b=SEgMfIBNBv/7NN5+4lMqpAhKdeIa8WFq5eG4MD26GZs5A2nAKwfTbOiRu2JK7pzKpogHr0KCl
 RQO+z1uNAWSBAZsewfa3nek4ejNLNnCQGarg3SGlHPZzKNkauGJ92hH
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: DlqlwkNRZwTmhdoz-8UKl_Eh98gHvZIe
X-Proofpoint-ORIG-GUID: DlqlwkNRZwTmhdoz-8UKl_Eh98gHvZIe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_07,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 mlxscore=0 bulkscore=2 mlxlogscore=796
 lowpriorityscore=2 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406260110

When a clk_hw is registered we add a struct clk handle to it's
consumers list. This handle is created in '__clk_register()' per the
'alloc_clk()' call.

As such, we need to remove this handle when unregistering the
clk_hw. This can actually lead to a use after free if a provider gets
removed before a consumer. When removing the consumer, '__clk_put()' is
called and that will do 'hlist_del(&clk->clks_node)' which will touch in
already freed memory.

Fixes: 1df4046a93e0 ("clk: Combine __clk_get() and __clk_create_clk()")
Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/clk/clk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 8cca52be993f..b11beeca7e55 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -4606,6 +4606,8 @@ void clk_unregister(struct clk *clk)
 	if (clk->core->protect_count)
 		pr_warn("%s: unregistering protected clock: %s\n",
 					__func__, clk->core->name);
+
+	clk_core_unlink_consumer(clk);
 	clk_prepare_unlock();
 
 	kref_put(&clk->core->ref, __clk_release);

-- 
2.45.2

