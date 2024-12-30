Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7199B1A83EF
	for <linux-clk@vger.kernel.org>; Mon, 30 Dec 2024 13:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735566893; cv=none; b=DBmILPeOU/eYfV7/Bnv6AAzzUZbeGA58w6e8gy0jOLDIWeywU6PtmAbUtTA0Wz3XaiZIF9+r6HvVnO60pat87LtaLPaV5v66oU4l0vaZHIWa15fo+w3oY1tqlhfUZ7QvQ+6fVF2bZpHOtt44Jj42N798ZlF+P8QoCEt7NIItaJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735566893; c=relaxed/simple;
	bh=+iHAttbLRN/6eXCEPybAf+3RrIyoVjP4/+q8BrEKzuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P/nOnmTcPHHhxCUpLUDCkAyPrEMM83qouULaukRzQamC/mwPQjh91Ch8w9aPUfQBeuoTEdPBVfrJpxvStRMh9uW0VQUsP3SihBLAej0r1ESPvroD/niC9dpvBxHf6dBRDGVmHNs+elaCmmx9hUOzy3JLSUW5e9BMYtwab8+vgBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GngGERgf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GngGERgf"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BU5RwwY005267
	for <linux-clk@vger.kernel.org>; Mon, 30 Dec 2024 13:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z7CVSRjgLfaKt5V5tnNqs5jqEoX/ptWeSmYIElKmPZo=; b=GngGERgfdqXPnwuG
	T21UFI5A9HKhEuj7E6SMJv/rE5iYUV1UbLfQAJlyFt94Bjg+UbcxI4d/DYOFmxJ6
	J3PNX62VDo8HxaBxILCP7WfMBkeS0WCaBujPdUkwZckfy3upnUYbhQTd19UQEZG5
	ImSQPZfTiCnuGQ1GS2H/dT55N00GbD/5BLrGF/4yA1uM5jx0gA1T+JA6rySlVrmo
	j2+RsQIS4UdVIKyqSTg3Gdx5LLEs2qds1mEbB6g0xhFHnvO1r0HTf13w8Kf3RzzU
	iE/BxkNOaz0Xd/lbebVJULRHMo2H2RbqZ4Dr3wW9MtTeqhtBR9YKfDUk/EiDt21F
	y1BFdQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43und2s00e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 30 Dec 2024 13:54:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4678aa83043so24105401cf.1
        for <linux-clk@vger.kernel.org>; Mon, 30 Dec 2024 05:54:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735566890; x=1736171690;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z7CVSRjgLfaKt5V5tnNqs5jqEoX/ptWeSmYIElKmPZo=;
        b=LTbtfEx/Wos4EQXIk1SxP1yf06Xma/W3NAZWETrMd/EMR02da9fPrgy6RNh1wbKHWE
         T5qsrBWawk6ZmVKpPOUR9saGpWOyT5hOijBzT61bP7MvUT+4MKxOc9yvJqJnKC/H1idD
         8ViEBnOaBtn3wb9P4GTDpFGScqrNPadG5WcN/3OhW7Izdk1cJTohroC1lZ01Bg+e7jyX
         5CycmO7Hd3VVVL/gfRE/WqOwDoQYZhzSM7ShCFT29ouFynfaJdN6oeI2KS75KaBIzP3/
         HeaZmw9BXoy+F/3VJ+61rW621Lm2BOjeRmxa21xtRwSuIuGKcbsHRUG2KB2gLEQmBCyr
         8tOw==
X-Forwarded-Encrypted: i=1; AJvYcCVQJu3yui6R9t5GlUl0aMtExZzakGBU9PtGoo2hm3CsnbK75S74cpPi8LZg1reKmXoVCrw4NOQtj4s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfhRXBS5KmhlkPWMl3urHN9KcXFtgyMW1lbalzNuJ5GAnpSIM1
	u1gn8SIcF6Dgr06C1A+3nsEQZsKT3pTp+16BcMBGSMBDVkUii7BxPwIlef6cmZDWnJxIQqpRwW9
	wdpFFq1EcwMk7IZL0p8CmSiaROhXpj8vr1l04SVr4ouhQAr+/yK/KVVdp7qs=
X-Gm-Gg: ASbGnctwoMm/cHufwpVWydS4NUmCkZBjNXxE5HYJIzyiGnHzOZXbX+jHxdfDbivu0UQ
	OtTVNCcILqDs8jCw6K85KMmelvLdFrGI/HZPIUh/ERQz43lanBugRLrPNi2fYzMSyPggELdG4qC
	SR598KSeNL9NXd/u5Ni+c0CVV/RrzH9q5MHHbB7oaxKGNRd+w+RloSOF62PnOHgP+1dUMg/Ib+j
	kyiZabVKqNZ9zVKnf0ZxA2XxaW2vsZC5c40BX1qg+aPpx9G0sBZbOwMMg70EgVrAw6pvB8VSFsd
	H8AEixClFVQewG9OmZR++nz16uBaTCUsa6U=
X-Received: by 2002:a05:620a:454c:b0:7b1:4add:f234 with SMTP id af79cd13be357-7b9ba7232c6mr2316612385a.1.1735566890146;
        Mon, 30 Dec 2024 05:54:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZdkhj+BV1o4dgVVkLIoaoqu+7Y4A1qVLU9VX+qB0ht+A0G1NdzcFyr5Ff74WKLL3Pqf3bmg==
X-Received: by 2002:a05:620a:454c:b0:7b1:4add:f234 with SMTP id af79cd13be357-7b9ba7232c6mr2316611085a.1.1735566889850;
        Mon, 30 Dec 2024 05:54:49 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82ede9sm1458554666b.2.2024.12.30.05.54.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 05:54:48 -0800 (PST)
Message-ID: <d4875732-ec24-4e35-9a7b-af05c6ee7d4b@oss.qualcomm.com>
Date: Mon, 30 Dec 2024 14:54:47 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] Add SPI4 support for IPQ5424
To: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: quic_varada@quicinc.com, quic_srichara@quicinc.com
References: <20241227072446.2545148-1-quic_mmanikan@quicinc.com>
 <e673dbdf-9b16-4c64-a3e0-cf5bb31e2b82@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e673dbdf-9b16-4c64-a3e0-cf5bb31e2b82@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5J926YMWXsoQPxsTFbOlHNPA8N1lkueY
X-Proofpoint-ORIG-GUID: 5J926YMWXsoQPxsTFbOlHNPA8N1lkueY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 mlxlogscore=815 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412300120

On 30.12.2024 7:51 AM, Kathiravan Thirumoorthy wrote:
> 
> 
> On 12/27/2024 12:54 PM, Manikanta Mylavarapu wrote:
>> Add SPI4 node to the IPQ5424 device tree and update the relevant
>> bindings, GPIO pin mappings accordingly.
>>
>> Changes in V3:
>>     - Rename SPI0 to SPI4 because SPI protocol runs on serial engine 4
> 
> Do we really need to do this? If so, it will not align with the HW documentation and will lead to the confusion down the line. IMHO, we should stick with the convention followed in the HW documentation.

+1, the clocks are called SPI0/SPI1 internally

Konrad
