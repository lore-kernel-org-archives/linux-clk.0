Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463529;
	b=S+epdQDxhGy5J4/mkabmFfQkyu0Bf3HBJibcjrOO/qJRM0d3/E99VqDh5Jxv/dKSZgPU
	 R/72sSmrybqnGfnq5iQbVf0anx5uZ/xRxCoWzd2LPk6YkN3nRlDgdHh+RrezBN26qeljz
	 RRYlc3b6pLk3uz2P4J7muzg1U5zbB2kupsZsoviaLsRCpYd0+Jc8b3+X2Y14XJbB32s4r
	 S9CKd3QGW263h7VYD/agodds2sbpPnNJ+E3sqyGDab6eAKvsand5nbGDtRSCUEqklCUqP
	 nWgcMVubppd76+tuo+6vMgQbkZMozks6cCAebYfKlrwDUq9wfB6nJ2uXxLF1afYJqNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463529;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Ar7wfH49sU9H/Es8DssBv78YjfDjLaZ23GHFlhRMqOM=;
	b=EjV1ytJ4ErrSIcKG2TI7u4Ejj7nebnu97PoQC1Btc3F64W32aAYgh06hEU53Pv/KvwtI
	 tgYe+l2YPxrBlYb17NPVhHdcUevQ9dmU7P8ljnqmhSyqS8kSQKAsiM/4dJhQ1riFaDpWm
	 cfsaI1tmRbcMN34IQgwwQrFfcZBdofUDw4A6/vzDvp0TKqYqK7Xj33rGbhuO4eefamZt/
	 qf6v/KtG96TmRS70Wkdw4LkE73/mKLjIkFS6twtWomNtwimsrz3vqhvATAJMnm0EXVhKX
	 fLQ6OJfYl+9dfhB1nXpVggFAVaTMNF/JFlJh0Dhh9jltHgGvYw2Ro+4vFQyX/9xHZCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pdKG2Uly;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jipHR8ju;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAED606A31E
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:52:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCAED606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pdKG2Uly;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jipHR8ju
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJNqJw648462
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ar7wfH49sU9H/Es8DssBv78YjfDjLaZ23GHFlhRMqOM=; b=pdKG2UlyPVNheH2S
	mFdSb1Aab+HphvqEmS3zT7cmw34z1Lnr3f19yT8qogsBzUj+LQhnmwUlso7XyYCZ
	8fZePrfDvVkcNg0yLDK6Bh7hRPF0waV+7jk5G7Xf1CKE1IclhLIpy8M2E5N1NyRp
	1sxDAf/mUIi1ucuGtWW/1wSfxajahoIt4lIzh2w9tEeoI0xD+UzMIbiofgTfb58c
	ohBapWvT7NNQk6rU/Xg7KnHy4yWGqC6e/k365jv+ypJuytcq2ns4hlGghKSojeif
	FuzXdN4vm7WKrGfa9KbexvCTIKjrNc4uNakzegSwyRyrlcPpzCjECLiXXT1zscy1
	XSQkiw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqg3eg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:52:07 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3846d5f54c1so4602962eec.1
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 11:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463527; x=1796068327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ar7wfH49sU9H/Es8DssBv78YjfDjLaZ23GHFlhRMqOM=;
        b=jipHR8juXRiqMofdDqF+JcGH813GF1qHJ1bDEDgmxYgqKpTjCzX5q50JfQlOuD8z9h
         2vPC5TStOO506OUJmtWVrsDHkWpAoOBXHh2jtfVHYJ2/TCYGC9nhKKau5a9QDtqFLS6v
         Bq+JG08rGX+Bvp2SEEpPp3Hvb8KHoI7EqLF6TwlhxIGW5s3W0kOQgbByUbhU2nI1KlpU
         d8NTbQYKsyUNc1iqwxfuhQ/S4aS0NyxBNZ960dbTiHb4qg5OI6+XKf9AFGExjfNym9Hu
         4+MGHtDOpYQyD+TzUaLCALE3/wGqCzdYLvOGpKvhz05Pwk+B4m5r32k1CKP220dTD28s
         ilfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463527; x=1796068327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ar7wfH49sU9H/Es8DssBv78YjfDjLaZ23GHFlhRMqOM=;
        b=LtiqoPnceyZGXS2vW99AnmE4IGVcm93z6LFCJq7yF2D8bskDDOi0d20lFs0aGfc7Z7
         mGuCItkCIAOfwyAMqB3fJgwo9Q9R9OJ0M282bhJ/0pGeHLpkb6lrNpwpfy42X7KeSXaJ
         FD/dVht6Bbrg9IjenIICE1Ypkz7D17s//9HqwuQxUauUhFm5qNcBsGBeOFhQ4juBeGxd
         B4Hv2dYUSCIH1ZR00Jcu7+yS0dGdy+i9OiG+hFBLKe1ijSglcydBEYeBv4Nv5Kicllqi
         aFaHQ0vHUVS1pJe348WfIycOkqyXBlkwxNAi1daebkP1NEdldFz5zmh9ou9NzONJ/D+n
         tOAA==
