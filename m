Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FA1238C2D
	for <linux-clk@vger.kernel.org>; Sat, 19 Jul 2025 09:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752916492; cv=none; b=H2EtvJ6apidLuD6GfK31JVKNg17p5/p+UBrWMMxNF9bbDvPwiG+d8iEthTXioeeWnvm1tA1hp55xcFIUTJHcEfQCZd+8aHRVI7/RMak+L+SgyOOq0okkpaBCIGNnVf4PixhDf/03iuJ30/PyI4r/k1GdP3cyJXJbHvUxOKR+ufc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752916492; c=relaxed/simple;
	bh=jwVRqM0theHy/Aua39lYnAS5tUnNexlBP199jrO9fzc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ri2mGZh5XRlUwk6aXM1ub4wh8m4LRmYuqB+6Hy6XiBC1KATz/xGS2V4UX8tg9gs8oiK52mPbekQ6aWNfY4YqYDEWiJyb/DE3+aXXUr0Hko5Ffl7x64fpm4PtW1fAmtdWBRC/TlX4KJ2++adiMkeiXXE18/H6AlFeffLr0HKyctY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ajGrBT/U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ajGrBT/U"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56J4ladk001516
	for <linux-clk@vger.kernel.org>; Sat, 19 Jul 2025 09:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5wZDc5GWMWk
	tbr2LV45DqbpFgPyVLPIoTjpMyPCwwzY=; b=ajGrBT/UWPZPh3lDzNJCKksjJ58
	ScqhDdABcfpZ1w+Pw/FlHyanswabIFUYVjxiW2c0uAWzDWRwhDruiy58CXBe0OHV
	tYpBE68t5FVXquVTi88ZGucL9ul5eejn66A2LNvUqvRRgMg06QXf59zjKFaLuEBT
	zR+jQbGo1syi62E+OhIjEf5iTcn20thjkNH1cVBk4+XztCEfN7mSH9aMtbRzVkpb
	riEdOQqJSPb1nrNToDEWSsDUyFU9eeosMMGBXXfa/H6gvhX3ar95EbIygdcA6e5l
	icOxtA7C1CHRR/J/cQFL3S0tWECv3zJR3n5MqA/1tL76U9qbiHl1LZydpVA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804n9rb2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 19 Jul 2025 09:14:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e33af599bcso472553385a.1
        for <linux-clk@vger.kernel.org>; Sat, 19 Jul 2025 02:14:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752916488; x=1753521288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5wZDc5GWMWktbr2LV45DqbpFgPyVLPIoTjpMyPCwwzY=;
        b=U4I0CdGiDOTpDbqY1Obk21u1F5bGPudBwC9qBkOnG6QpeDzNb9H8DpOX774AhG+eNk
         emAb5C1zCTCRUbRZsyE7iRCbP+MThDaNv+dUN7aBRjucoaxpwRuAVHtZ+Of16Vb0aA3A
         4jXMdm4s83nMTWImCmZz1iZcSNY00/vgv5DqUenlCcjVdlqbXqtPdXcGL4vA3p1wyNhW
         xtGjZZGGAJPIDqLzxy5mUOn7SPenlfutzTcnbqOp7nIgVlQdNegSPILfPZD22xLKaIUc
         Iw2aceuOiu28llbXtbviAWcqhZbaH6Vi6cg3CJwnxvN5NAJiYA4tJx03+lcG+4HckLko
         ogFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVe8lDXYh68MphTlseZGzlmqt9V+dFGktxhcUOZioIPgCu5+rqBBxLl/h4P6jlr/TLiw9VwTW4FMYM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcAM6UP4ctC4gVAg3EkIS6s8AWP9DQ+OTfpF1B28DekiBHYcSc
	HRAjnFDFVXhNbN8mD5H+1Q2tLKJPg+/RfOFKMRMYbUEifQy+EE7qTfjyH9Fq0lqfGrzNtsmcIov
	2hU5FMA6ZB4l88iNXnZbePN5sk4fdibhK4evfubKCRegCv3me8zPDCQyvC/kckL0=
