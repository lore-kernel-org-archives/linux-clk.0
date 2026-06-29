Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F2E37AA79
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 04:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782707933; cv=none; b=l1IvfBtjcijG7GU0a73mKpWK527QGQD+jK8oKEwEuOxb8+KN7oE4Y3j0xXa555Lrs+o9z81VntCQbJShwQYYp9ZEHcbjd9xy805d/roIK5xUecMBib964ZL0g1XRVf9L9GkjMIqbLOgig4lOWrfhq64WPT3IasQDlshDi3fPBt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782707933; c=relaxed/simple;
	bh=eqber2QnjpJ0qBf2/slRNi8fbnfRYGUkPKJcAmezZJY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OZlDYJyxPqTCBYLcM9tJhwMjjtD6BSIkgAyUIEBnW7UL3m3JbrSSK7mN/yC/xVz/BPEGkDmTu5iM9khce6PHCvcE1bWMpzR134ti0IEr/qkCTVumoU6NHHirJmLotVdyz9Nxirv68v0ExWbeIXAmfoteUYhqoJX7xpgW07scng8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JUUkqA1/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N8IAeGpI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JUUkqA1/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N8IAeGpI"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NHJ61719035
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 04:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+H7upl4ky4N/1wHh422Qj7
	n0iMjwso8LVlWtWJ/2DEs=; b=JUUkqA1/m0D3VUPCK8q8nnCIaMkHucNJ3AnBvp
	vxUg02RYo7LpeqvUZRwVS8gHEiJNvWWxECC2zRiTAa4x8/ujxIXHi7VdP+epWQ0V
	8VOpzw4hkphoRg94f7Ss8uu6SBIZ+ONMGsoss0rFMZuy+CowHyzT5cTkSMhr9BV6
	jPKXlSEsCdhfp7+J++qaNON5USZL6OSVWXf+6Uyh7oJjT2P9smMwC9IPWxkMuHB8
	ZhCWswSqfYs+wgcrxcJKpvjDV6PslrBF1Vq8N1pn0s7EFVCqdfR9O0MlJ7Eq4Gty
	zwn1lZSWR1E+S17+VEHcWu4y4kJFJJEW+F56OE7lzJng93uQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27pf4arx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 04:38:50 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139c6673856so4549982c88.0
        for <linux-clk@vger.kernel.org>; Sun, 28 Jun 2026 21:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782707930; x=1783312730; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+H7upl4ky4N/1wHh422Qj7n0iMjwso8LVlWtWJ/2DEs=;
        b=N8IAeGpIbbrGZSfyYcUHRz1mOI55/9yOZatFewHPyurz+y+G45bfnDeaPJPUzPtec5
         78cKWcqaWm6yDxk+u7bCOb3w19jZ513SSr/4GzJIxTYpmCww0wuHS0wTWnY02fr2oXUf
         mXbP5oHJ4CRoTwwLyA+E3Cxb3h3xXGdIFYWsCC7pz4FW9sC3qaQ5IKALwbSER64bnv+H
         JdGbyyQtZoHJd/5+U/GzN22iXo8cR4N0D42uzawlwd36KUGu+HmfQGePSKJ9NmngzSXH
         RdI7jV0i2XtoYZlQABYUHR8MsFAl763QeX5wJHLelDhPJTwIbiZ3AmKULwnm9lbzMc31
         KmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782707930; x=1783312730;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+H7upl4ky4N/1wHh422Qj7n0iMjwso8LVlWtWJ/2DEs=;
        b=X127ASxyRYb20MmsShQZraPQn074k16vpi5H83l5p3F4JJUL+c4e9ZclIbQWaTkQwz
         UWHglFXga2hz/6j+0WkWPRXlIgiCZokP1M1VrHBKuCZVIw2c+sIRG2GpnHz5oyR/RpEA
         RBdIOLeuO60yNvaghAq3GVjWc/PS6n5zWUD50Emi9qpWEmLyvlafrVf6LiwUj9dDm+AH
         M0V64NSv5Sg7O2ZBiWUVNNzfO+rly+8MGLq7lLFvugV0B/LbNoARzPo8np5wr+3s3Rvg
         KDVIoIkr7dRENi+E/oMaWQXmbBEAt1xoJozVy34VNgOcV3d8Ezlkd6eNc49bgOIph0v0
         hLCg==
X-Forwarded-Encrypted: i=1; AFNElJ+a5XpPIcwdkBvCVRmifrVcJdNVjM15tlHRfOsHwsrZjiINkrh84or6g0Ss+tKPjtqF/Pmrl96JJJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIQV1ZYOpmbd9ig8RwoUWNM24v5uN7wz2LtUlB5MXSVAJmW+Lw
	M4O7CS6As73ghxDCjyd90mHmlIH829ZgxSqIbT2ftZxL9vQc+fodNZ6v0BWzLIW2JDHCjBhPEdT
	7zqOlv7IZ7kHAdTjU0IuZPhR1a4gRFfIhZ1Z9z7NUoUMZRUg1RPf1Adcyge6mhyQ=
