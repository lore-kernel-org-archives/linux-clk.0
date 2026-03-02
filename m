Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2A035A952
	for <linux-clk@vger.kernel.org>; Mon,  2 Mar 2026 10:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772448827; cv=none; b=Dj/dSroaD8qkJV1MWqBQgNqsYX9FTnSliU429ZkTDQF8CWhgu32TdVE/dBVX+ewNYENu/4LbL7rmbMLAzkNp2Vdmyw7m6JqBdi2S/43CEzHROjCIAD5yYlutJgtG+0fsXcDlSN/Th19KNZ2QnyOJm8bmIEOjQpam17YYM6Iiy3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772448827; c=relaxed/simple;
	bh=+X74KMWb2lVjQ9fnowKj6jei9ytZdwOYWqFCEBJ/bZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K2zOUEqP5Ff5ghrMI8LfDfALmJHww+Df6QA78Wd8iwQI3Y1vdlxiZndjLsj6BflKo0KEwARg20bJjyNWvvJupP8WTnPbAvmq2JJdcl/Ut/oqJBlwnge1MMKAbBMTkWmZOSkgeteUbHFzUxVD5NnsrrKTrTCHgm5/mtlu8rpyAPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MQDrmRpd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jTlTvvTm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MQDrmRpd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jTlTvvTm"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6228CsED2964276
	for <linux-clk@vger.kernel.org>; Mon, 2 Mar 2026 10:53:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fB98BuCBiJhrIm8NgYodeQbl3q2SBFUZLmymOwOVjDs=; b=MQDrmRpdFC2963ym
	I40VQ6fy8Qk0flGVT6sIj+dbkb6vor+cN+pV3nPkJhF63XFFp0UZa7gKLMrFyf7p
	wlB80343UQBPcMb8o3HOHELauz4mO/r3MI0DF36YsviujxsdO4oIma3QRWLdZ+H4
	+pH9H7BDCsurLIixpsNF2jul/4nxZbjlFhq+94QAKUCn1kOoRTxjcYAjz13mSH09
	odaqC6AdhGeb4XrsfXZHdTgNor/roMDT6xO5MMSlrPk9DlFFZ9DiMm6AuO2MleYu
	Pcn0aTVJWfM98COMF3UnBhBqbNc92XKnP4R1k7lVcf/4Xxlc1Zk/ilOKBvBmGgK5
	ua2BtQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmgbau1yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 02 Mar 2026 10:53:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb42f56c4aso3694244085a.3
        for <linux-clk@vger.kernel.org>; Mon, 02 Mar 2026 02:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772448824; x=1773053624; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fB98BuCBiJhrIm8NgYodeQbl3q2SBFUZLmymOwOVjDs=;
        b=jTlTvvTmkPUCthdyc/DuYYeQZ3UJFmktO7s3M8652zEP/kFecOQrO+gd5FaMCIF6lE
         CaKVSF6JX5BYN2j2k5eBsgu8eYOFstxHN54FBNDAeiEqqoYIyYjJ086vrQE3BALrMRtg
         XuORvH+AEhwO6x1UM7d55j9xnvBoIKeyAAKB1cmta4b2wRwEA7BPV85SOc6wGcOpAJB7
         ReNDQXjh+MzkOH3HH87h82AsK7UbyBZrL9ObGDdbEdR7F2g8aZAPelQePEWOvBNhqwRh
         +mVT3tjE7jWzoMOPrYSmjfD+3BwUy+6yv0ZOubIpymg+nY7tvPcQQk5qrwn3xlL3C5uI
         1IMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772448824; x=1773053624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fB98BuCBiJhrIm8NgYodeQbl3q2SBFUZLmymOwOVjDs=;
        b=g42K3GbbbU4JcX77gbBGlRskDyAX/dbpCv+ThqPBik4TmcipVtjV53KRVTJXy2fvUx
         23xb9C9r0pvQpe6PvHsfVBj9m/NdqZ17nLs5cfSDzQb6gALmwSDT8L54QqvAHlr6mk8s
         fE3IzKlic2qjMn66gXMBOAazInwQJfJKRo8PMx/Zlo30+ueu/ruaAuaD51KmZ826ShLr
         p1W0UrVAHXlp+zGnuyxCbYcmBF39czopdkWMOJV1hmxk2zuPpC8hli6AfSI2bc+guSaU
         5btx74675hTXuzEjVhp8KmhcFATao/rO0kj6eg6+VYWZ6o7U46HsL/BQebPQPJrrJ24F
         /nkw==
