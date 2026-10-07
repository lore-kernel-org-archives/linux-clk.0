Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A534C40B0E7
	for <linux-clk@vger.kernel.org>; Wed,  7 Oct 2026 06:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791355858; cv=none; b=fiqM9mPCeO54HaydFbIIdWsdpWh9yIvKe10shsarJ10CNv0D31IMilkZaYskCgz3F52fiY0xLORcxDgeOfs6/t+0mPEqZ/o2CfmtOCF2uaNcK5Q9X/M7B2zAJKf6UkpYuz8qiMnpPr3eJpi+6Y3TH2hg5ne0xPjqWPZ+G3DGNMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791355858; c=relaxed/simple;
	bh=Ni1lTQeRbFImYjymCCxoP08AlDfxpAcx3Qkva4hCzAs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l0JjpKRifq+IxhEO8IRpszANLkvLgOjIwdJOisjfDZm7QRcqHtnHmYiQTOQHigxr3OlkqIDv96LBGBZsV4bk3m34dkpUcGZ8cHjzavwqiHiuyBWNVIMUO7/JxqW2lEdcT+H68bRMP/x07TVQ9aiPt0hRVVxNEMROdENyDPP9Y6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VtFDngL9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SkMPLFtw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VtFDngL9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SkMPLFtw"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6974U7I42295200
	for <linux-clk@vger.kernel.org>; Wed, 7 Oct 2026 06:50:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=a11M7BngOPJoTkOyICJz2w
	OVpKy80IFCeWDMdq/5uas=; b=VtFDngL9Xd28E4NoJrmFjjGzr8Pqu+AS18g+VG
	pc/DFFYbIeE5u/mrUv+HZbP54JaRm/ov0XbVnhBk+LN5KFugFz009bRIZVH/b+NV
	vOeR9HzpHfeFxPxkYvSokviYum59woQIRHfF7iLVyi63SYW7dYR0Zu89eJmiww+o
	K2SwUQrkO6E62J+Nze89Srv+G13AVSBl49gX6uKaOv+ehrZO1wmrJb3krvmb1Zcv
	P5dW0iPbbX+0zPgf1XzioqKLAWS0LJfuuZgxOA3X7sop/uIpS3AofjTuKwxHTS+G
	DjL1ekgHlog64q6wJ6LQ9HdalpxhnqXL2QlgdGj+ZVFK4EjQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c1s0yr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 07 Oct 2026 06:50:56 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-147be78cd56so13749972c88.1
        for <linux-clk@vger.kernel.org>; Tue, 06 Oct 2026 23:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791355856; x=1791960656; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a11M7BngOPJoTkOyICJz2wOVpKy80IFCeWDMdq/5uas=;
        b=SkMPLFtwByaxpYZv0QrHbi9tISO0I0Xx970GkbfZL7cXjr/Nz/ar86A3a2F51yd3oX
         ggxkRpQrbrJYKot6X561vvl+trNewq3mMhmQzFVMUHkMy5/kbYPscbok2MJBy551p7Cd
         3k1QBQmueLFpKlnipB/CvBPXEuF+D9RQ2eqMC2iESicFiwxgH1Dtn/2PX5Y9dY+Fj7m6
         2cmIr2SD9P/4ekEhf6+TyizIrZN/ipVaBe3MnjZK4GvDd0LWcEum8gqJCXV+h37/D34x
         4vGpnligYb5HwLzo8ed3WYOR9LczeldVHnmzVLKiAg4BpM8JCYi+3X1mDq9naF0aZbwm
         DA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791355856; x=1791960656;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a11M7BngOPJoTkOyICJz2wOVpKy80IFCeWDMdq/5uas=;
        b=zyknad0RS4Lq13LxNuioS+961VBzecY8hPdqAVB4c2X+1D75C46tpmEbnVWbK6xHK+
         uOrM4D+NYjnq2MBSB+SkylPHMqiMLgas5WYJ9K+QOMlKkCUh6muNnxuDnLLvJjJTXa2s
         ga+s3w67d6ngmrSn4vH1KWOPPpOckisx4GWhqE2pj7mSRT13op5P0yis0VREMXbduYxe
         XWSwc7gV84INZA4NtwxmSfU6uZ5Ti9sow5AlSnEfI2/tVMUFUOvuZ3OWurQDAwT53aBU
         n8XcHZnsBehHXnrVa0T3mZMLk4vTdEZLHOzplD+eI/hBW9yGvTMYpXRbwNk8EQOkPBMe
         9OTQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYzrxqIDvfmhmPE99lErsPEd5eFXekyQdD0z7kwoOktjOZJ6OS2ZW9vMWP0TUQxwMl7Cwf36O5uF0=@vger.kernel.org
X-Gm-Message-State: AFuF++k7jlpjlGYlVOQV85udc7i+9v/3npQSA0RHB+Ab8ihzugqoRJ2P
	vtW0UvtCjAn2VUR4qJF3iHN9KWH6MhVMAen3FfcRpVk6zwX7t9WIMF5VgX8RP7WQt+ONOZefVNS
	9dlvHrUDAv5i38rqjSGCWzLAa2QyGMiNeA6raI8F7pftFCuOirdI9FEZJC6o/7jY=
