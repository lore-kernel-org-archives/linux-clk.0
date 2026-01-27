Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2859F36CE18
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 19:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769542042; cv=none; b=S+Qg/Rrw0coua+SM8jjmqmrk7TGl584MaxHwPqYiE+rwmjGYoF2A4GWPM39IhSmqPaOZOH7pFbjpC4AWazHyG6PJq3pXV/xpSFH9HFY1SmSZP3Q50C4d6shDatDuUO8gPXBf79e9kVtJoikR23qVoE7IVPuZZpcZesiOOUBWBNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769542042; c=relaxed/simple;
	bh=iWk8Nl3a7RvnDVzv5cIlkAQy4z9nIA9ZVmLSvJ9vb+E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IIzmPhD/x3oOrAkNJLB2o72TYdXGfC4MHEwy6GWCRh3MKi1y9svrMaZeVnkmTav2tf+asy/HRJSP3AZmzeqnEOVdKIFtBEYnOvdHLkWgTxVTNQ0FnNLrwa+dJNS0EsNpc8Ks6Tsmb5bIAjqKVhoe2slUeDnb5tI1c6YMPiA242g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JAvzHUjb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RU231e3U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JAvzHUjb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RU231e3U"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RF4L7n2378873
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 19:27:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AchfjWsMxy5/5NRTV/dSnkmbMLB0F/2QQ0pQeOqHjoI=; b=JAvzHUjbZc3BSW6a
	gn2gFevnXm9PZ5h6ibQFwq2tw7X4xnCXMPKDsutYecatnXpItq0ZRmkZK+7GMokP
	58SwnQYf/e7EA6wEgdCaw5jpd5m2PVtdnLVMkfrNNB82erI1dgfeUx1AolgzQTwB
	ne9iLKRvD77Z043wQtSFT+XMu5roSulFheMcQhk27HqYUW4Y5lCrTWz1hipyi56M
	eck7P8MOy1f+3M5toRpciCDu777Kyk8WdaahpSvOqbbTypglL//bP3LwK4WlBw1d
	SVchXQp+/Wcq2+URDPc0fpRJqpQTSpQbR6vvcNOdzR4dqbon2ptS6OAMpZ6DW6V6
	2Ga7qg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjrabv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 19:27:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f25e494c2so1614435ad.0
        for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 11:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769542040; x=1770146840; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AchfjWsMxy5/5NRTV/dSnkmbMLB0F/2QQ0pQeOqHjoI=;
        b=RU231e3UGm0QMLep+frTmLjh+e4keckzTW90RJopRAmVHcEWRr19sTvQtKUv59ngO8
         CsxdsEITn7UxFqhvCrmquFFh2POPvEifAf+cl/pd/SIuzHNLMQjk8C73rnwHLpvo+9eX
         95RpkyRYw8o80tA8DRibAHsxXZ0FPI3qDRMv34D5w9wjzDIJgnhwxXQahcA/gGi4T9JZ
         P1ylArzQuzKGoMxmQ567Y9RGwxoYnoVVWVju4l1Ibnjh6hPqVyZFal3RLduC82cOOfk6
         DfRl0LDQFAdVALFsQWJHXn8tbMPHtpW8VWYN+PMvP+btP5Vx1VuVqV3pbW671bOtAx8g
         Fv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769542040; x=1770146840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AchfjWsMxy5/5NRTV/dSnkmbMLB0F/2QQ0pQeOqHjoI=;
        b=BXjYUJEy1COwKaygmJ45ZtnTD870eI56KIlFkcc36T3+OBsbLQFK8sd3JIynqTLu8H
         2gEpa27KAax5VYQNqmds/e13WbOzDewMHQM+gtF5RIWNb2FvKYBE1qg+ASosDcQRzeux
         YuuAvGD4zGH4g20W9eAK1sEH3MsxCjf7Lm+xLuPyX93C7jiOyuUKFYdmEzb/pCG9YIRy
         nLwXLNDmG9T8ubn5TNC4hJGZT0pZ25nuVy+fqvx0zAqfD4xBfwpvQayxN09KID8McKjD
         n/+Va0TrLERhCZkNra5OWENnXNOPBpM1cGGsyqrsQSkEiSWPxBqjuBmmjBfHWz64bK5v
         3zpA==
X-Forwarded-Encrypted: i=1; AJvYcCVoSFyuNJ3qa6QV5hDaFeOQDklQ+Wie7/1cpbr0AkBscvjOtnyXCtvhxoedDN54wx01U+xdmPUI+EA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw06zhYWc3dxWD4SP1MY/zXSeD3bu27YBVKVjcI7bI6aI34o0J
	SaoZSCNZ4/gFDgCKg0+KMqmVuDJpT57TWjw/waxNvMgwq2Tkhh2Fo0DYojvy/mMY92Zuw70nGE3
	/QQkF67H7ZtgXzuhOBY86/YPU22ueLQS4d1y65+V0EgexwKIvUh6eY3GQ8kWQ2wY=
