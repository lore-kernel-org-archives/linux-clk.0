Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4F6484241
	for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 16:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787848729; cv=none; b=W+nfZn6J5+On+L4UeLmCryHAqoRN8aV+859DdlLTlPQabQj6HIpaI5CfdKxr6vzvAnp8UBn3G6SfSkgkZ5udj2j9k9vvyHI5HfCY6c91xGSsEnhNIQFk3RverSH27y8wX0erP1SkPd/a39aH38qH9auTQYmp8HzYBappl09u/CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787848729; c=relaxed/simple;
	bh=k/DT6AgKWqS6ku+QAjOs6ZqZtSg8uMTVP2+zB+uhR9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ncE3NXSZNrWmAts0gQIauDIHdZMz6sbAKX+xrnrPUfUESjSlvIFSuE2ht8mfu2N20FykaqGxLL0d7wLXTavOD59g1AXQUQWQFu1pf51QzJfoD2/XraojLDghonHFV5lGqisl4rvPA2eC1Rn/XZ+uz9n+CSyoE2P5Nn7XcxeyCnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eRQcJWgy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fl1b2cRo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eRQcJWgy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fl1b2cRo"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFbfOj3829408
	for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 16:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pHKTpe8pp9JpvuVxGFlRJsbq12DvNmufk1YkffXJuU0=; b=eRQcJWgyQYtV2xZI
	yHR4BID99i5hoQ8obVhpLKRNZ9dqwYwyFIT+sYdFhKvut/L/mrFeU6BAuAs6w6TG
	ujzo6Al9eBiewii2QWAEu13fAvoQPikO+7B34R4ZuBySNRVbeDbV5Os7/Ok9wzg+
	orzpoizxIJ0XohxllZZdWQ5gUENp5knYfKE8hyi41PsBLUtjdVsPG+U6EIl/vgAw
	11JylrytQlKR9AiuHbYESXdKW4E16yShf/8IRoRLtA4bDFsKT1PZ6kO1Z05qMf66
	yBqRkMCgKVJuNs9xDZMfbv4XbFOgbDuvSOLglCwPScmOsYgK7zwnNF7E3E7m8eC2
	/nKwFA==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4game7s94d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 16:38:47 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e9e741693bso140340a34.0
        for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 09:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787848727; x=1788453527; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pHKTpe8pp9JpvuVxGFlRJsbq12DvNmufk1YkffXJuU0=;
        b=fl1b2cRoSjdn2/6OMKZskEebsTeFLp5kv9l4VIqSyjwXXyb2Yj+lFTOhjnFtWqLMV2
         fipla7fuLItT1ipetShs2DCdVkpI51NB4Wyt6OZJoUjl0xSRdFsYL4dEcp8M83TZfLIe
         aIoKYdpbL+s7u6/kjufxtOvQ5eiY9E/N8wKjVjVdjfUPcEKGJEfBvpf5uOuhM51ze7wF
         AZgGdgBs4u7DC3gE9bufwQQPrbzRiR+Ewe23HZepTxG6EOyT2uxKhxNRJM3wCOyXl8c2
         UZ/DJoNCkPcdmmHUZfdT4WknzuoOlqpZU050CgTfMFI5dGVsj1ZP0BZccfuDzMfEjLNi
         Dczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787848727; x=1788453527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pHKTpe8pp9JpvuVxGFlRJsbq12DvNmufk1YkffXJuU0=;
        b=prL9QTrWENCGZyiSbagiyRYvL2IqxgBPVD5imSgSKiptZ1Cuv0WbnOIfn7mLTih3jB
         OtN6ms4u4scoGnkF5uaIhOECsEstg0zpV0WGQexuq5tHCx5bZcNGlA77cWlynzVKc3Ky
         a39cg+/ZFxEF4EMa1snqnW4KHsAY0hLzPlPMHV7j1YJRqu2fdsIcu6RQG89CVV4RXvrM
         not5z92TnLYQ1G63IipM20u8S161KmqcZHKYqu+Opeb6q9m5NFWytui+mVEEngnXm/5w
         hfdYO9xP/wSMo81cZL4b1J+bF86tUY/kGDVXqqOOVoUlaH1c+SnROgPjrmtEwSgULCUs
         b5dw==
X-Forwarded-Encrypted: i=1; AHgh+Rq16YdkoCi9vR+RAkwT1WbPNOJOqRTAnlMCTH4jjKS1azezlpXUbN/7n3LnNA46o8LQg6tQDeO8wWg=@vger.kernel.org
X-Gm-Message-State: AFuF++kAg1E/FIjh3++hxNTVYxeGGDegZ7HkAZm52yyzKrLzP/S+PhoU
	g1RtSDhBl7WmjE0w8fszlx5dl8HAZGn+APE8sPElpRGTvvGH6ELxSo6eUPYRdxtpOL+PCHvYXr2
	P7m1YIBuQI1tWvjB5VPTRRyYmaoV3f6z9iCfmWWTYG4t/5tdv+Rz9+Bs/3BI6yfU=
X-Gm-Gg: AR+sD11UezK1GN6aZzb7ENWtFY3j18f7GmEAb4GO2YfZzoj1VqevaZXjgX7wqhIBat/
	2FrcimElw1LuWeNQNJ5iaFBqWyYv6IDpAig9bLYTX+9Co2i9/Qw/w+E3zzr1zPe1J4b2o7Aob5v
	lcCMQ0WvJAmw3PEiiCKyr1tHQAKsS2AGcgeBh4XCcFpcjaZROtpl+S6CS5xDUlwzQS9MXuZX7o+
	ha+xX/V+LJjYK4s5w6gInrxynEASBoGKGBqS/rxz9hujkguCyWEKMc+VHPNNPYQQID270OAu292
	mNGEKSgBMZ4gejdSZSWMOLXjOupdHAoDmf3lu+LmE7fGTQdC1A6TMLfrlSpfFEGElmXxa+dI7Mt
	rAE+dx6of8ucPYDqKIWiYoIDVd8sJI9WblNbGlyLgGNMGjKF/UsnJenkWv24IcGLb6bM31yS9fR
	RfXlUzklSZJ0rAGoEaF3AbWPc=
