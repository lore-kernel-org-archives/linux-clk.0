Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C1D3C2B82
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 05:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789537536; cv=none; b=Byr48XGBYJI9gj5+ymeTezDcbGaltedsuVW+3NQKy27N3G6gPxnxlKPkbvW8IurpeyZEF8uaPf3ZOtPZYgzwog2FAbHVupsS6BzzH/4qyDp+DjFVZi31qKVMADM92zPuauZKUW7pM8PJRs+jcNtgFiadCWy2VqfQetFVLjCzEl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789537536; c=relaxed/simple;
	bh=cf19/syRiwXf0xu5ad6U1c8whvaFvayCmc9PWf9OIgg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dUlTZnV1KN/5G2M4/Gwy1U55Sijj1mG34HsWr3kD0yCmUZaOUPm+9IIZICGF3xWKKl6JPDtMxSnxmQr0nU72R6rB5tucVOqXAXvlcdCgnKEnCX1ukEOblIv8s0ssUbUcEJyG0YNudTDo99RJrSyMBaD2aBVjADnmNcxvT8lSh0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QfFj1OUf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bmhHdhQL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QfFj1OUf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bmhHdhQL"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G5esJG225008
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 05:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WIebQaPsQ0KFySfPxuAtw7
	iAsMbJ/qLcd/CUHpRueRk=; b=QfFj1OUfxw9KJueakiwW7makp+hTfoVyidSKvw
	gZ1+Vk9V1xE6fAV0Zb5MWBuJElLtNDx98d95YfLxcs+Oc40K4uQsDRt2EMdnutYs
	Rxyn/LUDOCOwSJKWdSShxJG+B3tp/Fd7VRYoKn4LioSb36MjTXLrWHI2vUIFauj+
	JFb4vtyh+LBStkAtPlnBlEHr6+3Y8J+hE1YD6kUeKF8fb8QeLOsS0SeC3iam6sj7
	SGqnSzdLgkqSQouyqPf3NUkWDbDnkxPLs9+WGmeguEe0GfAOXqvLEB7f4a2iehpw
	BUipin0E7Rrytzwb5KNbE9od8Uc5GnP/LuLrMK540IoR/xAA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqbmnj69n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 05:45:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39af92138f9so3125702a91.0
        for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 22:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789537533; x=1790142333; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WIebQaPsQ0KFySfPxuAtw7iAsMbJ/qLcd/CUHpRueRk=;
        b=bmhHdhQLaE6dK7oBqQo3y6IgKfXRecyUbwTrhrBsthtWTmDIKWPL7q8H0PilmUkLkn
         X5hcw85I319QaLKJleDNMRkPtxB22xKGd69Tzy2hBMvTit3rxeKjRsT5a0JwzvcnP5F9
         9gZnfjfy4mBs0YilcOV+9DNUIQFOKDQPX/g1vQG+TlwGwwueeDRF5I5BZcPS3y9yzKYb
         UsHPGaz7dnT9gUJcfKGRlnjW9dRFWBnPgxTR5CMKEEdnsJ56Ws+dtLwWu/R1RM0GKrU5
         rfrhzn34wldp2dN7B1sfD9WYvahQYVMr6hA0EweMTqgs6G3+VPWsjIGt5ye3GJiuft9c
         AlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789537533; x=1790142333;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WIebQaPsQ0KFySfPxuAtw7iAsMbJ/qLcd/CUHpRueRk=;
        b=XFyrGEGWTuG+nLxewqcZgXJaNBd3Le48gl1ZXuFkK6lX8gr+4Q+E7N1rQbcNIrVSEB
         4KOtR1w7+oZw3fgf1ji9X3oNbPV27d3T4MYZ6tsrUyJv+64r2y00R/x4Fh2nDDozkYx/
         u4Y2C20KfIIRN2ydn1llbvFLZcmsnhglAWuY/O/9O0/bXyq5oVKr4pJs7cziVXmYv8gd
         NyU8qLwJbzkshaGWDOJt3KbUelB2IotJQPuFGCV19gqgswKsl8jDs//iyDdUOukgaLlh
         Vw7oP+TnnHAw9Rtc13Offk3JEn1w4cRRJSKjVVc+AmaLvY3siDwwcdax9MDXKIBUezXV
         VS6w==
X-Forwarded-Encrypted: i=1; AKwUvBwsg2c00EgO0s+8Kq84Hgded3r5Bs72iicZQBFxaz06KYrT2g2l8O1YSNMWe1pRHcl83AC5DovQoW0=@vger.kernel.org
X-Gm-Message-State: AFuF++k5z+As9WsXRWgYUF8HPjmA3qpQjyNRT7VgD6+ERszm1IAFBSur
	O7EKw8wZSp+H8IUdTdUgXr3HAQgmqWPDpZ3M5kBQnUeEznNcDLeZeauKvnF66KFslY7ofnEgra4
	4w7ueQlI6DIHvkRc3AHIKB/EYz68i5izYwlASxdOTP9dygilK/jzU8UQAbDGQTlY=
