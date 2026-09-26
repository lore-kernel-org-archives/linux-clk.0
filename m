Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BD4394783
	for <linux-clk@vger.kernel.org>; Sat, 26 Sep 2026 18:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790447873; cv=none; b=E+APTV14gxsEYmssWu3Ft1AiIYXpPdLgM2723KV3yevjrO1qj9jp9thE3Hah+7lWqYRYNT7VmNq2t2zVDm60VXRw7vW9Nc+U69F84izKnjRSXsP8f2S8l4l1ysSU2VhXxdwZEw2E/UtEG/DAw5wO1N/U2OJZw0X1VFRJ78GV+NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790447873; c=relaxed/simple;
	bh=cqkNAH9d2Grkwf/7YUhP+4O0O3CojYIEuW2nlSB94H8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UPnZlvsyEpvjrccuhTzPD3JhvYzWkDRTdrivyafiBGnjFrxnb/mB/qKQ+8rz7Y+eEh6SLf6hl57OxlkXaGprlCKnz+XUg3j0OfjbZX+vhAiCzpxjPDa5Ri6mMYJdkj7Jq9xKO182q+EtZMaIiRdGzLI/Mnnpwownka2kyhjly3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eeR7zoUz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MwbXRJeB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eeR7zoUz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MwbXRJeB"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QGxYAU718289
	for <linux-clk@vger.kernel.org>; Sat, 26 Sep 2026 18:37:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=l2VuXWYOKFZf7/6rPPC4Bq
	Hn8CmS8LQvADsXnTIar8Q=; b=eeR7zoUzivUm7iNXwBE/XeGYJybkIyPATwDZuZ
	IaEjJz1kK67BdgzkjuPjCZ6PydhGRpt5TwDMu65hWt6BGQTX7zRWkulTgphR6d9q
	QRAgDAE8soGCmYjzvnXSQ7F8GnKx4AO8qydKCSe175Oqo8+TnjzcKKMBT7bnbE+k
	i8SB0BPxVvCcakwIa0j92oR0IBcK3Rmv2DfjG/yjuPX3Wl9FmgaJQCFPiBd4fz6i
	vOGYIbi6Fksq7/OV8C1s/q6PVVxmiZI31JDuhBUSfUzrYlQntMP6J0wGjEaDn8cE
	osttk2E4ef53EMaGiCjlaEcfuTRN0kxg8gS6IAOfTITcytPg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx526hky9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 26 Sep 2026 18:37:48 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so4172945eec.1
        for <linux-clk@vger.kernel.org>; Sat, 26 Sep 2026 11:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790447868; x=1791052668; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l2VuXWYOKFZf7/6rPPC4BqHn8CmS8LQvADsXnTIar8Q=;
        b=MwbXRJeBwIm8UBLW7rsm+EalN4O3TU1XPAGrD8owReCJq1ExNOcrsW6e44LsJ2FWpL
         UNpDxqQdj8FmDqJkWRWA6yck2B3RYpzGrT/oDb3+6ep9NkqQ8nUtNWAtC+FVl9SBnaXW
         mPsf6QGCVM9JAKwrqYnrL6xNn+ZRSpNMOHU5u35oB2kA+FGqTILNUrnekLOLQhtCkCWf
         f2ICDpn7AdFp5wXviYTYwkkhzNsz+XemRklvnjoPxTmmIqyiT91PI0EblJMEPR7xINr8
         ZrGH7rgFoXYLgVY0rw585+2LBDC+U+C1eapFNgWH97OXOxpOZwyT+e/AOehv5G8/ocMz
         OHlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790447868; x=1791052668;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=l2VuXWYOKFZf7/6rPPC4BqHn8CmS8LQvADsXnTIar8Q=;
        b=Htp4l5HZyZg5pMOsnKm45BskLezApuFl+AJ2CkkX74GEoebxj06UlNd6NOV2W9REMU
         K7H/qwjZvqudZrqHJzzVWlGOpcGvr05/hh4+nErux5PGGbl4ddZn9p69gK61JThnaAZH
         Rt0HYAZN3kR4FfTukuEsvmEtqwuUbxQ6vG9ngyJHdvxvdsIeqBPGJb4UuwqKYXyX91es
         +ju6gHQ6mMWz2+WQtR5QZotJ+YSLghfvN6kRcHHSOCcUA6X8IxRSj2XZ6xRmxuR+H/5q
         oMXxXQAnT5SG45oisNZUsUnoPatOG0sETPQWJlf7R8goWM3eOi5beSIcT7iITzegqXVd
         iscw==
