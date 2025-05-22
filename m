Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C5220127D
	for <linux-clk@vger.kernel.org>; Thu, 22 May 2025 19:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747943262; cv=none; b=AMubgqeCotRDIhs8ZqQ2ih/dsep3wGSxlQNGN5eKRratHMtNfkFDNtCCpObz9qddgpIWLMXf9dBs4IN2INu+sofHzznqN7/ffohVP+IQGTKuHRlBObYhc2kIQsgRrKEOVDS2WCy6Ty3fQscHwmv+9ONZxwM7D1o1jElPErLAloA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747943262; c=relaxed/simple;
	bh=vtWv97QQmcdVkvJfd3Kq/jWab4iQxT2PxNipdne2hkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rGa6rxGWmVafej5+Y7+xkJ4E5z4a5UmTBq0UUKBzDgAl5xFiz7cnnRzShgxqTV7UaFNTTB9VPfAuiXN/RkZRhs6HAcD42PyO8ggTQ7fK+GPcNep81QEiAukOwlusQb+6/idnGvhZqLAZw/0nboIAf+GuFCCXN8qiC6zcp0BzrRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UoGLnYTG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UoGLnYTG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MFTZ4m020957
	for <linux-clk@vger.kernel.org>; Thu, 22 May 2025 19:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vlwo72v/3bz8ukRxIg/7653/lvkTs/m7haGuKIkzqFg=; b=UoGLnYTGaNmYvuq7
	eE2J0gxG0S3YNIhjbSQccHzQgEIbpoeKQZv0g7XSMGnC0nMS7amSb47jOBQgK/6h
	rNwxe9lOiWDO8OgOPaZMLG/60THhD6EcYn/MkAx7hOmVhB6EfUyrFHniFrZKgbqW
	05qSlkHFrERLV3spqf5FKgxIlMB97ffP79mw5g+PQ40g4Uutt8xmMao0ImYvezSr
	VOQFJmQfPcbDU6Jx/AGWzlt0Yy3ksNawJj4tKnoIiuvbwFxntIKAkc6cmYUCJIo+
	+gfLLK7ZNl5uqfgHPeZnNmjVrP7eW5qVkI6BdpPQ5HjNn3am9ld2yxB/u+bsLMv3
	kmJyPw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf07s18-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 22 May 2025 19:47:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-477608e8e4aso3577261cf.1
        for <linux-clk@vger.kernel.org>; Thu, 22 May 2025 12:47:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747943258; x=1748548058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vlwo72v/3bz8ukRxIg/7653/lvkTs/m7haGuKIkzqFg=;
        b=SmGOqFUbYmOWnkOgki64PCR1z+pg4z5D/yA6CZ02idqGFeJHJRBvaGbwEXVT+hdS/G
         7YcBxN3fTrhXMCunU2e/7vw/ipSvW5nq+WDIVW4C7zDfXWDdMxttxaHkl3SDqVh+yeDL
         4gCbTkMWwsMHke3yzfIJ8K/rwsws2bR3W324Xuny2AMR6DSIwl+4QZQf4X6nzuT5z2vC
         mp8Px+dYDHvzvIs+5NHMUXB1EirNdaeIN7gnKUETLIig+6zXEp4RMpB81RlrGFByeAPe
         e6OiWDz/zSp4wMt+0flySao9enuOH0cSKQzLZzbGlB5Kjxc9Gq3nolTJj0e5EFLYLbd+
         s0LQ==
X-Forwarded-Encrypted: i=1; AJvYcCWM5yGjNCAePlqDWwn3eOErOuQsT2QHP/v4AdyWBVbypoh3kDU7oddGmzYJBJ9Lf/h2GujG37Y+BMY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2NrWVl3g3nR24QopAOmJmV6Q/OOsxzPKbT6ZrqbY0l6ixQLzi
	TgcocElWUEer9sAnej22bZp7WWvocXgYpx8+TyTZ5f+sxbKKgkuEUfw7le8+dEUCV+rf7b6NDEH
	AL9JT8m/oHPl5VRl5e6Ke4UVn9Bc+k8xyfE12eVNCyD7FJC4yghEu3n9P1uvW6jA=
X-Gm-Gg: ASbGnct531bshHle2zp4hQgFOd/UJ9B3xoO5BIgOuAixLxnkI23OlRKzCrR0xZOPeag
	TkDHvpn2nigsLUD0dPJgEWxodqPfkgqR5nDJ3Fq0XZXWxB9kNWqkRpze3WA08EfTob+4fBnO1K9
	1X0GakjgxTVWUQCmPwTKbdSQX6SvNe/7FBMvKRQBqfqX4B2cCIW7GZB48yY3AyujPQmBgT6AX8b
	jZ2atKQaWl09Yv3GZPhj1tWv/KOXEXNPlKyZ4p1Nl+N8B682BhJgD3eeqvvCgUpRPMyPfVQ/miE
	7adulqvQXpJXhYgT3pxa0RZ1u6Yx5JzDZAF45H9dhTpWHjTzIUL3eSqBzGupc09qbg==
