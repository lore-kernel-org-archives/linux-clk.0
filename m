Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF093E5EDD
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 12:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776168643; cv=none; b=Ze3xiKA3wEAUFGbKUuXArgg3lT5lBvT8fIMViOm7Uqf7CO6fPWan8QYcBW45CvxbgIonucgDLfa+wBHutRhGSivtG0i/3tI5roVQXc7S7a425aASf5kfFsdXCmfMWTmVoZsVyeVYyIJ3JqNZiEQe+lojt46qhiKDJIrnZOKVAVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776168643; c=relaxed/simple;
	bh=+7mq9YmQ5a4DCYRPR6WuvCY4oCusTEBSVXb0rpXdjC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G16sKxgtQk+iA0MkUaGuda3jIL/ixBruWW7uDAo7TT2Verl8r6tG6ys16gF/2ZxbRhpH+PEmSYimw9IF6B4/XJNNCnP5ANt8/tdc+M8RTwim2e9autQ39Ge6so0tGjLlWEXriqvoPjtQjQQIf9Nhti61DD7QcfrcnZFaXV/eI4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a6i6c6mS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KP2qKast; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a6i6c6mS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KP2qKast"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EA4csi031137
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 12:10:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pLqH/GebeX8XetZGWa3YKFR4lqTlaN8viFswgEzGi7M=; b=a6i6c6mS4OSg2Lmw
	QXIrkqLzjhvmCWZNWjzEtM6T87CgvdwuIcsHbVazY461bM/r+fY7zT+nINbqTdQ/
	1EPRqi6BJ4pdEXnbxXHrJGWNvR7JaqP5PV1ZRUcveNo7R1+AD5t6Syw6NKLJqz0r
	nCMK86SFEdrI7fh9NVI2+pwrlWsgA0qoQ6+7FJboaIqbU9HN3U1qbZofDhNlyPXf
	7lIDUvAWbknK2Ks3EbNPVHefaR7X6X7LLIrpIe67dnzo755xcwuSbSb5zlXfygk6
	jDwehGKuy4GXmYAvoikzTbkoWT5IivKnegMjDU1DQJTeTLWvUeIOd7/xU653pOzS
	pEphqw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhkgmgbyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 12:10:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d59968444aso156686685a.3
        for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 05:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776168641; x=1776773441; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pLqH/GebeX8XetZGWa3YKFR4lqTlaN8viFswgEzGi7M=;
        b=KP2qKastHexwoTUoekZgPu3FYVuNv2OSyr8woJNJ3bnI/z4/iyEy/MLX3C7ueJofuY
         1e8padDsklIHGd//Svc51ix36lDHFRenO/B53M0hzMmIgYwddG2qD9OC5ifUowMf+ziH
         +xxJSTvk/iKsAuem9Xnv5azd9jVZRfTZq+QKJ0SwvGXtdI395H6LMQCiGmD5aF/U5dp1
         /+kEbEfFtYhzAkDBizMcnzsI6XkjX4KN5wPLZ/A0Acf4M0uN+kK9wVEdqr6UeVXd9Mx3
         TPgsdRvsy2M+SQ69ZnMeKkC0Dau3dsXSEgnhvl703ZHHke1J7LFeNu/m9KAP39hiXHsc
         drPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776168641; x=1776773441;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pLqH/GebeX8XetZGWa3YKFR4lqTlaN8viFswgEzGi7M=;
        b=n2QfOvCablKhhJlUDCzaBhTpgJ0soeWcvQtqtWRr1NT57deO3/wO5atZnwW6hfs45n
         AENGUuJ/hYHZnThOZkaxL6k2mDBvmJ/IvDTdFGQaXyulseKT138ZhN7sqr40okVtMOl0
         BH6OxeTldOjWWq5lKrOWp2ELxIbjlYToZqKtvJg32hxmVTIdGbVWYFqxgwxMD1Waq5Ng
         bFzw2Hpk7Uwqt2IWc482D0amb7/Ob9tOJ8qBn2OOIQouTvC9ysPZ0ZCle/W7Ecs6tfUP
         gKSg5UtrU2FTMvnj9C9EPAIuRujlu6QI0/5RkT6f+KmTTkuxv6WRlmMQkEcLzWG/tfkG
         gYmQ==
