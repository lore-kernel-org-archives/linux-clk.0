Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D322D0C63
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 10:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769595480; cv=none; b=XDaaLUuIhG1ZSVrA+zNhFnkx2sQ8Ryl/QmwJdr0e10XDHpPHBl+XIJDZlsLWSKiNxgQBcq8Rs39VN3zeWbPWZHyP8W1oDF4WuUlb25i/v3K9AZYUAisaRrDGFIjPB5claF0Pc4B1eBSqx9hBAsJdNUk0YBdlDLwHiXqO+wrN1b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769595480; c=relaxed/simple;
	bh=O/9goh1xSkb+EelmdQyLMFXz3I6q3HEZ87LSkbwQDO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UMWKvw/WrUzR8wy8Dc2rXr+5fhPs7A2fNRj9rokKhmwYCemoZYByS1mo1p+MYPa0pytjm5tKT7/uoOaKfTf/LnG7CXJw8odyELG6kZmPSBoGX4LgfxZgQR/cocSMg+p7k8CbgWKohvYi62Yv5c6SnlufUD68gEBUM/kmG4LhZ1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YKfkAlOd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pr15GL2i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YKfkAlOd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pr15GL2i"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S92e8h042112
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 10:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tf6LbgXp6mx4YhJ03WWvmUBkFvoGm+ZEEuhHUmxDhQ0=; b=YKfkAlOdB4K4dkw/
	jQj0bvXGC+96ZvYcX3PmCzj4SDFe8SQ/jvEqUzlYKTZwZvcvlyfdK00EMm1CmGCA
	klByM14Dab+YvGD1C4W5iXLTS+70AAXqLnLaudSt6LGMq07ubvZbipzOBzgoA0vJ
	p4wHG/YWAT2HJPWF5OrwlQfuM43No8KwOI+WXS58nh5Fu8BEqp2OWPAaOgldN/aC
	gphSPvDsV8Co7dl+1STUPlbHTz3ZLrzUl5fypa78TrAG2lFUvdWzKyewI92f1gnH
	W4V+7aVHWRKpD0tmAkp9u3aVfYbxa5eL7fBZfI6RfLX+5seAAp2wu37ofc7MFkGE
	Yb99eQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by355tkwy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 10:17:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50149945d26so23370501cf.3
        for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 02:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769595477; x=1770200277; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tf6LbgXp6mx4YhJ03WWvmUBkFvoGm+ZEEuhHUmxDhQ0=;
        b=Pr15GL2iVNYwlA71Biu7Bqy16gUDHIAT+vri1sLwewxR/+2jYK05xdb2/KZZOmBj/H
         TFv96erADr49x8PE/CrLz7vcA45WSh+4GRuPRGMwRXTtvOFjnZXpayfY8b1ruClUYVIy
         7zipfZAZk8tWz8lh7stTAZi0bZdhVhhER0g5jKqbEC0zNg8PGqOn/Pdi3+82o8GBogqO
         L+NLSMWBHkqDBlNATz8S7A9PS3ko2YWjHaX8hE4bdCmMLFakoyuN8cYVK9TicpQUfO+V
         p0Tp9pcQzl/xvNpLFbdYB0VjgzaeS/Q0prcmE/GY1D7+duh9z8euhnsJ3OteXi8Z8LJx
         eRSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769595477; x=1770200277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tf6LbgXp6mx4YhJ03WWvmUBkFvoGm+ZEEuhHUmxDhQ0=;
        b=HdwCJ5WvLCgIyhYV/eGlmcORfQUzZoI1Vx/8EijMhAsxtaTMzyXuwYEPlg/hmB6Q9m
         Z+v+nZLrMPtYxktE4UHcCZ4Gk3Db8/YSoxxxlXiGiMn1oflN8exoi9OVTCCFXi7H4lUT
         I+fX+d++pRQZ2rG7wm+GYofXpIopFy9UN9Hb3azTvBKiQVFsYFO9Lu7nmeD70G27rQgM
         DsYCRbh8L6XrM3FQtuZH0O8MoTXwcgkiifYunQhkl70Y0zON4jEzZvo7IDjcLA+oRhVj
         IS53alxMf/MnJ4fF7s4FLG6EqUtMiGnLELSyK52aOCOXvrhLfwOy86d72v998Ogsv/YV
         glzA==
