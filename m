Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471F92DBF75
	for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 17:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761843978; cv=none; b=Jv567GzhiUp5vNT7N+zNAqaaLXvsOVtcvaG1QUx9IDbnmhxbaYbY3Mm9yWdHLsRZ0n64de0J2ZTRzrxMqQLVc5CInzi7dtxKqoXXq6g6jslNiPMb16HBkCZMHZq/De3oU6DpRGfhisUFB2lF8KrmQgkNLt43Ue0jLuokPwmYbFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761843978; c=relaxed/simple;
	bh=LvR0uV2UUFEjjW8GoIT53Fs/684GGpnkAc2fKO9ZbTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bAiSnIB+mkSiGEmH0AWQmqmo0C+SJLcA6XQK0lQ5HM6HeZGN7u/FNAvI16G7AyW5AE70G2HBqeuAO5xMmgoKvTi2MXrKTD7raS24SXbbbCTXaQ7E1u15F1HeoAY9gQi+CMejWeE/MZ968Hxuuh1wt2BUgCim4why32N5XG5wAN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RGmKKO+E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jysssz4H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RGmKKO+E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jysssz4H"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UG6F6u1696883
	for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 17:06:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RQdiWSs1pdAq16tCBx6T1gHaJtXV5GNkrGHabI2OIg8=; b=RGmKKO+E4/IgzYXF
	UqQN3ci57t38sFZpHrc7kOnAmeiTEQVi/DZUBZ4Hj681989qjA6Y3DFklW4Q4eep
	nuboUKLPQQ8LFxfyN13dJ+JkiN4YtpxvJm0pORxCKmjmdhgWpfT95MXExIY7SlBI
	5/QOpzeRRUSH0l0Y75228Td3lD5Rs7CxoGIhSSLowIhBgU38cIQ6Dn5V14U7jUR+
	Lgt8YKplKSAFAQ9doaVIDSpkG2On7L6BMVHlA7XLyEgLJsCNs283+w0FhYjhmQal
	U1sicJL66EVvlFoA4eHoJ21WLjcXjCYg4dbpGUA9qRrpqnHZqTpKtqKiK73rbR9N
	crjsxA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3trv32px-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 17:06:16 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b62da7602a0so1041162a12.2
        for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 10:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761843976; x=1762448776; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RQdiWSs1pdAq16tCBx6T1gHaJtXV5GNkrGHabI2OIg8=;
        b=jysssz4HQfEUpH+3O3yNtdgHEteUuWUV8IQmcO0PxUgwqa2gBaGe0IBdIe0WkufqTs
         eSxjX525MupyRpHP6injTYTLw91/0yIgJ3TXKWNz+xPnAg1+3b7U/GWScWQJIFPswtSl
         sh7f8R5+GQFgXVcNPk9/NELYEn7qYR+UoHEebIjfVlu4zLkw7rAcgDDdyZAh+9KsdyRZ
         el6AP4ai27rtKhmfAJVK33In6ZcVQrAj0bikq+nmKD29rMNFmA9Ik42m45SNoT45Ujf1
         B4EpmebqHi8+0fi4iojLcL13rGjxiN5W4Yt66y6yQV5VmwOzGZOFQmZr/mtlUAsJBXhi
         VyzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761843976; x=1762448776;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RQdiWSs1pdAq16tCBx6T1gHaJtXV5GNkrGHabI2OIg8=;
        b=VDDBInjcYA1lzU0OJ6E+Z0bWemH728ZKDbJ96N8YkuaIjWpUknAZbOVXaZot8rjEMC
         +SMXhn4HQajqQpwWMakch2j8uEpfAZ48pBZdgxLp4KUZNgAuuFKXTRnb3wfgSu4acyYg
         hf6o1MBtn620OAm0PqwH+oE4Ohl5H/jpe8U8eGYByzZbonC6chMpfN/iSyDuCd6lbXQx
         DwCWBRHgCNjbNIF9/41+WiDy4lea7bNy7Agf/Lxwhqd5RGEJmjc7ey25+QjCCuSYueRE
         iGf5+eKRmhVEg3BFUb/Hm2j/PXcLCuy/qQ5mdWEixAk5PlOStpfw8cJeioUDj1Kn4oKm
         cTyA==
X-Forwarded-Encrypted: i=1; AJvYcCWevqq3TR2bE2wA0m7zqICPvoWbX3Qs1yWFXNgnZ8RPJT7t9AEeWn0Q2evPYgoDbFoEB/VNuCQrBpA=@vger.kernel.org
X-Gm-Message-State: AOJu0YygOu7R4exn0/oRMhzIJpNKbdFNY5a+v+LN2zNapK+13dpk1EBN
	9gfTtLmOGEXMieeGilB07guSBPYLphWEyxLSG/2CRmtyzsuMfjoFdnLnSDhIHbidbohK3qIT6N0
	7kHyzEtUUCcBtyhBpeO8lCVrhfzWFE1d8HtBPDFR2Nnm81+A4WmPrVesNzw0znks=
