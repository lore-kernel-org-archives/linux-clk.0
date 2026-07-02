Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4969534F270
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 18:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017204; cv=none; b=jQysgxt/7RXIvukD++fBZOxS3hwZY+PyDjY+a/AAkY60CqXm0p8YbLS8cAbFsXdh1ZADgfLNjOUPqkFnT3QZY6rsKxi475n3XRk2FO/Y/RUj0SrOTq6smIeTRLHDDLxxmo549IuccNyWHEfM6BU6LCzT1x3aSC7LnnHANYYbl2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017204; c=relaxed/simple;
	bh=19mmEckBUJGeN9DN5ffYBqQt6ULi+z66mXHOJ2yQjMU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V6a5PsNHB2ssYaL6SXbPqOQXpdFwrOP/KAaZB6W/xCts3Es2F7krySp/rsC8kZD/v3HAxm6vVvTioC3Cf4iXOopb76r2Tx2ry1/LSpLcof9m+i50jJre5Xah1cNUlBbcZDpVwHgTi8n/g2qbZKKCcrSJi2zHN4JxsxtLQ+zkj50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=evGfyPBv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AAIwErJA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="evGfyPBv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AAIwErJA"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E39TJ661104
	for <linux-clk@vger.kernel.org>; Thu, 2 Jul 2026 18:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J5D6hk80ySWEIZRtu89Dl4syOBTuObuXvvf5lY5zwZ4=; b=evGfyPBvZJxQtmcG
	/T3aXRHKhAuN4xE3yJgxPLAic6M72JazO0smK1EgO9klTPwTSJq5XhWhKYgeRKJv
	FMUNEsdO474K6dyxnR8GTuvni3dIYjGMfslJSda2vsuYQcwN8PY7O8sYyyFEPySP
	eMwTmt4QyCOJFlRRsIWMAJ7uLHKpM00Ia17970raXiNC2DIrOuLUu9ofPcZFu4ej
	To6fb2GEnGt1Pz4yqYCFaZ0J6ZR+pBKDZmhHSJsY7JVAl5z/NtEJVZFIFnjIOZbu
	+qok9DHXZDJDQg9AOLMVhobzgnKIOBt4YcAMiLJ6EBs1FaA/cNabBEtva4zHRFLS
	FYXecA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qfc1tsx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 18:33:22 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c894391f000so4248137a12.1
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 11:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017202; x=1783622002; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J5D6hk80ySWEIZRtu89Dl4syOBTuObuXvvf5lY5zwZ4=;
        b=AAIwErJAJ7l+u+65ESr+oDLjy781Ak6qEcbFxX4uDITGfUsgRd2qQXLc/xTwp4OJr6
         /uHU2p6u314ErThxJmBoMnxbnwt2iwSostg8u+OfHNdgPQHepdtVWq1ZxD/CmhiDh1TE
         TvQA2X7yAvqP6al6WjFsRRG8RtvrX2+dLf1vqvdd5RVts/6frCqwrFOUdwRz3QlGjSzK
         W7MX1akZpyEa7we/+2SIup0AVz9QOd5d1whXl/gdKaD4OFg91fAxY2EGoGkfzCxHHTfF
         hQm8HBRsoRBnXEm6EeAILVSxCzqbvTT09PJ3g+vwLrqUrDu5NAVJBVEf1y4lVBYVDT7B
         YpHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017202; x=1783622002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J5D6hk80ySWEIZRtu89Dl4syOBTuObuXvvf5lY5zwZ4=;
        b=NaHG1YSxknqH8Anq+yZqWoaH6ge7D4BBzl36wfkurRLu3FkGJCM5jxjHf5biNSCool
         /22vMnTGTKr2MYMtKW4qlvFCKhxH7OAzqVL+dT1CKcIK97gTTZ46nvNMCd0Jes1XwWsQ
         uvyBjzqcDjhxvw8BkXfh95Z9A4BTP3vloHzTRmaD7tIRi9xjzA6mIb1EA5HIMP2MtSeq
         f6QlFD4y5xwT4gOFcVHJwifzJ4lX1zFjOgaxSgyDuFFIo7TXqpw+ucA8Mg1xlHcTgwVK
         9XQE5RAOdo300MaTUsxaS8LXB2PPj3THtzU3wvADx+QKIKkD8nZIWu7u57G8JwIYQf3J
         sHXA==
