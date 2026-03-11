Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5753D3002
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 14:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773240437; cv=none; b=mGX1lcMZpYGsJ0dPlNt/pUAI1+FUjX7FMnkl53GpW5fJHLZIAhGuRmpjCFVvNXOwCdQ8GMr2wHJCAJYjQhuNYJYzZgwPNLSRYZF+4LiulYSqT03g2SvT9M/wu6fishVyORmpqw1aG09963WAYY1+xUbFOD7BcsZACzNU60FEv6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773240437; c=relaxed/simple;
	bh=ljNAanNsQX3haUgfK2VNArM8xCcxc69jvU1l9y/w+to=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tEDXJRAW3goTPDT1kt8hDSThqCmhfrIQDwukMlMx1Ff/RxB9U4OGEd085Lt2Iu58DBCnYoYi91khPyNBHPkWgh+l11Tu36kxoRZfxFNOIG/1rQy4NMqlWSdwDv49tLJzIvYYCjgG+FnSoxQz4DM3jQTffwUUqYstbJxbTOaC+3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NhRPigTw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hjRzLPNY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NhRPigTw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hjRzLPNY"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BBnvBs2677237
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 14:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	44Jhd6TeZL4PPKiVLdK78+OKBcNZjGbvEfGHis15NrM=; b=NhRPigTwHLih9EER
	wE5ryBxfWWhnaoh22yjPkhScdiqLEKwf+Jui3KfuX/juZjFu0a7fN81BudsexAhD
	I9sAFYNW9yqisovv7p18UODuVs9M1Ix3WFQxUjGSCr56+4kCs29oVeTZoqelIRJE
	o2Gf8f4+UeG0TVGrqcOECHdLaTIV42Gqew1gER+e1dNvnTXSTrEy+h7Hxj8yL3+F
	6pI0ftbafqYyLE41UHSoDhC00nOY5fcATI4Yigym/lmgtneXrhkvT8LjwoDxfVtv
	ZA5Jc54jf7TKFKBCAANEcAKmwsNhyrjKSPrz3OApGHn0DFzCo89Q1lHX3Qs91cXG
	XdFGFw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu3cd1tsb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 14:47:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd858e8709so3362883885a.3
        for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 07:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773240435; x=1773845235; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=44Jhd6TeZL4PPKiVLdK78+OKBcNZjGbvEfGHis15NrM=;
        b=hjRzLPNYnIOtwN8ib7pKFvXxtE96vntFUkEYgWxtpzFWf1ocKY1KeXREknJypf1Iwc
         n4DJaZZORmR4WYLQPcNxpHq0cTflWBg2QRhovhWMtAttFISqtjqnpoI03EOjfEc/yCLp
         PLXEFzq8vODK0bLNT+YPLWvBllF3tPKRXYWRgKJT+hxF4zsxuLnIuxquu8ZWU0EhqQsB
         g7QU18+DUp2ElXHoftX5zWdmoddOklhQFyGDLKyWZQaLnMh8KJdrpHSRq1rD1FCUpVgK
         CLbmRzDWLenzudLmyaTFnkX8GGJWJW9pMZFfOzn2qF9jL//QU+h7puHuQN5HClUSyE4g
         plPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773240435; x=1773845235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=44Jhd6TeZL4PPKiVLdK78+OKBcNZjGbvEfGHis15NrM=;
        b=mBIBX5auPRZBBBLWOBAnmClz9aNwZmLGwo+1aIVXBNt7QB0l+/vUmEGW/ACEx5M9hY
         SvKym5Jyb7XxfpZxi+NFdjBaEzbV4bKHQtLPc+Vq7IWwJZgiIl09wc5DCZ2IVZf71Cwz
         Cnmvt3WvFreGp+KT4znv8MGL2gw6PAanPrX5z51H7dEn/cdwHqyCEVExMRUR3LkhnlVm
         WeSm08X7QrTbcWOwqzYCsfuR502vuXbEcJ/RIdJsDnX9PfLmwU/wD4w7CGP0nNOAVDq/
         PH+0GsGAEBSXpF5Dne0xcNGN8MK0obZNHu25IojjkajT1esgq3P+KnB0GG56Hi8T3jp9
         fsXQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8m8UavXwcLwITXkm8lB8P+kU6wvmjblfGRBI+4jfm5ZO4zkyLyrI6JbAHMGMm2EDVcP+5Rwc5wYU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS2Jg4roynnEeepmWVxNmn9oRYp0TgYhJ4Ac0yHgYXhtE1nV2k
	WY0KEZoroydizy1DX3cLti18d+qxfDINhjqT+JsplyRJsj5vxALN64hw8KxzsPCBSjN5g1DVvdq
	a6S3rCB/gHywSKcwtVEfDO8i6PqGiRiX16Y6u0AUC08VHuFLfcN0Cowh8PedU2r0=
