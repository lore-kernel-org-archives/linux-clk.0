Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792748764;
	b=W4ol9SASQUJp1tn0/NEgFxmU16PuGkvWnRDDGMDyB2CAFXw3LNVlvjnPOGhwwmD6K9cp
	 s0Xdd3aun/Ndki6V5PF+6zNowG1TpzPfOdJLeujUe9VVyxLzMj1aSKmu3TMEM14HN6FG7
	 TO3+GAj5nKtF1iXhq51lKFL6TfyYiF0/XTGfSWw8paWePyxmuc57cZoilmQDOFEtxwPkV
	 TtDQvrCpdV+vdXOAOy1UyB9kSnlauJSFnZ6reuNgCWMU3dmDr4Tp3EE8CygP1o8bs+4pL
	 CnISokdhCS/Jtv7pa9/Q2NeDAtHsX/pdpdlp8jxx5bn+brZtCDOa9WgX2KEIU+NKBdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792748764;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sv984i3EtPZRLgQvL+4afIipg3exs4lVXN/3p5iVk3M=;
	b=LhDSK04FpoV0Sd2cEn54t6RHmk4rHfsP7ZZtSHpkOaedkmhZ5zvSyKWkcWjQA5EcXARg
	 oEE3RInKvz4Py3rUN1S9R/WI96Ul4/jLYJ18NA4Fls3IYHkhjA+Z1Lfh79O9/NQ4VmPJb
	 8mlDk8mROXACkZg3mkBoimbpwUhqSP+hGzBlTpeJ9ox5y5IuwmYnBTSWqI2SvLG0mfduH
	 i3J8extC/VIE7J1SMeWihA0wDEdDImLddGIHLbWRYwKZl3Y3owAoSn+MuuexIR5rnMOLA
	 t8aWpMg0Pml7s2j1l+oaO8x4NDAtJHEIRgghJZo/slOOuYyKRjdg7kcWUE+//+SRFrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TLd1pMg+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YwJ0kDr7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0403606A31D
	for <linux-clk@vger.kernel.org>; Fri, 23 Oct 2026 09:46:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0403606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TLd1pMg+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YwJ0kDr7
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FDQw2092868
	for <linux-clk@vger.kernel.org>; Fri, 23 Oct 2026 09:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sv984i3EtPZRLgQvL+4afIipg3exs4lVXN/3p5iVk3M=; b=TLd1pMg+hsh+sdis
	QuLNWthzsTT0eaJHxBBFbAr0m+dnNKNHG0+pHCHT4dAK71TN41vEotrFSBThAGuN
	cPNoXPOM3EbOtRya6rlgET1hFeiH02KpqEoErtjAM5fbFEc5LLKpg7FMdgSxeah3
	qEMqGvTA5+KiJF+L6YB5mORbgxyl/FEZw53rsd0Up6eIlWgU6RFMLey0Dumbho37
	0tk0KBnC7N+HrhVf43wwITiYdjigP3/Omp8wurlX+LMYjTXilFSmEEaXSXAxZLe6
	IW8OU8sbJhlaacAfmT3Oja3FYk9XhdGBgmCWyx2lhYcTKccS5tYaTC9py5tt1srj
	i8oCzw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hftyga8ps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 23 Oct 2026 09:46:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53389750985so1347731cf.3
        for <linux-clk@vger.kernel.org>; Fri, 23 Oct 2026 02:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792748762; x=1793353562; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sv984i3EtPZRLgQvL+4afIipg3exs4lVXN/3p5iVk3M=;
        b=YwJ0kDr7N3llpVFNpy0AeIo2LlY7dm/xGvKkj1ELKqggFNOGXQsrWlIfEbyBolNZFK
         9XfGpTstOptB46wc4xpl4r3wwFp2nIOH7VEvh5bo30hNli2HSuOora6PFXI/y82Uij+L
         kDdraxB7R65rDMA+AW0GNhIboPPQ2Cz7dCgeEpOabJ4X/QNoDI3atyK7c35/4yUUftLE
         Eu/borcPcthnJNii5GDwvYev2gDTtowp3kvgwrzKfForYBFNOLun9gmnuPQlmvwM9hvG
         19wWR/vomnGlPZ6mzpbY3D986LaXIb/q/GynBc9CUCStC3+ZoOcuQcmZzZk6ftEeFQOz
         HGIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792748762; x=1793353562;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sv984i3EtPZRLgQvL+4afIipg3exs4lVXN/3p5iVk3M=;
        b=n5ckwEKTOQhosExZbul/vBnLCwzCsiw31hKODF3/EaNlgRjwGX1u8XVcHW6XaapEVd
         VMF513afG3Lp8CAGUj7qBnV2GRMIwIQKJ1uysEbZTHhqith9MGjMxec8uVQioarcpsRJ
         iXPeoYuS2CnRUxgrI8umKGjTMzl1Zqn7nWsa7XLMboH+emhEVlAx0bfG+LMKFKw9I2Kl
         mZPdnfq/nA07+QIWG0u272NFL5EdLCrk5e3+r/hdCh6xokZtF6t9rMzatDKhOXC6GlLG
         /Cpw7x3Tf9hWgNPuamutZMqfvXjAw4Y0ykZ26/IPjJl3+ik06FqyPLTqIRPN+ByFFklF
         G6/Q==
