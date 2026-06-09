Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB27240BCD0
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 13:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781010156; cv=none; b=La0BtydIHQyskIkO93gvHETiLOWUzNtPyUjAmDuV8K5ofQ0xEmxua0xVVfTCIEQuL+yIUpugHznUuusmwah9txIFmQ8KtE4f6s4cLDFDzerK9tvHrjDhpbACBO/SKG4R5LsTumV8df30sS7+RNUtbkzKEhR6jHjTYPftyuJX/LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781010156; c=relaxed/simple;
	bh=XN8hc40Aqohm1Oux1FTd9z3AKS0NcB448jgv5NkarhE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rHiR2VtlhR08kbst8Hf5lFfg3SgNxWzykhtnz+uQtpQbuOW6VDV504n2Tte8HD4Jb1w1J3D7OOhrcQQ9FBpluoHokrfnP3A/xzVP2Ag5wKHUQqgylt5qukwIZaOBOha2lwvR4EJ39gG7OAgR9QN9gOlQsjjHLUYyGzRD4S+i44Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=juR/rMp9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YCUe2pPC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="juR/rMp9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YCUe2pPC"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClZxL2183118
	for <linux-clk@vger.kernel.org>; Tue, 9 Jun 2026 13:02:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xbHtB5FkcaadoqFbH3R3CLsT+3mMjSYwuCc/ZzU+pvY=; b=juR/rMp9c8O5SUDq
	lR2VC+Cf03ny9QkPsi1RhTiFv5TqEdSvTLNOanb5ziwG50E8axHc6ZOqw0seTMgq
	zMF45s5nLRpIet9gRi5rlUgnRWe/nUpP91hzOwevI4z8iNyNwN+fnkPEa+C5NpTA
	3uhgNOBNeCdYCDl/9DW38g55oG9Sb/5lXA2SgSDLCWmkp9dt/6BapdL+mIzU3t9v
	Dq/i1MrsoYLRBBTLnNw8LzxAJ3bbKP74hZjlMWoc7EUsavmRndvnRgK073aneVg8
	rLKKI3+Vmubmn59MUGN40EIApeXQ/m01rqSnVDwkEqCZrNsjx4m/+ju2e+CF10vy
	EJAMPw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epenr9bex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 13:02:34 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6cfd1227161so182147137.2
        for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 06:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781010154; x=1781614954; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xbHtB5FkcaadoqFbH3R3CLsT+3mMjSYwuCc/ZzU+pvY=;
        b=YCUe2pPCcUpi5bNc3reBnnPLx6pHqDUHS7QSI28MKp+Ye/5QlzCi38jwq7Gw2rNu8s
         ZH8TXdTkoJFjA0I7NPY6ya+WwbIdptLc9VZSf1bSYymqIftFVFVSu0/G9tAuRbO0Crs7
         wFCaDt8wCUYw1I0rzclCzNbEbkz1OKCGWtMl+bPZ5QmKBmZZR3WQHRnozac4MQbuyTLQ
         4gkaX1/id8Xfw0vlKL1UNbYaC6GyThbg5ESvJb9ROo4RCYAul40GoHGHDVnvDa/vDGsl
         2GDezFul2On7b1xLcLLQn/4iyzfuh2iHo6ImkZBnQJULuPQIlBs5jyBckew+lyQSeDwF
         IyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781010154; x=1781614954;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xbHtB5FkcaadoqFbH3R3CLsT+3mMjSYwuCc/ZzU+pvY=;
        b=Qb/EHsdcfpwoD9YRJegCFghnuoQGEhUHzyPIVEz9RgmB01YV0ids210eWblP+2jFrk
         TP8iDMe4q/o5x8vzgXkVfLAdKqfyF62vdVxmugtRWRzJBvWwrFttCPPa0SiWH4AUmjId
         ti8uN4ZUGIGWuQmo4vioinlI4xM16YVrwDR3UKbbktySbAW0hdEs6uqr5eBporCcHRLV
         4AgljZZ56rNN+onx67ZriW5Y82G1/YP4G3WYiFUYmTQ9MNkx8wWyopGj5LCxTH6hrcZY
         jzWKEzt7lc1IImSmUfiMjmvVdMPe3PQA79kCqR925xhqsJReBQEx7frQto2i/Kuerijx
         WBcg==