X-Gm-Gg: ASbGncvNpp7DCU588SBTnZdJlbxwzpgRgZWlxHLeL47HyAfkFZb7W7KKAWHfxLhL53U
	Cu4rGRkcoMLtljIr+LJ7qh7G8xpXNq5HhzarWFrLjLAEGluJPy9tzg7Dklkou5Re0plk4q2rIjE
	umWYEDsaNlJ5uARXo0tHh2YnW/lX8UNtmIf+O3++oeZXRJDrkUD4AXxUqcF92xZyaFEOe4cR0ai
	CJvXyktk5FJc8MiGMhjd+yDCdsmgKCmDFGq1b3xl6mUWLnOuPLQlr6nQ3UJE2cK+qvVjxDC5W2F
	g0XYGRapuinojaZQF2/e4MWJ500AO1vDyHrL/eUMZOrsNkCe8YPCNpBMbsIdt+JWZdfoNQ+/y0P
	KUHVeDaNlpYGoMHh34qOS4Fbkzcg=
X-Received: by 2002:a17:902:f644:b0:275:81ca:2c5 with SMTP id d9443c01a7336-2951a600875mr6526965ad.59.1761843975120;
        Thu, 30 Oct 2025 10:06:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmWxDYd8AFe9Hj5FT5SvFYc4S0giUKw0u/xBUp8Hfu1jGx/wHegd1K6+sYRoSAbI9+qYjVCQ==
X-Received: by 2002:a17:902:f644:b0:275:81ca:2c5 with SMTP id d9443c01a7336-2951a600875mr6524995ad.59.1761843974115;
        Thu, 30 Oct 2025 10:06:14 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.28.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3465sm197299615ad.1.2025.10.30.10.06.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 10:06:11 -0700 (PDT)
Message-ID: <41e31da2-5ea5-443f-a8f3-ef8280f25a00@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 22:36:06 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] clk: qcom: ecpricc-qdu100: Add mem_enable_mask to
 the clock memory branch
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20251024-sm8750-videocc-v2-v3-0-6286bbda3c8e@oss.qualcomm.com>
 <20251024-sm8750-videocc-v2-v3-2-6286bbda3c8e@oss.qualcomm.com>
 <102d9042-49cb-4aff-8b93-a882ed8da27c@oss.qualcomm.com>
 <e308a74f-1724-48d4-9d1a-fba6d06a29aa@oss.qualcomm.com>
 <98da2c17-764d-43db-9b13-d950078ba41c@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <98da2c17-764d-43db-9b13-d950078ba41c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6iOWFVbwq-sEj9YcIrTxgXuB7WSHFlWM
X-Authority-Analysis: v=2.4 cv=D+ZK6/Rj c=1 sm=1 tr=0 ts=69039b08 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=kYOnW6kYNC4MuwyOue8uGA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ve3y1cz88okj8OIuEZ0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 6iOWFVbwq-sEj9YcIrTxgXuB7WSHFlWM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDE0MSBTYWx0ZWRfX4/podXtWVpjo
 BAwTAkY7LBXJ9sxeW5hp/Fjf9lbUy44QWMA7XewVmiYaiE3mUkwql89xvLkV+qYSm6LeTrSpQTS
 dv1LqCOdzjL+a83MAX0gkdnql07gprJWU1VQeXwewM+NJyxwgGoLcgfV1LE1si2Evoh7MtIqfjM
 iHyRdWw1oeW9daD0WgbTch8J1OUrud4IeoshdORpiQ7UYmEN/8OruOYrA2R2apZKcUkGgJTKJiQ
 q6H30LDkomGvL3oUX9IcZE2HpIZdBZnZQqqU0bKB7gdmrG+q71U0QCFfsxDZS5x4DhtQpl8Wukm
 dS4TKbjgyFsXO+pXPXnZLtGFXwyq14M1eSSjdl/BdInnuNjDywdX0aFYmvFUWILQ0+bJ6LiAp3L
 mRsor2CC+jzDm2Q/vlXCo9ru85nEfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_05,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300141



On 10/30/2025 4:41 PM, Konrad Dybcio wrote:
> On 10/30/25 7:24 AM, Taniya Das wrote:
>>
>>
>> On 10/24/2025 2:09 PM, Konrad Dybcio wrote:
>>> On 10/24/25 6:24 AM, Taniya Das wrote:
>>>> Add the newly introduced 'mem_enable_mask' to the memory control branch
>>>> clocks of ECPRI clock controller to align to the new mem_ops handling.
>>>>
>>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>>> ---
>>>
>>> This probably fixes some ugly issue, could you please mention what
>>> the impact/problem is?
>>>
>> Konrad, this isn’t an issue. Previously, the ECPRI clock controller’s
>> mem_ops clocks used the mem_enable_ack_mask bit directly for both
>> setting and polling. However, this approach didn’t apply to newer
>> mem_ops clocks.
> 
> Right, the videocc patch you attached makes use of this. I didn't notice
> previously.
> 
>> Based on the feedback from v2, I’ve refactored the mem_ops code to
>> handle these cases more cleanly, which required updating the ECPRI
>> clocks as well.
> 
> Please split the changes into:
> 
> 1. add new struct fields, explaining the reason for the change
> 2. update the ECPRI driver (so that when the next patch lands the func
>   isn't broken)
> 3. use the new fields in clk-branch.c now that all users (just qdu1000) have
>    the required data filled in
> 
> So that the platform remains functional at any point in time (which is a
> policy because it impacts bisect)
> 
> 1&2 can be potentially squashed, potayto/potahto
> 

Thanks Konrad, will update the changes accordingly.

-- 
Thanks,
Taniya Das

