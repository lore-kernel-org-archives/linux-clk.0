Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF402F8E98
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251642; cv=none; b=ktQZ4Ry/4I0CYmEz1ej+M2qkhP7Og6wc+fhL2d9GvjzRtJLVJg6HfT3D099D1CqFwITTcwvigqPCBCAnim0jkg3K9AT1GyvyZyPdmbXUcPmMtURHKkYmaaC+gY1IkxpR6CBud/Y9Nuul8GcYzngPccBPQKeb4CHY5vqZ4s9IUpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251642; c=relaxed/simple;
	bh=0fSXr4b+Ztfd2K7iKjW4OpK/vjCYRtqxTfuIJpfY0OE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AywhbAHJEmry4Uu7AHkRLVmbhCTICuA8vYcdFk3yPLIlyNvpEDN/hlBTxDaamPO1Lp16tB0iIa7k9pDEhjjBph/DlEm2PXtiTLR+lrMaKluwTiJCoqYRdjldHvq4c3UHkluTN554t58gDvXt0cGxdJp6nREBaBaVs5OP7dhgUj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bMWlN5vL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f0IGeC7N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bMWlN5vL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f0IGeC7N"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4Xgf2285456
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:07:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A0CH1y/lEg3Q4tkwCwEHIOcuTPB+bNVxl7V4JRcNayM=; b=bMWlN5vLbXMG2MWF
	awa5PZ4kgqgh7l+y9Ie5R7WnA5DQ+K10w8A56927cH80XzkSp5eUY3L7L4D5AZfD
	UyIc47jMrTgMm7m+zlNuczRNCaGv+fr8hEgoz4AkOFAvl70jZWH4fiwMPAjSBArr
	FnFOpO+UIbyA7DwFH+jCbnqDcrxn2zXa7hu5Joe9GkichTwOOtfQS2TsyMSj1rB1
	SZ1mFcqGeNoUtL3ynuiPM2fdroG4oTIDEuPsDhMTWTDZXzrXtaLyXWTjtY5Z8/FI
	gAEAjdfT6LkqAt79wuEv3eTTWeDc1FQFRAWCKd+4Qu+o77g6GFxBdEYr5kSm0+u7
	TLq4ww==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvx8ahgj1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:07:18 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-79013d05471so555963137.1
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 05:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251638; x=1790856438; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A0CH1y/lEg3Q4tkwCwEHIOcuTPB+bNVxl7V4JRcNayM=;
        b=f0IGeC7NF+jalAWScnXRw42euq6f0mkg4eBrIAbaTvJ2IjLIPNmurZe5s8PGiPM8J5
         4r8lcPCaBluU/KxWuFcGIQwPgkuNNi10tAy29eeaogsr1BtQw9x018ZIS7hGC9DV0baZ
         zCuvbNU0UccPCN2AjzQbi3yAsxsVqPteJWv/O8fmFoF4SbcqXAo87EiSNW9oEFGaYq0K
         4niR+VODFr7ervEL6ngKEj6nw7ca4GLbkGxaDumnPcTdgwbcR2TPWQ7ssxrKpNk0Hf7c
         kxx+lMh6n9eACNBtDlvsZnBE440Txc0VBMv3nuff4cw7X+UfOl8htyozUI2B3FUIs4GX
         yHXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251638; x=1790856438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A0CH1y/lEg3Q4tkwCwEHIOcuTPB+bNVxl7V4JRcNayM=;
        b=wDQqs7KT3NoE7Gp6R6mdFjYu3YWk9WWw5RjW4JfyQk8j1StCUpeTLy8VZV3/UTh0aG
         I56Wbu5nRF4sT4DKsoKyvpy3rPSjgSjUvbJdga/RWxjs5z5HRlWC/eh9+ZiMMFx4BcsZ
         QLOi1JtI/m/IvVx7ugen+i9QB7mI+BLEEowPkbaOqzdK1+IMgXiJCvp8LD2+U4dXG3fN
         YZCgTDH6bQRxIGoKklZ+8i3s1ia7I9Ffx+6lUcTfOu1uo2xSIUBxi0a1KlMDb4aSgjC7
         mJP02w/M9ghITEuZIP40NJ+rjAjZd3pgMI6lLXaIcIUvEfhOp9TWj+trztBKishQlQXr
         uPtg==
X-Forwarded-Encrypted: i=1; AKwUvByHLp+odU4U0Bv5eQJjuu8QcN9D7YH3JqrcFoMfq0/Q7C3xGPRque4gud6YdYcxGXoCCkvnfQSPAgg=@vger.kernel.org
X-Gm-Message-State: AFuF++n7pdqfHk8ia0YE/BQtEqwTmKtNdAozXqnH0/qcxkCiD41hKJCh
	w0WaIQaHhMUV8lLuzqL1L17a3BevCjPwWRI/O9rAiHdIdS6QR82AqYkNhwjzHrqQTPFA/d0bDod
	oPbe+sWfDbwzgYGBPNKutf1MjsTpvgchm9UC2BVfIydgKTAeq9ZRwDiF/sov6f3M=
