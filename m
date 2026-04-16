Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4DB3921FB
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 08:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776328602; cv=none; b=Qqmm2xNqFHTiwGfZsABxfQVJzIvJkrZz/+7A9kVtUhLwEOEcZJbf3UdLS1AseHdx7pc1/B+KdYTeloNxpT+BDaV+nTh7R7xZiEZbtq5dF+XLqLSrGw4F/K90xXhVfT8HeBwE2x0mK39zvqMu7UcWwioVZZVBLozRHpXedgUmKO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776328602; c=relaxed/simple;
	bh=m1eKWV1XbG9JkAQSDkCWbRAmj+B9hXNU+brDRz2uqf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bU9e//cuW6fJl9DdFBrXjL5ZPydz5vurad51dI0ucGUzQ3xX4MjXcdheZKzZStE4knL3To6HcBMXNgyLmMlxaX/2KyMwD/udp70WgVZfEnAeLJM8VJbYyRIyde2Knm0JUWI93Ucdfq6Carac0Ihgt1UwD0wKIQqAS2VMXNUeOwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dmX+Ayj8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M0gx3v4V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dmX+Ayj8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M0gx3v4V"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8Y9UD1702344
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 08:36:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	31kBwLM1kadgQ+2H7g+1iUE6Ek2xahsyyvsPyfifIvE=; b=dmX+Ayj8y86knZ3m
	jM3PG1O3nfaHUU7u3bDEfm45YJFmx7ywFo1k49zYUl+qU90gX4GH4apc28p2rylq
	krOCIqQmW53GSr7SsXg2aMWQfxPjH/Jl37qPMLMj1SwK5tHE1ULXlJ3LnWyLSjHc
	CO95U8BNA97gOjRUBpdP7ADJnyBabQdqXCnTZbI7WJhopgqphm0+fb1vvN5z3KSO
	sr3jVsorw/pZiz74bvyD99FccTkTbWSgrYha0lVpp+lOqXUYEZawN/eGVSVz9CNE
	wqConRzMGbs+2TGWyWa5Nv26GkM3+gNMTOlHTSJMEfm8JpETcdHGA9hLk4FGIdR9
	YUIKog==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djdamk1ax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 08:36:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b52a2d70cso131584551cf.3
        for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 01:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776328598; x=1776933398; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=31kBwLM1kadgQ+2H7g+1iUE6Ek2xahsyyvsPyfifIvE=;
        b=M0gx3v4VayKEMoa8obRLzcAGvXQCfuMoLe6gzm1ySbBCMSKeE+oUZwGppxX2P/MShi
         cmPAcuz2wzw8fOVVCdwlIEgsfSzYKVnJEPFkZcJW0VHPYZWQISVUYSA2NI5m42xx918C
         UjlMoHodMUIP8BR+/FJf9IzgmNG13T8MnDexwNnj4BUjEHp2koQ6DTJxDW1cevT7edWa
         J6XT663kVH8UypwFzkME033244wtiFL9ZzLNlFurMabsL9Su1v95uJIcPysFjmuSiBG6
         OzccibY6Y9dxxSHcwoDao91iTTbvFjCjiurP7Kha357E0AfQmpzdPEMHkGAVwHuBp1P3
         Fidg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776328598; x=1776933398;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31kBwLM1kadgQ+2H7g+1iUE6Ek2xahsyyvsPyfifIvE=;
        b=Wu8d5TAn9Dk7Cuy9ORsWAU2OeVlc+jaymgMq3HBcCzlrBAsXK6K3u3IYpNJpIzwB1y
         w9eHaNlIpYn8e0F7O8oPl4tXSigwCCbLfTv5vO1TXosp8QkGHINXSpcUkMroXq3r6f3A
         kEDz3fEG0Fwm3r6kCIp6ZIuDkss8vz8WLP6v2W/ntm8Ojigi4DFwIPVOEpxz+vxaWpY6
         FCcGqCZxQHSEp+4PvrmlCsOYSmKW41+O1tlMVBHU6NBL5DFQUyZmgzyAGYxc8gxRekpk
         VUMEaenNt2Au0Dk7weOTUnlyPvtHHA7K6Xg9XY/ycI5TuRG58WyzEtkvNU3/qNFtQXmL
         rF5g==
X-Forwarded-Encrypted: i=1; AFNElJ997M5sMbKVrlidYP6HTMTEKl1as9O/q9kIn96WeVf/ce9bsWAtp0zpAG5/+xQm0bXoTfm2ovEofMA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMtrhwQBdODs2tl0HBAsNS7jmGu265ByqFSx7nL7iwF0lMcYIq
	AaUtH96UZBPboy+bp9x45J7OFj6L0oslg02XDdUw2dN/OwTuUdJTuo0e8w6CfEEkN7brfvQ9e/z
	wTglibHM/HpvwWW80OVE16/ZHBAjyqFI8AUNMg1Czl8K8HIf/6tyevtRE6+lX1UU=