X-Forwarded-Encrypted: i=1; AKwUvBw7XTK2jdJwAW0EVwdNvOQgFsIV1bEiWyonVXhlKXjIbZWnxARKrhpZZnb7eFoo2A4d17h3glHSXnA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSDoW2Z2eTu5ksFJimq2mrOOPmaqJckF17r6nvSLT3LlVAT1Qu
	RWVsR2jz+wQRZg1P/gji5srUNmEgXC5vO9X7UCYZ+bzezus2ejgm+OLUd3G4H3YAXWakGFEu3rg
	Tiou2rZzK0qado+YM+Y/PjPc8RUCDeQBm3Jx6uRprdzCJjftrWjPo1YmFfbPCDho=
X-Gm-Gg: AYBFou2MTsjr/hct+92lXRx0zi3iHAWbc+xHbTUJjtgSe2jZtC7kblaCq20hnhES0Uv
	nL5irn2QaCTthcrUrf2jMA6dYMmDW+zfVnhD5wjdhXA6pu3WnhCY0Ibv6uPclU7CktegyzXb399
	2enh2a9syQaouJrKGprg6Xca7lgk4m7WWnVbPJaOD+RkorCOKehUJNA3Iuwv76SJNyQGWt7XURz
	KiyjutK/NU+ZWXEBu16thCjhmFoqv2CnloL6+Un9EJVqEHNWqR8h7z9+wswBhCDl+Pml+p5Al8F
	bvS7LcshySquM4hOB8pLscOeyrWIf91Zc+28M93uHuzwgjMCZBZG/5u9hR2hI5ksiHjUeNXNQHX
	KjxDV6ZElqmo+l3irRSQWMA==
X-Received: by 2002:a05:622a:ea06:10b0:535:162c:2e81 with SMTP id d75a77b69052e-536c293f856mr20737181cf.5.1792748761842;
        Fri, 23 Oct 2026 02:46:01 -0700 (PDT)
X-Received: by 2002:a05:622a:ea06:10b0:535:162c:2e81 with SMTP id d75a77b69052e-536c293f856mr20736901cf.5.1792748761235;
        Fri, 23 Oct 2026 02:46:01 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5c4d827sm85500066b.15.2026.10.23.02.45.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 02:46:00 -0700 (PDT)
Message-ID: <729312d0-d48b-4c92-ac6c-98ffbb23d7c7@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 11:45:58 +0200
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-ipq6018: add fallback names for the bias
 PLL parents
