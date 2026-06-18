Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53F9348C6A
	for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 17:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781803300; cv=none; b=Grm8hHhwoZPodMGizAW/AO0vwgdNJQB7WuDAqqA2jUHigbf50Z40hvF9e/R6SijKfJolV+cf6JT5DDJZLk96m6O61wJTQHvNvnC6ZanVtK+ZMjNFi0Ls2s+bfZHPSC4ubLqzidjgHRZ6DXZs0UGCNfqzucCsrz+tTvNIXaCux0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781803300; c=relaxed/simple;
	bh=ZdwesjBbdggy9htszoxKAzqcAWFg1nb4JcdGqwjhpoU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PlhBaRmgUv+hXoRVbXFl9UljMDpLOlporpU2x1YMH+FoPdhBU1SxI2zc7wTFWOXyjSId1iHSf0Cz55rEq3t4AfVTDQT030lKgUSMlaJlM4pBSjWHItmW8FYHxtY7C7mJP5572mIbMe+6b4MK0ztXj5BJEBqmg9traWXZ7Hrttk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=am5Spfla; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xu6+fbqb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="am5Spfla";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xu6+fbqb"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IGwIi82414234
	for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 17:21:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GJxGq6d333OmiaxdBrGQvKKedF2ij9m3JZovFGWTPcw=; b=am5SpflaIB5xaJ80
	kCrmcSBLq6UG0WGye8gSAJwkYB7EeUgff6Q7cuOhFsJ93kqz2Yp5B93o/Z3c3LsT
	EBFJzytftKuvBp7Eldm3QYEZ4fGksh4hDTCLc+nR+R8AiM5ubWRfYds1q5dLrVrh
	INo8BM9IaS+oCZWT3dQyaf62/qoxVDYLSx8W1nOH/JNijo82LvXblgqnuxD09vcG
	C2fsWt4lJt4oIW4ke9CBtf2TeN5yxYDBqFlxhIsF25iH9D9VVzrunc0x+pBQRXSF
	A/p0b4rTWMnkTGBJJIXwRTjPRz0YDoeKBCpDT25WaiTyY7DgW9AxIwQamCTHlCXY
	XuytJg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evm228atc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 17:21:37 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37ca93a9253so828648a91.1
        for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 10:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781803297; x=1782408097; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GJxGq6d333OmiaxdBrGQvKKedF2ij9m3JZovFGWTPcw=;
        b=Xu6+fbqbAL826t7ziOntkAZD+r4VCVMaG6ImMPxy97loJkdGsEZbAzKxlYhmHRSHNP
         ioCHGzJ2b9F0efVzJaa7+Ch9RmpKA1CJ03PnSXNO1fya8AYkji8si/e56r9m/v6jCgvF
         9Qw1sM4RxMtRPZ2IC6t+ThYhcaf0VfuXx+MRUr0jJci2v76h8vhWDO+6hejbBGKq4Ud4
         6ZeyF1QykBQy1BFDtXXrNysu4alG1KFCR3yv1d+Gg+BUPLiJm5ahfWf0uOB/XjnMrFxB
         AIv3l/Fh2Z4UI0iM9hbhGShXDfY54nyLw8kXWqxbdJD7UzafX6P1fcfyXxG1HAqLiF5J
         AHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781803297; x=1782408097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GJxGq6d333OmiaxdBrGQvKKedF2ij9m3JZovFGWTPcw=;
        b=JqsOTxtvWIco9uR8TrUbQpTMhrn/CJ+w9H4FRp4JBMbNFhHTwVY9P4aHQK276+8GzB
         G8xMgAOV5r9y/Tzk63zay3kUK+QX1+Zq5AO5hl7vOIVDjGuSzNkxaDooL8iHM3+dia0l
         ESkzWxdFI0VHZx5Xc88+tvJQ+u8NkxlEnLQab3Z6pfON8Vt6zXBLHPeL4xWz+U1ej0in
         F1SJ9CbuXXtQuLhcSebasnhrCT1DNFN9vCHvLwSeRjhZ+Q03fTYjDBejvHlpY4VgQ/FP
         HBgsFb46NgGNbqhc/ncceNjTxDzvKqbJnyv4sLwdGIDBmdQa4Gt57RPxjLxbKzphxvkD
         We4g==
