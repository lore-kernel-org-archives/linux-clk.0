Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A994921AD
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 15:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781019178; cv=none; b=UvWl/1S+TZJWYsx3RsVg4uPU/2Uvr8w2t8utLK7bklHv/0ozjvbpBsJLlJODO/neZpFH+RmncBdWH6vRvKaPhmakDewMs+Eiv0uYZP+BgNzWxCoPHvFxdRunKerFqraE8y2vTWm90+WQ9X0k9DHXpEWkMTgLQueNuAGwQ+1ICbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781019178; c=relaxed/simple;
	bh=VhUpIZusEDwNFbqFlc2LibIE0jDqP22f5bKnLwzbnmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eeYKfmhewFqOdXwGKfzBOng/zmBgHKJ53cwmscaNJDQ2NlZ03U34wda7Cqv1vgJajKSyDHSYSLGHtyjjyVA0cJBNz2nYzAiTxR4KRoeFlRw8PMc5WYch+D5vjHTnY4ndNEJurCvqk1sbwtu0e9u+PrNZAEPrxQfMMXc10EbTcrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bplrk6K6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RyLHcCMg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bplrk6K6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RyLHcCMg"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClWEW2706185
	for <linux-clk@vger.kernel.org>; Tue, 9 Jun 2026 15:32:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WTvP0lPke9tdXWHBSp8VVmCBcodaAo5HdZeUd/qpTIM=; b=Bplrk6K68e8hUO1I
	cDeb1LJ6SG7fIslSAwW3xMowylIS9OX22CGqR8HIN306WKETv7Wps+4eyx/OHorU
	ozv098GLKJQX5W+RJOyysGBidcKsMASHHespZPFaJ291ioOwgcYe7Rn2zMgKechO
	0NeU0WKPElh1PMcBK5rLCA2zb1INfZMiWKiPGUlzJxw4XS+E+aFuJQ8BbOmucrRy
	IwwATNEHkI2VlxevxGMxZsl69D0OtR26/xkbgNVeBSQfJ9fes+phkWoVyBjojOQ6
	GXHISFi42y4eqGuHbTJQXiy+Wp+uf4SrGK22w3Ytm6hFeWNAqLd3Rozgez1Bh0Cy
	0Ur4jg==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epfdt2065-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 15:32:56 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e6b5ea69f7so7352080a34.2
        for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 08:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781019175; x=1781623975; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WTvP0lPke9tdXWHBSp8VVmCBcodaAo5HdZeUd/qpTIM=;
        b=RyLHcCMgwJvhjDeOZyni+39UFtB2kf2SE0s0HBHqPxxEQOaSMibTgXqcAQIm5tHYe+
         udC3NapfEpZiSx0Uy3NaLgbGXeWWSDAMOIoFz2l0U/SOTSju7bPKyCJYDQZtMq0jPixX
         vlkFcwXMUDkWFOQXF3rdqe1in5cqIoiktUtM2z7mnysVGEeLkl11yk78jxOlCXUB/twj
         uP9umhuQ1OfLpNNMTshLZDUfsS9GXMuo3+YYSkGAS/Z8Hr7kdxQOQXmKpBAX9I2jgfJB
         /pp5mX0kCz5nmmEkdSj1KRYqkWLCp7Shq6LrecsWEUiqvLZE/jGJWM46smJQ7Wbo76sl
         ZfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781019175; x=1781623975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WTvP0lPke9tdXWHBSp8VVmCBcodaAo5HdZeUd/qpTIM=;
        b=czrnIWQ+K6wIAQniWzg1wXrNzETbyHTttOTYQWptJeYpITjlRS146poTIG6QCvtBXM
         tC+0FWbSLOd0UG4pTDVkPAqNPBs54WRJoDWkQyvmKDXZ+8dNgTWwLSd9qMm+NepHDN9f
         u0h18W5DgMHifQ1Bt2o4VCgknHQo57Qee3n+GNeUrJPLqgsAveMUPCmMEhHo0W/8zctB
         eyB4XY5UlmEaFKDWkr7OqvnHBCZxI5+Jqlc4vjH8SH7U4pO7cdyzz6wrv54o5u8L8y15
         1y9RO05NXP7KFTuQItr1xjPO2/22cV7Rc2JsIOFulEjd4COu5KsHoTbqwDJnAPSujoSm
         HKQg==
X-Forwarded-Encrypted: i=1; AFNElJ/R32BKMHZvZik+cGNcedWMGqWSTvGUR16TKoz7h5jgJqpyIgsQGpnXpGrWibxvL9sxNf/jgueOWrE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYBLN9Z0wu638h2e6PVufGMCaP/iT4d+49ns4D3v8XD0nLuaAP
	M9xLYEL2xtzpwcl6mFHoPd8QI/7Ifeccjak8MKCjkFtzsAZWxeVaBNCt/NHx3QLovinBvy99uJV
	/RHLrW2MDzuPOihioMFh3UBSTGKgdsJfyhsFM8+JYnKBvdnSkOOf3xEPVbjsqyD9U+KMzBXg=
