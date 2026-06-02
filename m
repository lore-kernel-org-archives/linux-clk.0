Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244843C1989
	for <linux-clk@vger.kernel.org>; Tue,  2 Jun 2026 08:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387702; cv=none; b=lEZsVJjEkSF4MU7n6hv8A+0DfzhABy/J/YOJCT/sS6seuHe3/5Wyz1XtWaD8YZmGIiXx1H3k9NCDoSoJh+twSL88lEzS/vOStJSAVJ2un8beEDAsOVwivWZwlEvgIDr+7kKdQ3oIg6LSBVf7j70wE4jBgGNlORKGNoT6RMNimC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387702; c=relaxed/simple;
	bh=FAKBWcIX5mgY1WAddlCaxXrp5BD2oKuWSr+axNOz1nY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ttwkKm99siZ/MTe9XlqcK9j+Fai5SQNlu9Dv2ivU4Z1MIy0EBPP86C2p746yVw/xrCw5Bsrz7NMh0rDHM4yVcytmkONXA0gKjOmXupcRUR9WBbQmebDfai2dZyH/1VWTRTJlRvvLS40W7JCxnDdBobYNHZrJrvPjfC65R026LHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pgaDKcdB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VM9ZnHHE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pgaDKcdB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VM9ZnHHE"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6526MpTb2767719
	for <linux-clk@vger.kernel.org>; Tue, 2 Jun 2026 08:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mXkGOYbueCyT4J0CjhRvb3NcVZM42lkIzicfj3kzcb4=; b=pgaDKcdBBWggE3Tn
	AIeuXKbdn3vjydi/dLflDl5oPbjTbn+Gz0HbtiEAX4HVoSj0I5BKg7rU90/Xqbe5
	CP+lRJcq5rAVpeuxIDeYUmZAo03C8SqAX30fmmlxhcnINZ+wNBjSaBOr0DuX5muF
	8+knWdDFa01LY43J4jTJ16H0vTbcMyPxDK3v1lf4HUXXhFFUM9ieq8n3rZvgvpCb
	Q8Z/UFh8OF7uT7My5jVI+/SREm7ZsMd56EDjO60OMhnT1Kf4if8f0tCf7tlX6Vuq
	+t/cJXenIxqq5qeLhuKKZiisj31Cl5rzu0kiQkyto14C5/jHqe3gXSviAmo/nMZg
	pLMNhg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsus0e45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 02 Jun 2026 08:08:16 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-137d4309062so7798928c88.0
        for <linux-clk@vger.kernel.org>; Tue, 02 Jun 2026 01:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780387696; x=1780992496; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mXkGOYbueCyT4J0CjhRvb3NcVZM42lkIzicfj3kzcb4=;
        b=VM9ZnHHECOrgXOgnqiymNKStdYvGIbom7mlG55ug+DgYHc94L4EO0WWByNya+FFrQM
         XrS6TnXM7HqT1BK18DviKv1o11Ak31YGcTMuw6Zpb0z3KxsGawmFuwJZ2zn/mz1FhojS
         AjsxPYVzJhcU0McYj2opYjetVGi1jdO7toCeteLh8+unEWYmtWSKrUYiSMvxVh+YMbwj
         m20eGRebbGegn9L3gWn2Bql2a1lk2K1TmgWvyW+XujMeGh4gg5W64ammlpNgIwB45RnL
         cePv62SPfktrbcRvhxHkBjtz74a3XlSThEaafgZTCaKWX+VmYnNqMCqhdQAWjWJIyTjr
         c7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780387696; x=1780992496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mXkGOYbueCyT4J0CjhRvb3NcVZM42lkIzicfj3kzcb4=;
        b=ZQdTrc2eUSwSUW8zQGOdc17L8ZDfItfB+nlkuoIaOhvYKl1MuZMnW1/duJKl8QWjqc
         LjVbhDd4mhyxWTAeXY0kOx4hAkSV3t66SDtTdB/juHX6jzkbxGP7AX02Fl7r81TZ9iLd
         /QKe7BnwdQ1/C7eyPfPhmKS9geM9hkTlkc18qRJDom9u4CwGqThq0v9QraKYXhYen4SG
         nHvHI+SdoUSjTh7+HCLyI75N51O29WEF567tzXpq6qOBcSMoF8WVa3HEbfWrzAJGAJ3z
         jiDyWK2/ZSNvCRguLwRW1/SmrEAxIPZOS8eWQ4GWw1izBuYBee+J9z2MetgzIdU5veXc
         vsiQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Q/94dyEnmH7p2icuQGi+b9f86H09wrE/Wu/j9ojBzO35RC0ykli4j52DqDpPL7es5s6fDr/CatPQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlV7rSQx5JeDg6owQEbC/yK7I91QrBZ8h2iUzvbNJPcSZyFqM6
	l5Dmxs8dq9CVfNn6s80Rt+1nIjO4Gn/gRqjFps89VH3+wdaA+WBhsF8LSnlQYRgXDiO5fOWEwgL
	NDeNDBLflRACQghYviV2iPogOB5jRs6HZXT6drZ4JuXL2g57eViOmNto+lXSHq+Q=
