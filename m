Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A08449B05
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 17:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785434103; cv=none; b=GCh6ZXP+0eki4YLrEsyzFCwl1To7fFg2ftZMj81rDCT57LWiK+QP5kuW64ngckJusZiYAVInLR5vBFQPAbNZZyaIwPtryLMUh/8n+kKlDJFZ+PqxvWNOZTkc/HSrG/GiHdFjkY3hDk5vF9EA2LO3vR/LpD+LvYyNctnnjO4UZXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785434103; c=relaxed/simple;
	bh=ddVTMkhYQhjB6ZCGQhNmC7udHsSIhRwzbp49Q5QEPpg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=coVVMFlfPCmYKLqzo12c77Jbgefmj6sCBJydXkw59+z9+KK2gjU1EiDToBTjdZbHh8CQee8SSDeV2bYa4HUVN2xkEcH6soV4Gs6lWtH3WqkEvnZN6otJo7vrFTcKDaCs8wwZaGeQnAVh+C7ABe6m570TeVVOuO8XAjbCzJRi22o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fzQitUjI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eIIaHTIz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fzQitUjI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eIIaHTIz"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UGWk3w2556117
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 17:55:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qU6D/rKZGQxFhAFuDv0NYmixXft59wlSQR6DyVjgq7E=; b=fzQitUjI6RZ0kfzw
	NEbgh4pvFROOGeKz1EC2Fw/z2cItTuMjrBj26exBRhZVASHJS0zUhNgGgHphIryZ
	GVBIan2hjLJt0lo2NKEAWvGazWePczUvgQuToSCzrROCt8Fkmb6RJPPxzcAjP8RF
	axuWRV3jwW6h4hQL3D7PbQBkfVDdhXgPX6wW3CP1S84VYIgGtmP6auB8oEELiqN1
	8QB/eSJAhnEKs3emZbkshvB1zVABrlcOPorD8RWin0+Cig1Iyo1K4DE840ejxYFO
	C11msAySxIxLe8JwARFcixdUsO5qM1sb2OcTS7ckjXQbxUZaMnJsQbkDTiacM9v1
	ZifIaw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8169979-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 17:55:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso127605a91.1
        for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 10:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785434101; x=1786038901; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qU6D/rKZGQxFhAFuDv0NYmixXft59wlSQR6DyVjgq7E=;
        b=eIIaHTIzudf1QxK0K2c9Gk/7qJ6bobEE1HJ/wpT9cqgIyDnJS0/rDjC21w/jKwgfau
         HPKE8eGrt0S81DPH9898xxI9Pghpwq3geQj57mIkGjMimbTrVm7S+YGvPf3aEaTswN59
         kWQe4cNhFrWaOp+EtakIfiGJmuy859UojBhmFXS5D/AUsWr9Yy0TMeV1KgtfaqMu9v0J
         kvgyPv+jL3y18xPDQ1/+GwSeMcLl9UmjOtEQzNg8BJFSbiIM2RJFZNUgKKUUXfOzYr4h
         GQxuVHKdJ1GZ0eUulxPF06LuaTLoiKKEW/TkVSQ6kW1P+9Ya5sHkN6QeswlfK6CBO+1f
         7L8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785434101; x=1786038901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qU6D/rKZGQxFhAFuDv0NYmixXft59wlSQR6DyVjgq7E=;
        b=EzfIHA4hZepAHxfa7bpOOZe21X+scWd9SBEzrl68TEaIAn+YbLm4+AxCRlBRcvqWF2
         6UeiSrT/PI/9OkMpFvCBG8qHCKjuGOZLVFkPSt7g+zcID3xDHxgvGtuAVaRGR4DWKR7Y
         79GQDF2C1ArhMpcSa0hjaUw/TKAm6v59z+Awdl8gFVTIHAxA2NxoRYYBXaErqlcuO9S/
         ca32FtOo9hyrTwegegqWrdzl/JG/fMbxwDjXuBmblZDOXLhaBh1MOFPLO5qB0kubfsnj
         XEExWHb0iXPi2znTs+bFo3V7cRtvpQCzeDNmdrBhNcVMRpnr9BTgfvOpNvHoi4l7+A7f
         2yoQ==
X-Forwarded-Encrypted: i=1; AHgh+RpvwUMY56FcPB7Yww93uqZyu/zHh0BFNlWLN/CbWJP8PQ5uL4pStFHhGKzQ3lhO5W9uQKuYowAq6Rc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE+1uv9D6QHXDpCqAdmYzfEq9VJsVXE1HqPpEpCydk3TNpuJuX
	EbNsaW9uhn0I3EumGtMKvYTyUHR+lobu1/sA4aF7biJnZiZAXCZimgjyJZqSHLVxReu/zn4FiL7
	tjmGps1nG1ImYGKjGW4vVR8fUxuthDZgPxSWYYLgvnGiaGnTrDKL4kaPAiAZCEnM=
X-Gm-Gg: AR+sD125q5yWMWpggtR1Zl0CVaYSyXG5GjaiyMNz/D6woCr0L7czZLrmOqU2KbrJqim
	GtkQdbNRPzbJJv+23TbZZulHgfRGz7SF3pcUe3BiC6/2CId+grwlVAkHW7ca+5Am27G4rRcct1H
	IIXNhhFyrbj3zkTZPdqCo5eRi0AdqU28JlzyiqjutSYXkIBGXEG9SkmIsrmHlFiolHHXWoLEk1J
	XQO5b6msxlhbVM9onfxZh2Xkpc00ytyo6fePozr5o76k1rEc+x2wdeZI9vqF7xdSu5OuHLo9eMo
	ck5hKkRxm+1WXymlbHckvPhSRtcKacHPtXzyfz2Dpjkg26oZLwg4iXWcm5ipbVwsQNZzVB7HymJ
	d3rz4bkNe6H4c8KcGVJG3kOY/
