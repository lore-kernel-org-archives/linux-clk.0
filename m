Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34862D0C98
	for <linux-clk@vger.kernel.org>; Fri,  4 Jul 2025 11:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751629874; cv=none; b=TyAZjTiFB/bhSa3Y+1yao8Ol9/AeDceY5pV5KTCPdaYS5O5b9qeJOypXoALMjQspm/UPSvJpoY5stAlmMnIp/MczDNULWrcrmo00l4zmf3h7DChmxiAj4niaWr1uDogXMta1ah47to2w9aZfc9juOeiRF96QDW0ynB6Fj84Ukws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751629874; c=relaxed/simple;
	bh=5fikI+87o75mbLixisWkcdUIi9r+QELtxuF3rHOb/ag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fYT662EkqXDNOEowhrMjekLe4DgBd97emOBTVVfk4/wH1cxD4Zf7P+emK3cxepZcgXTJALzq6IYek8EwZMv6b5l9790ebsbW3Z5q1p4hhVYdY0cota5Bpl2ZX+x5GXU3TN2GtJQRVTeFBO7s3VSXGiOHxGETgMEqPt/hVTF0Gws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CX5GUFg9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CX5GUFg9"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56486eb5028624
	for <linux-clk@vger.kernel.org>; Fri, 4 Jul 2025 11:51:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N2vo/P6bZVJ6DuTuBUMGx/1yOw2ZUrq+gW27lFrqtTA=; b=CX5GUFg9ojZ7zVI/
	u8kyfZ3pDEbufbdqhhRaPwZy1UQ17VmPigWj3Dhvh2t7FHOD1NcY7bdxxQPzFE5k
	NuIK77LHyIxafexQlk9CqpVuoMGGByD+Vh7/uFS9XL6JLEHS4pVrQaYL4T4awV2S
	W/Ml3Eolu8Bo2oaJY2Udl9ShJLZ3jRsEeHJG3DsWxtcPu2N8l2K6Tab+snZsV8Ra
	Nx1dZBjyC78bqQdufztShPP3n+0MJiX2l1/hVJDX2L5RTWwDdOusQyhzLm+srWIF
	AmrbKHkV9Z8BYakmfO67QYGg7IhWHnewE/R4CMEQ9w1Eam8mhh2P85G52EOHLfJW
	EnVn9w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bw4066-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 04 Jul 2025 11:51:11 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6facde431b2so2093046d6.1
        for <linux-clk@vger.kernel.org>; Fri, 04 Jul 2025 04:51:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751629870; x=1752234670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N2vo/P6bZVJ6DuTuBUMGx/1yOw2ZUrq+gW27lFrqtTA=;
        b=JP4zIZogEtp4qsr3hIF3quwd9bjWkf6i5zRPGyIkEy3wRZA8uil3too01DXfGMO1KG
         s1WlczhBp6Xr81IuG2pkUBUtcPRBnDwrc8DxJ5Msep7lDASXbV8iuKb8pl2BeVhH5gpZ
         vDqIFAwFY0OB3A8hslZVXYxekE2kLdAd7N4qAeXaa2c6GuwK3XGBTdqg6wUGCWcJnI8X
         UagHmrhey/XVRXTYxPS7q0EaR3kJhMkWe4KeUGAgkvOO1MaWti+LLygh1IyNcV2KG7jl
         y3V5OaBHC1D9WilDdyXxx4wqstif4PCqAnlsC9oV/KDTH5+N+PiOGaA/uTy0UE/COhX3
         VBfg==
X-Forwarded-Encrypted: i=1; AJvYcCU/2C+iNuJ+xAgylyYnEHF+SNxNVADwQU/qeP3TAuhM3Sa3Ll6QtNm2pOR6LYv1zPf0tOCBCQ9e4Z8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCE28Z9bwU9usQg2chKMI2K/nos80hVVagDYke4SWhtR1o7fdw
	n+Kd2R6fS3eseJsIerlOynxLdT7gu+/fz/X4CMDK5+Ha6cuoA8sngT8VYQx/47c5YIDvncVZSUI
	vHA6KVLG/P15q7GoUlHGdGPTa7eKtlwupFN1U0fBBcWa8ArK1JpVThfN/EaP6WpY=
