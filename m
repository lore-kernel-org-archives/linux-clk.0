Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2808023EA8E
	for <linux-clk@vger.kernel.org>; Mon,  9 Feb 2026 01:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770600748; cv=none; b=XmIFJIZZ/RBCht0ObDEfJkv44GjQoJIQu0+IUoXYVFrR+HFpWIB10GXDNBAczB+A92TUTF6nCNg7uynT6NhdaPvNC0aV064dzsRLEesl8kgre1BpYm211gmPTg0y9EhJ8V2uk83NYDicx6IrRWk1fOKRsYT6/2NbVdIv3UXBm6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770600748; c=relaxed/simple;
	bh=67IDexaWLg3vptMF3hQy2WAlwLpBGtXoefLsLMJT6KA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Bky0viFh1BtOPjOyddZ8BidATJ2CH5je93uaht413N3zCXczqUpIyiUspsTwJ5pOhZQUBH9zsu5B2z80s2/yGJ7ODHzOsYa21PKeVCoD97V/+I8aObLH+VuZQlQlGZ7003nqxHF9ZMbAIFgPrSbuIz7gYN172FkRpISF+sdZNEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nemKrVX5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XfWeNlul; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nemKrVX5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XfWeNlul"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 618MWilF1672933
	for <linux-clk@vger.kernel.org>; Mon, 9 Feb 2026 01:32:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=roifxvws8lDY40roD45/Sk
	OpLLr/pMVs8PIIWTGwrVg=; b=nemKrVX5idGxZwhu7nxrFpmCi4kbcKWcxxt+0d
	yUjze8BGTDWRPW+096jbViCXAhkWwbIKv+oFG74GcpWEM4P2ciFThRKy/yR7Jzsx
	MqILJ27qPNS0ud6AsOMPC7i5J99N8OsHiSi4fwkZgLyyab1hHRwdSqu4ZI6h1H1V
	IxgcXGK7wXnoUo+mK6Z4pDKwS7LpRIyqLfx6JzuWQ1k9eGyQmZS91hz1HFQz5PmO
	c5t9m0PhXoVKxEKUmIiRHi/LJZML3QlOVB54qb/rKgG6vYgSNBDE09bh9NCA/zbN
	u2NyonUBtiqgC6QFYYqN09NZjZZR4SP9Mi43syTGbfaL63CA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xccu78w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 09 Feb 2026 01:32:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70a62ca32so1169773885a.2
        for <linux-clk@vger.kernel.org>; Sun, 08 Feb 2026 17:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770600746; x=1771205546; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=roifxvws8lDY40roD45/SkOpLLr/pMVs8PIIWTGwrVg=;
        b=XfWeNlulV+TFzJTcDFKgP/6Yp3VSKwMKmmaP5J4nAovz/CJYxE02s1c38W5vZCHrfx
         RBWJrmwAevm1LC3IAO3KPeQiC30ptg1AKohbUrOp8YThUMLWj/RTljsU0Ye/7ju/KeOY
         XxQoa7cak7gB5QPUPX18kE2hoChn61nfF7bXE4CormV5jvJzmILdJPS8vrEfDq5LGMS6
         vMf8FeL9CIKy6/vWmSFjy95qrHyZVaBrvgPiU0wEPLdCYXZPfyUTlPr2yN88ZmgYn7xx
         N7hyCU6RBbF5okbud3MsNZ+jVpCIPu3QMyVwnRVoWQgQkrJFFbBCpCI+UAfhAHz8qE1o
         x1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770600746; x=1771205546;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=roifxvws8lDY40roD45/SkOpLLr/pMVs8PIIWTGwrVg=;
        b=qdmDlzVBme25EsQ8276M52CDv7SI8LUzfmYADL7ufNrsYbib0ePTVu18XtknmnKpRO
         eJDZzlQ5UUyCh8LkGhATNavzTRxfEKrg+WJGFQulbz29va7Kgb1sDghSnTnlspaEuV18
         +rTRAzs7g0LfI47kstLbfy86XTO+ufmfskcJgX00hbEQ9nFUY1g1LFtlNFbLdpVRq2D1
         QCBr9c4t2AAfcrJPegrIYFmo5KhrMy2CdijyZkOykodWh/1VGZJ7afSyFVXOw6vfJbYs
         ahEf847vEMrNmi3fI4Ab+UW54ydsV4k5YfTAfwAfe1ehyIDc9esRZCw1Q+FTwIZ3h6Vc
         wAaQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4dw9WXpaQq8mjhMBdDIvM9c5MM2BVJExEMHBUIQ7w14v37NaHWyAVVfV4TGSVadOOeb+1aDE6Stk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKqi4DcrowhgaUwECT/9bFihL4ypiTftLQVe7jxT3cYzV6Lins
	GdbmK638pBqXiz+9jWgAgQROpNh4hfSZevZYZeKBkWvjV2cGlQaykrbWKnKMnz7XpS+wrip8Chx
	faBEoxVfSqzrbVmQmmpniIlzhARV+B2ShN4SJlhAaBEe7bOHqZ1ZqG41hkuRKd7A=
