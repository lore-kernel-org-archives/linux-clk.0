Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2141E3DFE
	for <linux-clk@vger.kernel.org>; Fri,  1 Aug 2025 04:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754022319; cv=none; b=HLb4yDI2NzJt3Lb6iu0ZtqOoq9R/klhLVCwTvwl+n1G4G2ZNjSZCkKm0nit9FqEzB/zH5wf3HF4hayBQu0eqoc5n0csjVxIgZ1RovyMz2wENRuYWBLqPnxUWudfPGSoAjYDLglV37YByg0iVNJpjQYy92/8yBw30DBiEg9HZNys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754022319; c=relaxed/simple;
	bh=uBlorlwIYp1hcEgGWzhSFeKrBrorhnWYZjy/YHECfXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rhKpZJl0u1MJW1UiHORt4TmZZ6hzcOrewVeQPMG9UqC7SGh6TLZ1C+KcZWiq/ENyUdB77Om3X80Y/QqdsmoMGJlyb0xdZUxE9IAnBb6msW2fox0PQQtIxQ9IIgh2ralOiU7CsKa/N9+zWt8ETuGb+EenHvZi4hpLNvtrgxtbk0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PdC2tAoB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PdC2tAoB"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56VNK3Cm018971
	for <linux-clk@vger.kernel.org>; Fri, 1 Aug 2025 04:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zxRRtXcN5asqDedioHABDaioEx42PozHmsddFvNpWDw=; b=PdC2tAoBbSyWFYWM
	rw5Lpp581108vLB9AQws2QgTh/eSPipVej45NFsUmRGzJ6tFyEXfcmswa88EsCq2
	4EOszvfsXOQnHHcHBVVCFLhQ5BxUlPJNmXxO0S1R2DziK0LcLxt778KCSkBnJJq3
	ijPWIpu7tlvmdkWbEsuPfK+AK62CCG0cUqKYxakY/NAC0NAlYS5xjB74v/py+57K
	HeW2cbobabX4iWoriuZsgoCYy6o82hq20HOE9oMOhDM5fQ6qNk1RTX83D0o06CeA
	fl8r6PuWmEhF6MRwqZT4FMAJlDFv8Qw8AwDxER87Is3Pv5czgIOpqm+O+9Pm0Z3J
	dSumuA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qdaa8fa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 01 Aug 2025 04:25:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23fd831def4so9596745ad.3
        for <linux-clk@vger.kernel.org>; Thu, 31 Jul 2025 21:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754022315; x=1754627115;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zxRRtXcN5asqDedioHABDaioEx42PozHmsddFvNpWDw=;
        b=FC8vj1B9JzbAXXALi4IH1sZlxMB1Ntw2n0zGJ3mQaWEGPYhEzE4hSEFs6ZfOl9dXPt
         7iUiVDO46NMowqfYuNKCA3TLVb96+FwsB5NbVQp/ENbk6ZaUwg9yBzPkQVU9XLRhWP+q
         Njz+1ozGr26RROrlM0kSiTa2rsMQotPgJHW8vSZAeUvKxYcy5R+1l7DO2WpC02+gACg/
         yXUjU1Vs3ele1voSBAWs73nqZ3bd+f/hgWSAVmpFZLHkhJe3m/7whS47FDCYB3liUr2x
         YFL4IT/Nrb/jEogeervIyzzQ4dIGg+zSz3nB57/OPOdfP1UJNBuDMuYObRG1LXcmcufI
         LaAA==
X-Forwarded-Encrypted: i=1; AJvYcCXQfjmrkfd+jgjJ8yWVjAxUBsxzKJMwK33dIK5YFJ1mEePu/2OihHeBHCBV1N6NWoJRQ5vdT2FEmiQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywoq23SPBKXe7jFY473SPCw62a8wmVCyiCToWZP9Cds1HsS0C1l
	QgvTU3pI9Z9mPH0CLMDPD3yoJmVHWDFKOIXiVQHWLdDZQGh6m7deJti7wfmRXbXPkmw7moFkwkY
	x28mySEtxFvQ3WlK2ElKRfQML7znI05cnEqMchAiUyV9Gk0wltP5UJXWsLE2XrzY=
X-Gm-Gg: ASbGncsdXQmQQXovc8eToSUcMnjcDtynG4VesQl/+QvtDl+FsGJ1/SPXiyADmbo+osm
	/P5gHxUwQ3x1/gW31r38h5Ye4RaYwoHD07VmY9XEo5BziuSwCcK4TCVtVHRQ1YpVn6uA1TY3RIx
	RZTMYffnZgVnHzepJI/74pBNndZnR4S8igX4Lz3N7X4/EbK71Utm1+eRBVYnU0SQKMz6sBJzkYS
	U1A8J8rMpK4TKs+5BjHguw7iFwC3wY7sGC/BPuJpqOr3Nly0xnQ1R9zKmNLvD7PYToGb6tFzJkG
	p9qqUYWmqbx5yiyWRTjFwqi6wacplQM2sB6bhmAs7fB8iL3+BB9jV7enKZIHR/i55V0=