X-Gm-Gg: AZuq6aLJ5Kgb/iUwRs9LOcIDB1109AtQRaS1oxYWRJQb3nG2cbPb11hDh1gXOHGZjGU
	L+H0ChHbK/Adre2OjzKRDSw/qRzwPKNZ6mdVISIer8P9kPN3F6t71+76xeg78Fw3FNp0+SBAwG4
	PTHJJ2tRgnwq6kuEXVPXfr37srdOcEMcQRfwxA2t06R2q8D4vH5AExsHLKE4vLsfav/WarlNIeZ
	OsHaWuU8A+/8gJgbKA1JQRr1KER4xcgFsMQ5rL57g5Z49LTdB7cbUaGcadL+TKHfsz6KHi1t74E
	oFAFljqTf9Asly+Er43/vfGF6Dpv++dtv7XJw1B8lSvNeBxvBBoTlRFC8Ug+Qw3p4fPVETxdkso
	EQq6Urz32kpmwgGQiNGLq5c1VPYxk5SA1iV53Uv6X
X-Received: by 2002:a17:903:2348:b0:2a0:eaf5:5cd8 with SMTP id d9443c01a7336-2a871267ae6mr18979045ad.9.1769542039798;
        Tue, 27 Jan 2026 11:27:19 -0800 (PST)
X-Received: by 2002:a17:903:2348:b0:2a0:eaf5:5cd8 with SMTP id d9443c01a7336-2a871267ae6mr18978805ad.9.1769542039271;
        Tue, 27 Jan 2026 11:27:19 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b414fc4sm1322225ad.32.2026.01.27.11.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 11:27:18 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 00:56:38 +0530
Subject: [PATCH 7/8] arm64: dts: qcom: Update compatible for videocc and
 camcc nodes on purwa
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-purwa-videocc-camcc-v1-7-b23de57df5ba@oss.qualcomm.com>
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
In-Reply-To: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: G2tNHGZ4suz1F7r_3oHta2k9XzzCDFgt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE1OCBTYWx0ZWRfX1HHErNBWPhlJ
 e6HkNJjj2Obf6QwFrDaMazU+jhovjWOtVa7+JnDJ1mZplxkRklJZgM7SeC9x0w6KUTbdsyqWq73
 jB6LFHrLFcGBiSp2LwhkG8cqzRN3Y59kTlTqERVav/zj29ZwLTuoTN04MDQUkOxJx+3Mn7D4Xnv
 b1YKUZAQQ3vSLWJ8kfcYzljdRcasqfRwd2WG7EZyxBL3LquCJrvo62sVWCITSHrIrp+jEkWtkb9
 5HsI13olIImIqdu+Ic1T9VEt9GfQLEIBYNyqjrTm2S312YhzpeoreHjM8fggRHSPkPqBqO5E0+6
 HlEStL+mStQL1l3HQLjLYCkUCJ4VQHMPZC9gJDuqIK+RG6lmaE/aBzo0Fn2P/uRXMF0rQ5I/XH8
 6MRaJI6GgW3v2f8L5h0Vahf8J3oAEc7/m75o85bnhtiiouB3R2BzmpBqMCtwd6Y/EAwCgWLBOxq
 0RfF2OAE+VY8z0dzrbQ==
X-Authority-Analysis: v=2.4 cv=b+i/I9Gx c=1 sm=1 tr=0 ts=69791198 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=hE_BDuzjsuJR3tGECRgA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: G2tNHGZ4suz1F7r_3oHta2k9XzzCDFgt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270158

Update the compatible for videocc and camcc nodes to match with their
respective purwa(X1P42100) specific drivers.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
index 2cecd2dd0de8c39f0702d6983bead2bc2adccf9b..63599ba0a4f488d8f40f3e4d849645a8fa9ebf59 100644
--- a/arch/arm64/boot/dts/qcom/purwa.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
@@ -6,6 +6,8 @@
 /* X1P42100 is heavily based on hamoa, with some meaningful differences */
 #include "hamoa.dtsi"
 
+#include <dt-bindings/clock/qcom,x1p42100-videocc.h>
+
 /delete-node/ &bwmon_cluster0;
 /delete-node/ &cluster_pd2;
 /delete-node/ &cpu_map_cluster2;
@@ -22,10 +24,18 @@
 /delete-node/ &pcie3_phy;
 /delete-node/ &thermal_zones;
 
+&camcc {
+	compatible = "qcom,x1p42100-camcc";
+};
+
 &gcc {
 	compatible = "qcom,x1p42100-gcc", "qcom,x1e80100-gcc";
 };
 
+&videocc {
+	compatible = "qcom,x1p42100-videocc";
+};
+
 &gmu {
 	compatible = "qcom,adreno-gmu-x145.0", "qcom,adreno-gmu";
 };

-- 
2.34.1

