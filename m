Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0342A29BDB0
	for <linux-clk@vger.kernel.org>; Fri, 26 Sep 2025 09:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758879681; cv=none; b=TuCL2yzWd7aDS1Bglq+1U/5rkSw+YDOFV5BkTtnSeAluCILSwU923+g3DHZgYwhPgYPtGJPpYQQmMLXZhorpN/1i26adlNDx6KRZd0kMGiEzPYzSZ0OK27PNPrDeWuPrJvUsi0qkWM/nGckHKUah5H+eIlVXk2CePStvoT2N9Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758879681; c=relaxed/simple;
	bh=pgsPj5JFVxG8IVuvZQjPRHJ4A/JS9MuzRCbUekOi+OQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qDdmg+9RXw+IYkMg8RD05gd0BENuLaXun5dewxiLYd0TLDmJAuZaeo+HTKLI/PWa6RbzpfGBsM+VA6L9it7GSzNxC7zuONWXq4SwHiAu6sC/NNtR6F/aSDTYmfqcHu0pADjd43S79oDznCqeO1RDnKBnHmZAwyXdlwQHFEcbcVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KfX8SaGR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KfX8SaGR"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8vZld030515
	for <linux-clk@vger.kernel.org>; Fri, 26 Sep 2025 09:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ka3cnxbDpIJI+JEXC53b6wHr7c67reoYoRjFINA0VTc=; b=KfX8SaGRmrmxpH69
	bmu1D7abRshuLS22O4GSnKn50JRePoLBx6bb4CpmmYdkgkYEyWyiS34fOBoDJKrA
	EbBRtFf7LpFYe8oZ4yJutwXFoKSrcJfoFR9BbLoFsjpXJajFhUxefH1dvpyBi3em
	r5CJ0uCYT+HQjC+ODXJsL4lG3SAmX4OCydXmyf0QzahV0kNERA6b1gKH1IrY9Ooc
	ZD93y9Udz8KgY9UPCLV6DPjE4L/Kab366NJNjY4/tl4jbuvtwTAmqOJ2JWucSg+z
	l8j9CYTEn2blsdyBfY4RnT4yXYalvCrVc/9tImpRbRsDJekTu0YLbli1CVSZ6S9w
	EghL3A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0u2b5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 26 Sep 2025 09:41:18 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b4f86568434so1465867a12.2
        for <linux-clk@vger.kernel.org>; Fri, 26 Sep 2025 02:41:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758879677; x=1759484477;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ka3cnxbDpIJI+JEXC53b6wHr7c67reoYoRjFINA0VTc=;
        b=HcvbWwC7flysE4XiUGlgJFyAcQkBGsFVjAy/bwowjItbk7l0ia9Go6MHLtbAdkRcNR
         JIs36hRr2+SdCkGtwVxxosd/TI/4AF+xnVpcIPDjfnG2jMS3t3JZ8mnitcXhf1o/UCJi
         kz6JY9SFmnt3SenJohPzBh4I3WW49ZxxWOQ668sCN1lwbrLkKcH8zXD/pOoXvj68wCaJ
         kAUiLTHh31xwkvQfQ6HPoISc2OpRrtaKFqjCf7qkxvB8qfvhCjX3luoQJezYDCzYwO8I
         WuFDXd7qgoGUJDnAgoigU0AhVHNM2bxFqGlGIig9twYd9QntlBgKdefZQ3MiWKOKuPoK
         2xPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuX5/Pq8/W+UmF1cCuq35wQbj+Ce/B/zzQQ9u0a/5tt2Dz81iCN1+tHvRd9I7ecg8QJASC3pafbl0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAAlC8/c3xz2oWEcDtJH8ixeo1mK2xU+xpz1LHQsR76PZV/aCk
	mYY1xO1LC/9XWMaHh6tdO5jrJNH/zMNgAhpyTOG0dWmwre/Q1dyS+zsEStXqzWmZnYLnMhqk546
	xuUddh6FQOSD0e8Zv+3hdBhZXwPvjaOxLl03UcHZHKQcjdzLxYtKjP+DiMiaImE8=