X-Received: by 2002:a17:902:e810:b0:23e:3bdf:e3bd with SMTP id d9443c01a7336-24096abfe73mr152706515ad.22.1754022315578;
        Thu, 31 Jul 2025 21:25:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzY+vcz3mT6FLuRg3s6hOjW8qEGzR7nQiQB6+tGHCmk4xO2hr0y7gSoPjaDxIHjG9/RlVWqg==
X-Received: by 2002:a17:902:e810:b0:23e:3bdf:e3bd with SMTP id d9443c01a7336-24096abfe73mr152705565ad.22.1754022314647;
        Thu, 31 Jul 2025 21:25:14 -0700 (PDT)
Received: from [10.217.216.26] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899a917sm31713485ad.116.2025.07.31.21.25.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 21:25:14 -0700 (PDT)
Message-ID: <2b802703-5214-4103-a1ab-e4c26a18ebb7@oss.qualcomm.com>
Date: Fri, 1 Aug 2025 09:55:08 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] clk: qcom: gcc: Add support for Global Clock
 Controller
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: kernel@oss.qualcomm.com, Pankaj Patil <quic_pankpati@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
 <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-7-227cfe5c8ef4@oss.qualcomm.com>
 <25uelsjuw4xxfopvfn4wvlj2zgivwbjprm74if5ddwvht4ibfz@yctc2kvfmxyw>
 <8b30c83f-5f35-49d5-9c37-4002addf519a@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <8b30c83f-5f35-49d5-9c37-4002addf519a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DX6ypcxjimbsWTSC9J_Ydyq64YC1CZWw
X-Authority-Analysis: v=2.4 cv=Pfv/hjhd c=1 sm=1 tr=0 ts=688c41ac cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=-exJQLPiCZ_865CLFvcA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: DX6ypcxjimbsWTSC9J_Ydyq64YC1CZWw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDAyNyBTYWx0ZWRfX19YnBBxLDMck
 tCCgY/Vw0B3LH3CwiqVWLLbEpT3rSADJpz4kN8qaKQMYSlAKihJrpD5ETCyVQwmTy9Coio9Rp6/
 T4UOXckpGAwTG7/C36VXbRihDy1hXS7wDivNee1fSeCyqzLvBrBbLo27j3nEj2H2So3tUZF6h5u
 Mk9gTfn9f3FS6HGp0y6ciO9ZqrwZMmj254h+vTqOOfEXPemcEzVtj3hpUDYiwilCZn7t4vxN9bL
 RSS8WevyUwnzQLNlrWiL5UlcwIJ5+wCkPKLow2fssHcOD2Lay54oMDTLPvzpD/RwBGbZaG/ZJ3t
 DfgDkasNTImEcFY2Lvqx8k5YvN8kZ2c3y9cDJaS4A2g0hADOHPE9c3dknCZMuuMfjdbN/4blKAP
 /NLHgWHGpel50jGrrGeMSsSMh9pC+d+cfgT0kamPVpI7LMA2vvVQZSKx6Ifha/KEuKbV4FUu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_04,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010027



On 7/29/2025 4:19 PM, Konrad Dybcio wrote:
> On 7/29/25 12:48 PM, Dmitry Baryshkov wrote:
>> On Tue, Jul 29, 2025 at 11:12:41AM +0530, Taniya Das wrote:
>>> Add support for Global clock controller for Glymur platform.
>>>
>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> ---
>>>  drivers/clk/qcom/Kconfig      |    9 +
>>>  drivers/clk/qcom/Makefile     |    1 +
>>>  drivers/clk/qcom/gcc-glymur.c | 8623 +++++++++++++++++++++++++++++++++++++++++
>>>  3 files changed, 8633 insertions(+)
>>>
>>> +static void clk_glymur_regs_configure(struct device *dev, struct regmap *regmap)
>>> +{
>>> +	int ret;
>>> +
>>> +	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
>>> +				       ARRAY_SIZE(gcc_dfs_clocks));
>>
>> Why are you doing this manually instead of using
>> qcom_cc_driver_data.dfs_rcgs ?
> 
> I guess that has been merged last week or so, so yeah, please rebase
> 

Yes, sure I will rebase on the latest changes.

-- 
Thanks,
Taniya Das

