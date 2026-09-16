Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785924C1510
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554611; cv=none; b=GgqzVRJfP+Sw68lQ5QIDbqIuG+V5wMXqMZPVnaeyYNJg0C87K1jNKEGFxeh6NMDptnfecC3Bdg4Br7pChQuqNMkZhln73dQq5PILAznQxPnVWEBZwt3ObfXV9cJkbVyxGTWHgx9ecoifog1aFTw9RPjpRSQaipJXeWKJCeXjX1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554611; c=relaxed/simple;
	bh=S2AniEfyDrGOAXCv/dbv4sqVV3IlT7BHWm8yR6GgpKw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=io+mwtAsnWXiHAEnZyRmNAHyhukohxp5zCt1215LvyJ6RmtOFBXFfy/MENRd/lp0X2PSAPp5mKwp2dyU68xfFqHsIKfLwoq8f1VOkzznANIz4dPjTXOkkRsfgxGz2Cim/rGFgYVVWqlAgFdN+wywUSIo749EzQ2Szke7wN0RaVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TB5ji0XK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z4AmHE0f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TB5ji0XK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z4AmHE0f"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92j5x2478061
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ak2yG22SGL7622OFPDrvu6S7qAHEydZFrUoJyLNOey0=; b=TB5ji0XKZDlCjMIa
	kdBIygmNBairBDvP2cu6yCJZpgfK5u89J6OxF2m6c0fEkFQ8qVUyjG1OypbLfICa
	Y6jATBVw3L/LmqKicyhMN2WG2hEXNn0mSUrtmV19ZZomKq+C7hnBL5Gqstni6zmq
	lSFW9w30Vyi8zXXjZ8gV6Eg/9Xt29r5VMOg6Sr1z2BwhKpIeoqHoUZP36r/5dIXm
	1paRERhIM834hmJjXVWP1/HD+xvuEEScL5JLmSMjIq8HzW7uzolJF3wSUkXF3oJt
	RzYklrsISZSOFBGSAu80wzcVN3x+kHUJYuIZsg7Pu5Yd+TSWSN1PMpEmvY8vtMcu
	PLQakw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqjcksved-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9393ac4961fso658928185a.2
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 03:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554586; x=1790159386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ak2yG22SGL7622OFPDrvu6S7qAHEydZFrUoJyLNOey0=;
        b=Z4AmHE0f4mymZ0m5c4b46PqydNcMIvpstEutFoOcy4hFaMTGc13EtR/sRBcUUVU3gQ
         lpTwVvs84Rb1sIqimAFF0S+gqWYBydS7t/+0KPTJNq6vvO85+fvU8JA7ytbF/+AsUdVP
         lJ1CNtBhFIB+ihfxJKFfHS1E3ImXfI5iwfpcpy9yfCdFUjzkML9hiiEqsPZ2vCIKo+mS
         atYuT0e4iR+c/3KIndCmc0YkfnZkyFFEwy/CdV3eK1u61a8xicP9y9hncxW82BboGuhC
         2hWwXiTLNJcatIEyL97n3eqFE3enIt2opbliW7cj0VhJBNu8I6T4Hdla0bkbUJl/4cwL
         5QcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554586; x=1790159386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ak2yG22SGL7622OFPDrvu6S7qAHEydZFrUoJyLNOey0=;
        b=GqQaPnQ0SfQ/vO8pLpfN+ae4eiOJxcnDMoICEq+Pm6ojHfd1Ia0KUdjz3RJSwsZtJi
         tps0uitSKmwt9DWfsWRqI3bsywyqMCb+qMi9z59KFB9VBTC1Ktlx5NOsNK/y3+Huf8s/
         Cnwu865ptR/ubfmgNLqAzfyhLdeMWnSOd0SGf1aTHgWjNcp4iSVlUAWiEM1Kp/Yg7Da/
         E8WJUyMNHE64BgVOH5tWj5mzqXLSbOaCV29f4nz502jxydEnw4JvvC7FTpGx0eIFupOd
         dA7fy5T7k/SM0VcolBAYxSrIWRn2ZYIM48AcDc/MruaT9sx0wtlWeQqAJufTavSM2U/M
         bRjw==