X-Gm-Gg: AYBFou0KrTsrnzOG2px95vzRoaYD2W7a8t02I/dQLA7rxVEstnGug5OMQ281NYh+W3t
	2Nojib7cIrI0+OKRoby4QvJjycUIRBPMz2e2E/lSqyMeeW4vTf9/lDqIpS0NE7xQawUfaUFdGY9
	6Cn+c6biN+6Arp1SB20KxrCJsRE1wxMwVaou/C6KxU/B7wQyEMG2JjZ12DV5d54k0YwLaq6GNCn
	VYdRvKToqsnKD9x7YPIFXN4m3z8OOnyqdBp+Bu1Ut0SS/Y7tUCcP/KCt9FID8asFXl6yyxFqQIM
	6n8x/BJKyp/mOVvVgu/qFxK+pnTp47JxPOVMAyCmqTYYK/Mt8IcEzo1QnXSbZDnw7iE8MeFro42
	LiDlDKBTR7f8STVQo5VNKQuLh/0X2iFk=
X-Received: by 2002:a17:90b:2f46:b0:39d:e445:1d44 with SMTP id 98e67ed59e1d1-39dfe2139c2mr10785071a91.31.1789537532663;
        Tue, 15 Sep 2026 22:45:32 -0700 (PDT)
X-Received: by 2002:a17:90b:2f46:b0:39d:e445:1d44 with SMTP id 98e67ed59e1d1-39dfe2139c2mr10785016a91.31.1789537532106;
        Tue, 15 Sep 2026 22:45:32 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b030aesm4357492eec.26.2026.09.15.22.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:45:31 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH v2 0/2] clk: qcom: Add camera clock controllers support for
 Qualcomm Maili SoC
Date: Wed, 16 Sep 2026 11:15:22 +0530
Message-Id: <20260916-maili_camcc-v2-0-f30b394bfd50@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPIsqmoC/22Py2rDMBBFf8VoXQVZT9ur/kcJQY9RPRDHjeS4K
 cH/XsledNPNwB2453BfJENCyGRoXiTBihnnWwn8rSF+tLdPoBhKJpxxzQw3dLJ4xYu3k/cUZAz
 G99Kp3pPS+EoQ8bnTPs5HTnB/FOhyPP+YRVGJinX0YI32G6l00HUGhAOnhlVUprMZqJ+nCZehA
 Q1C9aY3xgQtdQThqz94a0IQPDquglRRkmofMS9z+tmnre2u/3fF2lJGWRtcKBDHjX6fcz7dH/Z
 atadyyHnbtl/wsvYBKwEAAA==
X-Change-ID: 20260727-maili_camcc-e4fd7c94b59c
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=POyaavqC c=1 sm=1 tr=0 ts=6aaa2cfd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0CEgtgGPtVrRcqxqxNIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA3MiBTYWx0ZWRfXxL8jpUdHdquy
 bZIPoqdIaCRhKkZ7M5r5rH66Bzf/7kj7SVf1ySHUqHfaD5fzY2Xw4izPPa1RMufoND0F58oZxs0
 30kh7Sx3Aj6zR7ja+DgfsOzk5hESnYbw/tbVwSRRmMRXidys4zEWvobBD2DaUsLANec3b/h87jM
 5F66uLevz6Orbf+CyTS10Od7z6KIWdziQdqqs+K/ms+vEmjrK9Fl6HuQYHxwl5UAUmLngiCeYrk
 8wM6UnelEW8rYtr8oQsVydYvTpyVqYnl5tvmLwSXFKF4Jihx7gsxw4u1EXS3FliZRFZTqU+85GV
 7EhNqKMyJq3nHDsL9V9Y4iszYn422JWw+hXJgcUHwjXI8txhx+9vBr3P5PLbFc5fp6OqEreZHfw
 /Qpi/kKy8sV3jNA4nWlndKy78UtWNBg6Edr2xzP1SDx7B6pII5Zdl1IKEfJvjDgMEP4Hz8XNFuC
 wkrYPl/8aMGgur+CbpA==
X-Proofpoint-GUID: G9-aTeU5YB6zLQidB8plKjT3XvPmgh_n
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA3MiBTYWx0ZWRfX9bHsoHIWelDU
 zODsQBZOzvMQuKp1jfX2de2anqmT2r5yKLtUgW8RmYS5XGL7eyOc65fE0aWOp1UvXd1v3gbHHi+
 3wbtypEuCPS8dsU5qqi5JSfzpH5RjzQ=
X-Proofpoint-ORIG-GUID: G9-aTeU5YB6zLQidB8plKjT3XvPmgh_n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160072

This series adds support for the camera clock controllers on the upcoming
Qualcomm Maili SoC.

This series is dependent on Hawi camcc[1] clock series
[1]: https://lore.kernel.org/all/20260915-camcc-hawi-v3-0-5b57f45477f1@oss.qualcomm.com/#t

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Changes in v2:
- Rebased on top of latest Hawi camcc v3 series.
- Added interconnects as required property for Maili camcc
  bindings patch inline to Hawi.
- Link to v1: https://lore.kernel.org/r/20260727-maili_camcc-v1-0-01dbd7ddb276@oss.qualcomm.com

---
Jagadeesh Kona (2):
      dt-bindings: clock: qcom: Add Maili camera clock controllers
      clk: qcom: Add support for camera clock controller on Maili

 .../bindings/clock/qcom,sm8450-camcc.yaml          |   6 +-
 drivers/clk/qcom/camcc-hawi.c                      | 158 +++++++++++++++++++++
 2 files changed, 163 insertions(+), 1 deletion(-)
---
base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
change-id: 20260727-maili_camcc-e4fd7c94b59c
prerequisite-change-id: 20260508-camcc-hawi-4be887e3beb5:v3
prerequisite-patch-id: 8c5a0dda9a4fb4eba4995d9b858a14bc6f823df5
prerequisite-patch-id: 4a39635ae96cc5ef0c8e385ea600cf75ef71ebdd

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

