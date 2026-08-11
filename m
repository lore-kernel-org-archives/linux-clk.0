Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8272A3F7865
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 15:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786463618; cv=none; b=h1XxqRVnLWR7n1kRaGUISUlEMEFk/7UXuBCCywZ6sHWxJI2fp8O+3YXeXeGZTp3NM2lD9xIggyInKD+Sgow2YOCTFzfSOTc0T0GNTiQOVC+XbDShH+AqnmnS27BLZSu40DPkYeQR16lWpX3o2rdAOFj/uj5rFpZ9ZYuPzYmRtYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786463618; c=relaxed/simple;
	bh=a/Bp85Gwns8FUWjZGA43gS6PxJUrfuust6vHqofL4wo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cCwyIHESwGJKBqOtGd0OxJNCHsVIxVSyRWPSlwNv5WW9sZwuIsIAEM0A+YC4ERcwBUhV7SDR3Lf0ytF9pxz9iBoLZ9KR1RERT5QGvYNk+9/34DGKFVVgu5U4mA7pb80+9Gsj4+OrgK3e7BLUcjR5uP0pFuExo5AI15hfJgVgTDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p8LejGeM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VQ9f0D6n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p8LejGeM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VQ9f0D6n"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWvL5766908
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 15:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s2tJDTUoEq5Fh+5gEiMOadNu/ecmavi/SSdWaoYcUQE=; b=p8LejGeM+HKN3F30
	8jTNOI0JXnLisw8vI7/1PKA2VRebNJs8/Pr/cwMDZszf7g6NaKCJBmWkIYYplMDF
	NuUODtyAcPmrqttjqAPG0v8lVuxXfL+K7JDGg8B7/lNC4a/8l5s4YSgapkgNpy73
	IOecY1bpavmGJRyz5pfnlRQq8zkCn8Mld4PmAQ9MtEtPYQmcs2jZsKh5A6XfmW7N
	vVEw+JDwCSdDOmNN3CvjtuAgxGlxt4UZf7Jpvg5qokqVBs8eiPBTdIEWj9GZZDrT
	RIFbp6zO5Hcx250aVVRtRcfD/+h+3xPxzaV5r5lrKeRR2szFqCNx7aR6I5wAolPj
	dQv6Xw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g01q11bma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 15:53:34 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9c26587e67so23879a12.0
        for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 08:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786463613; x=1787068413; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s2tJDTUoEq5Fh+5gEiMOadNu/ecmavi/SSdWaoYcUQE=;
        b=VQ9f0D6nQ1GXFsTpmKam6saae3qhc98WqoY+QwSLZJdri6QJO04I7eIT7EmeKPf+og
         oWPERGQvMayZeBnXuLjltVRfceYBr65CKbeBf+LQWO6mFsBgZQDQqFbRBNhLAfbGlAl8
         6pslWmL2PxYx9HgnsGgmJsR6c1E5vbCSNxWczJCqiw3eyA2d88yrpb9uCPWb/XSpgdUH
         DYZCYWe4XlAbIVUKiGXAWeNKo+Xe26GQqVqDkrvLx/Tgdsh9aJrmWRqMO6dQXBE20GaN
         XUtfWHjIqlCeFHN5Iuo2aUh8qLy8y6YbhvQAEPY6o7WgTG0x/akoglpbYPwdMtJ0GZqK
         ZmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786463613; x=1787068413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s2tJDTUoEq5Fh+5gEiMOadNu/ecmavi/SSdWaoYcUQE=;
        b=ORuHVaHxtc3uF2YBfjXjk7fm/9UZEmGFdYPjLfSXH5xqk1B9dl0c36rNwU1b2RCNJq
         WCtXVkh0X5XkiGmTJ0oZg2c/+nfyDpl/1QsanG3KkFcLrr1p99BX4rqwcHTwi0+ceJbP
         bJ63a2HF9E5s5ZZMPpBpL4zwdKV65b/gPIwVJF5iL0VBqsEFtevm0zxmi4oeETFyXm3w
         9wiBwjdiduySzLqiM7LHlEsWkvR4OwibG2aMrsouOsm3oHQdF4vD6TyQHO21srRL5YaG
         uh16ANN30/bQtMNsqbSblAaUeeAVaBZUzZbG4aQiY+ijkjexVryJaQAj5F8ntsQU588d
         11Dw==
X-Forwarded-Encrypted: i=1; AHgh+Rqky8W8S1aoRRtRwofWjHE0GUOvclREyVzF17cgpO1grQAulzHKDnchpe5ebPcQ2m1kM1dqCAZMu9A=@vger.kernel.org
X-Gm-Message-State: AOJu0YytuTbXx+fP6lDDhRJunUB3pKkhncAXpZj5bzdyi0qvRnGlgrgi
	xxHampqm7kLbxF82dgqzWQ/o0y+gL/zzia3sjqET3ra4OdFUBVnFkP3iUOi3pySVtmIZrTjAYrm
	/L2VsHAVQad0bxJanDufwVLZ/I0D86DG7VsYrEE+hibgppPEaeL+6Lv3LzNzp9/Q=
