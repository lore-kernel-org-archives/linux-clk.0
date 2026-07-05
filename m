Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30DC27FD49
	for <linux-clk@vger.kernel.org>; Sun,  5 Jul 2026 17:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783271903; cv=none; b=leDr6iB1tPriSnPDPu8a+rnkiylbRH6bGvJ4UlyafchlvuLNvVhmiRG1LGMaFdoqQIh5qndo5AYvsYVVVBKERPeP1PvMSBtSF8C3Nt7NuNijyYmXiCu2T0Enh9Gjh4SjMkWYcmndPqZgJ2DAr7OGmD198WRcC7KJjnknFf7mxQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783271903; c=relaxed/simple;
	bh=kFYFh1TZZqq+jl/FRgppUJ4NXR1JgwqJucPvJ7ozvyE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a/sEdQef6QXYLSKuLVfGr2OX+7x8j5vk1KQw5TJWib2XjSnuPgbNGvdY1/K+WqralV/9+hkbhMquNHP80Cp7+rXHRcnT/5RNqxj498j2Bu8P+u04i+vF8WaXjrjJqYFaORwj5hws7bvdgo+1BeU92yk+uhI7staF/cyvGOc8rUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FaQbAmtT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XIPu4Aoq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FaQbAmtT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XIPu4Aoq"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664NlFMO169514
	for <linux-clk@vger.kernel.org>; Sun, 5 Jul 2026 17:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=E88X4m6sJnIpEBcCejQrRx/RK4SKCLW74DK
	R59LzRlw=; b=FaQbAmtTp8gZrF1uvNHFQq0cD/seFbep6Zy4QNi9GZM8x1KKsZ1
	Y94eigPS1+VTaYDAr2fLPKoN3XZ5n5oUu7uYNjS0VU+boEw7DnQ7EhemHUjcxVw/
	Y7ZQDfMWjfqn59t/T/Z6RUcrfElDUCdW9L+rlT73VrrY/gREHkqQ5TK3NX3yweOB
	DqWM3byM5PHmL15LMQGGe7TZDEeR8WVsZjx9arjfwmgb2kmADVGTY1BIS2raSMnt
	mTGSW4UkwHyqeJiZtiNi4quSMOhz2D+UPJJNEcJMtFjzPMNjjuT34Z6IUFqtbSZL
	7HD4vS70EG2rrF11Baj78IMz7FGxF+NGvJg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s64k6pw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 05 Jul 2026 17:18:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92aea0d801dso211604085a.1
        for <linux-clk@vger.kernel.org>; Sun, 05 Jul 2026 10:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783271901; x=1783876701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E88X4m6sJnIpEBcCejQrRx/RK4SKCLW74DKR59LzRlw=;
        b=XIPu4AoqGOcH5peet8bYjpczdDDDSClp69yKetDOmmLJD5MFhNt4rOwZmcHQlsWdkZ
         Gy9kzKKqJqaoSCecnqqBP4YbvaY54RgcykPriiPcEHfXZFdfjGRLoOZQXvvVjfzEf7vc
         TbUfEEYs91xjcBbkQmc6U7vY0sNUvmEjnNsgvpFPPkM8CsLWtRso2qP6q1TlQt6mqXS+
         mH+Tlhc0oZMJLjlGKydEeoQZXNhmsIpc+jKYeIIix2llX63R73pQslvVLlZoIxVii5Se
         6IQDh6+KfTTxDV4g4FqxeANVE/X/IfAMBqB1S/RduHskJkBvP1IZ4A7SL8j5FEEQZoz6
         xTTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783271901; x=1783876701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E88X4m6sJnIpEBcCejQrRx/RK4SKCLW74DKR59LzRlw=;
        b=rg72ulbNpELBahwDEC2ghwwxQ3sGKuv6CBTb+vT37qQfQEj8xF+m4qeA/m/wCYgMxC
         ffsd59VD3a96lgTHfCu/lQuXtzD5HSCV3VjK8wI72EM1RFoIKWvv/Xn1iqEfe6ahYftq
         L/z8GmZxxuTihUvzHEZufAzEi7PSA3Av0reZ7OQvDd8WeqTNeZJE7QvhvkcubRgRXeO1
         55nuc33D9hqbFJQFV6V8eh8eD8Qkhpu0HRSkVZiRC3G8TAcX/z4OHx5wcmKz2XidLdcJ
         Jx6CZDwpHstNU5ClsD7MmSCQygnqhzAIxXCp47Ssz77B8ezOzHendhpmLjXXoVQjpX9E
         MR6Q==