X-Forwarded-Encrypted: i=1; AJvYcCWhl2VdsA8HXEPp0YVeJL2hGygnbpxtUZptYsUC8CaECLgeC1f18xUoAX4JNdoKM2D5J8cxrL0mrBw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWZ+iAIZNHq06bk1m5Z3SWOykYUcCxurLQhxAzQD7LMB/eAh+Z
	iGOti7Xiyw1wKXV8ox6bAggvKu4CVYv+s/kmxtHDnneOQnxF8TNPxAUc8aqhv1cYkPX61HuqUDJ
	8R/ykj5tFubi01ulpZMO90ly8t/R+GYLIUFeKXE2nIxbHaBSUTi/qwrkePBIkOqJwHhXwdbI=
X-Gm-Gg: AZuq6aKtze0JMT8BwP9GVD8UwAuLSRlLklRYbbC8ZVUYH9hG/sg8vv6MM8Tf/b/0uHO
	L6X0kBwT1/B74ZM/KNm1PjpdIWsJUdIKUC1AR/jA4VbbJObenBEq1en4VvuC8m7KiSyB/2lkt1d
	uslJAduHO/+gNEssD38uhOYqgM9pogXXITi2UH8vu+lYD6acQHRe7Q20nFji2vReSIK1bl3vgb+
	1ALJ9DAs9lgkSBfcHCsJuBIwzBbPIemVaTM+kqiiWFQpLGN6CmJSCpZ5kWWz2CguyZzfmlgLZ5D
	Km/y8+0FI7Z4giuDQANuQ+myc39y5fTczu7BUzfD+yh4zAjcy/kT9CWdSL9uMScNtrwI7jwzPUT
	Edue5gwwye8N7jypFOhCLsM00W/CsB+LA4X4Tu2JuQQYRg1PCWdocYOcmEn8kIdRbXns=
X-Received: by 2002:a05:620a:2982:b0:8c7:eb2:1c3a with SMTP id af79cd13be357-8c714b45365mr125363685a.1.1769595477531;
        Wed, 28 Jan 2026 02:17:57 -0800 (PST)
X-Received: by 2002:a05:620a:2982:b0:8c7:eb2:1c3a with SMTP id af79cd13be357-8c714b45365mr125361085a.1.1769595477011;
        Wed, 28 Jan 2026 02:17:57 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf185214sm111600266b.45.2026.01.28.02.17.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 02:17:55 -0800 (PST)
Message-ID: <76763847-e5f2-484a-9ff6-dab5906bdaaa@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 11:17:44 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] clk: qcom: camcc-x1p42100: Add support for camera
 clock controller
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
 <20260128-purwa-videocc-camcc-v1-5-b23de57df5ba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260128-purwa-videocc-camcc-v1-5-b23de57df5ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YNWSCBGx c=1 sm=1 tr=0 ts=6979e256 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=zb7rluFiWWGZWzxfGAMA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 2SEcQ9OagmsIloakWv9xJHbYxEuzhCuT
X-Proofpoint-GUID: 2SEcQ9OagmsIloakWv9xJHbYxEuzhCuT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA4NCBTYWx0ZWRfX30ltKvGSLfQu
 5RsYc67AoOkDOZ7yrG7L2CueLOY4bYDitjCirM4dZ8jv2s80X0HpQKTsJzbvhU3h3niz4BxZcbF
 GgX6jRdzxmHez5En78AtGX68k/8kSw50le5+crDvZRyz2wcG2O+pXnTBT65jDaCRm1KwvOQ+Itj
 v4KwJzR4mE3+fL3uzfj8rQI6fEF4aHEeGfDo/yN1lcKJs7uckNZcjkyqhbXzGgXca1Joa0OXAjn
 22i/bDHJWVJxyC8UNxCup8xB9Mp0xfl57icVPQ7aczthI7xKtRLccAFqpYh6dcwHtoiywk6yFdj
 R10FeeqFt/Lp2gus2TKbcIT78JtnaiiEBHCQ3O8n0awth+wga9q//2Qt+/+ajshkQfzpwVFqRWJ
 4Q4mFe6jI24M3p8wxGuLmEiIa2GXwEX8T43XScJJb9AM/Hi6h+UUSVfQS2S0diXGxpKJLTC5xme
 6HNBPZ/zNLOBKSJTDKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280084

On 1/27/26 8:26 PM, Jagadeesh Kona wrote:
> Add support for the camera clock controller for camera clients to
> be able to request for camcc clocks on X1P42100 platform.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

[...]

> +#include <dt-bindings/clock/qcom,x1e80100-camcc.h>

I have mixed feelings.
 
Purwa lacks sfe_0, pll7, pll8, ife_1 clocks and all their supporting
infrastructure. All other clocks seem to indeed be common.

Perhaps it's not that bad given it's a strict subset and they have
a shared DT

The driver itself looks OK

So

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