X-Gm-Gg: AeBDieuw1QQepoZQLr1OPbB/I0D/s3ivnxQ30POm3zj9bntBcpMbljMlscDC/QuCVUc
	NelxznDf0Uu3wZ0RyNt4QhO2geoptZXRLOdLmiek/pYFcYjWS7UFwbIBAZVSUieEIeIut2zk54R
	BnOZqRyeLPxwYN6GfAcpuLe49szHwzuRe8rlaXsyj23TxigAk5U0Jvl6gYWgpOmskppsQwbdQxm
	pSm0pmhXYkVB4oJ6hgL5XgHBLDE4QChZhRubQipnCOfX6wAJjp5K8gSJZPSAtF5Ck/XPw/HVhu+
	x570cjNIVU9v4/4GnnSOSzhS45cW72nlsu1F3Naxa5aZE/OU4SZw9FxUc8IdKcsLNUZNZ+kVXkK
	KBeuRKQ/h5PBMC+KelDID+rsi3GfVE9mUCDhljwuqYdpc0s6Z
X-Received: by 2002:a05:622a:6105:b0:50b:37a1:a012 with SMTP id d75a77b69052e-50dd5baa73emr342015771cf.41.1776328598289;
        Thu, 16 Apr 2026 01:36:38 -0700 (PDT)
X-Received: by 2002:a05:622a:6105:b0:50b:37a1:a012 with SMTP id d75a77b69052e-50dd5baa73emr342015571cf.41.1776328597844;
        Thu, 16 Apr 2026 01:36:37 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f0e9a770sm39629705e9.19.2026.04.16.01.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 01:36:36 -0700 (PDT)
Message-ID: <a19a487a-a896-41fc-bc5b-1476e2b5dfbc@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 10:36:35 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: Add defaults for desired arm64 drivers
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260416-clk-qcom-defaults-v1-0-579e75c4cfe5@oss.qualcomm.com>
 <20260416-clk-qcom-defaults-v1-3-579e75c4cfe5@oss.qualcomm.com>
 <357baf04-44ed-4d79-896e-16b7063fbbee@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <357baf04-44ed-4d79-896e-16b7063fbbee@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: o347pZn3tlqLRHpDV10WTK0bycW-d_8r
X-Authority-Analysis: v=2.4 cv=HMjz0Itv c=1 sm=1 tr=0 ts=69e09f96 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=h4EKaKpltBf2sQIMoYwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: o347pZn3tlqLRHpDV10WTK0bycW-d_8r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA4MCBTYWx0ZWRfX/lzmvCB8XAal
 18YyrkdStEAmZI21BqTtxFjnIiQyQDfieKyzRZRvsWfBPTvr+MVqJZIAzw4ERk+fxI/oNVt42yi
 KXXvEC6Tgr2kYldaVYmGFWvQLeQ5oXlHgGIGfxh0gZQF7UjfVqbc388m7JEP/CHo3BtCbcISkAM
 50Nh77KZq/CX/0mWvTJqz7KOrhnhO6gdEN7rCzAtuejHbSYzVy9JXQtrJOkVZdTTGW1ptimpgmd
 s85F6ZRmNvTz01sM68gN1A8xQxX2vQ32s46XwcIdMiJxKh5INKcOALOIoDyGfKGmPkeJT9p8Pat
 YZjkhhv5MFwOsxro+TEgMDVloh5W3lqAlGBhQVjgV7OFhB+hUkiZWjBTeNq4b+JhnNPcmunQsmn
 1CcxxGkv/s+NkcrBbUZNa9S0i+/afXCFD0UsfosZ7qcfy3iumVViSnmVTeigjB8Pzzi+rHS0IIO
 TRMWgMSNk+1SQVAlseg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160080

On 16/04/2026 10:30, Konrad Dybcio wrote:
> On 4/16/26 10:10 AM, Krzysztof Kozlowski wrote:
>> Clock controller drivers are essential for booting up SoCs and are not
>> really optional for a given platform.  Kernel should not ask users
>> choice of drivers when that choice is obvious and known to the
>> developers that answer should be 'yes' or 'module'.
>>
>> Enable drivers for upstreamed or being upstreamed SoCs, which are not
>> yed enabled in defconfig: Glymur, Nord, SC7180, SC8180X, SC8280XP,
>> SC7280, QDU1000, SM4450, SM7150, SM8150, SM8450, SM6125, SM6375.  Note
>> that main GCC clock controller drivers are usually already enabled for
>> these.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>>  	tristate "Nord Global Clock Controller"
>>  	depends on ARM64 || COMPILE_TEST
>>  	select QCOM_GDSC
>> +	default ARCH_QCOM
>>  	help
>>  	  Support for the global clock controller on Nord devices.
>>  	  Say Y if you want to use peripheral devices such as UART,
> 
> So Nord GCC is "desired", but Kaanapali GCC is "important"? ;)

The difference is only what was already in defconfig thus which change
has impact on autoconf.h.

There is no upstream user of Nord GCC, thus I would not call it
important yet. I predict there will be such user, thus it is desired
just like every new SoC.

> 
> In any case, as far as I'm concerned patches 2 and 3 could be one

Much easier to test impact on autoconf and resulted image when changes
supposedly transparent are really separate.

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Best regards,
Krzysztof
