Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0051C2F8E83
	for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 04:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779163474; cv=none; b=VyJtetijYzPib7FGqsjk2pPCW0s1jR460Kub5C8JFa6BA33eHPBFl+xx7/vOZT2Lyc7iHGYL1SqlaZiD3cGozfni1joHrkkpc3xxM3UaJYthUflkl4qoW3GZA5aKXdqEYA22pSCZijDK6RZ3OjeNIm8kv3+RnsuqGVRnlDkBF8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779163474; c=relaxed/simple;
	bh=3r0KXIvqch/qW3DQWjqE3BQuHzdblo4BIE5pGliJ9ls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z8x8mGWlDc1OGqHJGCCZSJCr9OvcFQ04MTPHLCRImlZV1jfB4eqLHBlsRBcYdrJm8TrHCXQ98tnJkFSo380v93E2+J9yFDbdXU9ct0/pVg83EyXBN3Fz0Xv1T7TldhI9/T+8CuB9MVpRut2s4nZ2qnqCxNC9jamH6+T3uVJpkag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IC7Pgm1J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jJBRaieD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IC7Pgm1J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jJBRaieD"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J40A1r2083413
	for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 04:04:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xS9AYhs6BDbjLLGh5V14QRqWR+Wq85qVhy1t5hgItDs=; b=IC7Pgm1JUgS9jXP/
	8f9VWCI2RJ701EscmlDPM/6Q2kHZTk8CImVS3tyRyvEi6A6bFriq3Ufyqqa3yJ+E
	/vUdWplIeQ8h0NI6aluja2uG0vGhgIreQ0rJHxDVQ/kSmpcTWk5bv//J1KBetI64
	fdpRh4tLLBNTY2lQ+GCE3AAR+QA26RY5ujA520t4D8cR/MYV+y20j944cLQ0yw2s
	MLU17Fkm3snvJjVeRwyKR4M4lEnE7HzV6/rsIhpHMO1unW0BcMyhrxH8E4QzcVPd
	Bwj00QScAUnNAVb+y4KWiYsmAzM0N6QZis77+2wc7zTsuxNKaFTRkkYcB7iozbS3
	TtXPBA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e81chbddd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 04:04:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-367f715cbd0so3188978a91.0
        for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 21:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779163471; x=1779768271; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xS9AYhs6BDbjLLGh5V14QRqWR+Wq85qVhy1t5hgItDs=;
        b=jJBRaieD5OVgvQZcF/6WWSFKvxEg3tjyqdolfCxewDmNuVRhY9nkqqu7Vhc4CjY/V1
         ewmjBRrGCv/jCowX9WhITIT7jyEXZnAuHCpn8Go/Bu2JdgYgSiBmBxnVu2L5jgBaOA5W
         uLaezOTFQyajCoTiwc9zMLLjCHR33mW5zuCUDeKCPQ9Q8VK4bHfbuipalDRd5ELqPXn2
         uLU+Is1/WINGLKlzONhucsJSohiUf3DNOiJ+NBY41SdnmcqKZ5GEE3Bg5dJPr+lW/Pv3
         /dX08RetBlK2CmA6o2cdpD9dvO6NaUQ2S/gDyZKdBx0SdXy7myoN0mdqv/7r4VUvIwO0
         pHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779163471; x=1779768271;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xS9AYhs6BDbjLLGh5V14QRqWR+Wq85qVhy1t5hgItDs=;
        b=RxX65zcDJpghzQ+cmT+C7MeuCMkWjdkeR7x1AXBxRy0J2mzUZk+mmOm4RdjlJYabIR
         TJKDkrCt0WVYNXGB5jF+pdK094UbqM6/4g5tA6C1B41L+cAYSXz+bD1wdR9nw60Q/fW8
         cF6JaSObq/W6sB3BvTt4f5+Qf5QuWa9SZJILr0jleM3B/hCSh5R16xaNarFs/eEjeyou
         7vQNStbioP6QhVWp/bEqNgx6TUSp1L1ILHwuhP58WAZlMMGweCylX7rjUKC9SUoNJTOG
         j6aFwfHe85N1ZWJ2BGCxGNJ2zDCF6nRpvlZyUzxQk0QbbkFa5kQG7CxNXmnomPk0+WVv
         HmYw==
X-Forwarded-Encrypted: i=1; AFNElJ+W86q4lNA7NMUl4sQB6fLqs3uPUSOkOOPlQYkkcO2ZRexjZ8Ff6d4DC0HQeLpjRKgxlalGU0et0tg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMSQ7aIcO+uLUmgzrY4nUAgLk9TnNTzKUek4LSPl0cd4b44SSa
	vfB+rpQNRNdma36t8Xgjokl3RXUuXW86+tR5it5FIqpoEESxrQDjcnmgO2L28Fm3P1Qme+o0ZnB
	Y3aUNeMX+0OmnUT1E/Z9Ntz9cpTBHzhNcYvk7kQ+hkOav9O+6bY8Mp4WMh2YfnADHatlYTQ0=
X-Gm-Gg: Acq92OGMtwoFpTUwA08hxNPh+WMy3pXl305ZghRF1EfpGhLw1GZmV2U4Y3dpUU3DOl4
	3Wy3U34XMNuKVnKTB4E1srs2RbrWifbhEneHnMo9qmIC9SiWN/Zmh6rfkY9F/lrdNlaQHYlcuM6
	1y7Sn/WZSFKDbtX+7LDTVhdyURe3qH66f9Cgrk4RejRSQ0HORbxtc4izsdHGjnXQrRE3g2LG8t8
	En8DuSxU76lM4RMgBf0ro2sYlW9wSp9v7SSgtVbiXKzmB6HUFsDLiipPjUOmZLX64ZKoPk7XzKc
	ve5x1a9ib4R3buJbOD/lIKnJl2jIqbMqNB1RnJxmiVY/5ECei9vnApjN0S1TpXn/8CFFFD3d30E
	dUhplV3jvKp/4ay4koVhCDCnp9esG1cA9KYE3UIUuBhPViPSA
