Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472AD448B99
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 17:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785434092; cv=none; b=aubClLMbNIprtXqFEWjeS2bYgoDHoaxv1MK26ACP/vV7HDIxyU9t7PgcUXZJyRf/jk2Wu5pbE8SedGfan9LxwfGlViWqCrVugfei2LfCrw+nVCWmc96KRs7aE9af2Fxa4AjDxPRqBxdfgq5fonrWz3CJYLLZrzuwp2EVZ4s9PmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785434092; c=relaxed/simple;
	bh=3MohiFJRk7R/WUpguwJ0RoRbuy1k8TNuGFgJUfVj4ag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NfG0qQfZGcwIJ4A0qG810ZJh0iHSQexVrSnPwFWqBlLqP8iQzrff0VKTrVEvCxT3IgVItVjlTPSu1+aZw3IqFNcdYAgRSndPuiAXv6znUg2XMjgk9Tc5x2zRFTJH9kTlwOq/NiQuh5Hom3x4u2oCuINcUMn4qIAIiRMoil9Vk0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f2qMrdOj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BQkz0Msf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f2qMrdOj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BQkz0Msf"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UHhd0o1996085
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 17:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8b33FVeKQ9T2e/rU+WrSlOpsIVAOIk5Xr3oABwt1L0c=; b=f2qMrdOjnZco1mVv
	BY2+zwXdMPjh8UCH3TqbRatdDXhsRx8mPFiPxW0mpuA/k+y309EhgDqtX64ZGX6i
	FkXjnPaJLe4GuYSRLe2X1DFYhWtmjfwBkSWGu34+Hx3QBsOkkIfsjijVPqHZDQHf
	mJaKl5q8vwk4HmrJiKDjY6TD7Jiz06y7KLNh2o29XJvTnguU0avGya/XpPlwePrP
	30idazc2wzKDiQewU0JTuYIZ+B2G/kHHh5gWveHYvxpes6zkCpMOrBnFqrKDKvP9
	ihDTZBNX4A4t4AbvkEipV4Glo5Sg/DbQPKHtYjepHA6pg5fuzHVV5x2zAg9UyyJQ
	mgPDnA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frb8tg1wv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 17:54:50 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbb6433e9d4so63792a12.3
        for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 10:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785434090; x=1786038890; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8b33FVeKQ9T2e/rU+WrSlOpsIVAOIk5Xr3oABwt1L0c=;
        b=BQkz0MsfWAr3cM0Wx2gZL6n0TAYCcCcQ8KbRS4J+rpbeNcrU93LIFIa0SfGI7wnA+n
         aIsjAPahvhs+uEMT7nMvtPgXrsv/JFJA0uic3wi/nc6bA6tSewJoTzSCNqwicOSdEEgm
         kWZpxmztdkZpiGXeYHs18vzY252Ddvx75oZCmWUoJIsTce5SxJGU6Uu33A99prFPQrTr
         M9ejDhX23UtBUEwylUejcSRAmBiSDiPowfBb0aJV6HxcVWA2PDB7iFGZqhrFaYWI5Ds0
         0x/MA/nb0pQWTiM9lC1KXaX7xhotb5IbkCeV5iPSWed1sA58JWAymzpEpAVSa4L7kmua
         rKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785434090; x=1786038890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8b33FVeKQ9T2e/rU+WrSlOpsIVAOIk5Xr3oABwt1L0c=;
        b=qKVMevE6kAaZ0F+BnIFAe9EJ2dLQ5e4rvgZoG0m6baBOLJTYhulT8CQflD0PITJ7xA
         lyUAuYy9NFj4O4v0Bdad7H1+6hZ1X1zayIrmxoUA3hzd+SZCa087nrmBNLGuNJkTSBj3
         rrLufnZszzhItdNWSuUtvD5kRAzIIgyfPZHbsaiPsUiLnrXIMWyrsI8FS/i7j+js6pAE
         f2fkVShSf7vULQAC0AZMJgWlSxXktIpErN1jtXOqMrpHGyrMdiP8omJvu+Ri+tqsfdYJ
         Rz458fxG2tPds98piIcxbnlnG29YLM06SrcvzeIhV9bJaVEJ1c2BEpLTgLHCayHjEo3X
         jOlw==
