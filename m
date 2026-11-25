Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612762;
	b=Z0DnKNA5hU57uKZIy6iIbWaoYi8R4wwBoKZq6QeiSWuyoX2Ge2Y1Er3BrRfZPN2XoM4Z
	 TnVnJsqjWp4AiGBL/Y33CSbBX/Pnbt//RnrMEQ+5vl0gcOomPdmNnDg3XaoYXhie6KITQ
	 iilyTWIV62QpHa7IEI2UVnELAEx1f9SyN6L1sO79S2vu95FhdPGu+DbUIvm5d0AXuxoD5
	 WGXVU1b0NZEAT5lpvAsMkPy3NjaLiK4c+yqZ97ogi06L4OsItSnxSbFOvDcirYWC1tXC/
	 lpE6OhfC1BoYI7F4E5Vg/zwqm800nIPCGSwVp1UofW1Dv3MHdVWIeXMsocpXq5EezRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612762;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=G0ooHOIdzseAgTBm3ZwB4VCQg1gdMWvjZh4vVjC8WUg=;
	b=FYtSgcBbVwRYJCvXLPJN9m7OQp7Zg9TuZaAIP3pf1Ufh39jRmSXfVlDSuaRdBApVIHRs
	 QW2JVoTxX4xzfVcDOlwxE8aF6mtVOWjfjSt5FUkFs8nfx4INzM4QHZLlT6QnC176eA/65
	 cPThF6QxvKLDWyBkZOs2GCes/t7t1H6+eaO/qYCbeziJA/xb+H01D+rW0sxp7pdO2SbQr
	 n5/xw9msGjSMeKFAxFEAOwQxX/WSArZI8tyKMluwbeTKlkbsaPeutE+fjK0YQld689Xe4
	 SGKyTs7u3v8YpjLSQq4CX6+V/NVGykO8X6+ySc9m9B8cGylG7YAnfcnxsSWiOVm9h4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iFMdSavS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DVsJCWPv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705D6606A32E
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 13:19:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 705D6606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iFMdSavS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DVsJCWPv
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mP7c555541
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 13:19:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=G0ooHOIdzseAgTBm3ZwB4VCQg1gdMWvjZh4
	vVjC8WUg=; b=iFMdSavSoklC8ZWJzQs3vecWrTqmuWKu3WWcfvYnOuo9Ehf2OcR
	gSyIZ7aNh9JrBsYngVKO6Cr2ZFU5uoUW64X1TpHqbbVbOU4IBHckTNIrCBjj9xAq
	QoK3K4Q6jUyNHuWvDT1/3A4XhHy+LeSeya3MlsTzxpu9dWT32UNHZ/B2yEVQ1Gdy
	iOhOpmYdki1tf1tQJbcKdXJEqSlSsk33AZtNu0gjjkxPCyByT+dVA9ahbyCvGitS
	U/zwzC8C6CqtGhK04GVXYuDTv/evPkqQdZLNGFOwPFzAde0KKgcX+MxASapRpnA1
	u7+6fjbsBELWfBw0xojIfeE4pVBT2sSzKEQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnrybq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 13:19:21 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ece5510b79so3885542e0c.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 05:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795612761; x=1796217561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G0ooHOIdzseAgTBm3ZwB4VCQg1gdMWvjZh4vVjC8WUg=;
        b=DVsJCWPvZpwJ5MrvM1fpq5uc3Y0uwKvmjMeI9++QSYrUozcRl+fEczc7OCxl+lyXdR
         pQ0CDiYIY7xRl70RxuEP+rYcAZlt11eemciZLahc9+sPyPNunfjqqH3AZ9swSahfBqsS
         NiuzdrSNdP3RVrZgicSbPRZLSoYszKcqRcjqrtCBMsyVRCHCga8LmV54HhbGiT2IOQYb
         TGK6Kuo91qB9eHIcQGUErxcQAky4rIIzgYV8hSz6CMau4nXnNINzLAVuRj2g8ZMlcYR4
         ARnmUOw+uZaNWGcsXusX+R71lTgMEfepkE6xLBH4k2oeIqnZPo5WfEBfQStS55TTVMHj
         HTLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612761; x=1796217561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G0ooHOIdzseAgTBm3ZwB4VCQg1gdMWvjZh4vVjC8WUg=;
        b=AYBIavGDzy0P7zLKNmcGiUNAAtmSJMt6IbFyABl1oXS+Dll1jBVFgCj2OK/jotu/Rt
         J69kxqyQbfgx3DsdnzkwAQdTX+YAnb+RzoaBhLDevQpdkztkMgDzputZFEQniwPs6aU/
         DbLILnGnduwYTnLA/pnk/DIzffabuKSjUmXkobAOwL+B0cF8wE5UXvXlefa6eJfqdjug
         urrI0486erv7/qQwnheEVQr5860VvScKG32uEUFokToU7JiIXrGzEG+zqh3JXRomkotg
         X+nFp0AJ90n4fEv8HQO3vzRk4HL8I79ximY8pBIA58paOROC9UF14s8W2SzoBq1Y9FeT
         mWFg==
