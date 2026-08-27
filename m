Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C71948EBD0
	for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 16:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787848751; cv=none; b=kvvyjYMQ0CK6Y5xy71wI0AhW+3iMP1KpzhoNCJN7q0+FUmPcuk2Ra4clGR/kv38nSPzgiMzZskPd3mPiaQBG5zpz924kcY0wzJvZ1MmGdpEoRD2TvBQr02uyylUktYZXqMxIoowkK0idUuS2XIA1A35hpqlJlaUZfyJEfip+sNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787848751; c=relaxed/simple;
	bh=HmmI194gyOrC38jn1kOmQP92tC7eCM4pFbLwZh2jkps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rKHASFcZLOKbTEEyyWw3COVSh5egklLZDP+DT1116wCAWl44S+hghrU+liflLRktU9u9fB4Dxn6XWvu/8ATGePi30KlzBk4Qlz2knjnCnyrT2der3jS9XfCoMF/WL+MZTNF3+iU7VsUkss7SSLyZGCDevdbX16tcjWHUCHttZhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o83TyDGb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GQkGRman; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o83TyDGb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GQkGRman"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RG4Cmn342139
	for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 16:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hXdk8G4pm4CrNjX95hM/lx/4VQ+3Uhckavbrp7NZTHs=; b=o83TyDGb6xN8gMsb
	k1u4uhRg6AVRaGyBZly3yJylYQopQlfd8SX+Wo9UEXt+L+GJZ9qzDIbeNzbsVomG
	UqPe3SWefrPwtG/p0etjLFCYFeh1vdT0IaRnjRwe1fkPJUkd3S5G/zEYlXySjspu
	UNBc6r3NGpu1lQOjcFG7Xws2VEaqbuEvWXJAs+dGHKuAlGiGoMseyFRUer8gqEq6
	NcQ7yGhg9gK99UrEc7qwrwJKnXXrRjm3JeNL/Vxieg/aKPau7p6xy4pJ2oerTcAy
	5dg9PdsAxNgY6/v+xMzZmaZ6DI+HP97NfRJ0nf6gUsRn1Op4hwxV4BLfiFQnSMXj
	otmmow==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4garee04rc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 16:39:05 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7eb6429750eso195715a34.0
        for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 09:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787848745; x=1788453545; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hXdk8G4pm4CrNjX95hM/lx/4VQ+3Uhckavbrp7NZTHs=;
        b=GQkGRmankbkBW2HwadWNp0FD436ZWUQ6cr60A/dWNPTE05L4UGg5ndE3NThAfIp2cO
         LopTCCiVx0+UgkEifu/0r5lPrcJZUOkaATIsmNULV3T5rIiZ1XsPMISjdaNNGXn2eiAN
         OCAvhdH7hrCczzpwFcrpkFmeomXCZR3iKD6XcUpARhLkh4+BHKilGKWDbiI4URINkbk/
         +k576lv7BlkjCJ9FzFpzSAuc+q2UYcZ/qVOfgqPh5yCE8fg4NsuNYhE0clOt2ZURTqEO
         We8lWiiZfckdVLFzqAT/4YHpHYouCZDKNYnYMNVkDiyq+WLpLPZhncaUJyLyF4Y9A5eU
         twrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787848745; x=1788453545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hXdk8G4pm4CrNjX95hM/lx/4VQ+3Uhckavbrp7NZTHs=;
        b=HoBijyYNReMUcAYMAQcfw8ov+Pf/TGmwtQ0WsRMPhBULeUeknnS9/sMjAZ6DuVA2Vc
         m6rPQHLbb2UMHZSum0OFBraJ8ipqe+rK79lpe21OxxTARR5T+4Fx2E0/tX8SgXCg81DK
         gxSFkoTMOQWd3XtSNI+Yyz4V8QlFQbdkaac/eH50mCwznhg9XdydoxgSK/cLj3/kZSXp
         ANYFcqpBiQmy+v9U4lZtPLeyvs2toj6Ibx6fTynhzsII91NoUVaUNvh6O1p7pMezGqb0
         t9BIro0NhwodFigbJo5wNbit97/EkKYyqpziw99evBCJsSXZBQAof9W3iiBQvU+lvkzw
         S1Og==
X-Forwarded-Encrypted: i=1; AHgh+RquRj7rlbnKQbEvQUSyPcpibjDBZPnS5n70J3DQBA4IosFzOKfzNh2J7qVDMvy8jR3V22YBiVh7VkU=@vger.kernel.org
X-Gm-Message-State: AFuF++m5zAdEhVcQHYZKuFa3LgKc0Olbz5/j8sSqMybvfSksC9cMRzTA
	BDeRSq41gVnMb/YLs+yKIPQPyJFZ3h1P/DIKYxDJDK3+3absaMRTPxj97YHlfTpLlGQdOEf/2Gt
	zaykSovBGSybhX9l0QjQ8cPfChlkA3dfn6WzJZuwWa5WKO2mgNeS6GLbuDHBVI+A=
