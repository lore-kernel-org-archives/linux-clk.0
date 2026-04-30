Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E55428461
	for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 14:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777557949; cv=none; b=e+mJL2l6Nj9SZBPsakOylvVePC59LDV3lPuS8OcicCq9S3VFNCHVdBe55cqaj7Xo9Yc3BXONh0zMGrxTTtroVAdWuTfnUngwVYpDAkOn0L9KHJbcwTwryWttUxg1omBXzT3XPJGtA5LcWBkZSa1X4RjdYmahu6ikHQSaDvXxNsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777557949; c=relaxed/simple;
	bh=r5lwxvvb5sAgW6B0ULVuKKV/yBw8wgTG5rI3ASdyRHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S1iFDUqoFFG5MqBFUkRBeGocLbE8KU0GnpWYWCf5/vCPBKf1Gyn4J8ICkoQNH469nScPD8OGsvAgvawBwtKlgGOS7YDO5mLHXxVWTS5oo6m5Dq53K0qkY4FCNld+3hj0q26DxTaptLTYvHFjcDJTb8W3eSL4AxXUUxgC1zc/ftc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WENIu5oL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J2FiMUAt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WENIu5oL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J2FiMUAt"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UAFn3a3730733
	for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 14:05:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oRai58Oz/gneEe5ZrO+R676QRnXLBNMVr6z09xqiu8M=; b=WENIu5oLtYrZA53v
	g6UewfalSrbstg1w4QXY8/3mi+HAvWQCbeOjmQ1jegfAUtEQg4K6NTcBenv5xKm0
	3p+FAn6XIu7/oIkmcc73pBIGWZgNy1gYUoLeS8LIAJQTx1pYfNMcEo2Re5aLQQVv
	42aHSWRTaYoK/irhbh/wMh4j5kWCcWorHA3jqbaZRfubY9OI+DlwcJKtAlyFwQfR
	JQQfdUkes5YB9cULtBSOiu6cuYkD/r2W9AccnGX2bVAMJtAUY+OM/XKV/gy3qMPz
	Bjpm8lJ3PP0g0qY1tOytBqoaNvn84ePxuvFN4JfkSK2O+e+jWn6+ZNKDxUxlhdiF
	OGV2wA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duy1wambu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 14:05:46 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3649e59f0ddso1120837a91.2
        for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 07:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777557946; x=1778162746; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oRai58Oz/gneEe5ZrO+R676QRnXLBNMVr6z09xqiu8M=;
        b=J2FiMUAtVgC3STsfJTSLQyzcGYkIGyrwU3SlcBntr4CXdoK2+2lQjiZZnrHUjYrGie
         f8sJ5Sj8XkudcxM7QlzoZNPr4csc65mKZgnK1NA+WdgBxHi45teUD25u/QKDsFS2FASt
         i9cFZpH10RMaOx6cWsnx9J2MI7dvL5wzqqmlp2VAMK8icH2eDmRvCnAhvNEmvpkY9x2Y
         /taL/fP0oZoxWR+HJeSkyFHuIDKd+jigVqVwraVRuJOylevv7a9lBiVvsnAnAzeO30Zu
         wmC7xRKu8Pg3MpeJ2Z26S2Pnn2zgOjZYorwAt+o+hZpYDnqp1CR7W8jAwCh3WR/62xF7
         r9Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777557946; x=1778162746;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRai58Oz/gneEe5ZrO+R676QRnXLBNMVr6z09xqiu8M=;
        b=RlqlLWFZHEn1pyDOXWf6pmkkqA4YL9c/Fi0vi02rGoEb+b8ABIn4Oe7dO9vhyuclO5
         ATKSnDbCDPTLzuDFAW3gczG7KYjSXLQ5GgJ0zutYCGEEjs9dp3cGX/eVSqeRt734K7MO
         mHRd97aULddVlUNrkvM8AUEhiEX9GqtqlHJJqoE/oZbwLUocjK5RqEQYaiRlBiwx0S3D
         D4kjQhJl7sjRjlG4DGJSAvnF/1WphJc5EZB/CJVWgKXuaGtez5xo6zRTZNLGcomgpE/s
         j4QH71AGybeS3N4v/u1dJ60s+MxdRpoOC0Cbj83DbiXL5bRoKwmyBuCxkGmy4zQJ/fpa
         sSww==
X-Forwarded-Encrypted: i=1; AFNElJ869VmgTF3alQzYmpg7AftlLUFqdDBKFcT13VCsRuQTz9HL26/3S3jbJPponlWxgMxh0eSmklmmR5o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn/dABrd9eVikZ5wc0xbJ9WTbM2koijkz8q36EBAEAVJY1HmHh
	KSToEDux++WZyJJSJrpQOJAMFd2A6JQ+H0+CePAE7mcz28WOjJVZqUMcNj2bAc/UAv7hYlq63Bj
	e03IXBTIrmDpMxnKgPK6DRiGq9/lLE/e3lR2HhH2fkMRlA0d5SXMIKVln1+MLeOU=
