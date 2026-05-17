Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA772DECD3
	for <linux-clk@vger.kernel.org>; Sun, 17 May 2026 18:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779043872; cv=none; b=LBfE+tbMbUqkoFll/D5SkYaH+F0NRqdd/Ycuh4JFB6/Nf71+qbgKQpNPfDApGPqYU92YkiaSHIigQBpCH1MgQs3oTmZhDxRRIFpsTg7kv7v32VW29HBEaHlFS7v9AH9kiScTRC/4dUnEjBvNtc5HiLQAVlCm1yfiFDjxD5PcyqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779043872; c=relaxed/simple;
	bh=nCWFE4LWzC6+Oah4EmkPSev5ETPTLOEYYLJ/3xk6mEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tQ1G4zY/xqP7tMFpSO8ox029N01L8uRvkHJj0Ch8+GJCRIe3LaRdq57a/2GDwWWQP+exFn55TwUK70VA6WHh016/4WM+jQLQ2hMMoRQpTbUIQOqVdDiQEWjw83s06Zj0AihBak4Gobfkpg1puzKpnrz8YaChqb3Ta31Rx+Kx324=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CpdXZoZX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kd1S4csk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CpdXZoZX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kd1S4csk"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H8b37M3355337
	for <linux-clk@vger.kernel.org>; Sun, 17 May 2026 18:51:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GDzUCB0R01yGJ9xA53BA46
	ickPsFjub9nOUlBXxPECQ=; b=CpdXZoZXiUCXCLT5SyAc4mpI/qvryC7XhYPCbv
	MgGda1zgnPXKivT0hw1SaivkW9YTwj8A5qbDU9sv2uAlsSHTgJBfk4jQEs5ImKZa
	utrqTHlNzUtTLgWA6SZNUCLdPQYvNS7eH8AKJMAgzILexpaLREy4/mZplM+8r0Yz
	CxdZOe4Rtew1StxcTEhNRcufhDz6ZY0hxc2W7wfok4YPNVavHBAMSnhxZZ1D9H2S
	inVhPbChMZRzFnfR7MsaRuXukyqra/ESXICa3RsGXZIVQLXlegGucNLi2t1jkorO
	Okcxkn1CGpr4SKGlWqNgErtyRLXJV0WhJ61nZ3pRj63ZyjNg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6tvcj9m1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 17 May 2026 18:51:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d812c898cso44646431cf.1
        for <linux-clk@vger.kernel.org>; Sun, 17 May 2026 11:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779043869; x=1779648669; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GDzUCB0R01yGJ9xA53BA46ickPsFjub9nOUlBXxPECQ=;
        b=Kd1S4cskn4XeXS3Kd1ZO7QLZVJ1F2C8746Zux6WNnZLPCMjGCteD8+2gfx8NJW2TfF
         +2fAGrscdC9z3P2pWwDoIPCquwLOplG+eagEObvlH1E7LnWYlSqnQgjoCAAZANcfiMtf
         9kwD2x9RTtlA5ZVXtAg76166nYPU32ERz+wxF3y0/hknaHkdFv3HN7IDymv1nvpTLAJa
         qDfPOdxYXETvWm2ZPeJ1vbjAwx80gWEEmz5Yhh5CmRJv38FtWD7ObCKHkI/I/dHU3nNr
         c8hxdCPDVJ+e8tD/bDisoSDZK0g0urMKZIAZEjSdwaclQgMIUBv0dA2TMarvdpjd5Gor
         pNRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779043869; x=1779648669;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDzUCB0R01yGJ9xA53BA46ickPsFjub9nOUlBXxPECQ=;
        b=bRndI6alTqM3GRd8TtnGEaVaSSqJtwjrr7lCBlE1D18AQcL0M6EtvBDIucw/he5L63
         DF4ZzTvQYQANkRH7yRHvqh0OMe+xK7LIOo21La807CCghVPqtzvu9q4H9MSc9DmA8vJY
         feTHfGxut2dT9WsoYAxC0E2jU8V5Aw6cI2IVxFXRPkGn4YkunZ6K7lmlEmpy6It2i++s
         pJeubu7+sD8uqBJOkIkjvOVw+/UvKBNWZ5V+V9y3vkOyEhiAosScTWyGJbZZwH8xTNIx
         MXRjUC7o9srM1CK6XrQ0wYfTDd+rMxOhh/mk3wMVZ6EZZGX7qW1ZKzGIqKRJh7K3gsmT
         uJeg==