X-Forwarded-Encrypted: i=1; AFNElJ9j/OQIE4Ybc7zbq4O2MkrC1iuGyIbpmppzafCrablylEh/nCYHTITyP2NKQqCwdarLS6OqUtVN9rk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yznbr7m5wOYAZjDeuyHNfJKgX79GgTu2Fl565oWSfjCnwkp6eE8
	V3V70qCsrsvJp1gD7BCLiPRXKTpyNcd67lKJx0eqyhZ0MrYWubB1FABAeHzfCnlYLAXizheVbBZ
	ePRwabcp1T+/yxjvFsbgOF09E/AJ4MInWpmM7pyZEmAc+vQ/ljr+0cX35BUQ6l54=
X-Gm-Gg: AfdE7cmI561UqZ9WlzUbiOP5pDd/giaFiW6KAK3puLpkSvOSxEYrZQDNqhGvvgClCyk
	ZO8bGQBOMPk3gTLObLPtHm1YwX5UHhpsyWCMiMh3iwhTbkCjX8owAtsqWKOC+wMNxi/mkGTXZD2
	FKU8sRxAEiZZ0AHfSVLwpkspFJ9MdKxMmVWiVN7yO/3qro6cGSzOJinP+erIiEUvhayPe5uDleV
	Hyvl8ZK2TXgiXzxEGaEI8MZZdg2+p7CWAPg+H8lusCOcIE8T0TCNpH06rfUU3AWw3vQIckxGIHZ
	NvW9ZHmEFVukcKu+tqQmE1v7rKghGuNU3gWMj6rpmslWwb2mbV6g+K98SLuf9E+ytUcSL4b9VV8
	WOXn/j7qL+hRvIFHkI21LN0yRwwqTjisFjPI0OrINtw==
X-Received: by 2002:a05:6a20:b786:b0:3bf:d0c8:2a8b with SMTP id adf61e73a8af0-3bff40c71ffmr7618660637.20.1783017201987;
        Thu, 02 Jul 2026 11:33:21 -0700 (PDT)
X-Received: by 2002:a05:6a20:b786:b0:3bf:d0c8:2a8b with SMTP id adf61e73a8af0-3bff40c71ffmr7618581637.20.1783017200953;
        Thu, 02 Jul 2026 11:33:20 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:33:20 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:27 +0530
Subject: [PATCH v5 05/19] dt-bindings: clock: qcom: Add Qualcomm Shikra GPU
 clock controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-5-cc13826d4d5a@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: z1j9uPNUMk4OjGivBg9HYqQvgwD2rend
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX7ytAdKrT4kQs
 1Vxwfllzxhe6+H25whg/SovuYvWYi2dcj1q0rCSqI+aS0/oBTTDp0DhATVUdRAwXHEbERssn/zD
 /XFhFE05Mxu7LnJWZA7iuI0XJhioYXyXzB1yBHcYFNcojDli276jc6N8J7k6SsAwvsntjHkCuZt
 qt9/S7vBgindCPBabF5bL7fpwFKiddARL/LsOFp+yIRvwGwHNrZG9SWLVRhFMhblWVRnEwqGY/T
 Qe1BcWtnwefygQdZkbuZJ2v68S4HjyueOf/ODqchEVZ7/GmNYqHagSN4mjeHEhaOpX8D61Gbnog
 vd4xcaPXiXQBZBiJ83BvfX09+wNw/DhMM1TaKxYy+5NwgG5aUqKEu01s2LROKdOt9npDtu0kNxs
 Vg44QlTFI169j1iIWp3DSaJjnO7U/zYSpoLoZPyV32s0p7qwVUPTJq1aAsGjFVWmWM2+7v2Mry6
 ZKJ4ilaIqcNjnWAzFlQ==
X-Authority-Analysis: v=2.4 cv=dvXrzVg4 c=1 sm=1 tr=0 ts=6a46aef2 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=QCmBRgXzxa-qq5PbeBQA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: z1j9uPNUMk4OjGivBg9HYqQvgwD2rend
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX9jhDc6ogncYt
 d71U13KS38yVXym5HWf5TLicpOFQw71yo+OOssBFr916W3F0Fk1C9B4BVSncvi2CiNlKZlBkSKJ
 /4KiF7X24sdCHNkCG1rPgzTm6ag+Fu4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020195

The Qualcomm Shikra GPU clock controller is similar to QCM2290 GPUCC
hardware block, with same set of clocks and minor other differences.
Hence reuse the QCM2290 header file for Shikra and document the
Qualcomm Shikra GPUCC compatible.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
index bedbdabef67286afb6ce0a1ac53d1a9a15a01a92..ad2386190346cc10f53763e7c3b9fcb35fca8ed5 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
@@ -18,7 +18,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,qcm2290-gpucc
+    enum:
+      - qcom,qcm2290-gpucc
+      - qcom,shikra-gpucc
 
   reg:
     maxItems: 1

-- 
2.34.1

