Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D19C26B76A
	for <linux-clk@vger.kernel.org>; Mon,  9 Feb 2026 01:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770600752; cv=none; b=SgbujnGJ2Aql1uClcPsid4asiWtlM6V/VXiRMHCiZY9ZXjKVzKw1OJfoMhqXZYUn73S+Nms6A0RAIfRIgNI8NaYQsIQ0ZIXBjZAOd55kgC+AeFdoQW2MjKdn9t3Rjfe1BTOZIc6M2BsUIyPGZ1vsLmOEb+2VB2Puv3w4uv6Z9JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770600752; c=relaxed/simple;
	bh=cdkH4r60jOPOJkSiWE06hN4GpLLJV1Ghf0DSpZ1LGy4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iQbublsekDv6j5WZ/2inz/y3yu+wy5K5WJT23k1dwGUxjMW2ZjjUhRGBhAH5VkqxkDbUjUMgoTKCbQVvDiKYDbUmHNkj7DgO749CDtrm0uBUqoJZVXtLbR4un9C4i3LeUFa57U6ZcB71mQlBYfwY7f/VvWqlkyvrML3Ryp5KPbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YO3kBm2i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O81tCi2i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YO3kBm2i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O81tCi2i"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6187sYTf4138083
	for <linux-clk@vger.kernel.org>; Mon, 9 Feb 2026 01:32:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mDLM7sJ6XFM/84NtOhABm1vOwO7CtHfCj7ZLvtwA33o=; b=YO3kBm2iLpz1dcav
	6f/yxiiVwffu8umGV3oFi8qdO292R2XF0bDZhG1LUtBbzP78J+lW9nC9Tpt5zPag
	X3h6hZEADdt618/XPk+FqeYpbaXzXXcLqP8LadMUNqKg6Mi25S7+HbzZrqK6Zj1I
	e/s8jhQBDLX9YpRtPb3m80BXzM6MlAnurS2BpU5Odcd7lxe+z4XzJd4TRy8kekIp
	yeAdkusZhPCyCHf9GblCvNJ5Scqwxz/tlEj0bwFa15IBWsTwSkIgTqiSg7q9pNhx
	+mHl11WHG/9Hv6wlD8q91jr32I+kAbycmaEeY2vGhooQP0yA3OiTH7GfcmvQEM1k
	wWykMg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xhrb7fk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 09 Feb 2026 01:32:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6ae763d03so413952685a.3
        for <linux-clk@vger.kernel.org>; Sun, 08 Feb 2026 17:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770600750; x=1771205550; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mDLM7sJ6XFM/84NtOhABm1vOwO7CtHfCj7ZLvtwA33o=;
        b=O81tCi2iDtE4cu+pZb4ADhIYL689KRypLUGleE5rbYnI36LiqNRwt4Af+/iSJiPXFx
         nVZI6JANIIb1gsia4YHmn1QmjZfe6a5PpmjymOzQcKgIx5y575MDpF0x5YJdh+xxd9x2
         CvHgysocbGKDOzb2c+ZChQ7MDIHDBBIXkxGQNYckoZaKKEZ5htoHdqJC+0urtNGn/mJb
         LqBHTk6pZzy4MfQmWMh4zEsBIw0J24lenAfHGZqP1L3qTvwKh7LROJcDpASrxX5oMaLO
         atEB2/bJiXYckcHbKxBNU7uCrbbpMqV5mEb6FlD4OSfbztOSn5TJqt+NUQU+9HFXynwn
         1lqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770600750; x=1771205550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mDLM7sJ6XFM/84NtOhABm1vOwO7CtHfCj7ZLvtwA33o=;
        b=Bk4EcnLnObUwfORqtkE4GTAaY7LbXZBu6Kim03qDsLhf4FLBVqmXIAL+Nbtsjya6Wr
         Uy4BlZFN5gUTP9LMQ27emUJ+foKAanYKMRokFGdqX1Mlk9fHoERERsH3imMghQ4saXZN
         y6EQNyGfSivOQ3DClkwFvAWN6ZZg8D5X52EuCVeTCLdvo6qB2hT+/F2G2NFOWufUX3Iq
         eJxAZVelL09FPOUHEn7i3bVA7y4JrOib3u7ejhMbfbkbuc7/wIkFpHF6NDydI6gC8SHa
         S6gb5jHdfLNX1B+rcrapZeJ9fRhioLcdq140nZz93VCasZXhHNBJgA+eP2HtE5eY3cns
         sw0g==
X-Forwarded-Encrypted: i=1; AJvYcCUPCV9hgU3Bnmvt2TUdPbldvWqb3vGqiPtiW5nw0Fc/EHmIkfdTvCd64PuooPgjeLTpbThwWv1xLQg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwwA/P3WtzpGLXP1n/VNHIFqHO20nAWFKlm3PNV1ia5JdrwaTe
	Ve0ytlkNMo/+Ys8o/XP2IhIpF4vJq/x+8mtRur1IsiJOmZwvp2ODqrr0xwK5Um+w3b5DN1Di3NA
	zMnXDtl1xxyGQAuykW/RfowtZzGiFZe7Sg0/ybHMMQVASgdR5mDcn7oIruYMyV98=