X-Gm-Gg: AYBFou05Iq8lw0LrA/vn/8IVIvtOh6zzziuYDRJbEAFaFUAHKA/vqbWU7AsKfn0RfIS
	ZELngjn8m1fnmUV7G6G7EV2yBV6oV5CF6m/bfCA1Hx7Bd6y2SQHMPn6YswpNOF/qGshRcSLyzTK
	fjkvwi/bLHjh+bgRuP3ehuW9fxAGwQMlPzmjsepqkdQLRbwgdttem20JrEbx5LIapOIJilxThhK
	UwH9Ip6M3mdW+KZoeKgplr4zb4tkcyG1xkAqO3xlV71A0xr5/QDydWhLE4lc5kHJbZV+ESOP7I3
	yfKywmZEqJcfD82wO/9iKf8lq+8oMXdZS0pLHTFw3oXaFWbH9oIUTilZ28yX1PnV/wV9s8Ue8UK
	/Q25Ix1zBmmau/iZdoiW3gbGsjuZf+ORRl/qj713hhXiNC29LoDY9ib9B/XTuiOF8cshfXftZBF
	EpRcttlkCXjyn8l3TsDx4lzzDpzu2b2slTFdc=
X-Received: by 2002:a05:7022:3a02:b0:143:26f9:33d4 with SMTP id a92af1059eb24-162079a5f27mr1774323c88.34.1791355854434;
        Tue, 06 Oct 2026 23:50:54 -0700 (PDT)
X-Received: by 2002:a05:7022:3a02:b0:143:26f9:33d4 with SMTP id a92af1059eb24-162079a5f27mr1774273c88.34.1791355853728;
        Tue, 06 Oct 2026 23:50:53 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm7374730c88.2.2026.10.06.23.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 23:50:53 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/4] Add Qualcomm's IPQ9650 APSS Clock Driver Support
Date: Wed, 07 Oct 2026 12:20:43 +0530
Message-Id: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMPrxWoC/yXMQQqDMBBA0avIrBtIItHaq5QiGic6VWyaURHEu
 xt1+Rb/b8AYCBleyQYBF2L6jRHqkYDtqrFFQU00aKkzWWgjyP+LzMiy8sylHXrh3FMbTNO8UQp
 i5gM6Wq/l+3Ob5/qLdjo/sO8HEqeygnQAAAA=
X-Change-ID: 20260925-ipq9650_apss_clk-ff825e337d11
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: CQkoD7-gOT5EO_5joMBQmHhyjpAsDmgT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAyNyBTYWx0ZWRfX8lv0tb3MKGs4
 DWkh67iQ1t6Y7QwPHJbhcs8FUEH40TMs74kQMaFuRXsmL3v6hrAxCKaTbWFq+s2p7sc9U1/zbbt
 So8DHk5QMlZJ+zPHN0YFMIHZFuJ04IQIZrlDkkhw7gibjr2ZBsV9Pxxvi6b8AWUq1QeV7QExVmu
 kslzCRFT5bMJEsasNkXH6Zip2i71g+UfQaIUM6xPcHmG7k7zSa0X1Xi5v8dDQ9oU88ijAElxEaC
 ZNHx16QCAGWBZ8LdM2BxpYqPqX08EqP+angK/UIKz/DISy4hsod7N19BHpRCqhm4LyzG/m7O8N1
 azoXEbUae9SgxGIve/dH8MFtGaLtZwO96WWYWhWzKJMYwcx+LwBZTw3FewHxrr3xnI/nlykY3Eo
 sJlB1OAXlGu76NNu4GJEpBZ+6bHr2hySh4xTLsmENapC3qte42UERZqDpvy5IZnb+7I3EFijjeG
 YaXMoGekwJEKXc0A35w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAyNyBTYWx0ZWRfXyJobPSd6jTnu
 7JrF2/8JHHaMHEwI2PlpWvBYbp4ZkQPFHFK6lyD0v+vhgeNDvU8CDaPXEQZANa8VE4qVZXPqJeg
 bfopt3I2ZqyKxxY9jiDn+xSXm2ONlj8=
X-Proofpoint-GUID: CQkoD7-gOT5EO_5joMBQmHhyjpAsDmgT
X-Authority-Analysis: v=2.4 cv=NatzRGD4 c=1 sm=1 tr=0 ts=6ac5ebd0 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=mshoYkgwlum6hxNOkgkA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070027

The APSS clock controller on IPQ9650 provides the CPU and L3 clocks. The
four Cortex-A55 cores (silver), the Cortex-A78 core (gold) and the L3
are each clocked by their own Zonda PLL, selected through a glitch-free mux
whose parents are XO, GPLL0 and the corresponding PLL. Since the L3 has
to scale along with the CPUs, the controller also registers an icc-clk
provider in which both CPU clusters vote on the L3 clock.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (4):
      interconnect: icc-clk: support N:1 master-to-slave topology
      clk: qcom: clk-alpha-pll: Skip Zonda PLL configuration if already enabled
      dt-bindings: clock: ipq9650-apss-clk: Add IPQ9650 apss clock controller
      clk: qcom: apss-ipq9650: Add IPQ9650 APSS clock controller driver

 .../bindings/clock/qcom,ipq9650-apss-clk.yaml      |  58 ++++
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/apss-ipq9650.c                    | 385 +++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c                   |   4 +
 drivers/interconnect/icc-clk.c                     |  45 ++-
 include/dt-bindings/clock/qcom,apss-ipq.h          |   5 +
 include/dt-bindings/interconnect/qcom,ipq9650.h    |   4 +
 8 files changed, 504 insertions(+), 7 deletions(-)
---
base-commit: eea3fef32a9cf36abcb5975a5a594e4135a6b026
change-id: 20260925-ipq9650_apss_clk-ff825e337d11

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

