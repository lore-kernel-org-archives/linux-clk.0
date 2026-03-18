Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012F32206A7
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 11:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773832132; cv=none; b=nwnzttSOYEg7jQJUS9wlY5qV4owEURklqVM42WX4ud0ZAnfJYRP50S082KLcsvFpZVz8yWsf2meNEF1mSBdA6Pf6rz8SFqZoJjn8vg4c0bz3ZXuZszurBeG7zqAUI0kRuvzV6/nRbEibKxAO+0sgUFv0XEAjo/SoZN27+j24IHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773832132; c=relaxed/simple;
	bh=HkHhXrqMmiFyx1YPTM2JfklSww0Bi7KnBOXHoYhSgn0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BYhycuV2o0nBPjZoFT7eG6KMWiqFM0L5OHC6SONmPHNyQhsgO1CG5s3w29iVgBW1NZi3XESFWJiBr8Vd7bHlTu7I5oXmHMpZ1Jv1TJEYzl0EQDoE0KlqBq9d1gznQqXjEiZxuPqrPcW/cDJ9JxrAO6zLs43p0zLFMvPdrQbrfzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jYwM3HrX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jtFaE/Ul; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jYwM3HrX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jtFaE/Ul"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I9VukQ402134
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 11:08:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6P/1d0NQU/iMLV/r5y251q
	GYem5RUiR9rUnsuv9NHS8=; b=jYwM3HrX30PQvx3eQZxJEY+9njS+FT/cwicGC0
	BOf4qe76PrjSFKqsRqDG4wmY8IBu/xSHgfDIiZVsmiL/o4bcYSPgTIJBV45hqSZn
	0g2MDf35l61QUSEBmwIlvWjRwvl1K7+83Bz9O3Udgf3SyFA5Q693HbeeCpy0ncwZ
	TaeQnhh75h8/NORxRhaXwSKtjx8MkdfADLYggBcqx4nSsvRPpGrIa+uDOLn7HNBg
	OUFpEtMuNdQ6Q4l6UaiucnrSypL1GWEsQCIpjENk0H0OS8EwcNw6tdb7AIm+xZGw
	ibkZwbBR2l7opseSy0Za0923MyXZ5QmT8nzSP3nRQgtES6xg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyc4duet2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 11:08:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5091ee9f1d8so58680171cf.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 04:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773832129; x=1774436929; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6P/1d0NQU/iMLV/r5y251qGYem5RUiR9rUnsuv9NHS8=;
        b=jtFaE/UlPuN9nyOj526kR0zhvQM7EWo6bI8HdxfKYyqBsSlKqSz3zM5ManG/s5KEKv
         W34dXMA8B2kFMKenZmELC1SAz55fv8omh7/E8u8c7wcJZSI5hkt9wiS+10vfCxmrD3LA
         7SrdDh2CAn+EYaF5wyQvj3HV/06afX0qsu7rLnlKfBDwZOOTbuT4EG8iJ2Nv3wLVlb0M
         9WKXpudSoOUkGKfanDW5Sqs+g8Xy5vTlXzstAMfn8IZh+5hcyt5EhpGGY5Y1fDpT1czs
         ufW9OrzDNAdZYWzl65YjodyWkba5usNuzjYlSL8bbDpvP5dGNenom9xQXlnzoDa1YYUC
         sfrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773832129; x=1774436929;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6P/1d0NQU/iMLV/r5y251qGYem5RUiR9rUnsuv9NHS8=;
        b=jzBK+NSopFJ8diGsHt+48W78rvQrJQPQo1EOCwY+/KJgX9L2jWMCCL/njd0M0d92jJ
         WB1z5fmVeNmCDdSxsmL9E2+LA/p23yV1rb1A1+bdDAXT7q7JqqfZVE3DfLDYLU1ihbEc
         gFQlkxe/qCE6f6QViOpwNjl23rBx0Gr4pwqU0Es14yCUzcIeJf0M3CJWn0smRyeVokgN
         GwiO3XJDPHCV3qmgIC8X4YDOeq+DFQsipEX7PxRTh5/Zo/HfsiJ3Ryu+kkdwlXyKdiI4
         9/nRmXnpHwNHj9NXc9QU01bRYKECaIZgeZhwF+IIbstSdkw6twi5GrJtV/EW7UgrIKec
         rTCA==
