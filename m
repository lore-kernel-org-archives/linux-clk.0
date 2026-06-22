Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94742C11E4
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 11:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782128152; cv=none; b=F1yUw//39Pbsb3IisewJsgi24wjPtfmyftBbRuxPPRgLhZZzD9vksImzHu+mFOdLhCXDvCUQ7xCoap+CVIOKLQgan84+rpzgElmnuhfYw+QGhC7UzRisSAT1EGJOcTQQvlN9mtIRiOGIVDuTO/0g1e0plkGdZ0vwUuA+0iNdx/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782128152; c=relaxed/simple;
	bh=H+bLQ8sY+X/DAsTuwmbLcqsX2rytoWHHNQhtsBoNsOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MwORIQ6j/KyoCJxVvHksyyYNpR41GiDOmAc6E9QiR8UDxypngHqqUPooXheJEFZSUYJSniNMlYAggEJG0fSwsoUDHnGSJJrtdGFkZJwjJDiUhUD+TbHubv0K/HUOS2h8z5XBSxFla+YXZ+n+YgJqnNxSD+WsseRwcyJkqlQT8K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cDyLj9M2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TuCy9z6f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cDyLj9M2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TuCy9z6f"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MAoFto941029
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 11:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nbcXRcBRms5XtWRsr6Jwip+LyAqtjDxP7W2eMPw/Zi4=; b=cDyLj9M2KIRbuwDe
	lgMj4g3vlk0TuSDqWKt0e2xnLWu9Pw8ml6XwPFXLMiPvIRcDHOXX2hDw99pA4ctl
	xtEu+KtkzdvLhGt0PYOWQnl0ZgF3UdvyaWolhyflehNfERcRMWvlwhRC5Rki6YN2
	JINQOY87Onf9ELTUUVn2aWT+Iv3gp7ItbB44SloGcspyNE6yVtbqw32UPfUPxRZS
	/ae2SCCzrWmQNU8fmzZ/7vWPg3xgWtwANiDCCdL/zETIYQS/mYnRLpR8uurYcD3o
	+RUWmF2hHU3MZBKSC8DDussTWy7TnO82bK8F+ROgWB4PnL1Ou/4z8z68v5pAjoOC
	gZe66A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3eb864g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 11:35:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9156dc90fdaso66366785a.0
        for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 04:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782128149; x=1782732949; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nbcXRcBRms5XtWRsr6Jwip+LyAqtjDxP7W2eMPw/Zi4=;
        b=TuCy9z6foH2THM9dng58TFrhWyBTK7RE5xH5OSmrB0m2bGidZdA6DV51tGD+aHo7Sw
         UlH01SsAjxeHRKYVnUhHEXlPeQt+o5swUiNKFl2KVacoCvgfNN8uroaq+ekVsEtN9MPk
         +aFjpOTh1xgm4VCRSAK3JoMe4676t7apuX7QV2Mz2XuqufMazFEJjIARh4Ot/rL8rY4f
         57DePiuSB2bRlb5byy4c0Mn6e0M6+EUz0nniVho1h1EmZi9GhrdZpPhk67aVOtv02zra
         kvBuHXfMC8ph8lxS3zDBNd+RBhRd3un6e5onDom1DRdzfnQhnNnWew6/3D7GNDL6L2Qx
         EPiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782128149; x=1782732949;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nbcXRcBRms5XtWRsr6Jwip+LyAqtjDxP7W2eMPw/Zi4=;
        b=IlXLbA4W/ZlhbOA+4DVl0zNQRs7cwTzxnMjcxp72aLwn5VlPe2C6XXhy3sh+3Ees6Z
         ReYBruLuPeip9Uw0zStyyX9hsCqofmvWXCgL7XlAg5Upc/Z1pq3lMf/IdmSUuwpk1PHK
         qdcTxkN5+uO99yl8nYs5hcTT21enRPbM9Q8tnCp8AJD1X0CTEHsVb7gr3nUD6rGI1xRn
         GihGns0UzEoW0P3z/RobD8wbslDUUtPLw9Azh7qrPALbdXEav1z2OxkkCaBiqVs9/Dsr
         AfgoaB8/VKPchfkVZnyDCcgqth4o6bCB9A0WP0qdSJE1aRfzahcmXlSIy/WTMKAuJgNQ
         CpVw==