X-Forwarded-Encrypted: i=1; AHgh+RpsGpcie7mXgZdJkr3cwx5i3AuAsziZbAN6GUIQxiCVuiKaYFSQLssFFJBIGaQT9q/EYbwIfhvcy40=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYGy6IpTu2FHCAUGsDz39g8IP5JC57qrshPJNVWpAdv67yNrn+
	IjJA9d5Y/uooKYPSIzN7M8s1/ftEqoVv4E8FQ0VHLMDBsz3RqiPYd9P8Jf0FLp3d5UtZuqc3kh5
	17qveVoRUfTHSPiMKyy/OxH+9GbGtOOqEfNys9++heyV0yQfQ9wwc6qr+sGOM6r8=
X-Gm-Gg: AfdE7cnRyqrWl3wYiZNClqUC0DmgxsveZw+Jp+XLpNMvQGh94o4L2TwrkkcSoclDsOX
	lSpNni8XLdOpiXaIp5dugJIq4wZvTOF3CBgY9nRWrgVWKd12cTEOeXpXiiEUEyBVxCG/XE4uPn3
	S3fxcO7lyr9XSs7LSbZHYfQIuCghRMkOtRsES7NzfK6CEjnCUc09lNMvnCPRUBfEG5OdbYAUJkn
	En7IWzr3mPLuuJIWNhE0a61UGfQfFZDjCb1KNSNYYRmpnBmCTk0ZzlI9C/xHPXjOLHaF04nJSVV
	xDzII9rOQ1jSJK0tOIqP2WuCL/yIPn58abIKTSRsXCp+o3YNrZswZ7GB57WlrTgZi+EwQ33XtZf
	Ui7JKhScMTOnYugbbojJ5VAvFs88=
X-Received: by 2002:a05:620a:8399:b0:92e:74f6:ddd6 with SMTP id af79cd13be357-92e9a3af10cmr1057736285a.25.1783271900892;
        Sun, 05 Jul 2026 10:18:20 -0700 (PDT)
X-Received: by 2002:a05:620a:8399:b0:92e:74f6:ddd6 with SMTP id af79cd13be357-92e9a3af10cmr1057733785a.25.1783271900454;
        Sun, 05 Jul 2026 10:18:20 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccdabda3sm220513485e9.5.2026.07.05.10.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 10:18:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] clk: qcom: camcc-x1p42100: Constify qcom_cc_driver_data and list of critical CBCR registers
Date: Sun,  5 Jul 2026 19:18:12 +0200
Message-ID: <20260705171811.115542-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1597; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=kFYFh1TZZqq+jl/FRgppUJ4NXR1JgwqJucPvJ7ozvyE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqSpHTPvumdT4GJ+Ie0LS25k1VA52Sq5RRpyVN/
 Ripk43GDk6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakqR0wAKCRDBN2bmhouD
 175ND/97YcLGnW3ImtwKSPB5Ne+SX8hbGw5VuOBEwvSCe4fDCUT0IM0epQob7WXSgAA1JQGtWjR
 NPzFfoqqHsoT+mXJG4qy3f1wmUTGP5rDMEutCl/xkxsXu6QSwz8/vxgmMET1mBuG8x32RXn5Jzm
 YkDuc/ibfwLnZEp3Nb/cVAg4c6yCKCt6orCltXugZ+z/ajQq6wOAx+XPBcRp3B3DqvpH8TTy3br
 PXc9KuPY8fNsXzM70ZiYhn1l8GF0Dke0G+1zwYYvV9GPpNtwg+olN0jRqq+v+EJvWoWRZYcr7d8
 W+6ygyS7UE7Wee3fixw8ZPeFdp2oEAl3rSgEDJVP4xVXOjvihpDmhYVkKu+H1h0eF6oIIV0qHVo
 /GCSj7RIDlGdwRCBaezjkSiCzUG4KI2gMbGo1UtpIy9U1X8qwCber/HuPq4xtLNdw3HEaiJs+dF
 3bOgRNuUr6GZI2HLLu3hi4m3QZWK9FGH38rwqx4Lik7Zl1J6gjemNAYt0MrSEvfl1nJk7fD8Ws/
 121RuEMAcodOx/yWIsKolpRIctlyTSwSNFccfQJ1if++EuUdBzMdcTfukg90WVJNsMQNswC8Iyc
 YDCwHSpGhfM+gbtybi/YTJLmEhpfnkqKxturHwX5HSx9zTpzCivDgkzOsPRkky+4GaUpyurr6kq EBLY3RcXvE/3kGA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDE4NiBTYWx0ZWRfX0BQIsNy6q2Dn
 4whygq3r3ewaDXMAjQZ7y6GcOyqFneZdqAJThh1TNuwPGrI07CbBzlvE+ao8tZy7xadCG6LPCKH
 wkwQt2jvhcLxFS1wqYxFRWSnuGfJdt09NhRh+PpY8ZdEZ9G8B0zjl6Ie2EigBfXByaz3rsNoTXk
 gz8unUdBAyZYOusu391bwO7s61ZF8Zdt+ZOAHuWET7ujGRSJ1B0BClmJI0vstLsT0UXOD9MR2T/
 myPpud5mKfrC0pDb8lps2WG7ABW/IVDHEvtdBSwaIjSEEMwOKcLzmglpWb0dQuQBkZ6GZNXZj+H
 JuGE2G9kjIGqvzwfYZay2LnUwAY6UMAcKIaUonD/JhIv416dfgHzhoD+crmre3eZ1JUBc/w73aK
 hJwhOCezFRueegClcJFB+rviI/va9XlbW+QciwpGEGZolsioEpDwPSZh6Sk+YKqD1J154JOZQxq
 SQkaiX66oEE1AyJ7vSA==
