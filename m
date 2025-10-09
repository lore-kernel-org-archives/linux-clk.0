Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86ED2C15A0
	for <linux-clk@vger.kernel.org>; Thu,  9 Oct 2025 10:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760006197; cv=none; b=Oi/XI+iT2P/ND0Ar8rOXxIdrpceCu7cCyUz0bYi4dQES4nfEuM/yogLoWGf4a4/x/JMeun4j/vdEUhhgq1CjM7oV3xgcjirLOFyiP6eOTJLuaFT1fHdLUOAx31zVDb8vdKrBwvE601QwZbiGA0pojVcx0wU2PvSdboIa2utZfz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760006197; c=relaxed/simple;
	bh=Uffd3qhqQX8T2QmVySytMSwy734A6Dx7GqzHMTI2XNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nCulp4xNjh11fY9iHy7WlAlOhILe82QRQj/LaxuJ4drDsEy6zDleBMrNMWkcnSjfpscdV4laW4/kRTFurPdNyYGOWfrbpIdR1wKrJLxPrScpx7Wzghmgj5IExaUwOb4gJUxu4siDRfr4RRUVxnNhnAva1o2myGnGMSp4TrY3GK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q/w+Fvyd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q/w+Fvyd"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EOIl019236
	for <linux-clk@vger.kernel.org>; Thu, 9 Oct 2025 10:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JIJDBCBIg1twPqmDVsmDKKaAwSLfEctE8SQbINeNBoM=; b=Q/w+FvydNHo8X1/B
	+AXpi0+Swa5J+XQ/geNeQ8nkkJF5U1xvdnGyuLAtpKNiv/tFFGZ/EjtSuEcd0yp5
	0cEgyL76g8p8XbtbdL9Q/zMxTUSa18ljpyqig4VTTlwx0u++NKHaoV8+SAhiLFzt
	6/KGe9UsG6fmMDHQxeDr54qmvJfp0fkgS0pHQ+MIsyB5iMUrveZcnbSe9vpZ4SCd
	KdXjyHhTYnUIKdrgaBCG333ixntrDqcirFeQGtyub1tXxcCjzOQ4f+M/J5I3/Dzy
	Z6iEun65oyz8Del38YPIIwIIYRNy2GzT2Q/D5kU9i4p67GOg8UWOjQkPGSFVZdhw
	aWqSUA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4ntdjh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 09 Oct 2025 10:36:34 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-269880a7bd9so17392335ad.3
        for <linux-clk@vger.kernel.org>; Thu, 09 Oct 2025 03:36:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760006193; x=1760610993;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JIJDBCBIg1twPqmDVsmDKKaAwSLfEctE8SQbINeNBoM=;
        b=knz1amiRp9a057FZYWWvD59kuWz741DXD9Lhypyx4ppIBAyIILzhdFkd/MoixEPA3X
         9i3HsAI/lCjb0mu2Ijhr8Sib5iQafYGzZOwAA2vLbFqEv0UOhWuJo+qWZLrdT+gUr57k
         WBp5Fu6f3AqK69nDqqoYcK0QITnPYjsOudmNs8bJyToDUuYM72zz97Mn8CMBXdH09PxA
         e8ZRVJybEW0BckrTb2tq/49pyiTpLnJLFUVEa6Y4bgULndvJXfrDu2VUlBnD6KKCU0oX
         BenTtXvhnMPB0gN0+eCjIW0KRe7H+xWYhOrMiK/n6l/OUp+9xvY6yclKvpmnwjETLGdI
         Q/PQ==
X-Forwarded-Encrypted: i=1; AJvYcCV56RPBmXZw+Bn/jtDctPtluN/9t3s2Ivs5s31mnjMXRSmGPJh2plnfAksKLXzQzr62IuqY0ylVlcg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhPIyEUbhFlquJzVA1tNGV6XFXMkAJeJ6fPyqWf7ZdkPqmh/d1
	bewHqkJvx9P+QsEaoT7sQsdA47Jho15bp+yRSCJEVrMN9gEunxUBzqu/IJLnXsfWyF5xVpYUNOb
	0sMzjGcxLjzPmm/S7cFusRAgHh9QNJoHUS1Al0UztPig3GnUCSE/dIfsZ7if0gCo=
X-Gm-Gg: ASbGncs39gF5ACPcLjMfXDuNW+oqlhUzgErK8BESdkTThtbS8I5o/vYZxhR5HsrEcn1
	YXblBOwBdArGUUETWq9pdXfLVsmFQY3Fm1dNpmSSEZ35Cff56pFFvTvc8WQ/cBNfIHaVj4mk8ok
	ZPy/8kLQDoBV7nUzMhPixGBvZmOG8ViXIun+yiOFuwQE1FXyqUjAzeBstm/TYbxOa+4PuuzGdZS
	Px75AKGDXKpyGQIBJaFRPSykwVFY+0o0Q0Wb7wquLY9hUByL+nc0phTrOre2ilKb5Ge6QxiHIyy
	tL9fNnkcBRB5f6yeioB9Lucjib2mTWn2ZTVKSHAl8BLGevxjrOHQAHGkBZP/scnfoXk2iwaKFA=
	=
