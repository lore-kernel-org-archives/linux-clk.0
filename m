Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6C81EA7C3
	for <linux-clk@vger.kernel.org>; Mon, 14 Apr 2025 20:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744663509; cv=none; b=G1GK3ujCSih7e02oKTRCuZ6dj33iXnpnlSjjx24d/HatKKVKTpB6lVOBtbne2PEYgQc5cHf+ZNWqevL1YXI1cBN0HkdAmCP/AATL1BKufZ2ei0JyF2RO5kq6oWbCJAzC3Keb7uwIumEBQ+f5AJEAn4Fkbcm9DxLpjK+4T92qudA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744663509; c=relaxed/simple;
	bh=zWsdiw+TnJkpRWJoGIEhDbM9jVc3PLjahi1iBg9BPKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iM+UjD9NrqnGxK9YEz468daLsfeeNvMX2kBUNvNJQ92gjODn/B/lBRlqXQrFeAIOy6V3ShbbxspvNLQnHdYqpMAD1EDSrITaUtjyfUY8yvVZ4pQ7ncafYT6sKfY/OZ/067wkWxNQjcO9tCYmfcoLdlXgadUlsAhWQLFROjytEsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KBxCIJWE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KBxCIJWE"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53EKfko9029014
	for <linux-clk@vger.kernel.org>; Mon, 14 Apr 2025 20:45:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8GpvC2xMf26mIWpkQqHlnNwAhWALEdfs8GLwqb4OfI8=; b=KBxCIJWEzDpTzj4J
	XjyWl8fUJsYhEsbotApe19vWNG1m0Yvs7M1ROZt8nJk3KhDcHY42mF/oxvQ1UPZ9
	YqAZf1nQ3GWl0r26lWtz8/zsBZqO7tSbFiRyV5KHmpdZOXJGzNkGfypP4TA2Hehy
	dND01cfjyEO5NGuwOieSKvNsS1KpqPE/ZuBpZiRTXKquifUmwGsMUheDJ8wyc8g0
	4g9BEWhO4vSGavr7e/V24EUFWGPKyJSGiclYyx1iUY4aIfC0MNUnRjEHm70jFM8L
	EjpHugjS/PPy3aPlKeHuaEW+RLdkCOVYAOvZ+y5KTAMCOwgQ5HFjYQwNJjIKwn2m
	qzQqFw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs15tht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 14 Apr 2025 20:45:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5466ca3e9so60415485a.2
        for <linux-clk@vger.kernel.org>; Mon, 14 Apr 2025 13:45:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744663506; x=1745268306;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8GpvC2xMf26mIWpkQqHlnNwAhWALEdfs8GLwqb4OfI8=;
        b=mt9l2MxPYdGJvI587QbseZW5HmHGpk0nttA6xX5qxRU0Zved+NhdEDX1GS84JuXwyb
         EciEXIiqxwyY5h1d/r+F934ADIU9dQN3sX5Zm+gGy16mjDf6DqPwCakq+xOd+9nv+i3+
         iIzA7/S/Jggm7CeDxYCDcI7GyGOyMsN/5Mzr1l6/xj9GY9F6/2cuR9d2EZOmNmknWUo2
         +Fq3A1Uh20Z4jaOK8KSeWb05kY/zN1qjGRZqupvT3JPkkQJZj0INKahpgGsDbQI/uF+0
         7fxKynZHH8GW3bp5AWEZLjf4LImLlzouTEKHtc/ajo5v+9x1SRXaPoMVN3fVcYr0ZaQH
         GowA==
X-Forwarded-Encrypted: i=1; AJvYcCW1UNJWvsgbva7RKoQL32L5hvLzYIRhqqPJImXS416xauC+KUEinZ5WIMCirRxragWC2n95FEKJgUg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC4QRhMaHRoArjyccDGTDaS3J5jss0F0cMlIbCUJCUincWmTFy
	0m2HPtFZg1TAxwhQR0YAy9QSFi0bocKZQUrdOIacJ9NscKqkAc2TrYfHW46CcgS7RZih7rIWNeN
	qtDnruRJQeZ3q8LgnG8GiOvYQr+mqMqQi9dTLuK6TswrnqDdkKp5xllVEcLo=
X-Gm-Gg: ASbGncuWLqe21vzQDe2BgwVj8dC5C23pwTg5FBQctrVs9CZXErXmn8ATy9UVfEhbcZo
	f1+wMbHo8H55GsjaFQ8jfWqb8uAhbDmz1/LhQoL0XIznYgXRckSO5m87/EV5Cm5mBwtlp/jlVEl
	XAjgr14q1hFeauptYr3WejL47L0Sw9M8GdG/aSt+j+3QxfeBTSZMz0iCbon5ODwWS6cpZo7h4xW
	QFi5fvV57IHELcAF9vwC/Zkf2CCi4JETwXQkhZZneuZWd80pxhB4iPSf8gHqOpqZWFbvGBZqRR/
	cfbfJ5HPobuwkK68rE8bn5/3rV2ElDINvbQecIv9r9J8q5eC+3sbrbeEFVF3u5ta+g==
X-Received: by 2002:a05:620a:c4e:b0:7c0:bb63:5375 with SMTP id af79cd13be357-7c7af0d639amr601363785a.4.1744663505720;
        Mon, 14 Apr 2025 13:45:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLBb2WpVtzoAT+y2FmV5MGo40yUFAbGagDmJALFL0LsA+GecCl49y7VoJexczSZFb7o/nmpw==
X-Received: by 2002:a05:620a:c4e:b0:7c0:bb63:5375 with SMTP id af79cd13be357-7c7af0d639amr601360185a.4.1744663505264;
        Mon, 14 Apr 2025 13:45:05 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ce7fdcsm982525066b.176.2025.04.14.13.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 13:45:04 -0700 (PDT)
Message-ID: <c1672544-eb0f-474d-a975-2a4f6b29d549@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 22:45:01 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] arm64: dts: qcom: Add Xiaomi Redmi 3S
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
        Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, iommu@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org
References: <20250315-msm8937-v4-0-1f132e870a49@mainlining.org>
 <20250315-msm8937-v4-6-1f132e870a49@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250315-msm8937-v4-6-1f132e870a49@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=67fd73d2 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=OuZLqq7tAAAA:8 a=JKK38O5rW3uoAxCGYa0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: EHNFctNbAJV488qUYxwmiiQxcLUT-fSH
X-Proofpoint-ORIG-GUID: EHNFctNbAJV488qUYxwmiiQxcLUT-fSH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=841 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140151

On 3/15/25 3:57 PM, Barnabás Czémán wrote:
> Add initial support for Xiaomi Redmi 3S (land).
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

[...]

> +	headphones_switch: audio-switch {
> +		compatible = "simple-audio-amplifier";
> +		enable-gpios = <&tlmm 129 GPIO_ACTIVE_HIGH>;
> +		sound-name-prefix = "Headphones Switch";
> +		pinctrl-0 = <&headphones_switch_default>;
> +		pinctrl-names = "default";
> +	};

We've had a similar change lately

https://lore.kernel.org/linux-arm-msm/20250327100633.11530-1-srinivas.kandagatla@linaro.org/

I think this could be some sort of a drivers/mux/...

[...]

> +&pm8937_resin {
> +	linux,code = <KEY_VOLUMEDOWN>;
> +	status = "okay";
> +};

Please also unify the style such that there's a newline before status

Looks good otherwise

Konrad

