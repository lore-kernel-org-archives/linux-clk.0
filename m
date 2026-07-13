Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08E63DD537
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 09:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783933473; cv=none; b=s9SQT7UZVJp5/JNG0rjf32L0XSASlpo8JsIdUVzlk44HfwlI7qcesA9yIt9EzYUl1yeQBpFF2ZsJ83B7Dmo7nBn0T8tyuKxsbMjmUYjU8b2Z8ga04pDQcZX+lSy5Hye+2SigBo5cRZIdncCZmx+wJbAotCAtlVBnTjHcaQ2oiGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783933473; c=relaxed/simple;
	bh=YdR1uDQI01UrRdwjInrusY38ih3+WE1QOwNiA9AQEuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DNWMyP4pGtqyHXOdyVTLpbIBc/ZX0Yt8K+hlCc2l4rtD5Urz2MDT4SwaxFMVl/B78jImCPN43USrCDQDANkoNjm6gAPRxhtynYQjzfhIDNbPrRBRoC45+LqewQHOJLlG6it3v79fLXW60LeBe3xsxpbw16r+z0MvtLQhsqz+2No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d1UZHiB5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CmYVbNpz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d1UZHiB5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CmYVbNpz"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6O3JZ732794
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 09:04:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A78LIdhuo2c/AcjAgIS8LYTe6jMAe6P0VPNS0Gxyb5M=; b=d1UZHiB5ZDe+Vlfq
	D8lLm1/x1ZAt3BDSnZh7zL5teDk63WQiXsHGY+0u2UaUmE2zWQHttZEH9p4csHWd
	cOTD2SgMMBpBLvGdhV+5kTHyXJvcN+CBU3+rNpAtHed37e5d3enGipmSVeAb7Yma
	xW7a3nOucJQzK4bpj4gNWEjR83evKxGvwWUc3pDXB0lobjJkWP9nzswtk/ZNmyQ0
	/QMstNliJr+4khVkk63yaVWCDNcC/fVLqnL/cES/V/r0HEvJJvMtHraUBl/nwo4B
	b0+S9Uk3o4cE7bt1jpJmyYGbF+VJNtfbDUofs+GL0vTI8IV+lm9jTQGoKI4+eZzL
	Y6JExw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn39rw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 09:04:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so3841963a91.3
        for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 02:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783933470; x=1784538270; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A78LIdhuo2c/AcjAgIS8LYTe6jMAe6P0VPNS0Gxyb5M=;
        b=CmYVbNpz8yOfxF1Ef2MAuQW+1R0jxP+IhDCwgPwZbdC15rrTbUtX15mjIX3tjFuwrY
         kXCkKFeeiez/VoXskibHHbaAdTkuGw7UbwrVhl5IOk+iDuvu3Pm3BDlvd1tBGA2mptT3
         VTSdL3ORmlPrNb697pwngB+nyn5KX2pg9Wp3ctR74jftR6abCVOuW43PNgsXBs/UY1M5
         HaQgZDa5MZOgHvnWeAnC5gvqrzKai1rbgZFMFtOlr3SczqF5PY4BrFXXCsgkWz719hKF
         DHdBN3dT502OW9RkaE4GOGO8+IqF2KJk7a1oRWYhvrulTvXFqeVAHKXfq1meziE2IE5T
         vnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783933470; x=1784538270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A78LIdhuo2c/AcjAgIS8LYTe6jMAe6P0VPNS0Gxyb5M=;
        b=hl6sJmZjNj3oOpbkazgnK6UuFuW+tPkHENfoo810heUOZbLvgGqrC43NyGKmT53uNj
         EAEzMebIonSybEvafPxoe/XuWjKmNyId5DbnrGhuIKYoHFCxfRSIJ1p/k5ffvyR38pd3
         3qK8I570PE0YMj4IknhGHLO9pDPmNmQa+yteu443zgATxOHQ/1/6uMSWU978qeyMPKKu
         Gxe6Yt4Ajh56tFwB6ta8E/Yh2ya4Jog9IFcadi1fQc41oS/8kwGtEim7tCvfDz17AKh8
         /d4iTivh2oq3WV1s0UNkrT65qJgAoPEJ4zkiBXP0/wUerEJ1a43qACBKAiBRyS0qLU7Z
         7mqQ==
X-Forwarded-Encrypted: i=1; AHgh+RotXcrHjJZtrnFZIZ4uAWm6Yvd7PTQFiBHOCX400qZtUo89eK/+prxLZ0yLCqheIoVfGFskQIZ7a1Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7PWzLjAPz5zdW7hvdjvywe0hnkAuGlnJYzCqhGOo/RsQF/yAC
	//vc9GylWD0uejobP8IJTevZp24QDMZLgkTGR8moIaxnXHe4a6eYebn7fA3ISk4+2gF4rYxJAOK
	1eEclBcnHMDWU6wLz8kk1hq4dAa0ianHrPPU9/6wqL8ZUFLmNMQpAMbAoBRUstMeO/1c0t1g=
