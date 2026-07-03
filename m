Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E80A35BDDB
	for <linux-clk@vger.kernel.org>; Fri,  3 Jul 2026 05:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783055062; cv=none; b=qn635xdZdvJv+guKLtPtl757aZRCP8YiUDsEF8qwf08jb3vzwa+x+sXsRA/fyDWOQmERs9snfneBw4/Dacl8Bi01PoeOqGX8iE0zNcLtxvzmD+Vogqc7GJ/nnW33oTykGYmvI5wT1p6tEKO7ws3gVV7wDiYvMKQmhFMu+P85t3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783055062; c=relaxed/simple;
	bh=Jbc5uj854sndNrqzn6Bi+XLo5qBoc8WY2oE4nLn0mT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RiXL4WJt30XUAPf568//tHzI8zwJBZJJU9GyyzZQQVpQgS5yEG3XmTLEC1UM+4xu0S1oTD86dC8UErZFplH/jZH3KEZ1bVvuzahTpdaG90EhP+8y/ECquu1HxkpQvpz4WO3CZInq7KAwuuyPbQhQbL6J5RwUbayq0MlB8WJM33M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MADlUf4F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=guCDs/9e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MADlUf4F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="guCDs/9e"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66342fW82777620
	for <linux-clk@vger.kernel.org>; Fri, 3 Jul 2026 05:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6xcwjRKiYI998QkOOLYdQDedV/7nqediu6mn7AwWDYY=; b=MADlUf4F/3mNR9Og
	BLa6LyXPg5UK+Cp++72Ro7VPdeSJJmwmUezHRLdDxeyE7FZMstbk6yHjcs/OUC3+
	8y1FL/wV+0+A9FVXQmk39sed8MLKkX44vz6jJ7B1n4kzml64WmZ2hYECBxyz5t89
	FarKMPgFxueww3fA6Wt5m/Hc+XnYaAK3kdLERvWgRDV+LmVw3no4Kxy/naf2kL2O
	mrQR1ZCpJcshZi1pELBFOoV4Hv7HJj5o7JNp2Ca0ekh9JMW0xOmZbmuH12X6XP3+
	wEOpqEFs8HsnCOBWBCBH6sn+nRjoNAods7dgNEwfQcsXMm70gwlbfHxOBHZPTPXo
	3ovHmw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5s2536sd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 05:04:05 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88e0d11a3fso170352a12.0
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 22:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783055045; x=1783659845; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xcwjRKiYI998QkOOLYdQDedV/7nqediu6mn7AwWDYY=;
        b=guCDs/9etssFs/psewTaOjQ3r9RpGFkSWxJwYTlrhNmKaHdacMjGtpAqAJkA1L19TQ
         WEPyq5bJV5k6iC2XgqPoQsP7GlzNyF+Aj2sn2oXH7+zy6pVGGAukEGefkktUKpOs6CZx
         7R9PdTJnrWEvqtFg88UBXernkKdsoSmURZymaUxhTLXn1fsn07epLpXtd0POaajkQIio
         fACDEXAs0q3nFrYPVLf+B1camZKL2dxgoORvYPuefLBbHLYxP5nmFr1y+zUqcJhDSUNO
         OeYq78Ixi5WYp8sqq+a1rVn5lxJS+hgyK50dNsyo/7427+S+uIzaV0s7aYWuZ8CsA1vi
         QLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783055045; x=1783659845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6xcwjRKiYI998QkOOLYdQDedV/7nqediu6mn7AwWDYY=;
        b=pGSe8t0SWpFCayWauINFHTn74IBd3VH1QVxdcPgXzZGIhUFBKzE6G2quxiLO3AN/cW
         DqxyYD5Nonfpcp6lPK24NCM+VHeS/rkThVAe8q+GhUTL8sK1Eb2zGw5iWnqVsDcq9Dr4
         lhFMedfGSQ+rx+d1cZzHWcKkYyx/YuG4kc1t9lhpuBGv77Hw+hcAWV0mv0Sy+5TRscg1
         jafkZB92kqiAZOgxS7AYSrJLJJ8fAf8z8FPaVGZCPvAbwDqY8rFM3ZTjmuj4SAVE5hXa
         vsPnVwemaF3LrS3b1TpW7fcG0nrYoU3FyXimwKLs/LB+9t5PGLKTGuBY6nquxdlrhVkb
         aYdQ==
