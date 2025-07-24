Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD33D25F78D
	for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 13:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753364556; cv=none; b=Cp8jEjWMEjJeDVpm1LJev3yv8W+2cxZQt1I8z6/FXsUyABxQMsXK3p/1OZv0RMlUx1CnPbRnRqWRkPHs5LIlkjSWKav8wjfRC9EcRzCbMQhp8clq5QBtTmkfxHB45RI/6LC/mOXsAhZ22uL1CdH3c0jfzMG10g5uy0oyp3IlzMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753364556; c=relaxed/simple;
	bh=kMhPDLRft58cFZj+7bDbN07osFzXbyRLO+xR3b0qJmg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DBNPfSQGsBOW0Vum/JTgcWMjXfTKPypBK1NcGTs8iJo5Q2eC1tzC5TA7tdxkdgNv+XYIG+NgbZD8R6vDZzDh8tyaXfF8lMtFQwRyYN2M4Zl9N2Y4SoJGbAOpt0rR+tcZsXWsvlpnkS2B22wESbMZfGCgeRyti/y9/L/a9Y1/k8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YDISVEdl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YDISVEdl"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9afH8029601
	for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 13:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tsUjJO0iLJb/UG0dtmULJPTzB+FcOPgkwsm
	DaJ4piAY=; b=YDISVEdlwwJL4Jp3sjRXEiZnt7qMrCT+tple+g2+hVnF7wei8xf
	eKrbR4FPpc0u77TTC57OI0M4tw/8l0mrG9PyPqVu7enK4xFrCyk65eyqSagGoLK1
	igjFIbB/aLVgKWYix+E6QQGQeHnVBbSceFEImZkGDnCPBjBdgosE7NEY2gINkvPK
	/HqK8JXo+qvw0dezTKP36m07BnyDcOmEF4Px1WOkxBhwKwKrjQQIg75SGcK1B2fv
	XIH9to7szgfYYKo7fdRpW/njQ2CucprPT89S1pdWcw+jcLSYG9A3Pm7OXHPy1u9V
	2r77cd/hF+Iq+mcO0AC/CLFafQmIubS8GIA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4826t1g743-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 13:42:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e1aeab456cso133870885a.3
        for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 06:42:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753364553; x=1753969353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tsUjJO0iLJb/UG0dtmULJPTzB+FcOPgkwsmDaJ4piAY=;
        b=A+SIyp5ouGJTN7F1AY70PEjeJI+XQckvmFPSs76xszaB7d2kj2UjCv3ez6x8elP2GZ
         Gsj6HQ/3prsEAJf2AW7TzqQ5SopUtMgTradTJCY69rHohHgufHHMlhODH5g8Cz8WhDfy
         r32qWZo8WUt2GMqYZd6gLdP7aY40/U46kTN3xlUAfd9O0yh0RfdWRa53m5jahKL4c5ZV
         qqCoF72CFadrsvsM9DVnU7cmisOlcnWFpIGrxliJ/3+NYOXMqsb3BEC1sUCjXZD+CX7n
         7lwDixfsJF3JElgIpiMcDzocRnNo9n4VDR2wZpq39DhJRIvUpkgHc/S+vnE3M6Ep9boM
         sUvg==
X-Forwarded-Encrypted: i=1; AJvYcCVq3RcqzBLdTiRvVDzGFDTOCcKIK/d4JdWVKCS/VJRqgzasQITokjd4/3b3H/9ui9BHAd9fsInnaNQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7kI4QPiYZ7DoCWI6Uxzu4s+xO6/vaD1/lNskfG6nSzNOY/xQx
	FAz2JY8ypcHNa2RyL3+4H9qzetdYmjZnCZa+DF/JoBXAUn+Rn6qMMvCdbd3ZOhMMPw2P3HGbvBc
	zFz0iJsl/qtmMuVhDIPTwfXo/nsOiPOohylBEuoVF5ENzB+isncdDzktn5txrF9o=
X-Gm-Gg: ASbGnctxiUwjRO/x2p98eJ2nCTIguRrndUW+YF3qrSsQ8pfeahXGjig7NhXE3+wmMMk
	rYtHwJSA+MBl0eGYsFORGMsDPqaH7O4oLx1QJ57QVvvrQkIQzsdaLshqpgMetChgfH5xzz9uL8k
	O39bkTBI9+R99wITWUIeRlfT7iChPY2i9vMCw6rx6QMQCU6mvXYsVQWgfD28uF7WuFryhDCpmqZ
	GRAib0eSw1QC9CbdvvWRKfQEMjYYVkRXzp5nrnudY8p8BQgKPfzBWj1jxSN7H9Vv5dfp9EC63mx
	mQXIX+s1hqZO/8SYU7t/JMcPnLOWN4wXcpui8jiQHpJgk1KlXPuBMQ==
