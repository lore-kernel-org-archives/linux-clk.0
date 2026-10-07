Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACD240B0E7
	for <linux-clk@vger.kernel.org>; Wed,  7 Oct 2026 06:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791355874; cv=none; b=FvX/5GjZPcrFF1UOZgNF+3CCz6GWPtR+YnKg29lKAN9GhZd+ab9g+MAW0RBbmnnhsqy5FrhveH5bN0IJhWVCU1O0qsgxRmCUBRigwYJcVJ5GYKv+xwmJKyYut53pISNwAtxfxqCeqH1WsZun3SpClnBw2snO6QMB+TXjAKz31IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791355874; c=relaxed/simple;
	bh=Wcv4ZLmmvdfjbZvLQSsVP39AR6mMz7RNXcdhox0hcvw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=in7nicqo7/+YTiaBR2GzyWwsm6WryBDaEA2J5vO943VC4fDIggp6nO0SMrvy58yMPYqrvA4tlOBu3HWZdgo03lutaYOXuz1yEF4zaVEPeTBDxdR0UNJkGeOIGh7hcKmhH06y+p/+n9YehNFFe8Rm1cHF67v6vy8GqQrXN830svU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HHJpZj48; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CjjXVb23; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HHJpZj48";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CjjXVb23"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6974U8hO1895356
	for <linux-clk@vger.kernel.org>; Wed, 7 Oct 2026 06:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VbnQ5UhdwkF2mB+kgRVrvAgOBOsNAgejHqFSdDqSGng=; b=HHJpZj48q/M6t8U/
	t+Pl32OOW+6+BXS9E8/2oM7X5ul4JVr44NB8pSsRP9Xwt5c5bje/I8nCviU45FeF
	5hFgZcWzh0OrGHmDtR+2x/ZMUoghvIDYAiKSrCXlley8Ct3E03DSmKpWvd2szOlW
	k2ez9vJsiGvr5/eVyjrUd38TTVuIMwbGi3kKZfUs+WKCqk+szL18WcpD+CVXLY9j
	qc5QgOcmdtB02nO9KJLAEyAeYCMbGezPJUYEZ7EjkB+RCH/6YpjtgxEUcDu81tLO
	f9ePRaszcGIwQ3M3LI/kCJ05rn4AaoPblGpO2m1oXBT3NhrB0Gj3xKfy4Nn65Bsp
	VbdUBA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h53ask7ya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 07 Oct 2026 06:51:11 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34d62bb27a1so15787623eec.0
        for <linux-clk@vger.kernel.org>; Tue, 06 Oct 2026 23:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791355871; x=1791960671; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VbnQ5UhdwkF2mB+kgRVrvAgOBOsNAgejHqFSdDqSGng=;
        b=CjjXVb23D0R2i5MdDcI9+1ipswJyjcsX+mppnlAbDuaevW9NN+EzYHTJqPXHAT1mkU
         sCC+yua6C4vUPYvgarSyDCEKRWKl+cw4Oz2gbIWS4As1K7HFXibWwV/1AWIaM1pCsTZ9
         IIra5F8LhUHU6StyPCEvh5HsLV37a8vYAWATWLJgrdkcp4/1Ruiy5zlfdGDp5w/ZkRpv
         6Ts7dJAan0NacKeKQY/aBPwpM2V8r+O3o+7LIRltb5yF5ZgBudCzk3jNnSMUNgzeIgQZ
         nNqMKrpswCXv5zqOz1nOkPrjM09gHE7zENR7mkAmUsEpTVdO87/KidFzoq82ahtOZh6E
         go5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791355871; x=1791960671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VbnQ5UhdwkF2mB+kgRVrvAgOBOsNAgejHqFSdDqSGng=;
        b=jfNQ4vo5bDCPLcthsqduDxKJzci/jb2SmxV7lMcAL3HOdZEG7fpmHfHUgCEobkDTKs
         /qK/L/EoP30n14J5vMqekZ77kI1Ilhz8A4HW0cGkE/WBcNpIHJbTQiQ69qbU0XOxzsEn
         jjZWyZLI1Igy4n6kjyQ08ynG0iRbFLIPeeQlhdm4cKFmPILPGcy6l7b4jQYxdG+UXWdL
         ZU2qXfH9ODhetUoDK7FJ1g+kXbsQs25xaeq4lAmb62adP73nG/K+XH2XfjI728TuVHEd
         nOC5ntw1LHHVXP9oonT62CHLE99VPvfKoHN6piK/UDTm09W2GD96QU6jOjlwRuJBWYte
         bjFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzeYWih8J8/6v+bR9L935MH62G0VJfjW/weeHaF6jrV4RnM2u00zenB0wJsBQQtAsqHrr8vHztyGbA=@vger.kernel.org
