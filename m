Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C07218827
	for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 15:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323663; cv=none; b=JnzNcSdTCyBAYv4c3Ws7oXHBog4c1qlnknc19LAdKv3PMOHlgl5IGYFT6AoBtb4k3Y+9/j8ZgLynqcPfhE7k+O9UCpiJt2sQzhRxzwB6MLKiRkUYKg4sQGEiFZRUuhpnDC2O4wCSjspLvwE3j0X9mUNCCQVA5LDtJMy3vKPqtkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323663; c=relaxed/simple;
	bh=r8Rz9y5mBO826o6HxT9wcmQ+Cgxb+4L1qYpw84sCd1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bGr/S66X0SbcH/w2KKAm4/qnTwUVJAAxdDNh/1/T9VKmwCHAjhWLwwFt2U9Kdq7RBctcFSZMhWzSSfmcy7KXDpHtPiYw7SpvMOEcakWhyhhUn0KokByDYNy4w1ZZ700OplojYj7ZsncVb2utUzIefv4RJbjC0DDNSIQNbtO534A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nY1mWB4k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nY1mWB4k"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFAQZ016644
	for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 15:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hDP2BOABWrcdmtprDmarKLv3ZXSLVag50oTBIKB6RbY=; b=nY1mWB4kDphGytYu
	iWSFS+6yKBWXV3C0FVD+NKWS+voV4MwFhjezUbgnJtHOjcK5kMa74wx+L4/T3aKg
	WmHyNsU8CZYGq6LTEeTzoRMfEnpNOEwPcJamrLFeIpegOoxG22cHmVrcQoSXN87f
	G5yCWm3Vm1zWmv5gREHlwDCC42wEwL1uCKJqNHByG0GpHEnHdCe3FVUYeSc524+e
	6vmS7DjMTzON7w+MdvePKkO7m4gooqd9I7dFyoEoYcl/sfuHyNCBDOg1yni+AIVh
	Mt7EEwwbGSc9ngXmDgSYKmIELS4AatMXMfAQTO8z7jl9hpa/e45OOI2/KhPIvd2H
	KxPVfw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmpt67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 15:41:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5466ca3e9so24557685a.2
        for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 08:41:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747323660; x=1747928460;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hDP2BOABWrcdmtprDmarKLv3ZXSLVag50oTBIKB6RbY=;
        b=FdW3g3EKokcIzpSDGSWGcSGvk0W9jbNDdRfSsiegGcUXega0W30PqdMRnbS6RLivKm
         aOsy9Y0k7lH1kLeog216vt+ncsDNijFZ8ZgNcXMKdn6EGo5jz4fSf73OFNHMuqDWGh5o
         3G6GOs4HmBO4/7CG336v0znDP/Eqv2SR2lvx5RYpjleBVzO8snwbWBwmBEOk2fuaab55
         zy1f+Qap44Rwy3MXBTUSMoE55rPYyK6L3MP2wRwaa0g8j4Mh/jbhaWuCAm58mm5+Xfmq
         Im8yE21HsvA0u9I9koTzvQwI6X/GhxOcxEhYWIvtZnDd97LA+02Td2JGyzEhBUvLf8ve
         GsyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWe3F/ymdwHAZSnl4vllYDn0DmuOXWbb2F5WPnu4O9w/HzXxAt5L6M8S3+8ePxtsjcSLWgBsI9Jgzk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ9G+z8b/aLCQ3obRqEC+ct+w/xR24n0eKfl4JUJTBkHcRUX+E
	8d2+/ZaQ/jKktymUyhhzuGe61zIZgL8nk0MDyM8FVFQ6rdqLBjDxDfNmBLQi6RTKauXevvQ+m/k
	W+dfZ7jCmyWOpswknQr4w0O2EuXhvaAdDXDuOrFBAuVSH5nq+OoDmP0YlfcI=
X-Gm-Gg: ASbGncvZhuzisK2Etp+sZoBz+7tF1frTntQr3td7omTH5lZNML2FGxj3kbpFRsuG/Mi
	3vT5TzdAXlDh/HNVrO5c3T3wpwbzTkLKq1wRwK54B1EQ/gm91cxRwvHdVXzrxIMT6pMAfrxDDGQ
	+u0YxzpPmBSbVu88jaR76lJWpKaTYx7DtdxdAIUlZYrNjZzyJ7diNuP/Mpc9/sW4UzOCKLhRg/r
	27boSgJduC2m7i4LZS/1El6rlnjF6s7CP3YbrheKtE3E1Wsf7tixTm0lLmOtUDQ6IkAGjA3KGoW
	hU07oGu78YI+qWaH0x0duzs0fv4Gl48KR4hna2sGmwSG34J8HIOW9dHe0KD7NFw0bg==
X-Received: by 2002:a05:620a:2696:b0:7c3:d266:3342 with SMTP id af79cd13be357-7cd28817e46mr483160485a.5.1747323659951;
        Thu, 15 May 2025 08:40:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkD/kSx20+qw6EEF+iZGvVJtXA5uOZxo7BEHt8EbD6OzUqzYurpQEx+s5agdussKHsTUcOVA==
X-Received: by 2002:a05:620a:2696:b0:7c3:d266:3342 with SMTP id af79cd13be357-7cd28817e46mr483158285a.5.1747323659432;
        Thu, 15 May 2025 08:40:59 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d497a0fsm5132866b.140.2025.05.15.08.40.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:40:59 -0700 (PDT)
Message-ID: <764e3582-6e09-4252-8e5c-12a7c5ba58f3@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:40:55 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/18] clk: qcom: camcc-sm8550: Move PLL & clk
 configuration to really probe
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-10-571c63297d01@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-10-571c63297d01@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NSBTYWx0ZWRfXzJ9VR+SE6Wdk
 r9Jvq1xtLYbnDMLqjXke90TmXyQWJdvTmqAHpgH67TMKAq1w3l7AXFGtUhgrkxCtKRfLdX1rX4U
 i2RW3GB1UJWFAxfVrPXVOTNuRRQX8y6a9iGMVRc0DRT+4r8V+ze/hdxV5qVq4nobXgOdaaq5ErE
 o7tDNev89+Zs+wQm4Nh0k/zm3X1dr5F47e7iMRmtWrVzsguOfLEu4LAxdIBFGTnuVZmlC6qJuHY
 e2aRqukJ15gQBm+aew7zzMgT0xiQ9O0RH/lnbCcFIu5ZpsHNtGZqWIbvbrtMGbRqLv7Ye88an6p
 y0vN5B65iI+SVV/ArbQcVoDYsgBxWE8MeivVtUEoVyvlxLwl64giklOx4dzDnlgAFXYlS9bvo/k
 CvDkRPrSa7qvSQXHPYAd8/ox/jMRS6vB9KbrjkR1DUHJIs/H0S50ma8NEqIriKNBjGSGiRGQ
X-Authority-Analysis: v=2.4 cv=G5scE8k5 c=1 sm=1 tr=0 ts=68260b0d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=OU1JASuMovj745rkUKUA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 2iVdwDmMFBGMkGJsikyB_pCJZiRWlZrT
X-Proofpoint-ORIG-GUID: 2iVdwDmMFBGMkGJsikyB_pCJZiRWlZrT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150155

On 5/14/25 9:08 PM, Jagadeesh Kona wrote:
> Camera PLLs on SM8550 require both MMCX and MXC rails to be kept ON to
> configure the PLLs properly. Hence move runtime power management, PLL
> configuration and enabling critical clocks to qcom_cc_really_probe() which
> ensures all required power domains are in enabled state before configuring
> the PLLs or enabling the clocks.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
