Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F4D4ADD96
	for <linux-clk@vger.kernel.org>; Fri,  5 Jun 2026 11:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780658369; cv=none; b=sK98ryX83DaHbadpaT4YRdOe8V0rJVsEfXiq2zRa9E8z/2h4tvXlK/7uh747AaGJ5YFVbJwrz1zu+ZUojRKtTeshwiDS/hGBl91CvRVYZwCwXE/UzpQD4gKxHOHkoBMpWaHi0f6tUBv0Ww1i5WY1EMXHLNc25Ivv754GZ7r1XVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780658369; c=relaxed/simple;
	bh=Hno3yiqDgD9bZJJwY7n5fLKWiLMFOXKg1w6K7rsVM88=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JY2iMM4y0DbEu0J+utvfgdvlE7LtaFpxfOnUS8BXEziGAKNFAdmqddPzm8w7K0nFGs55cFRklRA+UiEF31xMPrTnnm7HZ7zqC4BFFpE1KrtZQ8vhr1pDBZBX3ZvD5XjL7LY1EKo1e04zUdokg5/DjhfXvcI6W3x+8JOl/k45nbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ThW7AMW/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IEdeIjhF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ThW7AMW/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IEdeIjhF"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6556NjFg3111397
	for <linux-clk@vger.kernel.org>; Fri, 5 Jun 2026 11:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FQqVQt5Xe7OTDM8AnHOfVt
	1NXuwCB3WyrISJperJfGU=; b=ThW7AMW/iPZ4fmrXI7tfwQs2hv/iXvBblj7btD
	0WHSUVdV5zSd1i0A6d5+IZvomKvdLwwv5dw8qEBsFeb1C+4sYuWSBVRHdchdi7Q5
	8Ura+L5bZjjW4izWSe63gCJOJzYRXxTW56GzIqe1tTZsRJROst4lOT8Yz875UwGY
	WE1DHKjCuRyULZ0xHKlzk5nXzoIRFGWejRg1vhh9+82PwooSIILDX3FDvSMG8+Yw
	od+PHFy1/Hk+kjJ+vXqD5uU5gC2quPI5f8Ui8Ofw+2OwaL6BN7/aoEue/1cwucSc
	xgn6BuKinLsYqQW//o61SwMOE7CLFeu59491WZnoR5QZERug==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekfv737pu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 05 Jun 2026 11:19:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c20f7581so21485685ad.0
        for <linux-clk@vger.kernel.org>; Fri, 05 Jun 2026 04:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780658365; x=1781263165; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FQqVQt5Xe7OTDM8AnHOfVt1NXuwCB3WyrISJperJfGU=;
        b=IEdeIjhFL9c3LYeF2ZxU6YNlZ9kRP34naCrgLfkxkv6sI+OIFrkScZbauokSs8YhCF
         FQ8ge0PQPQH1VniLx1N7GnSzA1MCC2KSw75bQE8Ur96wvkYrcxJbKHLvWAV6ObwlF1I9
         AGl2XD0jcwrPhThVzd6j37NubRMQLD6N0u6CZEt+NfqZcfPm+ZznhuXFPNfm0BjhVGIx
         3cdkuurXWaIRexuOfqm0UK5f4bkTK64quCcirNQPS9f3ePCwHzIr0Vq3kYVAsGpHW/Oj
         RE3mHgnYQ2xuJuyGGBWTHOqFlEhLcPbcmdXZPyIBLoSTosTZK6LhBA9Z99Qzv93/Somt
         BpCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780658365; x=1781263165;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQqVQt5Xe7OTDM8AnHOfVt1NXuwCB3WyrISJperJfGU=;
        b=XhUplfVClFSx+O1BB4TKfzQGQumvFi3vNLYlUpRLCFCGl7M4GWayzrLayEgIL3MvLJ
         XMwsmpSosRz1dXMxDS8fz3fUSWVU/WQ8Jm2S1s7Uw4ccbgqkJF3D2C0yulgr5ueD6sgx
         lQR/l4aY3yS0f3iGxWnY8TTjvnaOllTpvXlJ6AjojYV1YfOyuhCREWRjDoc8zj72dpeQ
         mq2epKmh2aaOTLKBXtafyCLLaUVGarHG/x95S4AEGzv6DpeSjbxWy01viA1LW+abmda8
         hGrXA4VXmq+okDHDE9mYN36fGK1Z4uwSRCSs35BeAFAww8g2qeJT7VK43HQB/EgxSSTO
         knbQ==
