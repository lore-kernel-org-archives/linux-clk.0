Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8A94DD6E6
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554592; cv=none; b=T4xmPZQT1RAaD+66DFAGsLmCztl1txFZ2AedX+ezQgc2U/fq3/ckNivP8MEKfirX4LWcPOX/ZaSz/451eFXNou1PtPQdHIQZbxTYBuIS2NbSkQk4JrcqqtKSFN8DvmAv/d1lEsxwMNwIl2b+RFVdSkqKoWfz1/fhsRYanRP7DCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554592; c=relaxed/simple;
	bh=VqEBhAc+je+QLk1thcaX/xUiR2txfR576Si9Id9vd9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nIbu38Xuz1AvNgmH+d+3PKq2FKB5E8NI8pBmj1igrVlzc9gNyGdNvbcNGOz1l/sMsYo3TGt06J2/ZFQ3VfR5uWA8ZyTjkk5ulvDy3fgA2dCh+i7pV/RsJVVcitwkxbSIXg2wLxM5zbQecbuSPKnYFW+IfmM24NKQbkGzAJaVXMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UhxIkExT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aw8DsoSO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UhxIkExT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aw8DsoSO"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92nXk978258
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WCNL0ejjcavhoD0Cb9ydVzVR4/0kvlSG9IlQISXrxEA=; b=UhxIkExTGLr6ksiV
	Ck9zenvLkpEFVQkjBpLnIxr9QsX9Dt/YtwiV5HH6ptQ2EtE80oooriAUiCYeX6aC
	xCtYUe0QGXDv/nsuWJz3WeCHbVE6ojPQb4ED+n5L1C7X9VjQz+GfrnwMJQNJtD6X
	G2fnCodx6WKt4i+OQXGQwJb5hkcxmT0gatjoHQsoJwIHN6u+e1XhIceHAF0cKot/
	TidwSzBJ47ANyG9xr1FmIYkskqkgoSQmWIM8vIK5eOhUJKBiNiNugguHaIYXOahH
	UTD0eLR0XDVk5wQISoELlSK3ZY7lMfPvRRM3MkDTZnlUdgA9IS0bs7VBNhezaynw
	0QTKtg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqqp3rfrb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939f1847fb9so660235785a.3
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 03:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554559; x=1790159359; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WCNL0ejjcavhoD0Cb9ydVzVR4/0kvlSG9IlQISXrxEA=;
        b=aw8DsoSOC+PN6DrdN/UjIQNlu+Bpk6T5f7Nb3rUmhCsGgWpY1t1A7bbS0t8c1lry9l
         uKNIm3spMfa5VuzjPTTiM2hqc6kr2sx31vPYosTeZKqjakXDVgi3dKYmf25luOeovTkT
         s6Ao0RqgpJ7RzW++NT/owQhlbTLeLpGkjfRsT2Av5s61+wSVT/jC3ACsnkh5y/LQgAm1
         yy25kPxLvAvCdwN/9qybZAkMh7PV9Qy9LAjNLQPz5SSd3D9O/fWb705OB5IdGpL+yxr+
         PqSMnWqb5NMazxWtsreEEjF/jmQUOTpKJGxc/9y0XPZu1Ocvwce9fZ4A1P8NC+Yuxjtn
         Xhfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554559; x=1790159359;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WCNL0ejjcavhoD0Cb9ydVzVR4/0kvlSG9IlQISXrxEA=;
        b=c5pdXjvK+eH8/zvg5SX5cRFmoHW4LenPp7ikkoDpRnvp9P36HTfM7rSYgFtyl87Bw2
         JxoSum2qWV92pHm/DmGzD47bqO0IIG0KggypPa75bZUhRCLYiFV2xDHghnRBhpWICzSO
         e3alSKHUfzkrt8JiLukIq9arszsVXrJJSuhtVfYyfpOgd9QHwG6XnGTKmmkbGUudyozu
         okl3J+6NsOBw4E5uUJtT1RAALiU0NlTUdl+AJ3Y5yHOc+4ZPa1hCxlSVGFp3Mk9IZ5GS
         +rkTFYywvdyhCs2DnbgKsVWz9Wi5sbQsW0+U6xle61rhqcdSz9ZXKTMOZbI6aSiuA111
         7qjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbuuSJfIDPbHPSCo8vb58BVAjluf189R9nqsHjj5ZnL641BmsZsuB5/Wdt3DOAkH+wql0GSEyRBTE=@vger.kernel.org
X-Gm-Message-State: AFuF++nPMxoMDfky/8NrUuBxYFK1LjLWLfuyl9vYADsUskStSAen/qDe
	4h4rMmXMzXxXJvfgns/hJQbzAGzxYc0hduhaEplZA93XSAmSFAfvHvvn4e+hP0KcdNAA2ZUHBAZ
	vdcQkZ2B6DAoBmoyhOlZpmSQ7LYcAdT4OBFnOyF1jrl/zbX7V8BHoMbk5+ZqoRjw=