X-Gm-Gg: Acq92OFvbcqAk9mIJQwtD+fkCXRqbjoCEUmibC5nr2h5/f6WMGmTR+lMRTTwDl8a5dE
	coeRhGAG/QM2NDgdqJjwcfE0Rhq0TixRtVDvDHT8/2la5xHzcUVKLLkKTvE/gXhjZ8Rho60ZFNk
	6noFxpeQsnDzTFvxEtwU/H0+fEeoHH9ATuvQUYhfjT2JSWfdRkf31RlFwZwiUT9d3dy14Gez5ml
	aqmXCRXDjXw1DYcKveJksz1j2LQr/F/dfST91O1I3OpmyTu4AieY99lFCIRPmaKKd2g24WQvY3d
	e5Wj5o4JNRpqUXk/gnB6/Ybzb78e6TvnANt55mhqlnXrRNlnUCl3qL8jIvRzARlNQIirua2m8Su
	aatlVmhCj0rdx2itaWXpDrC6Hige4eL28MyPSv28KxZOS3I2xlhgoURQM
X-Received: by 2002:a05:6830:270e:b0:7e6:1e3c:912 with SMTP id 46e09a7af769-7e70c5c188amr12136452a34.2.1781019175551;
        Tue, 09 Jun 2026 08:32:55 -0700 (PDT)
X-Received: by 2002:a05:6830:270e:b0:7e6:1e3c:912 with SMTP id 46e09a7af769-7e70c5c188amr12136384a34.2.1781019175057;
        Tue, 09 Jun 2026 08:32:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f368e9fsm60938203f8f.37.2026.06.09.08.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:32:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 17:32:38 +0200
Subject: [PATCH v2 4/7] clk: qcom: Make important ARM32 drivers default
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-clk-qcom-defaults-v2-4-0c67c06dca11@oss.qualcomm.com>
References: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
In-Reply-To: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5676;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=VhUpIZusEDwNFbqFlc2LibIE0jDqP22f5bKnLwzbnmQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqKDIY4Pfn5koudJH+mfnjIyKNZEyH+Gskr2Qi/
 Pg35c9Ft1KJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaigyGAAKCRDBN2bmhouD
 1z01D/4jmDMsz26CKN+LYCZcjTH9MlvvLWZHkPeGIyVg7AO3D1HCVFsT+DmnU/0xXtHM+k1cZe8
 SXNbAyWF8pDNKPjvDO8bog3jkSsnXua8vrX4NeCaY8coHalKtxA9Pvp9u0qeOEsvXgkPgK7x1jt
 +HwLKGuR8k5GdvyIokFOkZ1VkDH5FY3JC1vdK7tcIfVhc7IIu0CXr5S1Vb52eVgTtLhPPu1DV4e
 qhmnMoYLuVJcFG3slwCQa2KVJPJ6gULSIHAGl+pTI4qYBAo5S23HWS+wJtFg2nADJiTLVwsAa73
 I7G5CmBYeHvC58fwt71/JS9jFU145yd+yGYuFu3oqCHrNnYQTWEPdkVISPH2U0OAX2WWmvhWIUa
 VnXmnlB20QnT2a5/OBa/hW9FtoMLd42wjCml1bTqdkDpoPo9RqSoPlof/f+c3bp8USxLQg1p8rs
 scAUFGx820AREfkY0RHRTQzfrFg01Rk/sumljTn7IvC0BTsskEpDsekuxLcIl+KcbG0A3t14uzd
 eM+dMLNsHfV7ONMQUfrAt45j0xGuLNfaGu58LBkxc30gJOVAeUWxQ6Ztsa2UAwBJ2hexOptFQAr
 WUYqtbHrnWGsYKpo0vbbGMa6WMIUKTpQMtCGyGP0lTMO3+5nfDF++K/vRH9wareKC550NZjqu6V
 xl1Znqdej071O1Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: oKtjgvhA0L8slA56DwuOAJaZffB3BZxh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0NyBTYWx0ZWRfX+ryEYxgBSkDr
 9TNon2JO7do7zu7lMXwM06h2JhbjhjiLqn571ml3VvlW+o0w9jYVCUOY85jE9wEReY2pip9Oj7Z
 3y+rh4HPWtHrMYNPNBrVIqw/o1xsgKAhkEyyqIUrcLx6BGF8qAUw4dRlkdm+ym57Um1e6em69Ul
 pFCeNwmeduBq8gbFV/N5IsEzl63J00m03tOgk6a2ZDd6XPQnAP9f12EGOnUbKb6g+0cHNHdEmJk
 /X/Eq5UIPb5NQuALoS1QrkRo83Rpe9An4hvKTLCbGDftuJlQX07flZcaA1Ta2eUMLcZc4xdpAYM
 O0UKf1DLCeRH2uAwMUNaPNUjrf8nQUN7ZF9dYIWEbGzFWQAahi2C4H5/3svjOtPR6HrS8DYNC8c
 oFlhCK5rbQ/qf5/eU4M1oiGpA2InwnBU/mIvpXCQN8FqdaOGxStCO5E2LUVxRYh9YlyxiijAc6O
 JMU6HsztoDkf3Vn070A==
