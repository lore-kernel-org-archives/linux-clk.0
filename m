Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2CB23C50A
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 14:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777472141; cv=none; b=P3Mijt8sybxWa+jMmKo8kspBteV4NowNjWYsHAPhFplPqbj/qLk3DxZ3seq4V0+yBcTA7qmE6vFtGQ38Hhr6+cxWoxSdE6R5iUOVjb5dkbl452iwfp99+2uzzly/8UNvc4fo9iWpx3sWB2iaOIGyFFZyDhMAODKbZbpl6T/u1ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777472141; c=relaxed/simple;
	bh=6qiQEZhfqswwyTy6lGpZ8vDSCa5P9FHQo6RPH8unH5I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=N7gpmMGFU0lez6xa6dDavnptmbXlGATGOV+g6SSTUVsj0s3IYnllwmYVFocR5VxKUAyLabBNHlKrrdm5oDiIpD/Nfho8zK1p65UVhyvYzupWhEJ5bwL+Bs7bmJJ4OCGhU6FBAFsyRGqpkyDxrkcZ2RUzjowazB3X6kHQZjWOnaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QJcH8Q5Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e0fSYAhi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QJcH8Q5Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e0fSYAhi"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8q1g7963273
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 14:15:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iKo+UJYDFtR4I5B/NNi2ij
	yviGN2L82xHEIJ7WGjUyY=; b=QJcH8Q5YxT5C6SHwCtXpNBURPlQ0ln/DwgGg5M
	SY2XZs1CQFaUl0qIumL5BXsQnc5mR7z8/s+TWcHPZITx6WP1NvTuPuHtahnb6eyj
	453wxQuyDEdM7rtvq3xP2PjSn16hFwNdvgQZFNF+Te2Pltk2N+gj1zCHLQW23oZ/
	Jv0ro7R9PdYokbTXWVafnQp6pT+PZLlG2n5+7vklwKN7zfc6/4Gp6ntCZH4T7Ykn
	0wgpWFAjavMDGbBxEdOVB5rPfZ4nfPDqMDp5m59C5NBhUUBq/zC/5P8frrVdk/yN
	p9lamXvNl1bV8mLNzDoH+5/Q2mp6/ta4XZUFA0dTbBtKutYg==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du2m4uqnh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 14:15:36 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-6583252c117so6840621d50.2
        for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 07:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777472136; x=1778076936; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iKo+UJYDFtR4I5B/NNi2ijyviGN2L82xHEIJ7WGjUyY=;
        b=e0fSYAhipuJNCGQgUdu2XxeJYTfkNIPoGFeQBLwTCuctfXrlMPq4pkrYb3R56xoxvO
         1WQoXZxjbSKj8jOn4zXgVYdK1VtB1XbSZrOC4m2Co7CC7qCJ/Iy0Ik4wx/6iyT7Q6gCg
         hSpdEZ/4fmnZ6Qq4k8jCjZkxvD9ZzMpmJH6IGZKajp2Hjmx4gBIqgSSS9JMt36dcWeul
         FT9Pqxsn1Xu9kYQMGeqcgEenReTyyw0+wof47BipZazXPpgDSIx07Yub+SfVADmh57Fl
         OtqoWbvfx/Jx17v10Tz7/NLjF6uXUSJKXO0ZtzowS+jd/KqxdQdbLEYZKDo7pnmkZK3Z
         TIbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777472136; x=1778076936;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKo+UJYDFtR4I5B/NNi2ijyviGN2L82xHEIJ7WGjUyY=;
        b=d/QxnwqSdk/vxBmwbheWFq8jR9hX0no0r1JDkZR6unUAnbZCmcwc5JX7au9QZ8h0lI
         F6fovU8Bc0A6QJsvAPsyTiG7OQPkuA4V1wbUytvNYGzO4p12nkqXKTM9xqWplpNCZsEG
         Dr6ZO00Wugye25X96HhvLPG569I+StWmsIVtsp6ZAVKzGqLuzIEHUdfK6rol4D1LUPtX
         p1+bfKAzZa91ofILWt03THOo/L/W4iytI8YUgX9iNL5L7FvJ3u8tcadjjwW7NCFIMMyu
         BU81ss4A53Uk+k4IjjycBrJWt0WkQw8qyhrUwFDucGctyTuFpq8zSopCTV7hW/G4YaEN
         IunQ==
X-Forwarded-Encrypted: i=1; AFNElJ/yva+aj70jtuJq4efwvUniVxNoSQFBt1Nh4VQt23MYlIFE6Q+P1oACXQ1ALHZxaEx3TCElRUzJexU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRt5Ulo45f9H4/l1r0DO0ZWZrKoSnSQqDu6/rTI80N9zkFxYAo
	4z7nIlb2RqAcjh8EinhZ6dwNH98+jAROKKQLm8TSN+dqbjI+oRzQTAiXbYL5bNZVs74dyOVtw25
	v3YPzV6VvYT5jewiZJuMRGtewu8plAuy2rZG0e1hmir8lMRQBrtQLcRBnSV3fNo0=
