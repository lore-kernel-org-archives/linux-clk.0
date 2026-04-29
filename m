Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D793EF0C5
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 10:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777459927; cv=none; b=iGSweR3YzIzgpGqX3VNMdx/qyZutw4XjH9zV6uryVK6PVy+tDGIkSgh6JY1w+hHNKhdEcapt9QF1fkopYhLhrZURso3svx3TEcXckYMX9W70LW00Wr5W6ucPaaxg9Y3ncNqw+nnl9TED/Q4iQM4rkzWpSAbDS8nStMms6IioWQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777459927; c=relaxed/simple;
	bh=EWjSijfh5YbT4XwQ+bM9xdGSiunXFV+lVP+JIiSqvGI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TD0k5PB2/321iq32vou1RuniPbjbSwGc2+eV/6eGKH7rBWHDocdrU3SUWvhz+vE6o8VkeGI/H/tNab6jB/XfDaPwsMNB0Gf1pnpytW/4PMaMCRWUiZzmDjSV66EG7R1JqvN00Y+I4WxIU1iVq5KcArW5nCyHOC8+iN5oKNyuXRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oewXyfUI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YmFKwi6/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oewXyfUI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YmFKwi6/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8pvgk4001929
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 10:52:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SfuPAxswSKgB66zXlIJSMB
	HWjJ2M2YWduAKhLIqYG50=; b=oewXyfUIs1o0GxKCgjXo5uLU3FMisq/CAtQWg4
	qk5P7k9RCm8R8q5/xJO/hV+lA1UzE5T5aJ5a3dRvoe3EBvJIxYERKPGLDO8U9Fzp
	LDr5QMI0bBGFbfsx+GJvzdk1xgkAp834Y8mFFEEU4q1DtEPX9dWr8mqt3ydYVEa5
	qfM1Vs2ibWcoSVd0usbrl/TgFQ3PIuEIkr2gYCfHgF/3UumD+QWjyTRSxRcRcrbx
	YAF0SPCGbQU+gzrnySepEeur+QKAegJDPhOwXp5IPtRhZvN7P40RKuRoyBTLZjnC
	9knYdf1EeJpMqCVMSZTqqip6PhLhExl/D3kyVw1R2772cQDA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du9em1u2k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 10:52:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b24af7ca99so167551405ad.1
        for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 03:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777459925; x=1778064725; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SfuPAxswSKgB66zXlIJSMBHWjJ2M2YWduAKhLIqYG50=;
        b=YmFKwi6/BDLAQ/Hab8Uei3YEI2qdy1syuzpcGthFE3fId3BsdM4tY/+qB/Xmr9Y4jf
         rTu7XdphJE6g2wV0JE7pWZ9rOMBE1d42N1rc48ZBjXSvCUrWtVVmQdme6ztwSk38i1BG
         rWa9jfS3T9W1Ki2MDxr1Hy3Dbsc5+IxXTeZsRedeILt75gfFNPTrVkqMUS8P+cDPsbPy
         8cMU4txCNm6ggxmZpgpCwkpitWarCOKqhWljvfkcOyJ0Gu/B1dDIEzSeUn+neaGkI8mb
         dSuxAtRNYoYnUlaeEuBM+bkj0ZwqaG0o9Jw9hvCOmQyM6cbBMxm4XclvL9ekX6ZVrQYI
         iyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777459925; x=1778064725;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfuPAxswSKgB66zXlIJSMBHWjJ2M2YWduAKhLIqYG50=;
        b=e4NjN5FeYzzoCnk2BHPJP//cjGHe/SS6DzFTCoUlMP85M6uceIecLBlbQ92LsenSO0
         gsOyEB0ZNZGOQ3Z9qIsBSnyYzUfZnpto2/di162DIO5RhqBww+Hv/YIPMqKy8zJh5g4+
         75kmV4+UXadH+4ul187Rir2Jz8Li81ViOQPbcg9Tqnymr+M/N21u/zIjCiVhpi+N1lU0
         2lwvCKXrJc5KbgVO2WhDZrW6C+VMLxYQ5ZnKzlRZxtKgUjdUUqcSP3bxiKtg83lGe1QP
         3O0UJxZbE6kaCaqiL5NNCY+Ay8kGD6mz3xNRmyTKt/3w0iq+0pHw0Zn2LdTVfwep/Omp
         kgQw==
X-Forwarded-Encrypted: i=1; AFNElJ+/KO0EPeubg0lcAeJ0s/ead6SAEbFcj5C3XmgUZv5Iv/mCEYEHgx7KVlhWlP1uqfZmofECg0nh3Ew=@vger.kernel.org
X-Gm-Message-State: AOJu0Yws5Hxe8kQL0pWdf8Ww9H1egVZkqC2/cLqUEw0vnrJq6y7SKf4d
	vNjgfIKWEvHHOn4+Z4UiofUmNBdX9lkzZYHID0ri0DIXrlDmSSkRWVCdo8WWO6Am5aB1yJaRdfE
	s/qrnAb0s+06cygWiSjg5A6pEtlclvzlWnNwVB6jW/jlTVygZsvyqYvyx6LIIM5Hse6x6Srk=