X-Forwarded-Encrypted: i=1; AFNElJ+WMUHbi0+JnvRJTbS9cKgHqoNkvme+vHcMujgQn9d1mZYD1l1AMPhwOwvXgoz+PPYUEpRdm9wvMy4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz0sU6rKf4QgS4sd3MSKmvmGmpHW+OAqOtHJ97oa7KSDxbBPDz
	+IpXM9e4lMH99ZRoyWQULTxbBrLbouogfZ80nC/U2azKY7XTBeqQpOHhq3y9SRNjOBPfpGbj3Y2
	p8YLc9GS12b3IJtm3HhruXRgZEV8Ooj/KYJX/YnP8ApQvfPg+D65atyjxkdf6YHjUMbXcrUY=
X-Gm-Gg: Acq92OGBImHXaMwRvmcMYwJTJJBb5I/cPAykSJ5/3Qyfud8S6f4M6WQIwaRtcxwmCQ2
	ydvu6znoYky9hNKHEo/Kcl0XGDyEMyNb27JuzpXkmHJ+NkqnCKXRwh+/0iKMop2g+WLa8hIqANE
	wjLuCavvWQHNmqLVsv/SLE3/4Sgt4LiB4vLQ33RG4jtspAoJzhBckDgsQ1EHXrpLiBrPnWueuqx
	1x1Sf6PSZcvq8R6mvQ+7nzxXj2S8pPoHQLHTXdsR6QPmwIeLR8fyQDNP1OYW/GNKMiRTeg9ez8p
	bMumvyYmWq9Rn38nW1WGkFqLrupoT1ar3IPvP/aaSuQ8XuZsf/XVM4n8P3R4RTvy5reBnhgbznt
	GaCBOR/WPrl4iJjZ08J00dFyifqocty6sYLPZN/N1yWeCyqNt/cNDBr3d6nIokGw/IgCMIC3x8J
	kKY2BLL0hZC6cDE93Qdj2CarTy8+2VO2dth14=
X-Received: by 2002:a05:622a:d1:b0:509:1b76:e9b2 with SMTP id d75a77b69052e-5165a276812mr176979431cf.55.1779043869059;
        Sun, 17 May 2026 11:51:09 -0700 (PDT)
X-Received: by 2002:a05:622a:d1:b0:509:1b76:e9b2 with SMTP id d75a77b69052e-5165a276812mr176979181cf.55.1779043868649;
        Sun, 17 May 2026 11:51:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164cf803sm2890502e87.76.2026.05.17.11.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:51:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 17 May 2026 21:51:04 +0300
Subject: [PATCH] clk: qcom: stop enforcing INTERCONNECT_CLK dependency for
 everybody
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-qcom-clk-icc-v1-1-1dc6ea8bdcd0@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABcOCmoC/yXMTQqDQAxA4atI1gacFKfgVcSFE6NN6++MFkG8e
 8e6/BbvHRDEqwQokgO8fDXoNEaYNAF+1WMnqE00UEY2y80TF54G5P6DyowtW0NEDyu5g5jMXlr
 d/7uyuh029xZerwec5w/giDE5cAAAAA==
