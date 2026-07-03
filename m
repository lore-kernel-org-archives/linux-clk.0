Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFC93B8139
	for <linux-clk@vger.kernel.org>; Fri,  3 Jul 2026 10:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783073073; cv=none; b=V1Lr2STmBeAa1bc2VQRXpBLUdTvGhf6/97AGJ+0lQU0RPEwYHk54HqhdzoQ0PTSWN0vLxG2OmTvJBvvIH7PGGJkioTraxGIiYU5oPcSiF46pqRvymjMJRUSwIrzlUjyibuGXa1AuGfXq8EpwP1t6dDJkv/5ITo53Wq4EMDrzA5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783073073; c=relaxed/simple;
	bh=XvPNC/3TSLWXK0qQ93RFWay5rDBNmpp7S+fJKAkwoLk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KEHjt4Qltz48KwH0EhN829Z1YwHCPcDwc2AGNCQhcDEA4bUbgEf9Tghv1Y9HOx3gwCqE/3534twZA8wW7A8H18Uphom0vso7M1/22OYxkNWCNstJyF/YPARyMcM9H8ZGyeeVd7heu9xZjyh1zTwmjeY37cUCceI2twC93h+gbwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lKG6cpcv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DFCBw+xi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lKG6cpcv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DFCBw+xi"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635s6Z93110488
	for <linux-clk@vger.kernel.org>; Fri, 3 Jul 2026 10:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	smkcd0eRrWOi7xcIysQwdSct7gNXuzCd9k4WOantBn8=; b=lKG6cpcvcQ3h8tet
	HtGjL0SGLJYrUoqDa1nzpVnx43ACWCpW1Sc+p/i3u9MNZnrSyeamEv+16o7775OZ
	ZqCaHNhvS2Rbwtbp1uSW3jGemO9ELLcoZThD2MQSj5Ncif8dnT/3SxjDQutqvljr
	RBPhojrdUcfQr8YyduMrnhcFBasN6nR70R4v9BfxIx1KFzh9hLRuY62wKBPEcTHH
	xeJPPwFc+p7a7OI7dJPy/jspjtH3vKGQ+kTzlh5KXQVePNQDFzpuPKBuIGwQy6Wy
	DLkDir8f1rd2GLvI/bhCD4+PH7NaFGOY4XXfGgWqlFwEyL2kbubO0jZWKNTgGgtD
	xGi7KQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f60eyafan-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 10:04:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e663c29f2so45539085a.0
        for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 03:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783073070; x=1783677870; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=smkcd0eRrWOi7xcIysQwdSct7gNXuzCd9k4WOantBn8=;
        b=DFCBw+xin/QCCBJCsq8cXPDOrZ0wErR/MPc60OKxAdR+5gi5Wdbktqv+ZFQPRz7SQa
         Kx1xR/XtmnLuox+Ze+ej2wP/J3do4gHNX44GMQ4IkNPGDx1TgpucYS0yvVYBbG6yAeF9
         VJnszaskPMhdF790KPAg2Yzf3Zxkv5rv29evVmwB3EqWDjAQCeq43HmbHABK2WCx2AeA
         b3/CdVNOtktkyySm8Q3gZ0n4WJlHdSYfO5OhQWZDTpSLPqctaKe+fuN4FSXz7/QO8+Pg
         ez649wi/+/1pv4IciO3A4aY4wy7zinstly/uYfW3MMs0Kc36VvzSMCNYLhTE1A2BTe/o
         f+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783073070; x=1783677870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=smkcd0eRrWOi7xcIysQwdSct7gNXuzCd9k4WOantBn8=;
        b=AH7QWIEJ/f9l+j22qFBT9gfPRcxsywwBdJLdbJgApnAxZpM045grWbPwYcsaEJpC+a
         JukkUhB9OhC+vxlqPlE671pKWkNQyTrIL73o2f5B47X9eLhUYGNE5YXooyZ6kqhfzb1F
         53zC3c79TfZDqN8IkerPLzE2qWDEcO6eEKbEZ+qqKTQ6TtZy/lCIx9ZwfRCYz/YHBapW
         rwId2b3df9IqO54+s3zlFsHBmCemztmfcMuZdduaUKDpWKX+X5kyPrIxWqPblaG9TPEs
         I9ZqUbv0zfq3TEFWBvhJL+gqe4mfn7i9E4b+BoC4wO0qiXwM9qVYjqUuiDinDrf4UMRt
         tSzw==
X-Forwarded-Encrypted: i=1; AFNElJ8uKAS4PAMhtVoUTjEgJoOAOKebmkknRm1+qsUZ4/y/ieW3F0tV998MKKJRy3CoC9AkTWh0nhbHDJ8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2VbPweDd4C5TGycsDDpvMIZSjp7qkJ0jTAb/K5bhavPj2jcPJ
	JCIf3gNV7RvDxEC0rmH0TEzjo5CIKhG6Rgtj271M3R6Ys9oPFRh1lBxw/cydVUxsRN2y0z7ZvE4
	CTaohJDtXwS6KTz4ObNGEBxx1VDXXaRs35ByR3rlsNRX8+hEV+FtXHHe3dR8KOd8=
