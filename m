Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17573B4E9F
	for <linux-clk@vger.kernel.org>; Wed,  1 Jul 2026 07:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782889814; cv=none; b=lvMZupqZThteSmYzgOU606ZLoz3OPADUMkT4zQAZ/yiTPiViq0o1tga9pEGoXziL8cu107OvLQYW8Q3bLakkPL5PULBqKFWMPft+Se3CtDDSbAPkzwkAixJOUhAWib2nymmBXggN9lhOgnO06CzrMo3Dz/YJ7QEbf3MrfT3tl8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782889814; c=relaxed/simple;
	bh=eHRfI/jnXRdP6m6Ahka/c6+daaWAlkqndh2vyxydLiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oXlUGYXhwFUFe9+gybuoUw1dvM9PwiZQIhPfBJjRpTtvAp+cdbL4pcJCiEK/KL9UT3U2oS3ao7P20RK360pQkdN1kyaIdnaQWyWJiykjkyBPyq7sJWa367nUqZvdf29zelWXhugjxzyKIIPyHv/dvx/S8cZejnh1BTpQidPrHU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SqprTELz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ukll8x6s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SqprTELz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ukll8x6s"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lZ34058560
	for <linux-clk@vger.kernel.org>; Wed, 1 Jul 2026 07:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NXvDI6k9pNGkQjD+OVVnOpN4tYm4FTTwszfumsQeE7E=; b=SqprTELzAPBXtV1U
	V7TcEle1Sax56U+WGSzNUG1lwnr3BFWFQQndx+2Aut8R7Msbix2ihTWbNICBhJt7
	GIbFHmlj1vKu7CBZMYAZ0O03QKa4damM92AAIxhxbvtH+7eP/pLa1eB3U2zffaiK
	uyKQaZdL8gf8VhvGk1g7idzNoTcXvSr9wuTLIOC+AcV7U8WMw6aq3La2QMl5aWqM
	migZvQl19jzpQB3aJrrw8gp7p/nHAI/FQ/EpuBE7A5n0mjmnyZEmv4d8nBFuRVJX
	V4vPRzYtMn7yAMqCsDnmEW9hIJgDZ4GN+2VfhqUddKHk3Cr5r+Pr6BbLfxfgQLaa
	vMyJHg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4hfyb742-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 01 Jul 2026 07:10:09 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139871a52c2so596036c88.1
        for <linux-clk@vger.kernel.org>; Wed, 01 Jul 2026 00:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782889808; x=1783494608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NXvDI6k9pNGkQjD+OVVnOpN4tYm4FTTwszfumsQeE7E=;
        b=Ukll8x6sCPow6xFYWhooWRlgZZiGoJe/HMbRXDfwM9imA7MQgvDEybaQWgxPvQboVK
         Wxm3CwsTOJgg1PNgI97CCkNGegE/JURm/ozZX7LyiUMrZVhqVfprsTwsQH1ammpjnaN5
         UqW2R2sXZzaTc70aqFUJ1zNAq+BQ0NcOTeIHNPgiFV18jmqTM/WvbNH4Kpgy6FuInvpg
         oxVHZ/6qfakBcZf4PMcY83oArC8zDT3hM//Ego6apCjNwbPgQ+4rV+xExDKUjUbH/SSi
         V6e3hk1tPiNMVDzLYGzmaYKWe4GQL2JakMCLTHHiJs7CobqaGZFWOJj4pCdm18HC0Hob
         KvIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782889808; x=1783494608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NXvDI6k9pNGkQjD+OVVnOpN4tYm4FTTwszfumsQeE7E=;
        b=FsArJ/kTi/hCoMZslTXgJWChyYRgMzwdGLsMTQEsgqu9XrrZMb8YIZ2Z1K6sDA+gh8
         Zae2uaIUdS5FWV8Q2IW5E+buvqbLc1Jr7pel42vB3ulJss5mBrkWqZAGYzDSM5hJrT3C
         pgHSTHeoIYQ/WmRAMUusW0f8rPVNUMdn1VAY0QTCkYgRFRNaiSQ7u1jleUNALd1C1ocr
         zsH+UlLZHZOq+4Eyk+MPIPzn+ihc1VFzVevk2Yre2fo5KoNO2v7r4QoqnjTwLUQbNjIV
         YPfi0IQy7doO2uy8gp0YBVhXvBakhek4Kb/I3PCXwzIJZbqLha36hnH90LPjn9IB0Sh4
         KOjA==
