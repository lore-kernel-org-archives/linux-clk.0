Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1399935CBA5
	for <linux-clk@vger.kernel.org>; Mon,  2 Feb 2026 10:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770029832; cv=none; b=MayDugWyhBnE4isuoZIqXBh4HdiidOmHp0Y+NFtUXxjoqOaS7rRVBcp8w6he8dDGnBjdyK+t8e8Inrwhq1RV9dLtwfuI5V84oIUBSW0NGpk7K0shfA8v3oxKJ6djnyjdRjuSpOtRtrTwZFveatINqTc4j9P+CCi6U7ixp7whAxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770029832; c=relaxed/simple;
	bh=q5Nr0YGXSWa363HoQmNNcuQRm+ZXYvrUDrddq3fS3yI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZKgXhgA1lR52dQcVjjKCh+zc3yAQp+GDefgDOxZNOadwGcogWybfA2G1GHmhwweQAU/B94vxR0M9TQ0saade88hu66ZYShH0a0yLr7PxdneZgNcZc7fqCGufLA+U3ZmBtpj/Nk+PeSTF9BIOI/Ax1RtubnQOHiRCuDKkHaAC+Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MeUN4lip; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LpZlKaIB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MeUN4lip";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LpZlKaIB"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612AP7ti2106939
	for <linux-clk@vger.kernel.org>; Mon, 2 Feb 2026 10:57:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T9xirun4JgZY0u+rP7AnHfkkrmrXi9PZys9owwSZyA8=; b=MeUN4lipNkYHNXWH
	BzVbnCvcXx5DwzCs8OaDTui1za2KXhDXi1grZUoA9KQVz2kXUYXluj1kTfejYlfF
	6g5wAGnavjXjx1rQj8kGv/wMUJPtSx9PqUJVKjxjpFnbZCZlEyVkXvuRDw1f/eOR
	kvc/IP0mkDyTYIXOTG8Y5asRXAblNyoRaOLGeA1e73teauphrausf4D+hKTywRt6
	SCrikk5PFWgfFTc9xHlYXsYw+X2cy7Mybj1BQqDLYexu+ofpoug8QVojBIBe8shc
	j6wo7yt6OXJ1pDLOE3qvyROBR/b3mmACfYZ39K4mTgLjuWQ2V6yE+Bo8XqMa+cFR
	UPebnA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2t5e833w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 10:57:10 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0e952f153so129337385ad.0
        for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 02:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770029830; x=1770634630; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T9xirun4JgZY0u+rP7AnHfkkrmrXi9PZys9owwSZyA8=;
        b=LpZlKaIBJ/+D0lI5e7PPAwF3UX11xA+SL41FzftChEHk+5j5jO/eFcSx5+JHLqOvVe
         o1cNxSCMg81PSvUpDQCPUlnjjBVJlysG3nopAE+wAKhEIY5VRgfT6tHPI4C0ahZ6Nf0P
         rIeOK6D5qRh1wavCJLrc35lokab5CcCUIjWmGsSbNszee09EnIIvdM1WW0JHEcebbGT6
         L6Y/FVqZayIytsdL/g7lF0bNdKFKWrX1ovn+DiiSgUDJljoL31k2PWjzNIcHYNqeVKdr
         N7BM40jgv1ukCJ4BVlKaYxHQmN2sp8FNNegNb5L39yUgivAu/fo0V86Di6gNchXKSIQ1
         FvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770029830; x=1770634630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T9xirun4JgZY0u+rP7AnHfkkrmrXi9PZys9owwSZyA8=;
        b=jm5xX2OoJ0Q6NZzXNWOPQdQRrctDEsC0vB8UHjhHhDnOR7gTwJGXMYHevOAvg+NkRE
         kce3Tr3CmDJBK/1u3AIjue75YtFFbzAoTuuxsQbFycvO1Ph0AAQS1QLDwp5chdBGEVsZ
         h5P0xQrh3PYIVFVroqGg6zTBGx43xEFhGb28vpKJP+i4SLNwjj23hpAriualD+0puV7I
         rBXtfSOFxs8ApcJau5HaM2Mc9xRkC8s5r1iGGUA2FgL3FwJtbbgdIp8AYZlug9liP031
         /AzFj8IAQDYvyF85HABrZhNBXcE1lDo+dbj6UFNpYNXaq7vj/ezwTA28xJt46yYY5sHw
         w5Bg==
