Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25212D46B1
	for <linux-clk@vger.kernel.org>; Mon, 29 Dec 2025 11:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767008888; cv=none; b=tP1GM7gmZpFERL6nAIQWNyTgGT1uj9Yw0WBT+FqGYxuECCKapd45F8Iqw7af7Y5RLHQk+MQl+o+/NpBEW61z+o0yXAGlHtsEmrPlgVxcYlfDAoU7Vm2lckJVKQCR3SNEEfgd4YL0tMOkzDT2IqOO6BYY8MxqJpioSZ0vAEqNIus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767008888; c=relaxed/simple;
	bh=R2QMndu7kTZOcDhG5pspP1i1KqfuggelcaWTBufOp24=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sjjg7G9Ry4Xq9bKTxYbQQ1tapffatTlVbG/q2vYv1vORF89LExs9NSqjQSjDdb8lfUyswcjB9BVj8POj6fsEbydYPWKMHyFjfTd8YbyytzzUwXxxK4VbbHWcBmZpiAj9fVCSSYn+TrpEAILSI+SDvQsXlYSzsoQ2KtPlLZxn2vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hc2XFkOX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PWgfZHug; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hc2XFkOX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PWgfZHug"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTAWcJa1433791
	for <linux-clk@vger.kernel.org>; Mon, 29 Dec 2025 11:48:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DPRG6iTyFGtdlDsofzUrgUl7lEVsoCW1hko1aRLMHNQ=; b=hc2XFkOXF5S5Sr0Y
	v2r/bZTaouAFXo/d9Q8EMT2u0ycKzDDVeQQZxHwfcJhjtPc23ixZzt8vPAtLAQi9
	Jh5E0yRnuT3/O6HSNlQF8bAX3V/cqZwmtVMUDJF/Cnv76rA503XatFMHyu2J+gky
	jry4VshqWkG10CfxybQKFWRASD9ek0jw9CK0+FhoSluePb4wbiqjmcfd4nmhJrcF
	PudgSWgaIbYI2LIx1d9OQfTP6CGiVUcCSHF+shpecKuWGFs4IzsszU1VP4pg/uNM
	x2m6TX7bfvX/3JQ92LM4L3oCb5FiEjdYO8CUEmOZBe3URX+hn9veQ4Ah5pK+J8zt
	1VYCqQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bavrj2pf0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 29 Dec 2025 11:48:06 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-890072346c2so10520646d6.3
        for <linux-clk@vger.kernel.org>; Mon, 29 Dec 2025 03:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767008885; x=1767613685; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DPRG6iTyFGtdlDsofzUrgUl7lEVsoCW1hko1aRLMHNQ=;
        b=PWgfZHugz5qi3KHydfAchMEzklT64NHHZGF2hDMrdEI90mCT0pwDf9wbD8R2jZdAFE
         IqZPezmlf3yuIkrxeySBeNhvnIs7POiSoHema0cTibAqOQFE0vbvXfw6hN6x1Tv9EW5D
         pQ0lNTK714eVjtoBWcXDFclVFoE+JezWlXApzC1xYXzt1wG2iVuaFizwV+FgCLr/h/nQ
         QAp7HTQ1QquTL/aXxLExLYJv4jJJFU3zfi17NJ6CG7U6E7Yk2e50kLzLykeH1E/7jNPN
         G8W+cJn5XPQh9kjaYbwNkn1Ms+CqMUS1n6m991FUOxeTROpR8x5FYjKxbZkDpqSPc9+G
         azdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767008885; x=1767613685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DPRG6iTyFGtdlDsofzUrgUl7lEVsoCW1hko1aRLMHNQ=;
        b=RnFNKL/4XJ1jI8mE963fMD1jP23JTfRHfTjapUPWOGdC/SGhVY6Nibr58Sf+t2GKdo
         5b4oMIeE2ldJQIvN5nHEtncpnalRb7kdcjSFCzC92yPUsOYw+gaVJcKm8Du8hN2R/5El
         NpV4z/6N8Hvm9zTcHDLwRcYwppU9QGkYmmw1TVyHmSqtASqZ3Qc7Bpkzj9XIfohDxJCx
         yoSseq4+DD7FGf0CJAPvU05o7gw99m2JUKvbTpkMSenPVdtAa1R0xuJSElyx+cunC28o
         AinsJDpDW4x489ogxyhlltXT7vje1eSu/XBL4JjDPIaD/tLGzSep1WOO/v0/SclgZgSw
         fhSg==