X-Gm-Gg: AfdE7cn9JCvLH19djCbhJhWR5RmP+pVgmCkXP2Ij+cRlR0I/YE8iAvfLTXF/VLE2cAl
	8iiJ8F0cde2tFEAm3cZlYwEi3+ln/7TTAZOCkHJkYBNqjYEhbXQs+3Te3pIVSnrrm2SAfbPmUXA
	qRM0AzwK25V5NHRHmlqIaq2WG9uDOIPMm60i6BJmag/nWlEuPEZ9BbD5lS1DY1wLMpT5UFR6P3X
	ZxC3nHNrVA+5klMirxbT3AGSenFq0/t4NOSLWFN9+jDw1fa4MCWAtAh+p0Z7HRaCQB2eDH1jI0N
	6kHWWin+nxf96f88WTi787qw39u2H2X+mrKUIdMWOlb//4ZfiQLqYrWZqk5U9qtRKHnyKuwPMPT
	tb0v1Q9+LMXLVBwpojiRWz8xUaONGQMeEuTY=
X-Received: by 2002:a05:620a:2552:b0:92e:5949:3567 with SMTP id af79cd13be357-92e8b29fac4mr405500485a.14.1783073069524;
        Fri, 03 Jul 2026 03:04:29 -0700 (PDT)
X-Received: by 2002:a05:620a:2552:b0:92e:5949:3567 with SMTP id af79cd13be357-92e8b29fac4mr405494585a.14.1783073068923;
        Fri, 03 Jul 2026 03:04:28 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccd9d607sm51353505e9.2.2026.07.03.03.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 03:04:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 12:04:02 +0200
Subject: [PATCH v3 4/7] clk: qcom: Make important ARM32 drivers default
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-clk-qcom-defaults-v3-4-78894525e54a@oss.qualcomm.com>
References: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
In-Reply-To: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
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
 bh=XvPNC/3TSLWXK0qQ93RFWay5rDBNmpp7S+fJKAkwoLk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqR4kX1Galk0cSKgQvqOBW5wQRmDqrV3b1EPcbS
 shBOczEutSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakeJFwAKCRDBN2bmhouD
 18AfD/9R+ko3brYz/jvagH2FriBQ4sjlPYxKzZj2g/UTv9oLe7w5vjzOavreVEM8nJwr2hhrPEa
 cqQpUJESA9d9UquLIxMHlF99nc0yOuAHKYIJ9Is9lxUKDP/7fu1bqgOpxESw1g/mpdcTdkMgJmB
 2QxozmR5+LE39EGwf6sFoxEaPmlcRWF5dWHZ2kdjIV1/g97XUujrdK6itWxuFKRq0afIiDQ/Duz
 aNBV5xKAVtwBQ7wArGoaOaGtAdgejT1TG4VIjnt7vkSibN/3hPXpDCGgh7djInbyxUF6lVXUA9L
 KJkU14TVtymLwQiyqE8HqNUdjbF/Zyfwzx8bnC03UoXQLIph3AI2A3+H75R7RASUM3zDocCi5Kv
 zZcIljg1kKNkYEcpn1xre7Aq5ndZOBNIDPNxg0Fdi5f8oDXn5qTLgyze5S/b1e4ldhJmiaFQJU9
 zBPSNmPO9ffSVCYegokFgrVVErcEkZqMGAbJXD525CfkTFa237108ZYC8EiVcb4gf/TdGwoiemZ
 r8/gfS63U5snyikGiMzDgTFqeUhPxTd/Zv5sMQl/OyJ0ME/BsyFIN85ODW5tISAAIfX2DFtplvU
 546GW+MA814COXMizxcYAtyOHlaVuqgsir9pL0VOiq2ejJq7bwrBId1wa2/8lMlJBmmm0En3pfx
 sXQPegWpKoIUwag==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA5NyBTYWx0ZWRfX4Ql7gOzDzxZT
 rwSBtAVBD4BbsLeH2bBO33gOIScEwO0UmY+G8CwRK8HN4ivovrARhuG9Z7eqlFzzcXpF9Hb5jqs
 nUniKZaG+4k0jdvBirPkdjFxF3rrPY/nsLcSeic+Gd20G9RRqRn8DeFFP/QCnK77rpPzom2ma1E
 h0/N+fVAUZwp5OFM/zFqLJ8qXnzppxaeqTOj90yw/Vlmid7Fne/BPEiOf+qqD7U/EY41A+i7OSG
 LYqjFRh4TLFW+b/hEq2z5AKRDdTbljpTri1lOnqXbxQ2Qxf+wb4SgIwDctF8LDnPSa4QmwC+o7f
 AXT6JXSRkP9hqFETsrDqcs7Q8DnYtAXMOPReSyXJxFSRr6GBcf/IXS6Rd1z0w5l2qFj9h9PCegR
 56P0HTKs61vuB+Bxe35+uGjm3k+RDC+TssCKiZ/ovG8CwETo3xeqG7+NOb//Huqc3F2DAzLb3M9
 T3o13tuO9wxHDpD3hAw==
