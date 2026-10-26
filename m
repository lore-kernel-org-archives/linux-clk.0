Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014211;
	b=q3yAvsMDHlKjHUb4ePAyQ1UWyS48HnaAheFcCpyFQCtD0TvI9F1GDgNeU4F9srO6I+wg
	 My+isoLTkZjLg72f06MFqkF/yHYCbjNMbqp+emgR6xqabg9mNaoRMTRT+HygCzo3A/0lo
	 IhfuGeZr7yQQ1EZdbEfrzxfBdMvwngY8lZYbBrO+AYmPEn5iQ73/eMa/0z0gz7iYrE0M5
	 shTn/ZWj1MCOvEzdD6bp9Z2jqOpt5uTZl0W9w1i+EYlHZ8U5gE3Te/rwM1TZT/nBDVHSy
	 1RIMwZaVAmmVR/rvPUXTeA9hhW7xaWd+r6PBogfxhCBFvU+A1taZ0q6E1XoNkw7Y8OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014211;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=n+yhh1c1vC4mhq1dGa5rWPT/sLlGBdTlSjscQC6+7c4=;
	b=nWuB2GtxnOeMq3aJ8cKvGDGOtClaInknoDK6X1RMo5BAakc2o01xS05EyHgkYIe27B1A
	 tJkF0RYKZpVT9LwQtf8TXAumbsOLnCGTnIkglR9gWaaDlKsV1jcpPY9CKbXqbOyf9czuK
	 QtJiX1VmYko9RRgGpgVf5Xo6Xk2IMlTE9lVS52v5aYFHiQrr7onNkiHJW+/g/ovTWh8GE
	 uFc0ZVOH37Dxuxap1f34Uen5NArwAcBIKWMEg8SWLvtlgLLbGk2ri1wuuAggRmTBSCDNA
	 dDq+6Qcm+BeUFZcykPkE8cHGcN5pK7Tda7eC9oV7CQtSLW+t0Nzt5eU6gJnkz1nI+wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZHECnWpq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="V+/rVmhs";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EF660A2637
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 11:30:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7EF660A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZHECnWpq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V+/rVmhs
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtGWU3050539
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 11:30:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n+yhh1c1vC4mhq1dGa5rWPT/sLlGBdTlSjscQC6+7c4=; b=ZHECnWpqYvUhp82z
	2ckLGDI65zhEomU/ILGqYhtJke169kEGVcdC0jYQTmRrNkn1MT0CAmkJ2pKuslJ5
	tAOCjjh8DUNG2lwgNnZnjxhGq4LUnoNFSic4W1FSoGPvkji2gw7mhOVu5rpIKh2b
	FwlNqhC/fXHZlMvyYQ2IpooWNPFd/YOFOKzPdX5ZtMG8fPXU6u6G4Mjr1DWBiXW3
	B+VSsmL+682xFGNXTbQDrdzv5ymi2R3fzJKnIH93KZ2KKdDzCtzBzaitusLAgryg
	5aC3IdFwDAYHCs+XByfGFcphNlrGoUx+BSXNd0asZOqvdyb8GSHI4L0MyDp3Iil7
	Zf42Jw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvdd9wbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 11:30:09 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e8ba4757baso31013425ad.0
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 04:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014209; x=1793619009; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n+yhh1c1vC4mhq1dGa5rWPT/sLlGBdTlSjscQC6+7c4=;
        b=V+/rVmhsEoEdMNrbCjXG1FywCEBKHieYKmL9Fh5JO8Vd+0//FuEexdHMGtAGekIBEs
         /PeQn5ZxF3lUKojBWiJOUYUQz+g84EGXBWEKnSC3jcdzGKV7CxZDxSVmg4DBJ9keYq5r
         8UZQv95rzK1mOcJq/G3fXR2sTAM2obT7ZUWv8yGClrgpNtxJO8Bd35Hrmn8LeWGqK1kM
         DE8dDpWXgD9VA1a4H6EUG1cyUzF95of6PKEKZVklvWUFr9Ovw6S0EQ/aE30ACrKNNzn/
         GXi7qvZ+fKUomAYuc+B1DqygLhdyh2SuS9YVVmCSsTTbJ0eMyLfSJCNFAG4d0GF+IxuC
         Fneg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014209; x=1793619009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n+yhh1c1vC4mhq1dGa5rWPT/sLlGBdTlSjscQC6+7c4=;
        b=wEii6boR/pvkBHDVAQLjX3DfVlSWK+y8EBnjQQsIFDQgK7yoGGU6PyxcxzENziK6Ph
         20KpG07jHVQEnfkSfC4fz756GQjT0jaWCoOhMGns9cBP/qrK2FsaMpM1lR2HVX3jNFop
         wp4IPkZIT4pojxqPbPSeOTQ+SRDqNSQ0Uunw6f7KyJqS53CmZUVW6EVN3/H5XLKvmx+C
         C9WswRwZBmFC2KUmA4Ss2g/2zZihDOjLULz398S9Ex7y3ZDN1ls/zMn3t4aqQW1/P2+O
         XPRFIQfw/HT3c93SxxbPBkYFR50PkcMreiDjSQ2TrX/0WYqar2+8kJJJUxkkqIgewJXh
         9fCw==