X-Forwarded-Encrypted: i=1; AL+hErEYW8yxwW3LnDA+XREfa98rnp0NTM7+kp72cG8YO/k8Va+MV+D0Ix3Ve1onCUreWR/QajUAedP/tOc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fZ5OdojhsY4+Ow9Mep/+fUbUSzS7gc/3EOz4VcKzb+sjIzTBT
	2/AUEm2+Z99kCZaMq4mWwVC3h/gHF12ETDwyo2h186sOpUw/9RpnSwViSJXYdbUFvgm6dqmAGCe
	qVa2LJni/HUJQ+vPhgV19q8Uj97zJb+q+Hd9OfgZZHnXh66VmDKRmMy6TlIRvQX8=
X-Gm-Gg: AZFdTZd/8TI+MqB0h9bjKPUmJbfIAD1lfKOgOs8XEJhfA1L4rmOca9/2AptW2FeP6ji
	WneqZLNoKBd7qKhi7H0dzLZcXF4CBqWiTNtsdSJ4qsfsWRcHHtmTuZSLD1qKySKyKBrmHleIlkK
	GGMqADK3WEDpic17CB+xjF3PerHs4iwYTR7Y7CvyKsJbKQuNjNUnni+XPlqHlrEvaJixEW+kpjv
	s4dYq2Gv4eSce0P8TogDv3TpAL4xjhGmQs+Xj4VIPFdI9R/6QJy4W9yHmWAPqtVJXgaWYNDYlar
	ae6Xbdh52Gn/5TBRdjZP6UBpZjot3ETgLFCjuGMuGyQUl6MfrhJLyd05/5ClosU5ePUz+RZtpb8
	A+HvvgdxeM6kT+Bq0JOedzRkDo04KvlaNCHF1938hSlA10COXhVv3AkMNqydnzkqm
X-Received: by 2002:a05:6122:4fa0:b0:5ee:48a1:7a4b with SMTP id 71dfb90a1353d-5ee8afe028cmr9901688e0c.23.1795612734993;
        Wed, 25 Nov 2026 05:18:54 -0800 (PST)
X-Received: by 2002:a05:6122:4fa0:b0:5ee:48a1:7a4b with SMTP id 71dfb90a1353d-5ee8afe028cmr9898738e0c.23.1795612696151;
        Wed, 25 Nov 2026 05:18:16 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f148aasm205035365e9.0.2026.11.25.05.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:18:14 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: abel.vesa@oss.qualcomm.com, abelvesa@kernel.org,
        taniya.das@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 0/4] clk: qcom: Add LPASS clock controllers for Glymur
Date: Wed, 25 Nov 2026 13:17:53 +0000
Message-ID: <20261125131757.1163466-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX0h1P+CnHKMMm
 Fnemq//MMFvaV2ImG5itZo46BUDen4mhzkTehJT5IQ8uNrBAvfe0tcHptQG6Dt1cOy2EFrm1C9m
 omd8WLL9blk0I+P+j82INvAjQESh0mDPFpGd/feTd5l9EQKAPc1Y5ea2vyt/pvTdwiFzUxTH/ot
 TXAFDRT4F85YDs7uuTYdoVzHNByA5IMgosq+MxfdGvjxAWRCqQoUlOkjWXKmHaaOIiBl/s0TJ9i
 iL8NOOGT0gHUuJoKcJfN/ZOAA92oRB6xKWsapeD5T++n/xEycZ4jmC5sbI6bIW6kW0cpFqnV5Ie
 O7KnPMWLTInWkMIhNEWuDLE9cnyiv50WrnDNO6MWA7d2JY315igrSGsDE+HmPWvX61JA0HuNnZ7
 AilEmQGIFa6Wtx0NK/oe6oYJ4RWFUO20zZuGOLayrN8l2N2QoaLy1Z/zcOX001VSw4PODBpJaq0
 N78w3mhHCq7ZCqTUgVw==
