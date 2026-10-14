Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA568545DB9
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 14:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791988422; cv=none; b=g/fJlvGnfmco5cU3Wkn1kjm4jjd1AWnsadOLb44XuNV8QwG4CHXDNAekFDkqIRwhGhTo8fhQxyGTESf6ME0rGnUstOvqgcHSy8BGeYUwmdD32o6z250ICdA3HNaI7H+5KzC7JEa3JFObdViBnJw/Mc2hreRVd1tYQfr2vISbU1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791988422; c=relaxed/simple;
	bh=+5PLPrr9n0KYI6GRH3NRijC+PobyDKxOrwuWi3GiuDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oyZ4CNY1wjSn3UATZbQyvtui/htA4QJ1KWydzIEVZVLKEh2r+CWjKyhFK8WJSWGUDdxOJt/S+wTgSfbA8YBhfBwScP/PiG9YdJxXx5JcZegZVLiD1egzE2Z8d7sKRvk7MwNLSQSGilCxl6Rx+ebBks1VHOS/+DWZEhaIVcule5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KX2c23bz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fURMDdPz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KX2c23bz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fURMDdPz"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EA9Cmw806619
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 14:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pARb0cSbsxH1j0eV8lXPIFNVaNSi9k1K4sozd3r/QpE=; b=KX2c23bzOARDMXps
	aDYzFVaiUvLyi7xGKrBCvoWp24tfaCh5uRO75xF3e2JMSyF7SSWoQRUq5AAk4nMI
	nRrvwDu/SuH8fVWXBr+GLhhkgIb+y6Y2mbHEPhmr0/POKZ6Jz/gCQDDHmcUBRFfq
	q29dctfIpAb7ZxJYDid82GOg+Wx/DgV8jBG9k0oHFYVzHwTbRK2g3WqRjwVd9W9b
	nHZqWxc5KuyvPxwfLU0OODmPfSvu05tcbiAQ4j67okej+WwkJQNczPMR3dZk62nb
	Sq7IkqQJ8xMkbYKp1pHATkCZgiM4cG/YeIkCx3HA9V/QzMPX327ZWFjzfW9fytv8
	JtwqFg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9ud6bxdw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 14:33:40 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-77f133855b9so136151137.1
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 07:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791988418; x=1792593218; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pARb0cSbsxH1j0eV8lXPIFNVaNSi9k1K4sozd3r/QpE=;
        b=fURMDdPz6NORdyxfba6rRara58/OQMtqPb/bLvirZs6GEll+A3zR4n8JAU1if6V6K/
         rZrfvrRA7fFaCvAy/mzrenxL3RkiiRLaTw7XOQS09raadU1umLRk/a8h7V+r4lXJvYEC
         qO0PWkaobwd5fIzvZ86hf8Mnuz0ZeKSSU/vIg2bTH+BAZ+uQlN6+RYrq8PEBJDRrUQey
         OpyAQPCjG0dnR8vmtZ646acaWDL8Yb/xMHoGu3NtEYcJa7muF7pPaOTkD3Ion3G8N/JN
         +7t3MCOVScNH/xM4IzvWOqvVK691htn5S6K3KZAi1FBlZj4spGNuJ7TPKtz1fM6YgZ3/
         Irhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791988418; x=1792593218;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pARb0cSbsxH1j0eV8lXPIFNVaNSi9k1K4sozd3r/QpE=;
        b=FCVq2sktIsE/UktG03Nb4hmAWz3dIySKwbCnVoDcSTtM/UZpTnvAkNsN84ygP+91vK
         Ps0+Q5BknCO1SpwSK4SHS0UmaNGS+NG9vaeDtwmsd5qsQ2jZquxAzNJl8Dicg2GrPd3g
         6aoOV2E8G/kz3Eh+wXZrE6SbaC9pRK7mIOC09X/HdTLMiHV7/ykE1g3M2oyXFBy28LF0
         vZBClHCn7o7udeEIgBtY88SFuE3vTJyLp/C83K42V/LyMg7Z4NgBLkoBeGkbxoguWEVo
         IxRWOaXi6vEzJs0RFzGMY89wEt6vh7ngWx7xw+igT7yJyc0ljxwKjjJshhsP06L8WM8w
         h3mw==
X-Forwarded-Encrypted: i=1; AKwUvBzWq1etk2DxTY45B9iejlkV8jLcMYK5mpjq8WPkUyjEMmoAmL3MB+pyoNIjYYpUcUsHzJt2ZsiF0nU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjtof6nwXgNZ5teSWM7mF8N1yvuvlGCP91l82Sg5UuH8sZzoDi
	TOIIkROlDGUnLHya88D9GGB4/hBoxomj1D3EvbaH6RZgBxqN8FzPW+P7LIvWy4IYG7CtFfUTDvZ
	LUM+tBJ7Pp37tmJQjMqHB9aHpRw0ISrSO+ekzAALU1IE5gry8gTH+RrqmwNwO4uE=