X-Gm-Gg: ASbGncvB+G5F0PM/xM9VkTZKKcie9kfgAhOKo+mdZXOYvKjcB9xAOHUf/ZWvEKIr9Nc
	lFgwaVNmeIYZGqZRqwdsCnQIXw7SqajK8LyO4nfmq+RE0OHygQz39hixdLE3j4dOKLqxX6TZJXE
	z0jgy1mGqLz4s1qDVubPo8EPL7Z9T/4zdQKFvkwk4VrtXH5N7bMZ8H3BCph138q4fMPt79v29E4
	fw0mI0671H0X64fdK9f+p/KBovPL65+e3TZFvMX6bagei48/+PiJ6yzDQgRCjdxw0taKI1WGdOw
	wLCXmeG3/qhGJMAW5nZyaNYHyWtUN6o3SwhVRCCcOQqzbnrm0WcxpXSfe2681d7b1BsyIi8prjz
	XrYnYg801Gypic4KLy6aVIN1wNgo4OqZLchg+KrHXPk21UWDunm51
X-Received: by 2002:a05:620a:4050:b0:7e3:4415:bd05 with SMTP id af79cd13be357-7e34d9f79e2mr1305490385a.60.1752916488101;
        Sat, 19 Jul 2025 02:14:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDAN35XkTBQM2UPvbexmAbV/sfM9zAiC11TqR3XTg/5fyKgjdicRbMY+x2+0LlwRcobf3JYQ==
X-Received: by 2002:a05:620a:4050:b0:7e3:4415:bd05 with SMTP id af79cd13be357-7e34d9f79e2mr1305486185a.60.1752916487632;
        Sat, 19 Jul 2025 02:14:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a90d4ffasm5480891fa.6.2025.07.19.02.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 02:14:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Danila Tikhonov <danila@jiaxyga.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Yongxing Mou <quic_yongmou@quicinc.com>
Subject: [PATCH] dt-bindings: display/msm: dp-controller: allow eDP for X1E8 and SA8775P
Date: Sat, 19 Jul 2025 12:14:45 +0300
Message-Id: <20250719091445.3126775-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bImHGmTK-PeKPP9KGuDqcij6MQy6Q8b2
X-Proofpoint-ORIG-GUID: bImHGmTK-PeKPP9KGuDqcij6MQy6Q8b2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDA5MSBTYWx0ZWRfX90HJgjvBREvk
 Jo2Hpbkv6if+cNn5mUZtwvaLuYzMLH7/WTm1IBue/t0aoFmUATeiP/ICpbb8bUOYaMjaFtvEmqp
 J7aJZwDoPnCSrmi1oAn9TmNrMHCRI++cUysrgRO0S7zf4mnKSG0468AIYAIkai0T6N9c0ZSDPmN
 uCNO4Ag56jerkpdTKrhTv6mWIDsqxjkMDoF1xCH0DLqYKv97TErjjgYar4HVBx3XOh1a0AAsb9e
 xtCxjHUiz1un8S9kWns8lzEfLeY30WnPZElHywvCwa+NUmYQPzo2p07k0tGQUWN/F0CPfg35PyQ
 u0z0+9ULUS4oC4IQraqPymSZv5T6R7NcSxXEumEYYlQ4o4h0WdDOtoOB/Fvwqt1D/3Dea7PIWi+
 nZeZYeKgrAKHDtnqbw0hBGnQzpVqNy0Qveh0Aho4VJinM0grVJwMH7TPUwVZj8U+zXwWgk2C
X-Authority-Analysis: v=2.4 cv=DoFW+H/+ c=1 sm=1 tr=0 ts=687b6209 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=jb3qBSlP78txkkNFhucA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507190091


On Qualcomm SA8775P and X1E80100 the DP controller might be driving
either a DisplayPort or a eDP sink (depending on the PHY that is tied to
the controller). Reflect that in the schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---

Jessica, your X1E8 patch also triggers warnings for several X1E8-based
laptops. Please include this patch into the series (either separately
or, better, by squashing into your first patch).

---
 .../bindings/display/msm/dp-controller.yaml   | 26 ++++++++++++++-----
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 4676aa8db2f4..55e37ec74591 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -176,12 +176,26 @@ allOf:
       properties:
         "#sound-dai-cells": false
     else:
-      properties:
-        aux-bus: false
-        reg:
-          minItems: 5
-      required:
-        - "#sound-dai-cells"
+      if:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - qcom,sa8775p-dp
+                - qcom,x1e80100-dp
+      then:
+        oneOf:
+          - required:
+              - aux-bus
+          - required:
+              - "#sound-dai-cells"
+      else:
+        properties:
+          aux-bus: false
+          reg:
+            minItems: 5
+        required:
+          - "#sound-dai-cells"
 
 additionalProperties: false
 
-- 
2.39.5