X-Forwarded-Encrypted: i=1; AFNElJ9EHRqeAvTDuU0rSe5h5lufYlgjAKsKEnRuKD9KN4QbBwms8EPRwuUbSeelVqsLjW7584IKceOafhM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFYa8fudxRfB2VSoRutABGCOwgzmuaz0JNzMHaIoRJlBBFJRaI
	cu4+vcsN9v0nBvfK9hLhukgEE5OkYcsXMNzyrtcivSvtGpVtfcKD7EpqNbQkgKQtYb/G669iu+s
	MZq0DKGzta3xRNlro8z+ORsYxMydMqIA8fXpxcEmi8XC0Wp3+rcgCfSYQpQZLEVU=
X-Gm-Gg: Acq92OHr2/9YScw/D27k1h73Vaz44YD9oxbseDNC/PtUabS9eXeFpTLODLVxyN4rphZ
	bUM1JNfZ2F+u9hbyIIvc6oPj3e6WsYgNtVoICBM2WRoGfoGx7OmGHcqyjKQ0r97VVtx4cmAMYzv
	OiW8QJ5jvMo/0vJ+sl2ydNEfvOwFAuOb3UmJgewBg00rfsk6WQoAWMf/kCNjNaOYjWcI+GBWc/v
	qMbQNJ0sqMa/yWljSJZGgVL+3h6hjgujEqeh7YWK9xPPWmddOodgY1RYKwR3XA2ZXzUn+HU21nf
	Tpdcfuxrr5ahsE+yb6u8suzwCsbCZ1c+IJHGAZtsiylD1fmt7pB1KfmebAKyZrrx3vcW569WGs3
	pTUo9koWR5sLI/LTbYX9xJSD6+MfMuxNqMM1UmXHQ8qIEuaJtB7T1e2Nb
X-Received: by 2002:a05:6102:26d1:b0:631:3ccc:42df with SMTP id ada2fe7eead31-719255a6e8emr465881137.3.1781010153611;
        Tue, 09 Jun 2026 06:02:33 -0700 (PDT)
X-Received: by 2002:a05:6102:26d1:b0:631:3ccc:42df with SMTP id ada2fe7eead31-719255a6e8emr465752137.3.1781010152819;
        Tue, 09 Jun 2026 06:02:32 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2be29fsm51941651fa.21.2026.06.09.06.02.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 06:02:31 -0700 (PDT)
Message-ID: <747f0319-68e1-4cd7-9dd1-4a675d882f99@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 15:02:27 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] clk: qcom: tcsrcc-glymur: Migrate
 tcsr_pcie_N_clkref_en to clk_ref common helper
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-3-ded83866c9d9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260527-tcsr_qref_0527-v4-3-ded83866c9d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KFIdL6PUwkwDDUA7Jwin6B20G6U4dTR8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEyMyBTYWx0ZWRfX/q0KBqjMt8zM
 nZnUZtEf/mqaiOvfVBAZu88vobov9EXowTbGZmes0vDwi3vT57SSvpEbNOJgP21ZmhlwcKZ/a2m
 Vs8G8HAJBZwBdtfRDvtXGo6Zdy2wen6b9Cmfdq5C5JDf6gkSNNeXM0jQf5t/JjZrN7MB4krM0Qf
 zwp8lf6f7Gs3HocYc7VwT5QeEPCcERYZs8j+NOXhWOwEZkaxxrLRNcK+C0hZZDm/WPD+iaq+x+y
 66LPzmCXK2DzQcszV4IdGZBRvYczYI54vPGcNt8hjwHHdz4sLEpaH3W70Jmvpcn2m2IDL3WAnMV
 TZFhWXXWMFlO+EMklZ4n5EvweUn34/cDztlx37RGJ4ChQdjHiWoC9QhrdKzdDD0+EskEA+3/Ck7
 HxB2fllfe45nMMSk2lpYqOdFRk/LyEvvFMBlhKuJD51JeMCE7jMT5JEJU59vpAdvS7xbAWgvONd
 Ga6bNuwu6mUWtXGMCjg==
X-Authority-Analysis: v=2.4 cv=NKPlPU6g c=1 sm=1 tr=0 ts=6a280eea cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=hcCWvLewiaSd8YhtB04A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: KFIdL6PUwkwDDUA7Jwin6B20G6U4dTR8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090123

On 5/28/26 4:29 AM, Qiang Yu wrote:
> Replace local clk_branch-based clkref definitions with descriptor-based
> registration via qcom_clk_ref_probe().
> 
> This keeps the glymur driver focused on clock metadata and reuses common
> runtime logic for regulator handling, enable/disable sequencing, and OF
> provider wiring.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

You can remove the of.h include. Apart from that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Also, attaching a diff to complete the regulator map. I'm fairly sure
these are correct, but it never hurts to triple-check.

You can add:

Co-developed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

if you squash them together. FYI e.g. the tertiary USB QMPPHY would
only start every 20 boots or so without this, running on pure luck..

