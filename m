Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12121238C10
	for <linux-clk@vger.kernel.org>; Fri, 25 Apr 2025 09:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745575083; cv=none; b=XTa+cPpqwCcvw6T/qYFilxbq7FEHm1qFean5U88KImi4KljuEhsSNDlWsoV3NKGCltyV8Zp2MFiNUTipYDqdvgS4zHotSXK/XK6Is1oO6c0qlo68S6QhMHUCZqyuMf92AqWoTRtqWpfuumhGjuTeKV80Ne0wAI+acmz1A50XSus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745575083; c=relaxed/simple;
	bh=Vf/rLd4GFcJ3rfHcTZhJzseE/NW/DuE267IkH38ND9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fU7kBLAryl40Hfo5z92jU89rq+JsCTdWDkiDtlkJffB4lMTwhbnbzjHF8iHj49K9K7DPXbRuD8jzt3AyzL+v79J8lUeVqhqZXn1xVe8vX+zVokbdMPj+j20xAy29A62A5YmS8tagOZCRwDDkZJ1Sxb2pRYj01QbcTZTGbYZoxHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bo60nUk9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bo60nUk9"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TJpM015569
	for <linux-clk@vger.kernel.org>; Fri, 25 Apr 2025 09:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vf/rLd4GFcJ3rfHcTZhJzseE/NW/DuE267IkH38ND9w=; b=bo60nUk9AriZpXIr
	8ljFtmcUnt1uRxZYBxGkQQlsIai1k8jsLguG+AwgraCpok0IcazIBJZjpNR0oJnG
	KvgS0pzEuAGog/4KSHfuQpdLZcO10pZC9b/uUF/Al2RV0NjruLsFzxsnbmG7Pxeu
	3PcJWrNtdoY+T5Oxq+sgEku3XYUqyme3hcVfzq+y469VFQI52PgGyM61PPtWmBkn
	WbIslN6eW1R5FoyNVOSuB1C5h3wS6fo1bXCfzeIlEE12BfWDz+t4D3cRvFV4mLTg
	1ijoB2emkUJJsQ+MaXJjDtnawqSHOjCg55JBOV420CiR2xDzhZitC5GczT/tgQcm
	5ga5zw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3gggb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 25 Apr 2025 09:58:01 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6ecf6a05e9dso2829146d6.2
        for <linux-clk@vger.kernel.org>; Fri, 25 Apr 2025 02:58:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745575080; x=1746179880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vf/rLd4GFcJ3rfHcTZhJzseE/NW/DuE267IkH38ND9w=;
        b=BDQzsRFHDr/8cNIaEONScj/V8ruU/o4VNV3UOKqhUpy5AQHUbFs14h+qoEFJ23LZUb
         lMKDDcWs8LDWi8Eeigr67dlLiuFNv4rtdKL5PqFiw3NYlAw5naO7qj1+NX9XL7Eu6XEO
         IqjaCA1+FSvIk/p2TuPTMBGgWXiFRD6V5oQvfvaEWkCNGsFFIdewv6tNzwm9cVwG3/qj
         J+gFqriMKaVXYt6I/ljaQfhTQ+10Tx9Vkr5kihXQ+2gNFADYy2rDjHN8cA7uT+DXUnQI
         8eDdcOLDlXPi3pQ1JZNG+xPTTLMCk1o20UM4vAtoo3MnxZbPcbb66pjIVpBljoKj92ke
         aZIw==
X-Forwarded-Encrypted: i=1; AJvYcCWKJufBrIqeMuUo6WDg+FWj4glQnc8Zs2wuFHFxAGsjLcda19f3xP2W6V+cllDDd+eTCmRwAK7rQFc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxA/no/3E9EKQENdRGvbxLPMZeFO3a8DA2crRAtF1sPym4ZDNC7
	jN64rtMNp6JGU671Sb1X2mG9COxujKTja+8458HXgH5/iLWUP41+no6ATx1kOr4v3FL7e35GDLo
	4Tt8Ht7t7RNZKU4HyXQ7am14HGkyfH0HmFhJORaOeA9mbL3+wIs3U7fkxFkY=
X-Gm-Gg: ASbGncsgJN3+tGZ6wxbdIbll3HpKunZkoZQKEq/pTv9N8bI+3SVZGnwrWkvB+XF9IS9
	wjC5xDaDuvOUKF0LIyP2uffF8f1jq7LFaiT+6XiGTsmyDDMw4V2cRYvBTDXS4TZ+UyonTFo4KnT
	YT1bCYikA53PdIcST4OzyvJ/2UzInED/nfNg7e1alTKfkJFjLKyeRP1Jw4rIH5XH+hwATsX5Y/z
	H8aqVVrERQM1VRQycksICtpXYUfFPbEpu/kYdif9wcu797BnyKmuvKUm+sOxT409fvl4xbGSI+P
	k9ci1C0N1AtR3DIDlNa9jfm5upYx//eGQZHIv/MeFh41XXuwc2yG8D+h9OQ2W4Nx