X-Proofpoint-GUID: oKtjgvhA0L8slA56DwuOAJaZffB3BZxh
X-Authority-Analysis: v=2.4 cv=doTrzVg4 c=1 sm=1 tr=0 ts=6a283228 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=jO6dYz2E5lbJ9Xj+xBc9tQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=nVu6gHFLEUU7Sl8RD4kA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090147

Clock controller drivers are essential for booting up SoCs and are not
really optional for a given platform.  Kernel should not ask users
choice of drivers when that choice is obvious and known to the
developers that answer should be 'yes' or 'module'.

Switch all Qualcomm clock controller drivers which are chosen in
ARM 32-bit qcom defconfig to a default 'yes'.

This has no impact on ARM32 qcom defconfig and ARM64 defconfig
include/generated/autoconf.h, however enables a few drivers for ARM32
multi_v7 defconfig: IPQ_GCC_4019, QCOM_CLK_APCS_SDX55, MSM_LCC_8960,
SDX_GCC_55, QCOM_CLK_RPMH as module, IPQ_GCC_806X, IPQ_LCC_806X and
QCOM_A7PLL.  Enabling these on multi_v7 is expected to properly boot
these SoCs with defconfig.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. New patch
---
 drivers/clk/qcom/Kconfig | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index d8281ed68dc5..ed969553649c 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -249,6 +249,7 @@ config QCOM_A53PLL
 config QCOM_A7PLL
 	tristate "A7 PLL driver for SDX55 and SDX65"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the A7 PLL on SDX55 and SDX65 devices. It provides the CPU with
 	  frequencies above 1GHz.
@@ -280,6 +281,7 @@ config QCOM_CLK_APCS_SDX55
 	tristate "SDX55 and SDX65 APCS Clock Controller"
 	depends on QCOM_APCS_IPC || COMPILE_TEST
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the APCS Clock Controller on SDX55, SDX65 platforms. The
 	  APCS is managing the mux and divider which feeds the CPUs.
@@ -289,6 +291,7 @@ config QCOM_CLK_APCS_SDX55
 config QCOM_CLK_RPM
 	tristate "RPM based Clock Controller"
 	depends on MFD_QCOM_RPM
+	default ARCH_QCOM
 	help
 	  The RPM (Resource Power Manager) is a dedicated hardware engine for
 	  managing the shared SoC resources in order to keep the lowest power
@@ -341,6 +344,7 @@ config APQ_GCC_8084
 	tristate "APQ8084 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on apq8084 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -351,6 +355,7 @@ config APQ_MMCC_8084
 	depends on ARM || COMPILE_TEST
 	select APQ_GCC_8084
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the multimedia clock controller on apq8084 devices.
 	  Say Y if you want to support multimedia devices such as display,
@@ -402,6 +407,7 @@ config IPQ_CMN_PLL
 config IPQ_GCC_4019
 	tristate "IPQ4019 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on ipq4019 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -456,6 +462,7 @@ config IPQ_GCC_6018
 config IPQ_GCC_806X
 	tristate "IPQ806x Global Clock Controller"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on ipq806x devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -465,6 +472,7 @@ config IPQ_LCC_806X
 	tristate "IPQ806x LPASS Clock Controller"
 	depends on ARM || COMPILE_TEST
 	select IPQ_GCC_806X
+	default ARCH_QCOM
 	help
 	  Support for the LPASS clock controller on ipq806x devices.
 	  Say Y if you want to use audio devices such as i2s, pcm,
@@ -533,6 +541,7 @@ config IPQ_NSSCC_QCA8K
 config MSM_GCC_8660
 	tristate "MSM8660 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on msm8660 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -577,6 +586,7 @@ config MSM_GCC_8939
 config MSM_GCC_8960
 	tristate "APQ8064/MSM8960 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on apq8064/msm8960 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -585,6 +595,7 @@ config MSM_GCC_8960
 config MSM_LCC_8960
 	tristate "APQ8064/MSM8960/MDM9650 LPASS Clock Controller"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the LPASS clock controller on apq8064/msm8960/mdm9650
 	  devices.
@@ -611,6 +622,7 @@ config MSM_MMCC_8960
 	tristate "MSM8960 Multimedia Clock Controller"
 	depends on ARM || COMPILE_TEST
 	select MSM_GCC_8960
+	default ARCH_QCOM
 	help
 	  Support for the multimedia clock controller on msm8960 devices.
 	  Say Y if you want to support multimedia devices such as display,
@@ -629,6 +641,7 @@ config MSM_GCC_8974
 	tristate "MSM8974 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on msm8974 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -639,6 +652,7 @@ config MSM_MMCC_8974
 	depends on ARM || COMPILE_TEST
 	select MSM_GCC_8974
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the multimedia clock controller on msm8974 devices.
 	  Say Y if you want to support multimedia devices such as display,
@@ -1212,6 +1226,7 @@ config SDX_GCC_55
 	tristate "SDX55 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SDX55 devices.
 	  Say Y if you want to use peripheral devices such as UART,

-- 
2.53.0