X-Gm-Gg: AZuq6aKYjsFr2K7+X9hzOJ4qWKHnLsHOuV+E/3b+mfVoRcUnr2ykr1Nb1I/6cNVFFVR
	P1SfKgiplhKS520Jo+U4UnnXUbflffhvfGmq0ULE27OpFtvSOaG8Uj9dXh8CVgx61gsZthtPO21
	yEH2XOLzkIFS3gEX2N/WT9p685xGIykUusYNJ5DigaFHS+Tj4Sh9munsSl4IQes5dMh8eDsLyz7
	iqxAlxzNySjnVuIKfG9of9pp5gtlIoZu2jf3mzA+Qx5O86KjC8TThwuW6FsdXqbx4oV4A2lVV8f
	6MaLKQv6g+xpUHy0uroaaI5DnTdtgiM3KqOpT/01jD2exrMZDz3J2MaTF4NSJlFna6H1NB/PoJU
	QtoL4QYywl9B744+OvDzoch/V7f23htBil9WpsgpvjbbOchc9HFHeezIvGOetfC5cFNlagCz+iV
	uAA5ZpYJipGaioTHKyq1H6Lio=
X-Received: by 2002:a05:620a:bc4:b0:8c6:edca:1905 with SMTP id af79cd13be357-8caeeb4f4dcmr1376985985a.12.1770600750337;
        Sun, 08 Feb 2026 17:32:30 -0800 (PST)
X-Received: by 2002:a05:620a:bc4:b0:8c6:edca:1905 with SMTP id af79cd13be357-8caeeb4f4dcmr1376981585a.12.1770600749849;
        Sun, 08 Feb 2026 17:32:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-386b623668asm21688601fa.3.2026.02.08.17.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 17:32:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 09 Feb 2026 03:32:16 +0200
Subject: [PATCH v5 1/5] media: dt-bindings: qcom,sm8250-venus: sort out
 power domains
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-iris-venus-fix-sm8250-v5-1-0a22365d3585@oss.qualcomm.com>
References: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
In-Reply-To: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1867;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cdkH4r60jOPOJkSiWE06hN4GpLLJV1Ghf0DSpZ1LGy4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpiTklknK4UC6+q6RklLtLmoK9tnDMZ6BcI72tr
 XGb9YHbpQiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaYk5JQAKCRCLPIo+Aiko
 1bbVB/47qW12WUXawzBYD6QHzp3DriLgjOQujfeeY5275HLPA952AtPFvkZvGfgXEjJAc320RJI
 6MNt0Ek+PBtZUMNBMu5N1UDZ1KdKoOVEUj4C3mVflkJv2mvl8fEPbe7r6CjNd5Fa9nOnjWthrrW
 ehjc4JslgwassXNVg4bLU3TinRDAl7jDfnJToeCcrRXa61VEXvW0Tl6SSNTgaeEhBSM5VeHkFkC
 tQfdqdKszlsA4WOcgQTJBeS7DuRYObYFecXvNvyQXwJu4K1zxuhl6gFoNl0rszOWBSzdiqv4YA8
 vBTEAO1np6rN7rICTeKmGxvw2CLcVh19JCeZrJIFSXp1zTE6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: bnrd3VYU2_Cd8mzn-awH5VBbQXkfScZN
X-Authority-Analysis: v=2.4 cv=AJ+v8NAg c=1 sm=1 tr=0 ts=6989392f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=LJIQitKNcm_3rt92gHIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDAxMSBTYWx0ZWRfX4dokoBMml/j7
 ty4NH4QkOQb23+EON1+yZBo5I+qXlZGoVCWoDxI6/C1YwGMOLOjwRheLy8hn2E1tyxKaAJCmjc5
 0dSNnmnopyaPP7dOubaCtc7ZE+egofPLW91L+IwoUERPr0XRtpJfl0IurfRuQ7e5XRkwwUDBJIq
 NgJydUhdWKfxB50eeU1HzZfMoAdWAoTX6Oyn0okyZpsrz9d74zyoIPg1Hpg0EESe05kHDuU7zOF
 vwzhrD/yGPio+2J6M/BpYIwOqvmdIuNQdDlKMQNTRtYBnfqx5iZBFudJlEW18E52ltsuE5olWiF
 awBvkVi2D5uIxay6lxliMqjwLQL2WidC/n79Mch3v8fgBNC01jdLcMu1aXTRk0iZitpM0c+pL0f
 swU4R/zWM48RKri3Ua4ESo5iBosI+F8uMj9tdKlrU/ronS9SKsdr5xFr/5vl7AktBc46vg9JDD1
 U9Skk/q9GgAZAxEZA/g==
X-Proofpoint-ORIG-GUID: bnrd3VYU2_Cd8mzn-awH5VBbQXkfScZN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090011

First of all, on SM8250 Iris (ex-Venus) core needs to scale clocks which
are powered by the MMCX domain. Add MMCX domain to the list of the power
domain to be used on this platform.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sm8250-venus.yaml          | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
index da54493220c9..43a10d9f664e 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
@@ -22,7 +22,7 @@ properties:
 
   power-domains:
     minItems: 2
-    maxItems: 3
+    maxItems: 4
 
   power-domain-names:
     minItems: 2
@@ -30,6 +30,7 @@ properties:
       - const: venus
       - const: vcodec0
       - const: mx
+      - const: mmcx
 
   clocks:
     maxItems: 3
@@ -114,8 +115,12 @@ examples:
         interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
         power-domains = <&videocc MVS0C_GDSC>,
                         <&videocc MVS0_GDSC>,
-                        <&rpmhpd RPMHPD_MX>;
-        power-domain-names = "venus", "vcodec0", "mx";
+                        <&rpmhpd RPMHPD_MX>,
+                        <&rpmhpd RPMHPD_MMCX>;
+        power-domain-names = "venus",
+                             "vcodec0",
+                             "mx",
+                             "mmcx";
 
         clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
                  <&videocc VIDEO_CC_MVS0C_CLK>,

-- 
2.47.3