X-Received: by 2002:a05:6820:2917:b0:6b1:afca:5c7a with SMTP id 006d021491bc7-6b1afca5cf0mr9495111eaf.28.1787848726640;
        Thu, 27 Aug 2026 09:38:46 -0700 (PDT)
X-Received: by 2002:a05:6820:2917:b0:6b1:afca:5c7a with SMTP id 006d021491bc7-6b1afca5cf0mr9495017eaf.28.1787848726154;
        Thu, 27 Aug 2026 09:38:46 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a24bce78sm4253171eaf.3.2026.08.27.09.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:38:45 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:08:04 +0530
Subject: [PATCH v4 03/15] pmdomain: qcom: rpmhpd: Add power domains for
 Kuno
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v4-3-dd34f235fc1a@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787848688; l=1801;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=k/DT6AgKWqS6ku+QAjOs6ZqZtSg8uMTVP2+zB+uhR9k=;
 b=WcRc3XN0592xfhq/gEJAYqLJiKdvU41z4BnWHFvcpibh3Ovwl88G3nYrLj5UB4VBR25kKg0K4
 /fCTuWsK1QFDOsWOQSOb4Z8mLT5MmzKqrkUZC8OayHdKlLMwXecetSc
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX779o0rNXXHsX
 TBi82lAxJuOdg3gsCyU5tgjenXyzaBuY4juXJrnHLYARgJiVbTYDCS+VzLZtW8WXICzi8j62op3
 +MABxFmOTl4q21RGSzHi+ovF96CweljZWZe40dRN+fMVZBSAyohw0J9bIHFLZ0FVVpi5y4rhBZH
 uErwR/CyV+9UpIgMmTOtVEe8YeBWlUyP1BDvK0SY391r4wtg6uexuJ+dMEGqSwjlw/1uoIZDZX4
 4JM/RAgltQmXyAIN/bNG/7pLdyzyDljtWBVP+2QqHQ8m6j7KIlc8wkpL3cOScFEzf395yWm98sG
 yUovSmMc9GTm2qoozDfxqT2krvihhqdJakW7ZWpAq2DxWyQ2FOr68DS0wgXQKjPHS82NOoGtQY+
 ppRYVBLSj8alj2Umk1k/pz4IibGD9uJ8RgHFOIa2WzbKf1d36krNARgIAMBRy78H7dfOf3Na7r1
 Mwy5MCjqeR8Rw4EqtFQ==
X-Proofpoint-GUID: lnCVokV8JvxLg5LcSyTy--3YqHD2nuJP
X-Authority-Analysis: v=2.4 cv=Yrc/gYYX c=1 sm=1 tr=0 ts=6a906817 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=1FmER_HI0FvT1hCPThAA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-ORIG-GUID: lnCVokV8JvxLg5LcSyTy--3YqHD2nuJP
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfXzvK55+y2e7xA
 nMPKMpbHRtNkcbTi88pEefe3/teVCe7eO9DYp+NdK/uYLPkaalqBbp/Mhpcm2nukvaJLUFEEIC8
 wG+3AriJ3v9lTPMX1jZCA5ypBBx+Cw8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270140

Add the RPMh power-domain data for the Qualcomm Kuno SoC to enable the
new qcom,kuno-rpmhpd compatible to expose RPMh power domains. Kuno
exposes CX, MX and MXC domains (including always-on variants).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 drivers/pmdomain/qcom/rpmhpd.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index 90743275942d..725ce802f683 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -681,6 +681,21 @@ static const struct rpmhpd_desc kaanapali_desc = {
 	.num_pds = ARRAY_SIZE(kaanapali_rpmhpds),
 };
 
+/* Kuno RPMH power domains */
+static struct rpmhpd *kuno_rpmhpds[] = {
+	[RPMHPD_CX] = &cx,
+	[RPMHPD_CX_AO] = &cx_ao,
+	[RPMHPD_MX] = &mx,
+	[RPMHPD_MX_AO] = &mx_ao,
+	[RPMHPD_MXC] = &mxc,
+	[RPMHPD_MXC_AO] = &mxc_ao,
+};
+
+static const struct rpmhpd_desc kuno_desc = {
+	.rpmhpds = kuno_rpmhpds,
+	.num_pds = ARRAY_SIZE(kuno_rpmhpds),
+};
+
 /* Hawi RPMH powerdomains */
 static struct rpmhpd *hawi_rpmhpds[] = {
 	[RPMHPD_CX] = &cx,
@@ -885,6 +900,7 @@ static const struct of_device_id rpmhpd_match_table[] = {
 	{ .compatible = "qcom,glymur-rpmhpd", .data = &glymur_desc },
 	{ .compatible = "qcom,hawi-rpmhpd", .data = &hawi_desc },
 	{ .compatible = "qcom,kaanapali-rpmhpd", .data = &kaanapali_desc },
+	{ .compatible = "qcom,kuno-rpmhpd", .data = &kuno_desc },
 	{ .compatible = "qcom,milos-rpmhpd", .data = &milos_desc },
 	{ .compatible = "qcom,nord-rpmhpd", .data = &nord_desc },
 	{ .compatible = "qcom,qcs615-rpmhpd", .data = &qcs615_desc },

-- 
2.43.0