X-Gm-Gg: ATEYQzwFs+rYBCS9zrYg3t/q+Xh8OEif703qHFJXH8YYCmtJAVwm45yvv1G+fCPrqNO
	nwgAenLSufV1L3eCOdSsyOh3MzQ3agOULKbDW2wNZignPvnkgpKNJF36+6daCn2d3CuTKX3tkPa
	dl6bMpmYmvy3kum0GpIrwTYZFB/IWnkc128ILJTq/39xg6jU/kt+foCtYyd4UaO48AN18o2lFZQ
	W6WuH0KNyT4yvtrilwRBj58Qk3lBjENYdSIXVyt50+iY8/PLdVv3TVMj/DmCJliwVOj28uuH5Bp
	7CNtzrVHsxhYbzmsY+WlgVi/s3e3SrMQm4SQO6OZ3hOxGVzFsDPKC0ytO4jmbKgwL/qTOsicGGv
	SUWHzdMxtu5VMzswFREZb+JuTHd7e7Q==
X-Received: by 2002:a05:620a:44c2:b0:8cd:79f2:dc36 with SMTP id af79cd13be357-8cda1a00219mr344391885a.31.1773240434586;
        Wed, 11 Mar 2026 07:47:14 -0700 (PDT)
X-Received: by 2002:a05:620a:44c2:b0:8cd:79f2:dc36 with SMTP id af79cd13be357-8cda1a00219mr344387485a.31.1773240434091;
        Wed, 11 Mar 2026 07:47:14 -0700 (PDT)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f818d61esm7992501f8f.8.2026.03.11.07.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 07:47:12 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 16:46:33 +0200
Subject: [PATCH RESEND v6 3/6] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC
 for Eliza
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-eliza-clocks-v6-3-453c4cf657a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=871;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=RKCYGsJFqEQSzos+9ejqQfu8ULxnCzq56BctAEfqjW4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpsYBazkQCjD1jdlLoYhC/2bidEor05LzBe6Pp7
 B8U64+yLeuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCabGAWgAKCRAbX0TJAJUV
 VnYnEADOAphzFyZKVCYegJ82QLijWrnVnJ87tBA+Hyyep/9t9juBWB3cWEwU8iqhdJ7RTrb9dUT
 DZkCBuvwQ+hkfVGjkWrwAE3pqotRu3ezWYwQJFDl7LQr2zb3PaN5s4dX9gT48S4GF8fpsDTwbP1
 mav7Zfj+HBMXEeROa6pFJ0j8ubGldybH3BIAsTIcWhbrnzliyAnRaZKCgiWa8UydA/VA2N3LuIn
 FpA65ZObUgfjg7iYxaBC91rHUENWCIfcYBktlVa5hKY5hbIhZ7iYF2gQNyWUyHgiRqMpsmcTJqK
 PqBWat2bn68DOb1Ngcw4/yE7SRETBpalOoDFi3B3KJ96zItLZ2yr6FNnWE5YYjQ7wElxMUPRJUU
 JAFbep+JhSPiIuN4QDTTzMbzEPOcasJQd/VN7eCWhjJuqpbrqQPwkR86pc1pulsLOlRiaueQWxi
 jTI7mI3o1zAmnn72Of7+Ks9sBC8MDs29obvvdUsb622ywxPh01MHO5vPVVUePlm4vkiuKNILXG5
 yiYqonHKkSFeVNtp0uNhTT2m5oYK3+7kBhnaBBRfQyMZBbwG/lPXVYQmAE+V4kfOyiM0zstY+VL
 GOW4msG/cAZ3Lw2bb2xF7vOg+yKzCTru2XMQAADHXQkWY4cMsH/LOJEdfsMPudmaBMIyf049YNR
 eWB632XSMVZw+dg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEyNCBTYWx0ZWRfXy0bgkH46bZHS
 62nl+bZ1UJ1dzoSfhWNXkPuRqyy6JKzcLc4zIxoCmLelpmnJte3bnt2pHuJVixml20+STGs04zl
 lRYeLMWmlMJ449OF2VsFbswTQLfjOwcYPHNYCTZs+TVb02U2A2zsLhTovo7psobpA/S9dyd+opV
 Cxm1gGhSokZbisRe3etpbMOuPj/TJu3nNFutLr9cNPpq0uKMZB02o0mDxW5dvXI/jaN6dmXhPTP
 jma9uzLUZtr+DroSmLmN3B3Eh/5lZSK+75K7eIcei2LW1zgOGwCGosDaQxP3tTaoSN17ZjOMh4X
 badLqlxykiob0DUbO7hBm/4HQe1FXXJXkLH7bhTZ+pjzRxGCaDn+F3Xzycv5YVPQwILSNZedLG0
 nMeoObRuPMDXupbKtJ8/NaS7liKMFpra8qzGY2HOhmaimBVvbptRSlSeIB9HPjRYxYBSK9+NmvH
 L7tV4lhLlQ79OsIdkXg==
X-Authority-Analysis: v=2.4 cv=O/U0fR9W c=1 sm=1 tr=0 ts=69b18073 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=PJhJesWDv2iQC9CHGcgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 4jXGkYUgUcRnZnCkazk41bScV_98yAju
X-Proofpoint-ORIG-GUID: 4jXGkYUgUcRnZnCkazk41bScV_98yAju
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110124

From: Taniya Das <taniya.das@oss.qualcomm.com>

Update the documentation for RPMH clock controller for Eliza SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 3f5f1336262e..9690169baa46 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -17,6 +17,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,eliza-rpmh-clk
       - qcom,glymur-rpmh-clk
       - qcom,kaanapali-rpmh-clk
       - qcom,milos-rpmh-clk

-- 
2.48.1