X-Forwarded-Encrypted: i=1; AKwUvByHnvF8nLDGKI9PJlYia/39rXGvB6SOTQF8PJ3U/VTMULF+Kb11tPPP6aBrZRBaXlQBG5zTNQNLO1Y=@vger.kernel.org
X-Gm-Message-State: AFuF++n/vRQx9e+yXbIEDGCIwu5Y6bkwprDPqgz377lzNiffaazEZWgx
	sXIfMINbU0eDzrVmFfNZq0a/tcjebimUfDKc4O9NoeqpenjgKMBkUDzS8Qu9YoVtNCEDcLWihMm
	hg4/5GdhnbfZ1NrJyA1ZjQm5+SIRRfCC/BRL71Qo8Im+XByPjvFPyw+FqH/NPnSE=
X-Gm-Gg: AYBFou0DU6Q+bOA3FMSvCz6VxerOOctQKjSfAQNsXKMFR0qhIysMyxWHrQ0zy/LoKJ4
	4cnzL0z9LZ9SMu1aaHpqYdpsOtu4M5FE5JM/0q0Gt+3fxZ8MXSDWi1nggLrEjydarTk9adPiwhO
	Lp/epuV2RcCsO9O9eehFFEc/lIcwr4FZ1VKV7kmq1vMqsmEd/poBA4KoW/jPziIRN3btFEEbILS
	LibPfo0NqTO0dKLGM4VIwYVXudPBNBGT912A4yHmbOYVT30OxtVeXyXymK5nJOZnG7oMCZpmzRS
	hUmQtsWIL1gX5h3rn+q0BxLySDSCS7VDg2ufQJ8fZnyAXjFtnjAoIZgdZOzON+lU27ulidZ80/v
	4yr2ZNHM=
X-Received: by 2002:a05:620a:3941:b0:939:6df7:73f1 with SMTP id af79cd13be357-93bb79fdb62mr316187885a.51.1789554585600;
        Wed, 16 Sep 2026 03:29:45 -0700 (PDT)
X-Received: by 2002:a05:620a:3941:b0:939:6df7:73f1 with SMTP id af79cd13be357-93bb79fdb62mr316181785a.51.1789554585037;
        Wed, 16 Sep 2026 03:29:45 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:44 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:31 +0300
Subject: [PATCH 15/48] clk: qcom: dispcc1-sa8775p: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-15-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1924;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=S2AniEfyDrGOAXCv/dbv4sqVV3IlT7BHWm8yR6GgpKw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9ZFTumNHO12xEU2gdf5L9bzh9pA5N2LD6Fg
 55K78eEUg+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvWQAKCRAbX0TJAJUV
 Vi8UD/9gmXI+u6/2q4wDrxT93woOSSnX+zMWRU9xM1T3dGVn7MPTeKtWKxWQza0WT15vyflJPoC
 zcdVH4RW2fA313qUJxwa6cc/DDF7dmBwCikIT/kCdN8ys5OQYQzrnwQyNY3X/PjnNXQ3AKUH/wN
 50AGAY4R/SK2QWn6tFT3HC831yq3PZuixZIY3kvcHVyRj736iQ/GXXymmcf2b1ag04t7MXIrYjh
 OaZkhrWfBDtD8uhbWMXBydiXY/DiLmCSrs6yFFUvBT1Uxj6bKoSRYEVhp9gfsUhC8Yk6dKTmqIY
 b68hZOb1Z4RtRXgV5GwNwfX8dLUb1pWYQf2e+g2t2KsQZ94TUBOwqY6/Ps6PWHTCmJ8Fwcostcm
 iRyHHDJ/Xdhs4eKi0iNIDNQd8nPZUv8i46TYvxPHuZK+k0SH+440+5C/kIA6esLClXzmFC5xsxg
 6Z5dJTHPCO/11j9FVPZpktzVFJViDnhQrF2N2gd6WJYk7queV3aCWpusknKQ5+dOdBKFFlBtN9o
 NDBrYk+ovMX+clYtg7ecDiVIRCSjXEsDiQtHW39zmH8ULykYLSP4vXO07pyxAnZyb3+BCYaUIeP
 3z1d0jaCKFIB5A3hn1Zzaz0G70P0eewZexy8SFmoAJLfvaLNYNnwILvQpXDcTVPWbc/JzXwkF8k
 8S7PVLk0FMVn9JQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfXw0TGLy9wK4YK
 Bl7R94eqounbyxiOPcK1DyBIRsrqWricqK+EHGo348BbM+SE0QMP35SbTo1sg1/G4CLuXoBRU2H
 9ESSSjM+n0/UjjQPXc2gnJFu/9g7+QE=
