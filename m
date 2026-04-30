Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E24407597
	for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 14:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777560234; cv=none; b=TDIodNkObJOjYJlsXpr0XpulDpRViLHUvx+lDCbKMCDoiPBXGVPksaSJa/k7RN0/D1efeIUApGe7slkynHZqPzkeygtV86+/uK0kNb6rZnbYefe4aK6wcUGwTl9Yp81vW93N6OiOedghl+v8XFG7f9Id6KVfU9l3A2CAMJtIAOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777560234; c=relaxed/simple;
	bh=BAE81AilO+ylrqk8/Sqpm5QVFqCuyzhzvMPUTfHnNI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lqVxWQujTevXcyrgZGWDk+7ayFlsQzCNHCmSqRr26LX56yd1KjAamj0S+pkcpfiWH53XPz9nt00mvNh7+MJFBbDpjp/CdEAuxBj83N1671tnC1cF0y1kWBbTWmhcG+zgKiktF7GwuPwRnCTkik9glBNFzLLDMn7faJujGQor7lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m5oCZ+se; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KhEsC3ay; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m5oCZ+se";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KhEsC3ay"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UArHvd2907502
	for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 14:43:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xEj5Rqc2GBPQPwxRAuab5eo3kQcNlGLJdSGzsFMROCo=; b=m5oCZ+seERhKZQmB
	JaWGoX5yWKVShEkLFD7vgXvsVEVNQRcx7Zl19PIckfKSQeYLjPyQbJzDO1TML7nA
	TbnxOmTUyFsxIU5dAiOhVKlVRQpdf2yPcaSLQR4gzCecPDSjicViWzh8tV35Q68O
	0NAJAGmVyiuoJgG1edDb2b+5v/eeZP5HKlDlhBzh4ydeyldjJ2YkQBgH/JVBweiM
	CoV3npILGAbxco9IQ5k4LOpVF1A/NWLxnbyuxvhkjWM6im+dE6HrMuamMoSKWBZR
	YK7qgz4jT6QtOWYcD33Dk7nPnz07vUsWvWXdvyrzQWq25UAyFiRy/T6RL78Kbxij
	LLdtJQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv0pfan57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 14:43:52 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8a0b5478a12so42096996d6.0
        for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 07:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777560231; x=1778165031; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xEj5Rqc2GBPQPwxRAuab5eo3kQcNlGLJdSGzsFMROCo=;
        b=KhEsC3aySiOAJKJJPqzI49nGDDiSdcAZCegI3wc6iJ7tziOKz+GGTaBFTLI0oW3XSn
         UynGFKTonL06qAqF4e2NCi3mYE+CcZ0KEK+iKP8KjWEYaC3UxMjqxLTgQsruZg5zwET8
         PX693vnFmOBOpYTe4yWTEcCPQiBfE+uTOcNndScIn/ok46lwqDVFg6CTiU5eG9jXDYFJ
         nIAewf3owMW6LsWS+5G+YahJ6L+sbEkp7aq/mEVPOHfcfnkD64oSlysgMHlbZHLKysJO
         ZRoNmBv3xr+ZhNn2sq/h7NqhXQDizxD9gApUlhJM9+VYziIpGoAXeZu+6jV8A4bswydu
         4xog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777560231; x=1778165031;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xEj5Rqc2GBPQPwxRAuab5eo3kQcNlGLJdSGzsFMROCo=;
        b=T/JA42gjzov9iO8a0tapt91Oc2BnBz9HP83JADHopca5ZklDj5ejQqikfExpQ/Fcgp
         c228gyQ+tfCFpRO5QiNwq9frusqvRkmxpMtXKp73wltj4QMEwgRKnGsjInfC8ttlebVG
         5AnLp0DmVYoYIixoXdkWtkLlwVe1YNgVGPwnLy6vopqWkCCmxrzynEj9X8r3bAxzoLaf
         +zQKSwsj0PL/2+uHSsIZ4kqhxniKIrfwLIsTwAWtgA0ClfWn/dzJEJ474Nv2FZTNQ7HY
         xUC+T8JUbLdFb/DAM7V7ehcYkUfOdHevxOdmf1tbyi53HUssAU2Mjvk3m2wW48nvAoAz
         Q9tw==
X-Forwarded-Encrypted: i=1; AFNElJ+rewaYHHGoA71/R33DJLWIJMpTgT25KMJWhxYVcsjH7VHpae4Bb+6xq7qZa6hS+yZkm7iVbDYzbz4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2VnLP4Vci1Xf5z+mwxGIz320zORWDHiEHpUtuSSR+Z/piyoPh
	YjReRqkKvo6HN0QUiKaTgMp7Wlkx3zpnQ1q0dfZrljjD0+JkR4hVvfpqekV3a2U3iwlkDe4fqK7
	LgwNqLgB6+mjC+Khax+A0n4fCUZjYJh+cQh2GRMh1GoHq6Rv8KAaVdkB1afPK1/A=