X-Gm-Gg: AR+sD108ewYim/JvvFCtkEPX0dpgM/Io472ci+ufXv9+BCtONyHo+N9Oha/ker4+LMX
	RIK2XhfDa65I+heR0OTwuwZMNboJ9/hul05IdB7hpcuJYxxMCRPnCbPct1Bkrn+SquuEV1OJw4V
	y3TNa1RlWEGWYpw/qoySaQmp5Wwj7qA9Pu3PGAVDGD7geyOIU40L6vZZDebw4DLxndkpv9FA+CT
	AMm0e/MJ2CLTJfCG4oUhU+S9B74Abhk5F1AdiF5krQx/wZZ+wYfwjcYod/wXf1RbaFjsqNmHCNk
	3guK+q3sMYfjFKQaxX6xEmGUlMpYAMeFEgaW3/LqwafFrz3QYesBJJPhk7XThBC7YAx8z9SVyyv
	OzXhc6AEzxYVwUVvB+28hfplHIHLkG9p2CI2Ltdsj20LHeyACJzkycNT8z67eUKVCdnnkILwTxC
	MLBDfBJiARxhUJQ8szhCrVkmQmljGUGUoleU4=
X-Received: by 2002:a05:6a20:488:b0:3bf:a517:cdcd with SMTP id adf61e73a8af0-3cc379514c4mr1591818637.12.1786463613436;
        Tue, 11 Aug 2026 08:53:33 -0700 (PDT)
X-Received: by 2002:a05:6a20:488:b0:3bf:a517:cdcd with SMTP id adf61e73a8af0-3cc379514c4mr1591713637.12.1786463612792;
        Tue, 11 Aug 2026 08:53:32 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf6d726f1sm1143032eec.26.2026.08.11.08.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 08:53:32 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 21:23:10 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: ipq9650: add interconnect-cells
 to GCC node
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-ipq9650_icc-v2-3-55b8efbd62c6@oss.qualcomm.com>
References: <20260811-ipq9650_icc-v2-0-55b8efbd62c6@oss.qualcomm.com>
In-Reply-To: <20260811-ipq9650_icc-v2-0-55b8efbd62c6@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: qMj5m5SvaWgD1165R4xK94OWgIZnnjo4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEzMyBTYWx0ZWRfXxclWWrcDXgeI
 49JDL6QiP28Jd2V4Ob0JK5GHUUSsO52hqZmrfpgrRMXjf8ElfPzuL4IzKTS1JX3vCIiOvxfF591
 ilVqymh6Exq+DJvyphWE59v8PthHaStVcGcbSueSVcMpaqpXnF/4XO0D94zyAQ9W9dQEqwRo7Up
 Vhkd5WrQ8rWfiW1vQrlLCB2yj9lErXBN1YCZPQs7L23jF7Wi5jHGOsWDEssYcvbg1exuMNY5f49
 5vD22y3w0sY6WVk2MaeUTkh9IsIs4ZjGlyQxDvRGCy909yZme3lYhLsLUeIxWTPbNjXrcBUzI+e
 p8LpUM3XwKtM+0pZFecog2X0c6Sax8eAg3N/l6uEnOVGT3dc288YOphjGBfCOjbk4I7Xo0JIsP4
 nYcHR8PYyymrX+HC9gHZQ4B3e43x34Xc/OnjrgrjrHpZMc7/iWPCUF3vEdiRRNae+bDszP44d+v
 zokfvKPgbPl5yqKHTLw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEzMyBTYWx0ZWRfX0Ecqj1rfylup
 BbWRMZZRMh7fKX1aSGtvsFr2wxaLIWrcGM9PSzVHWgd7GscEsVgK/widzcyUGMp6yLlWmd15tRp
 C3bxLhTxpfL7h+hR2VvOnfdnYUOer30=
X-Proofpoint-ORIG-GUID: qMj5m5SvaWgD1165R4xK94OWgIZnnjo4
X-Authority-Analysis: v=2.4 cv=brt8wkai c=1 sm=1 tr=0 ts=6a7b457e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=reN9DiWUbCtN1Y_qNI4A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110133

Add the '#interconnect-cells' property to the GCC clock controller node
to allow NOC-related clocks to be managed via the icc-clk framework.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9650.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9650.dtsi b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
index 3d3b317c6a3c..4c442773de53 100644
--- a/arch/arm64/boot/dts/qcom/ipq9650.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
@@ -225,6 +225,7 @@ gcc: clock-controller@1800000 {
 				 <0>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			#interconnect-cells = <1>;
 		};
 
 		tcsr_mutex: hwlock@1917000 {

-- 
2.34.1