X-Received: by 2002:a05:6214:27ec:b0:6d8:ae2c:5053 with SMTP id 6a1803df08f44-6f4cba5f634mr10002036d6.9.1745575079770;
        Fri, 25 Apr 2025 02:57:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1aDrr9tIrGOVh+lPKRQPvx999AwcL22qiAWtArNF4QQ88HDa7YW9+wreCLFQKaTgC7b9wGQ==
X-Received: by 2002:a05:6214:27ec:b0:6d8:ae2c:5053 with SMTP id 6a1803df08f44-6f4cba5f634mr10001956d6.9.1745575079389;
        Fri, 25 Apr 2025 02:57:59 -0700 (PDT)
Received: from [192.168.65.5] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7016f5342sm1032645a12.35.2025.04.25.02.57.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 02:57:58 -0700 (PDT)
Message-ID: <70635d75-03f9-49ea-8098-57cb144fda94@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 11:57:52 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] arm64: dts: qcom: Add initial support for MSM8937
To: barnabas.czeman@mainlining.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
        Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Adam Skladowski
 <a_skl39@protonmail.com>,
        Sireesh Kodali <sireeshkodali@protonmail.com>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
        Dang Huynh <danct12@riseup.net>
References: <20250421-msm8937-v5-0-bf9879ef14d9@mainlining.org>
 <20250421-msm8937-v5-3-bf9879ef14d9@mainlining.org>
 <2e3d94a4-d9e1-429e-9f65-d004c80180e5@oss.qualcomm.com>
 <790a0b7537e0b82b70bc4b32612ecee6@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <790a0b7537e0b82b70bc4b32612ecee6@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DzNfwhP53t5yG5Eg7qa9foxs4s2i0F3i
X-Proofpoint-GUID: DzNfwhP53t5yG5Eg7qa9foxs4s2i0F3i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA3MiBTYWx0ZWRfXxw/n2w+WCb+S YERZRqSIu5ta1V2TUbvaeWS582mquBNokp0d0UYO1/GgwcPOPJwPqnZLJGlzETc56OTKFqKBuP5 gkbnlaQn5XYu3vojQkFQzwlSPGY2ynwF43wdtOTcaXUkz+H0kViv1drsuiM/lbVf/9f4o8zEXlu
 7ccAzGd6kfNZ4m8VmfW9EBxiT5hdI4er7RkQw3p10rBhia7P4I3KklMMWTl1HBvH/ygOX6x1P// ZYBzcSIMgCMaail3TpAG4/96eDlIZ138tXiu0XMTW9ogGWIM8fLYuHSgEz9Eebww/c1qEchp7Jc l3C6jBqC2J2dWjOaiGcpLoTBxB9NnskYJndMVDFT3H9nt6+nSyTdXpaaSXyIddF3cUBTcH7eSaN
 /tAgD99FTbsLBOwvzKgpiaXarmr5+ljVAeDssstiu/9bcsdqU+ej6dcrbuV+I3Dh9OQ8xIh3
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=680b5ca9 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=OuZLqq7tAAAA:8 a=bBqXziUQAAAA:8 a=x_pH4qmy28IV03WXGqsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=AKGiAy9iJ-JzxKVHQNES:22 a=BjKv_IHbNJvPKzgot4uq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=935 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250072

On 4/23/25 4:46 PM, barnabas.czeman@mainlining.org wrote:
> On 2025-04-23 16:03, Konrad Dybcio wrote:
>> On 4/21/25 10:18 PM, Barnabás Czémán wrote:
>>> From: Dang Huynh <danct12@riseup.net>
>>>
>>> Add initial support for MSM8937 SoC.
>>>
>>> Signed-off-by: Dang Huynh <danct12@riseup.net>
>>> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> ---

[...]

>>> +            gpu_opp_table: opp-table {
>>> +                compatible = "operating-points-v2";
>>> +
>>> +                opp-19200000 {
>>> +                    opp-hz = /bits/ 64 <19200000>;
>>> +                    opp-supported-hw = <0xff>;
>>
>> The comment from the previous revision still stands
> If i remove opp-supported-hw i will got -22 EINVAL messages and the opp will be not fine.

Right, I have a series pending to improve this situation a bit..

In the meantime, you should be able to define the nvmem cell and
fill in meaningful values for this platform

Konrad