X-Gm-Gg: AeBDiesi+NeiQuIzNstaSKqguEoICcAOuwCPKISABYSL/Lx4DNE3G9i7+xcQGkjJoDQ
	MsAZY5xfHMyNIhV1dWMDpXQ1zADlyAzlJHveqGvn2ablw6IRXUeF4UqURK/QSURyGhnHBuEVVVA
	q9hHEnOGZlhA0VQdoxEDT+xxrBXPt3S+zW50r5oRzA/uafVhBuYMhq5OOAO6if1+uX9tqwaaSPF
	Ac5qTSOZPAuFdKcQYl1LL7yUqXArG64xdvjBDqmq73YLz0Tco1jVXdgcKQXAtIVPNVoF9Ou0fbQ
	oLZqRNEs/thKakB5E3BoeC1GK2V+nyGKsAO1DcljDtY4lh4e7GVvIwRG3seRN/UoJlLWnqb2gCj
	tu2XsLIWdErFy2zUFcQXxDp+YmdzvPzMhAuE2yvy/hLe9yC5Vc/xm2BjaK8I=
X-Received: by 2002:a05:622a:50f:b0:50d:ea1f:f99f with SMTP id d75a77b69052e-5102d209409mr32600981cf.31.1777560231230;
        Thu, 30 Apr 2026 07:43:51 -0700 (PDT)
X-Received: by 2002:a05:622a:50f:b0:50d:ea1f:f99f with SMTP id d75a77b69052e-5102d209409mr32600331cf.31.1777560230671;
        Thu, 30 Apr 2026 07:43:50 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5c22sm13748705f8f.28.2026.04.30.07.43.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 07:43:49 -0700 (PDT)
Message-ID: <159a7288-6a8a-40a1-8614-4fd30efb8969@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 16:43:48 +0200
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
 <828d2935-e881-443f-b0e7-eb68466ecd30@oss.qualcomm.com>
 <c2ef2e56-c8ec-417e-9771-f2e6746aa201@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <c2ef2e56-c8ec-417e-9771-f2e6746aa201@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE1MSBTYWx0ZWRfX4PAAZ7oOn3da
 GsyYgB7/usWbb97sK/n+q80Z8uweMHuRteczxONPNnQWfCACGKbHeigJadWjk6p0DN9MzjlcvhR
 Z1V1xn1cyVK6/AvBebnok5365ekuJ22Cu840XT41E9Alg0U0HNLsl9anSFa9d2TisXvgwkY3IMz
 W+ADaDwTPN278aLh1LRZcAOFmlzUj67onu0HGix5l9lk4gn1EIJzS8/G0QfbeYd8AvxQVVR0fis
 H3/nnhxXlhgLzuM6x5JXubWfj3/2444Cuoxg/0ZzTICVb6RISHorA/rAzTQUv0dtq9d7KwuGq5Q
 TpxL7uVPF9bbMSYXMa1+CQIrYZlC63n61T+Ow88aVZyqosRc8Tc5lXexiKU1KfQPnWuhBa8iOVf
 on/JSO4QHIT36kvbGV7tM5JggclvNI+75PQz1Iti58azPrvIu2nGQ+h7bxfm3QflfOH4R0rT36Q
 Ktcx5pBaY1Z5h8WtlvQ==
X-Authority-Analysis: v=2.4 cv=Zrnd7d7G c=1 sm=1 tr=0 ts=69f36aa8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=FyuGjayXr35bo7Q-RsMA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: fO0UKUeScHY98nNFcPnnBIJMvX0m-ENq
X-Proofpoint-GUID: fO0UKUeScHY98nNFcPnnBIJMvX0m-ENq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300151

On 30/04/2026 16:36, Vladimir Zapolskiy wrote:
> On 4/30/26 17:05, Krzysztof Kozlowski wrote:
>> On 30/04/2026 15:03, Vladimir Zapolskiy wrote:
>>> On 4/29/26 20:09, Krzysztof Kozlowski wrote:
>>>> The static 'struct qcom_cc_driver_data' and array 'xxx_critical_cbcrs'
>>>> are already treated by common.c code as pointers to const, so constify
>>>> few remaining pieces.
>>>>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>
>>>> ---
>>>>
>>>> Changes in v2:
>>>> 1. Constify also nw_gcc_nord_critical_cbcrs (Sashiko)
>>>> 2. Add rb tag
>>>> ---
>>>>    drivers/clk/qcom/gcc-nord.c     | 2 +-
>>>>    drivers/clk/qcom/gpucc-sm8750.c | 4 ++--
>>>>    drivers/clk/qcom/negcc-nord.c   | 2 +-
>>>>    drivers/clk/qcom/nwgcc-nord.c   | 4 ++--
>>>>    drivers/clk/qcom/segcc-nord.c   | 2 +-
>>>>    5 files changed, 7 insertions(+), 7 deletions(-)
>>>
>>> What's about constifying video_cc_sm8550_driver_data from videocc-sm8550.c?
>>
>>
>> It's on my exception list, not sure what would be the benefit in practice.
>>
> 
> The benefit is just the same as the one described in the commit message,
> having such a peculiar exception left makes the commit message statement
> "constify few remaining pieces" imprecise, and if it's done deliberately,
> then it should be explained why it's done so in the commit message.


What do you mean? The code is obvious that it cannot be done. We do not
have to explain absolutely obvious C code.


Best regards,
Krzysztof
