Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3CC38736D
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 08:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773823220; cv=none; b=n3TpdVBwgyXg9UM8jliKelBCY5tX1SQO2kvdSCid7tY5Et9V9lkGqqUMDM82CmoxVBDvHHbYsDlilaxbbFZhGhN2cPeD0qk2Ho9FFNekdbaHnVymjzSTvNURI5kRhudzFV66Zk2dfwu3QC52i3ifA37TvarG6bAqu1haztJIyEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773823220; c=relaxed/simple;
	bh=gm6tDoWzjlGe4E5qZfKllZb9n636Raf72Fz9PM69fbE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ulX5hEdJQRtammSEZElVqgETeuOBMvoNodDy8rSkSUmqCQ52ACRZripkgTSsBgXikn0u3lrww3/haWpfsD+Yw93xY5VS8c7KvDf2BokUtfFLILC5O86wLtNAtXuo0k4oOU8kP4RhlD9oJ1n48i6Lqyn/VXNE0jP9ILwfGlOFXQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BCZVmgr5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EeesUhjJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BCZVmgr5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EeesUhjJ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I3ZuWp2730262
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 08:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mdeI3XpwqfrNzutHdUcddj/4yu2W4O4G5Fu1PQyqbh8=; b=BCZVmgr5Jldh2lZq
	rfGFeJNn/ftx002CsRvP1ziuSNkbhtvSY7OTDpr2YSTfYkQQMk27n1RqdOB7B019
	xqEkfjAEgbEkOAhxcDNQqDCibfRfrcjaD/fRiOj37RZmVoo9QAsLjzbzVznvIAxF
	6Rv2mBOHndcvlXPQ0ppNSaZKYowjUIrNS7rVBKd2xk9xRvd0GNK77G5+sT8IdUXw
	sqbEGJj9GP8dsmqPEesEink5KqxA/gXrwYCe2xNpcpKUrseiWP4y2BjkAssFMw+i
	YvKGI5D7S7SOqpfVwt5BstFTEtEhE9rTZaMeTw9isOLbVyv3bsbgU/Sj8BZvibSS
	W/cqVA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy8kjux6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 08:40:18 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c6e7f45e2ddso32257254a12.1
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 01:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773823218; x=1774428018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mdeI3XpwqfrNzutHdUcddj/4yu2W4O4G5Fu1PQyqbh8=;
        b=EeesUhjJcFyn1xLgZq/mUK7VYFhQYwkEHU9Otw11YDZLeUDaYaxGIJNSvqFCv/n35A
         DTxNIQ91VGt7r7icxl/Gsx5R6ci1nznd0Qh5lKggiLK54NHMfh2y5Ls6gwRFGdcV0c7K
         LqD0RfRcT/9AHf/LV3yId4H2lvbi6X5eWDNtSvNQPgq9beB5K9hB6U+hVt7Steaqr4WR
         WPTBUZ7mZT5LtUwIH8d2+YncdFF1kTumLstiRC4cziyZp9Le+xtRpHWOiibiDURUJncN
         u8nJkwJnuO23jq/kR0WMLJzNdQIaF00EmOOrhvfD/EdV1KQU5QM5pvnJlMsyLeBQbu6B
         zzsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773823218; x=1774428018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mdeI3XpwqfrNzutHdUcddj/4yu2W4O4G5Fu1PQyqbh8=;
        b=JYMGi+9qfBDN+XT26rHa2LCwd6lFGlgp27soul1E4hjrDALIv5ojY7zcMC6fr0rB1m
         tt2gjsIP/MtE3QkyTVxQCoxarg5uKuC/E0ByGv7PymRbEdExdo2wLAVNOMr+47Fu6W2e
         aA0/I8yLcHSrg9o/lWoQTymAU1di9sOImJspHB/pQm3ORfADBMqlzGaEce6h+vzFxw4a
         X5x2+P4jPdZJB8Qda/W/cIrph+R0fmrk/z6b1buNiJKQuJmev0H6tH836FSmdyoNdZsx
         QQvd74VDKBOE9DqYTlLjtEodvX/wP/I+BwA0q54v4qMJPWukZJQ5ymF68onWF3Bg2osB
         QY6A==
X-Forwarded-Encrypted: i=1; AJvYcCULTT+iOhM8f12eJ0xxO1Hv3k9hfTPwOjqEfSjTAWdpKRClEHOefMY3awOK2OEGVsbklRzE7ZdrdxI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeYO/IDqBo/fsa3nH00EpoiJryugGUQ1rFS0K8RvL3zyYtdGWU
	eR1NTMM6V+hGVD0gPC9fe8MMy1cBQMF2PvnSJExbhxbZGgzsOwMNIXGAXfdU3npPvpa6fjKXCt6
	181mImtikr6nh5u9ur/ozaE8yVMzdIAm6WWozvmN+RWfB9lCCYKXZSTZ4rq8NAdQ=
