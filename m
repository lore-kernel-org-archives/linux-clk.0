Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431E4265CDD
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 09:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758792630; cv=none; b=KmXYZsvwAKRCGYZwT8z7Yr0HsWwTBWzgxhRkNiyYqFqeVCk5TFPCraqa5e8xsyHbJEMILubGgKE0BMKTalSslDCUmM4P5VG+QCAJihattujvzg23UtHeFw+jglDnhaTewxVMYADem5wcwyH7BQtG8gZZSZ4q4UwspGRvunkfnSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758792630; c=relaxed/simple;
	bh=8N6KmcZ3o0RKZfH/SDgkpHo3kvKOR9AZGJho3gtBrkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fxSGxPNU8vTm7RuSY/4uIaZoi7vVfgJxo3DAw1ViR4ninhMdrTBMHOhcXEkOM3FOU56Jt/VDR7nW49t+qmz25FPw2Uv+qGAQmqoqdZrX5sY0390qp+4nrjo32aBoHK2Mlh6PDFE6R72XpT/1Aqr0R2zQrfaOCp7/gCcgsqP+cnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JbgDKJX0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JbgDKJX0"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9Jn6Z025358
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 09:30:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Iv8LC4BuQ4SAYhRCgkZysNJWxVrScti2b4sGHDBPz6U=; b=JbgDKJX0icycF9G5
	MdA83dtx0SE75ma8JY1SQ4hqHwzXjIS9ub6BM9mpP16w98poJhKFiz44Txh5YwFe
	dq18c8I9NZalxoDFiZ2Mpw5e5YdsK4sqrE6bx/h/UTskQ3vINlOwGgl+EUSjDQv/
	3TU+OKt2nYqhnGFzi5Y+EZjNaG/pp4CCp3obyjHf2KQpDsKNEWTlvPuFren4b9GW
	lCxpl2FX4iT3A8q9zLfS1QIjxcbMt9/Yn7IjncuI78ZyWKlelag0dhzpyd8MOn0u
	+ODT4VSpNfp/LfOtlzTIEPheAUK4pYH+lRItGI6CITlQSgI4DtFLwzZ9mS+Td5za
	B8Vssg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyeywfn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 09:30:28 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70dca587837so1567636d6.3
        for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 02:30:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758792627; x=1759397427;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iv8LC4BuQ4SAYhRCgkZysNJWxVrScti2b4sGHDBPz6U=;
        b=iOWpHnv+tfQp6go4ogjOeA7mu7FKbKaulBetXPzUo73CB8ulmGc95sUrkOlFZZjNN6
         04JEN4a/WNG00EfQ6j+VWHrJ4tPNg4+rO83HoQ2We/eNhlPzcHKaLMfHQSQ3DcSXwGHG
         hEtV2xWUJkRWPEuRAQsuMo/rQPRfgGmDSawPSz/L0FcdUWqr5G7k/U1VKkBBRiN1mvN1
         a2G7rrcotNIEFKQ/gdUPCkBo/f18syuj8l4GmbJUrb33F/4x6EI1EhWZ7gzOPVgKPefT
         TDx/qYqDetjQEQ9kP6nLqC3wY8C6Rofe4A0bbQv+rXzlUsIT3jP/4iJGtC+vPA3L/7ph
         hG4w==
X-Forwarded-Encrypted: i=1; AJvYcCXzr0aVhc8l1cHpXKOtn3uS3sqJPfIQI92+Sd8X15rBZAxPJkeiHz2gghWf29gbZibEO55eSPwBTeA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVjaHdDFoZum/zDzz7a939ziMiR7nXBveZ7Nl/zbCF/5tfY2I2
	eWA8N2C0NsHw1XH7F4dCUECOUAIMu+bCSvUicRu2JWKKZ8pVjmuwFAlBeb3nBSXnASleJpXkxBF
	NwRCgjFh2a54k3R5R90ngS4T2PV8Slcm5k3M8NgsXKuBer7b+kckFfGHOLa6nDgc=