X-Gm-Gg: AYBFou2pa8CE0TDUu+YXoMQGXpAdTrLchQ1rUu7312KdEkhTC0SGntolMezNqLRSncn
	YWHsIZlb7GyjmjNPF0PlYNzt2aBtx186b2F9Z1uvfelN3/xX/udinITkkHD7WqX0+uFjxU+DeJY
	849bBszkVJQX4Yeq/Eiy4n7m8LyHfyA7ivenoDsrd9M5fbALA41PJ75P3ataNCLaSYFmJrfAT5l
	24CcsSJ+a9Eic9Ozx6rSxzqp8hBEdvbxXRi4t5pvO6XGBVtGRWoj+adGUaJm16qI48xwaLXZ6xP
	sw0bDMhMTd+9pb++Op4HjVvdoNryahaHBltheOTpq0r1nVQgqWeGUpDNGwWADN3Z71O1jgnvBpz
	8u00ndj8d
X-Received: by 2002:a05:6102:5344:b0:7a1:f7d2:e831 with SMTP id ada2fe7eead31-7af1d4bbe21mr907574137.17.1790251637714;
        Thu, 24 Sep 2026 05:07:17 -0700 (PDT)
X-Received: by 2002:a05:6102:5344:b0:7a1:f7d2:e831 with SMTP id ada2fe7eead31-7af1d4bbe21mr907565137.17.1790251637177;
        Thu, 24 Sep 2026 05:07:17 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:07:15 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:13 +0300
Subject: [PATCH v2 01/48] clk: qcom: camcc-sa8775p: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-1-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3088;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=0fSXr4b+Ztfd2K7iKjW4OpK/vjCYRtqxTfuIJpfY0OE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJCRYr3Wwy4NAWEYeTIzSiE8cz7r00/8LUhz
 zslueJPu0+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSQgAKCRAbX0TJAJUV
 Vv3pD/kBnr+PrtFVwupmgHnQww9oqbZzTSjENLc0rv27gSdLYVL3XWPYGwqvugGozZiIg8cOZJc
 OFTqLhjYXDU17iUVFjBScc9AID1YKmoPpVsude2GKHZQxXojjqlFOZQ271ISfYLvsjQmM37ceiq
 lwp7EgQgN/G0pofYC3F3EcMI7wKSGCYHk3ySvpfFrkE/jr0hQn0OH/cXASoojXuPDEVlwtd3RxK
 32EunynxPvrrvboAZrCK3okFTDCcpGnIUkOEnqIHypDlg2lpR03AY9w+L26yeSKtWbkwt8XpRjG
 10XISCiPaewT+W0mTaVwxzY5enyL1XGK41rpa15b/E/1zV80Qx46+H7GIpRYMyIbXkvz/5oCkUA
 w8UMaFsCO6TuFRDedN27izQ0WhqmS20B/H7FytvEt14WvHOSyiAoL7qvMZLq0HG3BKJ9qJWhpAV
 CUmUWSBxAVC7Ubqqma2mkPwRcPbIku1jtYyDYb4V0jUWmYJszfjlpk41bLIc3dv+NbwH+pYLpjR
 ByBydIisnnZPRcj66kNr448M/XEaTO/GtBimRxNc4Rt9GWqZUo5DorPp5vrOSQgDI/u3IbFPbLA
 9Qces79dZLSkCyUKGSXJ5Ghxs1Tm6F8wQuhQstNdSFFRVL82ymZHD+z+kAEcvEaukozaEIPRPHZ
 BtDvzyRRViSbq0w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX5UeQ6zLOKIzi
 rUj1v4dnC3E91qwP8uvXxbj6DqQ4QQZd1JFz7yBZPElJ6AVTuheodoOtSB9pES+wt3KuLME3oyn
 CmMZJQIR1MkWvZFatId8dkDKeKrJutg=
