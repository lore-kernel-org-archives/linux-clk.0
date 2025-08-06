Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1303628B51A
	for <linux-clk@vger.kernel.org>; Wed,  6 Aug 2025 09:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754473176; cv=none; b=TC+qqqJ3b8DRRwFZJ1rgH7ifKWY/+acTzBFohJ1oXMNko17II/Mg6tiNQ2pN72JowjMF5aeYvC/Ty1lLVMSKfjKZM3V8xXvgqgYf/0k+QMAZFhtzMoOPR/x6N4c7p2H0vvUfQoUaKmivHib4xNjFpCFptvuugAFJwcCu2I1loHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754473176; c=relaxed/simple;
	bh=KPUAY9yBuctZ0Z8DerzHJeY3UR0wctdNL1pgFMf9FGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LSmgK1YEdOoGhiqmmhOC6lxbgqMqJ7M9jGJK29alBJF0Yq92PH89owNdVk9UrOp3gCeEyPa3lZ0jhmHGlriIJU3oz/amJnmW3k84j1yTSsVh34MABIDhHYA71VayddPCl9JPDSeSJrjPRfn117SuNEByod7kfzKCdMC5OJ7iRmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X2HPfkB8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X2HPfkB8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5766A4og013211
	for <linux-clk@vger.kernel.org>; Wed, 6 Aug 2025 09:39:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WCps6Q8o0qeIN9x4RG9gyH4kGs0jBz7IAdjztQ9kO94=; b=X2HPfkB8gVhHoZ6X
	UGaSFjr40YUhmfkdL4cLflWksihvaSuZuA+M+fOXSzmGxb5Dnktg6f4GCr9OHlM8
	7ebYcTFyPrD0xCcDI5jXIILKeeU4DxTzoYtBCARZpbtJUXFcdvKGb71dHTjmlAyJ
	QOmK3B5uZl2eJ0YxPQoMGBPS8ddsERKtfTuM3reV95xJIJcTOYhG7cg6x7nSrLxo
	hAULLyaMzsjTT7tnqKGNn9VvlIqu2P08tozXe6oJip1ixW5arBYeLzhF7ERYDEkE
	6FGPvZZuaPuPiQd1oXBZJ/XymdLcLFUtz59/kSgzfMyUEOFHbkCRM2GGG3xsAFBi
	tsBCnw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpvvt728-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 06 Aug 2025 09:39:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-31f030b1cb9so10060768a91.2
        for <linux-clk@vger.kernel.org>; Wed, 06 Aug 2025 02:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754473173; x=1755077973;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WCps6Q8o0qeIN9x4RG9gyH4kGs0jBz7IAdjztQ9kO94=;
        b=OhX9/Q5U/x+x7ld2H+JFKXIzot8ZwqF/emSxCtkI2yReJZjeD6syD0rGT1qN5blHDV
         p4efxf+NJ7uIuSgUdRQZvLqKn+nspgXShJgFQPEbECK/K0JXjavbp9AEZBKnN14YhUvS
         4oNUkE20gAe0FaYKTzqr6AGPsvpP+mD+2X7i5/kLQ7hLCGDT/QN1nsuQ3JSAfg8Dj3QF
         KhEj1aqcae6ptgN2r1jK8wXoH+12MsWee6zD9NXAx8PqJS1fniqlNkIBeIxEpt7CpP8M
         0byVg0LX2UUTAWIGCADXz7/Pk6U5b6fci4YNwAIKJ757wTcch1b8bVnBXjSmyLfZmXQO
         VKew==
X-Forwarded-Encrypted: i=1; AJvYcCXD3PbPSANs7Yn0XZqwM17iXdArLWUwY6ZgOVfREjEcKAhaATd3VxHoMFaoxfsqlsA+ygZ6pA2SyrU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8wqJwvu3DCIlmU/2f1zwQhH+6Pw4uaQ34jseHV497D1adI2xE
	wzFLcbXm93+sbU4rYq8gQws7KF1VttCG6QxZLpHgywCfOCvlk+JVX+VJcHUzksJqZfI3ie0WBnL
	k/lDcK0hD0JQhZRnqe7TqF76AHQIihULSC0k4cWUJBqlxf2c7H4n1fU1aaMp/r+E=
X-Gm-Gg: ASbGncsD+lh9AasW5zQSRRM9rweQZZs9j+m3R/6OcZL+xS1IBuF6bzvDl/nEszP/O50
	P9sfQ7iizpBkowcyaUCbH6HnwcgeSYIExgEhKOaA4aGAKXW04vExpoVUfvXJOs1MCkYhzSJC/nc
	F9QsSvwgUcEndEKkMppcwdjBWIzPYWmdjHAdM9+1/Ih+3zfVoXeq1+pOGCib45eTa9QGZw4sSeJ
	uCVbmG8Q14MrxwjL0AL6YDFW6K6KiVfuWK0oD7Wfy6cbph2OTdH58g5ucGgwNwFgTntJ4vWJRcA
	8BZBHhLuknUP/dAxhAfsprRQ5cS8WbXBiP+2sko+sWUSl3Q7172cX7aosSRnu+C0FjM=
