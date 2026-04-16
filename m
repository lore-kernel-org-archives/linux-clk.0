Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F5A3D523B
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 13:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347384; cv=none; b=HZR1hISCWzqXB9WQwqqhoqsaVNAh3M4N3ZxIh4pX+e8eIbrgc2hoYkchxOG+wfOUxTaKNBrlePn/rezZO6+pQgrb9cblFun54Ldvh52MBUjz9oDlzok4bPF28Av6jkiAoPu5sQu6mq5NgWynxSbUqp/6+GgmUZJEcolixOgvJNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347384; c=relaxed/simple;
	bh=ZB8QHmnI16kH/a/B0OkrUHPxKGpdp/pz4wFFK2+YkVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DRDeF/xbUIqb6B0dWi6C/NvSOW4szzNIOQp/3MVEPNNJjmQ+TbvTpd1YWc7ldNwRNlBEppuR3EZY7CumaTdxM/Mu02KkBxgFfSVaSwGFkVJZw2wA3Hliw1/UOOwBu9rPYjKWx1cFkgBiXqDkG7h0wvyfMFznBrvSqJB4ma7xbaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CX+3Rd1E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=brDEbeOA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CX+3Rd1E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="brDEbeOA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63GCN3eh2653581
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 13:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vp/HXPaQ0G51D+8PCdkwYaxrgtFLEn2Rl+hEB4QvY6Q=; b=CX+3Rd1EK0MuNj4w
	BggEtQAKJJnIgZ+/4QVS4LLC/WbZ8aG6cAK23Q4srqu0JTk6m09enKkIHDVFWkfF
	LGG+TeIqR8ksAJWrzxhzSzfNHCGymHB04xICUdkqZjaHjcHK5X+mYMq1eIHgP27P
	UDnvHUbLybmPFkDilyMI594rUj0FUApxZABF0aPQFmFme6ykD0dX1+KXzFU2cWmf
	Z6lJY+z5wRA/NnLS4NO/VZ8NfogMTUFvKdV9K5/+YN0CmPAUikowQSDxCtxzYfgm
	3dNWnlrhqVI2mwN+j7kGw7UftHDzFvTtvQ4uhpJcCKD3R3O20CdKkqgCKW8O5gzP
	PdDMzA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtfuhhdw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 13:49:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8d63aeaaedaso207911185a.2
        for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 06:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776347380; x=1776952180; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vp/HXPaQ0G51D+8PCdkwYaxrgtFLEn2Rl+hEB4QvY6Q=;
        b=brDEbeOAHpaeZZi920kD7hnYLcanm77QXTKpdjAm5JMd93TZUtoNeS1UnhwpCxz5b0
         D6i64cshLx1QDIGOhKjvfStXHBB8aXfCVQQ1J5LdqQBeomUADakbGfMWrAELRKp/fZIw
         uEKYv5120NySipu39CIjbgEWoIY1PZkWetqJiz7fv8ZAM4t1E2csEyj2HrwbC3dlBWeQ
         4pjE2MNoSZnXJnamJwd33SQPzxFqqVNiXrzdNF2ZNzk7EVhgqV+ygzT9Y4BmtBWYrZKZ
         s+9vVGSoMvlKLskrii28+sFLYYIIfNjl2W642yFQNGW1csyZcGQlo2zvmNo31oBwMH5Y
         DyCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347380; x=1776952180;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vp/HXPaQ0G51D+8PCdkwYaxrgtFLEn2Rl+hEB4QvY6Q=;
        b=r2nLyCVYXaCebbFIZWSYX3VtbwFiBaZKmilYM4QOcj08O/cyoSvoNkUeniOpphP0m0
         xNHxFbXD452AWMhv1E5hEsNAM71/d/ameyR8coGHY0ALrr9eD7HFBgEOQz+Lz2te6KdM
         RRr5y0kQxoDQVek7ZcdtAm8cIlvUybDo0fcUSNqpWVo0bjFqHtXQeCClF7HQcsTr2C4s
         0aLdjjIjHvIBvm4QBzkd10gDJpZgkIgfqSneC44PLOO8BoOXzXsERhQnsv8s9GWQekWE
         rxIf89AnaR8oIFWpCNmWB0QzGipbFb2QnahftPfPC42hceMqsgdUE1GCBGb2kp4frEc1
         0nwg==
X-Forwarded-Encrypted: i=1; AFNElJ9yIcCGSHoPrUAIfTJtXWILLnT2gVTyI37Rj2JC0+timym3h1+xlE6SdUBBmLMccPLTvDBe/F7UtfE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRVHtiIH6x/hwYWhu2gOvRX+kr5euQ7SbnXfBWC7OpFHq+OE0f
	8lQET1eHdX4dUpwVEvr564gw1bWDvGVSKrI6a/IRVgFtsOH6nbCo9I9iDR5pRTUmLDns6iM4wmW
	pdntLlAJhMVqrA/NdkIFlC9yiQser2Smel7qAVurKvgdQDPX+6foq6Ew0pj97qOE=
