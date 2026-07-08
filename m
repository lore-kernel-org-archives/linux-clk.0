Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2AB46AF05
	for <linux-clk@vger.kernel.org>; Wed,  8 Jul 2026 11:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509617; cv=none; b=u+mGbusHw0Hp01vQVqlOAkWayKfKBucDvS8rH9eTyNmnN4Ze8EpdvTyxR25+g5OaaxIopMC/Uvn4HDQC0aH8akGo3wzDz4ynonKYpHmaC/WReOPVqEvTXsIvCCQYLexCKFOpRCiOF5+saF/FGEceTbVr4XjdlEBtybPUqDjS6GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509617; c=relaxed/simple;
	bh=RPdmKLekRxNdh9LfxzY8Qsg5bzPJ6v1a9Z6UXOIW+c0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ekFP843Ar9W0f56I4ZD7bH3WYWBs71CpO7YBP8UngAC3pjl47+VmwAnnpgZyoq8M7TC2tbTDxDN87+2gspVE2rKLX9zu8vT3NuXCXhmO/oqmtzgHJ2+kp8YtHpD0Qp27T3RU8Dya9VN/HrhRxWm9R3bfRs5V6LMMYEVGselMrIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ggxFf/Bh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O4F/xYT0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ggxFf/Bh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O4F/xYT0"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66889DHD2231102
	for <linux-clk@vger.kernel.org>; Wed, 8 Jul 2026 11:20:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pUJJPgMA/tWtd8hKTbcK7n548nKEExeUEZFWObt2z+c=; b=ggxFf/BhJiz6e+0R
	CyrRq0Wu76Xd5ubTtqtwz0kpr1+e7nwze8aes8Cqupt8xc6ANnJwicF8PdJLahoE
	3AOkFM2Uv3BIQOdKKoXDQ6VdVP3KQHgEfiNQz/fX75d8wZx0fyEf8QGayp3TbUkS
	Flam3lsVZoJsr4GgzcquuXm3a/t6uL8GaUyBQ65ZmDorNCA4eal79DKpbabGDWgm
	/QOeVv9IpjBRFNMDs3T9Y6gAgZ8Xobw5q1UrdoZWk7NGCxzBzn87zCZd1fQowlfj
	htWIDh7jLjwciCtZndLmrurCVa/8CmJYPkhsHegra1j3R4akTyWdytsUwOFHCg9p
	j4M+pA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95e5v588-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 11:20:15 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8484123e7c9so754159b3a.2
        for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 04:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783509614; x=1784114414; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pUJJPgMA/tWtd8hKTbcK7n548nKEExeUEZFWObt2z+c=;
        b=O4F/xYT0SYD/TbR/3t5Uz1ylBXvvq0OlPgB0xH8s8nVah9meRgk/gz39gle7sVgR75
         aMFgEa4gC3qZYpzQspcJLmkWmswhIpZUxyGRYxIv84a94Y2cPt/e90+lHxP5XSBwtMCp
         dYJofJnPbQmTesKauIXG50Y6JP2czTtOPYZ85GBP7u8Ye9C0iayqsGKOuJGdixGXiXxh
         gVAHCJk8RgREVVtNPurqb2FpVIPCPsvNBao7ZDHlvkxwW6pQ9EbPVF9rPn0xtMBVAB3a
         lZS4UncmLDRDTRF/MPFQWxsSFC62JiglM3TL8e5nEbywjmz4gl+pLwLSt/OkUtJqgzjW
         HlWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509614; x=1784114414;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pUJJPgMA/tWtd8hKTbcK7n548nKEExeUEZFWObt2z+c=;
        b=DQGDuMbdWivai/B4MANz8VcFh206JrfFn+ufEDMoZpDFvy8Tey4u32maRgEAWQKKc6
         eWvD1oiTLsrl1iqICt+YE340aZNv04rhvXgkow6+3utito+ILI5p/UXGzn7+TxM5SLu+
         vRFslm6lXHj55RlWuvYm2R0D87d/wQzc1XxhgdfZi+Tx5gJ9YnSdHm9fdetMK3u/EFrH
         v82jIGYFhHusSnH+tUI5g84WTFn2t+gg1HG625zU0goqSTBbKghYYVIXolVQspWPVue5
         oLEzr9Zps0/jEa7/kW7p3XxgKd4+ev5bLRwUDlKG3TROciBwtGltBrW1BYPj6Xk2edzo
         uN1Q==
X-Forwarded-Encrypted: i=1; AHgh+RprOl7ZJM6eqrcHWGQdht1maRH6jYM5KYWpZsU7lRm3FrwL2kUQMuho1vJkdAVV5IVA3ibR9lanXD0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkuiKTaJzJ0ts9onKDUtbtaWLjxUf6ptWv3O/usGDU9WjM5jc3
	PeFg79C3C8cUdKueNgye7WTrCqp2LgHV2AcJQ0Y37q1JE2qBE9xL5oHPf2iZlm0xO08UIVkPyjP
	tG7evsxDT7Hrw3TNsVZqBxy4QM5wyArRVrFxIeyLimT5j2Pr5uRDR9vKATukRNOE=