X-Forwarded-Encrypted: i=1; AL+hErHNEESu0+sEJj4XQA/fB7AcDI/gUepvbqACqyPH6JKW4RyOMCDgkeSaZXmqMLGC0NN25abmZzkrY5U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ehCxsdk9B+etMsCJVVdidwn+OtE62s5cIXfoqY4WMV7keRAh4
	g8StnpUP1pi+FP89i2W120jMVSdYcqsU31TEi3F4SfbZC22GCksulPqzyjtIfEH4KC6MwK1bCTM
	5Slx2FIk0t4P8xe+C9Xw/30nkg55Dc04w0CGN6OeTBwkBNSe4cPrClVBqUSbUx9Q=
X-Gm-Gg: AZFdTZcUdQON0PsVUpp10OwXwV2cqeIJJYhY+JOYUQsjXJd1ocyV+DUuEaKx7uRyFhS
	maUc0/MX71Q4R6Wn6ao8Oc1Znt5F/kkKvl2t19kHWShh4FDk7wbI1iFe31HFwUgS3bRLvN26TCj
	dmuf6JsVhEb2lTKa4XoGCx8ESJfWl3geherh5l7GSK7PVp4mYUWXnraptzod9KyMS+Qt9w5/mYT
	aqccYABHMs8BjMtQeWLg7WyMzx6bWNsn74+WdlyrB4aosYN8/HAHx5unxbk+iZwK6MUHo+Sp7KR
	ovZn9pFb2O8Br9bb9ZcsFYPc7co6ZVE0Ifye8E2V3ty7DBZYjk3ujg9SXe2XXHhOMZ0msuxBxbe
	3yWmuFGR932/rnmflR6a+FJhXM0jf/ydnmNZpSoCSAUg8e7v7uHV9oYWClY3Spoyw9HK24r3pcg
	==
X-Received: by 2002:a05:7301:6408:b0:36a:270:ce76 with SMTP id 5a478bee46e88-38570f2b27dmr13408369eec.33.1795463526249;
        Mon, 23 Nov 2026 11:52:06 -0800 (PST)
X-Received: by 2002:a05:7301:6408:b0:36a:270:ce76 with SMTP id 5a478bee46e88-38570f2b27dmr13408347eec.33.1795463525541;
        Mon, 23 Nov 2026 11:52:05 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm36363123eec.7.2026.11.23.11.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:52:05 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 01:21:34 +0530