X-Received: by 2002:a17:90a:e705:b0:387:e0bb:5803 with SMTP id 98e67ed59e1d1-38f9c126d30mr2935531a91.42.1785434100706;
        Thu, 30 Jul 2026 10:55:00 -0700 (PDT)
X-Received: by 2002:a17:90a:e705:b0:387:e0bb:5803 with SMTP id 98e67ed59e1d1-38f9c126d30mr2935511a91.42.1785434100228;
        Thu, 30 Jul 2026 10:55:00 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72643a12sm36444098c88.5.2026.07.30.10.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:54:59 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 23:24:36 +0530
Subject: [PATCH v4 3/5] dt-bindings: clock: qcom: Add Maili global clock
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-maili_initial_clock-v4-3-ed52ade264f0@oss.qualcomm.com>
References: <20260730-maili_initial_clock-v4-0-ed52ade264f0@oss.qualcomm.com>
In-Reply-To: <20260730-maili_initial_clock-v4-0-ed52ade264f0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEzMyBTYWx0ZWRfX4VKb4uEIsuvl
 6QeJQ0OusdoU8wnDiIKh0p10jQXzfefqNuFUObB/gd3egnedXeWYoMg3uJP4uD9eAjMiaWIB9DM
 rXaAG2pp+himZ9SfzqHke15r6GgRxdE1DsgC/4LjCN/Op4p0eXmB+GQ6yceNNH0tmsvLIPlSUYs
 26HitOEPNfzlc/Z9ecp2agQpqdV7z/yOPCSNLRzNus3MmfODfqmq/3fxZkksUKp5JTIc/1JzFCv
 KeHXj3zLlJJk6/nTe6MNFGk4pYeKSwFDyW9sKaluyawQ5dvCqB6DG2AcwNtNXvUaDcQ84Sl+1dY
 bQx3I///ZnFWOh0/aUg1ZqVgM2pzUJdCnMGSpSYdL+SLRprRRZ5mgQrT9b6ImgvHJE3PzZ1tug4
 Fj7K6meltBDm4Qi3EYRQfiqWqEinG3u1ROVIGRypiSExN8Zo5bmNpHyU/z7P3kBSaYoRKQOouap
 r1HgoVVqfgJHWJrLxaQ==
X-Authority-Analysis: v=2.4 cv=LIlWhpW9 c=1 sm=1 tr=0 ts=6a6b8ff5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=4s9NPNi6RWkeKLmGOYIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: RLqY3xGW6damHKVCnaERzSFpW4sCZBh7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEzMyBTYWx0ZWRfX7fe019fbiFUo
 uOIVo6XLJkjwrqijTLXmNxCfEaZuWftKWIwFm2XAiS6SmvUELA19ispkP4PeHxqzxv1nMgP2TbU
 vWxRUNd3yTj3CqknQNejrfO6dkSVeUs=
X-Proofpoint-GUID: RLqY3xGW6damHKVCnaERzSFpW4sCZBh7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300133

Add device tree bindings for the global clock controller (GCC) on
the Qualcomm Maili SoC by extending the existing Qualcomm Hawi GCC
bindings, since the Maili GCC is identical to the Hawi GCC apart
from a few additional clocks.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,hawi-gcc.yaml    | 11 ++++++++---
 include/dt-bindings/clock/qcom,maili-gcc.h          | 21 +++++++++++++++++++++
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml
index 4f428c0f7286e83683a65cbe60b2cfeff67f5b8b..2101f4e4bb0d37f5cff42290f88c2f816038c402 100644
--- a/Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml
@@ -8,16 +8,21 @@ title: Qualcomm Global Clock & Reset Controller on Hawi
 
 maintainers:
   - Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
   Qualcomm global clock control module provides the clocks, resets and power
-  domains on Hawi.
+  domains on Hawi and Maili.
 
-  See also: include/dt-bindings/clock/qcom,hawi-gcc.h
+  See also:
+    include/dt-bindings/clock/qcom,hawi-gcc.h
+    include/dt-bindings/clock/qcom,maili-gcc.h
 
 properties:
   compatible:
-    const: qcom,hawi-gcc
+    enum:
+      - qcom,hawi-gcc
+      - qcom,maili-gcc
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,maili-gcc.h b/include/dt-bindings/clock/qcom,maili-gcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..9bea90adb988ed9050ec30550d8723ede01ff6d6
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,maili-gcc.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_MAILI_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_MAILI_H
+
+#include "qcom,hawi-gcc.h"
+
+/* Maili has below additional clocks on top of Hawi */
+#define GCC_QUPV3_WRAP5_CORE_2X_CLK				188
+#define GCC_QUPV3_WRAP5_CORE_CLK				189
+#define GCC_QUPV3_WRAP5_QSPI_REF_CLK				190
+#define GCC_QUPV3_WRAP5_QSPI_REF_CLK_SRC			191
+#define GCC_QUPV3_WRAP5_S0_CLK					192
+#define GCC_QUPV3_WRAP5_S0_CLK_SRC				193
+#define GCC_QUPV3_WRAP_5_M_AHB_CLK				194
+#define GCC_QUPV3_WRAP_5_S_AHB_CLK				195
+
+#endif

-- 
2.34.1

