Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC85218821
	for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 15:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323778; cv=none; b=GGbGV4QByojDFm2Ub4dI3lowSmYHLK02tXlqxwQb+iCYG6VAeT9jtRxH03kstAiTjKr2M+wvuzBJmd2a0Av3C4wGuEKHtjsKR7HlmT4lB5k8P8TONg1I7PMGc91jHVpIHO0Z6GJvLQ6YcTWI94R6GRarePzq0UJhtixzSv6UOGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323778; c=relaxed/simple;
	bh=JVbvGVI7vr7SKk/Dz3SUZ0JXpDRQsX+JcZVvFlgYb5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f81bxRObCMO5Jd8CoWNGb2BYtdN9JnhZ8YRqmalBJsseRPZV5YfiHz32d5nZmQapMhlyrArGmhZ+RF/MMyuf4gmJESXAAMBA8KHFcxeio3AgX0ZoQdYMQNRSKUYbZzMHf04qya2ctD52TdyhIIMHUQ67YkB+4ThWmrQZR+RaOtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P78DGP8h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P78DGP8h"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFWHL014961
	for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 15:42:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XA2Ckgb1A92R72wK/xiF3TiinHUJne130PivAkUoja4=; b=P78DGP8hI4UwuJsM
	9/31wNhbDcv4OGgarg9AGfZR9+i6tbOYdRa3ANCne39ds6UHtjWdnZJVgjfwbC0j
	SPMXPa/iMqhhTGQiZrHYKHAlyfjOq+Bo7kRXu85gOgCSEibkA20rdmGJxaRNARVc
	u0o19mrWhUYdiovADs4v6PxDVIc6vzx8vRqgRAVs/73pft0FjqpnOdTk8DkYVxsT
	Y20dwHxi9urOnzI8hKTBm61SQBxg5j7fIqdfKQlDF98DlZ/rILjHa1i7DOv7D0XD
	ahlblFFtaBI0mr4ilXdNbxpHxLjwLb596XZMCY+/RNY1esLMonq1KcGTmxcHYJHV
	xcfq1A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpeswj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 15:42:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c53d5f85c9so24858985a.1
        for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 08:42:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747323774; x=1747928574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XA2Ckgb1A92R72wK/xiF3TiinHUJne130PivAkUoja4=;
        b=G9VegE5oyuGoEsPZzPPxUtW1jWAIUTs7Ie8vfY3aT+us2gi6HzpLc2ovb8bJ+iaQri
         T1EeJPrF+1BuBMbE5acWp8+Q9km8JL90OZADWVWVg7xuOpsSaZ0USnpY/gSbhdOpSTP6
         PiODtr4xF7UckK3aTyptvJkQ/Cuwk/kqCz5nSk6yTjSdyifGFnq8dbWfdnxqyQN9tRM8
         eRNF1E2qgYkQpTyK3uOS94lsttyGIDvAiwkrptCQ1F/2jbT71Ws1+L+ZM9dmGFFeRaUy
         +th3idJprtQBh7uy9AO9218C6o+DY5Mg3l/oTDssxsVJHX2bTBKnulRV3FYaSe65wnlt
         Owvw==
X-Forwarded-Encrypted: i=1; AJvYcCVu/WX7P9/P3RjHjpQjLxxpGiLNHboD+Aegz2eAbfbdDixAKhyTWD3ULsz1G6WyVmLseLirTo9SOVo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yze9UwE73T8cJv7+aMfSHYFVV/2aftjgfBDRu3cEml6J120jlWY
	9ILDefeX+bsNYcNyqfOYdug9FpepZEvQNJ5+cMF4A6MyB/IsJU6j2rJa9x97KzaozciBF4tXFsk
	GMAUds5kQTMuhem66ktt4svx5Ls8i9tP5CL7R8T4HMxo8RD25/uaAQNchNWQ=
X-Gm-Gg: ASbGncvQqnl05AwhLrbEHwSZMq0+QEuSQ20pkJmqIrg5kWYZJ6Yqzo7CzrDXkEmIJTh
	1F7PJ1K3+Sb9Ad9PjePdjM/PrJieCF5uJjnbz8paYF6+lSeN4rhH5AY54A/goYIyepLf2EnIe8o
	YOLRGoFQOjfkUniNI8eVNK3V7Q6pYhnq5vwPfaSck+FL99ZIOm8bayVoWl9EWosXBhCWhkbyHPz
	Kk935Bd4CnHELw+fP3bM1MEimLF+pv3w6cnDSxLPgwpH6HCpAWfQmrCK7U6RNmkPgGTOIG72mK9
	Az1L2T6dx8jE18Bd8O/twY5lNEoaXBPe4CNU56eiARMAYWItXVpw8w/SLsEdK6kXlw==
X-Received: by 2002:a05:620a:2811:b0:7c0:c024:d5 with SMTP id af79cd13be357-7cd287f8075mr543662885a.8.1747323773898;
        Thu, 15 May 2025 08:42:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGT4fxs45M5zKmI/an/xseNIdZWlRHxwm3i9EJcr/D08ltlthN8UWO9YUVu81PT/6ZHnHRi4Q==
X-Received: by 2002:a05:620a:2811:b0:7c0:c024:d5 with SMTP id af79cd13be357-7cd287f8075mr543658585a.8.1747323773413;
        Thu, 15 May 2025 08:42:53 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d047c30sm7074666b.6.2025.05.15.08.42.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:42:52 -0700 (PDT)
Message-ID: <7f167ba1-5367-49a2-8d00-08fe7a44a022@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:42:50 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/18] arm64: dts: qcom: sm8650: Additionally manage
 MXC power domain in videocc
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-15-571c63297d01@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-15-571c63297d01@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FUtjVyB-AYvDxPrzWvn6XcC_j8kaqKdI
X-Proofpoint-ORIG-GUID: FUtjVyB-AYvDxPrzWvn6XcC_j8kaqKdI
X-Authority-Analysis: v=2.4 cv=cO7gskeN c=1 sm=1 tr=0 ts=68260b7f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=fvWm4ETZ9MensVEMrR8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NiBTYWx0ZWRfX2LKfE1ETQ9bL
 AKIK7mVuY94g/UTZVcJf0YgBMW4IEAz9RLJ+GMSAQMJMAx0QTcyaQAbwem9mepJSh1v0rZJtCLN
 H8bW1d8A1TCzxGMzkChZlWWsLV8DGw7beznonjh/e8G3MwJ2FJYNGT7Jhz7oOplaiHkOPGIRiNG
 6/hLlflPFJwZURwPab3KkNNBjfqXcACfrir8Ezna5kZq4B63qMb8NVK1Q0pQ6G9h+8hYquqieXC
 BtEV1o5MBwsCEpeJd5HwdItCIeP2gC0+hQkKwERvUxuDOz0Fdb12Z6tQBMEFjSuikDy/OMescsX
 1hwp3r98ul+9ebl5iCcng4pu5pvtRZ7CFm4mgdPlH5lRtugDXYgP07AvLxeeF0peCwhyUMzBAG1
 Lvosi6dGuu9UfI45zMT6FG4uTKgEUWvHK3LgQBtPyvhJrptj7d/wqacvifAezrPSgvGNoLH6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=727 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150156

On 5/14/25 9:09 PM, Jagadeesh Kona wrote:
> Videocc requires both MMCX and MXC rails to be powered ON to configure
> the video PLLs on SM8650 platform. Hence add MXC power domain to videocc
> node on SM8650.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