X-Received: by 2002:a17:903:2f0e:b0:248:7018:c739 with SMTP id d9443c01a7336-290273ede9fmr82418475ad.28.1760006193346;
        Thu, 09 Oct 2025 03:36:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnmuc2TMn8t1SqRdjUlCwadYgfMLU57/ABb8D1b4oUqw/kKFE6rOzxHrm+dsfcGBkxJQop1A==
X-Received: by 2002:a17:903:2f0e:b0:248:7018:c739 with SMTP id d9443c01a7336-290273ede9fmr82418115ad.28.1760006192877;
        Thu, 09 Oct 2025 03:36:32 -0700 (PDT)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f366c0sm24318595ad.94.2025.10.09.03.36.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 03:36:32 -0700 (PDT)
Message-ID: <304d90a7-a35d-4e01-9263-adf0f609d76c@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 16:06:27 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: qcom: Add SM8750 video clock
 controller
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250829-sm8750-videocc-v2-v2-0-4517a5300e41@oss.qualcomm.com>
 <EAIobHjo8rM1e0LwqDqaUllC0qjV5ElMMhk6KgT1oNnFt_-k7ctM2_6kym9OjEtse5o4pOFM7yCkXgrSGRZhuw==@protonmail.internalid>
 <20250829-sm8750-videocc-v2-v2-2-4517a5300e41@oss.qualcomm.com>
 <d965949c-a7a0-43df-9bf1-c1232fc7e38e@linaro.org>
 <555039f9-a168-4a9c-b45c-d4583c553bc9@oss.qualcomm.com>
 <4777e507-c329-4c22-a45f-099fc57e31e8@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <4777e507-c329-4c22-a45f-099fc57e31e8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: kooidEos5gnLTphTjEdv7eVFdS5tfJar
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXxuY3XqfS/v+t
 evtCGS8+s8+LOUchtfFUD8kVs3NUo3ILrvwhfvNBFpRE/WUXIQuMVX3fYDpXRkR3d1GtdDc6h3q
 eimYaY80Xza/1+8VvuQeoGkCeVQYUmwswbc2Z3PooS59TZpNpxtyuNjTWPFeIWCqxRvRvtCk9VC
 gTSbC7Ut1syOj2XN9QGW6paHP558tKy8CDVTtgRY/N3GJgZX93khPLTbP2gkP0G357zyqqUlSpn
 cpDq2vT3dGTxHHZFIQxbjPFrm9FOBPAzFopCKz2dmrUbrcW4xIKpV7dRcJgJWN4ARxF8Jt3NDsi
 gaqDsB044OR2Ye+kmEiuZX4FZfGBYigpeBMAEBukDQLFX2kflTk4ZZh8jHsxdMBARhF1dN6rJeh
 6/BLodMiyOgm4yr/Vc6LGHZrbnjCDw==
X-Proofpoint-GUID: kooidEos5gnLTphTjEdv7eVFdS5tfJar
X-Authority-Analysis: v=2.4 cv=b6a/I9Gx c=1 sm=1 tr=0 ts=68e79032 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=KR3EwNOJeXORIeol_oQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121



On 9/26/2025 4:44 PM, Konrad Dybcio wrote:
> On 9/26/25 11:18 AM, Taniya Das wrote:
>>
>>
>> On 9/15/2025 4:28 PM, Bryan O'Donoghue wrote:
>>> On 29/08/2025 11:15, Taniya Das wrote:
>>>> Add compatible string for SM8750 video clock controller and the bindings
>>>> for SM8750 Qualcomm SoC.
>>>>
>>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>>>> ---
> 
> [...]
> 
>>>>   properties:
>>>>     compatible:
>>>> @@ -25,6 +26,7 @@ properties:
>>>>         - qcom,sm8475-videocc
>>>>         - qcom,sm8550-videocc
>>>>         - qcom,sm8650-videocc
>>>> +      - qcom,sm8750-videocc
>>>
>>> Shouldn't this be qcom,pakala-videocc now ?
>>>
>>
>> As of now, Bryan, all of Pakala is using the SM8750. We can migrate
>> everything together to maintain consistency.
> 
> We settled on keeping new compatibles numerical for already-numerical
> platforms (except board compatibles where all the fuss was / as it makes
> sense)
> 
> Konrad


Thanks Konrad, will keep "qcom,sm8750-videocc".

-- 
Thanks,
Taniya Das

