Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E813AD501
	for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 11:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781694505; cv=none; b=l66o3per++M6i4cu56A/vTq3cSXMTA3qELAaAQPAP70qxk9XqXIAmU5Muo5tzKlCZ/Y3LnvQNlR980dxYkhNkZ5pojM2MRbKcI2J6YpkrR5ptvVScj2FPPWijRdpwyHIoohgzN434fcun0UVu2P8jRip2Pdt0azj1ZLpVpsXrUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781694505; c=relaxed/simple;
	bh=8fW2GytXR72R7Feik4hpgijL1okutZWJ0vbyUcl+Qz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qD2El30It8BLftJc6hZye8XvslGjRh/VJk7a76wYMltHZ74ManQQ8C/wQcGd4XERmTvmgMcUFq0PT7UkeX3J+sF4aFb0NGNUeyiD0MhYDHF/WOICWOd/XeiCUB1RZ3UmPCC4E2NYCun8rF9PIQe6eQNo4TETp3zgNtlgOtmfc9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U54IvGS4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XxHiOBa4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U54IvGS4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XxHiOBa4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UEDV1734987
	for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 11:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iFoqRC38wRc9ZJi9oIm/mcQVj3TZ570dYiNC0mw+xlo=; b=U54IvGS4Oo3hc0C8
	/dBAhkPViG8Nb9YauzRZpl18+RrSHb47mzuE0+QKY0gyCjD14tnJ3ODwvPYi0ozi
	CKcZxajyyo8UFlahtdDIPa53dtiMFjNTWKl438qNuopTn1xgYrnkXMZ9vy+7cH8E
	5ugdLqPndDO5KVPNV1vvvgvaeFCXjnEA9mjCb6f5nMvwFPC4/zawHPMY4AgPOG5R
	BA/TmMEDc3rLLrxTIaZOYMaVafqQixbk/nSvX7doegHzjeCov9rElN5jdHXjNHuM
	OLof+sstlY52UC0wYHXU74aVrHAN1OKvc4TlR6u0va0dODiJ9kImY+v4ab0yoxtA
	49f6yg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueemjtmb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 11:08:23 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8422b544a4bso3923326b3a.3
        for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 04:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781694503; x=1782299303; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iFoqRC38wRc9ZJi9oIm/mcQVj3TZ570dYiNC0mw+xlo=;
        b=XxHiOBa4lXrqsRA/TX5PGGpsQPz364HKizuNuzKIsdaTBG7hguV6r4aKC5Q64bBDrQ
         c7Rg7fNdVfYkTRFUTOtsrsNizidHpC6TJhdV6kSHww7r4fHPTtVjhXYcZOD75dVouptx
         Pw8i9YgQtc8h7tdaG6iwUORXieAOFhrmIDQm2z53txk43X9lhKKkqFo0Sf4Rr4PNiuU3
         HrXT4uAFy91OOSNtE2ujKE7TF2Ugo4LyfCwx4NC1kInMb04YjdjCVFpkgvLmjikpVKGQ
         sP29fVWJRWuAwrlhI+fcLCxyrcwm/o8UO+/iMeZDAspIZm0q7Din3gaknDBEOS4jukfX
         q4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781694503; x=1782299303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iFoqRC38wRc9ZJi9oIm/mcQVj3TZ570dYiNC0mw+xlo=;
        b=FLTOuLQc7r5+tAf4NImXGvPJn4WTefx5WyGFsGcxLsFW32ylVITX42ZhbOUNLcfyTL
         UqxoBYuwCiHZRbuBSZfzLTb0ccnXRL7x2rRnZo+c/T5naVj8j78yJN254xijCK+s9r3r
         JYfCEMXnZJ8eIeCrP1ivZ/2nls6HYnJH6IMy2xA3wIH4ZqJGt4RgheUMXg/jK+DAHnWZ
         qNlJByvDqPeHK+q5WWIn2KKmDTWZhbux+YW64KIMkw93p2RFQoQ7/AItfmdZhxALLh9+
         r7Z4UcJ2VrY3tleF5OJrrAvQMKL1vuYnsNeKgLjlXrQ6O/RhFosrbkF7tVinsBQatJAI
         nD2w==
X-Forwarded-Encrypted: i=1; AFNElJ9RVZGS2X9c8KzIiEdO6VUP1ST14pBqurFOAZdOSsYySBO+tsOyPci8VhA6klqlG2rPV/iLQPAsM6E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzCNWl1bITWx+93Mp86SXjprVpofieHpQ28zjfqaISN+vu6uFk
	dkoblsQ2BOZIZGN85rb3UoyLNaVxITBaWGxuSOXccsXr+4iygfnG9RFsrw1D0NGxZVTc9eQYNwa
	6wXIHMJo8A8NfrHF7aLov1wMH/tCW4C0EDczPJ4eFfIQyjYBuk/I1O20X5lYbjdg=