X-Authority-Analysis: v=2.4 cv=PsIG/AM3 c=1 sm=1 tr=0 ts=6aaa6f9a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=xG6gKK67fXx6DpdPwiUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: xbvEI2SdXCoMMsUGPSTuDmHrdSZ4gj7f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX3okCNVJuyN9l
 kBHj658mJAzbp8Tr0qHGCAGai52VrswhVVo16QgSREJvOeKdhrnYX9+zLtrDyy0C+p8YDE/EqKX
 CVTeDBhwevn3W5AcySnQZAq2hE2XpFgtU6J/oiJxn8ZBYkJo18hWRdiGpcr3Ni9fNFF5fK+nTDt
 WzRPJ7mcuz6WmHDMBQslO+IR4+5Jnd5L38YNudOy9TsU9Nuap100IY1SJOkQRVV9tyf0x8NBGkr
 we/cyReeXCOpBoocDiJbz2iUQuK011DukAmBNwlxDI7/h4DL9V1F7u/peIBXb/5LEZBsGlIAWzB
 qgrc2TPGORpJAGqGZ8VXyVGLkgEK4WMz1seq+FdGEfPqEk/VtgfjnC0mRS2ve6ePc6rvMsxlUvr
 mr68IeYsuChH6XAfAolTjVgEtmPINAXUxrreSK2BcRpjKY68xn1JR82jESY36OvozxTmYQevjEP
 TZqgtmVYtRadWf+afvw==
X-Proofpoint-GUID: xbvEI2SdXCoMMsUGPSTuDmHrdSZ4gj7f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc1-sa8775p.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/dispcc1-sa8775p.c b/drivers/clk/qcom/dispcc1-sa8775p.c
index 58008c1afc76..330d953b5e9e 100644
--- a/drivers/clk/qcom/dispcc1-sa8775p.c
+++ b/drivers/clk/qcom/dispcc1-sa8775p.c
@@ -1414,7 +1414,18 @@ static const struct regmap_config disp_cc_1_sa8775p_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 disp_cc_1_sa8775p_critical_cbcrs[] = {
+	0xc070, /* MDSS_1_DISP_CC_SLEEP_CLK */
+	0xc054, /* MDSS_1_DISP_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data disp_cc_1_sa8775p_driver_data = {
+	.clk_cbcrs = disp_cc_1_sa8775p_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_1_sa8775p_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp_cc_1_sa8775p_desc = {
+	.driver_data = &disp_cc_1_sa8775p_driver_data,
 	.config = &disp_cc_1_sa8775p_regmap_config,
 	.clks = disp_cc_1_sa8775p_clocks,
 	.num_clks = ARRAY_SIZE(disp_cc_1_sa8775p_clocks),
@@ -1452,10 +1463,6 @@ static int disp_cc_1_sa8775p_probe(struct platform_device *pdev)
 	clk_lucid_evo_pll_configure(&mdss_1_disp_cc_pll0, regmap, &mdss_1_disp_cc_pll0_config);
 	clk_lucid_evo_pll_configure(&mdss_1_disp_cc_pll1, regmap, &mdss_1_disp_cc_pll1_config);
 
-	/* Keep some clocks always enabled */
-	qcom_branch_set_clk_en(regmap, 0xc070); /* MDSS_1_DISP_CC_SLEEP_CLK */
-	qcom_branch_set_clk_en(regmap, 0xc054); /* MDSS_1_DISP_CC_XO_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_1_sa8775p_desc, regmap);
 
 	pm_runtime_put(&pdev->dev);

-- 
2.54.0

