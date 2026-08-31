Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2B4560AD8
	for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 13:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788184060; cv=none; b=IvDVZsbjj5UrxBBn0wso263XvybW1WS6ETIBds+YnI/Ye6OLoT7ib6rn5dt6eULKxJKz2woJ6kzNfnOhF/lyx6RgfavHxY0pBdw5n3LDLveq/InqS2l8R75LYNq8zZsDfZ7wk0uYKu01hEvZw4B6AfYn0gP6je/qr5hvBFthxfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788184060; c=relaxed/simple;
	bh=/nO0Cpff0yx61nS6yN0kn4Y/CRuWwctaTI+ET6wFJi8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pQQGAhhnJLVh0nyFWlLBp+OFevrMkP5kBRAkn6EUlugBkF5mlhwvVO5eB6mnYJFSXSov1TemxhMBbem24AtDe7qoUSuqX0GdMTuif+16YsJnXf6g8e1WfxpfEBoWgfuvq44HS/A/PRFDcmB9+x2645EGAhqziwMVzxLWl+TUcsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=imywTNVq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jQdVjos6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="imywTNVq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jQdVjos6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VBASOg3255800
	for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 13:47:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ElUpCCZ5QXQFa0YF2BRx6zqlfZx9TQTRG0x
	3mmrf68k=; b=imywTNVq9ISTGUdJzE1fuV72RCsBezqjlN2xM4Bk0y2ft1ixezh
	D2hnPIYrrAdQ+ehwJCgyzE+22cCvT3cfs+hz7bFeCt9ast9pIQZmvG0jwT5bRSnI
	KfRa/m6fV5SF+K886S5JGZuSKGa4u8G/DY5SE/6q09VIYihCIb0C218uFJvRD5Ao
	syij61uoc4BI/9TaV+7I5Kj9IcwRF5GQqBmLUv/d3SWxci3ZNkM0l9gO1sIUlKp3
	7ZSBbIiI2f4C+eGc3PwmZngNGwf+Z2bOsRN35mGdsn9oE7Xd3z/uqN3S3VpAHZpy
	WxTsGn/EarfR7no41Wo9oc1x5kiZhidzD3g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6yas2ap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 13:47:37 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc12e8e22b7so8866123a12.0
        for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 06:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788184056; x=1788788856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ElUpCCZ5QXQFa0YF2BRx6zqlfZx9TQTRG0x3mmrf68k=;
        b=jQdVjos6q0iYT8QniMZGzqbEb+yWglYeMOcBwJWsrykncHG5XkDjj5xUgNilxmXbkp
         UV9kJM06oFqLeshsCDpo7rAdudFSRuhZxFK2+trPjaZcJWj0Ao9t+DBSLWEQ/1EWEy//
         AX95RXcaqVcAJQUh9dx7Uz50T0yLptG11t0Dt2NtakRn9SiEccvXxCIICpYBykyVI6bc
         6V+VCrkNzeUHgbbGwvh/OpYK6fNZyjzOUHB7W9GNcO0vzNYzuBjGZYJ2iPnRI6iRLZ5F
         aSph99yADWDxXWGXMVQeX2OMEK799Rwy9IumtCKn1ice3+ewcjmraqiijgdmSyjC+xOi
         140w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788184056; x=1788788856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ElUpCCZ5QXQFa0YF2BRx6zqlfZx9TQTRG0x3mmrf68k=;
        b=rpzQSHdGQEg89jBE66IgIxUKXjb7YZZT5JOGUPXWK5wXbYmUH72rq16k9qaKTTgzO9
         B8nDNjFtqt/pPlykycTprRKbrEkFI+GDc3G7dglOHoJxO6jkN23zjtKMjHvZ6ORBib9a
         7FL7ta9lia2yr4RYucRGwBkP0Bc3uaVPjKC8zQJBfmEy30gzlTT+laC+5o4UnyZ4xHGd
         KMEML9ED9S+jbW1fisz+ChyT+MMPHSPamyvmKLqxMcCUXcU4S+47Cio8WlMNGuY/2P2V
         zDbZYNFwtKXLb3/DAwNHoNtfBZvRj7LpXBFoW0yb22qLLPGlGs8HYoGPdi7wXyyzfllS
         gH6A==