X-Gm-Gg: AYBFou3dLmeFG3NFjPdbVfEN7+a8tFEEszp24YuzDLBaNrhdXerAehpUkGufvpXR324
	W6wQXhYvNczHKWd3gtsPUuYQWQ+oQzPqzkM68nSyYL0tIC2g/ZcfyTANTIPEabOw91HZrCZJPer
	hyTV44RBNyJidXJZD8+KrsBM6rRWiI1cFZPhBrUeTw1g0qAO1RTdg9KbGh3dnvPuJu6Q6N3Sz+r
	tVfovc4ukPb5hvUscp4Ra+GoHSQlk+DbpjJCLoAphocmAanFAaVEvpqUdY20nDgVwP+uBbcGwSN
	8LFDCkMCKiIFex1vZxmmFXqvRPMYRoVwtr93+32c58OUymJfBIo9veo4njagbrBBpG104gjAPUT
	OKixhlewLVJb2bUmTalZlWg==
X-Received: by 2002:a05:6122:3b10:b0:5e9:484a:3499 with SMTP id 71dfb90a1353d-5e9484a38e0mr2697094e0c.2.1791988417538;
        Wed, 14 Oct 2026 07:33:37 -0700 (PDT)
X-Received: by 2002:a05:6122:3b10:b0:5e9:484a:3499 with SMTP id 71dfb90a1353d-5e9484a38e0mr2697064e0c.2.1791988416956;
        Wed, 14 Oct 2026 07:33:36 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c356f981cd3sm327141866b.83.2026.10.14.07.33.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 07:33:36 -0700 (PDT)
Message-ID: <0d448a75-6fc6-4f38-a871-7a5338ee31ff@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:33:32 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM RFC 15/16] arm64: dts: qcom: sm8650: Drop
 required-opps
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-15-3041b788e9f7@oss.qualcomm.com>
 <r5dc5p4dozb5lkz4yaiv3epp2nskxmgcjjhf7fgoy34vcsspc6@27wzsgsvgspm>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <r5dc5p4dozb5lkz4yaiv3epp2nskxmgcjjhf7fgoy34vcsspc6@27wzsgsvgspm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: o-DfOzijsBbEJ1zdogyUFyt5dpbgbpJv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX951KGoOoIjh5
 OPweOWOueb0gMU9t1yEhohAVPaKJ7AqQeUwgI0QH6cEMCrEPDRSoEGK4yasRMLyIbBfwLectJIy
 /mDg+JOAV2p6JV/Vgpv0Y8pLuaF6cEg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX4iwPyA8qCIRG
 RwGoBsdF8lg49rzoqB5hpmTOdzi3ZupH9qNimLaVcLVtR7gyyIy1DIlO2Brsn1SxW3BVssUeFAa
 TDF146EZO387yaciG4oyEii3KgD0TPVass+0w1D9ky8mgLCXDeKI0qyxrBnEQpgtXxcRStWPOMc
 MYbxVfIr0e99MBAV1113KsGi4bVlpGs9IRUeX/EXn6l2UE8l7vb+ZBBU4lTEJF4k1bIQceTvyNW
 Jon9ID1Hjh3nhnD4qnfZOLfJ2mJ7b+/PmxRTT3df2wOlucbyHFR82UakFe9/Ct0wCDNIwvFioEs
 3cpX2YRZ3aEd+qVf8E1wkNU4/2yBxPLx7lC+9RMLyKV2LZIMdX/Lg9C/sj6xALMLABSr84DS19N
 3gfDIDFXbT52/7ycE3fDKXWTbZhQfaJO9b935VoBADqGTPvziOcFH3NNr9VwJuTrX0qZSLwvoOo
 NLnsPRXwPvsx8J+CPHg==
X-Authority-Analysis: v=2.4 cv=fJ6sTpae c=1 sm=1 tr=0 ts=6acf92c4 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=eDuGKJUQ3iVb9g9TkgsA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: o-DfOzijsBbEJ1zdogyUFyt5dpbgbpJv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140057

On 10/14/26 4:23 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 14, 2026 at 02:19:15PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Now that the clock controllers take care of their power requirements,
>> drop the required-opps that were only there because they previously
>> hadn't.
>>
>> Assisted-by: LLM
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---

[...]

> Can we then drop these OPP tables, which only have a HZ entry?

I suppose so. Unless they should also have interconnect values?
(depends on whether these can be inferred from the bus freq for
all protocols)

> 
>> @@ -5200,7 +5178,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>>  			iommus = <&apps_smmu 0x40 0>;
>>  
>>  			power-domains = <&gcc USB30_PRIM_GDSC>;
>> -			required-opps = <&rpmhpd_opp_nom>;
> 
> How do we ensure that we can access device registers? Is there a clock
> (?) which now casts a vote, letting us access USB regs?

Yes, the device driver turns on the GDSC and enables the clocks
and the clk-dvfs layer ensures all power votes are in place!

Konrad