X-Gm-Gg: ASbGncu2fO3JR8soExnJe5e54VH4S7klx2kFXx5vpxF62yfj0lu8A00DCWyMvIRkgNL
	Ac+sYgc1JEdOspu9zLrIukr4jRWHANWEzcv5b/B06vzimIBOQjwDB/S2H2OwX3RABuaD++JPWhH
	GcyKsVBBGKwXQEwrCsMb69AKzwhayKhz5OgkEwa+06ibpJIYR8vh7osKaCu2cXN9Q0TemA3nciP
	ISdPzGjH9pNqhJaYscfo0OfgIiFnRogSKFKQvxvenS7LPwU8Ao2J+xhX0IyddGrkAV9f68H+/94
	n8Nsq5my7xbXgJ61vDUuWVu+NiPx4sDt2iXEBWA7bw+hlHa/RGxZKkAHm1j6h4sjbyGP4S4XP9R
	85ab7W8LbatP633iAa3F3JQ==
X-Received: by 2002:a05:622a:1905:b0:4d9:5ce:3744 with SMTP id d75a77b69052e-4da4b048343mr25294221cf.9.1758792627025;
        Thu, 25 Sep 2025 02:30:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF84Vn/lXM+1k1uOOSGaZwHXSDbKHURPqKNM2+JUtWDEXTRhKuuefGRswtdVWYy9+dsAxkAmQ==
X-Received: by 2002:a05:622a:1905:b0:4d9:5ce:3744 with SMTP id d75a77b69052e-4da4b048343mr25293891cf.9.1758792626509;
        Thu, 25 Sep 2025 02:30:26 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3ae3080sm934726a12.34.2025.09.25.02.30.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 02:30:26 -0700 (PDT)
Message-ID: <239bc397-c746-4ec8-969a-9e3f3c3dee3b@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 11:30:23 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] clk: qcom: clk-alpha-pll: Update the PLL support for
 cal_l
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
References: <20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com>
 <20250924-knp-clk-v1-7-29b02b818782@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250924-knp-clk-v1-7-29b02b818782@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WIclnGM01xYo2z5-hUlvgDdCP9MzQSgM
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d50bb4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=QDpnt0wtCZc4EWvjjt8A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX1LV2pFSVEmzY
 mpPLnmmRI5ioH8RQ/vrgDUVfGx6sQXK178TuzpjMwyR9Dl4sYw0motaMlv/Sk8RG5f7g/kVa7Rs
 Q6RUlV8BpkhLo66XL2FAZxC2BjoecRxwrI+kHpVjVuCiRlqqnzRDQo/MqWLQlj1N+tYK+TCEXaX
 PgXBoer+84yCtPAnYFu+G/SeMQaDidfH1OA9T5X5GMG4ddurSG5a7PaqSFGABOWTwwDk6+WGtV3
 7LNBcTlvZZdZvHQEJVE+wOlNF4PZXC/bP4tp7/QdDQBN+Imr8QKrnzOsOlqFnzddwrzCgm2GJNt
 eCH5MK4lrrwMMamw8Fh1YDO21fnFSXxgQyIzYB7iJRHT/8UIY41fLSLoqT6z+igCk2C5aSrKvGb
 ygJ+GnWZ
X-Proofpoint-ORIG-GUID: WIclnGM01xYo2z5-hUlvgDdCP9MzQSgM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004

On 9/25/25 12:58 AM, Jingyi Wang wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Recent QCOM PLLs require the CAL_L field to be programmed according to
> specific hardware recommendations, rather than using the legacy default
> value of 0x44. Hardcoding this value can lead to suboptimal or incorrect
> behavior on newer platforms.
> 
> To address this, introduce a `cal_l` field in the PLL configuration
> structure, allowing CAL_L to be set explicitly based on platform
> requirements. This improves flexibility and ensures correct PLL
> initialization across different hardware variants.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
