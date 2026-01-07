Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414652676F4
	for <linux-clk@vger.kernel.org>; Wed,  7 Jan 2026 05:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767764117; cv=none; b=kaYN0WHokthxsAc8wqKSVbU7Tfx55irYHBJvWA50rvQNHdza4jgrCczb1cPna8nAokElZ9Z9E9zVJOVW6496bINPh0uQrei4KiGQ5ygKJNy1CByJFSDuQa8YV3Gk5+vrT8+m8rqjncJxr4z5XthGxlo67DMRXwImETbqPUe/VPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767764117; c=relaxed/simple;
	bh=d5CKrxn5IxYD4RSv8tB4qdRIzqCt9kOKFhSG2rU9068=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f5B/xoLxk30RJ7VwDakekVBVFOCis4BTV62zra1lp7xpsjiscIIRHT3mSWv6CLUPej7vQcvY7itnAD0faUPTuzW36B5psrUfd3ST4wYKIG9rLRzDml/ADMWhYPQfhhmEJv8KztV+avj+VGaMXMpXPgw4pwb9KOKBwSe5KgLWbU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dxq4WgSc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lig6USya; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dxq4WgSc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lig6USya"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606Kjw7A4048690
	for <linux-clk@vger.kernel.org>; Wed, 7 Jan 2026 05:35:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IzgPXGnOGNwbVFsGIJAcSSeNLNj4i9epjPxiZPnwAJw=; b=dxq4WgSclfU12Y1e
	GoUip3IbCS9rqdYVzo51Jo1jND9kf58nMvjqSejHdJe7t7R9QR7aAaUsw8ZJ3tKn
	0Yl90IDlDMS+tkj81puMr9aQnCbGNsYeEsKZwA9bA5M4tlpYwQe+CEFYqF6AxMX2
	eMksmggZqhdl7DSZXZY/pJRsHnZonoN+Ca4mP+ulJW/+eMIUdxwSMpbDT0LRibKZ
	B2JrfL4P7RkPgshLrHGOabrLqp2evwNYeBd6cTT686VD7axvorT/e+mxjFuz8S97
	vLYcaL3tS6O1SHzMzy/XIuFqC1U5dT8c9jHsgBkYMj2TY8Ctb4UJYB1PWLvcnHMj
	v8sXMw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh25rtth8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 05:35:15 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ae56205588so1335815eec.1
        for <linux-clk@vger.kernel.org>; Tue, 06 Jan 2026 21:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767764115; x=1768368915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IzgPXGnOGNwbVFsGIJAcSSeNLNj4i9epjPxiZPnwAJw=;
        b=Lig6USyaVhKIQrNx+klmkIKSXmwIVCVrGXIvVamztHgxSaNNBYLLvf0pyyrp3zhFsO
         gdJqvccwrNA3ARlIgCaifEPSyAUNJkdoef/lNJBSqTbIsKFdpjB9mpPhK/1j/7JtZHCE
         NOBz3Ri4sVz6pK6FTMyQDpwvsp+PyvyWiNc8m7jV2HzJ+gAY8oLqxMDV87FnuEBwwqoX
         Z/G5DOuKizZtgj3CGWSJGU609CdYb7/XqpaVlMB/6qKovp+PnZFJ1RFtqaqYDZIrJ3er
         c1pPN9GD7TmAD6sOI4MZskJS6KN6eVJ2D8vPMs9HOlBDlwlg175cJy82Sdf2KjQOGZe4
         fWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767764115; x=1768368915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IzgPXGnOGNwbVFsGIJAcSSeNLNj4i9epjPxiZPnwAJw=;
        b=FLMzoghFBiwVEA85J9CMXRK/4UfsPW46izvnZe/xP3pXxzZIEjsRnLvugEhomRpNLh
         T05hPYXPGYeOwo88q3FCvhOr2OdqxuGWXvyQbZK1hcSYEfqalXSC7tie7rh2mmYrKc8t
         bSJBQhGBqUu8kv9nQKBKp0Z4smLY/EpLMMADQdalf47YKvCbhcl+ENbmPkXieCtaqoX+
         7eG7nDWn52mdmcY/104L7HFkUsFpES4zVccl/igKIF7eYujsuWu/2ZbwuW7jWa6qX/tt
         nfnWBDxFIEX81BItuFxSl5pUp/g3tuyvtDTnWukYjqIFNxTjLd1cjkm7tUms7YmnW2RT
         DwbA==
X-Forwarded-Encrypted: i=1; AJvYcCVEYvuU4/qx49Awu9XmNP9kiBrlxVywQjmHrluFux8Lr/PYLAU6LbO9OYoALXIQt+pLk9lzdmE6UR4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNTvoazgJ8kUSxsEZ01sHWUNJPMHXQvPagwELdgfmkMMfBvISk
	yCbAZHeEczrLFW713xZsNO6cXnqTSKfCnAdWcaOHrlnFCvkZ8A3uRKPWic1vyAfDCZkxqqKs8YI
	HKVzGyCDdXvA6JGRPAM5cqgL0hx0KcnSzu7zHiVk6TcSQVEoPH6HqdLCFiPgEFdQ=
