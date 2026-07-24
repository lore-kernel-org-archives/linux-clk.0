Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC22418A5D
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 10:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784887832; cv=none; b=tKyyOUSEPHU/RUVN5r5i0Tdt7uGbnjDGa3XNpWsauloHRfnQLyFvm/eUfVncnox7K+cES9k64GsAiyjVtstCdt7mvkKObvniTx7CEXzjf90x+y/0IAJd+G2X8XWvimbMtu++PrIxQJaY0x8hmTWIF7sWp2Elsg2FGRaQA5Am32g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784887832; c=relaxed/simple;
	bh=YdR1uDQI01UrRdwjInrusY38ih3+WE1QOwNiA9AQEuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LUJZzENguOP7leZQfPzSw7DAI1eKIzyDL2vMMVvao8JQ+ZdzbhRssE+jGGOq4t7r9yEMNWbUl0jAEzunhQ5rMKVwbe46sgsQIHhMlvk1e7j8ImqU7grTKjDnEysVzASr979V2kVK5UnCcpkhiGNukRaerFlvxI4AMTdIdrrcQJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mh9jzjKG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bTGtdjFt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mh9jzjKG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bTGtdjFt"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O9MXIh2755495
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 10:10:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A78LIdhuo2c/AcjAgIS8LYTe6jMAe6P0VPNS0Gxyb5M=; b=mh9jzjKGsB/DiC4o
	AHqChOMcGUTnLwKKZOGQ/ZC2Ujqy3DWlYADe+/VzgOtOQBenU9CSnx1j0dZnpmjm
	O98WdvGS9sNWqx7BvoSni5Wy7HoUnHeUWdOBtQnbJHAVT5ZCnWayvh3d3GgCVCqM
	BDCUFWQyhsftlrItt6YTQ8YvTv5nheKm3R6HSh8J73YCzW0OAlvr29FlVHEIYFmo
	BBTLYrtG17jGZxoVqCLwVtm4q6iKq5VLL3I+aXT0bVXkQHbWSofh29CEh7P8L7FO
	BnQKP5radSNh6EE5Y5snmOu8acX6rd6eSNloToiT0jAZZyj+hP65CI39xBbNPuBd
	EDO3Ug==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5byr5ub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 10:10:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ce8a76df2dso5089295ad.2
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 03:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784887829; x=1785492629; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A78LIdhuo2c/AcjAgIS8LYTe6jMAe6P0VPNS0Gxyb5M=;
        b=bTGtdjFtEEfYIhBAIATAOw2ZOMyyjZRpSlzvPdpq5DE9QH4PAcqsLc816mFP7ZRvyw
         A1fiNSZn3gsxZUnO3nyu2DY1zo9iCWx3KqeLAWG5zbaS4jBDYc7wpGANcTM/c6bp9AtF
         304vuMy7FfY2RRRWieSgCQptkD2lUBC3ODzJZAmF5s8uGKNr4pBrTyNbFJr6qqlWvxeq
         Ltte+dQEubJOMh1l8lVHwGpBZk9kU4csC8OcIZbIVK5ALAR3AHbBhIwD7mDiKgEfwDB6
         HSOKuV0eyWIq5OBfk+MuYwnylp0AEWGj1ZVXw6+vbMiB5qjfYoXFw+L/+JndSFpHuOe/
         uL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784887829; x=1785492629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A78LIdhuo2c/AcjAgIS8LYTe6jMAe6P0VPNS0Gxyb5M=;
        b=CcbvOdFXMS9n7udWYj1B6DgybOyzPOzDasmlHU0BT2cyvqYRvc2Ydiyyd7o66gHIxH
         U/+onyhx6xVRNpJ0wzUHM/MhaEupCoYzHA2+KYlDv2RzzYhnBcYv17z/rhF81yg+r/oG
         UE8f4Brs5TBg+MUh+IrYrHyzrL21UmUy9Lr82jKwYkUGZOgjwHI4aE5MObmEIb/EnlZP
         46U7WnecqdInJ+2q+u5y/u2xvtgIFrcYxQuY2IDGd13UDnztQgLWiJRSwesOSiDoDZQC
         nfQYNoCad98kN39s4inamyhgpawdg90oX6ipFdMYbwB8fgHKvXvnx7bsUnQUNI5uBikR
         fXFw==
