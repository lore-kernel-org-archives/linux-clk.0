Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FECD12CDA5
	for <linux-clk@vger.kernel.org>; Wed, 10 Jul 2024 08:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720600618; cv=none; b=oJchE7dh0Rb6TUVBtAXFDRTN6XvV68rwpEcaRrhKE7Y4P3oVMs7gThxuAxBmSKQMNE5SVVT9Wkl2BAkEN4QW0Rod5ZfvEta2RbaOg62RfvSSHrYYHab03QwtpYHT8H0Gwc/QfqmFiRN2Y7+zqMyVt1ZO6UXt7Td0NsD7J1vP9oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720600618; c=relaxed/simple;
	bh=Q7h3YVE7EOL5cpS3L6FvOBUczJpEnYf6NPIGtfreBSw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=pCkU6JWMb8dA8oYr5Pkws/izUe1or2fL55fdyJ+R9GzJgN/9dBZdZ6Ek1G39a2IOmznFf291a4BZNof4f6VuPHK6P4qP4c3vYSh0fq4zHmzT5JZ7+h/P/T0hejREZ/gK4KwB1AsBm2Dh+I+/F8L1Kn71LUF01W8a/lKE78w/CTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=ZJZW71TR; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="ZJZW71TR"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46A7vbXT029863;
	Wed, 10 Jul 2024 04:36:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=eppe8
	D4NdMkozioT93xDSI5IePEiKMEnonmrMoRuBgw=; b=ZJZW71TRBVO4E27nYbwXT
	ff2psLCs3x2JL5NkpbWGS+j/vJijH1Ol+R2U3ldwtDh6nnbEDjLvoYU78DC5zOEJ
	k3UCrY+lRqeUGzqwqkn+Qxvr7KcSWsIglQWNED4Tpi4EQQ8QoS9SjfIPYe8sxn0t
	cfWbzJi/3o121y1ZEyntLJ0OgEzsoxn1Hp7OyW5JDgXcTq/yN9HB3/26Fz+x9liN
	iNfM2t5dptckeiMM/D77Y7rDTrXH6WXdRJyIwqlkK96mUtSmTB8hFf7cmrndZrV2
	oJEBxC0RVRsmbTj1qsjS7nmKLrj58vL7G3OAkI6mP+008S/3cjqAd/J4UYcvCfSF
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 408fy47t2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jul 2024 04:36:52 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 46A8apVF022222
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 10 Jul 2024 04:36:51 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Wed, 10 Jul 2024 04:36:50 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Wed, 10 Jul 2024 04:36:50 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Wed, 10 Jul 2024 04:36:50 -0400
Received: from [127.0.0.1] ([10.44.3.56])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 46A8agPg014690;
	Wed, 10 Jul 2024 04:36:47 -0400
From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Date: Wed, 10 Jul 2024 10:40:35 +0200
Subject: [PATCH RESEND (again) 1/2] clk: fix clk not being unlinked from
 consumers list
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20240710-dev-clk-misc-v1-1-cd9d960099a2@analog.com>
References: <20240710-dev-clk-misc-v1-0-cd9d960099a2@analog.com>
In-Reply-To: <20240710-dev-clk-misc-v1-0-cd9d960099a2@analog.com>
To: Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>
CC: <linux-clk@vger.kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720600837; l=1101;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=Q7h3YVE7EOL5cpS3L6FvOBUczJpEnYf6NPIGtfreBSw=;
 b=kmd3VbnVtv2y+yh+4kpZmMuQG5FH3r0BsUSMIajfoke6/0zOLgqw5IF3kOW4eBv1eleEcnWCl
 R/OqMphbwhkAe2OalsH7Y2AmeeX7NPvcs3H1iEMGQGbtDN3TOPMKufG
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: rHdar8r_3TEUtcTTj9mSye7Ud5n-HHl6
X-Proofpoint-ORIG-GUID: rHdar8r_3TEUtcTTj9mSye7Ud5n-HHl6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-10_04,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=2 malwarescore=0
 suspectscore=0 adultscore=0 mlxscore=0 phishscore=0 mlxlogscore=851
 clxscore=1015 impostorscore=0 priorityscore=1501 lowpriorityscore=2
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407100057

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