X-Forwarded-Encrypted: i=1; AFNElJ9J2cnAqCJs357Wpxvag7Y26zg+WzrCRy4x+2z2frBDXKjIF/YhYG8USfFh2D3jPX4qbSV+Mo9eUB4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaRLPFrsIpnL9aqtvCjct05ejF8Kc/gBEopeZamZe0TSCnXHkC
	jKlj4/L2U1NlZI3KYOgqovh60d76YOmhC2hPhimotgyjPIvRHCcldqBj9mLBWopL9afDlUoiCd5
	7+xDIonDfVeKazhCStGkSaf8M3yiItu5+LHDVxQFU9J/ykkDXDWaLoIaQ/ShDRAA=
X-Gm-Gg: Acq92OEPEdG70N8tnakgYjbeYHjwb/CGLR85B7yHp1iPwXsTbriR7AkoJCMXksFBJwa
	P9iFZ7A7Vwu5ZWIiqdVE2fjBePgzqRYe+RpTsqbfpNWbSbw1e5wXhoOJQE7SCQXklNLdB8BDVMe
	E2FSGUHiknP/C47kDZ5VdwcuRnt35ZKoOSPBXfe+NZi6K6sR+m4mxQtrATsmgj4T/2kj6kMH3dm
	FaZFkFdqrKCerfcNH59vOsnNvdD/FdPdWyoMSET0CC2TUbjgT3p5z1AguiCuAK+S7N4eMagGlMq
	rSMisIqqs0WdxxTOM/awA1bXXnmELuElTHaE/DUHzP3fa9EtX9D4iu+yv54Z7wWufW7HPBGjCYg
	S8v8UOzMRE3ZW4YzUryMJaWNNz3OLVWNjkdGNsa69j3ES9KnIu70sGagpiwfNR8w=
X-Received: by 2002:a17:903:4b47:b0:2c0:a57c:ebff with SMTP id d9443c01a7336-2c1e79e2110mr32863255ad.2.1780658364705;
        Fri, 05 Jun 2026 04:19:24 -0700 (PDT)
X-Received: by 2002:a17:903:4b47:b0:2c0:a57c:ebff with SMTP id d9443c01a7336-2c1e79e2110mr32862645ad.2.1780658364171;
        Fri, 05 Jun 2026 04:19:24 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d395sm124551665ad.17.2026.06.05.04.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:19:23 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH v4 0/4] clk: qcom: Add RPMCC and GCC support for the
 Qualcomm Shikra SoC
Date: Fri, 05 Jun 2026 16:49:10 +0530
Message-Id: <20260605-shikra-gcc-rpmcc-clks-v4-0-a0a7bfb44455@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK6wImoC/4XNyQ6CMBQF0F8hXVvy6EDBlf9hXJQO0CCDrRIN4
 d8tbNhI3NzkvuSeN6NgvDMBnZMZeTO54IY+FnZKkGpkXxvsdOyIAMmBkRKHxrVe4lop7Mcuprq
 3ARMomdHWWloBitvRG+vem3u9xd648Bz8Z3szZev1nzhlGLCiSgvBeVEJeRlCSB8veVdD16Ux0
 ApPZMc4FEcYiVhBCS0qSRjkcIDRHcshO8JoxESuGOeWay7KH9iyLF9pdHWRWwEAAA==
