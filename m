Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1B831E84A
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 13:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773235968; cv=none; b=Yz6L6Sct9O3E7pcO0bRRWauRQ8xEGk3tRx9RSQDygoU/CFPT2H08idRQPISGH/RWXx5VHaLHFtcIsQIBo+wDKmvKNpqKcEtNNdOTPAIrzkzndj2RuWiaQZIM7L0ZRh+dVMqTxCZA7LussiWh+aKwo42jddEUdyPFpL1mGHcjiFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773235968; c=relaxed/simple;
	bh=06BVbhAZRGBJpMxcbTYX2ksNO6v5Cg5XShoIx0wb6bs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t/A8gCO7stKd86k1EXUwR9lMSbMnVEl8I8xmnwh9zPmNas7ix9guIz7qWssKA6eD13pgIPOtg3lFdRYnGXIs0i7OTpcWA99jd+JFHaSH/fchHBkX+BrgArxz8ir1wkfBXYtCkYhBlPFdQDpAUIxZZN5Nbw8IXa0rYqXFu/djR38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kKnOlE8x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NPuQjoG3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kKnOlE8x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NPuQjoG3"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BDA0fn2030923
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 13:32:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Ho1qFksr3mY0U8ar48qPzfMR5m6oW20Himw8+37HaQ=; b=kKnOlE8xPGQRN1kw
	Ko3INIQwX9M6Fmrb4rkly4UKEL0yGdiPSfUaisYvs1+igol1EqYKqpI3PVogLiyc
	WMaNNKhhftFN5Y2WzVODihSXw/iIL3ML8nGe66Ra/ZwxEOmWYkl2jT2gKNJgV7Js
	nHECuxP3dF00MCTU6eM7GI0V080KwDXuFz2RyVadtAuYU9d6AnQ1RmI0OvdR0NbJ
	syOIF1kSMRpdaUtvljSYYsLJnMXCGosGjSE4IOlh7OHabayf4eeVumgQEldMfLdv
	wc9v6/Lw0buH6XqfOGb6sUQhGW2i8Ysv5LlRFcy2Nk4yTLSJ/iKkma5y+FtrT2Ws
	Pl6Q6Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu40h1b9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 13:32:46 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5ffa8682a68so1366197137.2
        for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 06:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773235965; x=1773840765; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Ho1qFksr3mY0U8ar48qPzfMR5m6oW20Himw8+37HaQ=;
        b=NPuQjoG3L1prssUoAtCocoSc3C2Ei8ibFZ3zK/WwkN0qpzH1L/iuESrgiQFTbHUGDK
         3ovLpbc1wRec3ZtoWBjB9hPXJuDMptwFRSXU0wFcmnfJGQAaNvQvCdxxyVdH9FSDWHO0
         bEIgn30lFyH31KIqH7SQ+9MSK7wQ0wMInZKD2+21eGCLiEcVJCK6uB1rI080nENlaOlP
         WNnBZ4H/sHqxdrXjqGQXv6oyprVWNoxf4P7s9Zxl2JO3cGa1rzoT0hfbY4u8kSR8fZym
         r+WLxi3GS4qt+jdEyyom6otSlF4Y+QLLvQBA44ZYF/bRiRdC3jxqoFp1jkZH7hleEpJZ
         1+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773235965; x=1773840765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Ho1qFksr3mY0U8ar48qPzfMR5m6oW20Himw8+37HaQ=;
        b=kJMWDEWTw88NSZrs3RyH/4xDEwUCKiTUY8AVjDDyUIohz8My7QYbkwLLwJppxrS4cG
         0eFMR1m00C4BWn/nm1XX80K276jBqoBQvHlx8L+40NQMb3gPb3yMR/oYoxYLm5bS3Zuf
         68nLVSNSzRz7qztc/qLFhxe2XPVSHCG3YmOaYPVt6XKWnImuXrT41YgKxkhG5cWqS/a5
         pu4wL0YrC7dNoW/BECavIkK4Pbuf3/Lc1gGskouNmQ5HwHOEtJBocSLwYkdYeLIyXVoz
         K84tfDL5SXUxz9P4p5NhPalv+Y7/0qwQDkCW2MhT39L/xribdwYN56M1aKeJ7tCjGnTj
         1DSg==
X-Forwarded-Encrypted: i=1; AJvYcCV995KML7kuHNAqpJ245ryRR6mVFBu7zqMCoL3tMQCyMiOEgzyr3mmR0hO8t0QosEfwHWzkMo/KRnw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHEj567lUX+TCvFWHXDbrU7NtsMqjJKmOqJ/3k9OJrs55Jxgsp
	F0sKmLeyyRSJFKypi9JfxUxtz5Bn/kvHtcG97eeBftAC3t0RwqkMSCJE6H0bpNp4F8zQzqUCjQD
	EaZ+LypmOq2m5G8IVxriv25t7J8knBkzu99Ywd5Lf8zaqkVEoe86xrL75RvW+oiA=
