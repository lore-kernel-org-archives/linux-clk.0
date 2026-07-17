Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB923BC673
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 09:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784280625; cv=none; b=HN34kURcGO0RnAah/g6XP78anwz7HDlMpDZ4cIEiqDxvoozyZNj4e/Xv7HLOXZsHDOmlPtz9TEzdXEUbCtqa+RjO5k1146y7h8y8UUc1yyWwSNWkXiHPEfB5aYhDY8gHuHjB+jSSgBVkEZ0L1fAsz1se6ySyA4fegluTDunAh3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784280625; c=relaxed/simple;
	bh=sW39zPxE9KCDrhtE5RxDgtxp+wa5oNRnPHM5iQvak9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mNbqZqmWDnzd9kgogx0xhAEBddnyKbu1n1xjR4KeZK3y7OGU2yZAlp2Ucb6agQ0JVw65aY/rm/zA3TRrzOwePw851tqvA+RklDko249QZ2ob/8fghuw+BTAS2v3EUy8yRhXYGHYcLANmDAkcLROmWM2j7PHOWoYceULudXl4kps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oaAi9IR3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PqiFdqI6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oaAi9IR3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PqiFdqI6"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cFrP1160804
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 09:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TnVo3dTONDwo1Ybr6ny1brTgUFSId0p7SO+cCeMTRgQ=; b=oaAi9IR3JYz5La5X
	ooCE/hmwAzHRm7UAezhUauUYoWb3Os2Wu0QH3KPm0mtKZX3CLCk6RBFDv2mE15hB
	5oLLfdIMwF79vdKk9Y26EUmyXxKZsqeiNBQS4YUjX4HN1wbxdY5/3hKW/pBJpms1
	Dx/vJ+FPsLxSYlo48lt4UywRXANIzHZrGRse8Nogp0DEH1NvnaSmbWUGUIMcVTE9
	ZT9fkVMMi+DjYalROdE5tKjlJzvlxMcO3a4yggLfo24Miljy3P3iWj80EPPU8ilR
	h8pSaYGwZSeE6I+eUFIdKYGcPdP/8hKiuvVBAzaTN9681FRpzE3ESc5jiBs0v35F
	h0z5/g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffd3as4vj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 09:30:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cefa1a2be6so46951435ad.0
        for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 02:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784280622; x=1784885422; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TnVo3dTONDwo1Ybr6ny1brTgUFSId0p7SO+cCeMTRgQ=;
        b=PqiFdqI6hQWxfOT7u+JdxSC4pdGfazRK/SRPYnqxbb2kjSp78q5D5ia71glCoSxx8c
         ZW7JvqZ9xdwa6OIh1ULr3/lx74wRIut/DCLyfYwzhdJuM9w4O/Mzk6nvZk4WNjJf+vGN
         qMx4RLhnLaSSAx30TuHSfWtD3ZDASes9d6KE91evbK93ndV0qU+K8UzcAUh5AY++IDKR
         u8Gkgmnbp4Il2mjKOn/iK/N268E1W4a41QjmsHcIMQB+zhIoZ4HoxZthz8DX/vPSefkd
         ynQEr3NJDABxWWHgm/xfc3d2Jd1Riea2ItY7FOHGpoY6WmcD2aAQsPJ40wzHEBVLqoUX
         0awA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784280622; x=1784885422;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TnVo3dTONDwo1Ybr6ny1brTgUFSId0p7SO+cCeMTRgQ=;
        b=UAepou7bW4s/xxF71BAzCg/angqeOvvw/FoklitdfzjAFxQBB+4jTkmswvu/dT4Ye0
         eFXRgPQ0iU2tJW5iv5IQ8PCTXni4lZ+6RUiXM5GoqJwAggej59kXYA7DpCRYv2TaCva/
         zmTzL68Ei648pZU/lRV4HvDrH0/1LbygSE98tij+UnnLnTVienNT5t1+lxOzCRdEeCMQ
         RlPgc4GzuDoiNqaRgIT7MeTl+hnEUYqq/bpCtrnrudge8oIt7gPnZMWZxRjr7tApfJlo
         EOpPNXUq+XMonj8BesoXBUrc5OwK3COCrcsMqRlMNZ0BXnZVq5cFS0oDtOwTofYyansi
         jTXg==