X-Forwarded-Encrypted: i=1; AHgh+Rrjnb3vQvsNgskesmqBiNBLtDobk58I62bMvQaks4cqn46mgDAPrUXPMPaDD0MiRUwrjuTZRqEX714=@vger.kernel.org
X-Gm-Message-State: AFuF++n/WLNff5K5q/C/8/s1ezKcjVG0hSUBc9FhOgnvfPKqgoh6PJ9q
	t56Fu+BPgrfNuVLfWXrt/fRUmLpW705sYHudUVrwVJzRo0beK7XaGsOHNweKuoPIbi5DXt3/O3j
	1jmLH1O2kXSBwjc+UZLAwhIEBLVF/zZHhtAxpzw3hyCxaN+KzMee2/hB33YNU8Vc=
X-Gm-Gg: AR+sD13lqqQpFp7lfPd2RRshI64i/CTTLVgY/tCmuCWNFJdzBDNx0pofZYWoWC42vO2
	x54YVzBVInFnVN4uMP4npI6eD7BqteP4SFcWvj+x3n5KmEJaM+XV58Xy4CVpkBVITC1n1nVPFzM
	VCDKxkKVPRM8O8t44N6rdfCcE8BqJx/99RmZj3ns3IV8ePOitaX9q/pBHv64tTZawV2bvXA+l55
	9zyKQaVufe5YNHHb23IwRTItnF+V/h8r5IzZcl1J47BMYfT8kFSJdNb3oEGbcFpFG5LeKSnE9xb
	leMGuunEgDe9juNuy/hDdYRydk8EznC/Q9KZ2Rox1dXnGKP2TXptT4Tz+aNahbp57Jxgd3c7+lP
	9pvXM4QoNGGWy6Vu5B4/XAIG0ReA9xOqO4rqwzQT15BbQV9Nvng/nzyUDxBHC
X-Received: by 2002:a05:6a20:a123:b0:3d0:d0ed:f141 with SMTP id adf61e73a8af0-3d265329781mr43053623637.2.1788184056249;
        Mon, 31 Aug 2026 06:47:36 -0700 (PDT)
X-Received: by 2002:a05:6a20:a123:b0:3d0:d0ed:f141 with SMTP id adf61e73a8af0-3d265329781mr43053539637.2.1788184055698;
        Mon, 31 Aug 2026 06:47:35 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328713b0451sm36548784eec.16.2026.08.31.06.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 06:47:35 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] clk: qcom: Sort Nord clock driver entries in Kconfig
Date: Mon, 31 Aug 2026 21:47:17 +0800
Message-ID: <20260831134717.510383-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDExOSBTYWx0ZWRfX41ch9iGMi2i1
 Ya8Gf17fJnMh4PHkqPzhcLoNy5Wh6UROawN2u8Bqu2VpWDCU6mVr/whDfThxPwbns03aomw79rQ
 ZqajCEAmQgCAwnlF5Zfb3vTryR7eZsg=
X-Authority-Analysis: v=2.4 cv=CpaPtH4D c=1 sm=1 tr=0 ts=6a9585f9 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=vrDzJWvLJd9NzFkxaDYA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDExOSBTYWx0ZWRfX2TDDCqaOTTUq
 bpGlvQBW6S9c63CkS3h4JU28FC9dpWYymGUc80gP0amKYs2gpmfhXWI1h4LUdrAtQ9gkEGCPKgb
 ox1Rf8aVGabiet5kdhUnvcZzxMCQFNAyjx/6TIU40SQgTDKBIJIUwUZoMOyFeSTcfTlm0s6Ujy5
 Gbp9IgbGDrvzbvxaY2AV9JlT9iVF4ktMQ30tbFrJu5bjDqg0LctmTWV4qcTx2X4WK688RFMTrUl
 vCU3DBNqMKLqhyGpkcR1T1c68OjQSgy9vJkQBFPTCvZK7gBbcVfZU9nGboKgWxZjX8HQJSNVECG
 jNc/WqJRkU3LFZwYHXz0dB/bOJcEzgCZZUu/89DoeTwSq6nD++rCD8FbigAVv8Fpxs2iqdRNylZ
 AA4r6VxFpJNiKyS/FfSrQKNn1GuYCIpT/FNBDMQsq5IxQQP8KN/rm96jw/PjmjQz4nP98IGBqYQ
 6rKmnpsWBzqOOFSXkfg==
