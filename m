Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3100C31282E
	for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 13:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771249408; cv=none; b=g3Pn7TwSnmOfD5WUlLjKj9S9zB8wqnv2WjpeWszMTiKOhsThQYYiR4SrMKIro7fr2B5ERMRZWUdcyYUalrUD87WPVaEAWmJ41gZ3fFifQVJuMCXAnyMu8cSZVYJ0KbDTVdShHHDUkBWZoeU8NZ61e8ujpAMnUb9NdCrte05pQk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771249408; c=relaxed/simple;
	bh=WQrvTYPmJyy+pBriDd9DtxHhgqJh7XCWBKiXgMM+6zw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ohYP5evXyTXU1JPrCTiIfkiZqyJjRh24DvMnqpm5ppIFy4bqNcduAKmkH63oMxvUTfSUbkKncnSEILERBhkp8Gr8E0aqXcRUmgbQSxATwTmLJOqtEiQQoiivb+WUBX9ZLcXLrEwLS6tioMMp5B3DCpe1wP0Um5yR7/cFiLUsDgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jTGFvdfC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IFnKtuxp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jTGFvdfC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IFnKtuxp"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GBJL733463329
	for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 13:43:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9/Dm47IuIOXrcOG414u+9L0nB7hzx5MBSgBwzvUVWrc=; b=jTGFvdfCT5EFgpeG
	vq91T6fa+RYSAYNXtzkyCPzQt9tMp4WRIfMhoYedD6C+DeOlMtMQrpgapYAEP3Z0
	qXPWP52MoY7ByZpzQ2/YQiQksuTqZ1jw9L39D38GozXt2IiHqTmCT3yKICiEDYDP
	nKZi+/hXOZ1I4uoxJw02rBPzlRtt67TUtrxpYfp97GaYOjBt9vca/EQzGg5TKfii
	KK/Z+9bvHsnnF2r7CB6zSBrIVeZmY/SGcjTatrLFngSTXfL8AuDj5jGJLwpfhcEg
	c8txELtzF4jQk/3+/eYCFooVS5WOOrCc/Bkri7W592ZHSnt7q5oA70c2YJsVc5E9
	w007ig==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cag24cqkv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 13:43:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3a2eb984so3389460685a.0
        for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 05:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771249405; x=1771854205; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9/Dm47IuIOXrcOG414u+9L0nB7hzx5MBSgBwzvUVWrc=;
        b=IFnKtuxpPp/ahMSMSIfEUN1UJic8xjL+yVv0SVICunj2+sCPFVRvOT771RlwQx8BtU
         r9hSCp+fKw+6L8fw+CrQzQMBs0DoO9CpYloOzfz/51Kxve8sL7OoH82A5b1JmtlmipzY
         wWeK/BgRIdFZXRFhpd5kketO8Gpqumi9XII7b5rFlo/+urJ6jwp7Y+liQBOpVYWEnxVI
         poqe8xm617o9YlppVrSxWekgpWPONAMaU4VQJABMoXrVcK17I5Br12ewiO3CbCIElg2K
         U2zY2py0AkejJVGzbHD+jf83osn/ogIotcalC6+vM2WtljS86dpZfCMQaaJOwllxx25H
         tDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771249405; x=1771854205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9/Dm47IuIOXrcOG414u+9L0nB7hzx5MBSgBwzvUVWrc=;
        b=LzmN8aB6YWt8zgc774GUgZMqkW80FmJ9pL1ie+rjxS2b9mBfakPHinc2NqMYP86yKm
         7BDprNZRZhFh19vKPkUiw399ADJJ4RDC8camAn9J/huDCu5bI20sXOnGnsD7nmHt/ES4
         EiKl2mY4qa1PvEidEpuky7LSprWPHjWfjK1S3v8fY3Uh8uv0KC37guU0vbZSZ8N72tCs
         ielKNEO8A41d79akmh8bbcISG03M4LRi1x3tTuX9UtbLZjCPajCLx/OBKhs+FT09a8HX
         cQikUkAD3rV4u/f56A7E/B/JEg5eKviwBkkeg8rquEjuS3o8nq+dkE+NSysiCtOO2BqW
         i3nw==
X-Forwarded-Encrypted: i=1; AJvYcCU01wtIiw3ahtc7pDufEivjhiIODqpNt1qT7yP0cYyxdP19qlwcIP+n8Z5tD+J0Jyc4FAkUx1oPTbQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWLOB2n6uXlcSVWeXz8670qasOKnDIaJOSZOEvbSLjt/NEZLsJ
	rsRfOdK3kihyYjj4hIElXDsOfz7K60f4EiGgEwDWQE0PfC+aMUigQxlqb2EJcASjN3ksMfAJgv3
	3YqVH9kJAH7+JTNJ1drJCQGCjGP+5PuJ/oxMYUQ/+quKtOBuy6vxc6NjREJuyyUw=
X-Gm-Gg: AZuq6aLZMDyqQnKnShYi9mPflgoI5KIbrtfkqWJR36OOaGiIKA9kGPhdxcpkdEDGGMU
	ogLrIIr7tg2sN+cq0Bh2NdQ2/N4CzSftLdkstLU3CajzfNFD0xRD9jJqnDJEfb1aro328FGJ6x4
	R8uqfPp1crQfXM4ya/TiqdNJNw/dqgcwuSpbQp4BmWT85YbqELri0f93B8ID3U+6InFVLZFVI19
	k7JdMbZK2Tc78thihy/0bklItX4yI3PuYTap3uxBvX5f+Mcz3iYU5QRldurc2Sl+YJdAPEcla4j
	QnRZmtAzp7wpZcVaOU0QNvQBObHjHQGK6OrsfGd8VwdcUkmHHCxkO8ItcT7Oxa96MJCHX9tmwkG
	RVshpFzUEGYNl9nMrrCC95RJwYrKHCw==
