Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC22E1D63F3
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 23:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758758221; cv=none; b=M0kYRQZVsINBY3T/HDk/8zZNfERTxxaHQgI5OeRI1Dp04H8HlwjHuYsIRU3zQpr7oW9Rz0HaVbx8JIMUrxzCnwsyJTAol12h+XTSuC5GcY7hSmrmVrpV0Q3Q37FB6I02JcxXYcPUtgyvw/uhfyIluDaA4QpaoGi+4a0dwAUXiqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758758221; c=relaxed/simple;
	bh=KD1EikTTBqRd00DRUm6azbYoSdAWJCoveXe8AIbfrJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lq7hUhyQv+3xU/0zmhQd5+oXkIuo6oUoTSLSSFnXttsv1JoBDJ0rJLGVO2nWsasPnuFv0gjOxIgrXzriPpYgK/VUbG73+nQkBBo6fP1XVb4/cgAGrfIFFdGYtr3LnKUwHFSUK2rdXzQnM2JblPYChmCJ83m3v6YPwCelw+ojxns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YT5/si8K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YT5/si8K"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODKWnO024010
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 23:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	isKEQzfxss1sYjk64yoM6hVVlanKUUPiN0aW5OP9ozA=; b=YT5/si8KhXNMZX2T
	aHs1Jv20X4rPpSuqJFJQf1wRMpf7N5oYFWcKaga1VLr4NskpsTnN7trpywqJyUeQ
	bO1R5lWKu4yUaGpnMtQKRswLPX27qqvAOFW3iy48VNvpO0I6DCFGrp8EsW/bfDx5
	UeOgnTNtuaeMshMVREFEMq+tR7f5ug23iKFmvELINIwf5WWaNHsrJZ9/Is/qS3sm
	IfC1XSdYRRrtdRZWNUFqeS8NMkMpYgH1JbbFLZ+wTrhpWyla7tGtIGEOQ0oYfQVE
	fNeyaxSHVp9k1hi9irhTDhXoAnuSLBLUqpcOrZ0f69tl+K+5Sew38MFgAzsBKmN9
	z4E2Ow==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp0d4en-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 23:56:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24458345f5dso4009855ad.3
        for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 16:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758758217; x=1759363017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=isKEQzfxss1sYjk64yoM6hVVlanKUUPiN0aW5OP9ozA=;
        b=DPgSamRogf7hzPVOEFFwx48ncVkop1JxmS/7zzI4Id+GlNA93WE/zFz3OpfPd1j1No
         oXAsZM48RXJUX5s+/jeMq5El7hDbkHENABH1eB5BBGvHpl8oOPGDgl5Qjx9lMlS5nIwh
         oLdvWZ6FT5UH7XBhldh8TW6dqeJPAH0h329APoVwB1UNF2lyRcSGa3oQq5M6NdkR62JI
         luVcX0Vm5xduxC5H/5g3bKhE4tkpnUrk2GLa8GxI8J0xAynUwtgBLiVQqWT+wUa/Inm3
         5MXJSkuLRn5D4ogKGyVQ6d6uW5ari2D8gvfNSZrXbcTYtIL2sv3+JtRL1L7PpZ+JotHh
         yWfw==
X-Forwarded-Encrypted: i=1; AJvYcCVY2A96kHJVFSpcrGNMwi9CcOm7iVPYV7+yAcipABdynAXnRG5BguwYCwsoqleDRF277hMCWxB5QXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvRSmdjklGmd74CE3GqbmmJqLURTC56Q+96BUXYFTChmI3xhPY
	DLp5ixYpAnnc7n8zsDY17DAmARJ/UQIHnyEHGTjDtGUixMucWpBhYTGLMDaZeYcVt2udcHf60aM
	FxqPPdkaRCj/VTMYbqPkDkIpS3egUoE05iBQRP1zBnjibHR3cuUIknzMfd6LGuvA=