X-Gm-Gg: AfdE7clEjzZ4jy07i0IbCGnnY51/oXN82K/Bt84AHneDSb/FUGp9cbmcHuGIfG2rD5J
	eP8Mbm5ZrtumTRDT8cq9JJ36XXvUOvdQl/cEoswvMcLlQYgvZg4gPvOJ8cKQSsEVs9FwPnEHpOK
	GsC1DkBvFcxx6HKsqYooipSt1owcX0Go38EpXcl58enWQqfDdJxz596y3mGS8mMkMP/1qYLDFWr
	xjBo6nDarREEjK0cSkoNmzR1z54w+eQb+25oTi9YOCGEapZFjUyH2rzPuuTqhQplEXj4igZFbZO
	YSiLiEejJiLnikg1ckwVQFlORtqRmzhjnZBknBQzu7goLWxJxf8GBTqZvEVRn5Bwla9L8l22jAH
	fNXoaO2hTqsxR5iQ9lrgPUdrBLXA1d0Lm7tY=
X-Received: by 2002:a17:90b:4c8f:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-38dc75d1ef9mr8483882a91.2.1783933470419;
        Mon, 13 Jul 2026 02:04:30 -0700 (PDT)
X-Received: by 2002:a17:90b:4c8f:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-38dc75d1ef9mr8483853a91.2.1783933469996;
        Mon, 13 Jul 2026 02:04:29 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3119c2a7bb5sm43504435eec.25.2026.07.13.02.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:04:29 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:34:08 +0530
Subject: [PATCH v2 2/5] dt-bindings: clock: qcom: Add Maili TCSR clock
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-maili_initial_clock-v2-2-79548f0bb58f@oss.qualcomm.com>
References: <20260713-maili_initial_clock-v2-0-79548f0bb58f@oss.qualcomm.com>
In-Reply-To: <20260713-maili_initial_clock-v2-0-79548f0bb58f@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5NCBTYWx0ZWRfXyBh5ndjHg+A4
 m3+/SutZw9u0iaPvbq+fLRdCKOIo2vAoGKs8xmNSe+oUfiQNGkEmqQif21RRmse2zMEIIuLPPgG
 TyemhuNrkCYt2j0S3K3I7e0LvmfjHn20kwGdjuMNW5mignrOTcgR1PKGvvGxh4EYNA7YVO9wJN4
 CJHV6t4Hg+jGq401Z/VIEdeo+bJVqgj8r9LQ7YYr7AdvauXvgU//Cn7HOor6LqY85pHCVBbiqlB
 854qcQvYjMBeP91ObC0YTSgv7Fod3X83Cuu/3rZhAIS65FQTKeyng/ctJgnM53gGKBr0jhQig8j
 V8cTK9wxc0cAItAiX6gu7rR3A9a2YCAlzBJc91d9uH8n7Ml9CWYHeMfK6LZlrPsMiMT+U481Khj
 Uyaowhoioz7ISgJq0qCeyGU2gx3Yitmwgk3RUS4dmoIbfLEUE+xy1dRYZFensZl5wk0NlKAZLE4
 OJBGrwhXGmxF8gwZ5UQ==
X-Proofpoint-ORIG-GUID: UquUfOI4lI7DWElKP-mqNClEacGX_hu4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5NCBTYWx0ZWRfX7IiPIc3n2xvb
 CDB3haZlxn1SGsDHdtSNPbeQgSBG6A2yZD4vHUwV79CWrzfNeycnKfrg79plTru6uGCmEzjjiY1
 QA9NOfKgeqQPcm7BNg3hlA/5SthAanI=
X-Proofpoint-GUID: UquUfOI4lI7DWElKP-mqNClEacGX_hu4
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54aa1e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=e1wQWcbTFuPEDoJv1qQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130094

Add bindings documentation for TCSR clock controller on the
Qualcomm Maili SoC.

Maili is a derivative of the Hawi SoC and the tcsr clock controller
is identical to that of Hawi. Therefore Maili uses the fallback
compatible to reuse the Hawi tcsrcc driver.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-tcsr.yaml           | 34 +++++++++++++---------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 08824f84897358f2f7eac58e282a507c0489b5bd..15bdf055db3c012ea98217a0e7ca729ef41071a3 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -25,20 +25,26 @@ description: |
 
 properties:
   compatible:
-    items:
-      - enum:
-          - qcom,eliza-tcsr
-          - qcom,glymur-tcsr
-          - qcom,hawi-tcsrcc
-          - qcom,kaanapali-tcsr
-          - qcom,milos-tcsr
-          - qcom,nord-tcsrcc
-          - qcom,sar2130p-tcsr
-          - qcom,sm8550-tcsr
-          - qcom,sm8650-tcsr
-          - qcom,sm8750-tcsr
-          - qcom,x1e80100-tcsr
-      - const: syscon
+    oneOf:
+      - items:
+          - enum:
+              - qcom,eliza-tcsr
+              - qcom,glymur-tcsr
+              - qcom,hawi-tcsrcc
+              - qcom,kaanapali-tcsr
+              - qcom,milos-tcsr
+              - qcom,nord-tcsrcc
+              - qcom,sar2130p-tcsr
+              - qcom,sm8550-tcsr
+              - qcom,sm8650-tcsr
+              - qcom,sm8750-tcsr
+              - qcom,x1e80100-tcsr
+          - const: syscon
+      - items:
+          - enum:
+              - qcom,maili-tcsrcc
+          - const: qcom,hawi-tcsrcc
+          - const: syscon
 
   clocks:
     items:

-- 
2.34.1