X-Proofpoint-ORIG-GUID: ppAjqHup4YEqQExD6tnAKKUxFAyfi0_D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX+nYJj11uxIJ/
 HrWHT+1BaeYYlB1bp5w4p0bbPjUPRZCuva+kY2jOnbbp26zxKrVSxiVAtRSPye33fSF0o64kOAC
 cCxQqq0JU8hbt4d3u/AtN0ULeURpV0fn2BfTuod2sac8vpdRMnu/oqbLaMedWDN9PiItzusyOhC
 utyWQxLMhl6Bub70AhP369ETAgp+1WgmS6fcBNd8tVGD9VQTNRzE+wHXYPT6tgPF7GSuzw4Ar81
 TC/GyWDo+mBt/PU+TpoJtnrKw3VuQAYI6k1DVHMDJoZ5FuL03Nu5uZM47YzqpihmV6+nL4G6phG
 LLLs0da8yCFCNNzntFyCyqG64KXx9tvoNIaIeu2dfgdztbqCtRtag7oHtibTLHYuFCCo/7+6euX
 u16grBPtDHtbTHflsqucYbYkfl3aVXr9XoLKYN2dtKDrniabMwT0Leyxn3cXDHnMAvnVBdBB7Ni
 Gk5H69jmx9SldNk/nbQ==
X-Authority-Analysis: v=2.4 cv=a6SlZkSF c=1 sm=1 tr=0 ts=6ab51276 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=8Nt88UfW2CkDv28g5HoA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: ppAjqHup4YEqQExD6tnAKKUxFAyfi0_D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Keep separate CBCR arrays for SA8775P and QCS8300 to preserve their
different CAMNOC XO, GDSC and sleep clock register offsets.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/camcc-sa8775p.c | 36 ++++++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sa8775p.c b/drivers/clk/qcom/camcc-sa8775p.c
index 914478139e97..b0a8f0077dd8 100644
--- a/drivers/clk/qcom/camcc-sa8775p.c
+++ b/drivers/clk/qcom/camcc-sa8775p.c
@@ -1818,7 +1818,30 @@ static const struct regmap_config cam_cc_sa8775p_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 cam_cc_sa8775p_critical_cbcrs[] = {
+	0x13194, /* CAM_CC_CAMNOC_XO_CLK */
+	0x131ec, /* CAM_CC_GDSC_CLK */
+	0x13208, /* CAM_CC_SLEEP_CLK */
+};
+
+static const u32 cam_cc_qcs8300_critical_cbcrs[] = {
+	0x13178, /* CAM_CC_CAMNOC_XO_CLK */
+	0x131d0, /* CAM_CC_GDSC_CLK */
+	0x131ec, /* CAM_CC_SLEEP_CLK */
+};
+
+static const struct qcom_cc_driver_data cam_cc_sa8775p_driver_data = {
+	.clk_cbcrs = cam_cc_sa8775p_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(cam_cc_sa8775p_critical_cbcrs),
+};
+
+static const struct qcom_cc_driver_data cam_cc_qcs8300_driver_data = {
+	.clk_cbcrs = cam_cc_qcs8300_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(cam_cc_qcs8300_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc cam_cc_sa8775p_desc = {
+	.driver_data = &cam_cc_sa8775p_driver_data,
 	.config = &cam_cc_sa8775p_regmap_config,
 	.clks = cam_cc_sa8775p_clocks,
 	.num_clks = ARRAY_SIZE(cam_cc_sa8775p_clocks),
@@ -1837,6 +1860,7 @@ MODULE_DEVICE_TABLE(of, cam_cc_sa8775p_match_table);
 
 static int cam_cc_sa8775p_probe(struct platform_device *pdev)
 {
+	struct qcom_cc_desc desc = cam_cc_sa8775p_desc;
 	struct regmap *regmap;
 	int ret;
 
@@ -1927,18 +1951,10 @@ static int cam_cc_sa8775p_probe(struct platform_device *pdev)
 		cam_cc_sa8775p_clocks[CAM_CC_TITAN_TOP_ACCU_SHIFT_CLK] =
 				&cam_cc_titan_top_accu_shift_clk.clkr;
 
-		/* Keep some clocks always enabled */
-		qcom_branch_set_clk_en(regmap, 0x13178); /* CAM_CC_CAMNOC_XO_CLK */
-		qcom_branch_set_clk_en(regmap, 0x131d0); /* CAM_CC_GDSC_CLK */
-		qcom_branch_set_clk_en(regmap, 0x131ec); /* CAM_CC_SLEEP_CLK */
-	} else {
-		/* Keep some clocks always enabled */
-		qcom_branch_set_clk_en(regmap, 0x13194); /* CAM_CC_CAMNOC_XO_CLK */
-		qcom_branch_set_clk_en(regmap, 0x131ec); /* CAM_CC_GDSC_CLK */
-		qcom_branch_set_clk_en(regmap, 0x13208); /* CAM_CC_SLEEP_CLK */
+		desc.driver_data = &cam_cc_qcs8300_driver_data;
 	}
 
-	ret = qcom_cc_really_probe(&pdev->dev, &cam_cc_sa8775p_desc, regmap);
+	ret = qcom_cc_really_probe(&pdev->dev, &desc, regmap);
 
 	pm_runtime_put(&pdev->dev);
 

-- 
2.54.0