X-Forwarded-Encrypted: i=1; AFNElJ8QFwoW6QlzL4urG1ejrcqXij98f39dXkO46kgs+6ohAsnv8LvR5z/5QLGEHRc2XIrp2SGb7yV5I7A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLk9tbkYu9iwJC+7H2j8v6UjW98nBxYNCILCua2j2ploycAH3k
	XU8yWS+XtyZqs5eeHDxM9HbzjZRLznEi4oRWUx9AcpjxwxTh6/u1UGlOdp5N6tiqzesi7a6A3DP
	+AXTK82JEviVT1iYujEXWmx17ObsJhKEjC0pXoxzGpV8/Nl2k/yHJq3NLEdQmUQc=
X-Gm-Gg: AfdE7clM0X5CY9O03enZMvbcpEj+XLQfQuT2IY7XmWTskZykHes0Cwq7YUMmEt3rUCk
	YPvr13K49xZ/Ld0hMREA1xnkeOGomM7N8/2aQkvAmSH7iYDwqg2p+TbP4XGCNODDrUYkorRw059
	w19zBtwHZHO3Y61LYHEtoOpXw4mNgoDXpd3XIBbFZ6UnWOU2pp4xjLzOVhlc4dTSjgka5lczTXM
	gshJNwo8lQdI6symAt0+8ytSr4Ke1y4XnfwAl//Vx7SYip36TXnOZPeYnV3tIzqny8ygURrKmfy
	G1iMefNAORRohgMaP/aOUQvyc4JvVSGmJmZ7trDEEAw+2dlSmuUgxxd3Eo1FkvWlowiV6nJdA0W
	Mi1YSCeQ89Azi787NKM4kt7tk3NdaROQXKltEfYPpwfdLRx/FBd8Yn7avd0vqBkySP3nmPwKh4a
	12NTExKHIXwvSFSNe3Uq8Tf50y+uOLXsIkz3N4pNCI
X-Received: by 2002:a05:7022:e998:b0:13b:3132:6e99 with SMTP id a92af1059eb24-13b36d7eed8mr533058c88.20.1782889808299;
        Wed, 01 Jul 2026 00:10:08 -0700 (PDT)
X-Received: by 2002:a05:7022:e998:b0:13b:3132:6e99 with SMTP id a92af1059eb24-13b36d7eed8mr533032c88.20.1782889807730;
        Wed, 01 Jul 2026 00:10:07 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2ab2dc1fsm14426709c88.6.2026.07.01.00.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 00:10:07 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 12:39:42 +0530
