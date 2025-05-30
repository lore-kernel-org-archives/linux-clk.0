Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8C7283C90
	for <linux-clk@vger.kernel.org>; Fri, 30 May 2025 23:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748646272; cv=none; b=CavSiHHXrPghhxUOMjGEeS0LWFfOwEATX7DvedWAiTgkm516eZ/+JHiO6Bn4c/AbomMh0lR4E+TVwujiKzIj9hbFlI7LuJTgQIgaRlBdgQ3UiX6bPtXsdgOSPP8SXefcj8dtvLTQ11oIuxOoq9sy88uQHFureWsfJUgR45m6AHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748646272; c=relaxed/simple;
	bh=byiZoh49SLANJUmSAfCqkOwCaNc9lAE28TTBexKKF/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fdQRefPnFao102cH4WC+lDalx7jfzMN3fIBdcZdm8zzBwtgYztq2BrxINRK5RRCwF+cAL2DYADyxQHA9j28rNpFRL79N5QdqwkuPV9ilK0XhtP9R5GAGDoYeoU8q7YN2q1CWai0EBjJiRZoeJkbkcfbqfqULwZPkBKypnzrCiEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V0BnDPAQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V0BnDPAQ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UMU199006938
	for <linux-clk@vger.kernel.org>; Fri, 30 May 2025 23:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dkCBS/+sevFscPkQYrCdD9qA2ujLMqx9Mjn5PoGA0mk=; b=V0BnDPAQ1cZA5vMx
	wrO+uwAWz8KFlXnstE/uufBrXfFTgi9pMy5ti7STYQH8q8NfAlgSoJywzRQ6RcaA
	6L4TJWa4Uz403dM51XNkHzP/9ei2iIwgXqq+mOW85fAgEex2hgHJ8sNILvHTUBtx
	QMmPQvrIfUhawDrBFMPX2VL8X4HSZYJ6jM24pYyOVnxGGOnTewosFWMUTitVV0hm
	KmSkZ/UPg4Xm8SkaQ6cc3gS7/f80g+dpbgrj3rRQ2grar1cbok/T3eBRMT7e4Nov
	M6dcZIyQItB+TI3kB95iWFi5BpBHlRQOo4mvsDGr9r4aZtKEZ+qjdWdfclyqhQkp
	lNnSrA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fqjuq5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 30 May 2025 23:04:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a43228ba19so7238281cf.2
        for <linux-clk@vger.kernel.org>; Fri, 30 May 2025 16:04:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748646267; x=1749251067;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dkCBS/+sevFscPkQYrCdD9qA2ujLMqx9Mjn5PoGA0mk=;
        b=TQquBlTFVoyMBw+y7bFYY0X9YEmZStKs0ESdjZxodpaHAgvfRxapUZewoBPkK1Bta8
         lkcZcMWhA0eZZtq4xlqekDRURJ8E0SawZ5na8IQReBzfi+uuth+pumkN9LHYF/nMUE3J
         nHlliyDMQRV8p5cnLVcDeWMAedGH6YN9b5WsJGeRHalHeDivmUsKq8xfSUefj5TslZDq
         EbfakCPL2d/cFyofS0401ySVy8hNRo3Gmz6PIk0XqLjP4vJN9tz1L+uaAEcf4kS5jptI
         Qj34I5jg2lsJbMD4SimuyRmtfCQmNrfRuSjLjTosSvW6JUapSyY1DQzs9/TvG5x9RKsz
         vVxw==
X-Forwarded-Encrypted: i=1; AJvYcCWdgJwkGpO0GRwlSwHBPExaEt/Mbushdz2fESX/IhdPrll0wtsVfFHXNv0B/Ri8LNKpoDIvgR8h5So=@vger.kernel.org
X-Gm-Message-State: AOJu0YykFvUzLl6ofH/8bkB0U5I6vwDXZbQc9eNQTRrtihS0nrrcCX3h
	a17KSXQoDW5lbSoDP+pXjdv18VjqbT1xZuWG8jZD4/8kvM7y7/W6nA3uZm970XohnZMVbAtg7xY
	2sh349W/ikXTYPQXJNoXlwsjFP/X6b1Nf1CiKKn1QUszMVvmPSGds9nLH8gXfDDg=
X-Gm-Gg: ASbGnctFM7FDnjLafLIUlhqmoZ0HoYZdb9gPbNdNkkrSx/sEUZ10ATHLQVJH3N2QeZF
	34bnE1xZFuO0uRiMSJ/y8u1lL3ZwDCEDjlw5yXHXqAtKZe5UCUHY16ncJ5Dge9mcGcn7BhkvHUC
	RijQ4NugVRm3FmnfwBOVY73zAEMVV2CXetNo1u3/iwnSUKfhv1+aPajaqZr5wKypwljvQ1ENGQV
	TUR6sIiZcm8dXSBKolxadC6OvFkdGomqmbQ8ggFF32NLP+pRgM/2h2/f2akmzPPRh2IQ7AmTpkD
	18c0Hn+WFMspsrezlGT2W3yrCWb9KkCm+kMwlJfSrRFD0oIU7XBkGeUnWT5+a1lOzw==
