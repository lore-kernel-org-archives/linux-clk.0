Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE523932C8
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 08:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776328842; cv=none; b=EL+meHBiiOAGdBERM0wszqLvk5JyrboDDferHS+K9lqEXXN7vUrUiAHiSfJiyTUhm4mNzmQjccPii2CgV3dxW/WRRuVbsrWA4HA/lW4o+BalqIs5FA2zWi4BE8Bjru3wkjmYA7MEV8iVGgHpuUIcG8vq6XhTfV70uyLvb4EFE1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776328842; c=relaxed/simple;
	bh=+x+7yq9nUEdihY01hSNVJ+Ab8jDSwZh6LMbMIv9KZDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S3CL6ZpOa2HYtpgoJ1rExOOyRfmn5402JkjSXcthVUThku42qHnzSSN0IZo11z8/jg3Wo9/qwQX2Xa4+YsjYP+zqERh9ZYlrrp/UdAzpMa9naqmkZXDSoijqNMLq+MX7nZ9FXZyVFc8kAyQASTwXwJ3/l+rvxBRLoJKuQBufJV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z3Q6v8QL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SKLGtLkl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z3Q6v8QL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SKLGtLkl"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G6JQkB1668278
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 08:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7OM9eUj2417K4VU8X90kQ7WswZMz1+7qaQFxDiPh/QI=; b=Z3Q6v8QLyRh+UcAk
	/mYBRfHcmPm9Ismh0H9kwD6pLaX6RNcRcMvZjXD7AxUDjWd+ioeTTCxFE98lESVw
	ewB/qDmm7Us1VOhT5whnpP0Bb6Mw/VBETroNjMDNkPuAif0Y7SiteTso5BU+e/Vm
	LyhzYPkDIMniaFC42ndDSL8KRm30yYlfzlM0VmbKz/ttZOryOJf6exBrUiJibIGr
	E2ujhvg4GgQtZLz/Ws012/3uDQ7CR8DGenJ2cQ0oGDs/RW1zj4ibCCFj4ie6L+Bz
	JtCnVaVcnVOosBl+cRiQJ5nH5wjG5XJOoCsoo/GSXgIb2tivAuuFcN0cW5jLlk9l
	HLMqtQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtd90hws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 08:40:39 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f460260cfso4492369b3a.2
        for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 01:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776328838; x=1776933638; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7OM9eUj2417K4VU8X90kQ7WswZMz1+7qaQFxDiPh/QI=;
        b=SKLGtLklQgBd6zfIEsZBEHxXcdrhouFSQCOf5Y+LbpfrXMZdwrLG6270adeWBYZL5G
         UxAUyQETiR82h2jRV3ikFwcthelCR9VJHGl0ch5MuIwMu8GzUP5E8oPc/TNoWpKKJIdz
         P7lhbXMgRJn83GFShJE7iMHYt0KpZ+i+puGlJGvRG+6JrdyDqKLwareCwBv4MfBL9D4K
         1g8z+HkCVCF7I5cAsQT5f7fPPoX3flOIG2h3G6xZpX2Jb9Xm/Xd9em/ohOksRcbFOR6e
         8Oe7zJqbseVxotRMOsB09wW9HZVBVS5zvduMmpLGoL+XdTvc88mrUKEgfi7M4bjTZkhx
         mNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776328838; x=1776933638;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7OM9eUj2417K4VU8X90kQ7WswZMz1+7qaQFxDiPh/QI=;
        b=R2yoNR7NEn2vjjWrEbdM6RfPpGeO4C6NH5xMf6+ODJQca0gbLw0rp6/fATF8gu9jCU
         6SaIg2oP/iPvhlSIHx7lV94x2k3UsLkYt+r6Vnm0o13Zj4FQid4pWIAnag36KmUDvXSU
         FZz7U31s7Hh1x47xsBtpMBHjs/+ZHJeQ1Mp6H2y19/CqV4NNS4hGqzX/pytiLoxnizdj
         wNzKyuu3PnMyKvL55Zt8LmAF211getQdhi1+681fWr7c0zpygPcaQ7BQiMQP+Y32PjQr
         fhCc4Qgq5DD0IwvyLRrwAjLrjS7YuZGECETSdUoxTBqyQc6YcwYHvgGO3dKRQrYQPQ1+
         tqSA==
X-Forwarded-Encrypted: i=1; AFNElJ9FTTHvCgCIJWftaJQNB9uqMYxzrFRbO6kFkBgHHIu9t/+oz6kKx5mQrV55M1SBjByreAYyRI4uDzA=@vger.kernel.org
X-Gm-Message-State: AOJu0YynfQIDkfsBUdQGfq8pvAprfxVkk9VnRuJwD1V7uorSbp0Dih9c
	jHJYHbO2pLnIn4wc7xAxCt3mGq8pRB2lmnd7e117RS0hEdxN+h2v4bV7KL39ssRUHnJV7R9riVm
	Or0nABtrJ6lr7pVYuWnGkdKlk4OFCzPzi0trz1Feh2L5/nNdn95NJlhVR5QNwMgA=