X-Gm-Gg: ASbGncvEgWjnklEJ+GnEhg39skVUUmj6bLrEInDsYtpprltP1SPgiR9DP7+sfoSzS7p
	eBT1vpWWp3w47AWnuLlnPmKqAtGalAJrei8lEYE968cu/+Z7GUPbIGJafnqgfsMKIQ4rbXszJ3x
	L9vyPSVrJAgjMSUCHSM7CjNw98fvtoxGU27MU+phUPkjr6sAYbJCn4bMdjlCWaM38YPXGIQ4+Qy
	asqEDtuppYfJQWT/O5RAvXdpqzXTUq1frMxYqxxD966YGeHvK8JzcIpbJVWys2qqFVI6HZMeKfB
	R8un7gCsNu97FVCx4lPld+QOAysuNn73DZozvdQPx0o0ByvLegIsp+AouZA819iQ2U3ZzuZJ3dw
	X2/9tMVYuzXWt2VU=
X-Received: by 2002:a17:903:1a43:b0:269:8072:5be7 with SMTP id d9443c01a7336-27ed4ab368fmr13745525ad.56.1758758217269;
        Wed, 24 Sep 2025 16:56:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFehxrPaJqcD0zoFcP93jMpuoqnmCDC66PekYT5ca6v2kR3j20bFF+ZvrXw83kR+NSWs2aNaA==
X-Received: by 2002:a17:903:1a43:b0:269:8072:5be7 with SMTP id d9443c01a7336-27ed4ab368fmr13745185ad.56.1758758216782;
        Wed, 24 Sep 2025 16:56:56 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6881fd6sm4557185ad.87.2025.09.24.16.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:56:56 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:56:43 -0700
Subject: [PATCH 2/9] dt-bindings: clock: sm8450-camcc: Remove sc8280xp
 camcc to from sm8450 camcc
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-mmclk-v1-2-d7ea96b4784a@oss.qualcomm.com>
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
In-Reply-To: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758758212; l=1045;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=7G7QgavjnI2PuDqM9mUeILw47Kp6A2VPBmjnh3LL6As=;
 b=Omu47EnR+bgkxUUTbhFMWZbUJ6KHgo0C4uuRJDAgZ109au6Ey0JVTAUiJWM1osKJ5naM/Fl1e
 xl9N1vYgizlCbxAb3FevdwA+lT6Pr52Ad+E6Yhe12SYq+lpZg9pSYPq
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d4854a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=2bVdrMdO9wEKqzfnleYA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: WMpH9by3f_htIPrhJw4Y4WgqowiOo0FQ
X-Proofpoint-ORIG-GUID: WMpH9by3f_htIPrhJw4Y4WgqowiOo0FQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfX64McWxbB6cVG
 /HE0nTOQzCQRdHeinJ6Wka7EAopdiQfdQLsaawol9EdZw2Xq0EuGFFM6z+9H6AhNJ+2W+qQNkNL
 OJhoWoAzEi5jXB66sKcfhcUdORjkirn+6M6ddB7J14yM/k35yg/47c2LXxcsywFuNWNbMhwwEAs
 062pVUXc+ofvQ+RUAA5XNoKOtCZNCCgHq4exYGJTFB+D7XsaHqLAu5B6lYLVwaUID6LAj6aCCHy
 PXlbJmqxWIycXajtjzbFzCZlBSBSMjkvrvwlvH1wQ2sbk6yMpaa7smK3KO6A9Nh28fiNCBkSM+0
 GK7KDPm6MJhRs82fxwRDyr6t3DIac1s8xTzFGtRve/97JFi2nQutjsHsYDiidyXGueT5J1GZVMI
 VF1y4LE/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138

From: Taniya Das <taniya.das@oss.qualcomm.com>

SC8280XP camcc only requires the MMCX power domain, unlike SM8450 camcc
which now supports both MMCX and MXC power domains. Hence move SC8280XP
camcc from SM8450.

Fixes: 842fa7482915 ("dt-bindings: clock: qcom,sm8450-camcc: Move sc8280xp camcc to sa8775p camcc")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index c1e06f39431e..dbfcc399f10b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -63,7 +63,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,sc8280xp-camcc
               - qcom,sm8450-camcc
               - qcom,sm8550-camcc
     then:

-- 
2.25.1