X-Authority-Analysis: v=2.4 cv=VvITxe2n c=1 sm=1 tr=0 ts=6a4a91dd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=4Nzj8Hz7_X1f4_I9MkgA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: j5gVNqVvXxBbus3xilyY0taxonswePBD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDE4NiBTYWx0ZWRfXxurd+J1eR2th
 QJCOlurZo12l4fmC5C1C2MHtZnurdywGyCBhEEO0s+OwSNtqNozZQU0+l2hA9uBnofnS8mpdXh+
 estddkqkoAlQsnUrAp/JtCTNyxLvBw0=
X-Proofpoint-GUID: j5gVNqVvXxBbus3xilyY0taxonswePBD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607050186

The static 'struct qcom_cc_desc', 'struct qcom_cc_driver_data' and
array 'xxx_critical_cbcrs' are already treated by common.c code as
pointers to const, so constify few remaining pieces.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/camcc-x1p42100.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/camcc-x1p42100.c b/drivers/clk/qcom/camcc-x1p42100.c
index cfe24bde4652..e2b8f7bd8974 100644
--- a/drivers/clk/qcom/camcc-x1p42100.c
+++ b/drivers/clk/qcom/camcc-x1p42100.c
@@ -2165,7 +2165,7 @@ static struct clk_alpha_pll *cam_cc_x1p42100_plls[] = {
 	&cam_cc_pll6,
 };
 
-static u32 cam_cc_x1p42100_critical_cbcrs[] = {
+static const u32 cam_cc_x1p42100_critical_cbcrs[] = {
 	0x13a9c, /* CAM_CC_GDSC_CLK */
 	0x13ab8, /* CAM_CC_SLEEP_CLK */
 };
@@ -2178,14 +2178,14 @@ static const struct regmap_config cam_cc_x1p42100_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_driver_data cam_cc_x1p42100_driver_data = {
+static const struct qcom_cc_driver_data cam_cc_x1p42100_driver_data = {
 	.alpha_plls = cam_cc_x1p42100_plls,
 	.num_alpha_plls = ARRAY_SIZE(cam_cc_x1p42100_plls),
 	.clk_cbcrs = cam_cc_x1p42100_critical_cbcrs,
 	.num_clk_cbcrs = ARRAY_SIZE(cam_cc_x1p42100_critical_cbcrs),
 };
 
-static struct qcom_cc_desc cam_cc_x1p42100_desc = {
+static const struct qcom_cc_desc cam_cc_x1p42100_desc = {
 	.config = &cam_cc_x1p42100_regmap_config,
 	.clks = cam_cc_x1p42100_clocks,
 	.num_clks = ARRAY_SIZE(cam_cc_x1p42100_clocks),
-- 
2.53.0

