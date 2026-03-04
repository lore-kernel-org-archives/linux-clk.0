Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B0A3A0B11
	for <linux-clk@vger.kernel.org>; Wed,  4 Mar 2026 17:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772646073; cv=none; b=B81vGL0P/oBwkAB6DZ5FiRCceaV/spkuitTG9vrkqpVP+4NrBE8lrIKmr1v3JxTzb1OG3l8yEVPfYHfG3vILVCUlGFLG4MANL6y3uUkaDzwAK35EYKj5hQtGdDYc0CqQig1TnQtMeEjH1BZmIxgTOYJk3RngCJezPGv2Cb3tRjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772646073; c=relaxed/simple;
	bh=uUwW2grMvbuKbrp4lZXb+6CHyoUfsWs1k8/5kB5T9KA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EIuOzQJkApLRHnID5ndmXKfGro3CQvWtGuCexoiomAwWQVfS3JqbbdrYDBQzbyP0Ygw5N+fsd0eEBHya4ow03DGTUrkaJ8bJcwORI2YvLQxWLO4PTBDu23IUTBC4OIONf+H/U2plfI8Q3hBxnrFAGxHzP9crJtbGLRJLnR41axc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=luKaWUWh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O829FvDa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="luKaWUWh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O829FvDa"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624Ccaxg1678348
	for <linux-clk@vger.kernel.org>; Wed, 4 Mar 2026 17:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ObmbS+0KfF6TnR3YkY2rdDy7IdpeKXphqea8ZIt6Bdw=; b=luKaWUWh7pfluL5u
	LKsTbMbXiyo0wriu9u1Hj929+X94bUst1cEZpZ21sjVgacwxK5Ty48VdUTmv4dkn
	hBh+bTwyShxnWeQ0Zm4zwFdfwSqPX+PCtKW7PIQL4Xbkt1ReOg0f0G8aDqzwaPfz
	gfmlhQbDtHF3QsTOgSg+U21MGB3fUXgTuT7GEdXxL1C+PzhmZbCMB5WPvDkuGCvC
	q3jsCI0IFo6bty5rUILuvYK9n9Iqs5Tmud1gxlwMPIXcE3s1xhIxvU9emBkbj2HJ
	TU4agJvWODRwogR7G32F/Qqwe7KE384XWl5/qLwyjW8ph2gokokqo1mLW66+y/3d
	On20AA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp73hbt0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 17:41:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35984ef203bso3799366a91.3
        for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 09:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772646071; x=1773250871; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ObmbS+0KfF6TnR3YkY2rdDy7IdpeKXphqea8ZIt6Bdw=;
        b=O829FvDayuDm4mUe9faec0uIETgReGgM57QRWNu57PF/YSYvuSP9NDu/FgpHYp7Yqx
         N0zaXqd1TAXYxq3ye+jqiW0k0g9v5CNAYfGZYS9Yf/3ic/rZidxg1GVfTBsGOJDq22kF
         shMmJV+qDQmL2NPyDWXuWkXo9dZJByEZr5pT7+Uec7FUZvzQvqbMSIYxcdPnFe2fwQkS
         pjybtIQJzOL4EpAdpmQb64zyDRkQOga6LMw9bdirpP42sCeHkigRZXTE0TXwm8tg9o6X
         izIp8Wtx7/93pNH3e52PeL86ppmmNBJv6R6vkY1cSlZcnwNEQzDRuM0KxhfPXMshaqqY
         +dUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772646071; x=1773250871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ObmbS+0KfF6TnR3YkY2rdDy7IdpeKXphqea8ZIt6Bdw=;
        b=mZvnE7417tXX5vs6yQSPk87lG7JhFCARufiKYC2oBR4CfHdZFxrzQhyyNsnr+mWpkw
         PCxShMCNX/uT0GMzrxQgdjGmOOl/92mjRSxeTzkSzh5cr+qFfwNIezXTPo37ypeBkp9g
         tvUcobzvuxc/cX+rLwoJuYxyM6NMilXXIo0AG4JPKJR070uG11gmhh3awGj/llcLtkk5
         Ypp3hOP7oKp8JA1xV4sAT/JCvdsw5Z6xw3W3uH/hGWearI5PA7iDH5FsqtnqUwFNzHWi
         3LM/Cn5KqUVBxXywnPcluJmwHwWsEHM1DeeKpXb2YF9VR8RaAXNkW4wK3ykfjU37JfOS
         FMGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJ9UOUTW4eWxCH3n/1M6gRSDzqbMR4sZpT+2LI+vLVS1TEV7L0vRecxfxva6Af1IkYikweVoSZXhc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaPYQCCaLJPKLgwm25szN8ztNOTRLFPdC5JSIGPhoR5go+s8eA
	SE4LKyWO/LU6TWQ+BaQpB7njzhrLBxeBAb421HHE0BYRQQX6BBaypenuqS1JPF/UfTzNIJ8PQvk
	EEcGpS5FDGlTBc2ef6gpxZsFAAY7i3jx00BTKD+R3J2zF4eJKl72fsDG9cWVdQdo=