X-Received: by 2002:a17:90b:1c85:b0:31f:6f8c:6c92 with SMTP id 98e67ed59e1d1-32166c2b18emr2718167a91.11.1754473173336;
        Wed, 06 Aug 2025 02:39:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUleDTUw5OyRyFEFXLE2Lpb3eq7PVabmsgBfWwCw59gHI5xkfv+3BdVifFFhie4I/XngwJ9w==
X-Received: by 2002:a17:90b:1c85:b0:31f:6f8c:6c92 with SMTP id 98e67ed59e1d1-32166c2b18emr2718142a91.11.1754473172908;
        Wed, 06 Aug 2025 02:39:32 -0700 (PDT)
Received: from [10.217.216.26] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce6f61asm15015166b3a.3.2025.08.06.02.39.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 02:39:32 -0700 (PDT)
Message-ID: <db8241b0-1ef3-439e-8d74-a3cb86b610ba@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 15:09:27 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc: Update the SDCC clock to use
 shared_floor_ops
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250804-sdcc_rcg2_shared_ops-v1-1-41f989e8cbb1@oss.qualcomm.com>
 <bnlnz6nz3eotle2mlhhhk7pmnpw5mjxl4efyvcmgzfwl4vzgg3@4x4og6dlg43n>
 <c54e8ac4-9753-47bf-af57-47410cee8ed7@oss.qualcomm.com>
 <d6a2937f-7d63-4f17-a6fb-8632ec4d60c8@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <d6a2937f-7d63-4f17-a6fb-8632ec4d60c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0UU89cKEICkSx27lyqXwBK5AhIBjfbbT
X-Authority-Analysis: v=2.4 cv=GttC+l1C c=1 sm=1 tr=0 ts=689322d6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=_mglsAVLPU-HLNVybtwA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 0UU89cKEICkSx27lyqXwBK5AhIBjfbbT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX96gXmath9fNk
 IXZaotxI5G5xUxwvzsTzGTxXOEgolHTvUVL/NwKRxNM9/tVn0vZgFUPjZtKQ6S+dQcPawAu5jXT
 JrVHq+uZCNFk1UhCDPeaK5tSIvsLGWWMF2q/Qw5lZIFy1xVFdLhUibaP8pAn/YipXjLd37LGbx4
 XU3pa6qVx7QX34isxZgtu+Z5tSyK3a0NrIAKAt09uxb93LbepxOxPNunZnRdHmFqt3D/jMHmjcq
 LXHncz4f1rMkFsjf/FhWc76iQFanjLjdDnwmHJ77FtAR4Tpyju1ZYDjvtNw37E/U6SnXWnYE57h
 pT/bDm45SDLzuLjmKsNb3uheq1jZSMUd1t7LNQ6FrnfSJ4FHgZ5JmlcgucS9UIlpqFU0EAD8z9X
 1wiMBnuf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009



On 8/6/2025 3:00 PM, Konrad Dybcio wrote:
> On 8/6/25 11:27 AM, Taniya Das wrote:
>>
>>
>> On 8/5/2025 10:52 AM, Dmitry Baryshkov wrote:
>>> On Mon, Aug 04, 2025 at 11:59:21PM +0530, Taniya Das wrote:
>>>> gcc_sdcc2_apps_clk_src: rcg didn't update its configuration" during
>>>> boot. This happens due to the floor_ops tries to update the rcg
>>>> configuration even if the clock is not enabled.
>>>
>>> This has been working for other platforms (I see Milos, SAR2130P,
>>> SM6375, SC8280XP, SM8550, SM8650 using shared ops, all other platforms
>>> seem to use non-shared ops). What's the difference? Should we switch all
>>> platforms? Is it related to the hypervisor?
>>>
>>
>> If a set rate is called on a clock before clock enable, the
> 
> Is this something we should just fix up the drivers not to do?
> 

I do not think CCF has any such limitation where the clock should be
enabled and then a clock rate should be invoked. We should handle it
gracefully and that is what we have now when the caching capabilities
were added in the code. This has been already in our downstream drivers.

We can add the fix to do a check 'clk_hw_is_enabled(hw)' in the normal
rcg2_ops/rcg2_floor/ceil_ops as well, then we can use them.

AFAIK the eMMC framework has this code and this is not limited to drivers.

-- 
Thanks,
Taniya Das

