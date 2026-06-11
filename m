Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27583BA229
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 08:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781167888; cv=none; b=ikKaW2IL6OcUb29q7+e0suQXKeQXDAMlWf4l0+dPY3BcFTk0kFVFJOmkoyQfSYWQNuNV9YsAU5CpU9bDS5HRzKpfsdIRDuNfai4UO9fawdZGs38rqO0nXUalwEmBueK3+eJFaNvG/mo+1JEbdod31tEAzisLJ/+ElhhnFyVI2EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781167888; c=relaxed/simple;
	bh=STmh2RbwN40cLFWOlhRd8ydC0OnzyocL3xRtV9nhBRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g3J68ufz+v6v2kQB97tUF8ot5sJ9AzVTCbEOpqKW5+ltP69txjbSqk7KE6FjGis9FkYrbrv+kow5ES+JG77COqZ9KA3JPAcoUlCV9vs1GBpfpTaAuFiiOC/9VKG6zOFJCqrfvUHq1XCul2e3ATuYGyXhp8+mNulof6yYRxIxVbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cDsFLljI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ppg6uprf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cDsFLljI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ppg6uprf"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GJaV3761239
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 08:51:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fyo6hKjHbzZ6v4TOpLvO7C4Dc/CDiOLyso/EOxfU+EU=; b=cDsFLljIWt8OVYZA
	/DLvFB9FJ7TXvz/F8ninX2kem9+mNjjOLV7lNb0Q1VIZlx+pkhWn+XnKLRUVm/Wa
	0eRUxjFtT9ZvQ/wlUghCVN3Oz+M+BJ5Cu8Y5/WZUTo7B42zj0VEEpZxGyzERKVyQ
	AauTLXysEZ/9KqXVYqI7pthkYHnlmNTHyMbLxDy7k5T2GkpnYeCeA3aCJ6sWpW5Z
	u3qWfV4b8j6CT7WW2REDisQ29B/nZHX+YaZLNn/k8PEiLi6znOlRK4oohUV59kSo
	tFjZ+CN1kzu/sKq6rDOXTBx0feuI1XNiW/qGU5Xe9Qs22C/8rRLYFO/AxYbokQ12
	MVBSxw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6sjm7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 08:51:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5176ff55dc2so13457011cf.2
        for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 01:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781167885; x=1781772685; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fyo6hKjHbzZ6v4TOpLvO7C4Dc/CDiOLyso/EOxfU+EU=;
        b=Ppg6uprfsVva60K9BSqgs40d1dnm1pYmwx70DPP6eNtmef6sDINIZtb4sPWqWgazgp
         Q8vGEeZbmfaV8EAbVUHTfp1VbkGJCrUClPJoEpcOgD4jACSWep7kKsgQyccpi+XNyqD3
         vCn1KpO0Mt8RncAJI/DKl/770t6L8bxvr1ebGmTjqBhglnKH/Q6fhMyhZ+avKKJ3Aqd3
         5uoS2aRP7krwjp8NrWlqPiGpkEijJWyPsu0ksZu8X6MhXRJ6X254s4kMFeTqSLLG4Voa
         s6WzDyrM0aVVnHJi4M8faiZrbw9sA/MWiwKtyePM3idUBG3LuprQkyp/P4MA+fEOcQ9E
         aYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781167885; x=1781772685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fyo6hKjHbzZ6v4TOpLvO7C4Dc/CDiOLyso/EOxfU+EU=;
        b=Xz6UFvYB2NfKthAbczUBNNUQu3+QDOU0XP6bABnJ7lDPJdtKZSIEgdsBb9smxV7iZX
         xdUltFCGGiMqMFQp1BxQ2xkXwyyK9CNith5MyNpRbDie8Dv5G9UZIM9hedIjKNSky/8T
         OeN/cwzLh9gwf+/BlN5a8cH7vhYL9UUdesVIyc70nOSTmbAWG714qvw78kk1ThH5mWKa
         y6Y9m63SMt6qCq+IHrNPdzRhSOkX1XG/SEObJtOQi8BCw+WVMXoJ/ZK4JyXH9zMm4nGF
         fhGt36zXetSzoAGx3YwT6or0hzLcJxbjDHxvG9chvmQuFbI0qJzdOvwM8UvpgekVlFF9
         VfWA==
