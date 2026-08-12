Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C3743F0AC
	for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 12:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786539003; cv=none; b=fE/ycKkQ72d7VWtHj3NNtAgE1/lOSmG2StQKV8yxVIQ0j59ZHyjkrzE8moTU+eliwuIDkOQUhxOcI88qcDO74Db8AdHPlxHdakL8ETR45kZnd76+VF4XFW1DOcJLIwHigpMeky8X4lVjPuiOcT3XeiqFHt83iTNf3AaibKeesL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786539003; c=relaxed/simple;
	bh=68xt+C+zjDto8tm6NOtDFOkLOK5UfA8lj8IeS5a9lZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pAusp2mW6E4zfALG55Y6cvqxZ2/VfTs+BLHt2hipUGDLgjBkc33SVzsc6MkDwF8FsU21s5C+zwpgyEGaC+ljxnOd38s+VakbiY+masYWT90q2UcvaodBmBUYtXzMDfMsvFqegz5xOE96SKPE72xpjT2NCWwGwhG9/NyXQ9Sv9Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X54XlddI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jeO6TKhX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X54XlddI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jeO6TKhX"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CB49nD3319914
	for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 12:49:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vRO7cQGeILqoNuN9rQ7IoY9cU4C+obAiiKTkESKbsaU=; b=X54XlddIwvi/tlsX
	r7IYyYTOIUjTPpiaigGBuw4QvBCS+iBRoc5cooAOwy5cz7VIBu2X5OMYtCT4+Bt/
	83oaX4pP8gnhJGR9fI6aznCrSnMyHbmIUjziS7zkZQ+DXbH6OORbel5MKoQLmL8t
	QFsA0alNQuyIKOq3bwYf/rsI2HUhyLhyx4jlBkok0PhjbA3w98Xhpx8S+0JOWa0a
	TzDgeqw6Wp4/r/yyslKQWq7XXkpc6fJZoFlVL9Ihgz6UGJ3++2TkPWUtDvdkWpxY
	xf4MmjddngZAucQOhx2+RF95hdTksFdKa9NnaJv3C2a9vNBKGj2+9laxJmj+trGF
	qzkV9g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0pmyrkr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 12:49:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52769fc3f2eso7756321cf.0
        for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 05:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786538996; x=1787143796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vRO7cQGeILqoNuN9rQ7IoY9cU4C+obAiiKTkESKbsaU=;
        b=jeO6TKhX6XboENwa057kZZgqNlDNWAYRfb7GL527R6kB0LtocVhJjn7M4QypZVSk4g
         GaZOBpQqFmtn+cnZtLXsgiKIyAwcwf1IUPHVq9Xjpxyv683mJ0+IluFlSa0/mxxfMgQS
         q1sH9xcIjNYzOloXfih/fZ3oYUIdgtzgpFbt411+xtB8UoQs7vCiwmPVem5v2SX2eQZw
         LpDhGvgdUlIB1BP3AkZL/sHP+B+U1XSz79FIeVWwfagOn4q6L6sbdStOfsmaE5YGqf7d
         neFpZWyP2pnP9SZLZ5bHnE3CPJxqkW47wUeZMAhbj5VbzIvt97Xe+kqCpNDzbGFLcYa5
         nISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786538996; x=1787143796;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vRO7cQGeILqoNuN9rQ7IoY9cU4C+obAiiKTkESKbsaU=;
        b=T0BVctw4DjYm+ndjurJkl5fdfrQbCci3WPHbS/rLrCXOS2uXpYNoHkALUmfKpy8075
         7MkeZwiEQs2t2KJ9WX16Fl+oCJhQBg3p+GxS1C2rSaEY1Lh4AFYkkE0+UQd44TszX7Ov
         3En6HZTI8roJZk06bJWa1ZTS35C4OlWaqos9noQmUf8gXWbmSRt+rj6ssxlwGhhS9tDs
         fXGYmoZ3VxBI1JOWye7nWXiXmgZdvY7vU/9h3r3v8c7XO8odfLmfB4jq88qyNKNzI1DR
         FQGJ/lDvs23xzOZBUgH3Bn5rYPAEjaE38JqOvOhLf7YNK+aQ5cEgVwCAOEP0AL6uAvai
         sVBw==
