Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB6E12FF63
	for <linux-clk@vger.kernel.org>; Wed, 10 Jul 2024 08:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720600620; cv=none; b=YDJqB4wXi1eIRHuoblVQaGPHYurITsr3MPP417hn608SsNIZrzk8oDW/lVUU/10p9jNImsNxPH1qE2lRlR0SycNdC6+ZlQVkcvqHIAKasDEkmv6pGeggjrAJ1xeKAWncKQgRJBavXHyCRWHPNzDvW3IpDrNWKq1dZtCPnGW2dSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720600620; c=relaxed/simple;
	bh=FbTNRCWKW+BuxfkEMiJp2eYFRAIAL1si4NRKBdAsVZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=bmpP54fbrbnZzQlKUG++qzv1JAGU8dxgfPn3g4LKndAe2hLE7h2csPJOUN5poOjU1JyccSe3fWy+TUpHoFsY4A3gaZGkus6hYOfDVNcdARxXqKDFXiW/JL/xVZR12ew0JpeBY5P6tevpRipCuGjO+NPo4XCfNnHem1l6XWUQBrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=C+F/3q6G; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="C+F/3q6G"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46A7V9F0029770;
	Wed, 10 Jul 2024 04:36:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=uwq+N
	V8ZY6mO4Cc/095eCF6ern9jxcJPg4S8N2tA/E0=; b=C+F/3q6G6ADBfOcljgLAL
	6H4ss10hne9VS9ul4vV4Csh7oNu8iP+LzlBKeJ9jl0U10vXbSn3AsQmp4KuFrOQb
	RmA7NfPxfVoP/m5V6aZLM5grd00/yhs1193OLWv6E8RzyTdkWCfYwd5lMlRcYg5J
	06VM5cFzomnyAT5bldngsQC1hxCYDbZb9gu1dNSpG5CeY5LA6SsyGJb4RemvTLL2
	OyJjUbLZqWguUt9gYQh9aZhQ9PZL/8WiaA5v2rl3wMdBVbdyqk+edKki2CR5czWy
	Q7haSFjtW9Hwioyg7zhHU1Etetg/6E33qSk0ebADMR9lpMsB9h7NwMfXJXOyGNph
	g==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 408fy47t35-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jul 2024 04:36:55 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 46A8asOV026257
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 10 Jul 2024 04:36:54 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Wed, 10 Jul 2024 04:36:53 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Wed, 10 Jul 2024 04:36:52 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Wed, 10 Jul 2024 04:36:52 -0400
Received: from [127.0.0.1] ([10.44.3.56])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 46A8agPh014690;
	Wed, 10 Jul 2024 04:36:48 -0400
From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Date: Wed, 10 Jul 2024 10:40:36 +0200
Subject: [PATCH RESEND (again) 2/2] clk: use clk_core_unlink_consumer()
 helper
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20240710-dev-clk-misc-v1-2-cd9d960099a2@analog.com>
References: <20240710-dev-clk-misc-v1-0-cd9d960099a2@analog.com>
In-Reply-To: <20240710-dev-clk-misc-v1-0-cd9d960099a2@analog.com>
To: Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>
CC: <linux-clk@vger.kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720600837; l=687;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=FbTNRCWKW+BuxfkEMiJp2eYFRAIAL1si4NRKBdAsVZI=;
 b=9NHDFIwqaHu/hN6lztYKPzMhWLw0jlaX+vXCOk8jBuaxbUgg7RHUnjD89mqoK8ueL3ZwQn7xs
 kEHkgiywi/CDBuXfuLr0QtUrskshRLGJQobkh61LrxMOaWwMfY5NMPA
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: aq6v4-4_MViejaJqc7PcDg0uVpNXVn6Z
X-Proofpoint-ORIG-GUID: aq6v4-4_MViejaJqc7PcDg0uVpNXVn6Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-10_04,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 suspectscore=0 adultscore=0 mlxscore=0 phishscore=0 mlxlogscore=791
 clxscore=1015 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407100057

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