X-Gm-Gg: Acq92OFZ+pDF2FlTGsC2EDn0Sy4WGV6ymcbeKKzFS9CK+L/IQ+d9dT9GhL5IECE30GG
	o7w3m6ycs+oXd6/KMlX57d/F3TdKkxMGympwtKv3oVIqu3pCSF2BYqUZkt2lsUkO3SLKFoO3yau
	f9uWOqCTRMyDVqKYfY3sYv/091WNWyaGCGl/C+5vu1u3WJ1DJUAlJLxc8k9g25OLm84fz+MaBBv
	CzvyF2y4tzOwLa+e2JVFmNJRV9uVGu3sWlMFaQ762E+q15ope3f/IYrE84poYz7oY3297p1DwlE
	q0pj8PdKv1YSs8wvXmuIKj1xfL13hU+Mqqtbm0X6iF8rM8SdNgI4kZbkNRgWlzpSOJUkzFuOCEY
	UrpGPZL9W4tA4I4yCYTqKhw+WrOH+RCbkXVXM01F7tX24c8qtIQEjE0P/wZ8/2TXRnJ2vJTATLK
	OdVb0=
X-Received: by 2002:a05:701b:230c:b0:137:f10d:dfc5 with SMTP id a92af1059eb24-137f10de331mr190758c88.9.1780387695554;
        Tue, 02 Jun 2026 01:08:15 -0700 (PDT)
X-Received: by 2002:a05:701b:230c:b0:137:f10d:dfc5 with SMTP id a92af1059eb24-137f10de331mr190747c88.9.1780387695060;
        Tue, 02 Jun 2026 01:08:15 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b3d8f839sm8006025c88.15.2026.06.02.01.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 01:08:14 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 01:02:17 -0700
Subject: [PATCH v5 1/7] dt-bindings: clock: qcom: Move glymur TCSR to own
 binding and add mahua
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-tcsr_qref_0527-v5-1-8ea174a59d7e@oss.qualcomm.com>
References: <20260602-tcsr_qref_0527-v5-0-8ea174a59d7e@oss.qualcomm.com>
In-Reply-To: <20260602-tcsr_qref_0527-v5-0-8ea174a59d7e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780387692; l=6370;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=FAKBWcIX5mgY1WAddlCaxXrp5BD2oKuWSr+axNOz1nY=;
 b=UddEBnN7GiB2L2JeGtrEwfLrn6/aTN2yJqcAiOPX6043r20fVlM5xWlkUG5GoM5GJnnys/eaJ
 gNaHTe/eZIyAK+opBgOXFASZwqHoDuvEoUEUfQ7UNVneS/kSQa6aZPa
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: zw9BqqcgPNQ__jV0EI8ISRp_fmd3i-Nm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA3NSBTYWx0ZWRfX4fodZR4WCx8O
 hYBl4tDvfziR93lYqT+Kv8qhU/bL0OL5EpKQZYpqCeAL5znlC7UpWjm0qwOOrEAQCj9Dgz88l+k
 CiksPNZ1M1fbE7KnGKWFjhjCjEJbOe//Cv3v9/3OdgvQW2h6c4Hjk/78c9Puu6KNQNybbCx6D1a
 uWApQjnaFUXnXETB8LkGIoLzN14VF6pgKcpnFRHiaT/Q8PqtzvsLWJhbQa6BPwcdZEqusMs7BeE
 7qv04v1rSL0IZG/dJopEW0p+2F8tnHJstM5ZtHZ2KHLKfrxRuACoQylVgnw+ysFnPh2W4b9dyfD
 oA1S+MAZ4Mi4bT3jKZcI302cfqLtwBlWZql+fxpdV4/4Ej72pghpyurT1gU9+5glHToYweEpEUh
 5sA2u8AjE73Co77NpS/9oKY2aw1h1FmijE9KITaSIWo6vzSR8r2R8NfxfLr0LySZF9s+QoZfaaK
 Sns50BUuj2FY8QF59vg==
X-Authority-Analysis: v=2.4 cv=ZYAt8MVA c=1 sm=1 tr=0 ts=6a1e8f70 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=fCDs2mesohUn3a4l0kMA:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: zw9BqqcgPNQ__jV0EI8ISRp_fmd3i-Nm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020075

The QREF block supplies reference clocks to PCIe PHYs and requires
dedicated LDO supplies to operate. The digital control interface for
QREF (clkref_en registers) resides in TCSR on glymur and mahua. Since
QREF has no dedicated DT node of its own, these supply properties are
placed in the TCSR node which acts as the control interface for QREF.

Add a dedicated binding file for qcom,glymur-tcsr and qcom,mahua-tcsr and
document the supply properties. Both SoCs share the same QREF TX/RPT/RX
component naming, but differ in topology:

Glymur has two independent QREF blocks fed by REFGEN3 and REFGEN4. Mahua
has a single QREF block fed by REFGEN3 only.