X-Change-ID: 20260517-qcom-clk-icc-fc6122236e5b
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4889;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=nCWFE4LWzC6+Oah4EmkPSev5ETPTLOEYYLJ/3xk6mEc=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQxYXn8SLbJXMlRdPq7gKl3WpfpaVE5u0fE/Tqnv9FcYzU
 19OTLfpZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEzG+y/5WU2fTn1d5LTHXF
 RRn6T4x134eezQ5YmBIm3HatOdyr5t3XQIXOU3sEnS1fX98TVNy+++2NzuOfmPQKXSf3uJ0o+8f
 o9XnfLW1zS5vHh1Ycy5oo/qWjfb/SAgvBRIucUL9PbHoX93ntKNjp1fNUOTjHuM5N77HoLRal7l
 S+3QVT8nd/dp1n7cPywzA8hedHdcNSjg3qPm+ivN9xfrrgm/bedvFPDt6POunXzrUkvD2vbJzan
 yY6S++JcNTHUrb/Cc/uhprVXmqXuZy4dWZrtNg/afZTCdaCHEoTTCwOf5L5/W89Q61WdDPrmYKo
 G+7L8qconOxdXCQoopuafzxt39trm45LzP4x//oXrrVHAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: WOvEnnMwtFwov7x5s-xesl5mGpMW4Ctz
X-Authority-Analysis: v=2.4 cv=UIDt2ify c=1 sm=1 tr=0 ts=6a0a0e1e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=PKtRt_AHGqzKJ450pQMA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: WOvEnnMwtFwov7x5s-xesl5mGpMW4Ctz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDIwMyBTYWx0ZWRfXwbwmP4UGn2bp
 X5yUkxDGGfvt0WjjYybN+TcOOCcqpi1x9XFGtStVM+xLVuXJf+4zzRkGokWL9dDStWVvGejcUbw
 LcNAwL5gI7bTpI4l1nFv0rWRaS3xBR9msdAMdt+BGZ/6vacZSFyy2vsJS1iSriHqcAg8t8BlxiM
 iF/dSC6c4UXLtur9iBaxHVfmxFuCSKW5lZaUBLR28CScTLFrio4THBiYqyxafNGQ0SOWfoZ+qWj
 YCy5ylbwkVpZR+xbXmi4bm/4OyhU1A5v6WM215aCUE7AGCW1VU5wI+htjJfvUxVsPvuaNhqJ9cG
 w3jxLe3qYp/fJVTE81TTNDaDoeq26Q5ZBBSYsdFwwBHwvCMw0aInuGCQLbbBpdvS9g+SbXQcpVp
 8q96xYmY7PDSS6io7oEdX5L2FE3aKhStwKvkUpfUlz0Bix4EXIjATzgl1alm2LgOT5kl6AkhZyk
 bHYF6myeCYWveDSjtDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170203

Only several (typically IPQ) platforms use INTERCONNECT_CLK to turn
clocks into the interconnect providers. Stop inferring this dependency
on everybody and set it only when required. As a safety measure, make
sure that the coresponding clock description fields are not available if
corresponding Kconfig option isn't enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig  | 13 +++++++++++--
 drivers/clk/qcom/common.c | 11 ++++++++---
 drivers/clk/qcom/common.h |  2 ++
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index d9cff5b0281d..de8485b5ed9e 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -7,6 +7,9 @@ config QCOM_GDSC
 	bool
 	select PM_GENERIC_DOMAINS if PM
 
+config QCOM_NEED_INTERCONNECT_CLK
+	bool
+
 menuconfig COMMON_CLK_QCOM
 	tristate "Support for Qualcomm's clock controllers"
 	depends on OF
@@ -14,8 +17,8 @@ menuconfig COMMON_CLK_QCOM
 	select RATIONAL
 	select REGMAP_MMIO
 	select RESET_CONTROLLER
-	select INTERCONNECT
-	select INTERCONNECT_CLK
+	select INTERCONNECT if QCOM_NEED_INTERCONNECT_CLK
+	select INTERCONNECT_CLK if QCOM_NEED_INTERCONNECT_CLK
 
 if COMMON_CLK_QCOM
 
