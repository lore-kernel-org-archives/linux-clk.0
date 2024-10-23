Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBEE1C6886;
	Wed, 23 Oct 2024 14:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729695197; cv=none; b=oWAMJ5Vh88GmqNFXdFJIR5xMtrRnWNJTqVDBwlvp+LtITrmQ2Y0VHrghu1SVPW/tj6s+H9nLuaci03aU81FcmSxbL/niToRexf2f5sOps6nX9i7bKyp6kJa1YR6gIZyDnhPKDmH63DwpfWu6mrxbDIFn1dSaCmqaLxiVL5Tb4+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729695197; c=relaxed/simple;
	bh=jcoVhTeiNKgBu1aR77LhfBqpwO0tnvNIDveD9ZBC8/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=a5jKJvNiSwGgKjIFBPMhMgsXINiMrMrbG95j1OqhQ4fvUFo7x8XLGyO6dflOWocVyuhO5F/Umbi2CN/jv0r2altBAduhvp3UQ+g6/uOodXd2W2PlRdlHOrxgvTlgr8Z6sb9RoR39nT54q5/5j+qI80ZihaHi3NySsy1j+rt9aRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=ZqmAqHqq; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="ZqmAqHqq"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49NDsM8W014209;
	Wed, 23 Oct 2024 10:52:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=7qeWp
	/3ZbIuOEcKtgUG17xtjDW6XGbKUp2ZN2Pp4wdU=; b=ZqmAqHqqHTeV5L2xeSssg
	Ks3UgzhQR3MLCfuNvytbFC5stpFC2RU/L4WL+kR6r5d+IpwVyr3h/QOtupekNEpN
	IDJ6uSr2d1KeP7Gb9K6akcqthmoux59QDg9ZdFOMHxzolU/DLbiqkhaZeK4KEW7n
	mRTC4ry0rQdDT8jpx1pjXslA4ITsHPDAVatwRCtE1/zWxb8EJaOUDFCHk37RNcX3
	1x1mqQhDkOmi+pXFkgmP63ckFFvbeuz2zj+nTiI0M3tbKDVJAkosslp41T05utKO
	KwUMBGpE3Z0Guk7ZDqqE+xD9ca3ObCf7E8ZK9Tcl+SrjgkDZ/UcfQLTwhcX9ECh5
	Q==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 42em30veay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 10:52:55 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 49NEqsFe006220
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Oct 2024 10:52:54 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Wed, 23 Oct 2024 10:52:53 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Wed, 23 Oct 2024 10:52:53 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Wed, 23 Oct 2024 10:52:53 -0400
Received: from [127.0.0.1] ([10.44.3.54])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 49NEqewX002884;
	Wed, 23 Oct 2024 10:52:48 -0400
From: Nuno Sa <nuno.sa@analog.com>
Date: Wed, 23 Oct 2024 16:56:54 +0200
Subject: [PATCH 1/2] dt-bindings: clock: axi-clkgen: include AXI clk
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241023-axi-clkgen-fix-axiclk-v1-1-980a42ba51c3@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729695419; l=2003;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=jcoVhTeiNKgBu1aR77LhfBqpwO0tnvNIDveD9ZBC8/g=;
 b=9JgADfv4yO/ALTiqMNvyXLdMjiyPY5V8TFBySFiattSeS2r/J9YZQ5SFjM7QxC0+sJTJkGlSf
 gtyIy2v+JyQAi6SHu87hMfTjxsLul9Q+k0F5HvFXSdf36UXPW1Tmwu5
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: XK763ArH2IOPqIjkG-V-oltp3H1WC0qv
X-Proofpoint-ORIG-GUID: XK763ArH2IOPqIjkG-V-oltp3H1WC0qv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230090

In order to access the registers of the HW, we need to make sure that
the AXI bus clock is enabled. Hence let's increase the number of clocks
by one.

In order to keep backward compatibility, the new axi clock must be the
last phandle in the array. To make the intent clear, a non mandatory
clock-names property is also being added.

Fixes: 0e646c52cf0e ("clk: Add axi-clkgen driver")
Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 .../devicetree/bindings/clock/adi,axi-clkgen.yaml   | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/adi,axi-clkgen.yaml b/Documentation/devicetree/bindings/clock/adi,axi-clkgen.yaml
index 5e942bccf27787d7029f76fc1a284232fb7f279d..f5f80e61c119b8a68cb6e7a26ed275764f8d200f 100644
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
@@ -50,5 +62,6 @@ examples:
       compatible = "adi,axi-clkgen-2.00.a";
       #clock-cells = <0>;
       reg = <0xff000000 0x1000>;
-      clocks = <&osc 1>;
+      clocks = <&osc 1>, <&clkc 15>;
+      clock-names = "clkin1", "s_axi_aclk";
     };

-- 
2.47.0

