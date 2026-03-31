Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6253ED5A2
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 10:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774952463; cv=none; b=OhBi2rNd+RfNRCYitVpr7G1wE7Fv2qiTzF7pO/fdyGnup6S12hKFhBLiSxLOoz/NaspBpEUsHZ2ORsJpZqgMyA2O7ACiSFFy8VWc/8u+yk1BVEDxsGdaLZpy1No4+Lx3c9L6VR/QRJLTOjmMbPRNZAiIfyJIJ4bi+TXAYLr3TaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774952463; c=relaxed/simple;
	bh=+hAOKA04/pwKzntdv/46zWY6DEBoxM2Kj5QHldjiDmY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=G2XL0D8xhYc8xO1FuxIx4u8MHvIKiRjvvYEp7GvW6vkuxWakk/CqEkoiylrT5R1Aw+FdaLf0odo0YMVKJXRfGh/PI1pVEK6krRlljxIYssh9xygyYDZVqjB5RlDnEY52DeYl3XkuR9rQ8Layh4xgYxZCXOGmaygKb0R0WCEf5W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hHjyb4C1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zb4bFkQ8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hHjyb4C1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zb4bFkQ8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V9WNxC4053797
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 10:21:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UT82/3lWMmlDNbovHHsALTmbvxSNZnI/J3PZAlHEo/c=; b=hHjyb4C1YI4pAYlc
	VA09wSsVJxi5ArZGeCM9LuzkO22pZKWz34F76O+KHECZSRvOMyO2o9o6lE5uQouW
	kPPR4YEoV5hxPC1bhRTuxyTIlhppgZd/NG9ttzimu7mlFOiLPqX4O8FhXFQgFvrc
	9PGpFxX//rUeDx/9BTjmS9fJ4DZprEgAIde7uZV42cF0p2HiC8mq0TpQsihWjJVU
	DjwAg8t+bLR0OgJErIC7lKyQJ4lXvfVpZRBGnYImdQ0D7G19y19zEPjO7XYar6yk
	P0w4SKmpge8g1mQvgoXGk/Q+x9gvtHhO2GNT++LoyM8xizwc6rUzHSmrMp83TBsY
	CFmt1w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7xx3b2hu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 10:21:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b317c40acso36181381cf.1
        for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 03:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774952459; x=1775557259; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UT82/3lWMmlDNbovHHsALTmbvxSNZnI/J3PZAlHEo/c=;
        b=Zb4bFkQ8nPjsS2wDKnxDCRTH3twEzxjqow5jbIZNzHOdMVFN4sEUhwWzPfZELPVcu5
         us80gqI8oPtwjf2Qb0RIhAJ6GZxcDi+nZojGfAmZe+SI0DoEmGuX4zECZzGsp1olJxmA
         /LksuPF6LC1+QKvhd8iAvB5qOFNQCzlPpCP3bKvbItTslb47ggpH2QoE/+3K2vtW6KuU
         FsV7EyKbCnA5+dTa5qv5MZcJEw7iyU7dVx0Dhpy0FiKah8Cpg/oNDG3nHY7fEmkHAoAs
         QjT8XpONPniCBARmPCV5Xu3gE8wO7ax3ucpqLAZ59oK47qPg19wkQnPYpxZHSmW3yt37
         Twhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774952459; x=1775557259;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UT82/3lWMmlDNbovHHsALTmbvxSNZnI/J3PZAlHEo/c=;
        b=Wgake+LdFk3/1OKPuNuLLmovCFjK6/oF8cqj0upe223Tnxf8eI5hMHeOmiKU7eEZ4x
         GpP9j5cH+VztNTouqaR/B09BM1KnK2t3hhYct9h6EAaCZeG3nuE/AMzmSLGswp2auxms
         Wm5zMkDgYEdV/2MjA5Oh4ayoJSF3Wo0e721zSPT+uwxwpMAGPJjcIXyWwjFxfFKvZztC
         drGrr5tLghLK1YG+zxqwlVykkrNDUjiZPCQ4nXa7pY79XlVM0IiaC2CH28vyTkaTRvMF
         1JqOc+LrG/62F9uDSZRB174lnAMSUxKz2fWNeAyWgrr2FbpB9Iy+IUe+o6lL3XM4yit+
         Fdyg==
X-Forwarded-Encrypted: i=1; AJvYcCUf562Y5+QIr1l54WHJH7XjH+5ie3LB7JZhjVSJtQePH3tCq5ZxMfxknAqL5jSprlDrPtUWAXn8PF4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/H1lAyA6fg9no4qhIIubTAFFcuCEjNUE7qk5rs2HO3K0v4MZS
	m+ed2Yj3b/mJ2ALLLTfQrmmMkCNTzL5TGzwQHcPMHuR9tI9MAuVie35SKuXtEp95KSbZe8GmtJF
	zYJEWC7J7VCQIJG06X4HnpOfwPz0KLPERqVqsD3H1/YEFzfRFbHYUVJU2KlNOvrM=