X-Forwarded-Encrypted: i=1; AHgh+RpPI/Wj0EWxTVD3v883z9uTb1tsSgZWonJ0Nqg1no9Iodu/AGfmX7cB+TXKkqsv9+HfJd1bVtXBJ0g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxR+2Plekxvc82gZ8KsEBOU0Q4BP+KudtFZaObs6BeKDcTqtPuE
	1eeJcQrkKegN0HqKqd6eH1GIbKVl3yN0wEyH0k9fLs/ImNJKHq/KhXr75//75Sxlj+UFRdnup9O
	ExUiuGzVb//6QltjFGF5XKxUkj2MXem6r2enTpMKMabNluItzzNkXNn5LJiQtVrw=
X-Gm-Gg: AR+sD12P6Nsn928D+ZAPwmMc5oST0OI5tAiT0RmI/D2JL32x1mXDew4kB6+Oa46gfhe
	2iENWOKe38C42756eu9uK3si6wDWQ1dXwnm3Wd8+UwK14/bUkDCdr8Lh8FGK8pr1qOMTIECBcEY
	sJEUPUrzecOzFpzlizowhfGVaWIqixvti593hg8KFdEJSGScio0GqGkDIS28UgQ1WQ71PN6Gjdq
	QDv5lkdhSe1TLA2d4RioEQUf5OTTVC7qQbfV9BJmLiAM+N/0uBFx3ucSx0zL0HpeePfmSt1VsBZ
	WTAhmbDaGtDhhhSE03zCNDkzWSz+Snri3DomBVDwLnB9TXwqp6vJc7WbeQkpiCXs6d2s7EigyTq
	yWKbIqapwZMe4teMhUnSR+m0hLmRBSw==
X-Received: by 2002:a05:622a:2d1:b0:51c:1b3d:fe62 with SMTP id d75a77b69052e-52d6486aa8bmr37551171cf.28.1786538995888;
        Wed, 12 Aug 2026 05:49:55 -0700 (PDT)
X-Received: by 2002:a05:622a:2d1:b0:51c:1b3d:fe62 with SMTP id d75a77b69052e-52d6486aa8bmr37550611cf.28.1786538995411;
        Wed, 12 Aug 2026 05:49:55 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997c94f4c0sm41673635e9.8.2026.08.12.05.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 05:49:54 -0700 (PDT)
Message-ID: <e5a838f3-609e-48b9-aca6-a25fe5453cd8@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 14:49:52 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 01/11] dt-bindings: clock: Add Realtek RTD1625 Clock &
 Reset Controller
To: =?UTF-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        =?UTF-8?B?RWRnYXIgTGVlIFvmnY7mib/oq61d?= <cylee12@realtek.com>,
        "afaerber@suse.com" <afaerber@suse.com>,
        =?UTF-8?B?SnlhbiBDaG91IFvlkajoirflrold?= <jyanchou@realtek.com>,
        "bmasney@redhat.com" <bmasney@redhat.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
        "linux-realtek-soc@lists.infradead.org"
 <linux-realtek-soc@lists.infradead.org>,
        =?UTF-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
        =?UTF-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
        =?UTF-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>
References: <20260812020009.3480538-1-eleanor.lin@realtek.com>
 <20260812020009.3480538-2-eleanor.lin@realtek.com>
 <313b74fd-1a5f-4e1b-a4e2-a537f7939fad@oss.qualcomm.com>
 <fd254ec8d59a4ed3b4ea157b866ce798@realtek.com>
 <d55ed65c-b066-47aa-b285-c9582894b84f@oss.qualcomm.com>
 <e2c90bd25e654e0f9ce1aea6e0b4f74d@realtek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e2c90bd25e654e0f9ce1aea6e0b4f74d@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEwNCBTYWx0ZWRfX3ocdFXgA5muf
 rFS0z/mQjE13DPXtsKcSqpx4+XZbQoAOB8m6E8r8/n/KLTQJultPsu6LEqj+P4lYV5TaesCP1fG
 YbDfYYVF6LDBq4/c59134Mtz8+46AOo=