X-Forwarded-Encrypted: i=1; AHgh+Ro2dn/FzKHno3O7PTMuTP1VvpM2wtVIU65Fv9MPT9fJb04lYpHsvnRYm26JieM/MB7zN3ablwEQB9E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbvJG3OJ/Xws7vZ2xOsafYNXjMrreeGBhv+SIkG9tBxgDgEsMN
	qAB14swf2DoSxnXYRYdeRtCAVaj20WaJ0ij955llEEXGpLJbdLwWv/wC6zb48o9kuMQZin8a+l+
	AVfDM0McqWYN6TDt20T3Y4SrqS6d65romKdrJ5rImIF3+S2u9Ce03ELGGd49TcCM=
X-Gm-Gg: AfdE7cln/suKwUVppYfy0KStDJl10110AFbvPdW5zcDzgerET5YHrfbEHki5RcfK5Zj
	XrGOaw3XUT9dhmoefzZcoyCSgKhMpfSavFOgPJOlkUfZb8qI05slbLz7a+mF2U1p+mQ2PpBWenl
	SEUKpVb6yiZdS3B6zE3Bp+ZKEIEU672cW73kaZsbq5RZomf61LJ+0Fz6kTElSxNa7Mztv/rtj1B
	68Gm+TWi7YVEKhd3dQE5WtYoKMbyouB2P5qDNqBm6LbmR2K2kX1tqhm+D9wS0GppRomkYYI26Dc
	/E+Jr/B7c9fhJcRvvGGJiF1OPQp6qk44nQxCsJM+NTPFZNDdpmvQBnPOqLxovvCB3ZzvWa22rdl
	I8a9ojKlZfsSauZ5rjcOJCz/sbM0=
X-Received: by 2002:a17:903:3c46:b0:2c9:97a8:afef with SMTP id d9443c01a7336-2cf349f4a51mr17753045ad.40.1784280622065;
        Fri, 17 Jul 2026 02:30:22 -0700 (PDT)
X-Received: by 2002:a17:903:3c46:b0:2c9:97a8:afef with SMTP id d9443c01a7336-2cf349f4a51mr17752525ad.40.1784280621313;
        Fri, 17 Jul 2026 02:30:21 -0700 (PDT)
Received: from [10.217.216.90] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344f4481sm7415285ad.32.2026.07.17.02.30.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 02:30:20 -0700 (PDT)
Message-ID: <2e9a211d-a877-419a-ba8d-40bfc42e65ef@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 15:00:11 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: qcom: glymur-gcc: Add missing
 CX power domain