@@ -342,6 +345,7 @@ config IPQ_APSS_PLL
 config IPQ_APSS_5424
 	tristate "IPQ5424 APSS Clock Controller"
 	select IPQ_APSS_PLL
+	select QCOM_NEED_INTERCONNECT_CLK
 	default y if IPQ_GCC_5424
 	help
 	  Support for APSS Clock controller on Qualcomm IPQ5424 platform.
@@ -395,6 +399,7 @@ config IPQ_GCC_5210
 config IPQ_GCC_5332
 	tristate "IPQ5332 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
+	select QCOM_NEED_INTERCONNECT_CLK
 	help
 	  Support for the global clock controller on ipq5332 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -403,6 +408,7 @@ config IPQ_GCC_5332
 config IPQ_GCC_5424
 	tristate "IPQ5424 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
+	select QCOM_NEED_INTERCONNECT_CLK
 	help
 	  Support for the global clock controller on ipq5424 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -444,6 +450,7 @@ config IPQ_GCC_8074
 
 config IPQ_GCC_9574
 	tristate "IPQ9574 Global Clock Controller"
+	select QCOM_NEED_INTERCONNECT_CLK
 	help
 	  Support for global clock controller on ipq9574 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -464,6 +471,7 @@ config IPQ_NSSCC_5424
 	tristate "IPQ5424 NSS Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on IPQ_GCC_5424
+	select QCOM_NEED_INTERCONNECT_CLK
 	help
 	  Support for NSS clock controller on ipq5424 devices.
 	  NSSCC receives the clock sources from GCC, CMN PLL and UNIPHY (PCS).
@@ -475,6 +483,7 @@ config IPQ_NSSCC_9574
         tristate "IPQ9574 NSS Clock Controller"
         depends on ARM64 || COMPILE_TEST
         depends on IPQ_GCC_9574
+	select QCOM_NEED_INTERCONNECT_CLK
         help
           Support for NSS clock controller on ipq9574 devices.
 
diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index eec369d2173b..2bac581efa02 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -255,6 +255,7 @@ static struct clk_hw *qcom_cc_clk_hw_get(struct of_phandle_args *clkspec,
 	return cc->rclks[idx] ? &cc->rclks[idx]->hw : NULL;
 }
 
+#if IS_REACHABLE(CONFIG_INTERCONNECT_CLK)
 static int qcom_cc_icc_register(struct device *dev,
 				const struct qcom_cc_desc *desc)
 {
@@ -262,9 +263,6 @@ static int qcom_cc_icc_register(struct device *dev,
 	struct clk_hw *hws;
 	int i;
 
-	if (!IS_ENABLED(CONFIG_INTERCONNECT_CLK))
-		return 0;
-
 	if (!desc->icc_hws)
 		return 0;
 
@@ -286,6 +284,13 @@ static int qcom_cc_icc_register(struct device *dev,
 	return devm_icc_clk_register(dev, desc->icc_first_node_id,
 						     desc->num_icc_hws, icd);
 }
+#else
+static int qcom_cc_icc_register(struct device *dev,
+				const struct qcom_cc_desc *desc)
+{
+	return 0;
+}
+#endif
 
 static int qcom_cc_clk_pll_configure(const struct qcom_cc_driver_data *data,
 				     struct regmap *regmap)
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index 6f2406f8839e..1ebdfe831ac8 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -45,8 +45,10 @@ struct qcom_cc_desc {
 	size_t num_gdscs;
 	struct clk_hw **clk_hws;
 	size_t num_clk_hws;
+#if IS_REACHABLE(CONFIG_INTERCONNECT_CLK)
 	const struct qcom_icc_hws_data *icc_hws;
 	size_t num_icc_hws;
+#endif
 	unsigned int icc_first_node_id;
 	bool use_rpm;
 	const struct qcom_cc_driver_data *driver_data;

---
base-commit: 230cbc83bec52234e456f33a01f400f78bfac0f9
change-id: 20260517-qcom-clk-icc-fc6122236e5b

Best regards,
--  
With best wishes
Dmitry