X-Forwarded-Encrypted: i=1; AJvYcCVdGs1qwu5qjgrLwBz+0AL6vFeW+gV4UfQicAxrmbfeRlPacEuW0aAiDmakCnn22rhamQ0VbAH97uA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7ZCvhBOdk2WWOWCTCU+hioO5q73y6SZIjRx5D4RpzIAijwJG9
	a5ZBxBw4gY5I9JItPYeDo0yA3VyADpBIEtrjeqQHCPr0sIPgsJjnI5v6gFkAZeD/WFHI2r2Ot2K
	MSIdwJgWyaMu8pzD4IWOHlsxO7ssBKZFrQfNTZexGaoQ4Svix442PJIGFa/MFjZc=
X-Gm-Gg: ATEYQzyBMZ0i3+iCu3L2EFKkU7NyzhJuc5Y3HSv6HbUDNwD6PHTHtS/42EGj7eu4MVb
	Qv6X5a64kaKHL/OlMf2v4T8gIB81eIubDSNdiPMcGcQARU0kvCUd2xUUi3aXOyZihqZeAmXXBZG
	MYrI0/zZ4fEj3eZnvxxPREhVy0osPVSidvxyKnMdPZTj3svaaCckPQVSqSXZ35aAJEqHkl2lxOL
	Y6aw5pVHFXCdz41BohXMOKHouc7YXADvNaubNNV9Xhm0mRd3EH2agrWAk93bB4PyWtUQYbYnuQx
	drYnift1jCM9Ri3jUKHLYq/MDwbCsyyGgqD2oZe6E/mEdGfc8F+DX7yNh01pr+Kq8A1FgnTDTc8
	C2HcKV2ilc6BxgN1SoHpz7U+lix1Y2A==
X-Received: by 2002:a05:620a:2591:b0:8c5:3415:aceb with SMTP id af79cd13be357-8cbc8e8095emr1507361585a.32.1772448824329;
        Mon, 02 Mar 2026 02:53:44 -0800 (PST)
X-Received: by 2002:a05:620a:2591:b0:8c5:3415:aceb with SMTP id af79cd13be357-8cbc8e8095emr1507359985a.32.1772448823777;
        Mon, 02 Mar 2026 02:53:43 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b59723fesm8399509f8f.38.2026.03.02.02.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 02:53:43 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 12:53:30 +0200