To: Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
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
 <20260715-glymur-fix-gcc-cx-scaling-v3-1-72eb5adad156@oss.qualcomm.com>
 <4b543abe-2482-4381-b41e-623cdf5be9a2@oss.qualcomm.com>
 <olkjcrfq5t32gvqgpcqiuyp5jhf72f4piowz6osxhain77f7bc@ggwuk4nz2ak2>
 <316fd37b-9936-4bca-8521-9a11ee65cbd6@oss.qualcomm.com>
 <almBxBhYxTR9n5FZ@baldur>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <almBxBhYxTR9n5FZ@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA5NCBTYWx0ZWRfX/z1UzYbYfFYK
 D4oxbWbQnfV4s5CpmTBWKeBTBdgNhfmhIJaXiCR7mg7aqAuieIsNZj8MgobJiA0LnRcUmki2GDz
 fwygd0xdYFzJQJN7X1fBlZeseqRlj68=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA5NCBTYWx0ZWRfXz9wEKkEYLTV7
 ZObxhusl6Ubg4xso7fmPDZqvjBi8Ox1fJvbf249seT6whE4Pery2ZdRGmenfi4VFt1IYce4eqFU
 yT4czWv1KujE6JE/jN2PPnnMLHpu2hsrS4X2LpnXGObfJ6gq1KLo/bDQlCmhyciT3TeZVSJcS0A
 mc5EhI1TRswQyAUzYHtDsGCkvNeWVm8ZQ9X6Bn6whurCj+400ikEYef2I8nXL30WzxHXppXzqJc
 jV2ieU4cW7w+pY8zMxJVLF5C0VUglZ/SQw1A3bXukiaW32HMCRErpInCJ3OFY3wiAvfQ/w+Gc/5
 W2h5LkkVY3DeKlZwjUdpUFmyCvfRA2XA41ZtLw4ezFbBSc/KGnmjC1YbpoeFD+Uk9Oi2LbUALSt
 XgDxjN2ZwisAh07hISgvNOM/hWXhxZyk8wxQyxWTb2dkInvyyKDDEYYBNnjRhgjOlBkOwU5nPGP
 +9LACvVYY/IjCh9buAA==
X-Proofpoint-GUID: LEbhK8JDAu_DWMuKa0cgvRwGz4umGS8q
X-Proofpoint-ORIG-GUID: LEbhK8JDAu_DWMuKa0cgvRwGz4umGS8q
X-Authority-Analysis: v=2.4 cv=e/M2j6p/ c=1 sm=1 tr=0 ts=6a59f62f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ZdHkocIOR6SBK6D-yKIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170094



On 7/17/2026 6:45 AM, Bjorn Andersson wrote:
> On Thu, Jul 16, 2026 at 04:42:11PM +0530, Taniya Das wrote:
>>
>>
>> On 7/16/2026 12:52 PM, Abel Vesa wrote:
>>> On 26-07-16 10:13:48, Taniya Das wrote:
>>>>
>>>>
>>>> On 7/15/2026 6:59 PM, Abel Vesa wrote:
>>>>> The GDSCs provided by the Glymur GCC are supplied by the RPMh CX power
>>>>> domain. Model that parent domain in the GCC binding so the provider can
>>>>> describe the dependency in devicetree.
>>>>>
>>>>> Add a single CX power-domain entry to the binding and make it required,
>>>>> matching the hardware description needed by the GCC node.
>>>>>
>>>>> Fixes: ee2d967030fe ("dt-bindings: clock: qcom: document the Glymur Global Clock Controller")
>>>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>>> ---
>>>>>  Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml | 8 ++++++++
>>>>>  1 file changed, 8 insertions(+)
>>>>
>>>>
>>>> Abel, I feel we should add the 'required-opps' as well which will ensure
>>>> the clock controllers minimum voltage requirement.
>>>
>>> But it was agreed in v1 that we should not add the required-opps. So we
>>> dropped it in v2.
>>>
>>
>> Okay, sorry, may be I missed that comment.
>>
>>
>>> Can you give more details to why you think it is needed ?
>>
>> My reasoning is that if a clock controller requires a rail, it is
>> preferable to explicitly specify the required operating level rather
>> than rely on system/client vote. This makes the dependency
>> self-contained and easier to reason about. Clients that require a higher
>> operating level than the clock controller's minimum requirement remain
>> free to vote for a higher level as needed.
>>
> 
> You're expressing this in generic terms, can you please provide the
> concrete example of what this would look for in the Glymur GCC case? 
> 

Yes, Bjorn, this is indeed a general requirement for a clock controller.

In Glymur I do see that CX could drop to retention corner in case there
is no vote from any subsystem and so it is better to vote from clock
controller a level above retention using the required-opps.

> What is the required-opps for the Glymur GCC?

LOW_SVS(rpmhpd_opp_low_svs) corner should be good for GCC controller.

-- 
Thanks,
Taniya Das