X-Forwarded-Encrypted: i=1; AFNElJ/iE5hRFqUXT6u2XNso047TYd3LpZ0G1mv9FgSEoZJ0Gu8ey251C77tk9+trINijq2usTgpxNh6r6c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ7mkQ421+c6Aq5WEVqKMYFNKUdH5ES2LTn16LQ8WRtGgD0+Qw
	ynbF7pGlKyrwrrRomB/4F3pIcMB79VSgBReSbopK27womziER6iRJM5pRC9FBPXurpxadtcNpOU
	+xaE8q7Pr8nYc8JyUj9DUuwzeSfKelP4V1CNEdAXsk3YGemuSCCPPYI4LZh+1U50=
X-Gm-Gg: AfdE7ckDgFXuT4X+oYvnhseG8CGAc9QjEaB8DwNsG1UxEWTH4XnwqokW+OSK1FuUd5i
	0/ERTXHTYKXugZ+SDG7k5riVBp/XUjpkiZnKYpjwB2SbXXEGwRFFmSNDxOz3Uws7qsYj1Fu5Hc8
	jmhdnP6ZdwrJWSe05xZaI/2UOqhAoeundWs2objVrJW+44zsOm1WybBA23qP++AWOh3pRRhvLDj
	zQtuTjau6hp13k6pAIXVuJs9MOVEbJTUWMxyGGNgBm7/1X+K/HaxSH4YrPfQS/YOA5UXIcVdjeC
	2qOln+GG1OiVQJZU8aYWe2QjmdmmKiFkIWMR2mFUntOSyC88zLD6R7gftcmuM5Pzcu53+FslzM/
	qs2M1hgU165rkEQ1P3OZ9texyTAgK3WpkjH0=
X-Received: by 2002:a05:620a:6488:b0:915:8055:3f9f with SMTP id af79cd13be357-9208debced0mr1222851385a.6.1782128149171;
        Mon, 22 Jun 2026 04:35:49 -0700 (PDT)
X-Received: by 2002:a05:620a:6488:b0:915:8055:3f9f with SMTP id af79cd13be357-9208debced0mr1222848485a.6.1782128148721;
        Mon, 22 Jun 2026 04:35:48 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5ef8eb38sm339442366b.28.2026.06.22.04.35.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 04:35:47 -0700 (PDT)
Message-ID: <5f32d4c2-f90d-4f66-96b1-c9c7987ac18e@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 13:35:45 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/8] clk: qcom: tcsrcc-glymur: Add Mahua QREF regulator
 support
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
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-5-c939c22ded0c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260621-tcsr_qref_0622-v6-5-c939c22ded0c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDExNCBTYWx0ZWRfX66cBao2DhneX
 lE8w5NN0PVQcnOaQ6SYvwXYXExBcuBy8TEnjvbpvHKHL3rq+AE4wwt6m2LLTLHjcHGyXYiCCuKY
 cNoBcz8zfprTpcB7159ExBdBTEK6kjU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDExNCBTYWx0ZWRfX9kPwt7RAZy9k
 RFRca0CJo3yP7TuxOGyQ4w3hFg/igWU4Mkn28bKgDAjsvxuQayTCO3GoTmhnJ8T0xqVR+y90Csd
 gp62NYO4/A1p8hrfgVK/RTrwHwy6/MnZDRfClBFU0C+KmNgjyAkGd08+Jqjhz7ObxGMTGmZX6Sj
 QNO12mDT7nekK+mdBggbEo+NQaNVrc0Oc7EG6GRk9IdCA5vBOJthtraxPLgGBNyPP2OAiAGnqeO
 ohHTRmxqOxnn2uPROaMYqUXHQv/9VjEFx6yMv3/Rz3mbjz/Dt701QWTSCpBQbD1v4tdGzhWfqna
 Gwd1ukenYb65vCcJ+DsEUM1rY1zKA0HD85jeOksjKNa3Bx6uTC6pFvbu+zIh4pWIuq5y/wLZyQY
 9B1NwXrLyNtKYMkyR1B1eihng35DHDqXqT0zb+zxlWE/YpCYdA0PQMbkJQgUmoIhZt37vFmBA1x
 Ay5sn/BiN1LO/xv2oxA==
X-Authority-Analysis: v=2.4 cv=ILIyzAvG c=1 sm=1 tr=0 ts=6a391e15 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=oO_X74roj20hkPR3ujMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: musoKlL3PEr6JwYAb7WwX0GwjOkZCnw3
X-Proofpoint-ORIG-GUID: musoKlL3PEr6JwYAb7WwX0GwjOkZCnw3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220114