X-Gm-Gg: ATEYQzxPL9poV2GU/GYIp/QiJjySuEvk9DPHrLP4gsrOchGAoRbMSqdODNYe04qmOe2
	RY2j7oXA0BaUtyMoGxnPKkN3bxRjuZ3nOuX/rvtF9ZiolNjWJmhdeu+Ef/0RkEtoixQ2gPYA0lE
	ckU3XemoOYImwtzNtX2bwtBhcCSkeCmtUw/bCYdlR73iYwVCg2yJdjuYZS1KAXulR09NgegFf99
	DFIwiLPc06keMkvgJFom0SwaZm2Xf1nL/p7VBcmjJ36Jv3xsxBnsSyWWoLms4XQ+dzbpMTHj1n4
	oUIn01H89+WJm9Vfz+X47waxduUIkOwzyJlcz0yHZuQGJY9WEdnucKH4f05JjE+aHk9AyKy1w4h
	gs1sPvNIPos77+w/9P+OyzuKkURTK/yq6gsg7H0K36/S/ozLjNkTdbbta6RD6u7b4W7ra8y2pcs
	1eA3aCQWogFoyxOnrIY4XpQwKoB4Ud3gIkz1yQib2ucS6m1OWRrXuVUHg0
X-Received: by 2002:a05:6a20:e687:b0:39b:8545:f0c with SMTP id adf61e73a8af0-39b99de9c3bmr2468670637.26.1773823217686;
        Wed, 18 Mar 2026 01:40:17 -0700 (PDT)
X-Received: by 2002:a05:6a20:e687:b0:39b:8545:f0c with SMTP id adf61e73a8af0-39b99de9c3bmr2468637637.26.1773823217290;
        Wed, 18 Mar 2026 01:40:17 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6bbb2802sm1863498b3a.31.2026.03.18.01.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 01:40:16 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 14:09:46 +0530
Subject: [PATCH v2 4/6] dt-bindings: firmware: qcom,scm: Document ipq5210
 SCM
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-ipq5210_boot_to_shell-v2-4-a87e27c37070@oss.qualcomm.com>
References: <20260318-ipq5210_boot_to_shell-v2-0-a87e27c37070@oss.qualcomm.com>
In-Reply-To: <20260318-ipq5210_boot_to_shell-v2-0-a87e27c37070@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773823188; l=926;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=gm6tDoWzjlGe4E5qZfKllZb9n636Raf72Fz9PM69fbE=;
 b=RRlXgQpcv7YVGSfbgDM4go8AH2F8+29JVWxmuAXvxGFoNF2ar3qMRMF2qppYl3vtGJzwuuG0H
 lfwR6l9DWc2C//NZQGb8sc8VMYcsJUH8bw52Ugv51P6vEny1RHn/9+w
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA3MSBTYWx0ZWRfX0/4IdSV6eKga
 Z0RLZzN5Lt6IVTX5Y39GCjBsDkhnJDqYkdN6UUL9UhS7eWfFOStMum0Sf3EIwhxjo7c54e9hIHI
 LQUYTooiDfczMS5QpkaWFHhI4vu7tYftLxWHzOpX5wQl53BFhHvHQvtDA0bVDvawhGtJ3d2seGn
 vEATxuvm8WnQ10vgUpzn/kUzbEFfceTJuqW4puEV1UYd7cTR0x+gxfuLnHH7fGeeGE6gqLyYJSy
 XwNvDrivTvESIQ1UaB7ukg9Y+kMhj8KlSNhBTlItw419hHBt/btHPIztD/aUmsvRttLofKQ/1yK
 LbXaPL1OCGt19/UO09q88bslc1iep/mOSE/H67aIxxDfo0ZR8OY9popTdSCbftnsoyOp+d6G7US
 90HJxFvYjSb0yxaLxPyLyLUfzvabjp//vY52J9x50jnRSd1RA1uzj0H6o/w6ENRQ9bpym4uHZlC
 8vF818sy5dmgb1pQqtQ==
X-Authority-Analysis: v=2.4 cv=P8I3RyAu c=1 sm=1 tr=0 ts=69ba64f2 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ND75c01xaBhBG1K22twA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: LaVNcmfSBtyGq67sX3rwJpKp1O-s8Lox
X-Proofpoint-GUID: LaVNcmfSBtyGq67sX3rwJpKp1O-s8Lox
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180071

Document the scm compatible for ipq5210 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index d66459f1d84e4d99c7f72415d08bfdaf1d701948..6d9b71a9b9b3fefd1951b963f34942243aa48ccb 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,scm-glymur
           - qcom,scm-ipq4019
           - qcom,scm-ipq5018
+          - qcom,scm-ipq5210
           - qcom,scm-ipq5332
           - qcom,scm-ipq5424
           - qcom,scm-ipq6018

-- 
2.34.1

