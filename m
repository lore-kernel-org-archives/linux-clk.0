Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E913DA5B9
	for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 08:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180451; cv=none; b=o0saoGUS5GfdCY3McZ1MHKNmDHujsLxk3emB703N64AKsXj0OuhsLoJ3Zs1fDabQXrEbgR084ZuoY6QQKOdbGuU+fK2ag0kXerlr3tA9mX7a9Ccaj+axnztPbam8y1GrNQC5aCa3lsKBrueqrwNCZswDpkHE2pWabt1BdunbIUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180451; c=relaxed/simple;
	bh=YPp5f7tmeMst8GKKxijr/AboKJkzB8aKNlLYibIXw48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ax+XrXHDadqY1+ciSJNtlRtBWLn4cFgi6wc7STYCc1djdsz4GfheSZQLzlQW6gFOAwFyBGVfaKWBAmcEUQ9eQwCG0/Qym6vW2NPqBfKR2WLvEjcySfVeEQBSZnh84R4UFw0+07bUaVsH7dpL8gHqM/5iH5z5MZS5+Yy9ZbVK2Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hU6Cv8EO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PbjbpfRW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hU6Cv8EO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PbjbpfRW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J6glWR1737101
	for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 08:47:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xTinPDIT42wpCfBllIcZHX8UxeyI/yWkjtmGEOTCzfc=; b=hU6Cv8EORpp4dRgG
	QR/2yMCs6NkukkXnTachheNfwe0nQIVuofMCG10qPJkA31cqXwUxUD2+9UahdTyF
	kgtdFYPHjPLcAARyiuTfqxMDQP0hNJEeFGmbQDJIhzAcDj1Shh11z4ESAkLmFqKj
	GXvAh939fXoB5aPyDbvfgpY26RnbN8/Xp6fW0nrt2cZr0ZpvWvtxPxPHBvods34W
	j1SDaSlOyOGyXbuqvHvTVwiv1WcRwmUh3l463g35fuxUNm+vtGVdw0TRu2cBZSqt
	Wz7b70TLPFaCDq/E+Rd5LDJ8OEiox+ldSt61qlRYwHrNd6kVcAdEoGPrHIZYpDx1
	y+m5Pw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8ju90ha1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 08:47:28 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8281d4cef8so1513874a12.2
        for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 01:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779180447; x=1779785247; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xTinPDIT42wpCfBllIcZHX8UxeyI/yWkjtmGEOTCzfc=;
        b=PbjbpfRWhgDDpKCsCQoi/b3/Ttba1fHeJF2YuhPLhcMHATZRUT8/yA1e1ie7xav6rE
         gqE0oncqCd1znQeBqzSvvFDvZLdHWKQccScBnrLFBAY3DoMzNsjL/nhhuKVJKk9rIi0o
         SSRjkoyrm5XGnBcM/A2NfgbWsRRTOxb6t7rr7A7dEYeYNNHnpkvj7U81pJmEPosoo7lg
         K+HE04xLr8Bbr0idj/ARhfgV1rk46Lxg9iqEMTry/U2FU0Y+6rwCwrAa0/0rdLD8RaQo
         D5FjbmBeJySuy3aJYYZI+hRuzmVShqMIxVPxWC+snk4qdEOHEyyT9XzvneBGdqGeS7p1
         Pl/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779180447; x=1779785247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xTinPDIT42wpCfBllIcZHX8UxeyI/yWkjtmGEOTCzfc=;
        b=a9bgEEdCzfo6cCRCegszQFBrjY/xdZj+Rv7+Aml1uK31uWeV6qzUN9xA2XioaBN9Hq
         J3OpUkceBhwV/mHFiQnHlbTQXkxUWWSvjE723pbASUW/L0oaoazfpUsRdiFJaL5xvlmQ
         896L4uvu26AMMwXdfHsBSTDHMwCJrWMr7Z3k5k/QPehXz4AgWMAOI4Xlcw/awAwaM+NA
         8JFix1fbPTdgS4wV+e3EcfNqxiYrCetmSf8W4ETE+xQ4KJpzURv1qsnH4+atpXsXAodG
         ufgdoOx6tZRgpvZdinIqcn0riSf974UQMoAUbWnzIZip5SAeeholSf1NWAP7CPm4jSXe
         JY7Q==