X-Forwarded-Encrypted: i=1; AFNElJ+0xAM933P6qU3hgLau92Ak2A1HSaVWKTFNrQNxqseEmVaRzAjZKF6RiE5jANl4iPPQNY/dz6ztxIs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrmRKGyRI6ywGcce6RwibdHi/FeA0WdoJLJT97y5Dr+8PwiQN5
	Iv0JMYv2CTHmxC9JNPnK9KE/NEVUkIXrij+ns8E6T1DTKHzL5xo2rWdh+jQIN44ngyWsO0ww3BJ
	PR9p7ta+3ebltnM4EYC21/QwLJNR2jBg8Mw6qXxGk3o3y8tNo1KalPuMVLi8DPVc=
X-Gm-Gg: AfdE7cnzqL6/2AsYI+d8bCvkt+6udl98KfMcNasMRNDHkGFVWvfTF/Mt9gCYWJRRJBa
	+ITxzAeOS20W8kx0/CslHrUSki3HaMO4y8Dg2riCNcoEc+kdSs9vegyq7k1mQCEMQWDdkT8SsSQ
	5NDaIoXHb9ROwUjLPPzzQoilIH6FwZbCAr9liPa1mG/eBoMMARFCkm0bYzi3RBLOV3ilFWfJwzm
	xmKk6QmZS5Vs4Wr1GTe8BLKlpxdM1IbudWkdypNE+UxnvpIQg5Kn+EVRMipnfnNER4EKBAasKFX
	I3xN/5T4bvQ5YAvVGxKK87neCyPjAm4pUgLk5mjRkq83EETIWYoU87YxkVSpm8gaFZDNlUxe71o
	Lv0lfRdWWaARDfHI6hrTFcITp9v0Qtodahxndrb+r5nJ+QrKetmHPFD02TovXYauVp6MhA9Qz6b
	tjBt0vlWMXoDpQK2LN7heI8tNMAUIbOYv/KQpBcj/9
X-Received: by 2002:a05:6a20:918e:b0:3bf:6c08:2b2b with SMTP id adf61e73a8af0-3bff42d5dd3mr9848894637.51.1783055044699;
        Thu, 02 Jul 2026 22:04:04 -0700 (PDT)
X-Received: by 2002:a05:6a20:918e:b0:3bf:6c08:2b2b with SMTP id adf61e73a8af0-3bff42d5dd3mr9848855637.51.1783055044181;
        Thu, 02 Jul 2026 22:04:04 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9873sm16109674eec.4.2026.07.02.22.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:04:03 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 10:33:48 +0530
Subject: [PATCH v3 2/2] clk: qcom: apss-ipq-pll: Add IPQ5210 support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-apss-clk-v3-2-4785e89a9c58@oss.qualcomm.com>
References: <20260703-apss-clk-v3-0-4785e89a9c58@oss.qualcomm.com>
In-Reply-To: <20260703-apss-clk-v3-0-4785e89a9c58@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=U7uiy+ru c=1 sm=1 tr=0 ts=6a4742c5 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=94KMMKG3cFIHHFi95eYA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: xoNAim_4DiT6MZqNouo4wbZUcQ0P67Tr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfX2b83tJvGzJ0X
 ILVv+rEy4IiyH0vzozvVFPhIS/hPs4KJnjgf/foaJrRUgJeZKi/amJl1K59zsMnQ31sB0DdLdD9
 KGxWNPErexFRdwP5E9sqKoBFI6oxX3ACV9LMTpo/5WQWc77a3Ur9IMzTESfJuqSjzwmNF9pEAz0
 h7sioi48Vla4Q1dBPF37dE4tA+rpAzxEeZqtr6/cUMwF3avt77QsNTxZ1z6KkRrhBiFaZdvGgAB
 WMY8JyvvdOXyHwk2LKcDPze2QQZ1nqE4rmwMr0qcrIkqk3TIv4DaaB97VGP0s59lM+R5QlwiQgy
 DByiQSiNjk7FgheoSHRtbOh0hskdlISW4dJ80/kRxNQqy9itCQE/ciqCHN7TdgfesH0NiEPdFRL
 87M5hJHfZIu/onBAEsuISM7Gc/9SLqrd7Du4E5umcqk5NIfkJsBMnrBSAFkb9Qbkk0cLXtyh2fk
 saWQ4dMs9cZnVVnOdUQ==
X-Proofpoint-GUID: xoNAim_4DiT6MZqNouo4wbZUcQ0P67Tr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfX8ozbeXfqUClD
 rp4AnWtlWpbhD12ThRYTIuzShpMJuaqD1LQjk1J9nSvuWSRGEFuwP0DrBQxaE53UbrNDhMsrbt5
 5GtugABOkix3DvrYahIkOsb+H/KHUi4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030045

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
index 3a8987fe7008..5653bb5e93f7 100644
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
 
+static const struct apss_pll_data ipq5210_pll_data = {
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