Konrad

diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
index e317003398d1..eb4ee8ec9ad7 100644
--- a/drivers/clk/qcom/tcsrcc-glymur.c
+++ b/drivers/clk/qcom/tcsrcc-glymur.c
@@ -21,6 +21,14 @@ static const char * const glymur_tcsr_tx0_rx5_regulators[] = {
        "vdda-qreftx0-1p2",
 };
 
+static const char * const glymur_tcsr_tx1_rpt0_rx0_regulators[] = {
+       "vdda-refgen4-0p9",
+       "vdda-refgen4-1p2",
+       "vdda-qreftx1-0p9",
+       "vdda-qrefrpt0-0p9",
+       "vdda-qrefrx0-0p9",
+};
+
 static const char * const glymur_tcsr_tx1_rpt01_rx1_regulators[] = {
        "vdda-refgen4-0p9",
        "vdda-refgen4-1p2",
@@ -40,6 +48,15 @@ static const char * const glymur_tcsr_tx1_rpt012_rx2_regulators[] = {
        "vdda-qrefrx2-0p9",
 };
 
+static const char * const glymur_tcsr_tx1_rpt34_rx4_regulators[] = {
+       "vdda-refgen2-0p9",
+       "vdda-refgen2-1p2",
+       "vdda-qreftx1-0p9",
+       "vdda-qrefrpt3-0p9",
+       "vdda-qrefrpt4-0p9",
+       "vdda-qrefrx4-0p9",
+};
+
 static const struct regmap_config tcsr_cc_glymur_regmap_config = {
        .reg_bits = 32,
        .reg_stride = 4,
@@ -52,6 +69,8 @@ static const struct qcom_clk_ref_desc tcsr_cc_glymur_clk_descs[] = {
        [TCSR_EDP_CLKREF_EN] = {
                .name = "tcsr_edp_clkref_en",
                .offset = 0x60,
+               .regulator_names = glymur_tcsr_tx1_rpt0_rx0_regulators,
+               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt0_rx0_regulators),
        },
        [TCSR_PCIE_1_CLKREF_EN] = {
                .name = "tcsr_pcie_1_clkref_en",
@@ -80,34 +99,50 @@ static const struct qcom_clk_ref_desc tcsr_cc_glymur_clk_descs[] = {
        [TCSR_USB2_1_CLKREF_EN] = {
                .name = "tcsr_usb2_1_clkref_en",
                .offset = 0x6c,
+               .regulator_names = glymur_tcsr_tx1_rpt34_rx4_regulators,
+               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt34_rx4_regulators),
        },
        [TCSR_USB2_2_CLKREF_EN] = {
                .name = "tcsr_usb2_2_clkref_en",
                .offset = 0x70,
+               .regulator_names = glymur_tcsr_tx1_rpt01_rx1_regulators,
+               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt01_rx1_regulators),
        },
        [TCSR_USB2_3_CLKREF_EN] = {
                .name = "tcsr_usb2_3_clkref_en",
                .offset = 0x74,
+               .regulator_names = glymur_tcsr_tx1_rpt34_rx4_regulators,
+               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt34_rx4_regulators),
        },
        [TCSR_USB2_4_CLKREF_EN] = {
                .name = "tcsr_usb2_4_clkref_en",
                .offset = 0x88,
+               .regulator_names = glymur_tcsr_tx1_rpt34_rx4_regulators,
+               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt34_rx4_regulators),
        },
        [TCSR_USB3_0_CLKREF_EN] = {
                .name = "tcsr_usb3_0_clkref_en",
                .offset = 0x64,
+               .regulator_names = glymur_tcsr_tx1_rpt34_rx4_regulators,
+               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt34_rx4_regulators),
        },
        [TCSR_USB3_1_CLKREF_EN] = {
                .name = "tcsr_usb3_1_clkref_en",
                .offset = 0x68,
+               .regulator_names = glymur_tcsr_tx1_rpt34_rx4_regulators,
+               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt34_rx4_regulators),
        },
        [TCSR_USB4_1_CLKREF_EN] = {
                .name = "tcsr_usb4_1_clkref_en",
                .offset = 0x44,
+               .regulator_names = glymur_tcsr_tx0_rx5_regulators,
+               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx0_rx5_regulators),
        },
        [TCSR_USB4_2_CLKREF_EN] = {
                .name = "tcsr_usb4_2_clkref_en",
                .offset = 0x5c,
+               .regulator_names = glymur_tcsr_tx1_rpt01_rx1_regulators,
+               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt01_rx1_regulators),
        },
 };