X-Forwarded-Encrypted: i=1; AHgh+RoOpiw3gvcsHlRq4TK2WjgkZ38ZD1VkTCimQACHSzIXWjWhcPlTNbHe9iGkZtj/rhJm6ixC4Zjru28=@vger.kernel.org
X-Gm-Message-State: AOJu0YwImYBIT7aU1fg6Ugz6qZ5gdXRhkeRBj0+epHogSkwP4HI6e9bm
	75aTMxxuMh0w9t6zVq0tPPNXDxX4n0GtEMg5HQzh2zRhJQxAAfzh2298JEsLkrJXyHMTLhqB+zr
	xgVB6R2/7XGydoG0WsnOnfw7BjQWPbEqNRpJMu3knmfuCUU/N3AvrLfu2gBcUqMg=
X-Gm-Gg: AR+sD12KAshr1DN6qVLYZR84TgzzmM2wwUESlDsezG35sJfS+N8fyNxdcbIhhg0x6Y5
	yN7ds5FUBU93K0x1YcFx+M2BIDZnAkMi7X1ttbSwNWvc/EKfvqWru4e2oRt+PoXbGrd/oNBZgHD
	2DrrYfKGfkkqEhVRX0yKfLcEYjQ78arTHGHxZXwZ2CHzs7ZEsu9gT1JeQkpt7dsYuCrNM6onwxh
	bDr9xApSCbwzsonbzqqxmJOrJyc1Efg7+WBSjU/0Mb9cj58HkH9HXo1vLUIioPD7Zg9Pc7NtHLM
	xyxMgFDYA5q9kzs4aAj9ouejoLFcrGmtpz7gfPfw8GyubRnKKB004aufF4z3wFswRytMz9q3f4l
	tXmf/YyRwKDaJRlRzAgnfSLS+
X-Received: by 2002:a05:6a20:7f96:b0:3bf:6acf:2940 with SMTP id adf61e73a8af0-3c90067a725mr3688116637.11.1785434089883;
        Thu, 30 Jul 2026 10:54:49 -0700 (PDT)
X-Received: by 2002:a05:6a20:7f96:b0:3bf:6acf:2940 with SMTP id adf61e73a8af0-3c90067a725mr3688086637.11.1785434089454;
        Thu, 30 Jul 2026 10:54:49 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72643a12sm36444098c88.5.2026.07.30.10.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:54:49 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 23:24:34 +0530
Subject: [PATCH v4 1/5] dt-bindings: clock: qcom-rpmhcc: Add RPMH clock
 controller for Maili
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-maili_initial_clock-v4-1-ed52ade264f0@oss.qualcomm.com>
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
X-Proofpoint-GUID: sSxJHHjpqneyXr7Aj1YDM8zMfVFtFnmh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEzMyBTYWx0ZWRfX+vES0e+Y5hXB
 H0pznQLWYQ4L2jn5sIqSS5VMebeOoH7oENrg1spMbZ3Mjfej0fRQCabqHZkdps+3njYDgo8wXd1
 Xr6YB2Gl62+WmmTi6kVBE/I2mYufJQ45xHYhohTOHKuNi/vurRxCCv4GdY3/gpxNbCOrTM1663/
 7HA6l+y9hMHfJB1/vxmH8I7ev4EGS+bLHPQuVnRyUZncAAPgyE5qoWjiQkKsguLS0acYgCnNyul
 wEVXaTYGilu/JyMcXjhNHcZTO7rmwFyf4FIOIaUVDFmUbj3GbfmFOqP6b/THVvQ8mGA1oU2l1Ny
 wU0C+s6Oeyb2HRWk25AoQFGAXoybicYSJPq7/mkQpuPf8sEI9kPypq8DxOLkOsCtKIfgTBHtqow
 7+jxxLQP6S3SVi7aSgNhjcSs6jXH5yfcKJd1oJjeqd+40EgKq1v2ymOwehf9kOuws2W+Pk9zQbq
 FBOKq17nySRsgCuYSBA==
