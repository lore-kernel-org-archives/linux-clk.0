Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C1332A3FD
	for <linux-clk@vger.kernel.org>; Tue, 23 Dec 2025 10:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766486975; cv=none; b=ZAmbo+4XZ4hN1arI0kWfMe82TUq3YYHajw4pNOj9Lw7dwfyL/H5njxjIcNiECaGF88wgrIKBA3Pp8oDpa29B/btiMI+ZdtjzNkxnZg7AxpTI1xKuZrnK+hlssWzM5CJifjrCuo76OWPjREwwzfnspzQrfrzHndEhmD4Lz46Jzqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766486975; c=relaxed/simple;
	bh=ChHS2JPkUPRNHFx0VAyUavKlUBubCODN4tuB4XTsI70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aATsMN9o172/82m4eCRpaHpVAy6jSSyZ1xfwGwBUu8l7yOJ1FUiSdNGyD+SgoRmCGNnGo+iZIquYZevAuXixAX9rIo8sXSeIHvEvD2uXXH0ZiVMqntbG7TVhbACl0xFhr0azFjL387H+rL/ZdzTby7MWByzvfIHgFuTyO0ZV4zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nKpwwWsY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jJmSoa6Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nKpwwWsY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jJmSoa6Q"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNAnAFI1528815
	for <linux-clk@vger.kernel.org>; Tue, 23 Dec 2025 10:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JKBwHCYSbYIWW3G7Sc1xuSQXA6rM0/QQy4Vu6KzBCFU=; b=nKpwwWsYXt9o+EmG
	IA7MJ8Gd3B6ajW3VYsftGPmO+nYO+QEtc5iiIBa/65Yyfo51sUgG8viJCfcAKYo1
	GR2hFoJDaiw6+fYKs8qQJdoL/O6cmZE4k5pe4+kEsTLzEqQtgfQj+Ssylr6lyiaJ
	fW59z1Ivfe36POumGEA1kBg4vyeijX7JkFD67/I3C1f/HIUflCVF8SdHpusWVmki
	stQy9gIJ502yrmD24K4NoLh+zUQ1u0c4w6VyjO7BURtGu/gr1SudaL4TtUyQ7C9r
	Si9gn58U1vlPwaPNCRuzlbN3fbG0FJDOBXQX0e9NX8i58Jt0Yj/ylDwqKuDLOoPW
	Rbp7lw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b758y3mka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 23 Dec 2025 10:49:30 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-804c73088daso1484587b3a.0
        for <linux-clk@vger.kernel.org>; Tue, 23 Dec 2025 02:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766486969; x=1767091769; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JKBwHCYSbYIWW3G7Sc1xuSQXA6rM0/QQy4Vu6KzBCFU=;
        b=jJmSoa6QVEyL9dTpaYlHKI30NdUtp5ZxVtSG7S6zcJvKuwpKR+y17P9IfV+D4OdUaa
         VZNoaJd26Kl2L0g0BJodzrjyrux/NrdC3kV23+6nZfYVCL7jbTxwPKDSXO5Se48c47AB
         Rt6MCT02YmYxHi9I1y2YWozjMxtiYdysv6z2YtsTNsntFZcIrocQ64IwPl+Va7VyEqkE
         M+a1ZreRG3/SxORf/+306xHTdUnp91xvpQwfBrWUXN/ohSr8TSrv/CRGln/AnvtvEbQk
         3vBR6rOAMHOUnweX38UKFDpTNnmUEHujq45vzeJUCe4A8GuJDWZAUMv1dcXsPzWS/ny9
         boNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766486969; x=1767091769;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JKBwHCYSbYIWW3G7Sc1xuSQXA6rM0/QQy4Vu6KzBCFU=;
        b=psg9Cb1kRNBwMmtOSLUNDMyF4WNSlz9LEVG/FLvko/T4VoB+IFaeb1BM0eNUFw9Nje
         dUxmqpc1GPL2FcSJdOe2L339nEeXrEcizSipLBW7rNPcCtWIOvpv5zLtA+3Q9Oin8AWl
         mmgz0D+uTYWHaeYS48w8afzAH3UI+KuzwHdbbGSNNakGcI9t64RHFVXgpqR3EB4UUEsq
         6mztRge0QR5HAJVSGIwWVAl7JQ7jpb6AMHH3ZXYkjbWpuBXLlicF+D+mFLxutQ8v5+ut
         k9ZyjD8H6W3JPy/rEZb+wtXIyDwz2jsBxqU17yOdfO5puF9s+JsnjRS6vVAeuX/1ygBg
         ig1w==
