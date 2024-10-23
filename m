Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC981C728E;
	Wed, 23 Oct 2024 14:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729695197; cv=none; b=jJJ+3J8cxJmeJIOGWAshSiW1SO7WT8fqvJXb8XqcPPU5Rb0VukJ4h3Rp+4cSpyLEfDI0n5RK4GyMHg1qNVaVZ5N79A04tTwyqHIKHt4/hednYy8a6nQD+uurrNsbWop9Z7IiUkT2dhYm8uJG73OhWszPuoCOzrd21kZ9moKDXeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729695197; c=relaxed/simple;
	bh=RzVlX88H7cb+6ZDvccxbbjBTkNbEap1Nd1RhwgPzGzU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=HuyQHYNbEhUdPwBOLyPPr9HdF8ohnEY5AVyqRn2TItazgMc5StnsYOw1Dt75AS6KyF9ljlS1/6wxyp4P6sJOZjRFyZbSUlOj3nHiCX/idO8oZ+vQPFVjrvmECz+ODsYUXEVkcTKX962oIp6dupjd2uCoKqv18WO1bLUHX8FFYxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=yq8cSrYC; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="yq8cSrYC"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49NESW4D013339;
	Wed, 23 Oct 2024 10:52:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=V1V+7
	t029oc+CvcxmaGJnQkHgN5OyJgmGmMWSeUdt6w=; b=yq8cSrYCWUNxridePGLW7
	tn4cLc01S8U+jZvtxQB91+x1JRE/0XIaWGGVxs5GHB7mFBNBWGszKAUS/4EXMWoS
	vAL1R9CbkG2IFjSd8/jGyFBxwIlcU1tpxqGMjTakWiixgHQbkszjYLIvs8RSoRHQ
	ntcyMQmLnAavikKQfQbuokHP51AEsk3LYnFlADkzn3F8/VDT6Dounp/F9TajgKFr
	t9PC8VI5ZcSp6nmLMc3zk/uH+mJCjBmnD7w9lzM8NOzMsMUUFQfidQKL6Hg4OfHX
	yjuCCE1hj+PsHaOqftszHVN3tFAbeS2wc/c34yUQzI3zSY1sri3xe1gxCW0p+wmR
	g==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 42eyqr18kg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 10:52:54 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 49NEqrVk034028
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Oct 2024 10:52:53 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Wed, 23 Oct 2024 10:52:53 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Wed, 23 Oct 2024 10:52:52 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Wed, 23 Oct 2024 10:52:52 -0400
Received: from [127.0.0.1] ([10.44.3.54])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 49NEqewY002884;
	Wed, 23 Oct 2024 10:52:49 -0400
From: Nuno Sa <nuno.sa@analog.com>
Date: Wed, 23 Oct 2024 16:56:55 +0200
Subject: [PATCH 2/2] clk: clk-axi-clkgen: make sure to enable the AXI bus
 clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241023-axi-clkgen-fix-axiclk-v1-2-980a42ba51c3@analog.com>
References: <20241023-axi-clkgen-fix-axiclk-v1-0-980a42ba51c3@analog.com>
In-Reply-To: <20241023-axi-clkgen-fix-axiclk-v1-0-980a42ba51c3@analog.com>
To: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lars-Peter Clausen
	<lars@metafoo.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729695419; l=2577;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=RzVlX88H7cb+6ZDvccxbbjBTkNbEap1Nd1RhwgPzGzU=;
 b=Zssdh8uYJAQp7UDtR98eV3iyj7ARjLCUpPKv7lQtMmYwNis7IaMc16P5yWdMf3NuHKChnEofc
 /YRUEpngR54BPpORpDUx79RPiMw7Ii5jvGep9E6+yWPzBHGJn8qez0s
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: KfGMmDLgxX3TYNl48FsvZ__y9vfJkgCI
X-Proofpoint-ORIG-GUID: KfGMmDLgxX3TYNl48FsvZ__y9vfJkgCI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 adultscore=0 bulkscore=0 mlxscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 mlxlogscore=773
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230090

In order to access the registers of the HW, we need to make sure that
the AXI bus clock is enabled. Hence let's increase the number of clocks
by one.

In order to keep backward compatibility, the new axi clock must be the
last phandle in the array. On top of that, it's not an actual parent of
the axi-clkgen.

Fixes: 0e646c52cf0e ("clk: Add axi-clkgen driver")
Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 drivers/clk/clk-axi-clkgen.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-axi-clkgen.c b/drivers/clk/clk-axi-clkgen.c
index bf4d8ddc93aea1d4509a9ae50fa69fdb3f707a29..6403f0e321b4f8fb74852cae2d13507d8cad82df 100644
--- a/drivers/clk/clk-axi-clkgen.c
+++ b/drivers/clk/clk-axi-clkgen.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/platform_device.h>
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/slab.h>
 #include <linux/io.h>
@@ -505,6 +506,16 @@ static const struct clk_ops axi_clkgen_ops = {
 	.get_parent = axi_clkgen_get_parent,
 };
 
+static void axi_clk_put(void *clk)
+{
+	clk_put(clk);
+}
+
+static void axi_clk_disable(void *clk)
+{
+	clk_disable_unprepare(clk);
+}
+
 static int axi_clkgen_probe(struct platform_device *pdev)
 {
 	const struct axi_clkgen_limits *dflt_limits;
@@ -512,6 +523,7 @@ static int axi_clkgen_probe(struct platform_device *pdev)
 	struct clk_init_data init;
 	const char *parent_names[2];
 	const char *clk_name;
+	struct clk *axi_clk;
 	unsigned int i;
 	int ret;
 
@@ -528,9 +540,30 @@ static int axi_clkgen_probe(struct platform_device *pdev)
 		return PTR_ERR(axi_clkgen->base);
 
 	init.num_parents = of_clk_get_parent_count(pdev->dev.of_node);
-	if (init.num_parents < 1 || init.num_parents > 2)
+	if (init.num_parents < 2 || init.num_parents > 3)
 		return -EINVAL;
 
+	/*
+	 * The last clock is the axi bus clock that needs to be enabled so we
+	 * can access the IP core registers.
+	 */
+	axi_clk = of_clk_get(pdev->dev.of_node, init.num_parents - 1);
+	if (IS_ERR(axi_clk))
+		return PTR_ERR(axi_clk);
+
+	ret = devm_add_action_or_reset(&pdev->dev, axi_clk_put, axi_clk);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(axi_clk);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(&pdev->dev, axi_clk_disable, axi_clk);
+	if (ret)
+		return ret;
+
+	init.num_parents -= 1;
 	for (i = 0; i < init.num_parents; i++) {
 		parent_names[i] = of_clk_get_parent_name(pdev->dev.of_node, i);
 		if (!parent_names[i])

-- 
2.47.0