X-Forwarded-Encrypted: i=1; AKwUvByil6vvanPkEVv918auW3c2n7yuq7rAeUo5CQrMXRKB/G9xhokjQvY+Yz47ncnYYN7Jk48sE7EmDQM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3BnCUdEXykn17bXmpwRkGjuhQ/UDJF9a0/PZCqmLpHOmMF9C8
	ECs/SrpOUbfrLtGyU2CZWn5TAZB/CK0/hn8bjScGTQMOxtL25kujRtPTzQPlw3x5lHNZiZRq71c
	eEZjrIciYF9lOzuKAxtnPW5BiV/V/kMwHaeyV79/PSxulXYG1JyQ/iswdyt5hQ4g=
X-Gm-Gg: AYBFou33oFLZjHJQqkW3gOzH8GhzS0U7hov+rAM0u8j7n9/wsEnagbHmfc/xomgOs3O
	Vo0aE1JxJWDhWCle+/6wq/JEdLgpxUEPi0xvRtgn7jLvKWQxhdhMUKQ6YoJ+Mx0OouzFJAgUKvm
	Ny/vTyFvfAy3CH824sDoKzra9GYe7DqAbABWWSWrdxApP4eBkOBLLlpUywAF4/BLN5+PmOTkEIN
	1PeWGM0sldW3TxxdPZ1vfsD9EHTiFrDdqcM1wYgsgHx0zLTxCQIf2G4MsE2P/dQoTzpqqqh7vjo
	FCod/m6Vy3p7YH0Nxo1XLBTk7yi1LWDDf5gIqCqpPdxRg/7PdhwzR4oTpk0k1xgX1h8RxuIqVCv
	mZX+DS52K1VuS0c6SvPlM2IQ=
X-Received: by 2002:a17:90b:4cc4:b0:3a4:b30b:b501 with SMTP id 98e67ed59e1d1-3ade9a36437mr5613077a91.9.1793014208594;
        Mon, 26 Oct 2026 04:30:08 -0700 (PDT)
X-Received: by 2002:a17:90b:4cc4:b0:3a4:b30b:b501 with SMTP id 98e67ed59e1d1-3ade9a36437mr5613037a91.9.1793014208045;
        Mon, 26 Oct 2026 04:30:08 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:30:06 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:59:29 +0530