X-Forwarded-Encrypted: i=1; AJvYcCW/SJgXdxqOkZ2w+o+JlPcPcNzgUKdw89l81v1UNTC5olq8O8Ts3v1LwnHDj88vBYTDE/JCpOCl7H8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyAbTePREfRE21H93sqTLD0UON8AIOdXgj5nqNRDwYm+v3lbQd
	7DKl6C86+FW4zsueM7I2yfk4DkCPHYgeIImGR3+8k5cjwGepJTYxbhJtIPgpfURvL11ZscNqeHT
	cQRa6M9SQYe+hkVlBrlNgh4jK6Wfkf5821C7WxGR2vrHAaL8aM9I/wqve5+YSmGc=
X-Gm-Gg: ATEYQzzK3VamNOPZagDii+GVcQsezTj59KaVdvKKzQJj11za5X/FvC3Od4p53dQAtXc
	WsHmP+N1r6+HMKSmj5fZr30E7gMPTvxfDvnuTNHYaPsLsIbIne4Muk0PcxQtlnMFP00O/9OfUKa
	yLHnZVX9K840te2Mu4qDZ0a2Ex53d9T9Y0Gi1HtrvrHDp6WpTU0DpFBkh4RpVSuvkacEsWu07Ct
	PTjcqsBAh14Y41dWK3bAbbCVHfrj4dFUJsMKNFyWAEPBV3wiMrd6kM6HIK5hDImsocCKcWa2HwQ
	HGPDsKNWTSg2/MCFR910xo2hKSSBhoVXG8puB7/UEVYAgg9ei9j4AlABX7XYWkIXTwXW3Moi7n5
	3v1jwHJI7IH2dniZWzRQY6ZlBJUkVZiCQnWJDqN4NxuE9
X-Received: by 2002:ac8:5f53:0:b0:509:f1e:41fb with SMTP id d75a77b69052e-50997ff8b59mr81729771cf.6.1773832129290;
        Wed, 18 Mar 2026 04:08:49 -0700 (PDT)
X-Received: by 2002:ac8:5f53:0:b0:509:f1e:41fb with SMTP id d75a77b69052e-50997ff8b59mr81729281cf.6.1773832128819;
        Wed, 18 Mar 2026 04:08:48 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51805291sm7523646f8f.0.2026.03.18.04.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 04:08:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/5] clk: qcom: Cleanup redundant header includes
Date: Wed, 18 Mar 2026 12:08:39 +0100
Message-Id: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALeHumkC/x3MQQ5AMBBA0avIrE3SIqKuIhY1hk5QtIlIxN01l
 m/x/wORg3CENnsg8CVRdp+g8wzIWT8zypgMhSpqVeoGaV3wpH1Dx3bkENEMhoapUVZVBCk7Ak9
 y/8uuf98Pq2OlvmIAAAA=