X-Forwarded-Encrypted: i=1; AJvYcCU4YUmAzWKllpCCDjQlCw4KaX7gkGdR58yL9MTq5Y6euDmbS7etHOVpQKWgIz6elDm1tGEclFru1o4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvvVs+igqZviuNnlRaRkFByp92gt0t+c9ey7xX7lbLtpGtHcgX
	0COPAbe0PoWKpAKUZCQAnKwAsbtywP2tot0DcUrQItcykPbuMzuMh92H+l4t4W6/jyHAG2l7uXN
	NUlClWWb7ASYk28I4NlVIgIEszWWUsfNZCiNIH1CB63GqloJFkL0xDbTlybiZ5iA=
X-Gm-Gg: AY/fxX6S2iH3swOv05ezaQtzJHC9vxeeupRtbn0pX8APDP+3E0FcG0C7mk1FDtloDao
	BbaRlU4hU0CkTCCEG6uLLhjnPZqgwAf7uBRD+b7SwrNv2pn1JWoy2H8yusgeuFBKOSxJ6kUhxXb
	W6RAKCl1vZaARBYLUnM5btUFKGz2LgXajn0X3dy04e2L4eIsCwxfwCLxtzi9Hw1QqdvdWDdeU5o
	BFH8rHeDXUyl+LrhGcZ5yRhnCUMe4qIDZylO7wnzQI/R+PTELzqQgPVEMATXCdgO4PIJ859B4cK
	17jdjSebdTPzvJHCgkrP7a7o5Y3H2PPJRdGyTqeR8of2ZCt3ELqLTBGgp86p5HSZOLYgdPKcA/Q
	x+R8Jza83Ud0xVdA9s1KcQ5l2uXpGgt551c1jnQ==
X-Received: by 2002:a05:6a00:6b93:20b0:7b8:acdd:23c3 with SMTP id d2e1a72fcca58-7fe0c0fbefbmr11463437b3a.11.1766486969221;
        Tue, 23 Dec 2025 02:49:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1v/1HacvwG7DWXzwiLrvcU2Zusz8BK/bUppipGd3g3H//7IAWFp+IVDMaldG9feohRs6Z6A==
X-Received: by 2002:a05:6a00:6b93:20b0:7b8:acdd:23c3 with SMTP id d2e1a72fcca58-7fe0c0fbefbmr11463420b3a.11.1766486968718;
        Tue, 23 Dec 2025 02:49:28 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e88cd71sm13327808b3a.64.2025.12.23.02.49.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 02:49:28 -0800 (PST)