X-Forwarded-Encrypted: i=1; AFNElJ94WYtzycdW5YDhJRjwW9YnV2dnwcZD91NjBgzkowN+vUh5FH2KiNptmDNs9Q4wQffxTgj+q9Aw/UM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSNtDY0n37r4FSZ+O99LrkYgPd4JHDVaKzb93uLyUDpfCcOkn8
	FPcjWTLRDg+uOSKC4jdooyqdKHZRZqRppwTf+ZMZmZt6zBLIi9AnVRVREwfWNOdIfO9mU1euIlc
	hY5vKUydg4w6fQLhVPtvyljyuLAhZCGhI4dfS8+msoAHjJUNKBmruluLumsTPDQc=
X-Gm-Gg: AfdE7cmp/l0m2CHiNec1yKjdwKm2JpoYlmjXEDFMdHzsQFPQ/66empI2n8S6Q76v0PU
	xD0cePDLtkepRXyD/HZCyEsl3i/P+8EDNkHNNABAZluDrbQ+OYwo3HPcSPo+8Au4iCfL37YNU+K
	2FQJVocjjN7Gk6VpN2Z2Tho9z/xRymWDM22zONLarLsoFeP0au8ivTob+Fm91pNz9KGvHyZuMaY
	L5UqDNSzDosJ+7foCI5AFft8HvQnOKoKvHMqhBhJLc+3xix0DTTD12tULivUVIPEqFs5aroYAC5
	ytzmn4anjdWo0aNirJklizQajuPRKo2S0Ua5EprTJEIjsfuQ/6qQerDONI2FrJK4EAJXEnad8W/
	sZc/o31kBB6JWgVdqjx8GRm/zA75hdJ/McV8=
X-Received: by 2002:a17:90b:270e:b0:368:3d3e:efa6 with SMTP id 98e67ed59e1d1-37d15ea3858mr383794a91.20.1781803296926;
        Thu, 18 Jun 2026 10:21:36 -0700 (PDT)
X-Received: by 2002:a17:90b:270e:b0:368:3d3e:efa6 with SMTP id 98e67ed59e1d1-37d15ea3858mr383772a91.20.1781803296534;
        Thu, 18 Jun 2026 10:21:36 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d15df8b8esm187129a91.16.2026.06.18.10.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 10:21:36 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 22:51:17 +0530
Subject: [PATCH 2/5] dt-bindings: clock: qcom: Add Maili TCSR clock
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-maili_initial_clock-v1-2-d6ede0352113@oss.qualcomm.com>
References: <20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com>
In-Reply-To: <20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=YN+vDxGx c=1 sm=1 tr=0 ts=6a342921 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=e1wQWcbTFuPEDoJv1qQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: ZF7tfQAbGlFidZEAURXKF3wH40b8gqzR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDE2MSBTYWx0ZWRfXyxQusZmNEC2u
 2+1jCo6su6eCTYvgclixErzY6IxvnW9A1nnNhdAjNU7vUj3/H2BoA9JPixlg29Y6sPoavDaX3Y3
 6wJbe3VfDDyVAFbetV+ulWaF5Q1omrk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDE2MSBTYWx0ZWRfX4EWivIj8ph80
 L8t+IGnefwiUk3+Su70BWgJpa9qq+kvqPfwUJui3pbJ7ckHEmNeLWmN/jU8KSYqrF+mkOkOtK01
 Y5x6Ox90HOZ1p/5+DnIan2bud7tkUb5cGGOykkhZuGm0r7z2H/aJGVGw5wx09rgcbD260cJcjoO
 +OyOqinPvvBsQuKTWNJBjt4ldUBTbjo+mGzbeZo9SsSrRVn7LRgmnttfOmdmSSZeV70hPfkw+ht
 gmMPWuNo2rkMJQh21Y0sHoRg8eGUNCyrVjKRyies39H9mvJzKl1hLtKaBwUipDOhtE2GxMNkdwo
 RRPHrDgmNCn3iaJPDoz3okRehhZ//ExcDPfYvlR4Tmx2k/VkFmrucVH7HrJK+QwqfEdqQhunuJ4
 sjxfQMihN6AT3eqETjIdmtbUgW93E5rz1HqEBPVvgWnNZsrBPowvr55KbtrdT/Z+lZXByikK1Ub
 5oBBBGXLG8+CxVMhlJA==
X-Proofpoint-ORIG-GUID: ZF7tfQAbGlFidZEAURXKF3wH40b8gqzR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180161

Add bindings documentation for TCSR clock controller on the
Qualcomm Maili SoC.

Maili is a derivative of the Hawi SoC and the tcsr clock controller
is identical to that of Hawi. Therefore Maili uses the fallback
compatible to reuse the Hawi tcsrcc driver.

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

