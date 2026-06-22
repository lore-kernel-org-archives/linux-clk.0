Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EA640D567
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 12:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782130614; cv=none; b=tVcsd+V9ELhSWaRAjsxzrcE4/4c4J8kpW3L8ApEUFjyD5qPk3MaqdGYR1r+kUW6THfbfUtUSqmQEamUvkfgan+6sX1A9B2k9ab5Qu9wAjc4OSTIZ006EydRgsNS/YKpbUtyW7Kdrzt3Isc6yGfYzG166hvERnkYTvH3wpIVsCVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782130614; c=relaxed/simple;
	bh=d1OMFEczesT6aey4ICBnXcgo97VHr6XrDOsG7BRThEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SotJ7vBxiBGLA1rX8ZiZl9h4G7ePj3Cv+OPK9uAytqAa5uOOXoytuNCYEWeImU95ApzrgL+zPFVoQA7xm8ClB6dWXHj46nBO537EjOoCrTcJ09WWluBtCsWK0CvXEgXQv0/UbcOsCK1TIk8AotUEi0D/Z6UA7DWCHrxmSIx0l4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HMmdZBaE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kj+hynIx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HMmdZBaE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kj+hynIx"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MAn7aI452384
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 12:16:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wJOjnFQkq5H5GTU+SJrXEcC99r4XcJ7w+h5QuLxokTk=; b=HMmdZBaEF5AbzHWw
	Gq2l8ImwCXCvsGgHcj3OxVoI2aCMp7xXVYzYlvcTbrK6YtRo4+YA5qxjVF26kI0v
	VtwaSytjsbUvP82OVx1GAtn70FFzLoMUrxVP0ED/aR9Uxzy5RR9YSWveuATA2Lue
	QQFgzzk04VxF4MdnDTKUt1LeKsIs9HUsLazGrKG5wb/SbPmCnLjIy3nWZzh9zx8o
	PNHg9aWJe4FCTG4BM9wLIWfzscma8Qh1UhCWFX5PPHprl7djekgbaZ1jBLdO5l/w
	d2jPEBTx5xrtPXfCM9+woOdvr2kzn7mV5C8JwAhV5csDGD1tmVKPFHth9iZq8CQ9
	C3wGKA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey2yj8e8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 12:16:52 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8dd10a7e0ecso16617176d6.0
        for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 05:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782130611; x=1782735411; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wJOjnFQkq5H5GTU+SJrXEcC99r4XcJ7w+h5QuLxokTk=;
        b=kj+hynIxJVK2O013DeHeT2aoCZK9ZgYHg3ag0/L5yGfF+dqDskPCzlmRGujfQEHPOj
         /Xz656xGjZYtAcXtIQxc0CNVXbEPeRLy9CsIllSFgeBDiojhlRoORCF5tPcbCahvrV1W
         831DSm/nUi3BMXWNv4/e1sJKNl0JOdfiGPuk5szluc5I6vJtSYi8FecPiJvDZAPEm9za
         pMCadF/kqxfgAjZB5FIv5dPcHFXvrlXIpHpB7Tm5UO73jnFAr8foeX+qUH0NxYIHT2Gz
         uegS275e0tzgHlI0qQDaurIxUjwTuQtz2oUv/tXM0eXkXD6aQEC0C86lP4Lyeaj1V/ck
         Fj+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782130611; x=1782735411;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wJOjnFQkq5H5GTU+SJrXEcC99r4XcJ7w+h5QuLxokTk=;
        b=mfCg2XGnr6czKPKLmxrstVktUMsylZBXgpPgDMYt33NchgXeGpXmuMz9PxhL5sHB4b
         ftYJeUf2KzZeEksIp3+7Fr0up8uMfYEs54dipqgLlyKo2eEkDHfButi+6Fnri14pwvc/
         ftYbziXULkMcBCoaNx5eEHDFCmuZlbHuL0nN3mCg/vgjOw8UY1r5+N4A3Wnwxlmecknd
         dImFatcQcvB3sayr92v4vl6fB/09V1azTdqC2d9XahQ9syfDyuyDmU6LkyknaximI9jq
         l/cGUteIgIezrEksX0fW/jgk4Ro8kvYJPSSA8PonLg20hDsGfy4fvCrTmkQj+cLLp0Jv
         LX2w==
X-Forwarded-Encrypted: i=1; AFNElJ+6kIpNDxMoNgE06XYHX2XEHja+WddJFsLxW+TIp1g7NHevYYKwfL9WnZj8Tx3fCsHYlMuAnJklcaY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpTiLERyHGKQIsvNdK+ig0xdXN3ggbQ5QZ6BkACweK6pr01Cbg
	VOAaqse6OUCbO3df7+Bq5Dw78mH8VnDYUcHSVRmVvp3MTpadZ2/oPZynfKW4fj+Fs6Q+CvlyvAP
	puNd/u0+cbyjcClHvO0/xHhQdGxYG04+vQp2E+3mFNTyXw1oSyhS2N/DL4ldatuU=