X-Gm-Gg: AfdE7cnDY3JTnBS9Uw4skS0uBoyeMhkFb725lHId4MqGo+c9x7+z2Nmmp7Nay7JhbEQ
	7hJTFWOvLFzVY9P7Jk7KjK2agWK9fMq6Gb+3vecFOnmrbLCt8TQcfq8gB7w9N/A2jf6CkMi1HhY
	YhBdCOsLNpYRZay/x0/yzpTFa+ytK2OOUu2reBaS4DwYKAzUJ72XdAJ7rvtTHgRJWBok81PUyO1
	+prSKCGo7ZyXqGwq+PzHCF818n4xdnJaw2IGECwpqnGIzCdrmrx4inrGAJ9iOPhAfKwKK0uGXBD
	MEFhdqV4SvaiVvD76RkDx+x13uK+jkn0BFcOiILjvWCku0wQZImF1CAuKgUQyvWG/1dQFsRyzET
	0pvQQ6LVxbbaMtYpj/aTW3t0hixTcT+S+kKc=
X-Received: by 2002:a05:6a00:1d8f:b0:842:708f:39be with SMTP id d2e1a72fcca58-8452441de23mr3395305b3a.5.1781694503078;
        Wed, 17 Jun 2026 04:08:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:1d8f:b0:842:708f:39be with SMTP id d2e1a72fcca58-8452441de23mr3395244b3a.5.1781694502489;
        Wed, 17 Jun 2026 04:08:22 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9cf01sm15873609b3a.11.2026.06.17.04.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 04:08:22 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 16:37:55 +0530
Subject: [PATCH v2 4/4] arm64: dts: qcom: glymur: Add EVA clock controller
 node
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-evacc_glymur-v2-4-905108dacaaa@oss.qualcomm.com>
References: <20260617-evacc_glymur-v2-0-905108dacaaa@oss.qualcomm.com>
In-Reply-To: <20260617-evacc_glymur-v2-0-905108dacaaa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEwNSBTYWx0ZWRfX4XkjBPnnY0S6
 QuAC6RQJbBMWlUEujT2iUmQ/lSVgpcTPxV96lEUxy0UIDTzuBWpRsodx+1EtcwIvzQdW45hTT0V
 /VYEGP68dK7XPZoXRkUG6lADC4XGYsM=
X-Authority-Analysis: v=2.4 cv=D4d37PRj c=1 sm=1 tr=0 ts=6a328027 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=9WBvkjWlO_SxgljkUiQA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 0bPobMgCsH3zq0BZ4Vp98uHcksnbUdPD
X-Proofpoint-ORIG-GUID: 0bPobMgCsH3zq0BZ4Vp98uHcksnbUdPD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEwNSBTYWx0ZWRfX6zIwjQaXiuNx
 Mv+QCVs84qfLLB6DbuOUbLdap2J+q4zTu56jGI02g95b09JwoE1jim83rjWI0t2EjEF5jMcQhYV
 USPOtVZs3w9+VkXTzxPsL5DoQPda8u0alYo/QiPZAQAEJ0tYDmqasXJSqX8IqQFMVB/ThFd2P/I
 q4ej61nTjW/R3o9E4olRlDma97xmeDwdDcEOODeqgdfJa5eseXXzTo9LgTPJgb2XKHHoVLOiAwi
 ijrmGT7eaUOebqG+OMdDtCRyqQFzbybdBw80pYH8WVyqTMSgr3irB0ojyKPqZ691CIsQtxewP35
 JrL1/KZjNKq2vnLlSEmZS5+zACoE6frEKdZcCZ9z8Fjl6pmXAOIqFOgdgM/UMPWq8DpOJpyvbOj
 fZKW3Se7zl71iVnu5iuihKKnsYYqYgpboO59Hhi0oQ+c9Ljm1CGQ36taFlFf3x1zPydVpJPaZjo
 +uTuWtzKzmOYqJzXAlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170105

Add the device node for the EVA clock controller (evacc) for Qualcomm
Glymur SoC. This clock controller provides clocks and resets to the
EVA hardware block.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e9549d126aa50a0dc7a90943a3249..d7aee11ca9eff85de4813dd08a1a2c20ce098250 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/qcom,glymur-dispcc.h>
+#include <dt-bindings/clock/qcom,glymur-evacc.h>
 #include <dt-bindings/clock/qcom,glymur-gcc.h>
 #include <dt-bindings/clock/qcom,glymur-gpucc.h>
 #include <dt-bindings/clock/qcom,glymur-tcsr.h>
@@ -4804,6 +4805,23 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		evacc: clock-controller@abf0000 {
+			compatible = "qcom,glymur-evacc";
+			reg = <0x0 0x0abf0000 0x0 0x10000>;
+			clocks = <&gcc GCC_EVA_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&sleep_clk>;
+
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,glymur-dispcc";
 			reg = <0x0 0x0af00000 0x0 0x20000>;

-- 
2.34.1