Subject: [PATCH v6 2/6] dt-bindings: clock: qcom: Document the Eliza TCSR
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-eliza-clocks-v6-2-6f42d8a9d25c@oss.qualcomm.com>
References: <20260302-eliza-clocks-v6-0-6f42d8a9d25c@oss.qualcomm.com>
In-Reply-To: <20260302-eliza-clocks-v6-0-6f42d8a9d25c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2001;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=AauMYzLc6gTEXz/GOQcSBdK6m37250bGHySZPyTqHNw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBppWwsAJk/rvjPEyfQMVifir/1rWW6ylF3L0C3Z
 movolv6da2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaaVsLAAKCRAbX0TJAJUV
 Vp6YEACnvqCyyDLDGdDfd1d5/Vw8hPYe/EUOc5hhI3qnogiX/pvgtssFnCRhircXtyniUp+omfs
 hUV7VK3/8KBJTYUSsSlmuHb1+Qf26mNAPj9ka32ur3Oo+tGYoiFj/JkpL6hk93DZYNXK7ByQkix
 TBq8pEVB/RvrQ+2RAEzyP71czVV7984hAyo+4gqFET3ws8foxcIzJVnx5nVg4IDRk2AcvdOpDiq
 h4X8ZfL5j2r/ee4wg+JH0TAfqFkmNj1+jXky5ETjoCLfO+Ylzumlp3LY0GMQvbm/nyOMom7jCpG
 0v3YHLjpzfwjpWhbJFG/BCF1J28z2k5s3bublDQc0umM1shV5j7K0cYWjXMSSvXEEx5tEaVSEJU
 Qty1KhO0S+iW3nSoVEpqm+f4jAmuSrbWC03IZejYIDpWUaNy1PHfCGoJfGRcnywaHK5y890TAlO
 N3knY1ldGKXl9aO8HhFTdfKx61zcMWP2//ArIPF5A+SVxaa2JYuL8sTL1qNJ/aNB5wbUtuqBYjT
 4w6wSs09LoRWFMRYVPmaibF9/k6qa47se31N2NZHattleD6yqMVa5seF40+7llWuQvuWUzLbF3N
 +/WTu+agsKZYBZr4h83PZ/IzRY+WcA22UsbzRrtqAMIG2zIZkaAQ7G3m1S/tuTW/B3jpfN/HTpi
 vaSZuDynASVrm5g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4OCBTYWx0ZWRfX7qQg0yvoTP9C
 Q9/rg3vEgYajxZBV2P9n2182roQEblXFqwgwaxGO0QD9KmXRuZMH+QFtNC7ASb6CJTPDeR7RcnG
 8+RZnPROXqtK2C5DFlcBD2yK2hF5jUjI3TAxZ5ygezpHCfJf6gLmk+9qc2VtYUNnDH2i8E5NQ3F
 /eYIGbB5DJLvkUuicmJWoMFgLRX0MyzCeRlmaXNOLctIGv+gEIpc4mrvkERdOPWysL1j77mFNsO
 vs0BzNJgw7TFwcJYRKe31KoMPeZO9ar0VbczD5OXb8G4GlO3fO4jbh7EVVrNmYmhdQAsoIY0gJd
 aKqgVHWLQ9j+X5RoNcO2uFYZn3R2RlSrTo52b0WCEHFwvLOsdsSgLCm75wJbUvKZyjQJGxlcI3h
 iPRQzU5RkAWmrVNpmCrs2KwaYgX+JpBOefh+GWZ+1pKJolDkvzj7B3zOXun4NDuCxHK7FavL+HV
 J/qtS1P76M9Mm6+vN0A==
X-Authority-Analysis: v=2.4 cv=QfVrf8bv c=1 sm=1 tr=0 ts=69a56c39 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=UWqaS1yFD4rTGqj9qVkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: AleJybSFMJ-jjfH3qekDod8P_8KyCp3S
X-Proofpoint-GUID: AleJybSFMJ-jjfH3qekDod8P_8KyCp3S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020088

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add bindings documentation for TCSR Clock Controller for Eliza SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,sm8550-tcsr.yaml     |  2 ++
 include/dt-bindings/clock/qcom,eliza-tcsr.h             | 17 +++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 784fef830681..ae9aef0e54e8 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -15,6 +15,7 @@ description: |
   power domains on SM8550
 
   See also:
+  - include/dt-bindings/clock/qcom,eliza-tcsr.h
   - include/dt-bindings/clock/qcom,glymur-tcsr.h
   - include/dt-bindings/clock/qcom,sm8550-tcsr.h
   - include/dt-bindings/clock/qcom,sm8650-tcsr.h
@@ -24,6 +25,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,eliza-tcsr
           - qcom,glymur-tcsr
           - qcom,kaanapali-tcsr
           - qcom,milos-tcsr
diff --git a/include/dt-bindings/clock/qcom,eliza-tcsr.h b/include/dt-bindings/clock/qcom,eliza-tcsr.h
new file mode 100644
index 000000000000..aeb5e2b1a47b
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-tcsr.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_TCSR_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_TCSR_CC_ELIZA_H
+
+/* TCSR_CC clocks */
+#define TCSR_HDMI_CLKREF_EN				0
+#define TCSR_PCIE_0_CLKREF_EN				1
+#define TCSR_PCIE_1_CLKREF_EN				2
+#define TCSR_UFS_CLKREF_EN				3
+#define TCSR_USB2_CLKREF_EN				4
+#define TCSR_USB3_CLKREF_EN				5
+
+#endif

-- 
2.48.1