X-Gm-Gg: ATEYQzzDWqEg6YUSmCTD15T1wD1Op3KT+T7hPLw39R4qhU4DaoIxpKKXLjvZQ9CQuaq
	+T/higw6zT5i4BTDUvygM4Ry1znr7SZIX7XYAQ2+0v9r6EPRRqi7AHVRdW2lrndowb0afWxOFMv
	ovB67uUbnmWJgI9fMsyGIz2/aO6CX5aejo1bEao9B7+p03KbrbAhZbi5DpayA80zy8GvUicme9b
	XsjdT2PPAtmK8VXQqhC8AE5P1qflOZCh5ThaxSRXnm5iER4C4s3HI8iF1/ZryiJOOLVl9TW2a9R
	KXno4VfuHbn20WqcmrUXTTQTpglfGJLVIU7ZOwf+aGgEUuZ2bH/WpE9XHW+HgPNqKGjIPAfuZt6
	MMyXty4myILRgU48w6ubRmB8PLeVJaZq2VpUBBc2i19K2H/+8HSICzmN1atq55Ws8BmRaRmdcM4
	WvmNQ=
X-Received: by 2002:a05:6102:440a:b0:5f5:4188:eda8 with SMTP id ada2fe7eead31-601defefe49mr360633137.8.1773235965426;
        Wed, 11 Mar 2026 06:32:45 -0700 (PDT)
X-Received: by 2002:a05:6102:440a:b0:5f5:4188:eda8 with SMTP id ada2fe7eead31-601defefe49mr360625137.8.1773235964982;
        Wed, 11 Mar 2026 06:32:44 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972de4847asm53985566b.21.2026.03.11.06.32.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 06:32:44 -0700 (PDT)
Message-ID: <d2e30b43-75d3-4c53-af26-4761cc093a56@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 14:32:42 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: dispcc-sc8280xp: Don't park mdp_clk_src at
 registration time
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260303150152.90685-1-mitltlatltl@gmail.com>
 <d90cd589-8a0d-4e72-82ae-7e78dec2320e@oss.qualcomm.com>
 <CAH2e8h77bpWvSdYu2guC1muz2A99+cPtWZyUGNKVOeh3J+eygQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAH2e8h77bpWvSdYu2guC1muz2A99+cPtWZyUGNKVOeh3J+eygQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDExNCBTYWx0ZWRfXzi/cvD/CqWQn
 k2hb+z8y4R21QVZPiRTrMCkBpKUllHZk9bm7ayhQTWf7wvIExZYUT90Mq1ZV8uc+K75/ZioNcH/
 XLN/lx3hWIUqglNLrNtZcEkel8GQ0tPHDzNjwC/fLRS1xfLi6MdJO6HVXQEs19mKCxQufgayPWl
 AJ2n98roPFg4axPMvWAD6OcJwfNJT1xmUxeHLloV1jV0BM8IF/NPmF2Zc3IfKiZeDOokKqEi6Qd
 P6O2m19vnEJ9Ju9RBbOspl+N96SMaE+/azk2jO427fcWGBG3zFnwg6pjGtRItlYd2/rbb2273cf
 zNWwfMPvRKmGrX9yITtVTEgebFw3QG3K0SvefVKKhnsS5qtFetPMRitrJgZHQe4IPQQ9n/8l54c
 fewt851E4EIzHZDCZQZ8oN65OTDctSSgTqwRd4+a+ZoKql5XZiyrmah/1dSM/aYbI4KIgOl2HSv
 9yn7yO+avXTj92cdeXg==
X-Proofpoint-ORIG-GUID: 915g5a-qgykXxjMtgFJCP2Kx6oXFEyIi
X-Authority-Analysis: v=2.4 cv=YJ+SCBGx c=1 sm=1 tr=0 ts=69b16efe cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=pPfQ2pD1zekkjLI5SAYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: 915g5a-qgykXxjMtgFJCP2Kx6oXFEyIi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110114

On 3/4/26 12:54 PM, Pengyu Luo wrote:
> On Wed, Mar 4, 2026 at 7:20 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 3/3/26 4:01 PM, Pengyu Luo wrote:
>>> Parking disp{0,1}_cc_mdss_mdp_clk_src clk broke simplefb on HUAWEI
>>> Gaokun3, the image will stuck at grey for seconds until msm takes
>>> over framebuffer. Use clk_rcg2_shared_no_init_park_ops to skip it.
>>
>> Do you have clk_ignore_unused/pd_ignore_unused in your cmdline?
>>
> 
> Yes, always.
> 
>> The sc8280xp-huawei-gaokun3.dts references no clocks in the simplefb
>> node, so if you're unlucky with timing, this is ""expected behavior""
>>
> 
> On gaokun, if simplefb holds the mdp clk, there will not be the early
> framebuffer, I can't see it. After seconds, msm initialized, the
> display would show logs.

I'm going to assume you don't have efifb.

Is there a chance it's because simplefb is waiting for dispcc to probe,
and by the time that happens, msm probes right away?

i.e. it seems like something like

https://lore.kernel.org/lkml/20220806163255.10404-1-markuss.broks@gmail.com/

would be better suited if you want to get logs early *and* you have a
panel driver that works anyway

> 
> Once I owned another sc8280xp device(Ntmer TW220 aka robo & kala), dsi
> didn't work at that time, to bring up the simplefb, the clk must be
> held and no parking. gaokun3 always requires no parking only.
> 
> BTW, I can see this grey flash without simplefb too. On x13s, if
> building msm as a module and not putting the module into the initial
> ramdisk, what happens?

Do you mean that in conjunction with dispcc-sc8280xp present in
initramfs?

Konrad