X-Received: by 2002:ac8:5786:0:b0:4a4:3cad:6378 with SMTP id d75a77b69052e-4a442fd5b4dmr24294131cf.4.1748646266918;
        Fri, 30 May 2025 16:04:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwEI1tzi2R7YfDu7oYyeYqxX/g+u3B+J1JeZ+9bSeOHb3HGbzLToYdbggmXX+xwNflLNapVg==
X-Received: by 2002:ac8:5786:0:b0:4a4:3cad:6378 with SMTP id d75a77b69052e-4a442fd5b4dmr24293841cf.4.1748646266428;
        Fri, 30 May 2025 16:04:26 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7ff075sm399104366b.37.2025.05.30.16.04.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 16:04:25 -0700 (PDT)
Message-ID: <ee3caba9-deff-462e-8117-f375882aaccf@oss.qualcomm.com>
Date: Sat, 31 May 2025 01:04:23 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] clk: qcom: gcc-ipq5018: fix GE PHY reset
To: george.moussalem@outlook.com, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King
 <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20250528-ipq5018-ge-phy-v2-0-dd063674c71c@outlook.com>
 <20250528-ipq5018-ge-phy-v2-1-dd063674c71c@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250528-ipq5018-ge-phy-v2-1-dd063674c71c@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pJ0pkNfQdgg5xQP6dQ0c1uvwlD8oQ1l6
X-Proofpoint-ORIG-GUID: pJ0pkNfQdgg5xQP6dQ0c1uvwlD8oQ1l6
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=683a397b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=qC_FGOx9AAAA:8 a=UqCG9HQmAAAA:8
 a=EUspDBNiAAAA:8 a=rZqdB0JiAKPJAkIg25gA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDIwNiBTYWx0ZWRfX2z+8yLBirc/j
 yBmFO97VwyDlbzA+zkzTcPYAjhHD2NZw0IZi7l71sy+fVHDqUUw4TNmHavb2K8k1BribgydPXdQ
 WuLzeQ05g+5mLCvMH5IYRkuv2KkkBldTxsWAv0SLRinkFDXqTP8KgJQQdZJy+YNus2bWFMUBzz9
 dIVlITCnzHOLMVBo/EOn2GUXx/FYi4ovS3ikR+Dm4twPblgcSPXiK2aoAenok6CEd2yggYwLoLL
 Vnsz1uwtiLAn/rkl9OAP3l0qeqswetWdPYoaNW18hhNjdZvPT6m0189Dmh1oLIzjGGpSwSmFDEH
 NPHQ93JcHPYxE1BxqYSNoLA1Tb2mlyrEW45NvBQ+4qSlQ1MB/Z4+iIk7IaWsaYQblo46axnwDlK
 vxX9uMlfaLapc+tPM7nEj6saY3sdSuGDapHHBBHUkr8X/ZlJEkSgpjFqpv72sLt4SpMlyLSW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_10,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505300206

On 5/28/25 4:45 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> The MISC reset is supposed to trigger a resets across the MDC, DSP, and
> RX & TX clocks of the IPQ5018 internal GE PHY. So let's set the bitmask
> of the reset definition accordingly in the GCC as per the downstream
> driver.
> 
> Link: https://git.codelinaro.org/clo/qsdk/oss/kernel/linux-ipq-5.4/-/commit/00743c3e82fa87cba4460e7a2ba32f473a9ce932
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  drivers/clk/qcom/gcc-ipq5018.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-ipq5018.c b/drivers/clk/qcom/gcc-ipq5018.c
> index 70f5dcb96700f55da1fb19fc893d22350a7e63bf..02d6f08f389f24eccc961b9a4271288c6b635bbc 100644
> --- a/drivers/clk/qcom/gcc-ipq5018.c
> +++ b/drivers/clk/qcom/gcc-ipq5018.c
> @@ -3660,7 +3660,7 @@ static const struct qcom_reset_map gcc_ipq5018_resets[] = {
>  	[GCC_WCSS_AXI_S_ARES] = { 0x59008, 6 },
>  	[GCC_WCSS_Q6_BCR] = { 0x18004, 0 },
>  	[GCC_WCSSAON_RESET] = { 0x59010, 0},
> -	[GCC_GEPHY_MISC_ARES] = { 0x56004, 0 },
> +	[GCC_GEPHY_MISC_ARES] = { 0x56004, .bitmask = 0xf },

in case you send a v3:

0xf -> GENMASK(3, 0)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
