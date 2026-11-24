Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550509;
	b=g4LEWVVudMdt755u1NUFRmYFvdManMh0QfjX/AFEDTIdqLPt3C88rv827qD8MabKCC6x
	 KeXk5ewHWzlTzLfyAEQgHqqdRL+iW6xAT456p4LCzdmYs8kgq6b1UycaVkGNAy/do63I1
	 0CSSMEDAj3P+wMWu5GyIBvIKETmP8CbedOM+bNH6YhDVfOWcPsBAAv8+vEeGtMWgIEPpm
	 PGGJjeDCzGCHYxMaZa2Z7NjKPnnqbeA1lkWjr+esR9SoSu74Uol1tiSNvytOBKz/moXOh
	 k2ypjaNp1/waYyBiv7EEwnEAkldJ+3NvUeXlXut08BE6NIhoz2LesgV8E8bidOwdiuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550509;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9++EjZZXOS4NJ0u4WUgR+GPL0YP1zFMSphdYQ6zyF40=;
	b=efwujyTWGJO58tZHACNkNUoGDSgvGzk+tFQw9Wl2Ses4+NyHorvitvJIzwsYSHiBrQj5
	 kBVMxLoumeQCCbhZGqjsz4P2EwN2gk/f06IaZuFpbyehdG0T543EfC3cXHEC8H42tt77w
	 SRamtoG2uo7hKoWem65Vi0z91AHzeNAJjNUXwVPeDkd1KYOf22CYzMYfU2TDqdZW124u6
	 Hq1gRPWB8CJd6kBuayFCp/8SbcDrl3oPlI+SFf+RJm/727qwP6KUpwEfgjEysx2F2QY8a
	 PAkLFVUD7lALfn3PcYNzljXJQBCIpbMD8VaL1dl57brKROxjtfxUn7qM32csW4QJ/7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=onxWI2js;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eTbKs4Wr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24572606A33E
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 20:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24572606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=onxWI2js;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eTbKs4Wr
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIXKH71767117
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 20:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9++EjZZXOS4NJ0u4WUgR+GPL0YP1zFMSphdYQ6zyF40=; b=onxWI2js/qa0c91h
	l/J8lCF49XdAetJqFVrI7XmVpaEGNRwzO2ejLUesHar/CwxBp1Kh+WJTJ3pk+IwM
	QNIOCNFEy4ZV0Q4oDM1xZSAaghIxGoYZky54XgIduzeTXWeLjfg0F5jvi2MMJc0i
	ASDpMpSHAY+/j3aAWgTqMzMsFrH/ka6/FOQqDiICHDf4DAmGUaSFTdTK7TdckGGD
	0wl36+4VHsgOXuelx5nzd653eNdAEvk+RlJfOySyIuO8VUexEEaFJ+lLkjcgRSYA
	2Zuq5HH+mWIJWoGxjfkj6S2hrW51B0opt76jFqxFDj4CkfFHeErjgMGzsqoQy7hZ
	FSZwkA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5egs8u9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 20:01:48 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc2c798d76so153951137.0
        for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 12:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550507; x=1796155307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9++EjZZXOS4NJ0u4WUgR+GPL0YP1zFMSphdYQ6zyF40=;
        b=eTbKs4Wrf4k16vV8tsUqx3N2+E9DTG8qsQG2oAC13SbJdcVQDu0QteXjXEBieKBAQG
         pGbFipEAVXkzdkNeSig7GkrFxvOc5HN6m+G8hXT4ogNPwi+iFSEDOn4q9wof7d5sxzea
         oSidk2pjDBfe1D6fb/bu1rqzi0yNI4BVpcsldwXMAYZIFvMqZ06nupU957ZrDm/XtdLD
         2TZW6NHgGVGoG/n8TxRXzA5Zk69fvNFnbmhWvSzBDzamgCNT+FtWO8L+k+CeRiTcpctX
         1Z2wyytXEjKK7wTIo+TOUnYIdcqBMks31cMiu/1DA1R9KNnnjzVWtNcq3uobdf2b7YVO
         P06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550507; x=1796155307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9++EjZZXOS4NJ0u4WUgR+GPL0YP1zFMSphdYQ6zyF40=;
        b=HbbPLc9uDyTDGvxcS2ZAq8XTj3Js7wc1buXTcE0qm8GIbp5PLyb/Gka3kR6XDN5uiL
         29GWlYqzqGBb4VxASSZjYNbh3iXHJZEEuO0WKCkGi+d5TJJ6t6lG9zlQ4NevGTj4Q0Wf
         wB0vqkE6Pd4BYYntafBkkVHum3uw+gBrIkvsFuZ7GZIYDrR75i63SZVaCpKqi1LuHYpC
         Z4Q7hYCUs2HHv9aodeYoPvWvQOwRF9peYBn/Ew2jlrV5ei8KyaUrz5ThquHn6g7W80hd
         9aTbl9Rcgs/jPUUiZJ7S/En2gRa32+FS0jvNihddmxwncfMFP120+v9GQ7furcb4S2JK
         4nVw==