X-Forwarded-Encrypted: i=1; AFNElJ+sQNObEmD10f4B0wd8tza/raiTykSP4Bok8C7eXtYRADGABQjNTcdqlCvFRBKTOikAxEPFzg2EClY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyByaUZaD6mkArLpf8+eetCqwDDmzcJ23iY0PRgR9LahjO5S+A6
	Gvq2K0F882puYQ2ou/8X3O1ng7bQ3AzG4Af9H7m7pWCj8Nv80FFdNmsLO3OT0/GJ78gFbZGn5gh
	B1/stX+9bEpk1lMg6lmpd0oE4zM24p7EGUKF93uuTefPjU2xOAJMQOlkR3+Nwjpk=
X-Gm-Gg: Acq92OH91FQiUtu7SY+GZoT+3OIp0DL7OX1HoW3J/+QnauDlfTpyc0jcZLe4SuvGC8R
	Y7a/NKdbywDtbkIfreBtOJU4uAvnoCbdHY/7SksulMj9ZZmSm1jicGYafwPOZU7c4jV3p5tkmPm
	K7C84flNaVAU/5Z/KTRCVRO8qZli7DZdCeUpNT+76OrAB8BrFcE6Xex2R0Lz8g6VcBICF6X5AY3
	Ienb6P9mgxfvAjG1jB9ScImEwOsx9lEvd2sjwsFc/s1ss+tCZdK/Z7G/LvTrbqprCF2IlnZk0hr
	LuJ5ksx8s/aU7ihab92viOj2SCuuyjDHBvbeNGZYziWgZJ17euZFenkvnRHk9/oWZlvmn9Jwvxw
	t0A4VPgKD7sgZmoJICNMqXeZU03ijsdga4vnHuZGUGGw0sCElBAuXaaYz
X-Received: by 2002:ac8:5a82:0:b0:50b:5286:f757 with SMTP id d75a77b69052e-517ee1d6c5amr17027401cf.4.1781167885128;
        Thu, 11 Jun 2026 01:51:25 -0700 (PDT)
X-Received: by 2002:ac8:5a82:0:b0:50b:5286:f757 with SMTP id d75a77b69052e-517ee1d6c5amr17027171cf.4.1781167884709;
        Thu, 11 Jun 2026 01:51:24 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb688410csm31719566b.61.2026.06.11.01.51.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 01:51:23 -0700 (PDT)
Message-ID: <10c2e008-74fe-4dac-99bf-194a1767bc16@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:51:21 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] clk: qcom: camcc-glymur: Add camera clock
 controller driver
To: Bryan O'Donoghue <bod@kernel.org>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
References: <20260517-glymur_camcc-v4-0-9d00acffdbf7@oss.qualcomm.com>
 <20260517-glymur_camcc-v4-2-9d00acffdbf7@oss.qualcomm.com>
 <8bd4365e-0171-425c-9738-0b186047cb15@kernel.org>
 <upcLoSPzJejUNhFiNYlTVH4d8Sh_Pv2o9OZfXsY-CMCDKw19_ci2gL9B3ZwqL1hV1pQeQMLDL8tNLbPzs0JIIg==@protonmail.internalid>
 <2a496bdf-4728-47b9-84ba-063712a6e5b6@oss.qualcomm.com>
 <0a197b43-a672-4849-91c7-6e5bfe3175f7@kernel.org>
 <amL4e4IHe75_j1HTIsmqE_GyurvudlyHQCPW14zs7ivHz0UnalN-yoknJwzaVRgHTT6ftSRCqDyCodh6ABCLxw==@protonmail.internalid>
 <66335474-d600-45ab-9ac6-e946f24142c8@oss.qualcomm.com>
 <639c94f9-6f62-4502-ad7e-5ae60f5f6d02@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <639c94f9-6f62-4502-ad7e-5ae60f5f6d02@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a2a770d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=JoSlTferZKbt7Xiq8IoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 4NaNzfOpA1-yRKHkyN6fBcHUiDAJukhv