X-Gm-Gg: ASbGncvYAx7REEwpLqpATGumjBbwySAPJeJuXqkGPexiGcnDUbooONrO3qi5DpUzKSz
	GHoWk8IJzYMMBMkaOQU0FRKa4cu1PFNB4TiYNCYfSod65qr4S7ZWwT2p5LpaWyMTuj+JFdf6PAt
	R+8+VDOkpODkYM4RFe60+moBlQl7AAZLoeIqJnLJvNF/wS/Q4Gh5r09eBDEc1pol1N72BE7A9El
	CvO083jy5Y/xCS9CUrcGhdhIrXF8RN4abVkhJnvq+SCtQ3Cmy2mAIaKxF0cWnbn13zjx288F4OX
	OBTtNaj9c5eMW0U2/1nGxDFme9/oQkL9kHfG1r8GQjJMy/kInUMmo6f8RApsAz6fS9MC
X-Received: by 2002:a05:6a21:6d95:b0:262:d265:a3c with SMTP id adf61e73a8af0-2e7ceeee4a2mr8883838637.32.1758879676975;
        Fri, 26 Sep 2025 02:41:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuz5klMcIvb3MrZNi4OCbe3f77NecmpBgpEJ6NFqmrwZg1RuNb9Z/s7sKtMM9LiBIcoSu0yw==
X-Received: by 2002:a05:6a21:6d95:b0:262:d265:a3c with SMTP id adf61e73a8af0-2e7ceeee4a2mr8883796637.32.1758879676491;
        Fri, 26 Sep 2025 02:41:16 -0700 (PDT)
Received: from [10.217.216.188] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c559fd56sm4251511a12.38.2025.09.26.02.41.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 02:41:16 -0700 (PDT)
Message-ID: <8b74581c-9f74-40ef-8fad-7e172dc303d9@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 15:11:10 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc: Update the SDCC clock to use
 shared_floor_ops
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
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
 <db8241b0-1ef3-439e-8d74-a3cb86b610ba@oss.qualcomm.com>
 <d0871d6d-7593-4cbc-b5dd-2ec358bda27a@oss.qualcomm.com>
 <7c1bd3d6-159f-4269-a22a-34290f1be0cf@oss.qualcomm.com>
 <uuhcud25gcbvogpyywmuv2rn6fq4ssns6x2u22a7eqjknf7oes@kvdrw3iqqkbi>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <uuhcud25gcbvogpyywmuv2rn6fq4ssns6x2u22a7eqjknf7oes@kvdrw3iqqkbi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: PD1bPrZm4hDg5ouReoCTMzl6TVL1WXrg
X-Proofpoint-GUID: PD1bPrZm4hDg5ouReoCTMzl6TVL1WXrg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX0CHzh6FbAko1
 xXt7aGurkiCRmw3233uT9+SnwtVQm0WDP7ehike/rPQGanA31QLEXxI+0bmwCDTm0T1Cvx6KOM9
 QDkdOnzsxNwhTx3AgJEFUQMpO0tb9/MkkwIOKCw7ycb7tC0OAEwQI1fJ+lxIPK8BTK5WZT7EFj1
 gJ+jV3ZvMnpKLx/h2txF52C2PYHsmYFHH08Pm35Cyjl3ffgG+2kV+g2RirWYEWfXvvcpw+R+a+W
 Jb31KU+k3V/Yz0V6MGHdg3LxTrV3V6XN+AaWrOtGmzS5ZIxnzALgGGWZdflOa6b0hO4uzcu1eBF
 3NGm54g/ildmUrWomAevSYLUBPx4KS118jbc+ygwkZPywq0AputAo71m10gFRDNtsyi+wTWO5br
 Oa2Wxy34u5JxvKg70x6T+AR4nAwqsA==
