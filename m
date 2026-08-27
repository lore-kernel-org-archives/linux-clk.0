Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F0D35676B
	for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 06:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787812792; cv=none; b=UjHQybhimcGrT9Vt3PMryDN43izjqRiT5BxYuCGwW9UqIYViTWWtmuVU75K74suf6SJLdzKwhixmaTOJ25qjf/mc43x96+OtY9ujsOTuqafLnN3kTmNZ1fD88qH+RTSBPLTm2fDrmRpk2O5kKbBEPHn4/brOWVGrMdkkD9k0nxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787812792; c=relaxed/simple;
	bh=Cj6vFAWO7M0EpdlqhbOZQRN8Ksivmts2TEEpPHjIv3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WH9m8bgdZ6g7fwU7pje6vizeF7j1jiCNYGqqv/+nMWpw1NDOaZQ7tlIvdUs640TokYlQbi0GE/GeTBmi7mQjV4HGVWF9JA1TiakgURGEgmmLQR8V8RA9ZK12Gr/tGpmWCxQ4iuWLLy9wj7EhLJmRk7/L5MBuuOTxC53M16TU2Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f+w2v6pz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gQ6F+e7a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f+w2v6pz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gQ6F+e7a"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R6RQ3h3835785
	for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 06:39:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=iZjIrF+rfvajebhoApDH4OezeUsEvneqopR
	VQByZHyk=; b=f+w2v6pzSGo7/mz3kwcjXXjKaBmEIDyKmQdut3a1cNerjJIi+hg
	+sEyvTB0yuuYfqM7m8DIK2fHrBEDTTYMWk/pnlUDitFI/7EaT4pLh5fpbk9S9Uk4
	jToLw+Qe0JLBc39LDp7JSS4AldygPvVKcnw4sT4BjPmSYbdpOypMhLu2cZyDZChU
	XNBaIk9F9WBkPQkEG8oH9K0MYxo6pSWYEp85QvdtEeoqhLHm54Ge5yla4g5JimSc
	KOGEKeiIiGfK9ZzfqXxk29jqCW9qUU17mycywLowUAKQFm/KPhY5Q8NruIsmpYl1
	zgQE8mr66VFFOezFRmWMqHG6LCHRHh9fCQQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga0wbuare-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 06:39:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936708f129aso124172185a.0
        for <linux-clk@vger.kernel.org>; Wed, 26 Aug 2026 23:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787812789; x=1788417589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iZjIrF+rfvajebhoApDH4OezeUsEvneqopRVQByZHyk=;
        b=gQ6F+e7aI7Rbgmha2cBO+yppncwfulKuKXhICYionH7d8odr2Cz7LPg1rnS/grTk26
         bgSlJPYZUX95g/xxtCi2yDpE1gRkwTduVq137Bzj9hDriaGURZGHT1srBvEl4C5Ic+fD
         nRefgHNh+UpEsH4n/Yk1MfX4ON4F67qi1f98Uf5RSEZJbs32OWtogPMf+s0jTZ+jJxyU
         EHBLAboIdhWMT7cwMmqyANrWuynRke2xzzwBNRjca6GVpMeWbqv3Jedh75q5Y2CxTIzi
         aBu/J76FNTs9UjP8CK0XlS7SSoiMDEh2ma5kOLXCdzGwiI22IV8LQKrn0SZzCu+5XlLQ
         vklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787812789; x=1788417589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iZjIrF+rfvajebhoApDH4OezeUsEvneqopRVQByZHyk=;
        b=UOWw/zMMuqfoZJqZM5LEBpAmBxiM0MqL+Oe0V2JuthneY8jOJUEL63kRQRID1b1gjr
         30nG+xsMGfP6sPtZq3EZv7VX3HHQtwIdqajCgTY2Efy1/C21QYepsdVhcR0klw1gfGIi
         yzqnpHVwMUH1dzYuBLMYtHiKrvpWMbhbZlaJOUIqDxKu0FLhiFenLQ7efyi5xbXLNF9O
         p4r5pwhwu+S0eIvgrrxAnQL1DYscD+1agiB81J7WPPxV+fRnGokhbQVpX08rkTFxA0ZU
         XDRjTM0BQJbwx+NTaOxjjp7dBrIQ0I7ReP0bcdw0h5jLqy7YvuYOc+XvkdrePQoyo3iH
         bPUQ==
X-Forwarded-Encrypted: i=1; AHgh+RrbOUgOdlFy3bjNw+JS14Addi89tTljpMcB3UE4hzY7LDKHolC+Xfzcde+g8EXbskTOJaCaQWMjM9U=@vger.kernel.org
X-Gm-Message-State: AFuF++kgq8rWUYPcAMA3bgAglsQdi4m3B6Ce0Zk9DeawJM5RdCj6zlQD
	79gHYmb003NE9mklwUuh9vog+2AgA24+I5f6ErrgXJasRBipFgSL2nA2HAmg2GpzOTRFm3NW+PZ
	K+Bt5dm7L32X4nxqxTQol4IlsXgbvQKA1to0hSfc0JRWp+lrGeurW0WyzJqT0ay0=