X-Gm-Gg: AfdE7clkFWaV/jsZBEWHFdGhzQVyZT5WUzEyQvMkdjnQu7jkEpjT+IIZ1JWgJhQQQAQ
	DdqjxyiWi5iMjP2UZfBprZxoID8Y0Egi+kXPz2EuxRhw5kPJz9IFSWUfVkT83UBfwoTL0Mstz7Z
	tkqk8QM9LYxQIlC/18UWGDkk0DTPPv7CkJB9ir5GjucPCaqhaxBOd9keWsxRVPDl2XyCLYPo0Ym
	LlReT22Q0JN0Hwb1y4FgTufktzw6l7seHz9Dxc9lF4MWDkc626/Bl9Kxlf+WTd3Dcaha6o/D9x+
	tTk4EijvNDL4xbriGRxqGCVCiUICzzLFXB4T3NAk8bTZY7mjROOn1rbnrNWNLF2a1BaozrsFU6O
	14kF86abwbl2SjJtcpI1k12x6Na8XsK8VnwU=
X-Received: by 2002:a05:620a:44d2:b0:8d7:ed38:8189 with SMTP id af79cd13be357-925c393485amr18389785a.0.1782130611027;
        Mon, 22 Jun 2026 05:16:51 -0700 (PDT)
X-Received: by 2002:a05:620a:44d2:b0:8d7:ed38:8189 with SMTP id af79cd13be357-925c393485amr18385885a.0.1782130610418;
        Mon, 22 Jun 2026 05:16:50 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad5c268375sm1647281e87.16.2026.06.22.05.16.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 05:16:49 -0700 (PDT)
Message-ID: <314bab03-5f19-4954-9ad6-fe14d429ff5a@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 14:16:45 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/8] arm64: dts: qcom: glymur: Add QREF regulator
 supplies to TCSR
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
 <20260621-tcsr_qref_0622-v6-6-c939c22ded0c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260621-tcsr_qref_0622-v6-6-c939c22ded0c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3B1IaJNWUj6BnnprtJYtjdNsSfdMesrk
X-Proofpoint-GUID: 3B1IaJNWUj6BnnprtJYtjdNsSfdMesrk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEyMSBTYWx0ZWRfX1fpozVQPtzfN
 6c2ncEtpifE7pGbtQtOs7RKc+GXNfkLqEXzgXnsbfRzBcANmk02o6dqde/OZ3CC0iIXV7odH6ys
 /YZjNnY5iK/DSik+RAx69g453izDoU4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEyMSBTYWx0ZWRfX3VC0ZJJFJ6vZ
 3ZDPFPyDkmBmli1GqNWBog//2pLV08H2nqgjuugXsoHTn8Lf2+Cy1EpTakAUVhqjatt6ZaGXK8M
 kNlCaS0fFsYCXHh/2KUcsyspjc0Kv21XVjdVkDqndXn8pGukRwSRMm62DwW1Y6EcQYV9gitNH3I
 adj0J+rUOxXzPJbFDjqcLSUm+3bTltBKOCn+hUsM3Q66L1dMJsM7sGVI95ZCWRCvQqu3clcod9B
 M4hGisUnK8fP+zYmF3wlxIIb18G3hsAX9Ux8n2nLeRlUY7IU77XjUvR8N4XmWC5WYuSjfkU/Ytv
 NF8CC2ihjIzCVm7qGMRmHbBcXU0HYDI7nefWdtbc25LIdbIGvr2v3Plda0N09yh9s9UuhuTOjK1
 5JYT8LKV5a0+W2XS4Npm/8jEsV8LT1cfJQeiNJ0OP9WN85O97jmwCh91Jq1LbuHJMmuMY2NqPwT
 5bj3pKxJZPb6UJ/qsCg==
X-Authority-Analysis: v=2.4 cv=YLSvDxGx c=1 sm=1 tr=0 ts=6a3927b4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=5oxNwPwbBGZRK8DKsckA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220121

On 6/22/26 7:11 AM, Qiang Yu wrote:
> The TCSR clkref_en clocks gate the QREF block which provides reference
> clocks to the PCIe PHYs. Wire up the LDO supplies required by the QREF
> and refgen blocks on the CRD board.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> index c98dfb3941fa..92b929ee3448 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> @@ -278,6 +278,26 @@ &smb2370_k_e2_eusb2_repeater {
>  	vdd3-supply = <&vreg_l7b_e0_2p79>;
>  };
>  
> +&tcsr {
> +	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
> +	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
> +	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
> +	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0_0p72>;

l2c_e0

> +	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;

l2c_e0

> +	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
> +	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
> +	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
> +	vdda-qrefrx4-0p9-supply = <&vreg_l2h_e0_0p72>;

l2c_e0

> +	vdda-qrefrx5-0p9-supply = <&vreg_l3f_e0_0p72>;
> +	vdda-qreftx0-0p9-supply = <&vreg_l3f_e0_0p72>;
> +	vdda-qreftx0-1p2-supply = <&vreg_l4h_e0_1p2>;

l4c_e0

> +	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
> +	vdda-refgen3-0p9-supply = <&vreg_l2f_e0_0p82>;
> +	vdda-refgen3-1p2-supply = <&vreg_l4h_e0_1p2>;

l4c_e0

Konrad
