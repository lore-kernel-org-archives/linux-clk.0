Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958A23AEF55
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 10:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774607214; cv=none; b=ZCpdErc5nMrCYNz/SZpNubkMwELbnEcXLUwlPd67kQVtrT9oCThtRtecJYtcHQL9EwAMZVO6JpPcfTpsJDwbBP2c9EjFy+eQAJaFKa1ZYnngReb6gkwyzJlAQUpHeJ5q4nCKQ5lIH4wbTFeEgWos5gaKhg5SXPjeMssfcme9qLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774607214; c=relaxed/simple;
	bh=IWKb5OexAcsxmRLl9pMO7VYfbb0SZHY3SM7T2P1bhJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R+C3/bG+16PFegJSwwyZVsqMczAmUUmnHbUfrSJSjEbwtc45ivr/NRbExASNdDMR1O4F8DfoGqperyCxlBRrd//w4MxAg0h18+xOtGDhLpuR+CnWOGpIH3Uwt6yEoICqc594HhzoEDCPd5WDY1pKpAkobaBPHmop6XxhWV2Wt7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fnk6Vnm+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bH0x9ZR8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fnk6Vnm+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bH0x9ZR8"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vsX51226312
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 10:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9oWiAxBv4NcjBqIF5PRiowTv/QQhNKo2rE3bYQ4pF+A=; b=Fnk6Vnm+3iNSneB2
	pmonCmrwENxcCA757p3i2inFw8tGTJ+jP6ELaKZzU9YmdOjwrpdvZeo7wLcXfEvr
	XzPdqD4Am9CKJN31h5cL97SJ5eriXn9rdK3WHL7J0eRQwba3BktcUebmaLqf2EPd
	g8HoZzaRXLxrFwkvqNP8U3TDgvWqnvp9gKTrXr9gdHBf0UKT85U4/CR+hpxVSsCr
	tYeU93r5pcU5LiLFd/uFmP/zwM5eG8nxTyLcvEeByZikii6hJ2sIvqsK/iIAozwI
	adniaWXdpjAvY2Jy5V4quoV+bjjW02BDpNSVhMu+mlb2tCQARCUvcTNdQJxiJTbP
	+6nMVQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d59r1b4rd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 10:26:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b33a19837so7359231cf.3
        for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 03:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774607211; x=1775212011; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9oWiAxBv4NcjBqIF5PRiowTv/QQhNKo2rE3bYQ4pF+A=;
        b=bH0x9ZR8PZj2oTzCpgrYg+fHz/pSqPvGD/0QVoNhBYILYIp0q83z4nx30bY+j8w4rH
         Cc1KgFEbsdjrbbHqg03iQ3iaGk5DJWJJqI/JBt95iGMXRGacjSGtKmZSiqEvabynzlsH
         P/jz3Cdm4rBduZ1tydnMG2OMcZbxa5dklfKjPpQb9K/IOOmrr5ahplcfqxLBFd6EBbbB
         azTGB38xb4uEw68fUJra1IaM3SiVnu9vlMceaiBMCSZHH49cQ6OyZGmcDoa1RIi03i0T
         Gb673HgIFRvt3Spbmfk5dHpX/Q8SKmTsZYn9894UAHseEl1ZkQiVNr0RDx6yKDbdhnyR
         BMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774607211; x=1775212011;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9oWiAxBv4NcjBqIF5PRiowTv/QQhNKo2rE3bYQ4pF+A=;
        b=MqHwHL5TXzayXb3AjeGWsFGPd112Azaju+M63ifns5OkeiPL+2PE7U/JDAchGPebkG
         jDH6G9jW0ZYRXzYQlCS9iPpPrWLyGwESGmgkOLsf9/sRpV0JNanpYcOnu5Afnt1929T4
         abr2btifgKghLQ3B1tiNLUEZ2biWzpm2jkX4Uew037UQ3PbxO5O7C1DonEncD3nhXJfi
         rjiVwRBpvUC8EpAvQWjBRKpiy+8gSKeSX+9WTLZIGNPl9D/lOkK3pLHCcm5PSsCf8973
         wlqd7MsxFXscfulgxMRyyBWNkDVtqUCWI51wB7eKd1dIrscHem1FoFlsUVKJ47/9pITs
         p6ow==
X-Forwarded-Encrypted: i=1; AJvYcCUxD8koU804QNf+IwnRW0OPWm5NcrkL0oaLXKUMWmcu0q9HoBgDd6XT9kEqvMRUj6L4j/Rqtxn7XL8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZeh9xhkhYHyP5Y8KGgCNgspLJBXsER8kkEzTYD1yjaBh2Epvo
	5dxUxIzci7K6nNYqSZAHiKTTTjbAkhYu4BKhOik4ZiMJDTXsioPAdgPTK4BycoUgUpCruTHHjON
	NCCclTG6C1lL8l/vIbT3XIyvRk9yhgVnUasQKtPPQjgMdxMotWSVBdy6UryzxJ0J1QV8uCww=