X-Gm-Gg: AeBDiesp6RodFW7IX2zVS6kYFaKQVmJuH1PDfbjGw11rduIkj5+5QSo9HJ+BM79BXLi
	ugutF97BL18/UoCpLLCZ42Uw+vadtct1qCu3GGYLQpDzf1Tc96/zCFLqY+LA7dGNsdsApZp9RSd
	vve/WrUwSzZtT9qNSv1iZT3vEXCN4tXpt/hOUKxDE8sh63TQJULMEhu2dLJCGNrBlurJlcef533
	CEK/prtV/ItZNU+eBSUHIbQPTRoUJPF30D8gzvnheZkoSZHgK/uyD+4NM/Wh+gYoYlvXo9R7SZ1
	NHJqallnECHpGjxhzp8SqaAaSv99aH19UCAE/bBLUUdN4wWHOqP1Zk+JPmEVKgZqdkgmTvJt3Ub
	2v+Y1xeGFrF/KK6GNHErJDrUP8GjilRRjyZPzG+0HAAZLvWlR
X-Received: by 2002:a05:622a:7287:b0:50d:69cb:d603 with SMTP id d75a77b69052e-50dd5bdb482mr255326121cf.47.1776328399643;
        Thu, 16 Apr 2026 01:33:19 -0700 (PDT)
X-Received: by 2002:a05:622a:7287:b0:50d:69cb:d603 with SMTP id d75a77b69052e-50dd5bdb482mr255325931cf.47.1776328399195;
        Thu, 16 Apr 2026 01:33:19 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f5854097sm41130175e9.12.2026.04.16.01.33.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 01:33:18 -0700 (PDT)
Message-ID: <2e8f029f-0e70-4146-960a-bfb8b9d0f634@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 10:33:16 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: Make important arm64 drivers default
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260416-clk-qcom-defaults-v1-0-579e75c4cfe5@oss.qualcomm.com>
 <20260416-clk-qcom-defaults-v1-2-579e75c4cfe5@oss.qualcomm.com>
 <ce0ed808-facd-456d-b5a7-620dbad6465c@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <ce0ed808-facd-456d-b5a7-620dbad6465c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA4MSBTYWx0ZWRfX6Cs0N9bR/uhH
 VrSsU6OKbTiR+wVAtuQjN9S/kP+W/29nymjCEhXuuLtbpmV8XfMVfGUjFnz/Y9nw+lbPqKU+O/c
 CEhVhryq9AIRjVyIBWMGdXLOXZaHQ08VEZPwXUENDYfB0Ypeu8Zb3cf4uos5atNzNRZ6Y0b8bYz
 E0m3SqTDAOG9fODrqg8X4wilOV4eJmfUHXSXMF7/wdo00wSdlufm5tU6rql3J3tf1zI6l6wOUC/
 2vqzziSj+D66b1/I1gEg667Pzg5UvWWwATLFyPtTnls/4m1fr2Ngj6JKpHs7FQhc4pd/WPvHPJu
 mSUxOEwlWMfjRxXqRaVe8lB1bi3Jg+SQq0eS5iB7vuGRhzdFR3FWM1f6yy3dBI+z3TdZnrI8tq8
 AwiBea428riHEM3m46iDEvS5d16pSaK1GvRvGqw1/H88prdO8wn46k7f93iA61CfoAtSg/eeAeP
 X6jmEXh3QkJOMaPYmKA==
X-Authority-Analysis: v=2.4 cv=avuCzyZV c=1 sm=1 tr=0 ts=69e0a087 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=zaFJprUbLE3byhrQsaoA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 2VOKQFZqsy1iyuQCqfocLSukih0mPIJS
X-Proofpoint-ORIG-GUID: 2VOKQFZqsy1iyuQCqfocLSukih0mPIJS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160081

On 16/04/2026 10:28, Konrad Dybcio wrote:
> On 4/16/26 10:10 AM, Krzysztof Kozlowski wrote:
>> Clock controller drivers are essential for booting up SoCs and are not
>> really optional for a given platform.  Kernel should not ask users
>> choice of drivers when that choice is obvious and known to the
>> developers that answer should be 'yes' or 'module'.
>>
>> Switch all Qualcomm clock controller drivers which are chosen in
>> defconfig to respective default 'yes' or 'module'.
>>
>> This has no impact on arm64 defconfig include/generated/autoconf.h,
>> however changes few drivers for arm:
>>
>> 1. multi_v7_defconfig: Enable QCOM_CLK_RPMH as module, because SDX55
>>    (ARM 32-bit) uses it.
>>
>> 2. Enable QCOM_A53PLL, QCOM_CLK_APCS_MSM8916 and MSM_GCC_8916 as
>>    built-in, because MSM8916 is also used ARM 32-bit.
> 
> Is that to say that the arm(non-64) defconfig should be updated
> too? I don't see a related change in the series

I was thinking to do it in separate series, but indeed maybe better
combine it.

> 
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
> 
> For the change here:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>



Best regards,
Krzysztof