X-Gm-Gg: AZuq6aKFtTp+rd0dvkWmg/sLMILHfUZZG4eU+UGJuBppzX+kr+y9GkRadGY9WCJNSJo
	FY5Zr2MQIxEjnPFgV3zBdwQbDv/T2bE3aW81EsTHch8Su21wZ8byna2q8F20ZljT0Q6O/sOptMS
	ZIFNmxbPt2Uwc2LIYqY0H2s86fkCDd0v9a8bGR3MuegKbIk3rVLOBg03sL4QW7T9fL6yqDd2jU/
	xjGpDxjorFZV88FdCT8xPSBrmtHey3MhNUHuEnpF+G4Auvl+sRjG8ViICm4LoSQJJZCSPNJS/z/
	RcgMRIZD6efIFjkuW62rDTa96gkTF2bkNpGOIYCdG9vmlIiqPTLin5sMZRvglpYMAcaFQz+/rUH
	LKRiC5WgUfRPATiwn2WDV3e8+muU35eZWI+i7l5MTVRPVKDul8RdXRY8bhDOFGQjvt1NvY59g2g
	/rt86Lr/2JulLmlvY9ZQpZunU=
X-Received: by 2002:a05:620a:46a7:b0:8c9:fb65:7f0d with SMTP id af79cd13be357-8caf058543dmr1408592085a.28.1770600746519;
        Sun, 08 Feb 2026 17:32:26 -0800 (PST)
X-Received: by 2002:a05:620a:46a7:b0:8c9:fb65:7f0d with SMTP id af79cd13be357-8caf058543dmr1408589285a.28.1770600746057;
        Sun, 08 Feb 2026 17:32:26 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-386b623668asm21688601fa.3.2026.02.08.17.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 17:32:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 0/5] media: qcom: iris/venus: fix power domain handling
 on SM8250
Date: Mon, 09 Feb 2026 03:32:15 +0200
Message-Id: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB85iWkC/4XRS27DIBAG4KtYrEvK25BV71F1Qexxg1TbCYNRq
 ih37zhZNIta3SD9MHwjhitDyAmQ7Zsry1ATpnmiYF8a1h3j9Ak89ZSZEsoJqSVPOSGvMC3Ih3T
 hOHplBR+C9qACtCa0jO6eMtDp3X3/oHxMWOb8fW9T5br7n1glF/zgtAVwTnnTvc2Iu/MSv7p5H
 He0sBWu6hdTYhNThLnBiJ7KbOfDBqafMbOFacJaMUTnwbZDcBuYecbCFmYIC/TCKEwre6/+wG6
 PgWY4L/Q/5TFVdogIfC1KZd9McCmvY8QCmepvP94qJ+HXAQAA