X-Forwarded-Encrypted: i=1; AL+hErHv1ZmnZJcKOLgoAfwMQ4b/lm19MXThiurU1OvWligHt9f+4vkTqZJnYlfR75cA5DdNGT7ISbLFaSI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OnxxhZ5zmxJCRDdZ2vW3dSEWMy8n5UksrLVkG5qjHmq0KmPQY
	1hloM8sIcgyKb8H6ZPnzTnx8kkxglOf5Z0LaLKTo0kwaei9cLsFfdMOc/k1w22CXNd1qfsrbmVz
	Rp8tbtGumR7OxCS6Vmisb1koPbaBlBB0sOxC4KNplJZ2+Edq1944aQqehpRlZNec=
X-Gm-Gg: AZFdTZeogbm0bRc/9inXPKDkjSLL9yszqMQOALdp+L6N0zFrYHBlDca6/zShGOf4v2B
	Le26npytds0wqnp1c0+2v5uSbHm0lzNY5IVPKfUA8oKW8WwbA3Li4M/7Nih09w+6r+PrplVOMT2
	0XVZH/hcvNSBHdWY5eBMZnhsuX3ZSjEfO+HjWs5jPFCYffDt2apMGcOq1a3XSzPbQ15pijKbU48
	tFqiSUf17dNEWeyAmmgBozbbXKN5PwUM+UgAT34f77dVkrs4nln/qdYf1dELHcHMzI9KiNsMNUW
	2M/EJFRNUrsYx6sD0YdeSHt9P8hnFmXR3XLD1B3RVguVJ4Tco9tgfaykOqwttQtcTvl1FS8/qmS
	UzRkD32fXWsaIME2r4DkChYMwd3wnbTTO0Iv2v2LJOoTq5obZoPhpwQb1HdlrPk304HLjNyqn62
	ox6tyvjkI=
X-Received: by 2002:a05:6122:2b1:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5ee8ad0ec78mr9654735e0c.0.1795550507174;
        Tue, 24 Nov 2026 12:01:47 -0800 (PST)
X-Received: by 2002:a05:6122:2b1:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5ee8ad0ec78mr9654601e0c.0.1795550506454;
        Tue, 24 Nov 2026 12:01:46 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:01:45 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:31 +0100
