Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFA334888F
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 10:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773658717; cv=none; b=WyJbieeb8eB/66FvFy/oPYziMPnEIkQK63uzs5LSjVcyMZHTWJ6e3YgdBP9Hqf56UC9iyzddv5zhL9aD33izBGFRXqlSUfn7EtmdWN5SJcBQs7Rw7ocgMxYXD3UvHYkfBvayrz5zbvdbPQiVHvhenkzkXnFkaFo/olSo2BHd/L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773658717; c=relaxed/simple;
	bh=3lmRRGmBoVA8sV3x08L17KDSoA6WDoBOETeBfd3kmNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cAh6cAhFul9OttnFwPFgxdPM0sJg/M6Umu1/i4HZIQNzD7TJTdkIgWA6MBXPcHTFK6O2j2rRqSqbYofdyJ3UZkT6aRrarEWbQ89vda80DjpKVC5DHCY6UXkJ+ovyg6Op4wbOCl+eOb1YPTdCo7Uj75LmHiHfiOlKW5It+sZVy9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n1EuqDqU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q6RB0rbL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n1EuqDqU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q6RB0rbL"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64fr61282126
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 10:58:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3lmRRGmBoVA8sV3x08L17KDSoA6WDoBOETeBfd3kmNY=; b=n1EuqDqUsnNLyT2n
	mp4eU06qOVxKTbUSTLZXtEOoT30hLYdu4+IXTG9duifStyq/O865gmauvlaf2ElC
	XGsxmrGftnKF9AhQFsVsi7I6OdMwUdim6+ujro2ekgfuDgi78E6XvhXqlI3pPR7e
	db/aejPz7ifI4F8ZgRhTxJdl0lotkchtb2zmSdIeV0+BmG8UaxgDBjQmSR8TQkWY
	TomVAfXiIUuZaS3clpT3KXOMfW6tysh6SjxZl4GFvSJ9+HD8IzDJuZHTM3jYKrfk
	S3I+ZtfriFIweDflDiDKjedSx63FXK7lJwkrWsTOlLvqXk6ewElTE9pcGL2fQcJ4
	qJousg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyyc57y7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 10:58:35 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8298150caddso3790350b3a.3
        for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 03:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773658714; x=1774263514; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3lmRRGmBoVA8sV3x08L17KDSoA6WDoBOETeBfd3kmNY=;
        b=Q6RB0rbLvm5YoQRnt8MDyk1bQC6MKudW/8FUBeOJ8AauvNrMrZ5tFxjQMTPEjDbiM+
         Avj1dMRpz9nOxCSFutXI2yL8AnENX5b73Pr3sD3UKfqoqp3EzUSdqjyE3/ICq4OatouZ
         HDGYCYl9LuOjiIFS/Yv8FpiF8Uy442PX1AoQ9GAkkyxUbvs9MYOo3ShkNIvgV9n288Z1
         FAm2xnxgi9VtcbcwiDY0ipC2Lpw6uP4JFOUN0vSwN+SoJm8qb0QJdhUl+vjasgBV/UTJ
         bug5jEdQFol7Zb6tqdqUQg5CIzd/u/V3jqNEcq/h5uIWBkQik3Njs8UIzM6S1tg8UAts
         HK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773658714; x=1774263514;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3lmRRGmBoVA8sV3x08L17KDSoA6WDoBOETeBfd3kmNY=;
        b=o6ltR5aAc00lZwytv0vvgncv0S6wgenyj8mh5s1Zsq/uFdM/Mul/3mb86QVF1q+3tI
         RsiENwOdBZXy/b+BZx76HntB7yBK0en8JGyg2EMqA5ZSepX/c5T2cScXfdz7UZ5TF8FX
         QFzKufbW3lFxwmxBVUWizfc+QFi3AtnkYjsOQNuNZtc1Fa33S+zsMubWfOxtSrLBn99c
         V9ckbgQIiKMskluQYmvWFuBQ588CYJhHeLxCv1ZCrXaHtRHncbKEOE58dEKBG15EwJIt
         w6sQ/6u4dLXAzpSJHFHzLA+rCLB5LAk6Y3lGMXClqCnIklmtn4GWqTtTYjW0jj60bOPc
         rWFg==
X-Forwarded-Encrypted: i=1; AJvYcCU+B3wk9rE2a3WRtihr4/kstRv4HFJ67O4PQRIIVEmw4ObC2tPs5ChCXY6Og6OUalGWO6ulyRnjE4Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9CfErJt6caRRNR3FGvDodiMj221NSlZRrm3rwWbRLjSQa7jdQ
	VllluWkub1OPWnpZK90pqQr+JOI7U5buRN0CVbYZ0twWsHtszCw2xs9gsO/gC29LNlk57IiLlo2
	l+Kp8LkcnpHGmcYhKR8cpy1kM18nwuNYXu4VTell0Mu6+Wa5Eu3xwWjCzjok3Wh4=