X-Forwarded-Encrypted: i=1; AHgh+RqIyZ6FXyHJe9ZFQWkz6OxnNYN/dEPvMWq5VTNa6S4mr776zesXli2Ymze639SXQzzmva9RB996Vlw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLP2ZNNrc4nrYPG46G7aXlzh9/Y1txQVXEhUUKOFnYXTjRm3HK
	37u8OhTJEM6wyXNfdryu5xOJ0iZPX7mqJW7Ipa9BSeTynxyUyFE5Upw7pw0SvtDS5DP03L/5GVz
	5kgc13L4kb4oAKI4L60oCrFwGCUXGRzPqvFQAmjljSTg3lvJ7tPZNx4wpkC1j9D8=
X-Gm-Gg: AR+sD12qi5a5ol0uhAfvRhTfjBcj+XzXayvROOdh4qTPLij3ndbiBWLqDcuWKAb/Z22
	OuGXO61xNIp354H7v2hkDOqAKeFC/Z329XY74K45GqVPLIdeSi0T2vYOp3Nnc6PTXlYDhe+TMpq
	p9/TUzDaX9wimJkD6q33BH6LW1DkCPooUQRm5UN6ABwoJydu53Lq+KVp6YMUu2BiV2aMWBeW1Z0
	qW9EJNMLwIgEOvDenz+5HLd452JQ/WzknbUNniIZqvNx6wHuxvGPpdoxyPmAGzNYgHyolKRTqjh
	afV+IrFBmTv4+oMLZvsLpvhc7ZQ3LnvCR60cWMbQPrrZD1jAuv+f/dDOS9v7pes3IgB27KtOf+P
	eCKTB0pf3UKI5wzk+6E9U6Zci
X-Received: by 2002:a17:902:f60c:b0:2ce:6d4a:5b8a with SMTP id d9443c01a7336-2cfa71ab5b8mr78683795ad.38.1784887828598;
        Fri, 24 Jul 2026 03:10:28 -0700 (PDT)
X-Received: by 2002:a17:902:f60c:b0:2ce:6d4a:5b8a with SMTP id d9443c01a7336-2cfa71ab5b8mr78683495ad.38.1784887828198;
        Fri, 24 Jul 2026 03:10:28 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f390dd2sm47863705ad.79.2026.07.24.03.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:10:27 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 15:40:10 +0530
Subject: [PATCH v3 2/5] dt-bindings: clock: qcom: Add Maili TCSR clock
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-maili_initial_clock-v3-2-45b577241c91@oss.qualcomm.com>
References: <20260724-maili_initial_clock-v3-0-45b577241c91@oss.qualcomm.com>
In-Reply-To: <20260724-maili_initial_clock-v3-0-45b577241c91@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: mMNCp2h_XSUshzQSKOrqnJYWRo4Llvp6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MiBTYWx0ZWRfX/aytKnFFngKd
 WVNKHtQGOmCJeLGHZWiRbxWFY3dZjGU7qYsll5qtcMiojVC4jIUC1BndTzo4zXi7SOfzWMHfu+h
 Kwv8vM80WqcRcuyJU69Dgnk5D60rch4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MiBTYWx0ZWRfX4urMgry5a7Xd
 v0UIIXL6c7diVP7d4nIJK0+wmKJ0A1PHtrtd5pPvxMjcrD8g2p3aKoTNTNwa9wLjDKEiFHJ/Z6w
 i6NW+kWqc7x82wumvoaZQ7GIWItdIJtyc+/tJB/nOHB01PEIYpJq5S3wlg8yIq3f9uzx3Zwxqmp
 /FtFu5AwjC7sIeUDEDd1IPT7EUF0nkXzUzB8/5Wq+k77uM89yPs7dFuqhOivXXES/NfPBaY4JVR
 QMPMylePVH2z/peFaIun831ZQbUD+TOxaYsIIfZ9l6pOZxKTM4SmzNFIMcBw7suwvjdwguAP3HU
 wlDZ3LVKZf278OOb+KSJ3pjFbK4MlcqQPCbVi3/vtLbvlpI79R68AintwFDxARs6ad7YnhZ5j5P
 yexVEjOrx8o/mEzkWwzpgOWh1IMalc1g/itutJJokTQuswL+FinqW2FIMJwmu95kXqsaFGa4m2N
 DpgDKtq+84Kj+jfsCCw==
X-Proofpoint-GUID: mMNCp2h_XSUshzQSKOrqnJYWRo4Llvp6
X-Authority-Analysis: v=2.4 cv=GMA41ONK c=1 sm=1 tr=0 ts=6a633a15 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=e1wQWcbTFuPEDoJv1qQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240092

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