Message-ID: <a63f2bc7-11af-46d1-a950-60a25ef79bb0@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 16:19:20 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] dt-bindings: clock: qcom: document the Kaanapali
 GPU Clock Controller
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-7-fb44e78f300b@oss.qualcomm.com>
 <20251126-elated-stoic-scorpion-25b630@kuoka>
 <de44560d-4ed8-41fe-be7b-56412b933a8c@oss.qualcomm.com>
 <fbe39eac-7c92-4a08-bafb-31e5c51a0613@kernel.org>
 <503f445e-0d12-407d-bc77-f48ad335639b@oss.qualcomm.com>
 <e8bdb176-b6fb-4dd2-8b5b-9da8073fa915@kernel.org>
 <ca118faf-3451-4b83-9074-82bc5e1f731e@oss.qualcomm.com>
 <3e8128f4-3cba-4c13-a846-e5f1638a1e0f@kernel.org>
 <701a7b2f-848a-4cc0-8924-ec72155d93a7@oss.qualcomm.com>
 <65e5459b-7509-47db-9089-6efecead3f44@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <65e5459b-7509-47db-9089-6efecead3f44@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TOdIilla c=1 sm=1 tr=0 ts=694a73ba cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PurT2Iiaq-uxMnD6zWEA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 9gu287Z-xmZvK05h2HriaBa2PLWQU_ya
X-Proofpoint-GUID: 9gu287Z-xmZvK05h2HriaBa2PLWQU_ya
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4NiBTYWx0ZWRfX6Eps26jS08y2
 Njvy/PwNpA1FXff17O2g9nfgkHB6Cp2Z4hN1X9VVfSDfjufhRTS/l2fr3umdFJwo7J5x4CbsKym
 lIPFmb7d3Bb5x7iDD8NomYCA/EUrPbJwDW4kcXJ0eqQiEWO6QshjgzcbUpbCC8KX5XBlyTOtiW7
 iRkB3EtSv5BWrXrGjbiHJ9G7XBXTZfPuFfKRoMGPCgQUWWh9cLYw6u61fragV8FCd0aFpZr4PA/
 HRoX29lCvuqoob1+U9qdOeHwNMriFZyp0NQhgyq1a2UPVbbLObrmhqysKQLtUWnRe3By10DWhl6
 SywEYksJ05V0FTC2fl1mGX34J7uTa03/Xz3BsDltK5TfnKiikQVBVSUjoZVoP0c+VzC9XKFZIOe
 Xz9OZrvOJl7EayH3tRMJq4U93+zejVwBq+dEysURCCu/D6h3fwht8ZKeYiwLJR7cJ6ajlGPtkU6
 5+xa/1TsqURNJpjVHJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230086



On 12/19/2025 8:15 PM, Krzysztof Kozlowski wrote:
> On 19/12/2025 14:02, Konrad Dybcio wrote:
>> On 12/17/25 2:54 PM, Krzysztof Kozlowski wrote:
>>> On 17/12/2025 14:21, Konrad Dybcio wrote:
>>>> On 12/17/25 11:09 AM, Krzysztof Kozlowski wrote:
>>>>> On 17/12/2025 10:32, Taniya Das wrote:
>>>>>>>>
>>>>>>>> We would like to leverage the existing common clock driver(GDSC) code to
>>>>>>>
>>>>>>> Fix the driver code if it cannot handle other cells. Your drivers do not
>>>>>>> matter for choices made in bindings.
>>>>>>>
>>>>>>
>>>>>> As it is still a clock controller from hardware design and in SW I will
>>>>>> be map the entire hardware region and this way this clock controller
>>>>>> will also be aligned to the existing clock controllers and keep the
>>>>>> #power-domain-cells = <1> as other CCs.
>>>>>
>>>>> I don't see how this resolves my comment.
>>>>
>>>> Spanning the entire 0x6000-long block will remove your worry about this
>>>> description only being 2-register-wide
>>>
>>> But that was not the comment here. Taniya replied under comment about
>>> cells. We are not discussing here some other things...
>>
>> Right, you omitted the part where I answered your comment from the
>> context, so I'll re-add it:
>>
>> """
>> This block provides more than one GDSC - although again, not all of them
>> need/should be accessed by Linux. I suppose just enumerating the "extra"
>> ones in bindings will be a good enough compromise?
>> """
>>
>> TLDR: cells=1 makes sense as per usual
> 
> Either list them in headers or at least explain that in the binding.

I will take care to list them and explain them as well.


-- 
Thanks,
Taniya Das