Subject: [PATCH v3 03/10] clk: qcom: Add a driver for PDM GP_MN fractional
 clock divider
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-b4-pdm_clk_gp_mnd_v2-v3-3-98db26a87500@oss.qualcomm.com>
References: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
In-Reply-To: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b049967 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=knmouaU1qqhetKb48BEA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX1gr1oy8pBRyQ
 kjTHvGPY6P2mu74RADDgK457pfAQmA3vFCifn0puUY2X2euuP7NKppvwbBzVbY5ousp9wDx/rYM
 CF/RbfqPjhnKNvUHeEBddZ7PEccU+fdEGB1XMRj4B6EOzt1lF8bIqH1ikJB6OyzSITU/YFOfYXY
 89HMo7CJnvgv0ocJXrshWnQ9EGv4TM+w/em/z3O9Sc9Uo1ItB8d1BCMKjHVHF2AZssqAa3A4S9z
 W/In4Oo+0NevLnkkQm1w4lUXSmqbWU1pp7XS2KxkceQi3NnLiXF/6DXLPU0XVdgjgbqYym54CCH
 EI7lBq70DhBxaEG5f80eJ2QhvSY+7YsR+vkp82T01TOm0RJon58UV6meqtuZHbgIS1husb3yj9Y
 nqFJ958AVp7bx8zQVll74Jr06mGhoEUTQMXEXQGiUl7Sq1YtVSGbiqcjf/ObMxk8kwbVWMkKk1N
 dIKyIC14vqQwkQhzQIQ==
X-Proofpoint-GUID: 0Z8WhWeWMZ8zKAmOopC7FBKQUi-oaCCJ
X-Proofpoint-ORIG-GUID: 0Z8WhWeWMZ8zKAmOopC7FBKQUi-oaCCJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX2Hm0MlQOhYBr
 qR31RmHBzduRBu4+dgkNxDJ0S2shYyjghOZUOddSrX1lHD88rJlX/gnHDGptOxzd+vwpJPJC/Xo
 J+46LRjCti/C7bCvOxQNEto4Ef1kmwg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230079

The PDM (Pulse Density Modulation) hardware block on Qualcomm SoCs
contains a GP_MN clock divider that produces a fractional output
frequency from a fixed input clock (typically TCXO4):

  Fout = Fin * (M / N)

The hardware encodes the period in the NDIV register as the 1's
complement of (N - M), and controls the duty cycle via a separate
DUTY register that counts the number of low-phase native clock
cycles over the period N.

Add a standalone platform driver for this block that uses
rational_best_approximation() to find the closest M/N pair within
the 9-bit M and 13-bit N hardware limits. Reject ratios which cannot
support a valid duty cycle, and program the MDIV, NDIV, and DUTY
registers via regmap. Implement determine_rate, set_rate,
recalc_rate, get_duty_cycle, and set_duty_cycle operations. The PDM
AHB bus clock is gated around every register access.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig      |  15 ++
 drivers/clk/qcom/Makefile     |   1 +
 drivers/clk/qcom/clk-gp-mnd.c | 342 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 358 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index e6c58e8b184963fa3d885a7661ad982aaa5bcbc0..ccab70a11cfcaa3ea2217101ade50ab255631837 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -2170,4 +2170,19 @@ config SM_VIDEOCC_8450
 	  SM8450 or SM8475 devices.
 	  Say Y if you want to support video devices and functionality such as
 	  video encode/decode.
+
+config QCOM_CLK_GP_MND
+	tristate "Qualcomm PDM GP_MN clock divider"
+	depends on ARM64 || COMPILE_TEST
+	help
+	  Support for the Qualcomm PDM GP_MN clock divider found in PDM
+	  (Pulse Density Modulation) hardware blocks.
+	  Given an input clock of frequency Fin (TCXO4), the output
+	  frequency is Fout = Fin * (M / N).  For every N input cycles
+	  the divider produces M output cycles.  D controls the duty
+	  cycle: it is the number of native clock cycles in which the
+	  GP_MN output is low, counted over 8192 native clock cycles.
+
+	  Say Y or M if you want to support GP_MN-based frequency and
+	  duty-cycle configuration on Qualcomm SoCs.
 endif
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index f84d7343a3a475dd9ef1fa77bf0de25fab0d9e75..bc487b25ef5d9a235162fad95a3e0ef2984564f3 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -229,6 +229,7 @@ obj-$(CONFIG_SM_VIDEOCC_8550) += videocc-sm8550.o
 obj-$(CONFIG_SM_VIDEOCC_8750) += videocc-sm8750.o
 obj-$(CONFIG_SM_VIDEOCC_MILOS) += videocc-milos.o
 obj-$(CONFIG_SPMI_PMIC_CLKDIV) += clk-spmi-pmic-div.o