X-Gm-Gg: AR+sD11+UvPkEVDlSRMbdockjP4TKMhANlx2zYkFLARi7S+j/RFXb24NXoCchle2uDn
	EAboAniFEYaC2isiNyDfaCGWjTAykvYYMsHvDJuWxyiUx+NcIObsPsONYrAkmHT3FnNmMwEnZJi
	WYQOzLgcS+6O/umujlfgqf7NgPcrJLmb5Aee0J8s0hPg20NC/1wlNdqzW5QUegKNoV/vfUki0FD
	sYEwA8NNDfNaerSDm/pEo5/QaTGDHYM3W4aZFZBQ+c8o1k4NNgP9QnWti/EYp/3mQbBVdz2CbAc
	Zifq1hlGYGf+Jd0HTHvfN3uc7Rtmxe/HN8VnIpCnyENQ+aelE8wlT/Oo8DNSsCA9kKOB6cissC9
	llnDSrQR7rOMDIvg=
X-Received: by 2002:a05:622a:2cb:b0:52e:2d4e:8ef5 with SMTP id d75a77b69052e-52e4204e8a2mr119069701cf.0.1787812789261;
        Wed, 26 Aug 2026 23:39:49 -0700 (PDT)
X-Received: by 2002:a05:622a:2cb:b0:52e:2d4e:8ef5 with SMTP id d75a77b69052e-52e4204e8a2mr119069351cf.0.1787812788778;
        Wed, 26 Aug 2026 23:39:48 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b465226d8sm27230685e9.0.2026.08.26.23.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 23:39:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Danila Tikhonov <danila@mainlining.org>,
        David Wronek <davidwronek@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375
Date: Thu, 27 Aug 2026 08:39:41 +0200
Message-ID: <20260827063940.44497-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3576; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Cj6vFAWO7M0EpdlqhbOZQRN8Ksivmts2TEEpPHjIv3Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqj9usg1hFJCnIJEObJ2sa+7LtisjOWRtLPLXAC
 xM20BNtNTuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCao/brAAKCRDBN2bmhouD
 1/+zD/93WgifP3aIuah2IKi4RNNWqc2I3PJcnAXKTN6i/goIfwLoxAbZFogvmz8RKqw74qPHjLr
 yByrtmXrDnv3f8cRHM53DcjzRocaAd4ORb20B5TF73jDD70US1VZrMroGUJ5egf04ZQGlUIFHrs
 KLUvZUPD9BaIvxHm9WQdwqXypkcCTmW+LjU4GDL1uL0wqmGHgK3T5l4BYA9MMLq/dsSM+64dqzY
 hsQitO2tYOUPJOlJ4HGamfKZ0+vTap+CwFf9S1OgmJV7vVNeLbVjaQ2F5fFYHxqApNaj/sUnDtZ
 TTlf0TcVeBVxm85JdgBTUzBqdniFOpUtqicJMKkIeE2tpWksp1U+UpeD7JEhOdkwWInoNxg8OvH
 GsAKpO4uDab9vamtLI6YJZ00hfKj+8AvHbyNS3UpeXf+nwMEiOz0UgNKAXSX0ELbw8x4R7Z1AmD
 9bICs9x2/+tukYuzLGqHk0/7IOqwP9yGRRIYSG7pyZinHYdwHLAq8vHpsILdkas0G1A482hw4Ep
 hJDYnnSaBGSh4LW3Lmp15wbIooTjT/FjjDb3BbZbWNA0jE4nWDjlpaPCqAWkICkTXyKj9VcK1Zs
 NRj25CPdXZAj9tXoLRX2/rLichv7iQ96aw8WLJdC3G9LhYu/HhdqXv0qdz8VTfhsS6Ykpu46lRW NtKA1orm6DYi+Ng==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: PEH2IbWfjjaXgIalV6lCFgydeLF3YXT5
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA1MyBTYWx0ZWRfX8/+7kdojqMjj
 WOppBEsV8SFmoF4c14iqLnCb9ENSRs+Fgv9DiGsV/GnzmVndGStV4znZWRuQL+hZuhAZM7ErYNe
 TVavF9DZvTtEQ6PBIdzm6ufitaOBFqs=