X-Gm-Gg: AfdE7ckyR7msAL3djIDqqfx/RT4eNIiJuPr9K00MrpJuXvayNWY4t0PeLjVcIIALDx9
	4mCERopjrz0lnWNokUStiRgm+bsbJis+WcNzlff10+6R7M4niju+gEMhLdfg2YPQ8KVSlzH2ZBh
	SeU4rwRSjco5ZR+iUGKmweRDU+gRPoEYoriyfWpZtf1CN4sKV2VREhBTmFpRAPGS66NYzsz2zch
	HQSdQOCgCFRp+mxb4bJ0Ebd5QtZvl2W936k5jK70qmSTpi5DccOoRhz19atBpusjwRWSOTqkDNS
	hatdPDROUNOi7BJ5qPOj/mMrDF3k83A5aGMkf2rwinUTVKMQEzxpgg7Hk7pWAbVMdNRAfV/IJCc
	VSHGt0eNhv1Lpc8DqPgB6EpPIh0A0RETmZcOH21ft5ZqNSH5SZnLsHXhSNfADi5P450x6SdHd/3
	sj+7H0nDVgebrzHmd10a+vA3j5olkAkaDOHEXDsIbB
X-Received: by 2002:a05:7022:ea21:b0:139:8172:76b2 with SMTP id a92af1059eb24-139dbaa7203mr12099940c88.21.1782707930051;
        Sun, 28 Jun 2026 21:38:50 -0700 (PDT)
X-Received: by 2002:a05:7022:ea21:b0:139:8172:76b2 with SMTP id a92af1059eb24-139dbaa7203mr12099931c88.21.1782707929553;
        Sun, 28 Jun 2026 21:38:49 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139fcf63021sm7791247c88.0.2026.06.28.21.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 21:38:49 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH 0/2] Add APSS clock driver support for IPQ5210
Date: Mon, 29 Jun 2026 10:08:41 +0530
Message-Id: <20260629-apss-clk-v1-0-8c92fe118ce4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANH2QWoC/02NQQ6CMBBFr9LM2klKgYq9imFRy6CNUrBTCQnh7
 jbgwuV7+Xl/BaboicGIFSLNnv0YMhQnAe5hw53Qd5lBSaWlVjXaiRnd64nUlRdXSeoq3UCeT5F
 6v+ypa3twpPcnF9Mh4WaZ0I3D4JMRgZaEv2oJ/3dG7LouakxMgbGRiqg/W+V6beYC2m37AoLso
 +O4AAAA
X-Change-ID: 20260625-apss-clk-ed39c40ed468
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDAzNyBTYWx0ZWRfXzXu6GSuJYR46
 P7ng6aXrudFUrOQNM42+TCSaYPUNKPutcv5kHx1MVhSwvCkdYDzrlBKmwXynvMQcZrpBAB0PPTf
 psr4CJpNy3nAKNxAvxAthTB62qPhkCg=
X-Proofpoint-GUID: ZMg5Fnckn2u833G8idjUZ82_d2gOG5da
X-Proofpoint-ORIG-GUID: ZMg5Fnckn2u833G8idjUZ82_d2gOG5da
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDAzNyBTYWx0ZWRfX58hIUap1Qyie
 C3DuZkteP889jxX7S77TOzMzDBOMFfClJEMZi1wzZ3BxeJ9rc6X8oPPWGfixQq7amHIiINU5Xq9
 +rVM7FzNMWPUk+Z05rfV6UiiBochZlzDF/hSli5Gu2Ri9SEYI4agpP8JLlybHDEiac0jp/3Q8n2
 XkrxX7AH4RlBI3JUtbKFydRcYAZa7q2SND6AL+SyUiXxITY6atkhXImC9WJPY2655ydSIsjG4/J
 wEpFNu1ABE7k1MF/kRTLFhaGIZ3tHQCXPF0ilXHXieKePfOZ3aJDGK/oE+b7ribptN3EPl6kdpT
 7NqtVfRddl4X1jea9x9m35lmTeNQJZn7rID54HzmteWCnFxpcTfkIHDjWsZNXegotzyMGYXYpl9
 YmfgK4DgRO7d1Uk2oY9oQbaw4Jo/1WI47yCC7ZTzBPq+F3sbDaOMzemGD9Z+e+ajBBCtBw0KCmI
 U8pegBa9PBx5Tm615kA==
X-Authority-Analysis: v=2.4 cv=R7Mz39RX c=1 sm=1 tr=0 ts=6a41f6da cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=jsnA85DQvCWt_8XIyIcA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290037

IPQ5210 uses the HUAYRA pll for the APSS clock. This series adds support
for the APSS clock to change the CPU frequency to one of the supported
frequencies.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Varadarajan Narayanan (2):
      dt-bindings: clock: qcom,a53pll: Add IPQ5210 compatible
      clk: qcom: apss-ipq-pll: Add IPQ5210 support

 .../devicetree/bindings/clock/qcom,a53pll.yaml        |  1 +
 drivers/clk/qcom/apss-ipq-pll.c                       | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
---
base-commit: 533704f3c28c3f5f9e2542aa3a6a326c32e6f5c0
change-id: 20260625-apss-clk-ed39c40ed468
prerequisite-change-id: 20260515-tsens-802eef7a2cf6:v1
prerequisite-patch-id: 55c7e7f58ff80ecfed956707a9a893bbf59ef74b

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