X-Received: by 2002:a17:90b:314a:b0:366:3517:1a95 with SMTP id 98e67ed59e1d1-3695173c0cfmr16415391a91.0.1779163470849;
        Mon, 18 May 2026 21:04:30 -0700 (PDT)
X-Received: by 2002:a17:90b:314a:b0:366:3517:1a95 with SMTP id 98e67ed59e1d1-3695173c0cfmr16415358a91.0.1779163470352;
        Mon, 18 May 2026 21:04:30 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369703bcc91sm4924387a91.3.2026.05.18.21.04.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 21:04:29 -0700 (PDT)
Message-ID: <1c0bb8ff-eaca-4779-9b2f-4d564abd8670@oss.qualcomm.com>
Date: Tue, 19 May 2026 09:34:09 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: Add support for Display Clock Controller
 on Shikra
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260513-shikra-dispcc-gpucc-v1-0-5fd673146ab2@oss.qualcomm.com>
 <20260513-shikra-dispcc-gpucc-v1-3-5fd673146ab2@oss.qualcomm.com>
 <n4wgnno2td3xmdsgwadvdtvr4ncitzio3ufufg5bp7wnga4ouw@mj76764e3uus>
 <dt5j7khzvgoj5qdrnfoi6ssye23jve5gjta5qx2ubuvufjzr2w@puacv5jgosmb>
 <1cf064d0-14b9-489f-964f-614aeed4fcbd@oss.qualcomm.com>
 <qg2n6pwjcoz7262eylept4mec2l74h2owfbhjykfxap6qwgzuq@oawiwgok4hhi>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <qg2n6pwjcoz7262eylept4mec2l74h2owfbhjykfxap6qwgzuq@oawiwgok4hhi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a4MAM0SF c=1 sm=1 tr=0 ts=6a0be14f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=LhgfjC5gSqSb7UNhMDMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDAzNSBTYWx0ZWRfX99925tDj2Wsk
 39iYvtHIt5Zx51YRnDt245af4XTyYWHj0JxkFb1FgKDZOK3J6QCMfwgSFLJOZ3iAj4j5d9QhvkV
 FiQZYmq948ndAJuhQ/b2Ah/B2xhINrAWuAVbZqqY2iZHUwupjmwhuEkaRdAiFHXB+zvJEzSn1n5
 Y/q+izBc9dEKhiq6EgCC9aBTw+jCTrCisxhwXXkYb4sIbeTWXVLhv5KwHbMchwdXUM7XfhT1uZ8
 xqwiCnozHKaQanes2F9FX4/lQs1VmMHbBp6UKRpNG4eGZIJyDWIu+HjxnkXUZqDaolPzYSkTnUl
 eqhCKmedXKTniZGfObqlhF24NjjtWG3JTRPabf/Sw0//R/M70NfuQJnTx6Zx7SxNmkMWGW3Xq47
 lP0SSIhPdIIM4NVndgx7b5mXvHuKKOGpv+GPLNJUrAf4mdxliHFPx80EKyVtaLM7upKQdEMRMBP
 Z8OIBNoDLppu193UIng==
X-Proofpoint-ORIG-GUID: w2kwejdSQv8PXq5dlLGyJsXGc-trwLfg
X-Proofpoint-GUID: w2kwejdSQv8PXq5dlLGyJsXGc-trwLfg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190035



On 13-05-2026 08:38 pm, Dmitry Baryshkov wrote:
> On Wed, May 13, 2026 at 04:51:03PM +0200, Konrad Dybcio wrote:
>> On 5/13/26 4:06 PM, Dmitry Baryshkov wrote:
>>> On Wed, May 13, 2026 at 05:01:16PM +0300, Dmitry Baryshkov wrote:
>>>> On Wed, May 13, 2026 at 07:10:38PM +0530, Imran Shaik wrote:
>>>>> Add a driver for the Display clock controller on Qualcomm Shikra SoC.
>>>>>
>>>>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>>>>> ---
>>>>>   drivers/clk/qcom/Kconfig         |  10 +
>>>>>   drivers/clk/qcom/Makefile        |   1 +
>>>>>   drivers/clk/qcom/dispcc-shikra.c | 565 +++++++++++++++++++++++++++++++++++++++
>>>>>   3 files changed, 576 insertions(+)
>>>>>
>>>>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>
>>> After comparing the files...
>>>
>>> Can we use dispcc-qcm2290.c instead? It uses clock-names instead of
>>> clock-indices, but I think it should be fine to use clock-names as a
>>> one-off.
>>
>> Or we can convert it to use indices, since those are stable for agatti
>> too - the names would remain in the binding, just unused by the driver
> 
> Either is fine for me.
> 

Hi,

In Agatti, apart from the clock-names difference, I see that the AHB/XO 
clocks are not handled as always-on via the probe and instead rely on 
pm_clk style handling, whereas Shikra follows the newer pattern by 
marking required CBCRs as critical during probe. I think that attempting 
to modify this approach into Agatti may introduce unnecessary complexity.

And the Agatti DISPCC doesn't have the DT_DSI1 bindings exposed, and 
updating this might break the ABI with respect to bindings, and DT.

Given these and considering that Agatti is already stable, keeping the 
Shikra as separate GPUCC/DISPCC drivers is better to avoid the risk of 
regressions and complexity.

Please let know your thoughts on this.

Thanks,
Imran