X-Proofpoint-GUID: 81k24dIkgM2Y5RdWRg7iFnI-PnrkceZR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA5NyBTYWx0ZWRfX8u96nzjQecYX
 JSyIh9cPAGJ0nLnx6Bqbo8FMXxrFYu9ZdBV1FNLgErUVMHKNaAn1lI+B/GF5d7UUDt3qcKFMUr9
 V/MZ+peY1B+CM3JXuCQVr+IN864UGPg=
X-Authority-Analysis: v=2.4 cv=SPRykuvH c=1 sm=1 tr=0 ts=6a47892e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=nVu6gHFLEUU7Sl8RD4kA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 81k24dIkgM2Y5RdWRg7iFnI-PnrkceZR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030097

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
index db3b67fafbc3..11adab354eb1 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -271,6 +271,7 @@ config QCOM_A53PLL
 config QCOM_A7PLL
 	tristate "A7 PLL driver for SDX55 and SDX65"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the A7 PLL on SDX55 and SDX65 devices. It provides the CPU with
 	  frequencies above 1GHz.
@@ -302,6 +303,7 @@ config QCOM_CLK_APCS_SDX55
 	tristate "SDX55 and SDX65 APCS Clock Controller"
 	depends on QCOM_APCS_IPC || COMPILE_TEST
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the APCS Clock Controller on SDX55, SDX65 platforms. The
 	  APCS is managing the mux and divider which feeds the CPUs.
@@ -311,6 +313,7 @@ config QCOM_CLK_APCS_SDX55
 config QCOM_CLK_RPM
 	tristate "RPM based Clock Controller"
 	depends on MFD_QCOM_RPM
+	default ARCH_QCOM
 	help
 	  The RPM (Resource Power Manager) is a dedicated hardware engine for
 	  managing the shared SoC resources in order to keep the lowest power
@@ -363,6 +366,7 @@ config APQ_GCC_8084
 	tristate "APQ8084 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on apq8084 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -373,6 +377,7 @@ config APQ_MMCC_8084
 	depends on ARM || COMPILE_TEST
 	select APQ_GCC_8084
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the multimedia clock controller on apq8084 devices.
 	  Say Y if you want to support multimedia devices such as display,
@@ -424,6 +429,7 @@ config IPQ_CMN_PLL
 config IPQ_GCC_4019
 	tristate "IPQ4019 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on ipq4019 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -478,6 +484,7 @@ config IPQ_GCC_6018
 config IPQ_GCC_806X
 	tristate "IPQ806x Global Clock Controller"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on ipq806x devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -487,6 +494,7 @@ config IPQ_LCC_806X
 	tristate "IPQ806x LPASS Clock Controller"
 	depends on ARM || COMPILE_TEST
 	select IPQ_GCC_806X
+	default ARCH_QCOM
 	help
 	  Support for the LPASS clock controller on ipq806x devices.
 	  Say Y if you want to use audio devices such as i2s, pcm,
@@ -555,6 +563,7 @@ config IPQ_NSSCC_QCA8K
 config MSM_GCC_8660
 	tristate "MSM8660 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on msm8660 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -599,6 +608,7 @@ config MSM_GCC_8939
 config MSM_GCC_8960
 	tristate "APQ8064/MSM8960 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on apq8064/msm8960 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -607,6 +617,7 @@ config MSM_GCC_8960
 config MSM_LCC_8960
 	tristate "APQ8064/MSM8960/MDM9650 LPASS Clock Controller"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  Support for the LPASS clock controller on apq8064/msm8960/mdm9650
 	  devices.
@@ -633,6 +644,7 @@ config MSM_MMCC_8960
 	tristate "MSM8960 Multimedia Clock Controller"
 	depends on ARM || COMPILE_TEST
 	select MSM_GCC_8960
+	default ARCH_QCOM
 	help
 	  Support for the multimedia clock controller on msm8960 devices.
 	  Say Y if you want to support multimedia devices such as display,
@@ -651,6 +663,7 @@ config MSM_GCC_8974
 	tristate "MSM8974 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on msm8974 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -661,6 +674,7 @@ config MSM_MMCC_8974
 	depends on ARM || COMPILE_TEST
 	select MSM_GCC_8974
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the multimedia clock controller on msm8974 devices.
 	  Say Y if you want to support multimedia devices such as display,
@@ -1234,6 +1248,7 @@ config SDX_GCC_55
 	tristate "SDX55 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SDX55 devices.
 	  Say Y if you want to use peripheral devices such as UART,

-- 
2.53.0

