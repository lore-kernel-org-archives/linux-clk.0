Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848183D88E1
	for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 10:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786961415; cv=none; b=u0iVwaMEuKGYEv1OFOUw0y0rWHEBhx3IILhqE0YipgSoaEoOr80bLkRvIL65c0D+SFG7+Zqr8t6BP++VWgk6+JK5LLEg3tgFIy33u+583+hPnBMprf03CIteiBWbMD7r7KDYvvPvRpqntMpwXjnN3FEBmr0TWm28RjvBLse/k/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786961415; c=relaxed/simple;
	bh=PXKornFVwrBcU2Lga6F6qWmZ3Mfa8hGxhZhpGMlEL6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pAfSTQvsXdzkGz/D71qLya9QhqmWYwr6u7ny16YFLM2ufU0iBtPdU1k01w1YhuOf0ig7LpZ+YEcKsXYA2Xy59kD3AQX3ltql6auOis8kY/vZ2q0d6b8bhxX0nbgtEjZfCe6JHjQ2X0ngB/8tXzclr9orIAqoKfwRs/PWpmh/lZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H+7jE7qN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y36TAQ6R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H+7jE7qN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y36TAQ6R"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H9dosS2470805
	for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 10:10:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ex/ykygugk0kc4LSuslqcCHUuqM9PPf6/YICWJevc5A=; b=H+7jE7qNxbcsi0y7
	3XYo0EshCKE5N4M/jOYHJIKE3CYfav7/FIsbWBJD29HcQ2NUz6/hpEIZbkvLJwSv
	x8wy4dOEYt3mGqweWCM5dOeORY6m04MtFgQjfaUo3lJcHpn2IRNIZqYnI53S6xGL
	wuCWswD27tECYgjt9/RgKLMyLp0+1OQoO21Fdj1H4bJnpARyuqRVV9bgYmwWtVK7
	+uWV0wDf2LVox2o4ZzjtncRToMrmogHO/1SG9K/OG+ifgdTjx9KZwzsrZhmS1d41
	GozqwoKgk5ECTTgVmgSMctB559wBES6Ox4MpiVE+QlDqOvXrwPhkhEI4my3D3X2x
	AVw22A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wm7rp69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 10:10:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1e777a15so8989201cf.2
        for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 03:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786961411; x=1787566211; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ex/ykygugk0kc4LSuslqcCHUuqM9PPf6/YICWJevc5A=;
        b=Y36TAQ6RAl2p27dY9TFSLCMm5fe7s6RZ7u/yoYNLcxs2kg93Yo5kE8l4yi1RfkiOVj
         LX10p29OwMd/yrxp+NtXZxYVlXdUPmq2ZDG9OgEplBmRZcRrqtkq7Hp5KgA75sXXLrtX
         ++4xhem+u6mKPh6V3w4i1N70lccFkK1tMPcUGcG6x3Oz8jbUdblQDFHzdVL8d6hVl8gM
         actm0B4kIvkAm/3Q8Vl0isaiRCz4E/a8hlAtMh57XGWfLbyZpi/UeLLcpSsDAH9pfAI7
         al+h60w9O1c18rIupI4lI+quRbw792d/Wuq2riYxgWFlG2E50dV3Sf82MsPPEDfamvsn
         YxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786961411; x=1787566211;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ex/ykygugk0kc4LSuslqcCHUuqM9PPf6/YICWJevc5A=;
        b=Vg9R86rDE/b1kgAQQ6fmYJEvR6Vn1Z0oKaFqgiW3gy76pXrZJM7lPM8N3m5wFTMakA
         kplKZxh0d2Iap6TldPhnxDQ4kGzU3+5o0qAi9Y75V4ohYEx+st80nQ7BVuw95BAmMzxU
         9PA70smxv0YJbAFGihcnm6Qk6RPD51jiZa7yShEEXdTZnAKQfj4KAbHTbYW7C75ioPTD
         sNUjButkOLB1PpC7s/lw5hXQAbcYIN7r9WSHGJEvN9RyJjEF5mlpP1382i7dCb9CSdnH
         TphwtAmLTuKsliBjqcBfH2T52jSQXuiOjzvFDWlbkioHZBr+4fstDZaBPCAmKHcXiHSn
         OrZQ==
X-Forwarded-Encrypted: i=1; AHgh+RobHnn6ABJ9y8jaslY+tpcINaAlGQJHZEkIN2PMsZCQJHQJAcnJ4E4ntvCbPOkPA7nTw98Dg+TsVG0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbY4murHTGnI91ZNHZwdSA382meCg6wqBuN9emWFBRBepgXE1D
	fpixagTfsuAp6hz6W+iLnNRWBpYns2nCsdYmD2C0QWE5fIu0DASX5ZdlBccX2GV+zNohywNBvph
	jczPyRs2kC/74+ZPHb/NLpVm2jq2vO38AdQtV0c8l/YzECBoXhmlFGESAisWSSIk=
