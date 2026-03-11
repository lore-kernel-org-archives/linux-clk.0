Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25C73C5520
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 09:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773222394; cv=none; b=aGPPH8yeFUARDzUWfmJDoHmB5jSh4cIVnJ9gTY6nM7NDldF7jua6G+6rS20Wso11Ne9db0ymzrPGhmP12pcXy7c94FZkZlx2rK3nVYKOZ7+Plq2IGPTKh4tex64HfLitLDapwwEZviXfCT3ojkjXlo9UqwplrJKiRlBes1g2lK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773222394; c=relaxed/simple;
	bh=IQmLRubc98sYLOJZBs/FSJfKQt2j9qNxxWA76OuA2lY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M0nR6YRNdHLx1nFN63DIxDkNzqs7837x083UvTwSBzNE/aFET5r9UE2Dz2zvZrfHnqVniyxnnrh372SbgX0E9u9LgbxF1gIvR4Ze9q9vc7VjNkUHGB/qUtLUF/62He1GMq5IjzpGlGOUr6NJeOH3ZsLIQ7saJbO+H5wYtYgqt8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ieCr6mOZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S7JXJKXs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ieCr6mOZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S7JXJKXs"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B6ZiQ01439630
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 09:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tWAywvCGHxTAqEWVQVlrk7dlZA/OJH3Oi9lMQj0nYQM=; b=ieCr6mOZ+E4cVJ08
	V6bzprIWIiXuW0j46G2B4XFtuZl7GLIzd9InRRJoN07w9B1XkVpg7758btHjafl/
	H7Za7jIEJEhlX4POOvdKdZc/2+2AiQowXs+fUqFG7I2uTPh3UnmypmaNo9BCxOxw
	IoRBrXqEZra3uGWOnQ0LnU51okvoCVT9ExK3SWAGxQQo1qefk7oO3wDv+xtDNHWy
	XjKdJ7cMM7ADg1Jyl++e5ouO417xTa1/lqFUOCH/QuGgQIuPSHS9EjfcJReAfRVY
	zG1aYkWRbkOGzSvIDHrGc/cQXeAHZu96JdR1q8/ZokE4+0kIKHdCT/rSu78msU4j
	gJCASA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu38ygpbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 09:46:29 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-829b6b22dabso1404241b3a.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 02:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773222389; x=1773827189; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tWAywvCGHxTAqEWVQVlrk7dlZA/OJH3Oi9lMQj0nYQM=;
        b=S7JXJKXsx94iydb1zH/4RagPvTjFc7wh/VVYk4ad5HfksErL0/0LEXXrQKPtVefV/m
         eOijlBIEaWgN7DtbTw0Zj00tpCHFdTT1bIoEq3OYmiS4/M9Tcedf1JbZaQSo3dTcBMgj
         Fi2t9o73stz+yBlpsbWEsj3RErVDy082COX0SmQEoavgMOaq8+C/7W+pg2W50u32eqdH
         +yeCj9mZYCvZmMIMqbRvB4pBz1Rv+65bCrpRZtHip1EDkAAmHR8CYp7brrtcA9z5WubX
         vIzH9DFpCGXhBk0DROmAUtAia4+pYgf20YcXfDlmiDY+T+JMekMbpLo7IHhPD9WGKQWU
         +1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773222389; x=1773827189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tWAywvCGHxTAqEWVQVlrk7dlZA/OJH3Oi9lMQj0nYQM=;
        b=iSDuv8rTa8p05mTH2tavNY7JGKCFvgE/l77RGtHyjZ10rrsRZmGmk7mClQlet9VDR0
         0pMYUsSTEE/M7W7A/avaRL8FeKwpp/us04DdtO/BZPj22jxavAKyFZX+FtC3j6An+Il2
         NfAkFRU/JjDltNZCSAQx3Y/8KDZtdzYz3ABBkpZmzG7c3JvJW8njv7RG2ihsNDu7XuOE
         /S3/NDVpF3VuzOH3gFEW/GyUfQYnagn21g1I1bHxJh7TuLWdNE/zKtfBuKlE3qNkiFEZ
         OqC3aI7EplmIQVkwr63oOTpQuIVd2cAHuovD3xSMXs6ZBGorbXc5q3+J3V5gb5mHhmzG
         5rIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjBJesKdIEZEzgmcZWTiOwZdLMxIU/HAZOdVq3pBtawk1xps7UVjaqnk1174+d+QGWT5nZXYtCMCg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJZI69+MloR/vGLkQJlfp9Xol+SahEOxBF/2SCGaCIbi+fpskf
	YNyxtLnYXBZkLf5r0p2mTpD78vdH+47pNUVjLsQiz7CV6t7qCqiYVZoceUINlmQyo86w8Kys/Jm
	GDqBIiQtvBa0SpTDXSwXSQgTK4X+wwLBxyrYb7GeeIrTAhd11AtXSt0Q4eRjUxPw=