X-Forwarded-Encrypted: i=1; AJvYcCU1k/rWg+C8AMLTPG0JNwMMuThDa/QX686COL2nh6s4BoooelA1cDz2BykGoGG5l7RlcrZiOYssWUM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyX6xo+l11PfXoGvZOfvl+TYAoT0thnYx20a/eT5MhDPN6Et5R
	wu6rdip6OnWggR4LBco5gd5I0CImfHGp+dvWxjB9nS+yTzIE5VqVGs+aQ1jlo/WGHTzk2mMuEv3
	sbso78zGBllHX87Rf1DKGTXQbVVcGbOLK2VQOXb6brrUAzpcOvw4IEqkTY67rNTA4o7BJnAw=
X-Gm-Gg: AZuq6aLATonFEhwJGSY6tAKZiHOdJQE61IzkwHCH/tvsn90HXz2AWqz4wceiCq5b2kN
	G9A5KmNtITs9ePIq/v1A1hkfNF61z1xgZDPt1raWaHvb+oOuuVrkyjHgLMdEIPkRPVskzusyqTp
	PITxGJkVwrm7+EtOZkgnb1PpKa5niI1gEMeE6pOKClhCsbO0ayxmp6utSITshWu4rZ2OkLRFkx4
	glLaHG4bCfx3w4d/3/z0H6vxZ9an7hJFR6RRRsQmSbWJZhWLPJOKEDEUyRxI4eGW4W/GTVptKRZ
	b9zaFVePq1OLcfyJ9fOXzw9KK7MLBiKkhueGu6DPsr9s9p+Tyz1abQVwaOpi1pW/q1z9UqP2z6W
	lar6O1ZvWqqYgCSnNiPz95dEKC8qPj7r95Q==
X-Received: by 2002:a17:903:2acc:b0:2a8:fd0d:ae94 with SMTP id d9443c01a7336-2a8fd0daf26mr59385675ad.19.1770029829514;
        Mon, 02 Feb 2026 02:57:09 -0800 (PST)
X-Received: by 2002:a17:903:2acc:b0:2a8:fd0d:ae94 with SMTP id d9443c01a7336-2a8fd0daf26mr59385375ad.19.1770029829021;
        Mon, 02 Feb 2026 02:57:09 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c4665sm143981225ad.64.2026.02.02.02.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 02:57:08 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 02 Feb 2026 16:26:51 +0530
Subject: [PATCH v2 2/4] dt-bindings: clock: qcom: Add video clock
 controller on Glymur SoC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-glymur_videocc-v2-2-8f7d8b4d8edd@oss.qualcomm.com>
References: <20260202-glymur_videocc-v2-0-8f7d8b4d8edd@oss.qualcomm.com>
In-Reply-To: <20260202-glymur_videocc-v2-0-8f7d8b4d8edd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4OCBTYWx0ZWRfX0lWNLlIUimdD
 n34PRrPEVPlPVZKrtM+tMmpn+S3YwCngYcl803+oFmfH+ivNEwSD95/Wg+BGqUh0xxyNBB4c9Zx
 uPJ+s2OtWyTsOI/UreTGPsrUl9+rq07+cZ/JXgaslH+ljMI7kcQ0q1FXymer5Uq7yJieH+SGtLA
 XVoy0bYsueqsmprj0pXO8fJDYfOCx7K5BSZD/NufR9cc00aQ6yKrHEUo+RyztdQyHR1ctcuialU
 N3tFnNpa25gNuf38F5WX8hp7RltX91YP30ShaFp06zTT5npZ7nwvm1WhnhQLSnwOb28rh0X4obu
 WjwyLL6W8Dbfyt7a98uyQARmgOkBLV4emMECJ82ZS/Ryz8bmVVKURsQrRNHiMnbioYsSFj/rFLR
 ZagD/5HcfXXwYWhccAtH69Kjk9JB0KGPhQo0tCUcL5ypa4P6BqPmKcOxiS1NwvdEOFJQMTaNnlI
 3JJEw9ZsCtJV+NNtVkQ==