Mark the relevant supplies as required per compatible using allOf/if/then
conditionals.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../bindings/clock/qcom,glymur-tcsr.yaml           | 146 +++++++++++++++++++++
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |   2 -
 2 files changed, 146 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
new file mode 100644
index 000000000000..2b6422627165
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
@@ -0,0 +1,146 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,glymur-tcsr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm TCSR Clock Controller on Glymur
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  Qualcomm TCSR clock control module provides the clocks, resets and
+  power domains on Glymur
+
+  See also:
+  - include/dt-bindings/clock/qcom,glymur-tcsr.h
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,glymur-tcsr
+          - qcom,mahua-tcsr
+      - const: syscon
+
+  clocks:
+    items:
+      - description: TCXO pad clock
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  vdda-qrefrpt0-0p9-supply: true
+  vdda-qrefrpt1-0p9-supply: true
+  vdda-qrefrpt2-0p9-supply: true
+  vdda-qrefrpt3-0p9-supply: true
+  vdda-qrefrpt4-0p9-supply: true
+  vdda-qrefrpt5-0p9-supply: true
+  vdda-qrefrx0-0p9-supply: true
+  vdda-qrefrx1-0p9-supply: true
+  vdda-qrefrx2-0p9-supply: true
+  vdda-qrefrx3-0p9-supply: true
+  vdda-qrefrx4-0p9-supply: true
+  vdda-qrefrx5-0p9-supply: true
+  vdda-qreftx0-0p9-supply: true
+  vdda-qreftx0-1p2-supply: true
+  vdda-qreftx1-0p9-supply: true
+  vdda-refgen3-0p9-supply: true
+  vdda-refgen3-1p2-supply: true
+  vdda-refgen4-0p9-supply: true
+  vdda-refgen4-1p2-supply: true
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,glymur-tcsr
+    then:
+      required:
+        - vdda-qrefrpt0-0p9-supply
+        - vdda-qrefrpt1-0p9-supply
+        - vdda-qrefrpt2-0p9-supply
+        - vdda-qrefrpt3-0p9-supply
+        - vdda-qrefrpt4-0p9-supply
+        - vdda-qrefrx0-0p9-supply
+        - vdda-qrefrx1-0p9-supply
+        - vdda-qrefrx2-0p9-supply
+        - vdda-qrefrx4-0p9-supply
+        - vdda-qrefrx5-0p9-supply
+        - vdda-qreftx0-0p9-supply
+        - vdda-qreftx0-1p2-supply
+        - vdda-qreftx1-0p9-supply
+        - vdda-refgen3-0p9-supply
+        - vdda-refgen3-1p2-supply
+        - vdda-refgen4-0p9-supply
+        - vdda-refgen4-1p2-supply
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,mahua-tcsr
+    then:
+      required:
+        - vdda-qrefrpt0-0p9-supply
+        - vdda-qrefrpt1-0p9-supply
+        - vdda-qrefrpt2-0p9-supply
+        - vdda-qrefrpt3-0p9-supply
+        - vdda-qrefrpt4-0p9-supply
+        - vdda-qrefrpt5-0p9-supply
+        - vdda-qrefrx1-0p9-supply
+        - vdda-qrefrx2-0p9-supply
+        - vdda-qrefrx3-0p9-supply
+        - vdda-qreftx1-0p9-supply
+        - vdda-refgen3-0p9-supply
+        - vdda-refgen3-1p2-supply
+
+required:
+  - compatible
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      clock-controller@1fd5000 {
+        compatible = "qcom,glymur-tcsr", "syscon";
+        reg = <0x0 0x1fd5000 0x0 0x21000>;
+        clocks = <&rpmhcc RPMH_CXO_CLK>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        vdda-qrefrpt0-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt1-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt2-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt3-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt4-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx0-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx1-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx2-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx4-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx5-0p9-supply = <&vreg_l1a>;
+        vdda-qreftx0-0p9-supply = <&vreg_l1a>;
+        vdda-qreftx0-1p2-supply = <&vreg_l2a>;
+        vdda-qreftx1-0p9-supply = <&vreg_l1a>;
+        vdda-refgen3-0p9-supply = <&vreg_l1a>;
+        vdda-refgen3-1p2-supply = <&vreg_l2a>;
+        vdda-refgen4-0p9-supply = <&vreg_l1a>;
+        vdda-refgen4-1p2-supply = <&vreg_l2a>;
+      };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 08824f848973..19ae0634b922 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -16,7 +16,6 @@ description: |
 
   See also:
   - include/dt-bindings/clock/qcom,eliza-tcsr.h
-  - include/dt-bindings/clock/qcom,glymur-tcsr.h
   - include/dt-bindings/clock/qcom,hawi-tcsrcc.h
   - include/dt-bindings/clock/qcom,nord-tcsrcc.h
   - include/dt-bindings/clock/qcom,sm8550-tcsr.h
@@ -28,7 +27,6 @@ properties:
     items:
       - enum:
           - qcom,eliza-tcsr
-          - qcom,glymur-tcsr
           - qcom,hawi-tcsrcc
           - qcom,kaanapali-tcsr
           - qcom,milos-tcsr

-- 
2.34.1