X-Received: by 2002:ac8:57d0:0:b0:49b:8831:a061 with SMTP id d75a77b69052e-49b8831a1a9mr44716591cf.12.1747943258329;
        Thu, 22 May 2025 12:47:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5VwqiEcm7K7nKCO+tiTFsUqyeBFclAgcgCdlXI/RUXoUd668SeE5MQMoMDNGnA4rB+aCLyQ==
X-Received: by 2002:ac8:57d0:0:b0:49b:8831:a061 with SMTP id d75a77b69052e-49b8831a1a9mr44716491cf.12.1747943257894;
        Thu, 22 May 2025 12:47:37 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04af40sm1123435566b.34.2025.05.22.12.47.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 12:47:37 -0700 (PDT)
Message-ID: <16fd590e-7a00-4e71-a003-d6aafa83567d@oss.qualcomm.com>
Date: Thu, 22 May 2025 21:47:35 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: Warn (and therefore taint the kernel) on
 clk_ignore_unused
To: Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250201-topic-ignore_unused_warn-v1-1-f29db78cea3a@oss.qualcomm.com>
 <93b5004dacfe1151ca3abbb0fa31eaa6.sboyd@kernel.org>
 <87241686-90b5-44fe-b4e9-1a59451e3575@broadcom.com>
 <CAA8EJppgU7_BoVCDfTuKVveBnnhtHUN6jEzkUaAou7=aypD-Dw@mail.gmail.com>
 <efd38edbed2743a258bbec7e80ff2238.sboyd@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <efd38edbed2743a258bbec7e80ff2238.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8rCOYR4qav0EYMQsY7qRJqnr0RhOyrW0
X-Proofpoint-ORIG-GUID: 8rCOYR4qav0EYMQsY7qRJqnr0RhOyrW0
X-Authority-Analysis: v=2.4 cv=ZP3XmW7b c=1 sm=1 tr=0 ts=682f7f5b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=Q-fNiiVtAAAA:8 a=Yj5yA7lCVocwFOeKnIsA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5OSBTYWx0ZWRfX0YG2gfal11zr
 smRhQWl8AE82QjO2JRua+DcvtZy0F37fzDgaaB9XkJEUGRcArVMovMRMJE2id7jQ0InI8fb9cBf
 EPooFbjGVoAsxr1nRv5YyYiXdoEy2Ywbl+cp3Uwmx0Sx9a2CgPxE/XICxEuGsgG8FnYZaNdAmbI
 E5Qzf61i/jevkmeMs3Nf+/K2+LHrkAtbdEWi8lB1MDEy/pNbYBw9YniPxUakovqF6eg6Yp6ow3x
 hQnlQ7SLtAx7xeBStEoEuM5lSSpnWlbA0YVe0txflz5epMidLA52jiOhjpCjNqW0FWE+iZ0Om7s
 mrzTMWnEwXaqhFhN0ZrHqa5oXBlfiH6hrUllQoZzzm5Nozb2+VyNm5AK2mHlmwFvih9Ju8HpEn4
 BHOE3q+3zBewu9MCE2aVkpiCEWAXZ2B0smiYpW0sbPnDAb8lwS4w8C3o1R+3ob/p9kUBAdA7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220199

On 3/4/25 8:34 PM, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2025-03-03 15:17:21)
>> On Tue, 4 Mar 2025 at 00:16, Florian Fainelli
>> <florian.fainelli@broadcom.com> wrote:
>>>
>>> On 3/3/25 14:48, Stephen Boyd wrote:
>>>> Quoting Konrad Dybcio (2025-02-01 08:52:30)
> [...]
>>>>>
>>>>> The clock subsystem plays a crucial part in this quest, as even if
>>>>> the clock controllers themselves don't draw a lot of power when on
>>>>> (comparatively), improper description of clock requirements has been
>>>>> the #1 cause of incomplete/incorrect devicetree bindings in my
>>>>> experience.
>>>>
>>>> What is a user supposed to do about this warning stack? We already print
>>>> a warning. I don't see us dumping the stack when a driver is unfinished
>>>> and doesn't implement runtime PM to save power.
>>>>
>>>
>>> Agreed, I don't think this is tremendously helpful given that it does
>>> not even tell you what part is incomplete, it's just a broad warning for
>>> the entire system.
>>>
>>> Assuming you have a clock provided that can be used to turn clocks off,
>>> and you did not boot with 'clk_ignore_unused' set on the kernel command
>>> line, then you should discover pretty quickly which driver is not
>>> managing the clocks as it should no?
>>
>> Unfortunately it's sometimes not that easy. And some developers
>> pretend that 'clk_ignore_unused' is a viable way to run the system.
>>
> 
> Maybe we would be better off with a config option that removes the clk
> ignore unused ability entirely. Then you can have a kernel config check
> somewhere in the build process that verifies that a user can't even set
> the kernel commandline to change the behavior.

I used WARN specifically to taint the kernel (which would in turn throw off
any reasonable CI checks). Perhaps we could add a Kconfig entry (unless
there already is one) that would do the same, and clk_ignore_unused could
be gated behind it.

But then, it would make it harder to debug production kernels with that
parameter, which could potentially come in handy too

Konrad
