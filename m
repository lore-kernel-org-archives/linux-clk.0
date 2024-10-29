Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53EE179BF;
	Tue, 29 Oct 2024 13:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730210152; cv=none; b=MfKU2PoWa79gcQggCyZt0Beotac2uzEY6/h77j+SU3oSDt4V9HLe77jg9IQOnbLsykiUH7Pvjdgl973dGnyK7GZ4SOrMTfoDVDjKdApN8uAJlGDy8gGoEm64MRHSFJeDtZtiI3o6gwqpUS96giz8ppIdTsabsdI3NM3bdupckcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730210152; c=relaxed/simple;
	bh=SsX5Mc9XwnuL9vbf0/m0RY+NZdJeBQncGv1TXr9S1Ms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=UWv2HQ0RsCTeIhws978gBvKRQivss5eSrzPFNOv0h65puaIP1W1yetanz78VwvaHxeVQL4pa7OOM76A4zUdhaWaCy2nUJjGBxe7XJjgpMZzIbV7gLx8nrVKv6IB0LAUFC5WNc/7qHo1weGV6cIO10uQx8vNNE2kjCu5SMYVmxis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=fAdy0hEG; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="fAdy0hEG"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TBAsp9032143;
	Tue, 29 Oct 2024 09:55:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=FHwuN
	ALGS+0maDW5co6qwuPGP6HOOtrh2DBl2O1HeJ0=; b=fAdy0hEG5SCfAayTqzKU1
	SCC155GNOm6+0ZpOoAOTx5ygBcRHoZ368Tsd4DS4Q2rxzEXGM5/BL6JSB7Xmv0Ld
	vj3hBJHVnTeYjHsFZnWUF0jDUPnrdpjZQznqkLSP0/6gkuWGeqBgAll5tDb8ddX1
	2IPMF36zZcG4R8gqYskxssjDg/Z3yqjD4xvvXsDdP3N9DiL+ZlkdnH905HEcjAgs
	hm57GlKl3wX3wGOKVVl7G2311EIw4+3hT0oBzWvYIspGCMjanNqDSBQi7pHWVEff
	W1XhTCn5fyEZlNXz5K0/A3wbgan+fFQUbtgMjgISX3O7ea0VlG/3cfgegqabgXZh
	A==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 42jxku0q5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 09:55:36 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 49TDtZGO022166
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Oct 2024 09:55:35 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Tue, 29 Oct
 2024 09:55:34 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 29 Oct 2024 09:55:34 -0400
Received: from [127.0.0.1] ([10.44.3.54])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 49TDtMVo021546;
	Tue, 29 Oct 2024 09:55:30 -0400
From: Nuno Sa <nuno.sa@analog.com>
Date: Tue, 29 Oct 2024 14:59:41 +0100
Subject: [PATCH v2 1/2] dt-bindings: clock: axi-clkgen: include AXI clk
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241029-axi-clkgen-fix-axiclk-v2-1-bc5e0733ad76@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730210382; l=2035;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=SsX5Mc9XwnuL9vbf0/m0RY+NZdJeBQncGv1TXr9S1Ms=;
 b=Nzhz48ci6VJZGJARq8VH+quHMw4be86ahLygRfj/xBRfAgdIB+Z+0UAoVQTaYROd5nBDk+WXH
 Q6zl5J7LiSNCjJqM1IdY+FH2fOl0oF5Tm4wWIhEcMXIkEIwThOC8zoa
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: -HKx1hyKfi-48ZfaCG55sgkzCBdYyElv
X-Proofpoint-ORIG-GUID: -HKx1hyKfi-48ZfaCG55sgkzCBdYyElv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 mlxscore=0 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410290106

In order to access the registers of the HW, we need to make sure that
the AXI bus clock is enabled. Hence let's increase the number of clocks
by one and add clock-names to differentiate between parent clocks and
the bus clock.

Fixes: 0e646c52cf0e ("clk: Add axi-clkgen driver")
Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 .../devicetree/bindings/clock/adi,axi-clkgen.yaml  | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/adi,axi-clkgen.yaml b/Documentation/devicetree/bindings/clock/adi,axi-clkgen.yaml
index 5e942bccf27787d7029f76fc1a284232fb7f279d..2b2041818a0a44456ee986fe29d32346f68835f3 100644
--- a/Documentation/devicetree/bindings/clock/adi,axi-clkgen.yaml
+++ b/Documentation/devicetree/bindings/clock/adi,axi-clkgen.yaml
@@ -26,9 +26,21 @@ properties:
     description:
       Specifies the reference clock(s) from which the output frequency is
       derived. This must either reference one clock if only the first clock
-      input is connected or two if both clock inputs are connected.
-    minItems: 1
-    maxItems: 2
+      input is connected or two if both clock inputs are connected. The last
+      clock is the AXI bus clock that needs to be enabled so we can access the
+      core registers.
+    minItems: 2
+    maxItems: 3
+
+  clock-names:
+    oneOf:
+      - items:
+          - const: clkin1
+          - const: s_axi_aclk
+      - items:
+          - const: clkin1
+          - const: clkin2
+          - const: s_axi_aclk
 
   '#clock-cells':
     const: 0
@@ -40,6 +52,7 @@ required:
   - compatible
   - reg
   - clocks
+  - clock-names
   - '#clock-cells'
 
 additionalProperties: false
@@ -50,5 +63,6 @@ examples:
       compatible = "adi,axi-clkgen-2.00.a";
       #clock-cells = <0>;
       reg = <0xff000000 0x1000>;
-      clocks = <&osc 1>;
+      clocks = <&osc 1>, <&clkc 15>;
+      clock-names = "clkin1", "s_axi_aclk";
     };

-- 
2.47.0