+obj-$(CONFIG_QCOM_CLK_GP_MND) += clk-gp-mnd.o
 obj-$(CONFIG_KPSS_XCC) += kpss-xcc.o
 obj-$(CONFIG_QCOM_HFPLL) += hfpll.o
 obj-$(CONFIG_KRAITCC) += krait-cc.o
diff --git a/drivers/clk/qcom/clk-gp-mnd.c b/drivers/clk/qcom/clk-gp-mnd.c
new file mode 100644
index 0000000000000000000000000000000000000000..75d620166e8dc044afb08d014f9707e9b53e8e31
--- /dev/null
+++ b/drivers/clk/qcom/clk-gp-mnd.c
@@ -0,0 +1,342 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
+#include <linux/rational.h>
+#include <linux/regmap.h>
+
+/*
+ * PDM GP_MND clock divider register offsets.
+ *
+ * The hardware computes:
+ *   Fout = Fin * (M / N)
+ *
+ * with duty cycle controlled by D, where M < D < (N - M).
+ *
+ * Register encoding:
+ *   MDIV  = M
+ *   NDIV  = ~(N - M)  [1's complement of (N - M), masked to N_REG_WIDTH bits]
+ *   DUTY  = D
+ */
+#define GP_MND_MDIV_REG		0x0
+#define GP_MND_NDIV_REG		0x4
+#define GP_MND_DUTY_REG		0x8
+
+#define GP_MND_M_WIDTH		9
+#define GP_MND_N_WIDTH		13
+
+#define GP_MND_MAX_M		GENMASK(GP_MND_M_WIDTH - 1, 0)
+#define GP_MND_MAX_N		GENMASK(GP_MND_N_WIDTH - 1, 0)
+
+/**
+ * struct clk_gp_mnd - GP_MND fractional clock divider
+ * @dev:		device for runtime PM
+ * @regmap:		register map for the PDM block
+ * @hw:			handle between common and hardware-specific interfaces
+ * @m_val:		M value (numerator)
+ * @n_val:		N value (period)
+ */
+struct clk_gp_mnd {
+	struct device		*dev;
+	struct regmap		*regmap;
+	struct clk_hw		hw;
+	unsigned int		m_val;
+	unsigned int		n_val;
+};
+
+#define to_clk_gp_mnd(_hw) container_of(_hw, struct clk_gp_mnd, hw)
+
+static int gp_mnd_clk_runtime_resume(struct clk_gp_mnd *gp)
+{
+	return pm_runtime_resume_and_get(gp->dev);
+}
+
+static void gp_mnd_clk_runtime_put(struct clk_gp_mnd *gp)
+{
+	pm_runtime_put(gp->dev);
+}
+
+static int gp_mnd_clk_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
+{
+	unsigned long m = 0, n = 0;
+
+	rational_best_approximation(req->rate, req->best_parent_rate,
+				    (unsigned long)GP_MND_MAX_M,
+				    (unsigned long)GP_MND_MAX_N,
+				    &m, &n);
+	if (!m || !n)
+		return -EINVAL;
+
+	if (n <= 2 * m + 1)
+		return -EINVAL;
+
+	req->rate = DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate * m, n);
+
+	return 0;
+}
+
+static int gp_mnd_clk_set_rate(struct clk_hw *hw, unsigned long rate,
+			       unsigned long parent_rate)
+{
+	struct clk_gp_mnd *gp = to_clk_gp_mnd(hw);
+	unsigned long m = 0, n = 0;
+	unsigned int d_val, n_val;
+	int ret;
+
+	rational_best_approximation(rate, parent_rate,
+				    (unsigned long)GP_MND_MAX_M,
+				    (unsigned long)GP_MND_MAX_N,
+				    &m, &n);
+	if (!m || !n)
+		return -EINVAL;
+
+	if (n <= 2 * m + 1)
+		return -EINVAL;
+
+	ret = gp_mnd_clk_runtime_resume(gp);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(gp->regmap, GP_MND_MDIV_REG, m);
+	if (ret)
+		goto err_runtime_put;
+
+	/* N divider holds the 1's complement of (N - M), N_WIDTH bits wide */
+	n_val = ~(n - m) & GP_MND_MAX_N;
+	ret = regmap_write(gp->regmap, GP_MND_NDIV_REG, n_val);
+	if (ret)
+		goto err_runtime_put;
+
+	/* Program the closest-to-50% duty cycle. */
+	d_val = n / 2;
+	ret = regmap_write(gp->regmap, GP_MND_DUTY_REG, d_val);
+	if (ret)
+		goto err_runtime_put;
+
+	gp->m_val = m;
+	gp->n_val = n;
+
+err_runtime_put:
+	gp_mnd_clk_runtime_put(gp);
+
+	return ret;
+}
+
+static unsigned long gp_mnd_clk_recalc_rate(struct clk_hw *hw,
+					    unsigned long parent_rate)
+{
+	struct clk_gp_mnd *gp = to_clk_gp_mnd(hw);
+	unsigned int m_val, n_val;
+	int ret;
+
+	ret = gp_mnd_clk_runtime_resume(gp);
+	if (ret)
+		return 0;
+
+	ret = regmap_read(gp->regmap, GP_MND_MDIV_REG, &m_val);
+	if (ret)
+		goto out_runtime_put;
+
+	m_val &= GP_MND_MAX_M;
+
+	ret = regmap_read(gp->regmap, GP_MND_NDIV_REG, &n_val);
+	if (ret)
+		goto out_runtime_put;
+
+	/* Reverse the 1's complement encoding: N = ~NDIV_REG + M */
+	n_val = (~n_val & GP_MND_MAX_N) + m_val;
+
+out_runtime_put:
+	gp_mnd_clk_runtime_put(gp);
+
+	if (ret)
+		return 0;
+
+	/*
+	 * At power-on the divider registers read back as zero (M = 0), which
+	 * the 1's complement encoding would turn into a bogus N = 8191. Treat
+	 * an unconfigured divider as rate 0 and leave the cached M/N cleared so
+	 * the 50% duty-cycle default path in get_duty_cycle() stays valid.
+	 */
+	if (!m_val || !n_val) {
+		gp->m_val = 0;
+		gp->n_val = 0;
+		return 0;
+	}
+
+	gp->m_val = m_val;
+	gp->n_val = n_val;
+
+	return DIV_ROUND_CLOSEST_ULL((u64)parent_rate * m_val, n_val);
+}
+
+static int gp_mnd_clk_get_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
+{
+	struct clk_gp_mnd *gp = to_clk_gp_mnd(hw);
+	unsigned int d_val;
+	int ret;
+
+	if (!gp->n_val) {
+		duty->num = 1;
+		duty->den = 2;
+		return 0;
+	}
+
+	ret = gp_mnd_clk_runtime_resume(gp);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(gp->regmap, GP_MND_DUTY_REG, &d_val);
+
+	gp_mnd_clk_runtime_put(gp);
+
+	if (ret)
+		return ret;
+
+	if (d_val >= gp->n_val)
+		return -EINVAL;
+
+	/* DUTY stores the low-phase count; report the high-phase duty cycle. */
+	duty->num = gp->n_val - d_val;
+	duty->den = gp->n_val;
+
+	return 0;
+}
+
+static int gp_mnd_clk_set_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
+{
+	struct clk_gp_mnd *gp = to_clk_gp_mnd(hw);
+	unsigned int d_val;
+	int ret;
+
+	if (!gp->n_val || !gp->m_val || !duty->den || duty->num > duty->den)
+		return -EINVAL;
+
+	/* D = (1 - duty) * N, giving the low-phase count */
+	d_val = DIV_ROUND_UP_ULL((u64)(duty->den - duty->num) * gp->n_val, duty->den);
+
+	/* Hardware constraint: M < D < (N - M) */
+	if (d_val <= gp->m_val || d_val >= (gp->n_val - gp->m_val))
+		return -EINVAL;
+
+	ret = gp_mnd_clk_runtime_resume(gp);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(gp->regmap, GP_MND_DUTY_REG, d_val);
+
+	gp_mnd_clk_runtime_put(gp);
+
+	return ret;
+}
+
+static const struct clk_ops clk_gp_mnd_ops = {
+	.determine_rate	= gp_mnd_clk_determine_rate,
+	.set_rate	= gp_mnd_clk_set_rate,
+	.recalc_rate	= gp_mnd_clk_recalc_rate,
+	.get_duty_cycle	= gp_mnd_clk_get_duty_cycle,
+	.set_duty_cycle	= gp_mnd_clk_set_duty_cycle,
+};
+
+static const struct regmap_config gp_mnd_regmap_config = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+	.fast_io	= true,
+};
+
+static int clk_gp_mnd_probe(struct platform_device *pdev)
+{
+	struct clk_parent_data parent_data = { .index = 0 };
+	struct clk_init_data init = {
+		.name		= "gp_mn_clk",
+		.ops		= &clk_gp_mnd_ops,
+		.parent_data	= &parent_data,
+		.num_parents	= 1,
+		.flags		= CLK_GET_RATE_NOCACHE,
+	};
+	struct device *dev = &pdev->dev;
+	struct clk_gp_mnd *gp;
+	struct clk *clk;
+	void __iomem *base;
+	int ret;
+
+	gp = devm_kzalloc(dev, sizeof(*gp), GFP_KERNEL);
+	if (!gp)
+		return -ENOMEM;
+
+	gp->dev = dev;
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	ret = devm_pm_clk_create(dev);
+	if (ret)
+		return ret;
+
+	ret = pm_clk_add(dev, "ahb");
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get ahb clock\n");
+
+	clk = devm_clk_get(dev, "pdm");
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	/* Set default rate if not already configured */
+	if (!clk_get_rate(clk)) {
+		ret = clk_set_rate(clk, 19200000);
+		if (ret)
+			dev_warn(dev, "failed to set default pdm clock rate\n");
+	}
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return dev_err_probe(dev, PTR_ERR(base),
+				     "failed to map PDM registers\n");
+
+	gp->regmap = devm_regmap_init_mmio(dev, base, &gp_mnd_regmap_config);
+	if (IS_ERR(gp->regmap))
+		return dev_err_probe(dev, PTR_ERR(gp->regmap),
+				     "failed to init regmap\n");
+
+	gp->hw.init = &init;
+
+	ret = devm_clk_hw_register(dev, &gp->hw);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to register gp_mnd clock\n");
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &gp->hw);
+}
+
+static const struct of_device_id clk_gp_mnd_match_table[] = {
+	{ .compatible = "qcom,sc7280-gp-mnd" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, clk_gp_mnd_match_table);
+
+static const struct dev_pm_ops clk_gp_mnd_pm_ops = {
+	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
+static struct platform_driver clk_gp_mnd_driver = {
+	.probe  = clk_gp_mnd_probe,
+	.driver = {
+		.name		= "qcom-clk-gp-mnd",
+		.of_match_table	= clk_gp_mnd_match_table,
+		.pm		= pm_ptr(&clk_gp_mnd_pm_ops),
+	},
+};
+module_platform_driver(clk_gp_mnd_driver);
+
+MODULE_DESCRIPTION("Qualcomm PDM GP_MND clock divider driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