X-Forwarded-Encrypted: i=1; AFNElJ+g8/T80mLha8qeMxftT0rJXiIys8AFHVW2yKrQTpqR5uVJAxumcLzceJpg9P0R5k/ObvsXXMyZJWU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQHC8ng07MtgPBxLHLu58XpiND0d/cQuGveZSJcJCUskJGGBDi
	5toqBihIQtXwWeI50cUxaGu+AKezRjc35w9K3maYsskQGOgVO5vc+AWyh1cOrTIKkWtVNxNc8QF
	wRm4sXxAhDuadWVwxAVfJ2XQvqubyizUnZZApmC1324CRiW8+5SwXqWDq0GY3O6C33RZWX+M=
X-Gm-Gg: Acq92OGf3lnkdFjBwYhczPj/M2w+/ntaw/QrQSpB4yJAu2Ce30fmhvxirxuhJlkZJmf
	H2o0givfOJmZSE+bNB0f85Kg9NTWcJwPetqFHhCX9G7ZO9JJcRsYYOjVApwAA0DxbwVEHgLI4DT
	Fem9JrRV7HsRcZNGBIqqirdJnt4dCYJIBMf+pOvbTFHhTkIFBxXu4UcdMyBQ7u4aRdv5Hc6U9G4
	slRQPR/9+R3ud4SXeqRXxuHU5hZGVm4jFNxLPMmMEjAvKStRT1O/93pQjKYlc+414csXRAnNaiw
	dEzAOKUyXjywmlr3Ovd61aHkYSv1FVhg1FCvQSKzwK2MxcCt30hrjIB/izYwhEpRp00b53ARmp3
	5q5jVJoxYKPnLU7wD6VxqwTMJGKbMrvyv8T/q8ZqXybAo3O+CGqjy5XOhk12b4agv6nhfYppEOF
	uZtekLgz7KG4N8fUhz0hSDpAE6fOObhb3CCBn1Q43q+qknfwztyjzw5wCm
X-Received: by 2002:a05:6a00:ad5:b0:835:3f51:730e with SMTP id d2e1a72fcca58-83f33cbf6c8mr18627561b3a.13.1779180447497;
        Tue, 19 May 2026 01:47:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:ad5:b0:835:3f51:730e with SMTP id d2e1a72fcca58-83f33cbf6c8mr18627527b3a.13.1779180447008;
        Tue, 19 May 2026 01:47:27 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5b1f5sm17434104b3a.31.2026.05.19.01.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 01:47:26 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 19 May 2026 14:17:06 +0530
Subject: [PATCH 2/3] clk: qcom: ipq9650: Use icc-clk for enabling NoC
 related clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-ipq9650_icc-v1-2-4d3554c94257@oss.qualcomm.com>
References: <20260519-ipq9650_icc-v1-0-4d3554c94257@oss.qualcomm.com>
In-Reply-To: <20260519-ipq9650_icc-v1-0-4d3554c94257@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779180431; l=2920;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=YPp5f7tmeMst8GKKxijr/AboKJkzB8aKNlLYibIXw48=;
 b=4h1ltpKD9kccL2YvodSEVfLaNB2Hkl8Fsxf/yQod/s2YypHihYtk27rawOgGNmvW8b4/R8tsW
 vROHhE1F4qRCko1419rDR30OoOkGDBetO7+ii36LvSnPcdirAuBqq+n
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: Bt07hVNOnGtNGZhky9EAXQs8cj_AioRF
X-Authority-Analysis: v=2.4 cv=eeUNubEH c=1 sm=1 tr=0 ts=6a0c23a0 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=mQEdNAxdQoGx0Htu_1MA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA4NiBTYWx0ZWRfX1PmLTa9d94Yh
 0YgazN4wp58+bnXsp+LyYnuXDWUyq7gSqj5GVBrmsP7d8fvT1sW51DIjbQQNlVVB7LqncLrMuF+
 oJ4xBB0omkkRLqkR/g7BcDrru7PKocQ5sXj8ErqIceWvnhAeTHm7giwc96tIAgBgTBUoO7FStEt
 N3w63u3dcmeqEmMbB0qVjmfWQWBE0d4Mt+TozPy2dwtizSWIZO7qM/scIEQWTEPwQuGRc83y6or
 rQYfteL2I3YT1TOTO8R5lAw1Sxpmz0mwnDsmkE5I3EhAZIyuQqhdLM639uopltt2pPeiUD1R5Gm
 pdhuvxEyMdJKnWFA717N6LfYTufrjyxxmBENWuVc0d4hUfbDQm4Iw+iGgg8t3xX54erzpYy3L5I
 z47N6l6/VKJ+46Cp7AXrlpPjCOMST0I3tCqqsyDO7w3TC6pl8rHE2oTrA1ISxYpY3NITi9oJGwB
 4DOV0AlTzeIFWktKMSQ==
