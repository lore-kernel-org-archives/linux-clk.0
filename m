Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F3F396D25
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 11:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773833789; cv=none; b=nri+bmyK6i9hi1L5+WrEsbuhLJtKqntZJUMsh7qBtuvVi+npIx95U34ca8ABckC5SbXQUWU6QLimWJhkhynl90aCjrBh51lwfnW98Vv+SlajA+N+Z3CzLK1ufopzon3h3pXjE4fb+aFCTT9pvE+YxThqtqk8+uPYUGwLaLj4LZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773833789; c=relaxed/simple;
	bh=6HHWVybq0B6lYWd9+iWN30dQUWTovV+r0fcvkzXr0VI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C/CWz81nw9rAkM3GFQQhtwD17sGb7ecVE3u23h8i/EJDdjeWDsdmu7rdguMrTn9AvFvoWqb+eUO81PsQmcRhuFTRd0WWwH3LfxxAod9pLBO951AW/mCvFZl0ot5J6x0T3NQ6C4PRtM98FiAJ6TMnZfcbF2LHHXvuMWSVUjAWgI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=olnI2wtJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RkV/NOwn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="olnI2wtJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RkV/NOwn"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I8wZ5Q2730113
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 11:36:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yy7Z1kHkosnYj/2AM+aRz7vi1e+/TI88w0bNr9oWboU=; b=olnI2wtJ/VDXYx9m
	Nre6qNntujuiZ8ABiE7iWGonOESj1jqWzaRhue54BaASJvac3ck9F6Gi2PPkhBIb
	Ct6fO1pvNVmyQOU8BQ7COT9oYVe6PHqIRDTNTce7UShn7Gl2w1W4G4jJtRgFXNlL
	n/JwT9gTc0BCrYjr/u+oKYAZKFX6/jDY7NJtuJTNsejSCVGqfvywBPPlFJGOcrRe
	52AdOlFQ5LSYTw23qWN4eQgQ8Kmw9oPXwrElJyU8nPZ0EUOv3xsgTW4DauoOTEbx
	FLwmy7ZhaMDxvBvfhvxbmrd5w8h84s5acy9Ju4lC2w6hT+HLWN7expSZ4wpUALdo
	hMKsvQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy8kjvm36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 11:36:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-509181cc6ebso18556761cf.2
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 04:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773833787; x=1774438587; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Yy7Z1kHkosnYj/2AM+aRz7vi1e+/TI88w0bNr9oWboU=;
        b=RkV/NOwnAJSldVd8NSLHNUzk4Wz29yGfl8PWMFC3nizl+mzGRkzMH3vCVPhKCVVUyg
         w2u9pvnedOofoTadWB6IFuup31GK7i59Vl/NsXGFhfdMCVraZQ7XFoPzrGFiwRpE/tYj
         RkkN+5crrjdgSVNdYB1nLi8k78bNYtNFWEy6uTEpRwd10MM4rKFfsi800IsGjxR/OTlq
         N1tSyQS8SAkb65lXe4u5/Pik370c7KbHOeLSrCXEuYdNt8FKL5WJgLTrQ5HmGVNa+pj7
         0I1mOyg42pXVALh/tTnbzlYUk1Vzirdg73+xQSIvzBiX1WXBWhXa5fd8+1SJiyPbFOQg
         wLCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773833787; x=1774438587;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yy7Z1kHkosnYj/2AM+aRz7vi1e+/TI88w0bNr9oWboU=;
        b=FVTZw1O/3jNHpGgVBwziFMvsNXTR9pGFjyGYFJZMLm57HqsY5VfE8IewRLIvc2Pmnd
         LF2gq/vMI6gMwXTHwERCRy/2YscyupCLKf3LvrtRbMHcZ4CsxUYDkCJUe7+wvI5FFLAJ
         eHnQhiP0uZmiedoFcplm8/Y4bZmTsbooW1qFhhvo8wco2wNZnMbDs3E0zZ0aycq4wEL7
         C2BrEZfW/v2ifGW1uFM1HNhpcb1ARwG/MyA+tRQE3J7H5ShgIZRX48rCQQJRXySMlrUg
         VqsBn1UyuWgj6mLKAKuV1I8NPfUw46KIWEeszfrl9fmPws1UDA26pHZCluoLm3Aq1FVY
         dJIg==
X-Forwarded-Encrypted: i=1; AJvYcCWi3EbzxCjHZ80oPzRxa9WCUyCxCHD9ltW7easqQhPWtEa+IiJKFDV7SzR6TL89YIe9Qs7tU92NM7o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEzVgpp83VF9rBpLcxT21qAWar5jmhOuHTskRZdfGU5chcD1rK
	GvsBjDwtoHbBzXEeWwbRnkWgVBwkN9OqQXlC0eIvVKFAe6JSIwD7HcH9jQhigakTiDAsgLzFOtp
	nGkOcsXqwWIAJq2oTOpU6WICPoy4bTzOUKHpOPIz2HxUe8F2XPvfgtXESRARoQ/g=