To: Robert Marko <robert.marko@sartura.hr>
Cc: Julius Bairaktaris <julius@bairaktaris.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Vladyslav Andreichykov <vladdrako007@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261020065430.1251541-1-julius@bairaktaris.de>
 <30c21159-3008-463c-9cd2-a07f26668a25@sartura.hr>
 <9699033c-a9e1-4b11-a55f-b1aa216c700f@oss.qualcomm.com>
 <CA+HBbNELhPAAZoUuXm3SrvgxiU0eMaiu5LB3wfup04_HuZ+yxg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CA+HBbNELhPAAZoUuXm3SrvgxiU0eMaiu5LB3wfup04_HuZ+yxg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cZpHPXDM c=1 sm=1 tr=0 ts=6adb2cda cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Rp3BUHB5SiOdbJK_EPAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzOCBTYWx0ZWRfX3h4/JbE07jn5
 p7Ub7IWpHtgXUGa8SYKZf0wTpkPd59Pw8D6DswZdNv4U+uXSaP3j7UHClY5pA3aP/q3WKckMvHO
 TTkq9nrOb/YkuaB7X2O8p91wKslkYMw=
X-Proofpoint-GUID: pN_7JAucUG0Kcivbwjc_izJtsEAN9jOe
X-Proofpoint-ORIG-GUID: pN_7JAucUG0Kcivbwjc_izJtsEAN9jOe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzOCBTYWx0ZWRfX4iKEIab2yiem
 4AjISCPyr6OSkIAFoifdwCYHVlfOR4U/9w35xUsK0ZZUeQ9pN3UVF6Ttj0jWq+ABa8ffeoEDs8B
 ydOS8hi9OWK3zMKUkVUSXNTNSxkl1xkcmefVxR+qeHt+InaDVaGWn4fgp5RjRMxIavwx3i2Nq+E
 LpJFZkBa/kYHNf7Y6a4fc9gHsWG/WybHOZeavsI019Js1cg8iUKEJEaSK1iKKm1KMC8ckAHVjoU
 llW7io3MWuQeC61IC9XMg0qvR4vxHRzvGSQKKPBMssVY9M4vdNADG178pQU8rnTL+IegQCocLHQ
 Xq7tkzWrGJ/RZkyoNDtm9fYFiqSu37XUFcsrAkIHfSGnNWjrog0Hn1aYvfdlSyP6ZHcwL/uGuv/
 S+9qbqUxoO8I4k5j5UtAjmrN1N11ei5NK5ZKbmhxMJQwUIk4fZYcA6KjqmFm8d7z47RBwi/9eue
 MYBkom7m9wC6GCQ+lpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230038

On 10/23/26 11:41 AM, Robert Marko wrote:
> On Wed, Oct 21, 2026 at 10:06 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 10/20/26 1:39 PM, Robert Marko wrote:
>>>
>>> On 20/10/2026 08:54, Julius Bairaktaris wrote:
>>>> From: Vladyslav Andreichykov <vladdrako007@gmail.com>
>>>>
>>>> bias_pll_cc_clk and bias_pll_nss_noc_clk are outputs of the CMN PLL,
>>>> which takes its AHB and SYS clocks from GCC, so the device tree does not
>>>> pass them back to GCC. With only .fw_name these parents never resolve,
>>>> nss_ppe_clk_src stays an orphan, and setting it to 300 MHz fails with
>>>> -EINVAL. The NSS clocks below it, such as gcc_nss_edma_clk, read 0 Hz.
>>>>
>>>> Add .name fallbacks so they resolve to the clocks the CMN PLL registers,
>>>> as gcc-ipq8074 already does.
>>>>
>>>> Tested-by: Vladyslav Andreichykov <vladdrako007@gmail.com>
>>>> Assisted-by: Claude:claude-opus-5-5
>>>> Signed-off-by: Vladyslav Andreichykov <vladdrako007@gmail.com>
>>>> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
>>>> ---
>>>
>>> Hi,
>>>
>>> This issue does not exist upstream, as CMN PLL is not yet wired due to missing
>>> networking, even then the solution is not to add global name matching.
>>>
>>> The required clock inputs should just be passed to GCC directly which I have
>>> just pushed to OpenWrt.
>>
>> Just read your reply after writing mine, I'm looking forward to seeing
>> that patch!
> 
> Hi Konrad,
> You mean the wiring for CMN PLL or?

Yes the wiring 

Konrad