X-Gm-Message-State: AFuF++m6EZhc9EJ3emISdeUqtStUqXO/u6EU1EW4/4i/BqeyF50Ju4Xy
	EV+KPdXum4iXVQsAIpGFVkxW+l/LMCc+dT1ZN0BRepVYXYRkQ63n2gwsGtVLloFLNMBtSOJDg5B
	Nj68lEe8NNAnjuTwTXYDveHSqZDlGH5mH+onbyPW4ZwuKqFxu/OnL2JBuJocAPtY=
X-Gm-Gg: AYBFou2obe++smee+i40xX1D+7YR7yEgDq9Msvn2nxm3HEZdTEb6oKv7DvWZKld9j30
	rZAugJ3oZ5gP55i3qPlSXFo7HVhDG4/738mJnmNvHVs2EvTrAHrSbvDCNCKKZm4QuosKczR4lkC
	8FC6KmRlOjpha9MOKQbyqDjMbfrRiabj0DUmQO9m6chfUiKqMRDaIbx3eYSLGcd3OnWhvZpwfky
	dfkYRIpm37Qev05e5WDlzirJFDAa7/LvkiMgEMA7zVnpSJK/6Jco/n7/5Y7YhuLz9BENgv7BUo0
	JhxZnwDT3DnRd/M0OOcVX69tqeMuDG71JE23eQAeC+4kSGY6epaNGS80z95mtmJIAMRlKSL9vCL
	Yo+wAxxl3AEJtZ6wtLeHz41gtJGEn7738B6lrGKLwB1NuS6eq+SfgEnGAl5eLkqpC4BjiN4mvNz
	ztjN36yozaCHrHyOVB7Bs5pJqGbjRDA3SORMY=
X-Received: by 2002:a05:701b:4550:10b0:151:8d26:a798 with SMTP id a92af1059eb24-16207e74c92mr1202470c88.26.1791355870707;
        Tue, 06 Oct 2026 23:51:10 -0700 (PDT)
X-Received: by 2002:a05:701b:4550:10b0:151:8d26:a798 with SMTP id a92af1059eb24-16207e74c92mr1202435c88.26.1791355870033;
        Tue, 06 Oct 2026 23:51:10 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm7374730c88.2.2026.10.06.23.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 23:51:09 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 12:20:46 +0530
Subject: [PATCH 3/4] dt-bindings: clock: ipq9650-apss-clk: Add IPQ9650 apss
 clock controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-ipq9650_apss_clk-v1-3-fd4c2b3cbdea@oss.qualcomm.com>
References: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
In-Reply-To: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: 9Gm29KA4aQ6Nfr8I0YM_HxB0ASYwybzp
X-Proofpoint-GUID: 9Gm29KA4aQ6Nfr8I0YM_HxB0ASYwybzp
X-Authority-Analysis: v=2.4 cv=Xt5vqlF9 c=1 sm=1 tr=0 ts=6ac5ebdf cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=QDl9-_pjA6WZ_EjsUeIA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAyNyBTYWx0ZWRfX9n4zJ8U57GQq
 gn3wJUo8E7GmM5xvz4LhZoiD/PsxmPFrzqEAZfemb3NGO2MfekH9aIeotcM6CY0wr46d9i3MRth
 6yElEljoouxG5xI1n9pWfHZSho9lA3MdStCNZafjZm1nq1qOLvv4PNONBCYpHcs29H/BHEPcH67
 hdkWCubJs0ZoPACOGUdCplNFWWTwSlUVhdKAQtSz/60rZ+ft2GbVJgMoJshAwbe8PkxM0mkmARZ
 4S+rZUszONjraouLF22oLv2gXlkLpWUwXChpbgu2u4ZA1JuOAKyaXas9e1sUG5AUGOiaGAQyk8X
 p5q5+jZp79hct53Z4ZKJuY/G+769zPRkZ354t+OQVVTKA8VcLG8/3OYPmy0m1DJzaC+Jpvs+JoR
 JYnuM1YGy0JO+tZZ1jXoWvmXrBK2YnPCFQlyv75Wx06IxawRNy0XcnNdV9/qyY8rPq/cRoB+sYJ
 OCayr/HHWph3kqE/Ntw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAyNyBTYWx0ZWRfXxqnmDRh0Otlw
 QUZ7Av0aIMOlZV2K6qsokc29xhFmoTXg44IT2rcFkinGqH4x3fW2rr0Kd7ZJZ1mZgZ4R8mMa+tr
 cyfkElstU+nwK58EdoywEqr3fkq9Udk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070027