Subject: [PATCH RFC DNM 02/15] phy: qualcomm: qmp-combo: Add USB4
 power_on/off to de/assert USB4 clamps
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
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-2-a9b45c69cd38@oss.qualcomm.com>
References: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
In-Reply-To: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=1739;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=srDcbvCKmzTW6ZFC7dL4jM5RmKmDLk6L/F70k459R2U=;
 b=DfUOTBjSbX0G43dLFvbwRwSUp1QIURcaf26xg7MQFnmkwZFDhPAYrQBYi9bxMtPyd5DhHL2vt
 v/BQpOYKbSMBQSXZAZARt6EWTVGTYwoL/LONH9icnOTkbQiOeETL874
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfXyKSDeahKPvlL
 QXxryunq1mWFKLNTS5xEFf44f0A/UzDYXnp4OMpBGm2+yM1Rxx+LXcego25s0Dt1dJOgIKm1dVt
 3MDtvSYTGASDRXrU3/6G5X2nnnji2XCHU8ZSgpaAGSFTT1ibHDqIoHf2ApRhoPD6ZJYCDUwkPl2
 l9WKtOMAo6ZYCLhrzEBo91P8fyaHRcz5JUS1+44MUNRX8nzPaBaGU9E9aH1S3tYRBAKkC9YO+SJ
 ClJoZQ8rcx97m2bglZa7yOddfDq1rYRoQQ8Htgptl6vj1lZVAMkpQ/xqan1XTxkavH8TaQZ28AX
 /wzLfdoTqx4oUg/4+S/vVyY1SpEs1iItmhdazhEmQrHOTPdg65ntUg47r5ZJMZDb1DE7X8Q7QdK
 mqXkD7C0mEKNpP3c03QiPq1G+uq0EjtHkKt2YRHSWgSS8JVsbqPzjuXFC5FYWtNHe2lXwQR/s1S
 qt9uNrjnZJ1tCRyARjA==
X-Proofpoint-GUID: kPya2YUQ1sk2j5xBKcaTC-rvJyRgF5ON
X-Proofpoint-ORIG-GUID: kPya2YUQ1sk2j5xBKcaTC-rvJyRgF5ON
X-Authority-Analysis: v=2.4 cv=Zt54uN7G c=1 sm=1 tr=0 ts=6b05ed2c cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=1SUI9jfhOX1tsDrs7xYA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX1BSJr8wGl9Vv
 v93hcUHWc96aBaC4iLrRuDqp4hDdKgRaJW0apF1IatHqogCsJ8lJkfWfGZHNYSiHiG5lUliW+DZ
 RowBDic7SoVaS74gjrLqrW6uUKbdxzo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240078

The USB4 part of the PHY comes with its own clamps, which need to be
asserted during suspend. Use phy_power_on/off to let the router driver
do that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 03fe66dae8b86837fddcc59956529ae374c1f6de..475b9a43baeeeaf18efb6e55d8151c170169c742 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -5085,6 +5085,28 @@ static int qmp_combo_usb4_exit(struct phy *phy)
 	return 0;
 }
 
+static int qmp_combo_usb4_power_on(struct phy *phy)
+{
+	struct qmp_combo *qmp = phy_get_drvdata(phy);
+
+	guard(mutex)(&qmp->phy_mutex);
+
+	qphy_setbits(qmp->pcs_aon, qmp->cfg->regs[QPHY_PCS_USB4_CLAMP_ENABLE], CLAMP_EN);
+
+	return 0;
+}
+
+static int qmp_combo_usb4_power_off(struct phy *phy)
+{
+	struct qmp_combo *qmp = phy_get_drvdata(phy);
+
+	guard(mutex)(&qmp->phy_mutex);
+
+	qphy_clrbits(qmp->pcs_aon, qmp->cfg->regs[QPHY_PCS_USB4_CLAMP_ENABLE], CLAMP_EN);
+
+	return 0;
+}
+
 static int qmp_combo_usb4_set_mode(struct phy *phy, enum phy_mode mode, int submode)
 {
 	struct qmp_combo *qmp = phy_get_drvdata(phy);
@@ -5110,6 +5132,8 @@ static const struct phy_ops qmp_combo_usb_phy_ops = {
 static const struct phy_ops qmp_combo_usb4_phy_ops = {
 	.init		= qmp_combo_usb4_init,
 	.exit		= qmp_combo_usb4_exit,
+	.power_on	= qmp_combo_usb4_power_on,
+	.power_off	= qmp_combo_usb4_power_off,
 	.set_mode	= qmp_combo_usb4_set_mode,
 	.owner		= THIS_MODULE,
 };

-- 
2.55.0