X-Gm-Gg: AeBDievqvyRQe+Nx3JHH/JIcMR2R6JRnFJevq4Ww/Dz3I6yA80lm/YQ61xwDvD/92k4
	8BIIv/HEDGa4jzMA6vSuCiE5P1sF40gRtUJTs2IvafvHPK6oJPlqX1VS5oZ9xEbVKiRigjfuOHU
	QIOzvkfKINYmg4D8m2SfajCaB3KhEgy6ZIIth3jigXUv1sEpzS/4XHH4uUMhUU4AinOuvcdLp59
	nHERZ9FHD3Ay+kFHMNJgy89mb7wJITHxcPZrp1XAfPFnN0F10PAFIUW6o4oArRSYvgemsFnh+qG
	XFNXFBAibXQjKhjH7kLDMjWSt47E1KRpdR0mxyjkpNCoGUkhQHKBfyNQhM1QaS7gb5NuNghNstN
	2NMQnORiIGuHBkagzJkGBtflQLFpCMnphEZlAUlCCK1WcxDBO8xb9ZcAbt/ZoVkj7pT/isZnyfI
	XQT6b6huZY5hRdLQ==
X-Received: by 2002:a05:620a:2a07:b0:8cd:86a2:340c with SMTP id af79cd13be357-8e6324d73a9mr261649685a.1.1776347379626;
        Thu, 16 Apr 2026 06:49:39 -0700 (PDT)
X-Received: by 2002:a05:620a:2a07:b0:8cd:86a2:340c with SMTP id af79cd13be357-8e6324d73a9mr261645685a.1.1776347379181;
        Thu, 16 Apr 2026 06:49:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67237d789a9sm1348465a12.3.2026.04.16.06.49.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 06:49:37 -0700 (PDT)
Message-ID: <00e40481-9e62-437e-ac75-a04594ef6879@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 15:49:33 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] mfd: qcom_rpm: add msm8960 QDSS clock resource
To: Antony Kurniawan Soemardi <linux@smankusors.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-3-007fda9d6134@smankusors.com>
 <c63abc0e-e060-4825-b595-a46ddf262673@oss.qualcomm.com>
 <caa589af-f026-4664-8fb9-6b23b0e087f9@oss.qualcomm.com>
 <71751331-651d-43aa-b30f-135cc62e8915@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <71751331-651d-43aa-b30f-135cc62e8915@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1xP-KGNcWyZpjVqNunV2WFTeL1Xu2Hzq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEzMiBTYWx0ZWRfX4+B0EZcXyOb9
 x9pjdKZCydXfp9B2zwz9d1OzLRIcMJ9WUwq0tBrjVQgEiRMT6q2ljc41RlApIiK8HFI3etKLeSB
 tsqeEFwZos8sd/5mEilEn83sRoELDWqimAWeWRuREXoS5N8QpCoHsTFFLNEzEe+S3R6m5veCEyE
 HMgXMafwCAUP28jbQ11O9QPf/utps9vzpQeckEQUaNLUQJugJdzYl6t3P24IZXju9wDPjXwRwQh
 nbExVZeIDwQbsEIarps33eBcni6+Dhq5RSJA4FQSzx3IAQ7dnw/mCe2PwGM7+zHJY6f8vdG5Hz/
 CEu54oBIvyt1pBy9I3MZB/ebBqcN9wH6jpcdPUd78Ocuq1/dRZQMAggoaQrJ7MeqX78ROjReT6T
 26g/FfQjlezCTe1Ax4faSKt9BUgbgTan3RZ0wOTRBB9Ohjuriu8hvDrtREPsxSQAGAaRgb32hCO
 xE6N2oIfPk2p23ClqBg==
X-Proofpoint-GUID: 1xP-KGNcWyZpjVqNunV2WFTeL1Xu2Hzq
X-Authority-Analysis: v=2.4 cv=KrF9H2WN c=1 sm=1 tr=0 ts=69e0e8f4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=wxLWbCv9AAAA:8 a=QgWWWv2VTRXgYXpbdksA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160132

On 4/15/26 5:20 PM, Antony Kurniawan Soemardi wrote:
> On 4/14/2026 3:07 PM, Konrad Dybcio wrote:
>> On 4/14/26 10:06 AM, Konrad Dybcio wrote:
>>> On 4/13/26 8:55 PM, Antony Kurniawan Soemardi via B4 Relay wrote:
>>>> From: Antony Kurniawan Soemardi <linux@smankusors.com>
>>>>
>>>> msm8960 uses the same clock descriptor as apq8064 but lacked the
>>>
>>> This doesn't quite seem to be the case, some fields differ and
>>> apq8064 additionally has:
>>>
>>> QCOM_RPM_PM8821_SMPS1
>>> QCOM_RPM_PM8821_SMPS2
>>> QCOM_RPM_PM8821_LDO1
>>> QCOM_RPM_VDDMIN_GPIO
>>
>> Ah hmm, the MFD driver seems to provide *all* RPM resources..
> 
> What I meant by "clock descriptor" in the commit message was
> specifically the subset corresponding to RPM managed clocks. From what I
> can tell based on downstream code, msm8960 and apq8064 seem to share the
> same set of RPM clocks, even though the overall resource lists differ.
> 
> Is that understanding correct?

If that's struct msm_rpm_map_data on msm-3.x, then I see that 8x60 has:

+MSM_RPM_MAP(PLL_4, PLL_4, 1),
+MSM_RPM_MAP(SMI_CLK, SMI_CLK, 1),

While 8960 has:
-MSM_RPM_MAP(QDSS_CLK, QDSS_CLK, 1),

Konrad