X-Forwarded-Encrypted: i=1; AFNElJ/wogy5OCss+kvmKV3pvBE6FwWv15UEqhO5D6qNwE9NQxisLQ0/xa6N4zcVJMGj0FkiIizK1xqBDfw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBCl10XiXGYjGVRXANMCFGGSyqgVYYfyzRWN//A1w0MrXitEyx
	Ur8aAaL1eMsxa75odpWV/g8xEAmJRM1X3Q3y/vALWUFpe7nJifOGQswLAQFfrxB8F8MGseXF7Dq
	GWUJsz1FxDhJAn8PtF90WuqSQlAqyQkIwe/07SH2FuyG1tvtpn19Rzg2N2lIJK4I=
X-Gm-Gg: AeBDieu8innqKz+jsssaLJEFPXZDSXUx99v4zU9kh58DjHioZom/CcuoIMruZhjELDz
	G5rDIp2KhttKtGMKLolyG5LHnaKM+UaRTJNH+6V7Qv7e0qtD/pFJen8ss8A2GvplzkBK+OHqT7D
	6dwKeh3m66vDfSf+GfQd1MOPukIvLGLDzOMYlBkeXmU1LMPAaAhlZUdaIZgvQGri4/Sdzg/l2Jq
	CRStWH5yPTgpDxTPfRL+Big1SSoCugCtv7GwJj8xqgjRTzEyEwVe4deVslwQ3L/qGFsEj8eOZDC
	AnbCdba7EwJzlda4tWt9KBHYYEI/278st0NVc9iYl6iMw1cpyzVPRFC9h2saKc/4ggeyUezEZQw
	5CHoR3IhXCoD0VtHAUHmlaUEREtP7eT3Yt6AG3V4dy77RsSWSkp+8uE++hAtZA2ST85w0x3tBnc
	K3TzSV6lA//9BYvw==
X-Received: by 2002:a05:620a:19a7:b0:8cf:df8b:1e6b with SMTP id af79cd13be357-8ddcd21924bmr1593534785a.1.1776168640635;
        Tue, 14 Apr 2026 05:10:40 -0700 (PDT)
X-Received: by 2002:a05:620a:19a7:b0:8cf:df8b:1e6b with SMTP id af79cd13be357-8ddcd21924bmr1593528985a.1.1776168640050;
        Tue, 14 Apr 2026 05:10:40 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67070815d27sm2975846a12.24.2026.04.14.05.10.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 05:10:38 -0700 (PDT)
Message-ID: <42977e71-f6ed-4ba5-9616-b1e2ebe2a1fa@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 14:10:36 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: camcc: Make Titan GDSC a power domain of
 clock controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod.linux@nxsw.ie>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260331140142.892579-1-vladimir.zapolskiy@linaro.org>
 <20260331140142.892579-3-vladimir.zapolskiy@linaro.org>
 <70042f4f-c4ef-4185-b0c6-397d27164a32@nxsw.ie>
 <2dfa4af5-d3c4-41ac-9762-0a9101f436ee@oss.qualcomm.com>
 <nr6ziek4s2mulvnxyvy2v67zniy7ftyuwwgbqgpuqiyc67arg5@756dyguscmjp>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <nr6ziek4s2mulvnxyvy2v67zniy7ftyuwwgbqgpuqiyc67arg5@756dyguscmjp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDExMyBTYWx0ZWRfXwquieg+yiQ96
 sj42JxQgv2v/VMNV/SxRWu+5+OmxXDil9VSNwBcdJ6En8ZD9ZMhgPYf0hD7a27CFXWkhvMF1vQw
 5piqKEYHOy3FjNq4dcKiAavuL8foNUAoQMu4Ts37BRc8XnUsMn52NSTBpKZYbzfzelIDMAyQD15
 75hOBeqChCtbipG1J3w8QArIJb2M7AeRTC0C/DZYz9x4WvO0GI3oij5AwYZa1wJzMvgwD9HUsL6
 b6seQV1QuBCo3twj9FeamFrkNKGrmPqVPFyH1JCWChmQOj7HRC75jo7LYqfe7Au6qKrIEMeICWe
 8kTiHpR9uRTM/24Wu/SmVnVUywiHBMkX9nRNn9uwBtACAz69MaFW1f+H/QwUKA5EA1DXXzFb4q4
 54SQ94Hp3DUUTYnULfIlCUgYBuyzA+S2jdLTI7fxUcuO/m+O+4i4CQrM6MzCCiMQuPsFhViq0Z2
 CE8d09hbS8ZMZYaIg6w==
