Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EAF2CCB9
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 12:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774616014; cv=none; b=f4hz9q/LJZyaiyuncO0C2hXa7W/WUjWqdbc5XiWjTSqtcuBwIeCk3rXoMbROTaw1iK5EMjvhPhpjHG04ElIs04kUyXCpG6vyUSEr2ix+pIHy4DwDZIu/TVWkUgXbBw3kv2g8AZ98+/OD134HKGTstQ1sEF68Gk4aSwgBs1X+ObY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774616014; c=relaxed/simple;
	bh=82hBkgUQBRYsEeYM1Pt/3YAGZ95NIaM+aAvRhDaBC/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F590gE4d/dmjqW4Aql22XQnclOQ56+BR9IIl/KO0kCyJtzdQxQ8XRiVwlQZpdDWFuciwGV7JmIOF6DcthgDWM+z13lqSdGmvpjU/2A0NR2mauTmXaPNsEoIjWJl0gf8BHID3QNNWRiUu5jKF5JflNa8g9zw8jm9/KFiET5kf1q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QTxLJmX1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eNG6qGZE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QTxLJmX1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eNG6qGZE"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6wFi01710589
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 12:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nCgve90m/nG4dKANvG2uOMtnscJK8H1SmJtIiWg4EQs=; b=QTxLJmX1xYvlflEM
	7OSRLyfE66HZq8dqabIU5HUK1AS5eKSTzyz8PLle3UkpqXOqMd7sd4NwzXwe2csL
	zTUjLkJBRLPSYs5XnNZ3giKZEcO8S+6X86yL5zglgq3QPRng33vJgIkQgaoVpfJw
	VpQ2Rire22tEXIyd263tPkOjpKBD4uYKHZSrr7KHNu/1vM6lJnTTtSUT+rr/9j1n
	6+7BwPpZx9n0eEJ7RmjUMP760lyzXTBwbrZfjKA3QNY7fazSVrVAkdk1hfAsc8w+
	IcgH6R5Hl37BGBmwAM0Cvz3iKqDySqrcmiDAdv8GdD0XZ8oEKr3JHHLMqVSKG3wN
	2IITsQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxvk0w7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 12:53:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b68af943eso4556251cf.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 05:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774616012; x=1775220812; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nCgve90m/nG4dKANvG2uOMtnscJK8H1SmJtIiWg4EQs=;
        b=eNG6qGZEP65LDmVMVQPmT5iM1HoHsg57gWwxyRfdTCLzUdSYIGzonPLMsosxQoYhhi
         lc7WZy29VHHpb/U1ZupsjsWs57xiBIsgcIGwdMGrXgOuLjUVxKPsEhiJ1EdSNZ2oaJ7V
         29rDHY7dqtuvHtWxATVX8a4E6x4eSUTMHAK5pCQTn75trTIz6cqMtNXor/kp+3xp0JAm
         WoukDmcuqp1lqvHnvo6zY9iyXYImoNOEMBV0PJ7ZjO58R2TF4Byf26/YvSJCUN2dH/nW
         dOsqwiVJ6Qwdv3/BAIEBVOHubABuEuRqp8oHmiBGOHPbUT99ESHsdZr7ldRyQHdz4t3F
         0FEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774616012; x=1775220812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nCgve90m/nG4dKANvG2uOMtnscJK8H1SmJtIiWg4EQs=;
        b=jCdpMA1jdB33Eys1gajk0V82pE7ve5ifD+o+qydNpR1JYkRApZNu8pQwouwLNpEYRZ
         M8Bvd+xB1Bh93ccxShbMkXtms5SreyGPFCwniLZ3H1GJFqrtGMh/Vo+8G/xF+IYOewcF
         HFXDTQOGSjagD7BcR43VET3vVK9LFuHV2uCLVGqyHy84MQEJbTbDR1lBhl7EorBS9rt0
         AMcqh/LRZsnLuf8wUHfwE/tqB6j8IPnyWTyWiUh3pB+Q8ppa8AKmsoszZgy+5ElDBNi/
         z1naMEBA/0/WQ2M38IzgcGEGjdYpOsIAiwJdbVZxw///qXaGD5nEauDPyjROBeZ8Gbqv
         jVng==
X-Forwarded-Encrypted: i=1; AJvYcCWsxxgcJjgB5rhfZ4X0bRSrWjQYzatnvWOf7yrykl28zzbc8DC3M9iASmBqx9rxVtojHhbsu9/iWSU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpqVvfPB/+Q1N+AHOq7AZlW5JFdfsIyn+Dpl2bPoqFOaUpqLO1
	4ITv64/Sk13nwPHYaDN1ze9VoOBAfkIJxZNpt8CT0YnmxghEnMsqZq3IVvhdYf+K9qCzRrqsG/5
	UUz2oVjPUcI6MBQA2w2nkjZ4aLJQzzC00SUKRuYENeKAVY//8CdxHOLRWFWdhXtY=