X-Received: by 2002:a05:620a:4095:b0:7e3:4413:e494 with SMTP id af79cd13be357-7e62a1957b6mr823188585a.60.1753364552571;
        Thu, 24 Jul 2025 06:42:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaDLmi5F7qLiXnyBH4lS2oCZRlvOc0P2LHa/r9heMqn1DJzqor51NTb7bwX2PM8IlM8IoNgQ==
X-Received: by 2002:a05:620a:4095:b0:7e3:4413:e494 with SMTP id af79cd13be357-7e62a1957b6mr823183085a.60.1753364552035;
        Thu, 24 Jul 2025 06:42:32 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc7885esm2228471f8f.35.2025.07.24.06.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:42:31 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: andersson@kernel.org, sboyd@kernel.org, broonie@kernel.org
Cc: mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, srini@kernel.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 0/2] clk: qcom: drop sm8250 lpass gfm driver
Date: Thu, 24 Jul 2025 14:42:27 +0100
Message-ID: <20250724134229.103001-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jYJJmyM-uz8LSliUyj9Hc8fWHjlsNhRb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDEwMyBTYWx0ZWRfX01BXv440Iw30
 i9HpnR31IQkzGzW92mJT9M7D21TCv02z8IAa+ol3BNZNuNJ4nXTO5F0L2w5mhi5YGYnEcZuyv1I
 mxAT1ZNBgAev81QfLW4X1j0snjpgvABxEcySmMRcTa2antaZt6zWAe2fex4gH0A2rEmvs7G7ul0
 HmBq3kUqX9eimQgAvx8Q1ytZt9/jKSi9HTq+giHouyrTYFh9H+NmQj0Jn4sfKZyw+xn36eVLb9p
 g5m0G8EaYygbPzhogytpr03JD1f8zRShoeJOQHFeaMkKbdCoDUJ6Q3ddSWFEQ1wyy1DrVb5H93a
 4u2Dk/UuOjo5doMA46CBjlCdaRlz0k2NsF2IhWmP+P7EnMxS8k48nJFGrmCpDheltavmKIWUdig
 3q5Fbe22Ml2sFpXlzGiIMEUZhzRIHRN66bbgAIO1G2rUMvYFL3q+ZPIn/cN/5723lYKBWY3U
X-Authority-Analysis: v=2.4 cv=E8/Npbdl c=1 sm=1 tr=0 ts=68823849 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=FWHBK-Jb_X8E8erFsI4A:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: jYJJmyM-uz8LSliUyj9Hc8fWHjlsNhRb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1011 phishscore=0
 mlxlogscore=690 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240103

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>


Its been more than few cycles of kernel releases that the device tree
has been updated to use dsp clcoks directly, so there is no need for
this driver.

iIts time to remvoe this driver, as there are no users for this driver

Remove this driver and associated device tree bindings.

Changes since v1: 
	- updated lpass-wsa bindings that was including a header from
	  gfm.

Srinivas Kandagatla (2):
  ASoC: dt-bindings: lpass-wsa: remove un-used include
  clk: qcom: lpass-gfm-sm8250: remove unused gfm driver

 .../bindings/clock/qcom,aoncc-sm8250.yaml     |  61 ----
 .../bindings/clock/qcom,audiocc-sm8250.yaml   |  61 ----
 .../bindings/sound/qcom,lpass-wsa-macro.yaml  |   1 -
 drivers/clk/qcom/Kconfig                      |   7 -
 drivers/clk/qcom/Makefile                     |   1 -
 drivers/clk/qcom/lpass-gfm-sm8250.c           | 318 ------------------
 .../clock/qcom,sm8250-lpass-aoncc.h           |  11 -
 .../clock/qcom,sm8250-lpass-audiocc.h         |  13 -
 8 files changed, 473 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,audiocc-sm8250.yaml
 delete mode 100644 drivers/clk/qcom/lpass-gfm-sm8250.c
 delete mode 100644 include/dt-bindings/clock/qcom,sm8250-lpass-aoncc.h
 delete mode 100644 include/dt-bindings/clock/qcom,sm8250-lpass-audiocc.h

-- 
2.50.0