The APSS clock controller on IPQ9650 provides the CPU and L3 clocks and
has a register space separate from the GCC. The four Cortex-A55 cores,
the Cortex-A78 core and the L3 are each clocked by their own Zonda PLL,
selected through a glitch-free mux whose parents are XO, GPLL0 and the
corresponding PLL. The L3 needs to be scaled along with the CPUs, so the
controller is also an interconnect provider.

Add the binding, the clock indices for the Cortex-A78 (gold) cluster to
the shared APSS header, and the interconnect IDs for the CPU and L3
nodes.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 .../bindings/clock/qcom,ipq9650-apss-clk.yaml      | 58 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,apss-ipq.h          |  5 ++
 include/dt-bindings/interconnect/qcom,ipq9650.h    |  4 ++
 3 files changed, 67 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9650-apss-clk.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9650-apss-clk.yaml
new file mode 100644
index 000000000000..6b47183edd56
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq9650-apss-clk.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,ipq9650-apss-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm APSS IPQ9650 Clock Controller
+
+maintainers:
+  - Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
+
+description:
+  The APSS clock controller provides the CPU and L3 clocks on IPQ9650 and
+  has a register space separate from the GCC. The four Cortex-A55 cores,
+  the Cortex-A78 core and the L3 are each clocked by their own Zonda PLL.
+  Each clock is selected through a glitch-free mux (GFM) whose parents are
+  XO, GPLL0 and the corresponding PLL.
+
+properties:
+  compatible:
+    enum:
+      - qcom,ipq9650-apss-clk
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Reference to the XO clock.
+      - description: Reference to the GPLL0 clock.
+
+  '#clock-cells':
+    const: 1
+
+  '#interconnect-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+  - '#interconnect-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,ipq9650-gcc.h>
+
+    apss_clk: clock-controller@fa80000 {
+      compatible = "qcom,ipq9650-apss-clk";
+      reg = <0x0fa80000 0x30000>;
+      clocks = <&xo_board>,
+               <&gcc GPLL0>;
+      #clock-cells = <1>;
+      #interconnect-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/qcom,apss-ipq.h b/include/dt-bindings/clock/qcom,apss-ipq.h
index 0bb41e5efdef..c9b04f2dbb6c 100644
--- a/include/dt-bindings/clock/qcom,apss-ipq.h
+++ b/include/dt-bindings/clock/qcom,apss-ipq.h
@@ -15,4 +15,9 @@
 #define L3_CLK_SRC				6
 #define L3_CORE_CLK				7
 
+/* IPQ9650 Gold cluster clock indices */
+#define APSS_GOLD_PLL				8
+#define APSS_GOLD_PLL_POSTDIV			9
+#define APSS_GOLD_CORE_CLK			10
+
 #endif
diff --git a/include/dt-bindings/interconnect/qcom,ipq9650.h b/include/dt-bindings/interconnect/qcom,ipq9650.h
index 023a3878cc08..1a77609de832 100644
--- a/include/dt-bindings/interconnect/qcom,ipq9650.h
+++ b/include/dt-bindings/interconnect/qcom,ipq9650.h
@@ -25,4 +25,8 @@
 #define MASTER_SNOC_USB			20
 #define SLAVE_SNOC_USB			21
 
+#define MASTER_CPU_SILVER		0
+#define SLAVE_L3			1
+#define MASTER_CPU_GOLD			2
+
 #endif /* INTERCONNECT_QCOM_IPQ9650_H */

-- 
2.34.1

