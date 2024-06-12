Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F3D16DEB2
	for <linux-clk@vger.kernel.org>; Wed, 12 Jun 2024 09:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718184668; cv=none; b=LtvXjTdUe75zazBQyhJdmv8Ns3KCtMC3Pd5LlKsdbyCotlrnj6w3g2jstXhlY5xA1SQedzWwkfcJw/ArNFDM3Yz3xvw6tqrUVEEO4/6zLnLTVjUBQlIEWLICpn931e12lt1QawB2M6UCYXpKyKAkSoXuUMYkjBLqXBiQ/YtCSsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718184668; c=relaxed/simple;
	bh=Q7h3YVE7EOL5cpS3L6FvOBUczJpEnYf6NPIGtfreBSw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=dfYtL9ojQ5jIEykIXTSGBftEvV9xIxEskrA8KHCXkUmr+LyysolDFRK1O9sGRdfP+EUe6zWhSi71rnYaR62E+tGjca3hqnqoCHbdhFfhLEB2ACt7Z/jUmWvoEaqaYNwqD1ghk08gHl3HlOXcQ6TfU5/aWT0SOYlTw25Pz1oA0Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=03upkCzZ; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="03upkCzZ"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45C8OCCc002525;
	Wed, 12 Jun 2024 05:30:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=eppe8
	D4NdMkozioT93xDSI5IePEiKMEnonmrMoRuBgw=; b=03upkCzZPQrLiXQiwu6BW
	u3Ux9JI4i6d4lKuKKXpNohXWRD+DscMikrekVvcTlQG3ZE9rWkfVuxJ93wF0YKfg
	lCOwgy+jq9DNlWNwVDT2x1Ne9wRv2LjrpLrBuVRyQkRp7vRNrTzhbKBibJYKbMJQ
	gaTbIXRKJcIViYj11apbPVerJn991nIixg54V3+K5sgAtkqtoaUfTfcDiiYyo/bY
	mTF0Meip1sDk4ixqND7fKHhKZtLlTkUS+gCkaVBENxMDOU3DsjA7/Xey1bLPnZVQ
	F89woqyQ11U5UeY3ME9gk9GqguBCUA6coK0MHEtyp6TOX5DSibMkm/+kabIUDdTP
	Q==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3ymm726jxk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 05:30:49 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 45C9Ums8044551
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Jun 2024 05:30:48 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Wed, 12 Jun
 2024 05:30:47 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Wed, 12 Jun 2024 05:30:47 -0400
Received: from [127.0.0.1] ([10.44.3.54])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 45C9UcNX006288;
	Wed, 12 Jun 2024 05:30:43 -0400
From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Date: Wed, 12 Jun 2024 11:34:25 +0200
Subject: [PATCH 1/2] clk: fix clk not being unlinked from consumers list
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20240612-dev-clk-misc-v1-1-7ad8b58f2ea2@analog.com>
References: <20240612-dev-clk-misc-v1-0-7ad8b58f2ea2@analog.com>
In-Reply-To: <20240612-dev-clk-misc-v1-0-7ad8b58f2ea2@analog.com>
To: <linux-clk@vger.kernel.org>
CC: Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718184866; l=1101;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=Q7h3YVE7EOL5cpS3L6FvOBUczJpEnYf6NPIGtfreBSw=;
 b=5F/NAzl5iE0JRv/NB2Aqbp97mjLpCLY36Oqdy7tyq89BA+T/gu7iwUm2cz5KLIeozps6aMV3Z
 4hQwMXvNegOA2hLop6nuhZ1o83SDjcXhT2gnUrS8F+Pv1LxDrn4ltQP
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: x-ElXcURBqLsACngxvsuyq4Xht-X09zW
X-Proofpoint-GUID: x-ElXcURBqLsACngxvsuyq4Xht-X09zW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_05,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=1 impostorscore=0 spamscore=0
 phishscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 mlxlogscore=719
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120068

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