X-Change-ID: 20260318-clk-qcom-headers-9b9cbf80a04c
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=HkHhXrqMmiFyx1YPTM2JfklSww0Bi7KnBOXHoYhSgn0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuoe5DRsIdJAD/a7UGCOmOb3WtrtU4Up/ECtQ9
 HHRFzsf78CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabqHuQAKCRDBN2bmhouD
 10CVD/0ePbX1fQO5ftCAlqT4j2WM2c/QyOSzZQ6rOdkDqIr3YnOMWppyeNO8KoC1+hj1H2oz4bK
 +n5L7KB7Me34rSyS6+wVVfIB3UxzvrEMZlv15U19gwfPPv1sKxdAFwyw0jmkUYF6jY4n5iE0VOy
 a4qui+C6SXZP2UWNzGLQ2/Pw++juCkmoUGxZrvgUFiFMubYwZF6SOkxA8D4h+ZhfUsNJvlkP5oK
 r61pXpWlHueSQZMdwmO3x5XHMcjjAg00rA5e3EWqrn9kyBltdz/iPamX1bTu8bbiUP4CgvN8Gf+
 LVzc3nRyEwcD1DnuGZLXYmu6vMAGA4Ac6RzNUcpOBFCbSLTGu3VQlnXbWQaKQ5votfdHGzuFIeJ
 VhN50mE+OgTehfni+ieDaG9pIM5rOFNb4ZeMfbzk2fmt1LPQ9XTSIfNd6Z/bcD2pkY0P6wDYfC9
 8K/ypcopbFBqW9f5RljwFj2RsG3FGUhf6A1nYB7170ty5hvuso77Obdkn4u5ozgjwMxAjj5SU/M
 mXs2USw/TWbSkbadLNezp2gpDjubtcNaJoplBkwPbIwcfbY/IPkXqfcH1nQ4NxAWlnw+TG/HqQd
 v8tnZSrt0hdhVQQMzrFS68JMb1nV2g/0MlpQ07ipa9OemuFEZ89fMiQ59M6XM5qL7oqOgPC8pHC
 dGpWiyM8OssiQ1g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5NCBTYWx0ZWRfX9Wr+mmr0p0fk
 AQy6IjewsrNSzD3CZ4hMDN1YqdutxtBrq7MPs410qj1S52foEvmvsBaJXKG1Czgsxj6r8Gh9MyP
 lTZsOxQCxObYf3Wuzfl8tyxYtvBAAVlY1ttNegiHfYeqSHKHzM/C6ARMtwwz/aqASwQBxH0Z75x
 wNSz0AZajQgg3ZvdP77IK2AlbzRZsDkaCXZdzbdGdKzZUjMvpItPngV+s75J1HX39GcwjNtkgET
 qh9lDgIt2TxRt4PZucMgb8mVvi2I/FkrhLiduzn2JyMgPlthwCNitDGRy3/A3KzFy7Ur2D/lvsb
 Dl0+pR/UfsyViqZfSWYLGiO58i4XnTZdLIjGnr5DX5nGhFpuxptlqzdq0He2vSKRCvT5WCXuBGZ
 HbnTAnMIPdlNb9Rm9MiITEbyeSwTX9EpIIweYgHXRiGDLFkacw4UBSD/l3kpyRVLfLiWVpUVlcf
 HC76f5r14IFkmpDVisg==
X-Proofpoint-GUID: hnRzuqtLBnZQLGLvohcEEcK1VZSeF5bt
X-Authority-Analysis: v=2.4 cv=DfQaa/tW c=1 sm=1 tr=0 ts=69ba87c1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=T-bvjWfsjI7GNFiSrugA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: hnRzuqtLBnZQLGLvohcEEcK1VZSeF5bt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180094

Newly introduced drivers keep repeating same patterns from clock
generation scripts...

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      clk: qcom: kaanapali: Cleanup redundant header includes
      clk: qcom: glymur: Cleanup redundant header includes
      clk: qcom: sm8750: Cleanup redundant header includes
      clk: qcom: milos: Cleanup redundant header includes
      clk: qcom: eliza: Cleanup redundant header includes

 drivers/clk/qcom/cambistmclkcc-kaanapali.c | 2 --
 drivers/clk/qcom/camcc-kaanapali.c         | 2 --
 drivers/clk/qcom/dispcc-glymur.c           | 2 --
 drivers/clk/qcom/dispcc-kaanapali.c        | 2 --
 drivers/clk/qcom/dispcc-milos.c            | 4 +---
 drivers/clk/qcom/gcc-eliza.c               | 1 -
 drivers/clk/qcom/gcc-glymur.c              | 1 -
 drivers/clk/qcom/gcc-kaanapali.c           | 1 -
 drivers/clk/qcom/gpucc-glymur.c            | 1 -
 drivers/clk/qcom/gpucc-kaanapali.c         | 1 -
 drivers/clk/qcom/gxclkctl-kaanapali.c      | 1 -
 drivers/clk/qcom/tcsrcc-eliza.c            | 1 -
 drivers/clk/qcom/tcsrcc-glymur.c           | 1 -
 drivers/clk/qcom/tcsrcc-kaanapali.c        | 1 -
 drivers/clk/qcom/tcsrcc-sm8750.c           | 2 +-
 drivers/clk/qcom/videocc-glymur.c          | 1 -
 drivers/clk/qcom/videocc-sm8750.c          | 1 -
 17 files changed, 2 insertions(+), 23 deletions(-)
---
base-commit: 8e5a478b6d6a5bb0a3d52147862b15e4d826af19
change-id: 20260318-clk-qcom-headers-9b9cbf80a04c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