X-Gm-Gg: ATEYQzys2F3u6/gzTFEDs0L62PwAGFXtZP0cI/qAUh8voxtiwpg2QZDCPoY7Ceez4wh
	sEztEyP29XfWRoq29/h4ya+Wx6PFNVYcTXm2UxgqhnHL+EvVJtICp5wbYpq/g/57UZ3HcsxEDWK
	dSQlKS2WDHdgIx+uYU0Z6/A8tLO2OTM9I8CZNu5K1Fu9fynrKKTfhW3lmYsK3RLOJIYUdQwfDY5
	zutKLiBq5iSRhrR5EGzu5SW1wvkTNp0sWEJfeE5m8WYv/n033Iegs40DAei/BYzg92WMLNaN+90
	mQKskPWcXr72PI7MrV9Cp8RU/zHJeoU12wMa1oy4VWQN3lzgeEdSpbfm4LR4doQXxtwHG6Xnek+
	usds2yw6fi5oOLMSvHqYcjPoHEJcnOuoRvdeaX4EkeAhx++NZ
X-Received: by 2002:a05:622a:1196:b0:509:1cf9:ea06 with SMTP id d75a77b69052e-50b14889b65mr37680001cf.56.1773833786968;
        Wed, 18 Mar 2026 04:36:26 -0700 (PDT)
X-Received: by 2002:a05:622a:1196:b0:509:1cf9:ea06 with SMTP id d75a77b69052e-50b14889b65mr37679541cf.56.1773833786423;
        Wed, 18 Mar 2026 04:36:26 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856ea8fb0dsm251504145e9.3.2026.03.18.04.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 04:36:25 -0700 (PDT)
Message-ID: <846ae47c-8e0e-4fdb-899d-de679d013fa5@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:36:24 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] clk: qcom: dispcc-eliza: Add Eliza display clock
 controller support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260318-clk-qcom-dispcc-eliza-v2-0-8c05581168d1@oss.qualcomm.com>
 <20260318-clk-qcom-dispcc-eliza-v2-2-8c05581168d1@oss.qualcomm.com>
 <1a00582d-66d6-4325-aafd-156cfacee8cd@oss.qualcomm.com>
 <d2975a1a-04bb-4026-a0cd-34571f99ae02@oss.qualcomm.com>
 <2227a9d2-fb34-4d54-8122-c00f54009de1@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <2227a9d2-fb34-4d54-8122-c00f54009de1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5OCBTYWx0ZWRfX8kpFkEPC/4p1
 czeyteZxS2yN3eiM9RJTsqPeS4z7V2eEpebjEQMHdqhD6MuZo/VXB+w1hlSbX3tVsMUYOvE8YDb
 oQHtfMeL/i5PSW44EuDNzTIHTCa6wBqRGho9Ngh5III3amrFk6e8sraG4YVl9hsHCzhYnXPT742
 6xaq+yOk2ARUA/amJgxi2zpYgUu4FKB7RNt7aOUGdgJXBJHAryfNTHFlU3qZy71VxaL6MZbkqCI
 c9pUQK0YWWXd6tp8dxI4gAi0yCZVOYlDftVbPJZxue/npZNP3Z4bvN83vmgqSaG2fN08VDQtzFo
 wb9Nt+kuAR2UZD9YDfg8K8Pf5DxAbx2Zbao2IZ1e/69rWoR872BjX/co8tjXXVbk+ywAZaT/5rp
 YJK9FPLgaVm0pE1k+epG/T3mMZCrGqmGoTz5uEkH83m2hONba3Y980fZB5ajRxT4dlgaHlr2Fbt
 5Q2ddM5sNrLx3k2iiOg==
X-Authority-Analysis: v=2.4 cv=P8I3RyAu c=1 sm=1 tr=0 ts=69ba8e3b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=BJVpgZEWj_MAxDIDL34A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: yIw0YJhxGOApQK8kBduuIVvT0NqvPTiK
X-Proofpoint-GUID: yIw0YJhxGOApQK8kBduuIVvT0NqvPTiK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180098

On 18/03/2026 12:32, Konrad Dybcio wrote:
> On 3/18/26 12:13 PM, Krzysztof Kozlowski wrote:
>> On 18/03/2026 11:48, Konrad Dybcio wrote:
>>> On 3/18/26 11:39 AM, Krzysztof Kozlowski wrote:
>>>> Add a driver for the display clock controller on Qualcomm Eliza SoC,
>>>> which is copied from SM8750 driver plus changes:
>>>>
>>>> 1. Additional DT_HDMI_PHY_PLL_CLK clock input,
>>>> 2. Eight new HDMI clocks,
>>>> 3. Different PLLs (lucid and pongo).
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>> ---
>>>
>>> [...]
>>>
>>>
>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>> +/*
>>>> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
>>>> + * Copyright (c) 2023-2024, Linaro Ltd.
>>>> + * Copyright (c) 2024-2025, Qualcomm Innovation Center, Inc. All rights reserved.
>>>
>>> -> Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>
>> That's the copyright I found in the downstream code I used in few places
>> here (with modifications) and I am not touching them. I also don't care
>> about these and I am surprised this keeps popping in community review...
> 
> You may not care, but our legal department does..

And your task as community maintainer is to care about community and
Linux kernel, not about legal department.

Legal department can comment here, if they care. You as maintainer have
rather responsibilities regardless of that legal department.

Don't bring corpo legal stuff to the community.

Best regards,
Krzysztof