X-Gm-Gg: AeBDievBvWnO58cZk/j6KSxJIpk/Y7n+5tcP1XeexpO3otexGKz3Kpysq+61VQcwtW7
	Jlpt+pMcdghQ6Wz4s1bn9KDRQJF9KmUJBuSsluowZvtYMd4s6Fp22BBFtfzXFiKbS09ofHaMo0h
	5Yat08ArIcBxOmKkJ4ULkyOj9xtCaFo+rNidcaOl+yhmANbcQ6JM3wm1BPYpJAgD6hEce8poqP+
	jlauHK6TfJDuLUsc5ghFuhl2+Qy5dvxBwhgAzg2M3GgWd3VlO9piOEAOSExZtvLAekt8B+Xm3kF
	epc18pxPE7WbrmX3tx+0hDfoc5xg75Smj8sEZn0f3xcn9OsA3IX+vgEUlnjFfyE/XPh8tGpku5D
	KtXP6ac4gnE/eAod25K6Q54Gex8M+2SXnksX26XwM/DdfQ1mI9P2sHHKWLPI+NIE=
X-Received: by 2002:a05:690e:12cb:b0:65c:b99:607a with SMTP id 956f58d0204a3-65c0b996108mr810630d50.38.1777472136022;
        Wed, 29 Apr 2026 07:15:36 -0700 (PDT)
X-Received: by 2002:a05:690e:12cb:b0:65c:b99:607a with SMTP id 956f58d0204a3-65c0b996108mr810582d50.38.1777472135482;
        Wed, 29 Apr 2026 07:15:35 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65bff2c2eccsm1379533d50.0.2026.04.29.07.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:15:34 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Add camera clock controller support on Glymur
 platform
Date: Wed, 29 Apr 2026 19:44:55 +0530
Message-Id: <20260429-glymur_camcc-v2-0-0c3fd1977869@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF8S8mkC/1XMQQqDMBCF4avIrBtJglbpqvcoUmIy1YAxNlNDR
 XL3pkIX3Qz8A+/bgTBYJLgUOwSMlqyfc8hTAXpU84DMmtwguTzzigs2TJtbw10rpzUzKEVT1aa
 v2x7yZAn4sO+Du3W5R0svH7ZDj+L7/UHyH4qCcYatUbxWUhjVXD1R+VzVpL1zZT7QpZQ+RlYev
 q8AAAA=
X-Change-ID: 20260401-glymur_camcc-de21745db58b
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE0NCBTYWx0ZWRfXweiCVuEcdFj8
 Mur599dPT+Sk/PNTtdm/bLUCEYYIi9Gg2wYi5eLGNgHdxuJjk4cH9cXfmp07fb9xIWR5ZbDYUTg
 tYrPPLMsJ4k03/GXozDCM+L8NbkYM8K4rirw6pp8Z8DObHER60itVxxIyy5HNPOeEIkqdwUe9XR
 HZSdoBvhLYa3GJ/q2cZw1S5NzCj7eaZcA9JHQWkrzmI/3/uZ8fC/HvPohXFqB9IDuXF6kMigrbV
 A1xX+qa1X9jE1QCc6FhJJA+Qn4B/4dP089FWRQV7ZhpOrBzHNcEkpG53th6fAd7RaQu4zHdGGuR
 mPnq5JbjzCaataxadSk+uHsrO+7mA5LxuhCX8UbpPWtVxW5mx5+pcjsWRyrw3xXmLcvQ65vfHSs
 M8y0F/ycWGueCAIlfXDcungAdQfr9ihOCt4op+z5bGfDuoM1iCyhFEIXj2cIRDRxL1twvIezdtF
 LQUD4AQUCKM6DaiWsWg==
X-Proofpoint-GUID: RWJUbFdgI2GgbLAkKALEtg2nPFlRoOHX
X-Authority-Analysis: v=2.4 cv=MuFiLWae c=1 sm=1 tr=0 ts=69f21288 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HjKqFMqo481W0hlq81sA:9 a=QEXdDO2ut3YA:10
 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-ORIG-GUID: RWJUbFdgI2GgbLAkKALEtg2nPFlRoOHX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290144

Add support for camera clock controller on Glymur platform
for camera clients to be able to request for camcc clocks.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Changes in v2:
- Updated DT node reg property to use hex for 0 also [Krzysztof]
- Added R-By tags received on v1
- Link to v1: https://lore.kernel.org/r/20260402-glymur_camcc-v1-0-e8da05a21da7@oss.qualcomm.com

---
Jagadeesh Kona (4):
      dt-bindings: clock: qcom: Add Glymur camera clock controller
      clk: qcom: camcc-glymur: Add camera clock controller driver
      arm64: dts: qcom: glymur: Add camera clock controller support
      arm64: defconfig: Enable CAMCC driver on Qualcomm Glymur SoC

 .../bindings/clock/qcom,x1e80100-camcc.yaml        |    3 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               |   16 +
 arch/arm64/configs/defconfig                       |    1 +
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/camcc-glymur.c                    | 2280 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,glymur-camcc.h      |  122 ++
 7 files changed, 2433 insertions(+)
---
base-commit: bd0f139e5fc11182777b81cefc3893ea508544ec
change-id: 20260401-glymur_camcc-de21745db58b

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