X-Gm-Gg: ATEYQzxC9HMA+onfXm/XShXsxK0XDer775YMjtpgEOMD2yBNsKhkrqv0ek0acKyDkzb
	wT19zdZs5dQeUZWxaev1InKx2Cn2eJTUqZvdxSOA4eyiHPuK+/6dClrISs1IqUhopVkSyQ4fU89
	dWRY+Myrau543JXC/aTqsehq+eht5tb2Cul87/qpErsftsvCqJzn4TfKafLzlWJ09FpUbXo9Ed+
	LHgFyj0uftrAqe4sx9q1snIbOSY248mBOrDiUoC7jFv6D0BU/GGoHgpbdfMq6qp6Eksjt2Z5mJO
	3ia6iYMUqheZH+Jq71nHrLa/twkkqOj3I/on3sf+Q3rnqApz4nGIrl3hjUmmmXdt1cWWYsGBzDM
	jLZhkzmtmfMqiHizTWHT8IZdjPLoXEOC5BLg7Q36o3DLP874tw2dD
X-Received: by 2002:a05:6a21:6e97:b0:394:a0f8:f7d0 with SMTP id adf61e73a8af0-3982df066c1mr2888719637.26.1772646071042;
        Wed, 04 Mar 2026 09:41:11 -0800 (PST)
X-Received: by 2002:a05:6a21:6e97:b0:394:a0f8:f7d0 with SMTP id adf61e73a8af0-3982df066c1mr2888691637.26.1772646070595;
        Wed, 04 Mar 2026 09:41:10 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa5ea0dcsm16608794a12.3.2026.03.04.09.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 09:41:10 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 23:10:51 +0530
Subject: [PATCH v2 1/7] dt-bindings: clock: qcom: Add X1P42100 video clock
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-purwa-videocc-camcc-v2-1-dbbd2d258bd6@oss.qualcomm.com>
References: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
In-Reply-To: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: c0Zkvx6P1Fn9g4SCyYsgA4X8ZOR1pIbb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE0NCBTYWx0ZWRfX8lOCTVu/OtyM
 cMiZm0yQI8fclv01/b9n/v0FHwQUClZaFQSq3mFl3fbHVVfGQH3Bhgwwdir0mHOpLNMZCOvRyuP
 2Co0nQfmR4Fe8amkg+4tHuIKZ+LV4J6zHcod+T72D+f/nL3BrYh7f15/l/tLO72zbi2JNLz4qQt
 VmY/sBMYdIGCtipjMukq8RZw5FAq08dxkitVCFKPSwcidEuAUB+9fnz2SLmdzSFoFOT+I0tJGwn
 mrqLDBnzLZjOF4G+LVUBNERsGJueZhKKdoaPlc51FGCyuEiDhN8PZhdo57GwsnxTy6vbG6hoDfA
 gTh5RZ50HAd+DCaIu1GkJ9xbcHj2hQ/XBpDxGMVdp3T+st2IMKRhPcuE+nWFrsfY71j580hmzo4
 o9gSihFdMGah4pqBjYcCsW1xVmGEBYH9ErMGPot9dnmO5e3h3ON6tIY2QcRXmk9/l2AETPSNCf3
 gJjjLfrLlb1I1V4TQ7A==
X-Proofpoint-ORIG-GUID: c0Zkvx6P1Fn9g4SCyYsgA4X8ZOR1pIbb
X-Authority-Analysis: v=2.4 cv=BpWQAIX5 c=1 sm=1 tr=0 ts=69a86eb7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=RxPbs3uwKBDMNohP2qgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040144

X1P42100 video clock controller has most clocks same as SM8650,
but it also has few additional clocks and resets. Extend the
SM8650 video clock controller bindings to include these additional
clocks and resets for X1P42100 platform.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml | 2 ++
 include/dt-bindings/clock/qcom,sm8650-videocc.h                  | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index e6beebd6a36ee1ce213a816f60df8a76fa5c44d6..e8bf3fcad3fabc4f3b7e8e692c6c634d1aed9605 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -30,6 +30,7 @@ properties:
       - qcom,sm8650-videocc
       - qcom,sm8750-videocc
       - qcom,x1e80100-videocc
+      - qcom,x1p42100-videocc
 
   clocks:
     items:
@@ -67,6 +68,7 @@ allOf:
               - qcom,sm8450-videocc
               - qcom,sm8550-videocc
               - qcom,sm8750-videocc
+              - qcom,x1p42100-videocc
     then:
       required:
         - required-opps
diff --git a/include/dt-bindings/clock/qcom,sm8650-videocc.h b/include/dt-bindings/clock/qcom,sm8650-videocc.h
index 4e3c2d87280fb9a37cbc52330e31b0710ab63144..ba2d231e9dc8718bdcc07f994577cf68413dc273 100644
--- a/include/dt-bindings/clock/qcom,sm8650-videocc.h
+++ b/include/dt-bindings/clock/qcom,sm8650-videocc.h
@@ -16,8 +16,14 @@
 #define VIDEO_CC_MVS1_SHIFT_CLK					14
 #define VIDEO_CC_MVS1C_SHIFT_CLK				15
 #define VIDEO_CC_XO_CLK_SRC					16
+/* X1P42100 introduces below new clocks compared to SM8650 */
+#define VIDEO_CC_MVS0_BSE_CLK					17
+#define VIDEO_CC_MVS0_BSE_CLK_SRC				18
+#define VIDEO_CC_MVS0_BSE_DIV4_DIV_CLK_SRC			19
 
 /* VIDEO_CC resets */
 #define VIDEO_CC_XO_CLK_ARES					7
+/* X1P42100 introduces below new reset compared to SM8650 */
+#define VIDEO_CC_MVS0_BSE_BCR					8
 
 #endif

-- 
2.34.1