X-Forwarded-Encrypted: i=1; AKwUvBwZ9zX5JrpRQec2ShPovynUxor5NbKR/ms/27TsuZT045XKI+EsT+JFrR41UniJS9s7zJdSUf4wuRs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuzRYn+xd+UDDNNyg61frifjMPX8NrOxEVx7U9sikMqPw0ts1u
	4lktywnCwVGCJJHLleKzEauDHr6n0iZvENqusiix0tp9ewQVaQfaEyIDjc84DwPj1cxxa3cOxNO
	2yNo3hJTg5xAOG267dolCEql66Bu5a6X+eJDIt63DPHQhhknJa9oqUcXEA/zGnzU=
X-Gm-Gg: AYBFou2z6VLkBP45IU5MQ89DGBe/tcfBF1EB0K/pUUPCBPVE64WZYZrE3F9Oz4AnWXt
	s1E4sUVly19rUgyTyjZdZHkYALbwoFwWm3O8jkOYyj70uid56Ls/hqHAUe4BZCrRwCI+VTdVU3X
	VQ11gQjlTY9Se3WYslgwlpYeYixykESHC4mgq9qw2g9eqhTAXO0vAzI3vhsLifZ1vA/y1RsoIhh
	2s6GHHmpKUkoHwEcBif3TGc8YQe+j5raltnj58+zEkPXtYN/6Ai+W3dfz0CLQlbtoExSFqa1eRK
	WgEWH47JVTpvXaYuKtD3IR8GvbruWPZ39Q2W5POBKjnir0/ppTk8hBPQUG0zo1CisldtpS9ucSa
	Z+UdVZAH69uXOvQZ0z+QbT8U=
X-Received: by 2002:a05:693c:2a06:b0:33c:2457:bdb2 with SMTP id 5a478bee46e88-3426fcc985bmr3196752eec.6.1790447867214;
        Sat, 26 Sep 2026 11:37:47 -0700 (PDT)
X-Received: by 2002:a05:693c:2a06:b0:33c:2457:bdb2 with SMTP id 5a478bee46e88-3426fcc985bmr3196703eec.6.1790447866077;
        Sat, 26 Sep 2026 11:37:46 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341447576b9sm18705762eec.15.2026.09.26.11.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 11:37:45 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Sun, 27 Sep 2026 00:07:10 +0530
Subject: [PATCH] clk: qcom: camcc-nord: Correct camera clock source tables
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-fix_camcc-v1-1-9fe956f01f6d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANUQuGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyMz3bTMivjkxNzkZF3zNANjAwvjZIOkZFMloPqColSgJNis6NjaWgC
 GV38OWwAAAA==
X-Change-ID: 20260926-fix_camcc-7f03083c0bc5
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=VvS2kO2n c=1 sm=1 tr=0 ts=6ab810fc cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=najPtik4V_E5PoWvo3cA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: NmSS7WCg99466bS5h1HwxNvHUYX2A-j2
X-Proofpoint-ORIG-GUID: NmSS7WCg99466bS5h1HwxNvHUYX2A-j2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA3NCBTYWx0ZWRfXxv1PKNZtK594
 354fugx2pTAjCWubroWKJLNgHr89HX7HcD+k4wanrcv57xs5JYBx3X0Z7bDdcFvZJF4UEYDsjIA
 LA99zq0zQrPMGBJB9l1iCsJjtvrKL1EmgY0TxUcdvEt4WonnYsCgdyKfkPXsU4n+JNksOVZdjQw
 Kva07GrXw05GxTjHo5969teTcvrLp4pRtiRVJMYtr1Hkqbt+RsRwfm3QlbQ0b6N8mfyzSGM8hE3
 l+N4oe10DZ8SaiPnAZN9Sbptwl6tS8p5IWCRgdV+Wht8fhdYE/IxNYoIbMhmtXB/0OUwNvSKcOi
 3tmuxTehWtkEPUeslpkFdLA4x/eDOLHCFsxJHB59hCpjKJ55lybAOMfQmBQ+VxLGVBkxD8+vX1Q
 Q3Y6GlChs6BnGvjnqa+TBjV8A/q0sGJp/Wt+O9aLJN4HD80zZMz5ln/6NUxDfxd7irt1ArkcLV1
 U3ZgaXE1SlTk3YuWThQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDA3NCBTYWx0ZWRfX8Tioeb0e1O60
 nZ4Wj467LjcGEP509qEf4lB9Z17L8JNM5+DfblK8Gwf6PFqDHE9tV5nHm37Vp/QyHOTtMl31j9I
 5rxQUZV7wzNZntp/J2Guj5NGUht6zoM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260074