X-Forwarded-Encrypted: i=1; AJvYcCVJ2QFdKQZ1sjmqTB8FpoVF9vultPnEe/Qgg/HPA3jglO7eKIlu3oi0ImooPV8+wnK3l5L/egiUaMg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLEzwNTtUjnvTjktLmONp1IcAQGJdSmYXiS7+aPk2NEYafH/o7
	vj/ALBJ81YqF/0vEKOZPWSKMMeeaD7zh0Qb/EBK6A+JdcWMSAYlkVvJDK1O10kCvoP9O4pKS5lY
	PaZmNsHyu1Xrg3ENmyfeftCmEqYzpm220qQgyYKNKM12F3wrSwPovTSF0Oqyl2/ZJ4B7JouQ=
X-Gm-Gg: AY/fxX5Yf1M+2gZ0urhc3vWlXOa0z6IP5jXuKISx8JLeylSU5nFDJLcwVuM02yw3xPZ
	r1gHOMb5sFQuow/sIz+H4of9b7uKrxZUyeQZzWodKIkEb9NYNsXGV54BvJTTVwWd/Uf10HcWUxw
	HYfQTm3RYuiv0/H0/YteUbu9wa6qZXob4XKAd8Jrsb1RWkalKHp+U+1ewHQGbMPMcm0nsT0Kjga
	tSuMkmwGA5BUhrItA0kpqm57bww0yDHNplwympxZNPJmMh+FsoFMwFO49BCtbW7UALUGoJklZ0R
	TOc7DjuxftdBvMVPfbP+BRRg5CIgYDYgZvYx4Xg9D2wMbMkVv7wTq7UWhFe1TJAW19uONM12Yd5
	Lk3Cqv+c/rf0aSpfHwaI28Axj6Z+XrMNWkQ/bzm+Xh+j3DKzpJZ4BLoGsdbALOGXMNQ==
X-Received: by 2002:a05:622a:242:b0:4ed:6862:cdd0 with SMTP id d75a77b69052e-4f4abdfc9c1mr344048241cf.10.1767008885112;
        Mon, 29 Dec 2025 03:48:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjrSkKbc4mw0Z6WAOP5U4DArxVR9tDx9EDtrh5En8yfJHONgT3eVu+kmtLQPBglHGWnGTC5A==
X-Received: by 2002:a05:622a:242:b0:4ed:6862:cdd0 with SMTP id d75a77b69052e-4f4abdfc9c1mr344048101cf.10.1767008884665;
        Mon, 29 Dec 2025 03:48:04 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9159ac90sm31583029a12.29.2025.12.29.03.48.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 03:48:04 -0800 (PST)
Message-ID: <dfb4ab3e-3e4e-4c67-bf7d-90c589871644@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 12:48:02 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: rpmh: Fix double array initializer on
 Kaanapali
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20251224112257.83874-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20251224112257.83874-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251224112257.83874-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yaQ8f0X6yIc-F4FHxs4KgbNIqwDzoG-b
X-Proofpoint-GUID: yaQ8f0X6yIc-F4FHxs4KgbNIqwDzoG-b
X-Authority-Analysis: v=2.4 cv=coiWUl4i c=1 sm=1 tr=0 ts=69526a76 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=snvUICUIuoXJ_myJnVgA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDEwOCBTYWx0ZWRfX5U1LgoKa0cvc
 2WmmGWtnFxUgzIxjwIFb8El7WYSshzWJpxo+ZyVRkX9mavTbHcCq9yxM9qfIW3oRWY7uRUt7dJX
 mArtqNf07Txv8FRlqAoaXaw85eGoALZ/D1sdTs3kF+pbyxX48HlZOpk46wpZd3vYu4pUjW5KDwe
 +mIo42J9qBnfCM1ZBlVCWQK/WaCS8eO/2XnCbEpRQIBeRmRzkHFdMcw5R3HQh7gQmsmUyxyT5ED
 AQjXqU/hA8YJjz84TPm5756WrxmMcLsFeqiGPudsGsOKWicxCR/TLmY2zi5alAb4nvhI63U1ix3
 h8Ezk70qbwN7CU5ZYQhdOAyrekkDcWArqVb4/1rX5NR8lm1cxiFgQADhjiUmJ8DCYCQsc1+Z1hU
 F8rWYZafM1cSPJF/fXTyPq8WUCLR2tZ9FSXa+igUgJFRiwR5vHNQjzIz4L1Bdz3jXfgIisLQvsC
 E7tvf5F4LP32cEFLQPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_03,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290108

On 12/24/25 12:22 PM, Krzysztof Kozlowski wrote:
> [RPMH_RF_CLK4] and [RPMH_RF_CLK5_A] elements in clk_hw array are already
> initialized, as reported by W=1 clang warning:
> 
>   clk-rpmh.c:932:20: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
>   clk-rpmh.c:934:21: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
> 
> Fixes: acabfd13859d ("clk: qcom: rpmh: Add support for Kaanapali rpmh clocks")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