X-Gm-Gg: ATEYQzzHmmbd01ZQ6+uc8RYnjHbFnSBNgCeCxE1uJMvNRTY83QLrEXxiVWszC7WbJUV
	EEThW4XPeelQrzQzY6IkKhrlKOxqfMpxk2Tp6i438i4ze3GsdkxF77QwnziusapbXAM+ApL32ae
	AhXeWEZTie8XuZunex+Lp+bNfR0uiCY9g9b2RO+877jkyzKj9NOZ5N3/O7At5A+0PZZ5PmlFe86
	5GgS2VwlGRF+PIAzd9/2mnMnLZhDhqCvS44r+WSUSe8qxITEc9hNTVOkiBCfAk50YrST7qk0apb
	uk03oEU2NEG+SO1N/X3YgHFYwBSFzA9I4SStS/NvSKQNkIw9Zs059C/CSsDK4yHWoPatf+cL5sk
	TUg8bqcoj7JQitzuRNzitjYG81l0Wub2nOL7vvRj6/Z77Eh2D/lbKqpp3S0OhzbTcawd2lglYaa
	fvkIhlQcKFDecyhqITbRiy6vMIKplN/8+ZCnlJJ4p24gpEEtakaxIqCJPC
X-Received: by 2002:a05:6a00:1911:b0:81f:3c77:a24c with SMTP id d2e1a72fcca58-829f71c2835mr1763997b3a.66.1773222388658;
        Wed, 11 Mar 2026 02:46:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:1911:b0:81f:3c77:a24c with SMTP id d2e1a72fcca58-829f71c2835mr1763975b3a.66.1773222388178;
        Wed, 11 Mar 2026 02:46:28 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6df5ff0sm1677403b3a.21.2026.03.11.02.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 02:46:27 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 15:15:48 +0530
Subject: [PATCH 6/9] dt-bindings: mmc: sdhci-msm: add IPQ5210 compatible
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ipq5210_boot_to_shell-v1-6-fe857d68d698@oss.qualcomm.com>
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
In-Reply-To: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773222347; l=900;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=IQmLRubc98sYLOJZBs/FSJfKQt2j9qNxxWA76OuA2lY=;
 b=9OwKMF0wDQKD28dnxyfTBusxTtAvDuDyTKmPQ4VL0dBcvlZWFztEFq9OqlcRrZDkeya/k5Gn8
 3APJ64QSwWpBbWrkghqziq1rpWICb2jnmWd95rlJgXBMGplAUHqoBmW
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA4MSBTYWx0ZWRfX7WG8jhu9kV+k
 g2d2rQ5UYo6n23eDaA5Lg/vWesX6YJcrnduEpqqUQpWX6AT876ZRBvgYLlccSoI/N/Klmf1LCFC
 xo0gycpu9TGmxTmUrw1ftPazompm/564HFOb2E0hSYTaQUlcIx/nwzAppgS0herjtqJHIrIB3LS
 hOifsSC388cTX6xHRytKAEkMEdPC+umDIJnfAxvwspdK3dDi2DrR6k3bWaXz436BG/UuCwQcZq5
 inwARlvXPy+2KWd9TjiuVDpJVITSYpA2pOXUYN+xdkZMvpOXERyxT+uQToyA7Gyo0r+k1nTl7Wo
 F4LOK0qPvoZGoBYohKEnVhvilrhuRvRuinW60ZHXvsR3n7u1ORAtVY5dVo2E380pLadjC00oKrG
 hJ/1Cl+J2k6UUIqR0fID9ULusqLNNdhuFLA37TpLTVaURwvNENnRP9Pufg/cS3Z5GVDFHfo5YWD
 6+iycwpUWkI4sm83rAw==
X-Proofpoint-GUID: -Yyx82GF5zs6NKDw1dBhxlKJ8uZsBbIk
X-Proofpoint-ORIG-GUID: -Yyx82GF5zs6NKDw1dBhxlKJ8uZsBbIk
X-Authority-Analysis: v=2.4 cv=Cq+ys34D c=1 sm=1 tr=0 ts=69b139f5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=lbzul4gwta_GEy2M20MA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110081

The IPQ5210 supports eMMC with an SDHCI controller. Add the appropriate
compatible to the documentation.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
index 938be8228d668c87f0be95c63d4d951ebbadd4e4..fd1d5b04e7556903daffe86e455fde11be0dbd9f 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
@@ -38,6 +38,7 @@ properties:
       - items:
           - enum:
               - qcom,ipq5018-sdhci
+              - qcom,ipq5210-sdhci
               - qcom,ipq5332-sdhci
               - qcom,ipq5424-sdhci
               - qcom,ipq6018-sdhci

-- 
2.34.1