Subject: [PATCH v2 2/2] clk: qcom: apss-ipq-pll: Add IPQ5210 support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-apss-clk-v2-2-776d054ab8c3@oss.qualcomm.com>
References: <20260701-apss-clk-v2-0-776d054ab8c3@oss.qualcomm.com>
In-Reply-To: <20260701-apss-clk-v2-0-776d054ab8c3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=J5OaKgnS c=1 sm=1 tr=0 ts=6a44bd51 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=94KMMKG3cFIHHFi95eYA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: Srx_fJUdAQ_neF7abTXJ6aGQz-xRaY8O
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA3MiBTYWx0ZWRfX7f/W3tJCyOhe
 ErmLqE9l7TdcVGAdbxlwmLowTdvghC99uY/Lqk34KBMP4G4+dK3xuPO969q93YhKombsxpg9iDF
 6jCqsMqN0qh0sT6mm9JhjnUljEgyI9M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA3MiBTYWx0ZWRfX6Vx0mb5F8Txg
 WpGebtltU+CuguclLKMtOVrjaygWhannpFHO2GEH87WKFnXF5vJnXJt1ELpcuwDe5FUIiTKiWBr
 be2ctqCsN2MUzqHENgfaVSTxu9VXcNiBpI8N2UvBjX2s0TMAcTeP26Xoud7WQSf2acDEWFzwQfX
 x3B0nivZk+rR93eXnJL5gRfevPr94xIMmSAM2gUiVjk6Qw/aZGD1TSqGRSzhPLRzVVET72RZr2x
 ag/ut1qSCiD5CQB+3xj8TID6gEs4cJasdP5Q0Y1WTRJRcAw7TZCFOQX9PwltbYGTzZIQ2vKAPQn
 sl+zQ86fboyEq5+bwjZLgwWSsmPojogflTR/CWQVfBPqKqbkATDz5yF/4usLjwcvhbih4sGIV1D
 86N1v+M0orGVK9fSQTmEQzo08MPOvCxkxzL3ZdXic5MxV8HNJcOG8awT021lXwPiygRCDgHFWd4
 E3irSbIkcF1Se0bfFPg==
X-Proofpoint-GUID: Srx_fJUdAQ_neF7abTXJ6aGQz-xRaY8O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010072

The Application Processor Subsystem on the IPQ5210 platform sources
its clock from the Huayra PLL. Add the configuration data necessary
to set it up.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/clk/qcom/apss-ipq-pll.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/clk/qcom/apss-ipq-pll.c b/drivers/clk/qcom/apss-ipq-pll.c
index 3a8987fe7008..569ac76c75dc 100644
--- a/drivers/clk/qcom/apss-ipq-pll.c
+++ b/drivers/clk/qcom/apss-ipq-pll.c
@@ -79,6 +79,18 @@ static const struct alpha_pll_config ipq5018_pll_config = {
 	.test_ctl_hi_val = 0x00400003,
 };
 
+static const struct alpha_pll_config ipq5210_pll_config = {
+	.l = 0x22,
+	.config_ctl_val = 0x4001075b,
+	.config_ctl_hi_val = 0x6,
+	.early_output_mask = BIT(3),
+	.aux2_output_mask = BIT(2),
+	.aux_output_mask = BIT(1),
+	.main_output_mask = BIT(0),
+	.test_ctl_val = 0x0,
+	.test_ctl_hi_val = 0x400003,
+};
+
 /* 1.080 GHz configuration */
 static const struct alpha_pll_config ipq5332_pll_config = {
 	.l = 0x2d,
@@ -140,6 +152,12 @@ static const struct apss_pll_data ipq5018_pll_data = {
 	.pll_config = &ipq5018_pll_config,
 };
 
+static struct apss_pll_data ipq5210_pll_data = {
+	.pll_type = CLK_ALPHA_PLL_TYPE_HUAYRA,
+	.pll = &ipq_pll_huayra,
+	.pll_config = &ipq5210_pll_config,
+};
+
 static const struct apss_pll_data ipq5332_pll_data = {
 	.pll_type = CLK_ALPHA_PLL_TYPE_STROMER_PLUS,
 	.pll = &ipq_pll_stromer_plus,
@@ -207,6 +225,7 @@ static int apss_ipq_pll_probe(struct platform_device *pdev)
 
 static const struct of_device_id apss_ipq_pll_match_table[] = {
 	{ .compatible = "qcom,ipq5018-a53pll", .data = &ipq5018_pll_data },
+	{ .compatible = "qcom,ipq5210-a53pll", .data = &ipq5210_pll_data },
 	{ .compatible = "qcom,ipq5332-a53pll", .data = &ipq5332_pll_data },
 	{ .compatible = "qcom,ipq6018-a53pll", .data = &ipq6018_pll_data },
 	{ .compatible = "qcom,ipq8074-a53pll", .data = &ipq8074_pll_data },

-- 
2.34.1