X-Gm-Gg: AeBDieuF8ZNJFHfpAmZ9C7PRjgIvlGlJjplMp2farmBVJX4BymhUlA0rX/0yfrLXqoj
	PZ9VvJD6bNCEZnS0ObyWQNPSEga4dahAu1O8CZfJGkCRK2T2WUM6MpoudoHqnKqgyrPVjtZxh8Z
	hvGqahdvuJkGOl7yry8lZht2ecMeu4v7lyHxEGVa6aTfWLJvEB8qq8FglR8myRjtF5xdXYXTVS+
	eMGugVxsCjKG7ejbDSbJexsYLmNo3FfmNvxA0AN/vHKHfH90MJ5Dd8wVPFL9YRD3G0Ed8y9CzRy
	toHzitotgy0lGad8gwha2kiZl4VDA9uDt1LET4fp4vYUgVBWyuFrL6E+BOH5SpmlLyWuQAsCDWs
	BYz4YP3aeYumjY5Lj5KfGcejqbxluJb77QhVBHYly0S+AGdmzCLwwj7FsQayf6eM=
X-Received: by 2002:a17:902:ca15:b0:2b4:5b1a:d09c with SMTP id d9443c01a7336-2b97c400babmr48210855ad.15.1777459925082;
        Wed, 29 Apr 2026 03:52:05 -0700 (PDT)
X-Received: by 2002:a17:902:ca15:b0:2b4:5b1a:d09c with SMTP id d9443c01a7336-2b97c400babmr48210525ad.15.1777459924591;
        Wed, 29 Apr 2026 03:52:04 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988772e9csm18316715ad.9.2026.04.29.03.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 03:52:04 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH 0/5] clk: qcom: Add RPMCC and GCC support for the Qualcomm
 Shikra SoC
Date: Wed, 29 Apr 2026 16:21:48 +0530
Message-Id: <20260429-shikra-gcc-rpmcc-clks-v1-0-c3cd77558b7a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMTi8WkC/x2MSQqAMAwAvyI5G6i1CPoV8aA1rcGVBEQo/t3iZ
 WAOMwmUhEmhKxII3ax8HlmqsgC/jEck5Dk7WGMb42yLuvAqI0bvUa4902+rojWtozmEUE8Gcns
 JBX7+bz+87wdNVaWDZwAAAA==
X-Change-ID: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=bvd8wkai c=1 sm=1 tr=0 ts=69f1e2d5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7Nf7qm-7OTtRn44RyKYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: EGkmdvm-MdXkL9VEAimKZS20FF-lVsV2
X-Proofpoint-GUID: EGkmdvm-MdXkL9VEAimKZS20FF-lVsV2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEwOSBTYWx0ZWRfX3vtv3Pr/34Mg
 HiSGHRLHbiao+YYAyjAJaAJV1fYVpvG1fOXGxAMjf04UIQFnNU4v9wHadis/1xMIuSiabhuxXNP
 3XR4NLRrvXjyryG2/VvTn+pvJBbWA0JgLGu6blFwMbGP3QLk6RH+EA8Q3jST6xDWcW9M1Z29PP5
 plX2GB2koB1ZWaw1SWkMVR1rkfaVQJfHq3MGnjpgIUuzoqiXp4F26mCjYX/sBT+PdEALDdzao6d
 6U/tHIApPVY3/wE4yGwmcdzeiyjOzvziaS2xu+owSGeu8J5W3q97jAKDgwNdpJ5uaPWcfGHNl8m
 UQNX9zfcsdtzcIfGKdYAIQKYLM5EJGQKSaEdqWDG+4j/VRVeK8zNADFKwBDKc/rGhkeOvd+MYLY
 Jt2EX9HUmyhuFLaI2nY59pskPcIOjLmuPxKZZlPDtVbeix5gS4EYytqHlcVU4ii4KdszOEoJyou
 UD+caKCoBTITM5Raj5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290109

This series adds support for the Global Clock Controller (GCC) and
RPM-managed clocks on Qualcomm Shikra SoC.

Qualcomm Shikra SoC details:
 - https://lore.kernel.org/all/20260428-shikra-socid-v1-0-6ff16bad5ea2@oss.qualcomm.com/

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Imran Shaik (5):
      dt-bindings: clock: qcom,rpmcc: Add Qualcomm Shikra SoC RPMCC
      dt-bindings: clock: qcom: Add Qualcomm Shikra SoC Global Clock Controller
      clk: qcom: smd-rpm: Add support for RPM clocks on Qualcomm Shikra SoC
      clk: qcom: Add Global clock controller support on Qualcomm Shikra SoC
      arm64: defconfig: Enable Qualcomm Shikra SoC Global clock controller

 .../devicetree/bindings/clock/qcom,rpmcc.yaml      |    2 +
 .../devicetree/bindings/clock/qcom,shikra-gcc.yaml |   63 +
 arch/arm64/configs/defconfig                       |    1 +
 drivers/clk/qcom/Kconfig                           |    9 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-smd-rpm.c                     |   39 +
 drivers/clk/qcom/gcc-shikra.c                      | 4428 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,shikra-gcc.h        |  259 ++
 8 files changed, 4802 insertions(+)
---
base-commit: 9974969c14031a097d6b45bcb7a06bb4aa525c40
change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>