X-Change-ID: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: t1mn3HuUCtj51draHXU2Nx4OaIlBCl1Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDExMCBTYWx0ZWRfXy9kj7V40Vj3m
 +a2GYmAT3D2Hr+TX253NrfYQk6FOuwtQ5cgllEF/ceYCG8BxGQJvbW+LSw3byIkOqJe5CvPJmKF
 Ww/bAPyfbVBO/EIiaS14C4LCNrVgD0O7LiHvPF9VO6oa/UjyMv72xQCklMxnDh4iqQMTGme13nD
 JGNZ5FYkuouoWcxkK/rsuTIsgi4BBmANeqWEQ6nNGJGz/Rdw8vN3Bx+kKNIOoABiTxwq52Z5fgM
 cUvQivoqsHncJZewsZw2tQRsWZs0pETMVTBfXwFXD2uGadhSYJaL3dLXY2BkJaTg50G+NtpyV1O
 BnOPfXKVjZWvCQp7MBCCnqGHo2EdNxSoKIwqUCsBa5L6zRIalyLBM06ckKVArmE8z0KL2ZWfR18
 4euCl895+RrLmkmpVIhKv+RjGx8ET93PyMEIgbnuGh/+rDv7WF4U07v/eYyvc0sJwTjttdpo3ZE
 8yfwaP5jrmRUohl8OpQ==
X-Authority-Analysis: v=2.4 cv=JNULdcKb c=1 sm=1 tr=0 ts=6a22b0bd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vqexoKkBG-sCeqS34qIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: t1mn3HuUCtj51draHXU2Nx4OaIlBCl1Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050110

This series adds support for the Global Clock Controller (GCC) and
RPM-managed clocks on Qualcomm Shikra SoC.

Qualcomm Shikra SoC details:
 - https://lore.kernel.org/all/20260428-shikra-socid-v1-0-6ff16bad5ea2@oss.qualcomm.com/

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Changes in v4:
- Updated GCC critical cbcrs list to add GCC LPASS clocks which are
  required for Audiocorecc register access.
- Link to v3: https://lore.kernel.org/r/20260601-shikra-gcc-rpmcc-clks-v3-0-76c455f5d579@oss.qualcomm.com

Changes in v3:
- Squashed GCC USB3 DP PHY reset support changes and picked the R-by tags
  from the following GCC USB reset series.
  - https://lore.kernel.org/all/20260526-shikra-gcc-usb-resets-v1-0-6d9e7fee2998@oss.qualcomm.com/
- Added R-By tag received on v2
- Link to v2: https://lore.kernel.org/r/20260508-shikra-gcc-rpmcc-clks-v2-0-83238ba24060@oss.qualcomm.com

Changes in v2:
- Dropped defconfig patch and enabled driver from Kconfig [Krzysztof]
- Updated GCC bindings and driver patches
- Added R-By tags received on v1
- Link to v1: https://lore.kernel.org/r/20260429-shikra-gcc-rpmcc-clks-v1-0-c3cd77558b7a@oss.qualcomm.com

---
Imran Shaik (4):
      dt-bindings: clock: qcom,rpmcc: Add Qualcomm Shikra SoC RPMCC
      dt-bindings: clock: qcom: Add Qualcomm Shikra SoC Global Clock Controller
      clk: qcom: smd-rpm: Add support for RPM clocks on Qualcomm Shikra SoC
      clk: qcom: Add Global clock controller support on Qualcomm Shikra SoC

 .../devicetree/bindings/clock/qcom,rpmcc.yaml      |    2 +
 .../devicetree/bindings/clock/qcom,shikra-gcc.yaml |   70 +
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-smd-rpm.c                     |   39 +
 drivers/clk/qcom/gcc-shikra.c                      | 4431 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,shikra-gcc.h        |  263 ++
 7 files changed, 4816 insertions(+)
---
base-commit: b99ae45861eccff1e1d8c7b05a13650be805d437
change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>