X-Gm-Gg: AeBDiestacELW3GiSMJZsPiWGqvhYqI/DLjotBWdAlomKbi3mIJMeDQdcDIRZExEqor
	Q8AnpjkCp2HtqlgWgtO4o3FOQSiSnJ3RrvTw27OFgPR4CzwRWAVY5szl1N3H6m/H8oKl6Xy6qU7
	Bcvh1aPDMhxtbagBaqkXMSnkZ9JbkiAp1oVPnaqcOO4KxcLTase5Jnf8hQ6CxrnRyT14vc8yIjp
	tojknisvB7aNncq8JbqTlc5JL1j1DllaWvF1RvC6EVkRC7L25C1FAetj3nF6IAil689MDZafBA0
	kV1QeO6j+n1t1kYSCmynj7b3Sni1GrGopghGwgEoJnWNPMMlxQIfQ1ix89KL6ajnO6KPnm3b2bf
	Ozdb3oUn6n7OVpcBaIq2n86JGvbU86cHjagX53YUxdxCk6PcrqAtA7P1rGwU=
X-Received: by 2002:a17:90a:d44d:b0:35b:90e7:c44f with SMTP id 98e67ed59e1d1-364c2fc603cmr3231178a91.7.1777557945564;
        Thu, 30 Apr 2026 07:05:45 -0700 (PDT)
X-Received: by 2002:a17:90a:d44d:b0:35b:90e7:c44f with SMTP id 98e67ed59e1d1-364c2fc603cmr3231120a91.7.1777557944934;
        Thu, 30 Apr 2026 07:05:44 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a820c71f2sm102755225e9.5.2026.04.30.07.05.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 07:05:41 -0700 (PDT)
Message-ID: <828d2935-e881-443f-b0e7-eb68466ecd30@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 16:05:39 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: Constify qcom_cc_driver_data and list of
 critical CBCR registers
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260429170859.247165-2-krzysztof.kozlowski@oss.qualcomm.com>
 <a0a9fb8d-c109-4120-8780-8f9c21027b89@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <a0a9fb8d-c109-4120-8780-8f9c21027b89@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yfyBItIxHJa_wWIIysQI74Lhjx4enaV1
X-Proofpoint-ORIG-GUID: yfyBItIxHJa_wWIIysQI74Lhjx4enaV1
X-Authority-Analysis: v=2.4 cv=DPy/JSNb c=1 sm=1 tr=0 ts=69f361ba cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=nZGv5R8-6QsBmOCzOLwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE0NCBTYWx0ZWRfX9C4fCNwQTEZm
 ouZjYwk1G2DzddqzcFbHkk3A1lTtXnL1nDkHdcXhZzXPpDMIyWgcfgNSICKYCqPrlisYrYQbEVv
 cIHfbloCRNYYfAAr9I18ythLMlYQP7kAlf8KHFlaE7Zw/fgg4/6cL81AI8AZ8PirXMx3BLZZp/r
 KbIa53gCQFhw0Asfs1pVqZccz/9Tjk5QnbwGvGdCbEB7XtiNbYVzLdVcFa40th0tWNl9fWNp1DR
 Shnt+ZooRS/U2Stb2T+iMVSsePrOyetgAv41Szi78AQ70+m40dk4Ip7OEg0nncPLKGAHSi8Hjoe
 Q0EwWR5a6+c8BXI3kg+CFAhTT8XtIgqrP63H0TdIP/2xbqYYkKDjfbb83wG+yuMTABPahJ87tVu
 6q0jMGReshZKWzCeQ+YQedupYS3ifbcZOSS8O+M3OJBk2NudNM27tnvmF/8vyS/GGSpxEpa+XwH
 4vO+6iIcYoxDilm9yRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300144

On 30/04/2026 15:03, Vladimir Zapolskiy wrote:
> On 4/29/26 20:09, Krzysztof Kozlowski wrote:
>> The static 'struct qcom_cc_driver_data' and array 'xxx_critical_cbcrs'
>> are already treated by common.c code as pointers to const, so constify
>> few remaining pieces.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> ---
>>
>> Changes in v2:
>> 1. Constify also nw_gcc_nord_critical_cbcrs (Sashiko)
>> 2. Add rb tag
>> ---
>>   drivers/clk/qcom/gcc-nord.c     | 2 +-
>>   drivers/clk/qcom/gpucc-sm8750.c | 4 ++--
>>   drivers/clk/qcom/negcc-nord.c   | 2 +-
>>   drivers/clk/qcom/nwgcc-nord.c   | 4 ++--
>>   drivers/clk/qcom/segcc-nord.c   | 2 +-
>>   5 files changed, 7 insertions(+), 7 deletions(-)
> 
> What's about constifying video_cc_sm8550_driver_data from videocc-sm8550.c?


It's on my exception list, not sure what would be the benefit in practice.


Best regards,
Krzysztof
