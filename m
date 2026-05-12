Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679A723C4F2
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 13:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591164; cv=none; b=c7TRzYaKldre+XHRQZaDeeBRgrapmzufLd8KIGtVmea974W7sTn0xdiPkvLAW5FWrCTCIPxVIfaoewzufoRPev7yO/RBW5sZ1E/cOVfPk8UX5wHaEWZB8coC25PUbvcM65HD8i+gpoEl02mc/J9D5hppD4fwqvgr6NZo9ILUFF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591164; c=relaxed/simple;
	bh=XeBqS57b9KugXDq2jUjnUxXxTh2sUxtxP8EipmrTW08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HEcsIm3Ev5wDdlPxLL0NTtQ4FS+n8qyhGBYni3jMqFMYWSO464MrsAWjkMRZSB8Veco8517o2A1TWmcX4psfylMjbhhJAXxtd0SdTfr9+gL0G8KGjcAZ6+rdS+3e/g3SEOm6JVe3tJ5+fA7gtb97geH7awatgFgNSaFPe6VucdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HK4a7bBX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ebuI9VFq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HK4a7bBX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ebuI9VFq"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CB0drk2519114
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 13:06:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y22l/ZS3tE2jArlLoAI0198lel8ZLaqnuMV87pw7o/8=; b=HK4a7bBX9IkKkEIs
	gsrYC2q6S9hGFEjhsN2hkemrnl++4102Z/g0ifh53t/zKJ3Te8acO4CFtDWXhI7G
	Pt8BWNAEcgOT1MOlTG6nT0wsscuMGgPRwOqzGdEyfcNRfsPalZ4ZVm723MnEqEdK
	HFF8tsgI2tYER0TqDvVxrlkz32nEQcIuGoUl0voCZPqmg5nNIj8xwkt/mdpTSefv
	ZkUqJlil7ybCQE5vhFkrhPUIe0emxJfXBFR1vkDzMJ8ffJ/735CXuhfS6ylpG4+i
	Uq7WrIL4cJwyPCIBPiT0kF5jWYTm7WxyCIB0p/6S9z9U38Y5NQWfBCoXXg71vtqH
	kvbYXQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv1kdfy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 13:06:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba718173d1so96877005ad.0
        for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 06:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778591161; x=1779195961; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y22l/ZS3tE2jArlLoAI0198lel8ZLaqnuMV87pw7o/8=;
        b=ebuI9VFqEbTwrFC4o8YXddqopRqYdzFwAIByrJyX4H8A5ERbEjlzvIMhQUOQMqmmQF
         YBUXOUMBcGTd8oFKEXbWLQGaBh0oREKU7+t2odtyV5D9vIVikccUmocyTTTsKtyseNNl
         O1k8ifLE7BrJtPQjVtIThZSziS8Rtq6jNMlDlObG7mspfeMl6/Mhry9SgCwOqjjqHu9E
         yw6YZVsUzE1gickk4f1Hx7Elrid+5eB0pQezSvoRNz0hQ+j3YpHOMxb1dN+6cuvx5TDo
         cba77BhNBddAMv2HBRNbjdAzSuy7fjC7OmETLmdB0s07BchQDzP48TvwT92s9QHa5VGQ
         9X/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778591161; x=1779195961;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y22l/ZS3tE2jArlLoAI0198lel8ZLaqnuMV87pw7o/8=;
        b=FHixQtn+xa4CxoVM6zJGS8xXDF8/w8U1He2buedb1TA5nyNTUs0J7N8swQX8gApnVY
         Kyg8RZK8g8yl16oil+EaGn+na3/NAe1b0smfRNZKiLApxPM6cLryNTEAbBu2BikvS4J7
         b2NX7XAjiuUnZs2qCw7QyKKXgyAs5GT3M1Ast8NM2+9O2F2DMwC62vEY89ZSH3g0I+te
         bgLvhcPYIYgrkXKCMr7+z/TnvguxVhqfBAjMw4ghyLBmf+wpH96rxxxJDeTw9bWrL5O1
         sSvAlEPICOzJRHz6WF+3rV278HWllhJjgDTBzPxxVNp+HO9rPyI7HcCg9H/rM8zqzg2k
         BQwA==
X-Forwarded-Encrypted: i=1; AFNElJ9yCL5/omJKcJLtVnPLe1XWaGDdhhgxco2YJnVkhnwg3KeKMSKNS8IRLOYJN0lhyXlLT7CAUClPM3c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKTNozc8Dc4MHbOgpVDNQ/8oOdypTSJLSVV5BGYICwA1Lbkd8d
	GEDf/ESRcuHR+Tbpsb6dKY8HV2tE/8PgzMsXI9TuW2BIsxbYlU2uNODucRi1lVPn6c439i8y7sf
	icsvrI0XPLSNdbvuHrpRYbOaug5s3WCh7QzIA6OUoQ7G1freIo3AYeq5jEFihfZQ=
