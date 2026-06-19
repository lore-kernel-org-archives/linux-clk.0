Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B7B3A168F
	for <linux-clk@vger.kernel.org>; Fri, 19 Jun 2026 14:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781879513; cv=none; b=sevRbAVQ63AqlJeUVS6xUg60vd0S0aQ7FljI3oGajpzd6jcCBdBVOwErkDzsqS7zUlOBoEsUuNXVDzP+aVpLgru2FEAROSUAp0wrJL1wLnB2fEGE8e4yJco8yk0e3hSYbbdSkFWd01TfZ2ndMAZocRXJzWfMq9PQPgfmh6gaqFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781879513; c=relaxed/simple;
	bh=LJdnh2HS0tF/xyGE8ExaAQswGjGzrHLipDvrQ2bYaX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=szQKORyfyNPwx+EEnQMSSRWlBoIBN6s8/w5yMULXz3QpA4TCA9sOTmj7cp9JBvb4R5BwADIRm6y1wqR7Iog7h3+gEOPC8UIblhZGy8sRYXWR5Hsh9ZsQYMzWUmp7znEUU0/zZluXcnk9rvuDKWItPbuh7GYEQ/pU4eK0gHO/qRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h6SqJU6T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LaPZW7By; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h6SqJU6T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LaPZW7By"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JD9dpf3005477
	for <linux-clk@vger.kernel.org>; Fri, 19 Jun 2026 14:31:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v1XXoqxMnSgXD6o5pvkQCf4rFypZQ0pr8ir/56ByDZc=; b=h6SqJU6TkKy+EuHa
	fXkxiTS7J6n5o4ve6mXweznkyz5mzC4OJ1p5SIKAXyNyn3iJ0Rel14jGZfuzXR4C
	YzGgDGuW3t7KCvYH7rUxsXQ5k7WMlwvy0M56jm1ht2rVj/iksjA8P0uJCdhihRxu
	uEFYgeI7D4lGP8+Xn/BfD8eUNg0WGWfBdherdlvONAz67ZQvkn95WABlx8r3GCVe
	Q/lf9lwzN1kPxfwqu255sIT0kzG03hXaKmoJZWKzxPBABweui6d9nFU+lcM4tkRo
	NPvaVCbvYQqv4+l1yYaKP1ExDyR5AoiK9mOY57SDRsgaNmTu2qzw1uBbfmotS9tq
	8MupNg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evmyrbuku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 19 Jun 2026 14:31:47 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e6b5a8836bso837733a34.2
        for <linux-clk@vger.kernel.org>; Fri, 19 Jun 2026 07:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781879507; x=1782484307; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v1XXoqxMnSgXD6o5pvkQCf4rFypZQ0pr8ir/56ByDZc=;
        b=LaPZW7ByxsOf1tVUYO+VPSCW1ZeC1txnSAaTFEowrSbrVZKIEldcM5qhP4xtX/nOUm
         Hg9SuXrSdWuPy/tawAJPOAT5z2IIDvySyScKfbmtOazT4sM1x6XY3TzFe8BwR7w0OE+D
         nle7qNqjxR2tpzbgnUufVdeRgl8WMa5cBUj1u2ItsTeJipCV6nq+4UNG0W+xc0rvf4q/
         6D5ux7NMqAXqpDlVf4VbNZqDDfbyzxLXVgtYxVMZEEVJX5nE8+m7B35EG2zcIpiKaHqO
         D5Nfa3qnt/JAxAKzzblGUdAfS931pM18KupAAzH/i66Ptvd/eU9lnGxSW6f/3F2GBVgC
         2eEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781879507; x=1782484307;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v1XXoqxMnSgXD6o5pvkQCf4rFypZQ0pr8ir/56ByDZc=;
        b=XR2BjmyxMSo97wlc07LJn16zaLvMw1msSwX+NhgUMZc9s13FPFETJTNXQBwcuMt94F
         WfZggG2GPKrm9XDdww3vWK/+VxhILJUQDkjHwDTgfZfsVTYwRfo6TPT5VWuxISwLc9/J
         SDQWhUfoT4YDZiJjgO+dyK+Z4ZYrcIgqCZkVxTkGi2Iw/NE0MNx0H/gA4tbnnyACHtxN
         4GBj51uF719rG/zWsTSh2HoSvLfP0PDgkClClhJ+LFIkEW/+fG/xbllk3WrNr8qBOjd1
         0emeEi+pRdiIvyLo/4+D2/Obtwi79rFWH7b1NBlugEPnaqgkTecU7SkV+d37ZRb9DLaB
         1aiQ==
X-Forwarded-Encrypted: i=1; AFNElJ9u5yMqK8ex1t/LvQFTkRBra/s0uyVHRydD31cTDPAtfLAswXvwpTdPfzb7YKdLLJj3StIJpltzuPs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEkrHVnD/lUExUwuq4lF4KW19c24yHYAAlxJ8s/lSaEwY8L2D1
	8FG4B1W9yFZaywUTpm3gHu2rA6EuTRqdmYTvyl01vCeoWW5P65iyAYzn8xoQ1UQsvwqn5b29N5k
	JTLsIyH+pK8oswb26JN6Xw0UMhQq/OBwZyDn8my4RDNnff8/YFZ/v6qxTIjpcQaY=
