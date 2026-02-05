Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A496F3ACEF8
	for <linux-clk@vger.kernel.org>; Thu,  5 Feb 2026 12:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770293005; cv=none; b=HvVNML5E8e8pel5dLnQYeSOpvRwvHoAX+FAjldVPoMNoaJSziEvvHnm+BrsWlvodxBZLpRymHD/Niv/LqjU6G9OYqgM63PBjRQ9IBkbxhV65xc9xO+ju3syS3cZ6V3pRtjZUPwDbGjC7jnWZkw658T73QngvlOTXLlFrvMkIQYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770293005; c=relaxed/simple;
	bh=z1aNBf8qq/+Iyk1bcLI9E8TQJPP8Rk67gfvRWDCu0us=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d7QWwgdE/d7K8fgyKtHl+Y1ol++D0Az/Gt2KNl1rF7jRxwcCyzT2jX0jZhagnaVDFQj4OBgNBQW9Xa9j5YQw2DXxTEVlYzxDQPPFK5hQPC6YF287BX4xvNOb/fBYv+VAJnJZGyHOErHPvrA1zTXh2Drh5nqPfIE2ee+wjcQnMNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bh08hRqK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G4tDgLdy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bh08hRqK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G4tDgLdy"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6157mhdF2945186
	for <linux-clk@vger.kernel.org>; Thu, 5 Feb 2026 12:03:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FE5i4ccBmqmPlVnpP0IUjclBz7WYpfCo1VUUmVew2T4=; b=Bh08hRqKJqKqmss4
	82LOEh/8HYobmnfsaFsHqKyZu26q0a/l5dOKrAMDjU1IJtfNYExmUG21dnMTpCuu
	3Z/xV8x+m9XeTcY0T+aAhWmYWOpwHFBuEOnAfJKY3KTxqVguCUULLtYoJFJIOMgd
	pqFcTMP3KdhzEr1RKN0LYy5Fl3qHxfPkJi8db5djFkIbc2mWqH8W16jbI/mLg6ss
	Lp/5tTs/wNGPLGuQ8kAPnYp5WmaJrijDZG0GpUiPxpzeuRyREFhXJeye64/5V5Qd
	vLQujeiLuOwBEvFI/TE857NFRGlzUDhu4vrcqyd/2/TyvTIH5/Yym6xchmVX6S3D
	bUS3Xg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4q55rrqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 05 Feb 2026 12:03:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c533f07450so30345285a.0
        for <linux-clk@vger.kernel.org>; Thu, 05 Feb 2026 04:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770293004; x=1770897804; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FE5i4ccBmqmPlVnpP0IUjclBz7WYpfCo1VUUmVew2T4=;
        b=G4tDgLdy/Myzf8/9WaN2fsJPcWWuQPk0r5AOSv0nroM7inslBgSnfQuN71vdMsnH2S
         Bzhj42rTuk+3indA0fioGizvQxhEykl0M3El6+hCGMsqxCXbbhnxMv2dwj2yom3kuk3i
         C1B7nywYSICFd4KcrqqyZB9nOrxHfsK1++jKZTbB6eFCFxCJ7sMitSr/zOYPvh0r5uV4
         JTcoko7ohFVgfamS2J2c0WCoktUx3zxkM5vFi9VuDJHetSlABA3EK3+IQbn8rX3x3oS/
         7M9bgYKJlfQQiU8kFpL53zAlwjl4BDMJoWT17xpq/xPhyseo3Fd7m24N36nd2WDD88Ez
         dhmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770293004; x=1770897804;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FE5i4ccBmqmPlVnpP0IUjclBz7WYpfCo1VUUmVew2T4=;
        b=c4LEGYFCrSoxbj0stMKdLYcXGgVlAmINY188MOe8hdbp+6xu6PFiS5zw0oXTUKz4y0
         IcfNftaWYTszk0jOzGYqu+AItCspmTkjdb3uTd/9uUg0SemOz3YJF+Ldo1lgh+Ru7mxx
         XxIyPflbK1hYTsdx2uT5cvMFNSFlTDcyMXOA5BzzQcu7Mp1PNy1TIj9Ugt52j1bql26R
         oysSoNpMQnP/H1F3SBROOA1hPLsiSfxiQsYfNpKNqSNVhVfpEecYiqNJfjxgca3ki8eJ
         hJIEwdvWbEESuJNA5Y+9ljNKe2rRinH/W6sUmDB2PnhJuU4VVROWWbtrre4gBNUVkFR/
         pCoA==
X-Forwarded-Encrypted: i=1; AJvYcCX6Q/gq/X0aEWIlVD6lcRnM8U1fbldFC3DyoGpuWfxAHtCax/Ejs77w8BRbCspG+ArFYWf5ig8ohQk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAW8dsq4hww/nXDeHX+/7VxQSX7LMsTmEhgu5QBUFwIU5cB4H9
	HzIrRfTvIJI6ZHUrb/sqX2xJy8dBOQ+IalrLpNm31AJ+3z3By735VO2zYlYi0paVMP42ilYaFeW
	gG8qcvw6/vhtjbHSgaUqyBz5x0mhYXenE8eGr96woKLv5UkER4K43nNWaDr7Q/FU=