X-Gm-Gg: ATEYQzxNhbAyRY9EOq5kT7AA9yN+kclnvZN9OsOO5b0c9b0+b5Pp2q1EWPX6s2qQvAz
	bt9EuT9ZqMDSb/isRlSUSRDSI6FixDqzF0G2DgTbj6/DljEt2OBWf3j67Gtru96HfoY+evaRrso
	mUbsY8ivKoIw49Lddt8UIKLkT5st1jpgsmybWhg57YOcFKGWGWYS/ZGofiaDsgDZMhDZof8rLvH
	CsH4lz9FE+vk+RcwxmR1fkd7VnTKGponiErB+lfUjKewDi5LT2dPcJOnX1JdOoO5u1LfSqGtpyP
	KKJhUx8je44bMl6PPhwjJEAPHj/NGxpECz3A0CtIXKDuPo/v3jZIaxgYWIbQtL+ggk5z8EWgPaU
	LOZ+7JwB8rjtL1SIczP4yIry7hn4SQxGHYx0FsSoK7YnIKi8whIRv/qHEkyjDp1Rm+cSPuD05lT
	mheI8=
X-Received: by 2002:a05:622a:1982:b0:509:1b76:e9ba with SMTP id d75a77b69052e-50ba3994ea3mr17776501cf.8.1774607210727;
        Fri, 27 Mar 2026 03:26:50 -0700 (PDT)
X-Received: by 2002:a05:622a:1982:b0:509:1b76:e9ba with SMTP id d75a77b69052e-50ba3994ea3mr17776131cf.8.1774607210167;
        Fri, 27 Mar 2026 03:26:50 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b202663c6sm240584466b.23.2026.03.27.03.26.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 03:26:49 -0700 (PDT)
Message-ID: <0526dbcf-0f4a-4ff7-ba43-705448c989e8@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 11:26:46 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/7] dt-bindings: media: qcom,x1e80100-camss: Add
 support for combo-mode endpoints
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Christopher Obbard <christopher.obbard@linaro.org>
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
 <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-2-5b93415be6dd@linaro.org>
 <17ab70a4-1ab8-4384-8537-44dbfe31889a@linaro.org>
 <540c2a97-00ec-4358-855a-b238aab53860@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <540c2a97-00ec-4358-855a-b238aab53860@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NSBTYWx0ZWRfX0/lxYOku8wHJ
 r+YbxcMCDlVbE+igYdkatJph3Qx1GwrHN4vbHmWGwMYkZxC4OYUWfaZS5KPGbgFU2a6jkuSP0/+
 bL3I/uEyIpHML41BG/pd48Vqz+OW1mbcjS3oqqABRHmxny86VVSGCbLuw6Yx5gDEaUWYiGMPrjk
 bdoiebyTXybvJOWL0r9Tc2HQ7O+yQjiUo58WEdYEPqdFZaQ7IblSdIEfQ7cbyfwuAplg0LgHucs
 408Bp+W+M91Wfenpbg063p03OrgULhtBiBSholbdeiXbFxivwhD1qYbTfH7O4JNxQUbZjPjiWTM
 xsD4V5c2Iy9LVTvg5heROmR5sqB/er6BBxz/ak4pOf4AVEmkpA/PvemM/0HPkdo7WP82PLUCPMh
 94AhwX8jafXf3qT5OICO4H14beAfikhHjcp/eQCY1p8KZtuUXAlk4qR4w4rarn6NQmd8TKBTquU
 44QShxIUpfNIgthQbzg==
X-Proofpoint-GUID: T_5mL5juOpYiGriwk2GZQFN_gcdb85dU
X-Proofpoint-ORIG-GUID: T_5mL5juOpYiGriwk2GZQFN_gcdb85dU
X-Authority-Analysis: v=2.4 cv=JaCxbEKV c=1 sm=1 tr=0 ts=69c65b6b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=0v9nonJskobKTEXhuRwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270075

On 3/26/26 3:08 AM, Bryan O'Donoghue wrote:
> On 26/03/2026 01:51, Vladimir Zapolskiy wrote:
>> On 3/26/26 03:28, Bryan O'Donoghue wrote:
>>> Qualcomm CSI2 PHYs support a mode where two sensors may be attached to the
>>> one CSIPHY.
>>>
>>> When we have one endpoint we may have
>>> - DPHY 1, 2 or 4 data lanes + 1 clock lane
>>> - CPHY 3 wire data lane
>>>
>>> When we have two endpoints this indicates the special fixed combo-mode.
>>> - DPHY endpoint0 => 2+1 and endpoint1 => 1+1 data-lane/clock-lane combination.
>>>
>>> Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> ---

[...]

>>> +              bus-type:
>>> +                const: 4 # Combo is D-PHY specific
>>> +
>>
>> It's unclear why both 'bus-type' and 'phys' cell argument are needed
>> at the same time, they are equal and thus one of two is redundant.
>>
> 
> bus-type lives on the CAMSS controller endpoint. It tells the V4L2 fwnode parser (v4l2_fwnode_endpoint_parse) how to interpret the endpoint properties — DPHY has data-lanes + clock-lanes, CPHY has trios.
> 
> PHY phandle cell lives on the phys reference. It tells the PHY driver which electrical mode to configure

But we don't need that second part, no?

If it's strictly required that we keep the bus-type in DT, we already
store that information once and can translate MEDIA_BUS_TYPE_CSI2_DPHY
to PHY_MODE_MIPI_CSI or whatever before we power on the PHY (which we
wouldn't do without first setting up other bits of the topology anyway)

Konrad