X-Gm-Gg: AfdE7cmc8G64sXJuMfPX+TMBrFfb7iQqYBNmIYS7urmswvDP9XnDAzMxxdWW5WPAxkD
	d3TXSrRmqkOv7EgrukXxcySibBmD4umUoDgKxSuwVm4aOaLfrKzjCg5P5hR4F2GL+tKxC808N9Q
	zT0Dg/uGA4AqGISd6cemyJwFU0oaOj+LqG1BbvW5V6r9HtVM8GRL7Q3LApXRK6zTu0a3QuLKQ6z
	L+G/HLFlQSH4AU2xzLSSwHmKXMr6xkKv+4mkXkl4KWIFbb9ITAugMaktto527XEeeu5W/JSozGk
	2rx/wqQKP/h6MJBllCy5g1ElUgislmjeA640wcrMatUOR8pNaPLq4/dirRJnUenpi0NvZ7g/0Qs
	FNPpFxijWJSWhGl88zDosFDn/9HFJ4M8iYxo=
X-Received: by 2002:a05:6830:410c:b0:7e6:6f9f:7446 with SMTP id 46e09a7af769-7e92d9d0f71mr1516304a34.4.1781879506933;
        Fri, 19 Jun 2026 07:31:46 -0700 (PDT)
X-Received: by 2002:a05:6830:410c:b0:7e6:6f9f:7446 with SMTP id 46e09a7af769-7e92d9d0f71mr1516270a34.4.1781879506460;
        Fri, 19 Jun 2026 07:31:46 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0a9a1568dcsm92462266b.51.2026.06.19.07.31.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 07:31:45 -0700 (PDT)
Message-ID: <45163c0b-e33f-4080-a424-9d0d8942a533@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 16:31:42 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] clk: qcom: dispcc-sm8250: Enable parents for
 pixel clocks
To: Marek Szyprowski <m.szyprowski@samsung.com>,
        Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Jonathan Marek <jonathan@marek.ca>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260312112321.370983-1-val@packett.cool>
 <20260312112321.370983-9-val@packett.cool>
 <CGME20260320113219eucas1p1bc2f238b689c55ba256c4694eb067d35@eucas1p1.samsung.com>
 <2f5b98a4-80a6-4611-9615-ab0202a8c455@samsung.com>
 <f9511ec8-be32-4232-9168-00f967c29508@oss.qualcomm.com>
 <6e0d6119-c7ef-40d8-bf0f-6a5b6f6b00cf@samsung.com>
 <d4c1e329-78de-4d02-99e5-3e4887bdecf8@samsung.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d4c1e329-78de-4d02-99e5-3e4887bdecf8@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RZWgzVtv c=1 sm=1 tr=0 ts=6a3552d3 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=CBy3kSv35Q_usJoEGC8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-ORIG-GUID: 3talIOtMfgeUmPtmazHINSrpUuMGRO9K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDEzNyBTYWx0ZWRfX/mIe29aRYDax
 0U7yRAD+U/5dIL2aHQF+0ifl2HcvaRdmi2FurT/xZFyCJgdPio6OcsHdH438+i0unOaKNoj+lyv
 6gdGGpp5DVMUx/TO/lqJgQX+4reqmOtTUDW4JRBnGKIYBZiIf7oHHLg+BIeR/ngY3fDWf/tp7kq
 NIzMDac5/3rEvuOkKb0a/LeEfeseIxkVqhTChGQl3BBFjlCkIiPG+KmirqhBqbCbyDkosHJ42+g
 WYWh8eS56WSGbH6cQszGv/ROXOjXCOFF8+ixIoqY3JntBusrm/sv+v8VsDMAz0JnWIbmcKkHPS1
 zffOKAcaQ1h+sJjtlhQIWE2HXLPQm893GpuBikzuJfLu8tUZ1AxFq5vqH//0H92bhv4sYTu26VL
 8x1gXo281wX0Ef0uzKQNKg4sHW9q9mDmTKuax83p4TH8vSkr7RFC1o+yrmkKoNC1jgs45kS09J/
 LTiqbLUc3pkmd44wcgA==
X-Proofpoint-GUID: 3talIOtMfgeUmPtmazHINSrpUuMGRO9K
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDEzNyBTYWx0ZWRfX9zP5GZwUPWYa
 FPYL+xehniY+A7yLLfnDrlawZgOu78geKQC7yxasWtwnWiryy2RNudJ5tHHxtRnIFW4r+v6kuHJ
 nZbs1z4YGmHxUiItswc2K9INLN6u/m0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190137

On 6/18/26 1:37 PM, Marek Szyprowski wrote:
> On 16.06.2026 16:31, Marek Szyprowski wrote:
>> On 16.06.2026 13:33, Konrad Dybcio wrote:
>>> On 3/20/26 12:32 PM, Marek Szyprowski wrote:
>>>> On 12.03.2026 12:12, Val Packett wrote:
>>>>> Add CLK_OPS_PARENT_ENABLE to MDSS pixel clock sources to ensure parent
>>>>> clocks are enabled during clock operations, preventing potential
>>>>> stability issues during display configuration.
>>>>>
>>>>> Fixes: 80a18f4a8567 ("clk: qcom: Add display clock controller driver for SM8150 and SM8250")
>>>>> Signed-off-by: Val Packett <val@packett.cool>
>>>> This patch landed in yesterday's linux-next as commit. In my tests I 
>>>> found that it triggers the following warning on RB5 board:
>>> Hi, I was clearing out my inbox.. Is this still happening on the latest
>>> next?
>> Yes, still happens here with next-20260615.
> 
> 
> I've just played a bit with that code and RB5 board and found that this issue
> happens, because enabling the DSI PLL clock fails for unknown reason.
> 
> 
> Here is what happens just before the warnings (I've missed that in the initial
> report):
> 
> DSI PLL(0) lock failed, status=0x00000000
> PLL(0) lock failed
> 
> It looks that the generic clock code doesn't take care to properly balance
> enable/disable in __clk_set_parent_after() when enabling one of the parent
> clock fails in __clk_set_parent_before().

Hm, indeed.. Interestingly the return value of clk_core_prepare_enable()
(defined static inside clk.c) is never evaluated, across all of the calls

Konrad
