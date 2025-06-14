Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830411EF37C
	for <linux-clk@vger.kernel.org>; Sat, 14 Jun 2025 19:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749928149; cv=none; b=nCnxcluX+/y92dH3xwZ7kjie1Gsidd9CaYMULJzAyBM1nn1uRQ7kXjtbZXrX/IkHqLdIZqDIeyYXt/4XKLISxq/Q63bM3xp7PP0C9mOHKMv7TvbT5E4J6GzVS9Yl/a/9/CR3JUZEoHT3mCuxZ4sozoteblK5SYTYfaGPWRPST5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749928149; c=relaxed/simple;
	bh=DhUM7JyGK/Bc8k+PpjvgIjXKz9RYpDG+H2qdDaLKqqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ShUDg74afPu21FbzS1r0lbEfOnaLC7KIaCSqeDpT1hWtTKkTHGG2pzZ5Bmyg/F3ObGTc7jiC1dk/BdfqMABs2hzJ9sJxq+WMAQAOh1/+BGDpJtqk0dWF0XbrrmCScdPTxjXLBHfLEVTf2RNe6jc5z95zqQF6Muem/etxM5y736A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Me6yFP57; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Me6yFP57"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55EInHhT020720
	for <linux-clk@vger.kernel.org>; Sat, 14 Jun 2025 19:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0KpeyNaWZvAaZIB4caY9JHuEJ/mF3mbWm+riygqbdpg=; b=Me6yFP57Ev5MP6T2
	I91d0P5ocy4Iz9Q//Q9uls5ENPFSRggYssj2XOtVVfgjvir76ii+yQICC+d+dpra
	QYHd1mguDana/9CR9LasQ54lu1TEnFGkSvgLeYqyK4t7ubfiGHv1GoyFRmJVMdGZ
	Mbjo8rNxsZv2UkvHo1G+xOt/4eoq17+T8uT8QquiMwcPg3gFMswSi2t+WbNF1gda
	TajBntzealFLw5xcifQZaWaX+zA32lj+IdzwVAtv3zRoHRjE8zp2NPIKNepOWIq9
	j48at3BxPEV7Zl8CqsZsKbkgS4OHX6hHfksNd+maMVxVX3MwS84yUHRvd/0jamxE
	R7jqBg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928m8vaa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 14 Jun 2025 19:09:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a5832bdd8dso6764831cf.1
        for <linux-clk@vger.kernel.org>; Sat, 14 Jun 2025 12:09:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749928146; x=1750532946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0KpeyNaWZvAaZIB4caY9JHuEJ/mF3mbWm+riygqbdpg=;
        b=wLx6D1o2KDGS6xND864pTDkL42WCyMgtMohdD6H6XOzb30s3dBi914gpl8bqAYxErb
         oqawKWDS9pDQuq0ysxoiSarc3fk6DKmRYGMWQ8OnJc6Ea5zpfAW0SmfMJY0IWEbhAt7H
         BZBFaa0j1gMhbr4K4y+JljUcj2SNI+RdoHd3FaA0aTqfcz98d986mAtGCRAdhmkFNEui
         TQgB/V9nvoCS5RlHKEIPeGs+zn+/MD2O4G1NUlkXuwGfyV/ISNaQHN/MnvBNO654plls
         6sO06gjedg8cuSunZPVvMAaksT0breHZrYS0+/rZF6XzMqSVowTy6i5lKVl1OPUGTx+q
         1FjA==
X-Forwarded-Encrypted: i=1; AJvYcCUtOM9lqhjyNvPaGi3oUQNKfI+QwSiPALMRXJ1qdzW4gg342Ujcb7Xf0w6Z9LkP0I9+t0js/Io+0zk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw5dLet6Y5GRY93P76SqSjA3ISib64vRGPnFMpEBOEbvu3jm+K
	WynlCn2+Z4QmzhbWzP/pQVVNUBGTE/nl2MBaPuivBzn+UczRPwoYrdoewSSLv7gOsG7ztceDtD/
	0nMogrycPyOZifTlFaUs29snKUknSmZRMRyNodAtBIdlnN7Vn4i6ChzZhb9RqDDY=