X-Proofpoint-ORIG-GUID: YS84ee9MIfgudvyF_HjvE774vsMTKi_Q
X-Authority-Analysis: v=2.4 cv=C/fZDwP+ c=1 sm=1 tr=0 ts=6a7c6bf4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=n9Sqmae0AAAA:8 a=_thU5h4BxOvQXo3MrM0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-GUID: YS84ee9MIfgudvyF_HjvE774vsMTKi_Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEwNCBTYWx0ZWRfX8X5cNQtmfbb1
 ZE/qMqHIOjSAU8MNPE+zIuE2HOllpeliFK8dDNwk1IbaeQEr3gscFVyHKuqjyM8RXZZpon+58wI
 uU9eVowPDm1GTB+2iG11cIPheZhxUnF3VZamoJ6qY4Iyj09Q3WPsdZ8YvPkoOeU2d4CsJRlHR+C
 XYrLvsJI4Y+aM6tkRqcxL7MQ1q4mhZwYNtKsF41ekq2kf+Uzmkc+7e68iP4otI4qGgXSnBE+26H
 31ji2mtgse99yHR5rKtWGnYLfRvpCMj6UdOdOneQp4Eo6Y6smjDY3dGCHQ9zV9EZIARaka8Rwej
 5Y+wV164i4iYkKWJLr3wHFd0ZjiGCOrqzjsa3zrUqS+mvZDQIruPHZhJtbo08Bv+zihEf8IQ0ci
 cSm1CuuWMBCTm1oRyVGfKZOijcLsf19XQioT/2F6482vYh54QoU/t5M3Wj2E3CaoWsdxGbP5vgu
 Td6v7f8x/RTBc+rEoBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120104

On 12/08/2026 12:22, Yu-Chun Lin [林祐君] wrote:
>> On 12/08/2026 11:41, Yu-Chun Lin [林祐君] wrote:
>>> Hi Krzysztof,
>>>
>>>> On 12/08/2026 03:59, Yu-Chun Lin wrote:
>>>>> Add DT binding schema for Realtek RTD1625 clock and reset controller
>>>>>
>>>>> Reviewed-by: Krzysztof Kozlowski
>>>>> <krzysztof.kozlowski@oss.qualcomm.com>
>>>>
>>>> How my tag could appear here?
>>>>
>>>> Look:
>>>> https://lore.kernel.org/lkml/20260324025332.3416977-2-eleanor.lin@rea
>>>> ltek.c
>>>> om/
>>>>
>>>>> Co-developed-by: Cheng-Yu Lee <cylee12@realtek.com>
>>>>> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
>>>>> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
>>>>
>>>> Who added my tag? What is the actual flow of this patch?
>>>>
>>>
>>> You gave your Reviewed-by tag in v5. However, after that, Stephon
>>> provided additional feedback. In v6, I modified the patch based on
>>> Stephon's comments and made some other changes. Furthermore, I added
>>> the clock ID
>>> 144 in v11.
>>
>> So how my tag could appear before Cheng-Yu Lee signed off the patch?
>>
> 
> Ah, I read the rules stating that "the last Signed-off-by: must always be
> that of the developer submitting the patch".

This is correct interpretation (although some subsystems will interpret
above only in respect of other SoBs).

> 
> I mistakenly thought my Signed-off-by had to be the absolute last line of

This is correct.

> the entire commit message. Therefore, when I inserted your tag at the top
> of the tag block. 

This is odd result of earlier logic. If your SoB has to be the last,
then obvious choice is to put the Reviewed-by tag BEFORE your SoB.

And in any case you should use b4 since it would do the correct thing.
All patch submissions are supposed to use b4, so you don't make trivial
process mistakes.


Best regards,
Krzysztof