X-Proofpoint-GUID: PEH2IbWfjjaXgIalV6lCFgydeLF3YXT5
X-Authority-Analysis: v=2.4 cv=SoCgLvO0 c=1 sm=1 tr=0 ts=6a8fdbb6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=7ibcVnAUAAAA:8 a=pGLkceISAAAA:8
 a=rN_0p8sgu83ql7wKLuAA:9 a=PEH46H7Ffwr30OY-TuGO:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=HywIFdX19-EX8Ph82vJO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA1MyBTYWx0ZWRfXwEzwfg9Y+1h3
 zeA/mwuudTDr7uJNH/9cFHKYPXDQT63KuddInv7BV4oYoLeTkZyzSzJOf3bQ1Ki5EQeFE4BPBJH
 h5RCHo9Z9+Gp64ixEZhSOHX8k7cYbkFZqBzELDZOnvLKiv3jWye/AN1F0zCCWk6DeCYcNcEKRQj
 Ux8cHu8+vVenDuNAQYg/ItMs0ANuRwD2PD6S2JTfdxHv27gXU3l6dFG1lhgr5HC83OgwnVwVHtU
 8ZCuNo0dud3HeikI2NRz93WfsI+a30zeGKYYzY68WSF9RNJHvGwLBiv676hC9g8TQDNCJQ1Ty07
 H/DCK2GqrbTpXpCPs2G8NR+uQbBeEcTWRL/54Mw6C1bi1+4MneHmwwjdtnbHD4Hhacq7/NH0nYR
 YWsK+vGZytCtPVs3tpwOV/1ZqKH+c/4d3dH9JYPfkhp0Ss6wa1UkACpgxa5KPiZucTpbB/w+1HM
 Tz4lG6e0UcSfLf0s+9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608270053

Bindings for Qualcomm SM7150 and SM6375 GCC clock controllers are
identical, so this could be one file for less handling and encouraging
future grouping of similar devices (like SM7250 which also would fit here).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Update description/header path
---
 .../bindings/clock/qcom,sm6375-gcc.yaml       | 13 +++--
 .../bindings/clock/qcom,sm7150-gcc.yaml       | 53 -------------------
 2 files changed, 10 insertions(+), 56 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,sm7150-gcc.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml
index 66dfa72fa975..7abf229e4940 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml
@@ -4,23 +4,30 @@
 $id: http://devicetree.org/schemas/clock/qcom,sm6375-gcc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Global Clock & Reset Controller on SM6375
+title: Qualcomm Global Clock & Reset Controller on SM6375 and SM7150
 
 maintainers:
   - Konrad Dybcio <konradybcio@kernel.org>
+  - Bjorn Andersson <andersson@kernel.org>
+  - Danila Tikhonov <danila@jiaxyga.com>
+  - David Wronek <davidwronek@gmail.com>
 
 description: |
   Qualcomm global clock control module provides the clocks, resets and power
   domains on SM6375
 
-  See also: include/dt-bindings/clock/qcom,sm6375-gcc.h
+  See also:
+    include/dt-bindings/clock/qcom,sm6375-gcc.h
+    include/dt-bindings/clock/qcom,sm7150-gcc.h
 
 allOf:
   - $ref: qcom,gcc.yaml#
 
 properties:
   compatible:
-    const: qcom,sm6375-gcc
+    enum:
+      - qcom,sm6375-gcc
+      - qcom,sm7150-gcc
 
   clocks:
     items:
diff --git a/Documentation/devicetree/bindings/clock/qcom,sm7150-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm7150-gcc.yaml
deleted file mode 100644
index 3878808f811e..000000000000
--- a/Documentation/devicetree/bindings/clock/qcom,sm7150-gcc.yaml
+++ /dev/null
@@ -1,53 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/clock/qcom,sm7150-gcc.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Qualcomm Global Clock & Reset Controller on SM7150
-
-maintainers:
-  - Bjorn Andersson <andersson@kernel.org>
-  - Danila Tikhonov <danila@jiaxyga.com>
-  - David Wronek <davidwronek@gmail.com>
-
-description: |
-  Qualcomm global clock control module provides the clocks, resets and power
-  domains on SM7150
-
-  See also: include/dt-bindings/clock/qcom,sm7150-gcc.h
-
-properties:
-  compatible:
-    const: qcom,sm7150-gcc
-
-  clocks:
-    items:
-      - description: Board XO source
-      - description: Board XO Active-Only source
-      - description: Sleep clock source
-
-required:
-  - compatible
-  - clocks
-  - '#power-domain-cells'
-
-allOf:
-  - $ref: qcom,gcc.yaml#
-
-unevaluatedProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/clock/qcom,rpmh.h>
-    clock-controller@100000 {
-      compatible = "qcom,sm7150-gcc";
-      reg = <0x00100000 0x001f0000>;
-      clocks = <&rpmhcc RPMH_CXO_CLK>,
-               <&rpmhcc RPMH_CXO_CLK_A>,
-               <&sleep_clk>;
-      #clock-cells = <1>;
-      #reset-cells = <1>;
-      #power-domain-cells = <1>;
-    };
-...
-- 
2.53.0