X-Proofpoint-ORIG-GUID: sSxJHHjpqneyXr7Aj1YDM8zMfVFtFnmh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEzMyBTYWx0ZWRfX/hfmTHePiH5x
 1sJBl9ha3SMNE9OPDuxu7fA7klWCtbRVY2G2YVvRpeEk7SYwpnjZmlM3EgmoMI7JOCfHcglIBut
 9qfhujCaQ8xDfkiu7TUJrRkgQlscc3Q=
X-Authority-Analysis: v=2.4 cv=Y8rIdBeN c=1 sm=1 tr=0 ts=6a6b8fea cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=OozyDhJeiyY2DhU_uTUA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300133

Document the RPMH clock controller for the Qualcomm Maili SoC.

Maili SoC is a derivative of the Hawi SoC and the rpmh clock controller
is identical to that of Hawi. Therefore Maili uses the fallback
compatible to reuse the Hawi rpmhcc driver.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     | 65 ++++++++++++----------
 1 file changed, 35 insertions(+), 30 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index d344b33860429527246484560823074f52a9159d..2b446aca5207c9cc2922635b0539f2d2f926ea0a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -16,36 +16,41 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,eliza-rpmh-clk
-      - qcom,glymur-rpmh-clk
-      - qcom,hawi-rpmh-clk
-      - qcom,kaanapali-rpmh-clk
-      - qcom,milos-rpmh-clk
-      - qcom,nord-rpmh-clk
-      - qcom,qcs615-rpmh-clk
-      - qcom,qdu1000-rpmh-clk
-      - qcom,sa8775p-rpmh-clk
-      - qcom,sar2130p-rpmh-clk
-      - qcom,sc7180-rpmh-clk
-      - qcom,sc7280-rpmh-clk
-      - qcom,sc8180x-rpmh-clk
-      - qcom,sc8280xp-rpmh-clk
-      - qcom,sdm670-rpmh-clk
-      - qcom,sdm845-rpmh-clk
-      - qcom,sdx55-rpmh-clk
-      - qcom,sdx65-rpmh-clk
-      - qcom,sdx75-rpmh-clk
-      - qcom,sm4450-rpmh-clk
-      - qcom,sm6350-rpmh-clk
-      - qcom,sm8150-rpmh-clk
-      - qcom,sm8250-rpmh-clk
-      - qcom,sm8350-rpmh-clk
-      - qcom,sm8450-rpmh-clk
-      - qcom,sm8550-rpmh-clk
-      - qcom,sm8650-rpmh-clk
-      - qcom,sm8750-rpmh-clk
-      - qcom,x1e80100-rpmh-clk
+    oneOf:
+      - enum:
+          - qcom,eliza-rpmh-clk
+          - qcom,glymur-rpmh-clk
+          - qcom,hawi-rpmh-clk
+          - qcom,kaanapali-rpmh-clk
+          - qcom,milos-rpmh-clk
+          - qcom,nord-rpmh-clk
+          - qcom,qcs615-rpmh-clk
+          - qcom,qdu1000-rpmh-clk
+          - qcom,sa8775p-rpmh-clk
+          - qcom,sar2130p-rpmh-clk
+          - qcom,sc7180-rpmh-clk
+          - qcom,sc7280-rpmh-clk
+          - qcom,sc8180x-rpmh-clk
+          - qcom,sc8280xp-rpmh-clk
+          - qcom,sdm670-rpmh-clk
+          - qcom,sdm845-rpmh-clk
+          - qcom,sdx55-rpmh-clk
+          - qcom,sdx65-rpmh-clk
+          - qcom,sdx75-rpmh-clk
+          - qcom,sm4450-rpmh-clk
+          - qcom,sm6350-rpmh-clk
+          - qcom,sm8150-rpmh-clk
+          - qcom,sm8250-rpmh-clk
+          - qcom,sm8350-rpmh-clk
+          - qcom,sm8450-rpmh-clk
+          - qcom,sm8550-rpmh-clk
+          - qcom,sm8650-rpmh-clk
+          - qcom,sm8750-rpmh-clk
+          - qcom,x1e80100-rpmh-clk
+      - items:
+          - enum:
+              - qcom,maili-rpmh-clk
+          - const: qcom,hawi-rpmh-clk
 
   clocks:
     maxItems: 1

-- 
2.34.1