Subject: [PATCH v2 03/12] clk: qcom: Add a driver for PDM GP_MN fractional
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
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-3-ff8e4bc8d567@oss.qualcomm.com>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: UtwZHCFrP95sTH2Sn2-P53bpJ28sZH1Q
X-Proofpoint-GUID: UtwZHCFrP95sTH2Sn2-P53bpJ28sZH1Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX4p4yi5GNzkLq
 wsexwsJLDwYvD0ZmjvgvcaDInyLP45hs3eTIAnkwwwY/qMAZHz84MtEA3+UgkR+TpfnWdV9Jr+r
 uFiXAL3OCMgSZ4Wj8EtA5xv4rHd/ltTiuJoFZgj8YKnvcm2SOt8OdYjJe4nTvX1Fd3lMpxgYYcx
 l0apztxrQFjWbCaMl6uXYxT8sAevJkGC1Xvowmv90F+BdfyZGEEdRPtV38TY6DWrFy7hB0XI0ED
 jPUzU/MAVNmQXfSAXTtw/X9sMLswaLaYtIeIR+upEY80wJu5BlQ7oskkRyt49AtbpnBWmThd+1Q
 ehf+wG1qy8+eFW002NNW7aTPXEKTMNGoX+JkdQmXemdH41FRfjDYWxa+VanmsZMlOBll8Qw3uu9
 hFYg1akxK3vzzef0/6FCNyt6BEpaQ7lNSZ8F+QHHKgM8rJkQKqFsXjUUKK0x60VoZQYihODQ7o8
 +ikWtkIkCIq2eldSJdg==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf39c1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=knmouaU1qqhetKb48BEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX6mu9gSX2jCOc
 jwH/WRk2e0FibSnbrZ2nJG8IQrhHZwHUKpQM/Yxgl0BHkfMDJvp2jPSdH8YipyYleNNK5yG/N9I
 t/fWyvnyM4lVCtMOcgxvNTYEk24Vwf4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260045

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
 drivers/clk/qcom/clk-gp-mnd.c | 333 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 349 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 27d0ab24d50a4ca5587ed8d6085c4d6fcd57eb8c..d9f1df77b715b08a32c164a6d25d88fc545f59cb 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -2148,4 +2148,19 @@ config SM_VIDEOCC_8450
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
index 6affb5073f269d18f1b78d6c7f92e14baeade1e5..4e8563be8e1b99aef48b227ff0c5dc04dc092d0a 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -227,6 +227,7 @@ obj-$(CONFIG_SM_VIDEOCC_8550) += videocc-sm8550.o
 obj-$(CONFIG_SM_VIDEOCC_8750) += videocc-sm8750.o
 obj-$(CONFIG_SM_VIDEOCC_MILOS) += videocc-milos.o
 obj-$(CONFIG_SPMI_PMIC_CLKDIV) += clk-spmi-pmic-div.o
+obj-$(CONFIG_QCOM_CLK_GP_MND) += clk-gp-mnd.o
 obj-$(CONFIG_KPSS_XCC) += kpss-xcc.o
 obj-$(CONFIG_QCOM_HFPLL) += hfpll.o
 obj-$(CONFIG_KRAITCC) += krait-cc.o
diff --git a/drivers/clk/qcom/clk-gp-mnd.c b/drivers/clk/qcom/clk-gp-mnd.c
new file mode 100644
index 0000000000000000000000000000000000000000..818726c02b615689928cf09b4b34f0889d4246d8
--- /dev/null
+++ b/drivers/clk/qcom/clk-gp-mnd.c
@@ -0,0 +1,333 @@
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
+	if (!n_val)
+		return 0;
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
+	d_val = DIV_ROUND_UP((u64)(duty->den - duty->num) * gp->n_val, duty->den);
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
+	ret = pm_clk_add(dev, "ahb_clk");
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get ahb_clk\n");
+
+	clk = devm_clk_get(dev, "pdm_clk");
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	/* Set default rate if not already configured */
+	if (!clk_get_rate(clk)) {
+		ret = clk_set_rate(clk, 19200000);
+		if (ret)
+			dev_warn(dev, "failed to set default pdm_clk rate\n");
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