X-Gm-Gg: ATEYQzyqy/7tKiFAqxm94qMsIBQANUfrPDp+8WXQnXu2om6FCPlCwJWzFESgH5UnkKj
	ivETeMNB2rhb4irUVakAsVwUOxQ2fAsuVmPUQmEcCxZXpkFPKlQSRbLZm4nh6gQWwDsUlKAPhmM
	9mpr2kMUXC/DbjVEf6gUp9vilnrrE4S/oyAwpwl+KvpFhQQYc4QKroQChc6KSthvE3Br2HfM8Cq
	kfQcdm9f0pzpt4szBl45bESIhCYX1Mykuf+tDL22oEnBERRMfLDa4HlLZhdAi2qTxCxLevrqBqP
	6ncEpA0Oc8Tbjvv58V33RHfSjmMcHYjKVekTTBSsBStemo+0rLTeaziXfRJL1JT3HgJ5IUpVn18
	filS92Ge+T7grR1eUUuVxwI22v3Ea9Xu+2mTRhPYkQYSIe15n
X-Received: by 2002:a05:622a:7c8b:b0:50d:2828:1a98 with SMTP id d75a77b69052e-50d28283268mr36255611cf.0.1774952459096;
        Tue, 31 Mar 2026 03:20:59 -0700 (PDT)
X-Received: by 2002:a05:622a:7c8b:b0:50d:2828:1a98 with SMTP id d75a77b69052e-50d28283268mr36255321cf.0.1774952458674;
        Tue, 31 Mar 2026 03:20:58 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887a648f3dsm25400765e9.0.2026.03.31.03.20.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 03:20:57 -0700 (PDT)
Message-ID: <7fece0e7-31b0-4b92-855e-bd9e210cc651@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 12:20:56 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: Constify qcom_cc_driver_data
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
 <a746be68-4f5d-4792-a896-bb693d029ea4@oss.qualcomm.com>
 <6ca492d7-c041-42b0-8f41-cd29ab7b4bab@oss.qualcomm.com>
 <51a05279-1759-4c03-8bba-835a9e972ccb@oss.qualcomm.com>
 <445a53e3-f467-40fc-9b01-dc776555c3fb@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <445a53e3-f467-40fc-9b01-dc776555c3fb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ErbfbCcA c=1 sm=1 tr=0 ts=69cba00c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=y-Wd9Zd1aYVehlAUloYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: FJSFQ9-Ok9MiOpripKIqnk6Pa44Bm-LT
X-Proofpoint-GUID: FJSFQ9-Ok9MiOpripKIqnk6Pa44Bm-LT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA5OSBTYWx0ZWRfX+b46AHHjYcIV
 /7cbACcD4cyxabkS2zmAdnIf9gCayPa8QRUg5AwCdC/F+4FkoCik+/Nlnpgi70nrOAuF2FUjbhx
 MsW3lmP7yDNjBWlKqo1rE5pjJlg9t/zAnAYAYPSvymLzVfqL1uXbeCI96LlQaFhpIVeSI5WAiQp
 Eg1EmoqU+8E7362/6WO19UdNcIcQwRLAWopTkp5sRWJkwRdexQiWFFCHmeAU6up4dZg7gIUubZ6
 ZSTXs+nXfCDwotCDFVBTvl++nsfSG4M/KlFWxbShHnN5QPOp68PXyqCCfZPHMMGZmdgC2JXXszN
 ZNL7tUumGVJ8VQJfT+C0XdgCf8ZUCejDkaaaAvE9bI5GGFzNzXAbj/VCKOnucP7sMrsRPp3TX7I
 PRAG34Q7/5ltRTOQARtVNdfgjAS7RHwlmBrrklXzOoEAdC95jhOZ2l53wMuV/saDTrvEgaZ85x+
 D7fFQxz7ZYwpamw2vlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310099

On 31/03/2026 12:13, Krzysztof Kozlowski wrote:
> On 31/03/2026 12:10, Konrad Dybcio wrote:
>> On 3/31/26 12:09 PM, Krzysztof Kozlowski wrote:
>>> On 31/03/2026 11:33, Konrad Dybcio wrote:
>>>> On 3/31/26 11:17 AM, Krzysztof Kozlowski wrote:
>>>>> The static 'struct qcom_cc_driver_data' contains probe match-like data
>>>>> and is not modified: neither by the driver defining it nor by common.c
>>>>> code using it.
>>>>>
>>>>> Make it const for code safety and code readability.
>>>>>
>>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> --- a/drivers/clk/qcom/common.h
>>>>> +++ b/drivers/clk/qcom/common.h
>>>>> @@ -49,7 +49,7 @@ struct qcom_cc_desc {
>>>>>  	size_t num_icc_hws;
>>>>>  	unsigned int icc_first_node_id;
>>>>>  	bool use_rpm;
>>>>> -	struct qcom_cc_driver_data *driver_data;
>>>>> +	const struct qcom_cc_driver_data *driver_data;
>>>>
>>>> This can be a const ptr to const data, even
>>>
>>> None of other elements in 'qcom_cc_desc' is const pointer, even though
>>> they also could. If doing this change, let's make it consistent - so
>>> shall all of them be const?
>>
>> I thought about it, but then it turns out that videocc-sm8550.c has:
>>
>> video_cc_sm8550_driver_data.clk_cbcrs = video_cc_sm8650_critical_cbcrs
>>
>> So we'd have to duplicate the entire struct
> 
> No, that's not a problem. Pointer is not modified and we speak here
> about const pointer.
> 

So to clarify what the code is doing now: I constified the pointed data.
Not the pointer. If you ask me to constify the pointer itself, it's
fine, it will compile/work as well, but do you want it?

It allows only definition with initialization, no further changes later.
All existing drivers would be fine with it, so just confirm that's your
preferred expression.

Best regards,
Krzysztof