X-Gm-Gg: AR+sD11tegsnMb0nO4UC3I84SsAsoRWyTh6sEAchWaHczEorBgozWadGduiYx3MJiFt
	RKeAmsi75lZyxYMYwM45Ls9XoFpNPvTTdNiB+aTd8Z1lOiv/ojZmIQttFgezLV0DH4WBXRy7pH0
	YXHumXEHcGfc3AaS6yU1JfIUn1/UWeFbreCB5FNsb+cF9LV9ihVU5B11gYeZXDSZfg45wIpplA2
	4Kj56qoEHlDQ+762OlBMwgYSEI4mzqfv2iiGSx3K3ygZVV5cXk86naZ+2Jh8Lw+TVM400SPT+nD
	NhWQxCSShgymjGnRGOi1rmm+0vWXCFEeI9Uev/ZN3TDKDLtXt1yNO6Wq4OcFAqNWK94edUnd29J
	yUjiUlM8Kj7teH8GVepUcqZINVXB5krM50Uj07ktMJHgkiUnzUt+ZjnY1Oq0p/4zIoWF7NhYIOa
	ctyDvTgE6X6iHgyO1Wy41NelE=
X-Received: by 2002:a05:6820:c319:b0:6aa:d97f:453b with SMTP id 006d021491bc7-6b1a04e4f2cmr13126294eaf.28.1787848744955;
        Thu, 27 Aug 2026 09:39:04 -0700 (PDT)
X-Received: by 2002:a05:6820:c319:b0:6aa:d97f:453b with SMTP id 006d021491bc7-6b1a04e4f2cmr13126243eaf.28.1787848744519;
        Thu, 27 Aug 2026 09:39:04 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a24bce78sm4253171eaf.3.2026.08.27.09.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:39:04 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:08:06 +0530
Subject: [PATCH v4 05/15] clk: qcom: clk-rpmh: Add support for Kuno RPMh
 clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v4-5-dd34f235fc1a@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787848688; l=2134;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=HmmI194gyOrC38jn1kOmQP92tC7eCM4pFbLwZh2jkps=;
 b=O3qlxz7x08CxfPx7NLFQOLsmocO6gj9/OPvgz5ckr+LYjwS8kVRwv1nhMSuHzk1SITQ2RAlQZ
 oh0cx0wx1jqDxuqlif9h+RqOAy1CpyG+tAYF0Bac5NKmhO9lTdGgQOA
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfXxsAd1l3sTKqK
 Cs38ncmVvi757V4Qi/2W7BafYcNRMg+Ah8wDPfz7xRhWQlpc7hb4xx5OI+Opao4+17k3ZfT1EI6
 Df04Yg/5qNhKSBATW4Q8ToJ4XsX6bmpH8M8WwMR/9FvjGZygYOHmALasuulWlpDp0cBZy85smTY
 KNoltpgpjoP6DqNL7o5clbM1Xh84xsYSJ/9v/ayWusraefMbCk/soUzG2Y7qckwZCX8Oh1EHlYe
 SaCbvzgahYfh4kZ+MfxCRLlWk8ruaPNA+b2+IkJHMMjYuRycmw2ykG76orQbnyeEAv0NJ8vAGzD
 N32VOZTihekx9yiqD+mVXRa6mL57V1+8zU+L/ZQ5SjiX4RXjgdu514E0DAl92F0Un5huHQuXiKi
 /5LDVn48gn/s9fo3IrEbWiVx/MS2+LIR6uijpsxxzOzT8LFfAGjTJQTSGJrlwwpkdBup3bs0OZ0
 xjDZfkZiHyAWqpDwb5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX2A4hZh44G1Bs
 nL6JIM08sjdjB9sZR/qxhOMInn7yJRsl+Gly/k3CJCzoUW5waTclMEK9pC8uY7RXgC98rVgwqvf
 IP5203rXSE/ZoHhPNUkf7LsugAWwKCM=
X-Proofpoint-ORIG-GUID: M-1I6mqEMMkdWDTpRQO63LAAeiS_AUhZ
X-Proofpoint-GUID: M-1I6mqEMMkdWDTpRQO63LAAeiS_AUhZ
X-Authority-Analysis: v=2.4 cv=e8E2j6p/ c=1 sm=1 tr=0 ts=6a906829 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=cbMe9IPPLhjBV4UIYdkA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270140

Add the RPMh clock description for the Qualcomm Kuno SoC so the
qcom,kuno-rpmh-clk compatible can provide the RPMh-managed clocks to
consumers: the CXO div-2 (and always-on variant), RF clock 1 (and
always-on variant), the QPIC BCM clock and the IPA clock.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index a224a94ae273..ec8700b6186d 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -937,6 +937,20 @@ static const struct clk_rpmh_desc clk_rpmh_kaanapali = {
 	.num_clks = ARRAY_SIZE(kaanapali_rpmh_clocks),
 };
 
+static struct clk_hw *kuno_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
+	[RPMH_QPIC_CLK]		= &clk_rpmh_qpic_clk.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_kuno = {
+	.clks = kuno_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(kuno_rpmh_clocks),
+};
+
 static struct clk_hw *eliza_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div2.hw,
 	[RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_div2_ao.hw,
@@ -1097,6 +1111,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
 	{ .compatible = "qcom,hawi-rpmh-clk", .data = &clk_rpmh_hawi},
 	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
+	{ .compatible = "qcom,kuno-rpmh-clk", .data = &clk_rpmh_kuno},
 	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},
 	{ .compatible = "qcom,nord-rpmh-clk", .data = &clk_rpmh_nord},
 	{ .compatible = "qcom,qcs615-rpmh-clk", .data = &clk_rpmh_qcs615},

-- 
2.43.0