X-Proofpoint-GUID: 4NaNzfOpA1-yRKHkyN6fBcHUiDAJukhv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA4NiBTYWx0ZWRfX7vMY8dXNr0DN
 L7r4MNymgyZQCei9OFWz9/ttiFxo/U2YAg3akUVw9rRiMlyn4nigRqEzZ9myfs/ykAnO5cNIBAJ
 c3LxW6NpnNzJw1q5y0Kn7v6JMxkk2Dl1KeD/bzq468fZ7uIPMMPaGkw9O/wkg8ObnYLU8AyPAIu
 YccIn9t91i+enfY2sBzZmh3aik9luHS7cjsiQItWtqFdMbUGUIkBdQC3/ipVMksw9FqunYQcGQG
 xvqrBJPZM2eKn2DodKV0zUsCVeXC9BCUMfu+exP0srH+35eIsw56wFKSjVpeywnwCDHLiUr3uct
 /19l8a8CkN8T+TfkMZK7sRnhzjYG62heI9R67F2ecU5UBk9rKCR/J666YYC7g6SrlECQ7D8FM1n
 VTC2FO6YKYV66yXzyw2Dw7sT/gqLzzzItiUkBfemz93WTdTy2P/wV3g82/IeDAYUGFbZ+hTttke
 a+Qw+z6VlZBJpwpgMxw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA4NiBTYWx0ZWRfX1YyasAYsm3WI
 9bVe7gdzFklGBGUeYBhQatjYxNvQeUD3vEQCbBWjCSOwc1Po1Gyj3qGfgAXIUKCVJ3WxdsM6QO4
 rhnrkqE2ojakj8r9uAgCnoXAWsKCRyM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110086

On 5/25/26 9:49 AM, Bryan O'Donoghue wrote:
> On 25/05/2026 08:06, Jagadeesh Kona wrote:
>>> That's not in your overview letter so generally I'd advise to include things like "did X because Y" - "didn't do Q because Z" anyway, how does it make a difference if the values are static ?
>>>
>>> They are no less magic numbers that way.
>>>
>>> What exactly is the resistance to defining the bits ?
>>>
>>> I'll state again - when a vendor is submitting something upstream where that vendor 100% controls their own documentation - there's no reason at all to be presenting magic hex numbers - even more the case with generated code.
>>>
>>> Just update the script to enumerate the bit fields, I honestly don't get the aversion.
>>>
>> Hi Bryan,
>>
>> There’s no standard interface for these bits, and bit definitions/fields vary across PLL types.
>> So, common macros aren’t feasible and would need redefinitions per controller. Since these bits
>> are not reused elsewhere
> 
> - Asking for named bits not common macros
> - Reuse isn't why you name a bit
> 
> , IMO directly using values from the hardware documentation keeps the
>> implementation simpler, avoids unnecessary abstraction, and makes debugging—through direct
>> comparison with the hardware spec easier.
> 
> How are hex values in upstream code easier to debug ?
> 
> Without the spec you can't change or understand hex values in upstream code, which is the whole point I'm making here.

I get the 'understanding' part, but regarding change, as I said
previously, these must remain as-is - any difference for a PLL
impacts every single clock downstream of it. Some of them also
correspond to specific electrical properties, just like with PHY
init sequences. The existing values are a result of tuning and
silicon validation across presumably many, many chip units.

There may be updates (very rarely post the chip going into
production), but I'd assume these would go through the same
testing procedures

Konrad