X-Gm-Gg: AY/fxX7UEp3b5fs3QwTxdhsQBFXt18TWMBRZXm+djgi9sFDwamAOMCo7CCghNt3A4Ol
	oTmcNna8K+iK1vUQNk/n+e3bkACflSLDYDHd34S4YUwOIwtS91yTk9IaC+shfpoeZ2BuKEZTmoW
	h8kOoy5tSVaNaxEOGfJsWNW3N2Fs3S3aSW6IYeIhcVPC+fur12RZ/Y1oXzcjKzHGicNsmY0VWmY
	5gqHkfOEK7NvIGkdtexjLH10ETQyYVl21O3utK0xcooLl0ZpN9IE/xZaYnVaoyW3BkFoaTboQiT
	vmHgeGUc0gXwBbLVjYbPwvhepwOr/sHcOZ6u5Iy0sT46iHtPP9Anhdcb2/uyfEk8YLVErhDC9uS
	xXLyxASd+N+hbEjM8FkxYEGSnBpFHJLe+VGNBYb0Nwjc7fpQSK/8p
X-Received: by 2002:a05:7300:d709:b0:2b0:4fe2:6a2e with SMTP id 5a478bee46e88-2b17d238bbfmr1140804eec.9.1767764114853;
        Tue, 06 Jan 2026 21:35:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLO3+EQQIJQJxnwyP3r57180yzS37i+MezNwqawryfST1RMLxt2iIy9G27t2QK6bM/94PVZw==
X-Received: by 2002:a05:7300:d709:b0:2b0:4fe2:6a2e with SMTP id 5a478bee46e88-2b17d238bbfmr1140791eec.9.1767764114314;
        Tue, 06 Jan 2026 21:35:14 -0800 (PST)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170675076sm6120311eec.2.2026.01.06.21.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 21:35:13 -0800 (PST)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 21:35:11 -0800
Subject: [PATCH v2 2/5] dt-bindings: clock: qcom: Add CMN PLL support for
 IPQ5332 SoC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-qcom_ipq5332_cmnpll-v2-2-f9f7e4efbd79@oss.qualcomm.com>
References: <20260106-qcom_ipq5332_cmnpll-v2-0-f9f7e4efbd79@oss.qualcomm.com>
In-Reply-To: <20260106-qcom_ipq5332_cmnpll-v2-0-f9f7e4efbd79@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Luo Jie <quic_luoj@quicinc.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767764111; l=1937;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=d5CKrxn5IxYD4RSv8tB4qdRIzqCt9kOKFhSG2rU9068=;
 b=pnGDtV4GL6odErG6ovfr1Gm5EiLzWAoCDtqrBNE7NwfSW9KmnFjxqUsMtxzJ+mYKkmTdeolgW
 aDSx1ch9XfmDqvqO5enISDqS1bdXWt91oL+rLGeiECv0htMme4dy8ii
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-GUID: QsvoGW6l0m1AaO9n_7h23hKa9G8VP1_D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA0MiBTYWx0ZWRfX+TkgV0EPNIq9
 6lvIBjHs625Uw3vOQ/BvW43MpB8VdRgFh3oa6L7fZID1kYpTogDvRhrG54Renxibgad1TwYYqa/
 RX1HEagVG0oNSscwiVYJKVKlKo1eVZIFwzKTFRociwzPeRLRhKeLv9ePTa97Kz8wykbucDwLFDn
 Ge7fDMEqNGDSgMxFpBHZeqVm2wmrvAKL0nqqotWKJyQMzLdLsKkn+8ZiXScWd1kLLQt7hz9zteY
 Owx3RvSqvCMgNcVxlmw8D+cnV+15ZdFXahqrMFBrhvjtoxXoRij07H1frYCxrUR1Sc9WyaJaWG/
 FzAkKoYA4LdWoumOycuMOZ6hFNiQE24IMWr1k5i/uKB8jrURVjs51Wopp3nsI7UGAlY/PTFLKRh
 +0CMqYJzphSEwAgQA82bITpw3aaDrpRKx+/K46ochr4jW8mUI2iLdpLkmCaSBv41zwGwi/fWXV2
 gnnci8v2ed54rtOJSUA==
X-Proofpoint-ORIG-GUID: QsvoGW6l0m1AaO9n_7h23hKa9G8VP1_D
X-Authority-Analysis: v=2.4 cv=G48R0tk5 c=1 sm=1 tr=0 ts=695df093 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=hkflQMVECjqu9LUcpI8A:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070042

Add device tree bindings for the CMN PLL block in IPQ5332 SoC, which shares
similarities with IPQ9574 but has different output clock frequencies.

Add a new header file to export CMN PLL output clock specifiers for IPQ5332
SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml          |  1 +
 include/dt-bindings/clock/qcom,ipq5332-cmn-pll.h      | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
index 817d51135fbf..5bf29fcd8501 100644
--- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
@@ -25,6 +25,7 @@ properties:
   compatible:
     enum:
       - qcom,ipq5018-cmn-pll
+      - qcom,ipq5332-cmn-pll
       - qcom,ipq5424-cmn-pll
       - qcom,ipq9574-cmn-pll
 
diff --git a/include/dt-bindings/clock/qcom,ipq5332-cmn-pll.h b/include/dt-bindings/clock/qcom,ipq5332-cmn-pll.h
new file mode 100644
index 000000000000..172330e43669
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,ipq5332-cmn-pll.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_IPQ5332_CMN_PLL_H
+#define _DT_BINDINGS_CLK_QCOM_IPQ5332_CMN_PLL_H
+
+/* CMN PLL core clock. */
+#define IPQ5332_CMN_PLL_CLK			0
+
+/* The output clocks from CMN PLL of IPQ5332. */
+#define IPQ5332_XO_24MHZ_CLK			1
+#define IPQ5332_SLEEP_32KHZ_CLK			2
+#define IPQ5332_PCS_31P25MHZ_CLK		3
+#define IPQ5332_NSS_300MHZ_CLK			4
+#define IPQ5332_PPE_200MHZ_CLK			5
+#define IPQ5332_ETH_50MHZ_CLK			6
+#endif

-- 
2.43.0