X-Gm-Gg: ATEYQzxaXx+h0x/0dw6Mx8+XNRPoXPCnbF3KqHlWIKPg1XHPefIM/Md2wmu/Rsoy3ja
	apFwfe6Py4ZGFu335WwGXD4i2BSg8qUyE4g9VHQCWOuWMmf3bCwJIQhUFgsZ6UD2Ie3Jhj1QmCK
	w8oK1KN+na2q1nY9MKLvppQUtm1T9slhxxbfJknBrU6i2Q5DJ4gS5IP6TqUpPywgmMapvvgdmZZ
	FJt+PBGpfrLcW93XGO3w/3VsnN47IeRIhu5bwrVs3CXrY8DK3gC4SvrUQEOM0FAa1NVbBUW9SbL
	76gk6vpxrqdrSRhTzLKW/IMMjs7dTLJzJ3ANDx3CeC1pp7/DUmKf3KXERbhgMHDzl0rpGaa/8z7
	PgrNGTMCPbPSeHwJx7O9Y77KHMRRucMnFre1Fz6tM7laKWKtsdxRsysJ8k7yNoTldzgUYOwKIwi
	Hvnvs=
X-Received: by 2002:ac8:5a11:0:b0:509:2a92:8088 with SMTP id d75a77b69052e-50ba382505bmr24444131cf.1.1774616011814;
        Fri, 27 Mar 2026 05:53:31 -0700 (PDT)
X-Received: by 2002:ac8:5a11:0:b0:509:2a92:8088 with SMTP id d75a77b69052e-50ba382505bmr24443631cf.1.1774616011338;
        Fri, 27 Mar 2026 05:53:31 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b2029be87sm248918866b.28.2026.03.27.05.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 05:53:29 -0700 (PDT)
Message-ID: <66879526-15e3-42af-a2ed-153f9cfc66d5@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 13:53:26 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/7] dt-bindings: media: qcom,x1e80100-camss: Add
 simple-mfd compatible
To: Bryan O'Donoghue <bod@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
 <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-1-fdfe984fe941@linaro.org>
 <20260316-glaring-jaybird-from-wonderland-4f8fd6@quoll>
 <94f4fda4-504e-44eb-87f0-e34e557402f8@linaro.org>
 <471895f6-dc60-44d8-84ce-8ba0069110e4@kernel.org>
 <xSErLOaV_RuZ1DggWWH3WGK4mpUp_7CrvmjVU4ZZd33l60PWpjxiSGID27A9hHbdDYmghPXgZONyhiTJ_USPDg==@protonmail.internalid>
 <1671b8ce-cbf9-45ae-947b-f35d174be93e@kernel.org>
 <61fa4409-e19c-49d9-b7fa-dc6f8413c181@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <61fa4409-e19c-49d9-b7fa-dc6f8413c181@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JZ5VWYDAOIMkaJdmXeNFieJCDc4GQmbZ
X-Proofpoint-ORIG-GUID: JZ5VWYDAOIMkaJdmXeNFieJCDc4GQmbZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA4OCBTYWx0ZWRfX9T8TP7PuHi0K
 Vqn08HUEEhCcx4S+8YiqWDkVb98YogjxbFjh11y8qv9av8sENqysXxy38rluaYlUD5VHX/1BC99
 h+XVGH/paiTd+cI/9S18otNCOHb1s0e1cHtPFJzh7uvL6hdZguA300116cWWlLM/ycPsk/nWh1b
 oLqjHNm7Tc1v8Cqn8Qs7jhUfqZ5z0YriZElZSZnjxCZsPHxCr+1Iqazyt52K6oSJHIdgzRgKzmV
 Xtf7bvdpgD6+J7Z4nKrbpyhvYYVkh9BYKBMr+cNDx09f3btIkW2gD7wf6usdaI7c8F/OenM4otU
 LIMOFHCrG9hIEcpw0u+G5ZPlJ+l+FadmilgDVPtCKj8/1bcmcqbzdJvK+KdCeByIsVjvs0aNiwX
 pSZxC2CNeMh62nWKlxKCjTMy8D/kNxVdQ5BW3M8Gp06+kjNp0w1ENwlANNjSGSDjksWDdY/64um
 9/ZD6cg8pekyYLjy8hA==
X-Authority-Analysis: v=2.4 cv=ToXrRTXh c=1 sm=1 tr=0 ts=69c67dcc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=13ZpxKrbrQONVxPmPHwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270088

On 3/17/26 5:21 PM, Bryan O'Donoghue wrote:
> On 17/03/2026 16:00, Krzysztof Kozlowski wrote:
>>>> I actually got the idea from:
>>>>
>>>> commit fe6a952b567f6a771d087d2e969914f31574d6ab
>>>> Author: Krzysztof Kozlowski<krzk@kernel.org>
>>>> Date:   Fri Jan 27 20:40:50 2023 +0100
>>> If you refer to my commits, at least read them. Do you see children
>>> there? Yes. You have none.
>>>
>>> Plus trying to get 13 year old legacy device without dtbs_check warnings
>>> is different thing than correcting a recently introduced bindings.
>>> Terrible example to take... And if you find example from 20 years ago,
>>> it will be even worse.
>>>
>> One more thing, that commit was still correct because it fulfilled the
>> simple-mfd requirement of lack of dependency on the parent. I do not
>> believe your code fulfills it. I am pretty sure it does not.
> 
> Yeah I take the logic of that point:
> 
> CSIPHY here depends on the GDSC, power-domains and clocks we've listed, its not being supplied by any of the other blocks that live inside of the rest.
> 
> They don't require any resources from the parent and the parent consumes the child phys via phandles.
> 
> To my mind that fits the criteria you've set of !depends on parent.

FWIW the problem here seems to be the assumption that:

"needs to probe child devices" == "must have simple-mfd compatible"

You can just add a devm_of_platform_populate() somewhere in CAMSS probe
(or do component_device like in drm/msm)

Konrad