X-Proofpoint-GUID: a8w01OGzbUExgtQ_cZEl0uGeduBjG-xZ
X-Authority-Analysis: v=2.4 cv=NOfYOk6g c=1 sm=1 tr=0 ts=69808306 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=i4ogSa-0-Ooxq5hEEv8A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: a8w01OGzbUExgtQ_cZEl0uGeduBjG-xZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020088

Add compatible string for Glymur video clock controller and the bindings
for Glymur Qualcomm SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml        |  3 ++
 include/dt-bindings/clock/qcom,glymur-videocc.h    | 45 ++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index e6beebd6a36ee1ce213a816f60df8a76fa5c44d6..7bbf120d928cc506a4f7aaeaa1c24e5da760e450 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -15,6 +15,7 @@ description: |
   domains on SM8450.
 
   See also:
+    include/dt-bindings/clock/qcom,glymur-videocc.h
     include/dt-bindings/clock/qcom,kaanapali-videocc.h
     include/dt-bindings/clock/qcom,sm8450-videocc.h
     include/dt-bindings/clock/qcom,sm8650-videocc.h
@@ -23,6 +24,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,glymur-videocc
       - qcom,kaanapali-videocc
       - qcom,sm8450-videocc
       - qcom,sm8475-videocc
@@ -63,6 +65,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-videocc
               - qcom,kaanapali-videocc
               - qcom,sm8450-videocc
               - qcom,sm8550-videocc
diff --git a/include/dt-bindings/clock/qcom,glymur-videocc.h b/include/dt-bindings/clock/qcom,glymur-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..98c0debef8fa9d67a2fb86a0e42d6e207ad89c09
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,glymur-videocc.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_GLYMUR_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_GLYMUR_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_AHB_CLK					0
+#define VIDEO_CC_AHB_CLK_SRC					1
+#define VIDEO_CC_MVS0_CLK					2
+#define VIDEO_CC_MVS0_CLK_SRC					3
+#define VIDEO_CC_MVS0_DIV_CLK_SRC				4
+#define VIDEO_CC_MVS0_FREERUN_CLK				5
+#define VIDEO_CC_MVS0_SHIFT_CLK					6
+#define VIDEO_CC_MVS0C_CLK					7
+#define VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC				8
+#define VIDEO_CC_MVS0C_FREERUN_CLK				9
+#define VIDEO_CC_MVS0C_SHIFT_CLK				10
+#define VIDEO_CC_MVS1_CLK					11
+#define VIDEO_CC_MVS1_DIV_CLK_SRC				12
+#define VIDEO_CC_MVS1_FREERUN_CLK				13
+#define VIDEO_CC_MVS1_SHIFT_CLK					14
+#define VIDEO_CC_PLL0						15
+#define VIDEO_CC_SLEEP_CLK					16
+#define VIDEO_CC_SLEEP_CLK_SRC					17
+#define VIDEO_CC_XO_CLK						18
+#define VIDEO_CC_XO_CLK_SRC					19
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0_GDSC					0
+#define VIDEO_CC_MVS0C_GDSC					1
+#define VIDEO_CC_MVS1_GDSC					2
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_BCR					1
+#define VIDEO_CC_MVS0C_BCR					2
+#define VIDEO_CC_MVS0C_FREERUN_CLK_ARES				3
+#define VIDEO_CC_MVS0_FREERUN_CLK_ARES				4
+#define VIDEO_CC_MVS1_FREERUN_CLK_ARES				5
+#define VIDEO_CC_XO_CLK_ARES					6
+#define VIDEO_CC_MVS1_BCR					7
+#endif

-- 
2.34.1