X-Proofpoint-ORIG-GUID: 7z_gP97BDUdNUB7dm5tl7fP5xgKYS3tB
X-Proofpoint-GUID: 7z_gP97BDUdNUB7dm5tl7fP5xgKYS3tB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310119

The Nord clock driver entries in Kconfig were out of alphabetical order.
Reorder these symbols so Kconfig follows the same order as Makefile,
making it easier to locate and add entries consistently.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
The patch is based on v7.3-rc1

 drivers/clk/qcom/Kconfig | 58 ++++++++++++++++++++--------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index d1fc9bf87126..54f20a6f2bc4 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -181,6 +181,16 @@ config CLK_KAANAPALI_VIDEOCC
 	  Say Y if you want to support video devices and functionality such as
 	  video encode/decode.
 
+config CLK_MAILI_VIDEOCC
+	tristate "Maili Video Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_HAWI_GCC
+	default m if ARCH_QCOM
+	help
+	  Support for the video clock controller on Maili devices.
+	  Say Y if you want to support video devices and functionality such as
+	  video encode/decode.
+
 config CLK_NORD_DISPCC
 	tristate "Nord Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
@@ -192,16 +202,6 @@ config CLK_NORD_DISPCC
 	  Say Y if you want to support display devices and functionality such as
 	  splash screen.
 
-config CLK_MAILI_VIDEOCC
-	tristate "Maili Video Clock Controller"
-	depends on ARM64 || COMPILE_TEST
-	select CLK_HAWI_GCC
-	default m if ARCH_QCOM
-	help
-	  Support for the video clock controller on Maili devices.
-	  Say Y if you want to support video devices and functionality such as
-	  video encode/decode.
-
 config CLK_NORD_GCC
 	tristate "Nord Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
@@ -213,6 +213,25 @@ config CLK_NORD_GCC
 	  SPI, I2C, USB, SD/UFS, PCIe etc. The clock controller is a combination
 	  of GCC, SE_GCC, NE_GCC and NW_GCC.
 
+config CLK_NORD_GPUCC
+	tristate "Nord Graphics Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_NORD_GCC
+	default m if ARCH_QCOM
+	help
+	  Support for the graphics clock controllers on Nord devices. There are two
+	  graphics clock controllers on Nord SoC.
+	  Say Y if you want to support graphics controller devices and
+	  functionality such as 3D graphics.
+
+config CLK_NORD_TCSRCC
+	tristate "Nord TCSR Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
+	help
+	  Support for the TCSR clock controller on Nord devices.
+	  Say Y if you want to use peripheral devices such as PCIe, USB, UFS etc.
+
 config CLK_SHIKRA_AUDIOCORECC
 	tristate "Shikra Audio Core Clock Controller"
 	depends on ARM64 || COMPILE_TEST
@@ -233,17 +252,6 @@ config CLK_SHIKRA_GCC
 	  Say Y if you want to use multimedia devices or peripheral
 	  devices such as Camera, Video, UART, SPI, I2C, USB, SD/eMMC etc.
 
-config CLK_NORD_GPUCC
-	tristate "Nord Graphics Clock Controller"
-	depends on ARM64 || COMPILE_TEST
-	select CLK_NORD_GCC
-	default m if ARCH_QCOM
-	help
-	  Support for the graphics clock controllers on Nord devices. There are two
-	  graphics clock controllers on Nord SoC.
-	  Say Y if you want to support graphics controller devices and
-	  functionality such as 3D graphics.
-
 config CLK_X1E80100_CAMCC
 	tristate "X1E80100 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
@@ -895,14 +903,6 @@ config QCS_GCC_404
 	  Say Y if you want to use multimedia devices or peripheral
 	  devices such as UART, SPI, I2C, USB, SD/eMMC, PCIe etc.
 
-config CLK_NORD_TCSRCC
-	tristate "Nord TCSR Clock Controller"
-	depends on ARM64 || COMPILE_TEST
-	default m if ARCH_QCOM
-	help
-	  Support for the TCSR clock controller on Nord devices.
-	  Say Y if you want to use peripheral devices such as PCIe, USB, UFS etc.
-
 config SA_CAMCC_8775P
 	tristate "SA8775P Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
-- 
2.43.0