X-Gm-Gg: AfdE7clZUrALWdj1L+uJ9DmJuTeeo2is2HQv6yqHUQHfnYatVxXJmZoyPzQGa3G5QIK
	BI7XR0R/7IyGow9w4cAdKI4bNbixgZpvJNnC49PdXcXXeS29ht+zmZTkA/PSnxlRNDkuKJOS76g
	4EgOv/YIcat4sad6nDPONorwQaStbxYjtv9MAJPSdamiDcpa7hGFZJjjUCEyMjye6AD4HaA76WM
	Wz7ovWs7bhwA8dEXJjOftBjfbCDKlfg6WAcG8xU7lH5FSh7WH8mxwMNIhfE+j7WN+6dYZxhuaJS
	tLbeRTFWpmA/ylIWs/Ddc4onCULeD0KxMOor0MYLRmcJDnDc9Xaqj0eUeC7TtvxdG4wFd+VCR+4
	MoEYYlmv+y+Q8FFPJ2crggQGqgisv5oqIdcjS5EU=
X-Received: by 2002:a05:6a00:6c89:b0:848:2f74:d8da with SMTP id d2e1a72fcca58-84843012154mr2399880b3a.75.1783509614459;
        Wed, 08 Jul 2026 04:20:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:6c89:b0:848:2f74:d8da with SMTP id d2e1a72fcca58-84843012154mr2399838b3a.75.1783509614026;
        Wed, 08 Jul 2026 04:20:14 -0700 (PDT)
Received: from [10.92.199.168] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b5e566sm6918923b3a.3.2026.07.08.04.20.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 04:20:13 -0700 (PDT)
Message-ID: <899a5964-bde6-4cf0-a3e4-f6d0036dd3ab@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 16:50:07 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/19] clk: qcom: qcm2290: Add RETAIN_FF_ENABLE flag
 for DISPCC and GPUCC GDSCs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-10-cc13826d4d5a@oss.qualcomm.com>
 <svxscdqhtkzkyitstli6srm5el4jexgefudrbdyjhvywr6qdzu@h5yjvz4hmmvh>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <svxscdqhtkzkyitstli6srm5el4jexgefudrbdyjhvywr6qdzu@h5yjvz4hmmvh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vrXsN3bf1S1YM3BcrwobDA1ntlK3tiIT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfX1oCxOIk0eIQI
 YVdqw8lPJmsgfxlR8U2ciKUaOcQxmrytYYgE7URi6wFPzzdA8Mjla8jvajMqAf4fSC7Nuyjvcme
 E99FoKCZCH9rrB4mJrchjymkCRH/OkQ=
X-Authority-Analysis: v=2.4 cv=CNoamxrD c=1 sm=1 tr=0 ts=6a4e326f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=KQFNWlLbjmTlgseXzdQA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: vrXsN3bf1S1YM3BcrwobDA1ntlK3tiIT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfX3ptD3VI924re
 1xHMavV11ZS4ruPkkMsxX3la0iPLbX9hypOGHf6b/AzbMKLWIfstYRj/AO7CO2YaYe8nRVmCtq8
 cq8IREimJDTSJdelfhKLLMKdCbNPAov83uMPJ/dK0jPouYpvTC40ZFZwQ+JtZ2dFDQUWTARA6SD
 Pj16kZ7jsIns4hyprnsdnRHWlJEAptQM6J/5wpfm3J64KM9ucgKcxiScBKHGKurYBlQYI5VzX46
 +uhi4NoL5No+iPCiJfGQ221njuLViQVEdyrlYyYpj22wDwc7CtwnxUK9zYaeQe4rOSf0A24EPaH
 IW3jm2b73pogZ76pIgVU1vSp1doZCwDIKmvCYe/bhM/9RsMUUHq2AIwFe98emOfL8wgnlh38As2
 aOh3Uhf3TDtfR9P7OrqqWlbifhVuclgRiM2Rb2OCNvWAAlJvDnt40hd89emDFI4rUZU9Q8675tf
 TKwVifKv7mowd+4dKfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080110



On 04-07-2026 05:49 am, Dmitry Baryshkov wrote:
> On Fri, Jul 03, 2026 at 12:01:32AM +0530, Imran Shaik wrote:
>> Add RETAIN_FF_ENABLE flag for DISPCC and GPUCC GDSCs on QCM2290 to retain
>> the register context across GDSC power collapse.
> 
> Fixes? cc:stable?
> 
> Also, while we are at it, move all fixes to the top of the series.
> 

Sure, will add Fixes tag in this patch, and move all the fixes to top of 
the series in the next revision.

Thanks,
Imran

>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/dispcc-qcm2290.c | 2 +-
>>   drivers/clk/qcom/gpucc-qcm2290.c  | 4 ++--
>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>
> 

