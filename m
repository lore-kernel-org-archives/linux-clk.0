Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA493D903F
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 14:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773240434; cv=none; b=Jhi7wqJa3s68d8m/xHPfuLLPMip8mA65nQ+/BOfgD3dF8ngy1OpPXKGUyKKw5gTrb0ydoyZB73BsPZRJ5BL3DuTbhQAFFzagYtQVL5k+FbLNSruuNnCeqyMNbjUlyk3d5OTKcOy17SW+SGYKe5iYO9ZySQcKq0BL8jy0wqHY/S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773240434; c=relaxed/simple;
	bh=+X74KMWb2lVjQ9fnowKj6jei9ytZdwOYWqFCEBJ/bZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cPKNKHVVrN7TJaRSUgiLDBazWi1JP0DCwsyP8I6Hu0htjpFbNqHhDjswTdAQdwxk20k0TIAsj4rWOMIvhqqGePGuKxBhMcP0RD5toh9ErAmlTDAFsr9Mz78VsU+PUa5BWBauJtJKttoE0Bc5lmmuyYUkSzuwrw+9Glb+/3sKc+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QI+eMrTA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FVbRssCb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QI+eMrTA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FVbRssCb"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B9MqTC2179919
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 14:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fB98BuCBiJhrIm8NgYodeQbl3q2SBFUZLmymOwOVjDs=; b=QI+eMrTAvfbhHkqr
	fUpe+TK2odcohdgTUtU0U5qYnp1Ysit8uXMC4KVoD4vUHy1oRKjBLDe33TWHeFH+
	ksZxcK7VLutobrcVq/TvbVWryYfqm26/n4tpvRq7srBN74YOuaz46TcB9Zkhgbqx
	atuyIJm7X2RGjGc5fffhOu7NfvtBoml4U8fPL/fZIXjGzN+dvGcr3GR5IxxREHIr
	zU8/tD9C+LHmg1EJfwb8o7xsqAnIuH0Ve2cGVr8XMbK8JfW2PgF1Z7kWVkiRx7fH
	4qgCAP15UA4ZOTJ6gpY0UiNdKQ37xqKkoM8yOgevKGZjwvG8H5QmCKxlzsmK0hwM
	n+seyg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqvsv09c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 14:47:12 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a08e6cd15so646140866d6.1
        for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 07:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773240432; x=1773845232; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fB98BuCBiJhrIm8NgYodeQbl3q2SBFUZLmymOwOVjDs=;
        b=FVbRssCbSyGpV4FzgyxcWnGPLeTmk/y4KFYu/L8YmhWPW3pD4ZtzZt/sKxD3KNzihw
         PFjrju6E00USlhMBYw3B7mH3Eiq3p39JQwcmnUGq08GtZx2TAaZudpciQpyblhIU1Rz5
         HvZhyPalPUpFtOEZ6mpzKZKoONKIhbKBv5vi9HOOuLqzahyhuhF06nXSKobFSxyN2ygh
         9RVm4n+tsZ7IqBamRbMJAz7UMzeqMia9SZD2Y2ykSIgvnel0R4SV+933aQ1cYA5QPZCK
         VwQci7TKIHQFnjwmzCEwc3GK83hMV3GgeOJr46RGPEALeUO8d/67sLbC4gFCM/2WaF6C
         vVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773240432; x=1773845232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fB98BuCBiJhrIm8NgYodeQbl3q2SBFUZLmymOwOVjDs=;
        b=rkYknTcNcacE4tyQs0lTh10WYE2KR2Lr2HEKdehAHuA0hrLtgBmNVykxUNwLGJyHTL
         iZ+MqK5kQxPNz88X4e5p0UI7NbmzDgYwF0p6zRmTX6MluwRj2wXPNPOMQb23VWDFwQP6
         qYW0SDtA2aJ9swofx7oTPUd6iKADnyxgEVLeEyctIJDhafQYBET2emLpP957/YC76f2Q
         N53MK+NCc/pvzFK6Y/8kDobwUr4iVe3ytzlJ/Eyvk0dcol8AYa7jIZ8dP/miu4k0yKLV
         yIVnFtjlCXI4d/0D4uCJXa2dlAWxkBXOCxUrcA8T9dRQpRUY5VOa1lChcRLjnbfMmnNJ
         J7tg==
X-Forwarded-Encrypted: i=1; AJvYcCXGmWJE8E9dOLQy/gQNSeJx93+10YJmKedqH5/XgOhkjVF13+uA9R4SY4s+SoDdwin5B8lodiiHNZY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTlk7+tmzdEFRDqZ2ib/rsdMvurYVEMTxqW7U8Cmpwc0QwE2Ke
	foiz6i77uljASgUtl7HpvHmEf3Yui5jtnamndUYvd086dfEAPaYk2ujwSmXreSvZT3OACSxLA6O
	3Gu5hAPbwMGbnVSHBrS+Zr/ybo921TNZCSmcGiRzUVT/YcvewJJGAc+sttsAIjDE=