X-Received: by 2002:a05:620a:1aa3:b0:8c7:c25:9e53 with SMTP id af79cd13be357-8cb4c0065fcmr961296685a.59.1771249405382;
        Mon, 16 Feb 2026 05:43:25 -0800 (PST)
X-Received: by 2002:a05:620a:1aa3:b0:8c7:c25:9e53 with SMTP id af79cd13be357-8cb4c0065fcmr961291785a.59.1771249404785;
        Mon, 16 Feb 2026 05:43:24 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a6c1bfsm28883025f8f.13.2026.02.16.05.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 05:43:24 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 15:43:06 +0200
Subject: [PATCH v3 4/6] clk: qcom: rpmh: Add support for Eliza rpmh clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-eliza-clocks-v3-4-8afc5a7e3a98@oss.qualcomm.com>
References: <20260216-eliza-clocks-v3-0-8afc5a7e3a98@oss.qualcomm.com>
In-Reply-To: <20260216-eliza-clocks-v3-0-8afc5a7e3a98@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1914;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=eXC0lgJuWJT7B+zM9iiZZ9PgmcyVmNPid1R442OFsUU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpkx7wkXIDndP5a0AU3KbrqKob7mS8kQG64JGUn
 Fe2Xc0Z4CWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZMe8AAKCRAbX0TJAJUV
 VmkaD/4gFPul2Gxuu1jiGioWPM1Ru5XSEXtxKBL3Wm1OQChdI23BENSr+W6RZ0BwYEQHz+24GqC
 M2YvLvYkicGhjbu33koH5T7iL0RJAOCU5VG7tW7+tobpiL8VPEv/D5YVlHIOoEzLOnSKbeItWAD
 FL9Grd/mDGJu/tXoJ3QnmuPX1qWVdq1B5pJRcPzNdMU+TyKw07L8vF6E6UNNtALZBRLOTn84B/s
 /BLcKTunnMY1f/kp/+qIDxr9oZjM8jlMyHLSY5Vt7NBOaZAqLCCFihgwZrWjFCKHxFTVLAdFliH
 fuiujvHVSYtMSmsA0edfDHuAV2C2x9vSq5XR1kJnlzJhYoUp31sJhry26j2AXPikRjo+4Js6upP
 KPn3gznPWJmhLRn78ba9pklI1ARnbdddXC1R21czg5pirkdE2kgYSrNjbrZECKQQyzakAkeLX5z
 TMXFOHoxZ0FnbpKlSTJ7M6mV3ch9cQjbnQDAQjuWLnIms4sZjWVcCfsCj1y74VZNlxEYgtTo0/V
 eo5otRHtejO81eUohBlRyDWS/vo/92DAp2JUgprv/Qm6FfrCaWLpsMoHm/PTu313FVhDLFvVHgu
 bZEI+s0Km9Tq3RNAMwfC3lCKHCdacuuMxQhloj31KfpgujkUSlLnlr+Chbmvja3qtRM/9lwN6ZM
 jsGvkk5dSga9MhA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: os_uRqMQmA9kmRwim4iP4VuM7BNRRugZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDExNiBTYWx0ZWRfX58Uk3PV3ccAg
 Ms/zc3QjQXc2XGKNnohvB9fcBqlFWsOEyLDdTpF3+/6JYsSX8AhY7IwFDZjjiJv5zGhU+lwG0Ej
 ECyr+FYaZT/6B3NvnN2o7HmPmjdg0bzvy/xxhmdr/ZHi/1YRxFj5+XaZ3PZZNUdXjMwY7DpcWRp
 0XlRXUXJ0BSx/1rsQCoG3hS2QLQk7N7OKqiYNaZy0CwL7RAYSll3oZyaMCWJxSI/PuFNTdZYEDf
 fZr1H/pYE3HTDfuXBiBn5EerEMCO+u3rbkdpOAXd7tqeXjBA6rcBiEQUjDZNMDwHMURk1SVr1Wm
 9OqXIta20749nd9HFnVZFjTK/K/i4MxOCxVfSNFtLvJpDxZ49sAibaMn4WMcvIPhfVoqQ14ioAj
 Deh/Od2WYpzz74/5hfQDUPXxpZ0iSK5vsOGH88NRY+cMHV0rIQeFqfrVaz+04VCAGS4xlJ24ctg
 2MiZEKFVlXs0Lw1clXw==
X-Proofpoint-ORIG-GUID: os_uRqMQmA9kmRwim4iP4VuM7BNRRugZ
X-Authority-Analysis: v=2.4 cv=aetsXBot c=1 sm=1 tr=0 ts=69931efe cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=hmjhjfVocwMNySy1NqwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160116

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add the RPMH clocks present in Eliza SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 547729b1a8ee..cf46a6585174 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -940,6 +940,25 @@ static const struct clk_rpmh_desc clk_rpmh_kaanapali = {
 	.num_clks = ARRAY_SIZE(kaanapali_rpmh_clocks),
 };
 
+static struct clk_hw *eliza_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_LN_BB_CLK1]	= &clk_rpmh_clk6_a2.hw,
+	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_clk6_a2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a2.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a2_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_a.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_a_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_eliza = {
+	.clks = eliza_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(eliza_rpmh_clocks),
+};
+
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -1029,6 +1048,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id clk_rpmh_match_table[] = {
+	{ .compatible = "qcom,eliza-rpmh-clk", .data = &clk_rpmh_eliza},
 	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
 	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
 	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},

-- 
2.48.1