X-Gm-Gg: ASbGncs9ZPow9SkQf027qIGAFKoTf2SBvOBQ1WP5ZClD0YUeBpP2UAc6qvUKUkofuRR
	Ta7QwM2Y8a4VEap7zlBxA3VRzGpDGuYQHhwiUTra5YBFzecWvHVe8X4Z+m5ocwEnzya+UUZ6VwN
	iBM/TNtXAb1/ggEroTxcIcZDmTny/Ofv2drAh9tuQ1WoqHTvLQmatt5KoVfk/KUGrA7+kn3KQSy
	K7YXx+gT/M0PydvHgeLPiUTj655ZMfPEPYvNlC0vp62S4ofK4xnl46cowhWLMjkF9QQvVB6NdkB
	M3iKquPGTWQ6dGO0c9Pfiiik8l3adpMHFRzrLFsTRjm8y+fb6m2UzVeH9gQCEH3Zgf4dE8KXmr8
	IyPs=
X-Received: by 2002:a05:622a:54f:b0:474:e7de:8595 with SMTP id d75a77b69052e-4a73c619412mr21878691cf.14.1749928146252;
        Sat, 14 Jun 2025 12:09:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvOYiWSYZiYBM1VC9TXTvoNoA6MCXtBB8myxMV9hXqAPT2FHURkrMkoJr7i/FgzC08d+aLrQ==
X-Received: by 2002:a05:622a:54f:b0:474:e7de:8595 with SMTP id d75a77b69052e-4a73c619412mr21878571cf.14.1749928145897;
        Sat, 14 Jun 2025 12:09:05 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8982f4esm352351666b.176.2025.06.14.12.09.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jun 2025 12:09:05 -0700 (PDT)
Message-ID: <09c40216-c0a2-4698-83b6-b838c28eed84@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 21:09:02 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 05/10] clk: qcom: dispcc-qcs615: Add QCS615 display
 clock controller driver
To: Taniya Das <quic_tdas@quicinc.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <lumag@kernel.org>
References: <20250612-qcs615-mm-v9-clock-controllers-v9-0-b34dc78d6e1b@quicinc.com>
 <20250612-qcs615-mm-v9-clock-controllers-v9-5-b34dc78d6e1b@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250612-qcs615-mm-v9-clock-controllers-v9-5-b34dc78d6e1b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDE2MCBTYWx0ZWRfX2DLrWGU236Tm
 DddxP32/yvNJH2KYvtZWlRTu+/0TMWNUOu82wyhfjQqZS32wq9EVz228R7/NyGEZ6on1xnWsSXp
 Id3EjyJiIQ00TJWEXq0vN/PPnPKCuDHPyruTFr6qIv4dotvd25EkEndZ4KfNPfOLguteTpbpp+J
 WASzAjJefuRgEJ4tA0Axi3uwUjfCzt1OlQPddW5ru+WBI8+xUH+WvjTPRO4aZUMZ8XxEP8jjQUf
 fx5FDEFMky39T5y2+PgTT4PcFVlb56rzZLc90AnIjxeBxQHrNOAh7HQrJL03ivVZJEhQVDIaIBs
 dh12VoYOQ15HSMo3Z/Qrv+qw1mEw9Hmz4jYtEtDTf7Mol6KdqZc3lnmwRLFxcOKC9x5fvR6emvS
 wiy3LvOQ324AP05L0OEaszbXQGE85kMZQIo8GFMJkE9LeceLTXtPeQ8iEFnZqYwB8u520hWs
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=684dc8d3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=fbCSmPG1eNaTwHpC0zAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: xEHNLv8lm5xOoNw3j6I7a9FcHWMQNrRE
X-Proofpoint-ORIG-GUID: xEHNLv8lm5xOoNw3j6I7a9FcHWMQNrRE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506140160

On 6/12/25 11:55 AM, Taniya Das wrote:
> Add support for the display clock controller for display clients to
> be able to request for the clocks on QCS615 platform.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---

> +static int disp_cc_qcs615_probe(struct platform_device *pdev)
> +{
> +	struct regmap *regmap;
> +
> +	regmap = qcom_cc_map(pdev, &disp_cc_qcs615_desc);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	clk_alpha_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
> +
> +	/* Keep some clocks always enabled */
> +	qcom_branch_set_clk_en(regmap, 0x6054); /* DISP_CC_XO_CLK */
> +
> +	return qcom_cc_really_probe(&pdev->dev, &disp_cc_qcs615_desc, regmap);

Similarly:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