X-Proofpoint-ORIG-GUID: 8MtAatXipeCUH4-TCGpqjcWxyRJzoc0m
X-Proofpoint-GUID: 8MtAatXipeCUH4-TCGpqjcWxyRJzoc0m
X-Authority-Analysis: v=2.4 cv=HJLz0Itv c=1 sm=1 tr=0 ts=69de2ec1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=aBA1A0hji4P6j46pBtAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140113

On 4/12/26 2:44 AM, Dmitry Baryshkov wrote:
> On Fri, Apr 10, 2026 at 10:22:04AM +0530, Jagadeesh Kona wrote:
>>
>>
>> On 4/10/2026 12:03 AM, Bryan O'Donoghue wrote:
>>> On 31/03/2026 15:01, Vladimir Zapolskiy wrote:
>>>> +	.cc_gdsc = &cam_cc_titan_top_gdsc,
>>>
>>> So.
>>>
>>> You can represent this in one of two ways.
>>>
>>> - By making the GDSC a depends of the sensor
>>>    Obviously a PITA to keep doing.
>>>
>>> - By making the link from CAMCC to the GDSC
>>>    The question is, is it valid for CAMCC or indeed
>>>    any clock controller to be both a provider and
>>>    a consumer of the same power-domain.
>>>
>>> The other question I have is; in this setup you have
>>> does the GDSC you've made a link to switch on/off as
>>> it should ? Have you checked ?
>>>
>>> I think you can make the argument both ways.
>>>
>>> - The sensor should consume the PD provided by the
>>>    controller - like CAMSS and CCI does.
>>>
>>> or
>>>
>>> - Lets optimise the representation of the dependencies
>>>    so that the consumers don't need to know about it.
>>>
>>> The self-referential nature of the change seems a bit odd to me but, at 
>>> the same time, I find the over-representation of power dependencies like 
>>> pointless spinning of wheels too...
>>>
>>> ---
>>> bod
>>>
>>
>> Since sensor driver is a consumer of camcc clocks, the associated power‑domain
>> for those camcc clocks also must be voted from the sensor(consumer) side,
>> rather than by marking camcc device as a consumer of its own GDSC. This also
>> ensures all sensor dependencies are accurately captured in sensor DT node & voted
>> from sensor driver.
>>
>> The approach in this series also doesn't work on chipsets where use_rpm is not
>> set for camcc or for split camcc as mentioned in cover letter. So if sensor
>> driver is common across the chipsets, it would still require to vote on titan
>> top PD on chipsets where camcc is split or use_rpm is not set, so it is better
>> to vote titan top PD from sensor driver only across all the chipsets.
> 
> Well, the sensor is not consuming the Titan top PD. It is not wired to
> the sensors in tha hardware. Instead, a proper fix would be to make all
> camcc / mmss drivers inherently set use_rpm = true.

I think this is a hw design "problem".. the CAM_CC HPG talks about having to
first enable power & PLLs, then the CPAS clocks, then the TITAN_TOP GDSC and
only then the other clocks & cores should be turned on..

So essentially, some parts of CAM_CC should be ""inside"" the CAM_SS bus that
was floated around, but at the same time, other parts of it are prerequisite
for the operation of the subsystem, which makes it difficult to cleanly
describe..

Konrad