X-Gm-Gg: AYBFou0pygxBvpELCyJD73HwKQ4rUjoAUYm6PYMrlXgC9haReoT7F7jvON0pW3pA4Ck
	8E+yvJyxf1R1tGZvh4gds9OEasIZeNF/LXJ2S+WK/r+iPQ9oAMIzMM3sKF0WqH1r/c1swYPLUf+
	/KuM2qlFp/7Gmh7eiQG3cfbBFYgGM45pDe1TxiR/X3oowCLf2wCZdVdMfRv4inxvPzTzLllyhz1
	Vi+Ugu158HuaQJPycOY2pxxg/94ABp8EpEjPim3J3R7ZV8CJLEPdNOK6NpoYm22X/sDpZmR5RvP
	+W0Ar3Vx/V6pCP5MCdOwfeynvIEHk716HqrPZMfMCOrPgo1FVdQcrzJQYdHeacfUYHZZVFsmF5K
	xN0+7zRY=
X-Received: by 2002:a05:620a:4693:b0:939:de6c:cb45 with SMTP id af79cd13be357-93bb793e1f1mr298993485a.47.1789554558693;
        Wed, 16 Sep 2026 03:29:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4693:b0:939:de6c:cb45 with SMTP id af79cd13be357-93bb793e1f1mr298989485a.47.1789554558151;
        Wed, 16 Sep 2026 03:29:18 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:17 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:17 +0300
Subject: [PATCH 01/48] clk: qcom: camcc-sa8775p: Use common probe handling
 for always-on clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-1-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3027;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=VqEBhAc+je+QLk1thcaX/xUiR2txfR576Si9Id9vd9U=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9LD0sjyesYKIoV0/4C9ypVNoFj3s6SMvr/J
 9srqvc4UHKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvSwAKCRAbX0TJAJUV
 VnvzD/0X463c3vRToWa0/H0xRHYuwCZm7CpCyBw64RZMS17w2Q5L0LeMjR49NWypljWexF3HNsZ
 Ud8YvehPpNdjJrvmf7Zay2CrJTPHSXXrtMl0eLUCe45iNZF6OgG4db3jF9ZUwRGiU+oLImadjcq
 gsBqNunngj+PUTIvKRcJamtTs6bQ/NWgFkiirXQ0KznjlcwqQDiE4EKMKxdI591lsdu8v69W1W4
 Suwcjb6M+haLUXOrdD77Tqc7cn9pZlKiI2yPOh+BlA+dDlWyIm0zqDsHX7qqAx2X3tULSsI3Kwy
 +TmntwhG0hmaa9rMAsgyPxoRimrx++DQ0ekzrzefbJew1HM0ScsqVHrWlxdkFMgBAIJchhiRDG2
 Rt/oI0gtBieONAEJgYfXCSMVi03BY3RNVX3Am2EesynW75DVH0JnZQDJu/U3exT5wGqIGIAp8Sn
 wwFkJtfCADVMgEwzIXZDni411TtkUy7WHixUog0yfpZXta/CMqPFbsY4vFF10nK6ZN2Yw5naA6/
 NS4f8QYfXw/DqQq+sbKFlnzcCa8sXBPJhGQSddWXRdfKuKSHSE4Eu061dnhYM9QdtuFaPl2ooui
 nU8bQhvmSkN5DEj59AuBcmz0TKW6ChDWpaMK5VwXuyD3I+v1G6esSmS/OKrd38RTjnyiFA8tD1B
 V5GwRdMSV6b7Z6w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX/WPo8sbQ+E5g
 67DQrMJxXjWivtnq+zasq1M8qxdXvyTQDyf5hjqHb1rzldStcL//Ga+WaWpe3/O2hcUc2gETaAc
 j+9XGJX8Q1qgqGrYia8asJV//3wP4SP0/pDOEfUCLXrFNabmg+jvcRts9OLi8UER7SsPwBd23SG
 Tcfixznx20c4sn8hw0hV4TtYflD50Z0p4XWnzYN1mIPBbvDxQxgXr6R8MFJv2TjpYlJj+3C0yKS
 uYa+/arGYiHv6hjQ8Q8Fm6GksB6iSvRRTAvRSJTc1FqbpyaEQt3hRPDuGEiu00eNd/XpxnzD1Sz
 xrOpsRnqV8uWCwklu4Vq2YtJ5IQCsRTVD6TJeOvKQIiXnuAhZAyqejBAlz/fIWZU3geuSKOaKY9
 qPBAgM1mL36qA8Rugr7eeVNq3bYS1X/6j+SlGLOh9efGYuPOGSpkA7uVgNoYGu9oRoFd02pu/wz
 Ko+ceIYDU05nWPN3VXA==
X-Proofpoint-GUID: 0RD2k5-OXE8Bb7FHiS0mPV3U2BA4R72A
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX/4haEWwVwvEt
 E6TZCeTZGtpe4fx/z9gNcYkLHKiQ6pS+C1vkTfAf2od4fRppeVFKKNkkGu+g6kY/cDZbOFv3z6j
 SCp/qJvAURIRN+UhKuVrXAe4AUJyCEI=
X-Proofpoint-ORIG-GUID: 0RD2k5-OXE8Bb7FHiS0mPV3U2BA4R72A
X-Authority-Analysis: v=2.4 cv=F/DC5ahN c=1 sm=1 tr=0 ts=6aaa6f7f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Q3HO4hYmujdu-APuiMYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Keep separate CBCR arrays for SA8775P and QCS8300 to preserve their
different CAMNOC XO, GDSC and sleep clock register offsets.

Assisted-by: LLM
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