X-Gm-Gg: AR+sD11opIVY/wDIwWVnK3XtyU/qXqixULY8ks0Hx71p+K4nsd9PXR7M5EAzKfnmUey
	1IHEbl3mQRX9CuC2suCoJvOU6nc3Bx1qnIrA3s1Q24L1xyBiOo0hvWo+Bro6pVz/ecQE8tXrihw
	XOZX9QVuYhk77qXO0tbkIk8oWDhGfpojAVaPWghM7C/1L1j0EjKiEAvfAOm4ADqMS2EjXIdO4Cp
	5SSOho08c9XdD5sFF4hEzlIBpDWEYdAxI77JdDY1s2Ljx/hxu0cg4ekNNxiZXkH2k8VlE4EOnZE
	EwphVbfNxvWUVrawKDJYazCLIRqy7fRBNXtgsWA9VqM9Ij1AXKviuWOiLQYthQeOwl7XrWJTscA
	wpWtl98Q3QNOyGPITyLjYKbFK
X-Received: by 2002:a05:622a:607:b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-52d85492841mr174087341cf.4.1786961411589;
        Mon, 17 Aug 2026 03:10:11 -0700 (PDT)
X-Received: by 2002:a05:622a:607:b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-52d85492841mr174087061cf.4.1786961411210;
        Mon, 17 Aug 2026 03:10:11 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b73be8sm1529566b.35.2026.08.17.03.10.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 03:10:10 -0700 (PDT)
Message-ID: <3df2f139-bc7a-403f-bece-7e820b202bd1@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 12:10:06 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] clk: qcom: gcc-glymur: Tie the CX power domain to
 controller
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
References: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
 <9a3b9b76-abb0-47a5-ada6-cd0a576b0782@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9a3b9b76-abb0-47a5-ada6-cd0a576b0782@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DAOkdcLVEi2E3OTyv6ceo3Hoe_UNbbnb
X-Proofpoint-ORIG-GUID: DAOkdcLVEi2E3OTyv6ceo3Hoe_UNbbnb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA3NSBTYWx0ZWRfXzlQiQqjYKH1z
 +hIUj+l7i3JBrW4p5ljbY7ak3uAFHb54C+kY6QwmrIVltHk8ROlJMF9WzOsa4pTWARN37xKT2Ex
 k4SdKRJ8l3fatDniyMyK0ToU5cvTuhe4RIrFtf5zrXXB4ltupV88LspHLmPOf8S5d4HkwjvItd2
 5XwqcPcyLhQihlgMoTyDKa4Jw/JezRrenoG56ccMkEM4fydPD+NqIku1EcC5uLjqrTkg5WOIhkW
 8miAQWUs3TnYG99IooKkFF19Ysl4yeNdlWjM73YAsXRWquRjJ2s5wOZtWjcuiqiRlUS4XDNfeyw
 x8NpDuj8d2YTrKU7x5EJeRL0FjIGJRk5bkkFu0YmaS5juR/Wddk8YNQW4xQj8ofHt8gGLq3tmQu
 k07QDZdl8qOLv1/55eu0iioXvLeawbyuV3R+KvIZwNvibFvSS5mix0g7WOc2oCWo+4nBNOwjM/U
 YsszjR04GH8MRHzHuZw==
X-Authority-Analysis: v=2.4 cv=YqM/gYYX c=1 sm=1 tr=0 ts=6a82de04 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tezwY-nLf034Pw0hkCEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA3NSBTYWx0ZWRfX07gXx41oVf+y
 1kLaAT3gChTcuNyjntLXDQhHk152iKDQQAuxYCYgwgh5NZCA7GnpCP2Vv0U2XbQioKX8AXHH6ii
 D5pXTz4DOUGUHwzX8h+7gWjx411D/YE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170075

On 8/14/26 8:30 AM, Pankaj Patil wrote:
> On 7/15/2026 6:59 PM, Abel Vesa wrote:
>> The suggestion of having the CX power domain tied up to the GCC
>> controller started here:
>>
>> https://lore.kernel.org/lkml/fe210f0b-692b-4c45-afc4-fc2bc5e57854@oss.qualcomm.com/
>>
>> and then, for Glymur, it has been brought up here as well:
>>
>> https://lore.kernel.org/all/0248dc51-1036-426c-b1de-dbc71696e2c1@oss.qualcomm.com/
>>
>> These plus a discussion off-list led to this patchset being done.
>>
> 
> This series prevents cx collapse during suspend on recent linux-next tag: next-20260806
> Reproducible on latest tag next-20260813 as well

Yes and the ""fix"" is to disable the GPU nodes because the custom
runtime pm dance done in the gxclkctl driver keeps a vote online

That should be fixed instead

FWIW ath12k is causing some issues for me in this regard too..

Konrad