X-Proofpoint-ORIG-GUID: QbGe2v8rNvMIuI5NfKx56Z8FVbE0QiAn
X-Proofpoint-GUID: QbGe2v8rNvMIuI5NfKx56Z8FVbE0QiAn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfXzE+jpg7E4e6Z
 JZywS75xiScuZTxLSR5xa3jLFmqr4TCiPU+xDl2/oN7xHWGg2vnwSPXSPsL9F8RcDfVhvZ/8c0g
 OQ8nk/k7Yfsye854j7+XEim15ISbAUY=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b06e059 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=tj6v_WFbzlxhzRuvkX0A:9 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250052

This series adds the two LPASS clock controllers found on Glymur:
LPASS AUDIOCC (SoundWire RX and WSA1..4 resets) and LPASSCC (the TX
SoundWire reset). Q6DSP owns most LPASS clocks via Q6PRM, so only
resets are exposed here -- enough for the LPASS audio macros and the
SoundWire compute-mode controller to leave reset.

The programming model is a near-exact match for the existing SC8280XP
controllers, so patches 1 and 2 extend qcom,sc8280xp-lpasscc.yaml with
the two Glymur compatibles instead of creating a new YAML file (per
Krzysztof's v1 review).

Changes in v4:
- 1/4, 2/4: add "qcom:" to the subject (Rob).
- 1/4: pick up Reviewed-by from Rob.
- 2/4: pick up Acked-by from Rob.

Changes in v3:
- 1/4, 2/4: extend the existing qcom,sc8280xp-lpasscc.yaml with the
            Glymur compatibles rather than adding a new YAML file;
            drop qcom,glymur-lpasscc.yaml; update title / description
            / See-also (Krzysztof, v1).
- 3/4: bump max_register to 0x3020 to cover the WSA3 / WSA4 reset
       offsets at 0x300c / 0x301c (Konrad, sashiko-bot).
- 3/4, 4/4: pick up Reviewed-by from Taniya and Konrad.

Changes in v2:
- 3/4: drop <linux/mod_devicetable.h> and <linux/of.h>, switch probe
       to device_get_match_data(), lower-case reset offsets (Taniya).
- 3/4, 4/4: pick up Reviewed-by from Abel.

v3: https://lore.kernel.org/all/20261002194436.1275056-1-srinivas.kandagatla@oss.qualcomm.com
v2: https://lore.kernel.org/all/20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com
v1: https://lore.kernel.org/all/20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com

Srinivas Kandagatla (4):
  dt-bindings: clock: qcom: Add LPASS AUDIOCC reset controller for
    Glymur
  dt-bindings: clock: qcom: Add LPASSCC reset controller for Glymur
  clk: qcom: Add lpass audio clock controller driver for Glymur
  clk: qcom: Add lpass clock controller driver for Glymur

 .../bindings/clock/qcom,sc8280xp-lpasscc.yaml |  7 +-
 drivers/clk/qcom/Kconfig                      | 11 +++
 drivers/clk/qcom/Makefile                     |  1 +
 drivers/clk/qcom/lpasscc-glymur.c             | 89 +++++++++++++++++++
 .../dt-bindings/clock/qcom,glymur-lpasscc.h   | 19 ++++
 5 files changed, 125 insertions(+), 2 deletions(-)
 create mode 100644 drivers/clk/qcom/lpasscc-glymur.c
 create mode 100644 include/dt-bindings/clock/qcom,glymur-lpasscc.h


base-commit: 9f24d789f03b22941b905ded43cb5ff8eea9ce62
-- 
2.53.0