Select the PLL0 odd output for the 200 MHz and 400 MHz CAMNOC RT
AXI rates.  Use PLL0 main output dividers for the 300 MHz and 400 MHz
CPHY RX rates.

CSID and IFE Lite use the CPHY RX rates, so share that table rather
than duplicating it.  Remove the unsupported 300 MHz CSI PHY timer
rate.

Fixes: 7647815dfc8f ("clk: qcom: camcc: Add support for camera clock controller for Nord")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/camcc-nord.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/qcom/camcc-nord.c b/drivers/clk/qcom/camcc-nord.c
index 9e3c40cb3ad5f06196bab87593afb7d1c7da411d..1c1314340b92f03af442b82a6402e442f1550a2c 100644
--- a/drivers/clk/qcom/camcc-nord.c
+++ b/drivers/clk/qcom/camcc-nord.c
@@ -515,8 +515,8 @@ static const struct clk_parent_data cam_cc_parent_data_9[] = {
 };
 
 static const struct freq_tbl ftbl_cam_cc_camnoc_rt_axi_clk_src[] = {
-	F(300000000, P_CAM_CC_PLL0_OUT_EVEN, 2, 0, 0),
-	F(400000000, P_CAM_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(200000000, P_CAM_CC_PLL0_OUT_ODD, 2, 0, 0),
+	F(400000000, P_CAM_CC_PLL0_OUT_ODD, 1, 0, 0),
 	{ }
 };
 
@@ -622,8 +622,8 @@ static struct clk_rcg2 cam_cc_cci_4_clk_src = {
 };
 
 static const struct freq_tbl ftbl_cam_cc_cphy_rx_clk_src[] = {
-	F(300000000, P_CAM_CC_PLL0_OUT_EVEN, 2, 0, 0),
-	F(400000000, P_CAM_CC_PLL0_OUT_ODD, 1, 0, 0),
+	F(300000000, P_CAM_CC_PLL0_OUT_MAIN, 4, 0, 0),
+	F(400000000, P_CAM_CC_PLL0_OUT_MAIN, 3, 0, 0),
 	F(480000000, P_CAM_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
 	{ }
 };
@@ -645,7 +645,6 @@ static struct clk_rcg2 cam_cc_cphy_rx_clk_src = {
 };
 
 static const struct freq_tbl ftbl_cam_cc_csi0phytimer_clk_src[] = {
-	F(300000000, P_CAM_CC_PLL0_OUT_EVEN, 2, 0, 0),
 	F(400000000, P_CAM_CC_PLL0_OUT_ODD, 1, 0, 0),
 	{ }
 };
@@ -730,19 +729,12 @@ static struct clk_rcg2 cam_cc_csi4phytimer_clk_src = {
 	},
 };
 
-static const struct freq_tbl ftbl_cam_cc_csid_clk_src[] = {
-	F(300000000, P_CAM_CC_PLL0_OUT_MAIN, 4, 0, 0),
-	F(400000000, P_CAM_CC_PLL0_OUT_MAIN, 3, 0, 0),
-	F(480000000, P_CAM_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
-	{ }
-};
-
 static struct clk_rcg2 cam_cc_csid_clk_src = {
 	.cmd_rcgr = 0x13214,
 	.mnd_width = 0,
 	.hid_width = 5,
 	.parent_map = cam_cc_parent_map_1,
-	.freq_tbl = ftbl_cam_cc_csid_clk_src,
+	.freq_tbl = ftbl_cam_cc_cphy_rx_clk_src,
 	.hw_clk_ctrl = true,
 	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "cam_cc_csid_clk_src",
@@ -889,7 +881,7 @@ static struct clk_rcg2 cam_cc_ife_lite_clk_src = {
 	.mnd_width = 0,
 	.hid_width = 5,
 	.parent_map = cam_cc_parent_map_1,
-	.freq_tbl = ftbl_cam_cc_csid_clk_src,
+	.freq_tbl = ftbl_cam_cc_cphy_rx_clk_src,
 	.hw_clk_ctrl = true,
 	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "cam_cc_ife_lite_clk_src",
@@ -905,7 +897,7 @@ static struct clk_rcg2 cam_cc_ife_lite_csid_clk_src = {
 	.mnd_width = 0,
 	.hid_width = 5,
 	.parent_map = cam_cc_parent_map_1,
-	.freq_tbl = ftbl_cam_cc_csid_clk_src,
+	.freq_tbl = ftbl_cam_cc_cphy_rx_clk_src,
 	.hw_clk_ctrl = true,
 	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "cam_cc_ife_lite_csid_clk_src",

---
base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
change-id: 20260926-fix_camcc-7f03083c0bc5

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