X-Gm-Gg: ASbGncvXSNXf2ArbQuBpx5L5Ajl9ot8QhuWrH/hbbsHNHZZSfzLJqrFWRAjeMxY3iXe
	SdcXy+TJ5GYxQBgi/BUenE24fVXA+TbGA8CyBvFWXTpDiegTJKkqEhaB0UQ7Ts0oRmi7Iopm8wo
	8ONo2Fn3P0ITk4SCQIoZ3ua7qgFA0DmPngMi6pFVO5K4wz8qQTr1QNezLyb1shCppcP3i6NSB8S
	TgVXwWi32DCgtL0drf7P9fvjoQsg8rWlQ+n/u/PyaM/vyB/wLNVTJyg+UBZCYu70v/VkqBzn6aG
	BhLl0XUC0GEwqEoeysutvNculnw5sojqc6rcmkzsZvjOiuvq72VUHoAfaObSaYGV2JaL+1RlCtU
	QxIPASA==
X-Received: by 2002:a05:622a:11c3:b0:4a9:8e6a:92c3 with SMTP id d75a77b69052e-4a9978746c2mr10688321cf.11.1751629870298;
        Fri, 04 Jul 2025 04:51:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWrN2NEryvPdcQsXVW0TeWgc3Ic5ZNhY0zdAQ1OKX4lqZG0xsfkEzP8WPFD5XVFAgSx6Nu+g==
X-Received: by 2002:a05:622a:11c3:b0:4a9:8e6a:92c3 with SMTP id d75a77b69052e-4a9978746c2mr10688001cf.11.1751629869683;
        Fri, 04 Jul 2025 04:51:09 -0700 (PDT)
Received: from [192.168.1.106] (83.9.29.45.neoplus.adsl.tpnet.pl. [83.9.29.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b02c6dsm158640266b.127.2025.07.04.04.51.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 04:51:09 -0700 (PDT)
Message-ID: <76546615-e24b-4380-b1c4-8c381743d31c@oss.qualcomm.com>
Date: Fri, 4 Jul 2025 13:51:07 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] clk: qcom: Add Global Clock controller (GCC)
 driver for Milos
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250704-sm7635-clocks-v2-0-9e47a7c0d47f@fairphone.com>
 <20250704-sm7635-clocks-v2-3-9e47a7c0d47f@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250704-sm7635-clocks-v2-3-9e47a7c0d47f@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RGBsR2T30HStr1jzvlzJOKP7aUESWC2k
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=6867c02f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=qmfFy4ndMtQ753Zl/n/b/A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=fvyRFVoqYMEcb97R5LQA:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: RGBsR2T30HStr1jzvlzJOKP7aUESWC2k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA5MCBTYWx0ZWRfX3YGI5ETPtDOQ
 W7Kh72PipK1lYuDBj6aOXPOoLHDf+3t7NS13gJ1C1KoXp9+t/DiI6W6pdr2Uuq2MpoAKBp1lfF/
 LpMlqthTocCjokPuhku1LIs1baV239+h4nU0ksqKkvouF/48lENIUpFuNXVvQN2H9w/NBc8kvo/
 Ya7/JMhzlVjGZ4ET5zIaIMur5gJWRRMSyzhXeb8Wlw9GQjIvL6a8ys3PPLRga7S709dNy9gvzza
 20ALcMM4cVmtQuWctZUFKMQDxLNPLdhyVZFuULjDsl0IKNclmtEo+qJfO7GIN2ut8wutz4sMIPK
 obZWC2E0v40L2KFM5bwgIRbNbpf7RNpRgeICLyO+j82awHfQKvB+CTeskEfNVFaNrfrqc3HcMyO
 z/gANjEVdMvLSqkRxVl0M4o8NqW0KQ9qiyYaNCuU9nOhqsDmvYxPRZ6owQGMaUqvWQoOWU2x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=919 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040090



On 04-Jul-25 09:16, Luca Weiss wrote:
> Add support for the global clock controller found on Milos (e.g. SM7635)
> based devices.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