X-Change-ID: 20260131-iris-venus-fix-sm8250-f938e29e7497
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2425;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=67IDexaWLg3vptMF3hQy2WAlwLpBGtXoefLsLMJT6KA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpiTklUbnaPvibNxrgi+8RGWZgRaa1HIpje/c7S
 mOQzxfHDwCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaYk5JQAKCRCLPIo+Aiko
 1RXFB/sFWiDDzpfu8SYQBb6v+UxGfY+7B8kI8+EAFLMkmkX2CGk4h5d52FKtglS2oGrnPOWPj1J
 Y1v4WEt5ylPYJhHFGePTJvqr0U9K9Hi+Dm/FcfyV7I3CZzfoGd53F7TyN0nv5I9JYgHeIF418+I
 BfQewWLrAAlRH5OlL9YlbEGUpo0FhBdARjtF95UkP50NtbicxuaGRO28Lk9AxFFcDYEFnjJmpli
 jGtDWaTYWn2fId+g1PQUTqWjMyQnxKB+DlADNZR/oB57uNxnBxGA+2UszNRiaH1MUKxMpfWOJNr
 gLM9yDFHpJthiKFEG1pZ9gTHwZT61vg5HBZmd8/TIIBExiao
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDAxMSBTYWx0ZWRfX2LAE3eQmu5R7
 3KOzXZz1Zi4N0/Kgd0TfHmcHibLLvh1ivwiQNJ5v4VSDkDlw1UdGPQz6LfG3m8yZQZiX81N0+n3
 oUgen6vxGHdUkv6gj5/ji9cDNxnp3+NZK996IuWJTcW2IrbNUttBxkp5nqajhFCQUqtwIKdZ6KJ
 rLqm/7YpgehmBgjF+KKdpiZsj/ioFzatcBIXyQTGLI/J0VLhdLSPQu8vw5/0o7Oqt9piuiluxmH
 157TfBVGd4RGdu9VYH5hGBKK/34iJNrZHxJVKMO30AAKKxfE3U3PGJQow/kJYZFEQZmuEcEeIoh
 EW/B1kYCM1QPNPn2JzAvxJZVNGxUEgJ6z6n/CASOpx1zdyhiq6BTJTk7jYyClLuWfYC0bWGoq2+
 rEMVh4rY/vi43gQV/WgGBqi3quMUMuhlS1/wZ8kRkuJAUV8PSTIqiP3a9QG+5jKejsUdFEoJ1ri
 dgwg6pvstRHOzL8Xrrw==
X-Proofpoint-GUID: PxDwa5gWwAeMcQo2pvzVTzjVzvz6a3MB
X-Authority-Analysis: v=2.4 cv=ft/RpV4f c=1 sm=1 tr=0 ts=6989392b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=cvYA71F9yvrgsMZaK7wA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: PxDwa5gWwAeMcQo2pvzVTzjVzvz6a3MB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090011

As pointed out by Konrad during the review of SM8350 / SC8280XP
patchset, Iris aka Venus description has several flows. It doesn't scale
MMCX, the frequencies in the OPP table are wrong, etc.

Let's correct the Iris/Venus enablement for SM8250 (unfortunately also
stopping it from being overclocked).

The videocc patches (DT, DTS) can be applied during -rc, the rest of the
patches should go for the next -rc1.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v5:
- Fixed maxItemx -> maxItems typo
- Link to v4: https://lore.kernel.org/r/20260209-iris-venus-fix-sm8250-v4-0-9662a0471d82@oss.qualcomm.com

Changes in v4:
- Dropped MX voting by videocc: it's almost-always-on (Krzysztof)
- Restored minItems for the venus device, preserving the ABI (Krzysztof)
- Link to v3: https://lore.kernel.org/r/20260204-iris-venus-fix-sm8250-v3-0-70fa68e57f96@oss.qualcomm.com

Changes in v3:
- Dropped applied patch
- Fixed typos in the commit messages (Dikshita, Konrad)
- Corrected MX OPP levels (Dikshita)
- Switched Konrad from Suggested-by to Reported-by (Konrad)
- Link to v2: https://lore.kernel.org/r/20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com

Changes in v2:
- Fixed example in the new sm8250-videocc schema
- Link to v1: https://lore.kernel.org/r/20260131-iris-venus-fix-sm8250-v1-0-b635ee66284c@oss.qualcomm.com

---
Dmitry Baryshkov (5):
      media: dt-bindings: qcom,sm8250-venus: sort out power domains
      media: iris: scale MMCX power domain on SM8250
      media: venus: scale MMCX power domain on SM8250
      arm64: dts: qcom: sm8250: sort out Iris power domains
      arm64: dts: qcom: sm8250: correct frequencies in the Iris OPP table

 .../bindings/media/qcom,sm8250-venus.yaml          | 11 +++++--
 arch/arm64/boot/dts/qcom/sm8250.dtsi               | 36 +++++++++++++---------
 .../media/platform/qcom/iris/iris_platform_gen1.c  |  2 +-
 drivers/media/platform/qcom/iris/iris_probe.c      |  7 +++++
 drivers/media/platform/qcom/venus/core.c           |  7 ++++-
 drivers/media/platform/qcom/venus/core.h           |  1 +
 drivers/media/platform/qcom/venus/pm_helpers.c     |  8 ++++-
 7 files changed, 52 insertions(+), 20 deletions(-)
---
base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
change-id: 20260131-iris-venus-fix-sm8250-f938e29e7497

Best regards,
-- 
With best wishes
Dmitry