X-Gm-Gg: ATEYQzzKZk5BnibeaZZTUPiGMX37+/9unMRF1NABSoH90xqxvyH2QFvq6iuAA9BARWU
	dmeWTdHkxTa9O421+auP+mAwPbTsBs039dt1jp8rgQMun9PVCLoUqtXKtZMoy8xY4906HYa6IUX
	0sC9kxs7BxaFXiqKN5+sL6O34WNINWSCGMJCevsZna3xpOZ67N5y+7MPPqKWDNfTKKpYcKgWwH3
	ZavzUG+0ayEeW/dej5hLvR0MaoezXHUpIekzaOzPoAWP2nqvCusrtK9DejXsQ7rW0Eo2xungfP8
	pj1kgWOkG00i4yZO3JlY5BNRz3G2PGI81xKdeosiC4MAKvNNWbZeebTboHE+vOptIZENPmeClMR
	vwH1xHpVIXvwQzQmefwqe84TJhDtyR+orpg5daux+nIxW88iy19NLPB7wEA/A0zoOPw==
X-Received: by 2002:a05:6a00:908e:b0:824:3bd9:aac6 with SMTP id d2e1a72fcca58-82a1970830emr11249598b3a.16.1773658714576;
        Mon, 16 Mar 2026 03:58:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:908e:b0:824:3bd9:aac6 with SMTP id d2e1a72fcca58-82a1970830emr11249570b3a.16.1773658714102;
        Mon, 16 Mar 2026 03:58:34 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07366974sm13390277b3a.48.2026.03.16.03.58.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 03:58:33 -0700 (PDT)
Message-ID: <384f366f-b2b6-4bdc-a2a8-ba86714aa094@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 16:28:26 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] pinctrl: qcom: Introduce IPQ5210 TLMM driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
 <20260311-ipq5210_boot_to_shell-v1-4-fe857d68d698@oss.qualcomm.com>
 <05a1dcfc-7df1-4b20-a504-468814a87b3d@oss.qualcomm.com>
 <1eef0fc0-d33a-452a-9da5-3d0903b1712f@oss.qualcomm.com>
 <c89449b8-f28c-4364-a1be-5267f0d99c01@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <c89449b8-f28c-4364-a1be-5267f0d99c01@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=euXSD4pX c=1 sm=1 tr=0 ts=69b7e25b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=f6eOa__KeYMFnH1f_rcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: axiBP4fSWqN9Z5T8UjxeijconHm6zS-W
X-Proofpoint-ORIG-GUID: axiBP4fSWqN9Z5T8UjxeijconHm6zS-W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4MiBTYWx0ZWRfX+XWgDexcV9ZN
 zBBDTS0hSkj5v8lsFkc28kclvBQK/S7SkKxVH2E+h9wSyawXZdq5j0KewmGgbKRYM+ArZYdKh1W
 jAE0gmUGXVl4RxucctU10pJl2u8JjFpXadSA4tm6ulg9CY5gMVMDgOnWq/pmFABLVzYwjzMDy0K
 wbsJS5vs8L68DXZIcRedK5EITjlzYn/iHhOL69faK4h41jZRbQYWjP3PfZpskKtirh6CP4uLbTv
 Js862PJ31QOLp6IeUt3gSdDx7HuRXt4DAZgBMtEnSBPP1jETEipJGqDnZIKgZKdZtyrVt52AJ+1
 Rj3xotU4D2sGuKptuSfC5ldFHTx0T0nurbkKMFPo+t2DzwlRPefrPjLocXA3oEhXgq1SkMsHEsf
 gW8bUVAjTaaKKon4dk/Q4mVuBWENLH63gyBv7YWtpeZG5Muq+UBv8+VuCTo1JfPETb9+lAEQEab
 TdhmCSkJdzd4Oncm3bg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160082


On 3/16/2026 3:16 PM, Konrad Dybcio wrote:
> On 3/16/26 9:58 AM, Kathiravan Thirumoorthy wrote:
>> On 3/13/2026 6:24 PM, Konrad Dybcio wrote:
>>> On 3/11/26 10:45 AM, Kathiravan Thirumoorthy wrote:
>>>> Qualcomm's IPQ5210 SoC comes with a TLMM block, like all other platforms,
>>>> so add a driver for it.
>>>>
>>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>>> ---
>>> [...]
>>>
>>>> +static const char *const Led00_groups[] = {
>>> odd uppercase
>>
>> Yeah,  in HW document also only this name has the uppercase. So I just left it to align with the HW document. Do you prefer to change it to lower case to maintain consistency?
> Yes, please - I would assume the original author had made a typo and
> didn't really intend to have a single random occurrence of an uppercase
> letter

Ack.

>
>>
>>>> +    "gpio23",
>>>> +};
>>>> +
>>>> +static const char *const led01_groups[] = {
>>>> +    "gpio39",
>>>> +};
>>>> +
>>>> +static const char *const led02_groups[] = {
>>>> +    "gpio6",
>>>> +};
>>> What do these 'ledN[012]' functions represent? Are they muxes for
>>> getting activity/status signals for eth/wlan ports?
>>
>> Yes, that's right. These LED functions used for the eth/wlan status.
> Can we better group them, e.g. into threes in 'led[012]' functions?
> (or whichever way they're coupled?)

Ack.

>
> Konrad