X-Gm-Gg: Acq92OHnI9Ko1qHovVY3WH9V0ePrZprCjOhyPOwFGayJRw583SIO/BNWY4c7Dta58zB
	f3nYDCGl+DNtaxzeZsJ20o1sjvRaTiLbskKZOyKbtL3dc22Z2TPyFThkiTIukfM28Ee0BJLFxbm
	Aui8+dWgtlbJdE9TPH9fdwGcNuOFB9D4mH8vTOAVCrOEV5hLoFynml1rhRVtr4WjH4LpughWl3e
	nff8NFQ5K9+ltDP7/opxcel1vTe9i/M2marBqbld6LFU96USyVTHnU94oGIYy7qebF/YpFGnih0
	Z4DXts17yS4muRlMHq/rPKcqKDzVhdfxtd71SEVOIz3hRVjediB9xxdP6mtWeJJZyS5mRzgPRXA
	DdtQIkfxwxZZK+nMhoIqTT5Rqe5QJhxBj2+Vh4Qy2HTDyWbt6C6mg
X-Received: by 2002:a17:902:8641:b0:2ba:6ffa:bde0 with SMTP id d9443c01a7336-2ba79c20bb9mr228536445ad.19.1778591161215;
        Tue, 12 May 2026 06:06:01 -0700 (PDT)
X-Received: by 2002:a17:902:8641:b0:2ba:6ffa:bde0 with SMTP id d9443c01a7336-2ba79c20bb9mr228535975ad.19.1778591160755;
        Tue, 12 May 2026 06:06:00 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e36c65sm137630785ad.40.2026.05.12.06.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 06:06:00 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Tue, 12 May 2026 18:35:28 +0530
Subject: [PATCH v3 3/3] arm64: dts: qcom: glymur: Add camera clock
 controller support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-glymur_camcc-v3-3-a7196fee2779@oss.qualcomm.com>
References: <20260512-glymur_camcc-v3-0-a7196fee2779@oss.qualcomm.com>
In-Reply-To: <20260512-glymur_camcc-v3-0-a7196fee2779@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: atX2LMrcnZ0MjEVbbOzwVtqn9hdwX5ln
X-Proofpoint-ORIG-GUID: atX2LMrcnZ0MjEVbbOzwVtqn9hdwX5ln
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEzNiBTYWx0ZWRfXz1sH+2sWO7dU
 iUUchASTzZ6A1bpPxRdgDk+D3m1gJsxuazAPvqFQiNcEgF1sxaOfiPqthEfUnuFPpBaozveqgw/
 zQuvqvZHN2icRGRehAzkWPQKlCKQA2wJgem76KsUk9Kulzd8v4WpdbNYhRU+fsq1fkRXBs0b15E
 slwuGWdGO4QRzhtDdy8UHqN0+WMPgLTtLKsts9bD6ObRZTa36h8vYuKi8ufTw/uwP5edSKMqvCw
 Il4mZSDH3D5f+gN88YYqmJ1LNPQixxVN/MlhM5lnCXsCpOnjGERriuRLgR2XTMAlxRuRdTYjHQ7
 cWGCbLUHJrTqqAJtp6ctIdXNp33K3V22SkGkyZk1LBhP1wXYJECT+O8wT8EkmJn19oNBa6wYBLf
 PiwPbxKgmvUnnDuB/Xz9InNqKKnrf20b0pAUOOQ91G8tG/GItJIv3VWAPn/Ihm8Uw2ySMIP5lU+
 0kTjzd/2O5ICzmEPR0w==
X-Authority-Analysis: v=2.4 cv=c6ebhx9l c=1 sm=1 tr=0 ts=6a0325ba cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3iLwGWznUEgL9WBE7MAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120136

Add support for camera clock controller for camera clients to
be able to request for camera clocks on Glymur SoC's.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f23cf81ddb77a4138deeb4e00dd8b316930a2feb..de5d6085df13d58686b1e7959a3ca2081b19b01c 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/clock/qcom,glymur-camcc.h>
 #include <dt-bindings/clock/qcom,glymur-dispcc.h>
 #include <dt-bindings/clock/qcom,glymur-gcc.h>
 #include <dt-bindings/clock/qcom,glymur-tcsr.h>
@@ -4163,6 +4164,22 @@ usb_mp: usb@a400000 {
 			status = "disabled";
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,glymur-camcc";
+			reg = <0x0 0x0ade0000 0x0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,glymur-mdss";
 			reg = <0x0 0x0ae00000 0x0 0x1000>;

-- 
2.34.1