X-Gm-Gg: AZuq6aKXaBpHN32IcRzFL+vs14+KBe9psWZoYN9S9tMD3RMPujC/pDcpKod/cnL3DDL
	5xkCtTxuA/9478ktrVkBh8h3FYCt4c/ua+kpSmZl+3SN/9UOCc/Llayua+scdD3zLvSW8H3R8vE
	Leg9/g7wyyxCzpauLdIH7bBBbJEb1IvdeQhswWRqKN1hGxo8Qsjve4dAH4QqmRq/VtIuryoO7v5
	/fzGPn/EUAwZYniWsift/XaOPZz5tw4eCnjB3M84gUffB04T3yutdOURkA+0fZ1KotKwCCtg957
	VJV+/q0yCXryLDilwiylkR+qpiZKMqVKzS+rgollCwoJXa3l4k/F2yqK7OHkBFszSMPU87T4SIG
	Yho11VdHjOX39DpOWcLavSgthoVbHrjSelHJVvZ6XHrCUicPQoBRjrdkCxQtfYfYUA9A=
X-Received: by 2002:a05:620a:25cb:b0:8be:6733:92b1 with SMTP id af79cd13be357-8ca2f5ec4d0mr643929585a.0.1770293003975;
        Thu, 05 Feb 2026 04:03:23 -0800 (PST)
X-Received: by 2002:a05:620a:25cb:b0:8be:6733:92b1 with SMTP id af79cd13be357-8ca2f5ec4d0mr643922585a.0.1770293003399;
        Thu, 05 Feb 2026 04:03:23 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6594a2351e6sm1991383a12.33.2026.02.05.04.03.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 04:03:22 -0800 (PST)
Message-ID: <f9620566-0173-4644-8f89-52b7a69c2a35@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 13:03:18 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] dt-bindings: clock: qcom,sm8250-videocc: account
 for the MX domain
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260204-iris-venus-fix-sm8250-v3-0-70fa68e57f96@oss.qualcomm.com>
 <20260204-iris-venus-fix-sm8250-v3-1-70fa68e57f96@oss.qualcomm.com>
 <20260205-abiding-beautiful-locust-6ee1b5@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260205-abiding-beautiful-locust-6ee1b5@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA4NyBTYWx0ZWRfX6fq9ENUqEC9F
 gEcQhEy/T//uGi2HgUAcXia18wXpKFM2YHxffyI5EPBWHZZcArM+lfZlSWIetjhyveb19wTJCw5
 5O75I+xhVP8dSQur44SF1nneVDWiy2xnYEh6JBamllzmBLHfNOht8fVNU9NVimCwRd5NUi5reZK
 YFGXUn/9uEo5SC67XDRFeX3L+jsiBI51jwl4oFm+DkGbH+58i8NppwMUTbiApVNyFzxMSBg0mNn
 sqIx2ev9wGWoZMsUO4pxNZSqDX52q9Eue3ZwtGAzJ/JgUSDPBTya5zIRvzDesmkumxZzZErn11v
 QCNOo87Njl96AGvKfhKG1GCA9bV0zIcsu6bLa6XGEsCoCs8gsmUWpTF6gTbz3ARPIqP3BgVjQ1A
 /8z4jXZPHsbNEzM9sp50FdtJeLyyJN5P/xDnDxxJB/xP/3ENFfycCEfnby6b2ZCSSRrWWJ/NyWz
 28VCCke62ILKYHjnziw==
X-Proofpoint-ORIG-GUID: N3RZRSOssAXka_Y9bRHLJfyknnowzSp_
X-Proofpoint-GUID: N3RZRSOssAXka_Y9bRHLJfyknnowzSp_
X-Authority-Analysis: v=2.4 cv=Z6zh3XRA c=1 sm=1 tr=0 ts=6984870d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=eYRqk91NNi6RPXgtGVkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_02,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050087

On 2/5/26 12:31 PM, Krzysztof Kozlowski wrote:
> On Wed, Feb 04, 2026 at 02:59:49AM +0200, Dmitry Baryshkov wrote:
>> To configure the video PLLs and enable the video GDSCs on SM8250,
>> platform, the MX rail must be ON along with MMCX. Split the bindings
>> file in order to provide separate file utilizing MMCX and MX power
>> domains.
> 
> ...
> 
>> +
>> +description: |
>> +  Qualcomm video clock control module provides the clocks, resets and power
>> +  domains on Qualcomm SoCs.
>> +
>> +  See also::
> 
> Only one ':', please. It was a mistake to introduce ::
> 
>> +  clock-names:
>> +    items:
>> +      - const: iface
>> +      - const: bi_tcxo
>> +      - const: bi_tcxo_ao
>> +
>> +  power-domains:
>> +    items:
>> +      - description:
>> +          A phandle and PM domain specifier for the MMCX power domain.
>> +      - description:
>> +          A phandle and PM domain specifier for the MX power domain.
> 
> This is an ABI break, so please say in the commit what was not working
> or why this ABI break is really justified. Currently you just give a
> hint that it is needed for PLL configuration, but honestly - why would
> we care to configure PLL if everything was working correct before?

I fully expect it to kaboom if you turn off the display (which also holds
a high vote on MMCX)

Konrad