X-Proofpoint-ORIG-GUID: Bt07hVNOnGtNGZhky9EAXQs8cj_AioRF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190086

Register NoC clocks for PCIe and USB interconnect paths using the
icc-clk framework. Without this, the clocks required to create
interconnect paths and access peripherals connected to these NoCs are
not properly managed.

Also add icc_sync_state to ensure clock states are synchronized after all
consumers have probed.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-ipq9650.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/clk/qcom/gcc-ipq9650.c b/drivers/clk/qcom/gcc-ipq9650.c
index c556c2bbfd96..6b43958f3bf1 100644
--- a/drivers/clk/qcom/gcc-ipq9650.c
+++ b/drivers/clk/qcom/gcc-ipq9650.c
@@ -4,11 +4,13 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/interconnect-provider.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,ipq9650-gcc.h>
+#include <dt-bindings/interconnect/qcom,ipq9650.h>
 #include <dt-bindings/reset/qcom,ipq9650-gcc.h>
 
 #include "clk-alpha-pll.h"
@@ -3385,6 +3387,22 @@ static const struct qcom_reset_map gcc_ipq9650_resets[] = {
 	[GCC_USB_BCR] = { 0x2c000 },
 };
 
+#define IPQ_APPS_ID			9650	/* some unique value */
+
+static const struct qcom_icc_hws_data icc_ipq9650_hws[] = {
+	{ MASTER_ANOC_PCIE0, SLAVE_ANOC_PCIE0, GCC_ANOC_PCIE0_1LANE_M_CLK },
+	{ MASTER_CNOC_PCIE0, SLAVE_CNOC_PCIE0, GCC_ANOC_PCIE0_1LANE_S_CLK },
+	{ MASTER_ANOC_PCIE1, SLAVE_ANOC_PCIE1, GCC_ANOC_PCIE1_2LANE_M_CLK },
+	{ MASTER_CNOC_PCIE1, SLAVE_CNOC_PCIE1, GCC_ANOC_PCIE1_2LANE_S_CLK },
+	{ MASTER_ANOC_PCIE2, SLAVE_ANOC_PCIE2, GCC_ANOC_PCIE2_2LANE_M_CLK },
+	{ MASTER_CNOC_PCIE2, SLAVE_CNOC_PCIE2, GCC_ANOC_PCIE2_2LANE_S_CLK },
+	{ MASTER_ANOC_PCIE3, SLAVE_ANOC_PCIE3, GCC_ANOC_PCIE3_2LANE_M_CLK },
+	{ MASTER_CNOC_PCIE3, SLAVE_CNOC_PCIE3, GCC_ANOC_PCIE3_2LANE_S_CLK },
+	{ MASTER_ANOC_PCIE4, SLAVE_ANOC_PCIE4, GCC_ANOC_PCIE4_1LANE_M_CLK },
+	{ MASTER_CNOC_PCIE4, SLAVE_CNOC_PCIE4, GCC_ANOC_PCIE4_1LANE_S_CLK },
+	{ MASTER_SNOC_USB, SLAVE_SNOC_USB, GCC_SNOC_USB_CLK },
+};
+
 static const struct of_device_id gcc_ipq9650_match_table[] = {
 	{ .compatible = "qcom,ipq9650-gcc" },
 	{ }
@@ -3414,6 +3432,9 @@ static const struct qcom_cc_desc gcc_ipq9650_desc = {
 	.num_resets = ARRAY_SIZE(gcc_ipq9650_resets),
 	.clk_hws = gcc_ipq9650_hws,
 	.num_clk_hws = ARRAY_SIZE(gcc_ipq9650_hws),
+	.icc_hws = icc_ipq9650_hws,
+	.num_icc_hws = ARRAY_SIZE(icc_ipq9650_hws),
+	.icc_first_node_id = IPQ_APPS_ID,
 };
 
 static int gcc_ipq9650_probe(struct platform_device *pdev)
@@ -3426,6 +3447,7 @@ static struct platform_driver gcc_ipq9650_driver = {
 	.driver = {
 		.name   = "qcom,gcc-ipq9650",
 		.of_match_table = gcc_ipq9650_match_table,
+		.sync_state = icc_sync_state,
 	},
 };
 

-- 
2.34.1