X-Authority-Analysis: v=2.4 cv=ZsHg6t7G c=1 sm=1 tr=0 ts=68d65fbe cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=rUtaezTdWwXcHsiEHkoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171



On 8/8/2025 5:48 PM, Dmitry Baryshkov wrote:
> On Fri, Aug 08, 2025 at 02:51:50PM +0530, Taniya Das wrote:
>>
>>
>> On 8/7/2025 10:32 PM, Konrad Dybcio wrote:
>>> On 8/6/25 11:39 AM, Taniya Das wrote:
>>>>
>>>>
>>>> On 8/6/2025 3:00 PM, Konrad Dybcio wrote:
>>>>> On 8/6/25 11:27 AM, Taniya Das wrote:
>>>>>>
>>>>>>
>>>>>> On 8/5/2025 10:52 AM, Dmitry Baryshkov wrote:
>>>>>>> On Mon, Aug 04, 2025 at 11:59:21PM +0530, Taniya Das wrote:
>>>>>>>> gcc_sdcc2_apps_clk_src: rcg didn't update its configuration" during
>>>>>>>> boot. This happens due to the floor_ops tries to update the rcg
>>>>>>>> configuration even if the clock is not enabled.
>>>>>>>
>>>>>>> This has been working for other platforms (I see Milos, SAR2130P,
>>>>>>> SM6375, SC8280XP, SM8550, SM8650 using shared ops, all other platforms
>>>>>>> seem to use non-shared ops). What's the difference? Should we switch all
>>>>>>> platforms? Is it related to the hypervisor?
>>>>>>>
>>>>>>
>>>>>> If a set rate is called on a clock before clock enable, the
>>>>>
>>>>> Is this something we should just fix up the drivers not to do?
>>>>>
>>>>
>>>> I do not think CCF has any such limitation where the clock should be
>>>> enabled and then a clock rate should be invoked. We should handle it
>>>> gracefully and that is what we have now when the caching capabilities
>>>> were added in the code. This has been already in our downstream drivers.
>>>
>>> Should we do CFG caching on *all* RCGs to avoid having to scratch our
>>> heads over which ops to use with each clock individually?
>>>
>>
>> Yes, Konrad, that’s definitely the cleanest approach. If you're okay
>> with it, we can proceed with the current change first and then follow up
>> with a broader cleanup of the rcg2 ops. As part of that, we can also
>> transition the relevant SDCC clock targets to use floor_ops. This way,
>> we can avoid the rcg configuration failure logs in the boot sequence on
>> QCS615.
> 
> the rcg2_shared_ops have one main usecase - parking of the clock to the
> safe source. If it is not required for the SDCC clock, then it is
> incorrect to land this patch.

Along with the floor functionality we require parking of the clock to
safe source for SDCC clock. I am reusing the shared_floor_ops introduced
recently for SAR2130P explicitly for SDCC clocks.

> 
> If you are saying that we should be caching CFG value for all clock
> controllers, then we should change instead the clk_rcg2_ops.
> 

That is not required for all clock controllers and which ever clock
controller's clock requires it we use rcg2_shared_ops which was updated
to park the cfg.

>>
>>>>
>>>> We can add the fix to do a check 'clk_hw_is_enabled(hw)' in the normal
>>>> rcg2_ops/rcg2_floor/ceil_ops as well, then we can use them.
>>>
>>> FWIW this is not the first time this issue has popped up..
>>>
>>> I don't remember the details other than what I sent in the thread
>>>
>>> https://lore.kernel.org/linux-arm-msm/20240427-topic-8450sdc2-v1-1-631cbb59e0e5@linaro.org/
>>>
>>
>> Yes, but as I mentioned the new ops looks much cleaner, so wanted to
>> take this approach.
>>
>>> Konrad
>>>>
>>>> AFAIK the eMMC framework has this code and this is not limited to drivers.
>>>>
>>>
>>
>> -- 
>> Thanks,
>> Taniya Das
>>
> 

-- 
Thanks,
Taniya Das