X-Gm-Gg: ATEYQzyMVv73UfdE2JG7DS5skAORodEWZ1jqAuae7SO0kzWiOC71RYd6XITA2pP732H
	WzYyAeUrLM1+33qgPkEeVJtAW7nD+C7d6e1n/P/sWmjhy39RunW9YogPJt7VYo159XJQwGNKKoG
	LkshlFtkpuKztGB/h3SiTTu5CDemoSvXP3IwlIQQtdZ2e3uJe4MSvEc68uW4iUCQN8BLD9eOH5i
	SFwfjk2yFuR/L0CMOV02loq8HPVrHSqtBxqyuCB8A3Mc6pTSD9JIgUjYGzeRK+oZ8YlfimY20Yx
	8HmTVku6Cm2Fb8q9rx2CExs52iGz+K+VBHg/cj2S+K5QIci6fGvYQkqLtXfEGdUgTA+TUPtsweA
	xl6UDZVFJOAzd38BDjWnqKYnar9qL2w==
X-Received: by 2002:a05:620a:25d0:b0:8c8:1f1f:e382 with SMTP id af79cd13be357-8cda1af546dmr327565085a.78.1773240431706;
        Wed, 11 Mar 2026 07:47:11 -0700 (PDT)
X-Received: by 2002:a05:620a:25d0:b0:8c8:1f1f:e382 with SMTP id af79cd13be357-8cda1af546dmr327559685a.78.1773240431048;
        Wed, 11 Mar 2026 07:47:11 -0700 (PDT)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f818d61esm7992501f8f.8.2026.03.11.07.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 07:47:08 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 16:46:32 +0200
Subject: [PATCH RESEND v6 2/6] dt-bindings: clock: qcom: Document the Eliza
 TCSR Clock Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-eliza-clocks-v6-2-453c4cf657a2@oss.qualcomm.com>
References: <20260311-eliza-clocks-v6-0-453c4cf657a2@oss.qualcomm.com>
In-Reply-To: <20260311-eliza-clocks-v6-0-453c4cf657a2@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpsYBX2HxL6wz9dc1Dqat83VCkVsBIM0RR1XCtK
 ydTwYKpDy2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCabGAVwAKCRAbX0TJAJUV
 VkdsEACUwgaJSsTIgMYgnosbVXGWI37EdeMEidmGnR0BnhX48GcxDHS3UTf20p4V90gB7miiqWt
 x8j1dmVXvmSlzmHty945C+e8rI2T+pxSu6X/q6U8zItoq5NW/AITPRYyB7oXwtYyileKU7uKrPy
 OPv1BuJlCu7vmhr0JDXCbqnnBlr5v5mqGjKnulZoWLKyeK78xb0ywzfREm7b6fX4xVK7DGGv5NQ
 YWDKKmSUCCoCDVIURxzgzMlXoajN4woEibefCMqp1tvk1di/3A3di9NFlz1h2OCSJO9yGWLqtvC
 damj15B8GHqew9EnzBGiooq5eoXCi9kifJYGSMJAHJwTKNicYbYinVyEBfZQZmnL3SuMEpd/I43
 XZcVU/YlLfBjm+/GSMsHySqfhZJq/UNL2+EW0v+zbpGFkeaKCLNQorkZpFGqnBt9BLD7MVjxHDE
 ByJ0yYixAuc9F2uV3TvRkqLICpycJR91zSCHfAbVKpL1LRdvJYB97PQ8kuqjvpc8mJGl1xPMZkv
 FnlSpAR5T7GJwllHBl7RAj6/GCMYLC49FPDkB1P4DyXEwYGDCFbCka8NuBt5S87YGOx+gWJrChs
 4L9aB4Fp9Kof6TmGMTvGteF3+haDoBcT9qSkZNXaq96vpXW/Tnn9b9Aa7zJ3+0/ULG5kblHRLgw
 9PsdsRjU2GSpMLQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEyNCBTYWx0ZWRfX+0EoyvrmZwiY
 bxK3lwvjsbWmo9IDKkp+S6bgcRMkMe5mlmgplU6SIrxv4NMx7J87Qy3/FkJZBZjcABRw0Jj/8Vw
 hFe2NrhLHrFMokqbQeIY98pflcWupV4x5rsHPAW+d3GqqNeGQKforvpWeidB1zZCSed5UWpSRM6
 kM5xeX9ddrNUdbibW5lz9eIsJG4nU7b9mOEVXExExudHbMSc9jhM6GReUkbfJsvC8NIWtdv31JB
 iYjzS8G7onI6NIhtKVUFN9TZDBULkkRVAqwuOsv9Zvd5UUG4Ihy8g+/zC/RJoeieUxQ55oimgLg
 eoSieOTGlJH1mEUskpuHBPscFaJ2Uah1vTsFelUjzkvsaZdjq7yxrYODKeUNOTS/mWU/WPL17Vh
 MQrrfq+mYtzDFn79/zonprKZKGJSMhWj5XicvziAmgIASMyKa6NIYxvjj5mNHe6dw7KAAb2Hn+8
 r4SIUyc9YRMncDXmzSw==
X-Proofpoint-ORIG-GUID: 5ldfWww4VgzHAmOWpdp7Nc4xN006Mua8
X-Authority-Analysis: v=2.4 cv=Lo2fC3dc c=1 sm=1 tr=0 ts=69b18070 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=UWqaS1yFD4rTGqj9qVkA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 5ldfWww4VgzHAmOWpdp7Nc4xN006Mua8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110124

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