On 6/22/26 7:11 AM, Qiang Yu wrote:
> Mahua is based on Glymur but uses a different QREF topology, requiring
> distinct regulator lists and clock descriptors for its PCIe clock
> references.
> 
> Add mahua-specific regulator arrays and clk descriptor table, and use
> match_data to select the correct descriptor table per compatible string at
> probe time.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

[...]

> +static const struct qcom_clk_ref_desc tcsr_cc_mahua_clk_descs[] = {
> +	[TCSR_EDP_CLKREF_EN] = {
> +		.name = "tcsr_edp_clkref_en",
> +		.offset = 0x60,

EDP goes through CXO1->TX->RPT0->RX0

> +	},
> +	[TCSR_PCIE_2_CLKREF_EN] = {
> +		.name = "tcsr_pcie_2_clkref_en",
> +		.offset = 0x4c,
> +		.regulator_names = mahua_tcsr_tx1_rpt01_rx1_regulators,
> +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),

this is apparently for PCIE4 (the name you used unfortunately actually
matches the register in TCSR..)

(ok)

> +	},
> +	[TCSR_PCIE_3_CLKREF_EN] = {
> +		.name = "tcsr_pcie_3_clkref_en",
> +		.offset = 0x54,
> +		.regulator_names = mahua_tcsr_tx1_rpt012_rx2_regulators,
> +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt012_rx2_regulators),

This is PCIe3 (actually)

CXO1->TX->RPT0->RPT1->RPT2->RX2 (ok)

> +	},
> +	[TCSR_PCIE_4_CLKREF_EN] = {
> +		.name = "tcsr_pcie_4_clkref_en",
> +		.offset = 0x58,
> +		.regulator_names = mahua_tcsr_tx1_rpt01_rx1_regulators,
> +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),

This is PCIe6

CXO1->TX->RPT0->RPT1->RX1 (ok)

> +	},
> +	[TCSR_USB2_1_CLKREF_EN] = {
> +		.name = "tcsr_usb2_1_clkref_en",
> +		.offset = 0x6c,
> +	},

(usb_hs phy)
CXO1->TX->RPT3->RPT4->RPT5->RX3

> +	[TCSR_USB2_2_CLKREF_EN] = {
> +		.name = "tcsr_usb2_2_clkref_en",
> +		.offset = 0x70,
> +	},

(mp0 hsphy)
CXO1->TX->RPT3->RPT4->RPT5->RX3

> +	[TCSR_USB2_3_CLKREF_EN] = {
> +		.name = "tcsr_usb2_3_clkref_en",
> +		.offset = 0x74,
> +	},

(mp1 hsphy)
CXO1->TX->RPT3->RPT4->RPT5->RX3


> +	[TCSR_USB2_4_CLKREF_EN] = {
> +		.name = "tcsr_usb2_4_clkref_en",
> +		.offset = 0x88,
> +	},

same as eDP

> +	[TCSR_USB3_0_CLKREF_EN] = {
> +		.name = "tcsr_usb3_0_clkref_en",
> +		.offset = 0x64,
> +	},

(mp0 uniphy)
same as TCSR_USB2_3_CLKREF_EN

> +	[TCSR_USB3_1_CLKREF_EN] = {
> +		.name = "tcsr_usb3_1_clkref_en",
> +		.offset = 0x68,
> +	},

(mp1 uniphy)
same as TCSR_USB2_3_CLKREF_EN

> +	[TCSR_USB4_1_CLKREF_EN] = {
> +		.name = "tcsr_usb4_1_clkref_en",
> +		.offset = 0x44,
> +	},

ok
(although there is a comment suggesting this may be NC..)

> +	[TCSR_USB4_2_CLKREF_EN] = {
> +		.name = "tcsr_usb4_2_clkref_en",
> +		.offset = 0x5c,
> +	},

CXO1->TX->RPT0->RPT1->RX1


You're also missing PCIe_1_CLKREF_EN (+0x48) (for PCIe5)
which goes through CXO1_>TX->RPT0->RPT1->RPT2->RX2

[...]

>  static int tcsr_cc_glymur_probe(struct platform_device *pdev)
>  {
> +	const struct tcsrcc_glymur_data *data = device_get_match_data(&pdev->dev);

Please null-check this

Konrad
