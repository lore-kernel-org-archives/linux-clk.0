Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A0E20607F;
	Tue, 29 Oct 2024 13:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730210154; cv=none; b=MFtVTyp6hw44e59nmio/IKuunbPEQFno4DQVJMP00/H1I+4Vo3yBTXimXgtNnaCOeGa6cBF3C7ymM1zUEvPr4J4+zxKBF0jTXUADZKochr1UECK79fgKk2L7myDnmmhRrYNeyEh2FpTtKnfUt+iPEAcrdoIh0A9rlpNk/Xwz1xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730210154; c=relaxed/simple;
	bh=cTQEBBPSNRnIlg/4ys81fdjrLdKegaOWHm80+cLrox8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ukP3JkHMxHaPXSPqv5T43QGcZihU0nDlr9tprXZyYNjMSoCP13BhprY1h2MmDlM7OaTkfOOCD59Z18BJ+RHKkRzSH1EIO4nBXdWcBHpIUvg0erQsP3/22Zk51E+zUv6w153JVpNKH49lHh4SVfoVl7PVQSsZAdB5C2zaoN0AjgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=nZVhtmK9; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="nZVhtmK9"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TCfZVF007171;
	Tue, 29 Oct 2024 09:55:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=kSsle
	5m4DxmGqkNpW2RLzALANUIXEmTrya/BGF90s64=; b=nZVhtmK9LIWNMOx82YJ1T
	nB5RxVDs2zZAZq+sAbAge2jaZs6sHDWmPBXSH0j7BYdr5hbUNrKT5EvDDCf8qWRa
	8D96+BoWmpg6mpVZZiEdT5DpUt070ZCczCzSzsbOG8/LfyWkx9iPcd+p2kSam9y8
	urJBRIePGYUgKyU53RxThU+Q7nHiIHaXkcIethA8XRwBFxbF0H3xtIlFsV3xZ8Ty
	Rpc3jSeTmHjXJuFxcSw9LFzyqT0GuKi4RQZNfkIYcplrMOarDDRKvNagTYCXQ1Am
	FfgNB3ZEm0yNTdTkxp3uwvHFo8sW0sPasOEqhe6I6ChbICFEeOPoCC7t2j9KpwLV
	w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 42gwb2p425-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 09:55:37 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 49TDtavV055179
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Oct 2024 09:55:36 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Tue, 29 Oct
 2024 09:55:36 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 29 Oct 2024 09:55:36 -0400
Received: from [127.0.0.1] ([10.44.3.54])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 49TDtMVp021546;
	Tue, 29 Oct 2024 09:55:31 -0400
From: Nuno Sa <nuno.sa@analog.com>
Date: Tue, 29 Oct 2024 14:59:42 +0100
Subject: [PATCH v2 2/2] clk: clk-axi-clkgen: make sure to enable the AXI
 bus clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241029-axi-clkgen-fix-axiclk-v2-2-bc5e0733ad76@analog.com>
References: <20241029-axi-clkgen-fix-axiclk-v2-0-bc5e0733ad76@analog.com>
In-Reply-To: <20241029-axi-clkgen-fix-axiclk-v2-0-bc5e0733ad76@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730210382; l=2435;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=cTQEBBPSNRnIlg/4ys81fdjrLdKegaOWHm80+cLrox8=;
 b=wK/zOGCx6E4bPNEj/sdyx17NavQDA187ImJLiwBGQDZZ8ynjmxqw6L6MeJQeRIjiVvqFphtlS
 U78XZQGuQfnDlbp/Ot+BnoiCAMXfHiGCVfOWKeiommEGh+d/qzqavRr
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: VcEYVmT13SLYRA1IJTiP0MfALb0UyxW8
X-Proofpoint-GUID: VcEYVmT13SLYRA1IJTiP0MfALb0UyxW8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=808 adultscore=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410290106

In order to access the registers of the HW, we need to make sure that
the AXI bus clock is enabled. Hence let's increase the number of clocks
by one.

In order to keep backward compatibility and make sure old DTs still work
we check if clock-names is available or not. If it is, then we can
disambiguate between really having the AXI clock or a parent clock and
so we can enable the bus clock. If not, we fallback to what was done
before and don't explicitly enable the AXI bus clock.

Note that if clock-names is given, the axi clock must be the last one in
the phandle array (also enforced in the DT bindings) so that we can reuse
as much code as possible.

Fixes: 0e646c52cf0e ("clk: Add axi-clkgen driver")
Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 drivers/clk/clk-axi-clkgen.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-axi-clkgen.c b/drivers/clk/clk-axi-clkgen.c
index bf4d8ddc93aea1d4509a9ae50fa69fdb3f707a29..934e53a96dddac8ed61dd109cfc188f3a2a0539a 100644
--- a/drivers/clk/clk-axi-clkgen.c
+++ b/drivers/clk/clk-axi-clkgen.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/platform_device.h>
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/slab.h>
 #include <linux/io.h>
@@ -512,6 +513,7 @@ static int axi_clkgen_probe(struct platform_device *pdev)
 	struct clk_init_data init;
 	const char *parent_names[2];
 	const char *clk_name;
+	struct clk *axi_clk;
 	unsigned int i;
 	int ret;
 
@@ -528,8 +530,24 @@ static int axi_clkgen_probe(struct platform_device *pdev)
 		return PTR_ERR(axi_clkgen->base);
 
 	init.num_parents = of_clk_get_parent_count(pdev->dev.of_node);
-	if (init.num_parents < 1 || init.num_parents > 2)
-		return -EINVAL;
+
+	axi_clk = devm_clk_get_enabled(&pdev->dev, "s_axi_aclk");
+	if (!IS_ERR(axi_clk)) {
+		if (init.num_parents < 2 || init.num_parents > 3)
+			return -EINVAL;
+
+		init.num_parents -= 1;
+	} else {
+		/*
+		 * Legacy... So that old DTs which do not have clock-names still
+		 * work. In this case we don't explicitly enable the AXI bus
+		 * clock.
+		 */
+		if (PTR_ERR(axi_clk) != -ENOENT)
+			return PTR_ERR(axi_clk);
+		if (init.num_parents < 1 || init.num_parents > 2)
+			return -EINVAL;
+	}
 
 	for (i = 0; i < init.num_parents; i++) {
 		parent_names[i] = of_clk_get_parent_name(pdev->dev.of_node, i);

-- 
2.47.0

