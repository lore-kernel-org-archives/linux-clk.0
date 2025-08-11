Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4C41F418D
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 10:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908384; cv=none; b=s7Ia0TY3oN4LpMidaXy1qAFFtJ6pkWAfi9GPltgNP2tsooanCQd6ME3fcIbkP9yKeNwmtuoQQ/CCm6Ouogck2AbtaLJ06Ug+m2/jmjOfPO4H3n1vz3zl8RhG6YzS1Co65IzjGebs8lZJWO1rLIMGc8NNbX9J/qYG9WjBgizxkWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908384; c=relaxed/simple;
	bh=aLfJkOIeEAJCZhqqFdhGsi7u4fwjQHYOZWwmnW4Phc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RQwG3ZPw7wfuQEIKiaraF/V8nyCJt4c/hdT42aiYHhDybb6uNvQdWaIy44AUrdGvzPS1AzTNIaRV1u0tIKcfw0qiGLkDfZ7JGILGwgnP2gsVrsoAJPwyE90umC0+8GvAdIUCmB0F7qHcjqAXhI8ip7eXVOQzFIaN3dCNzeob50I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mG5tjr99; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mG5tjr99"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dj7T032547
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 10:33:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MjMB/32U3IxFc2us9Kf8imiZjXbuMlwszLS0hiGM4m8=; b=mG5tjr99fG3HM/K+
	gsVYrKBFytzpoSkdOeGguGQlrImiIhoMQf8baomBjICJwRTkMzWsnrYB1CJd07hZ
	pxytLO3mYmtgZ5dRBni5OnBnw5wTdR9Ula19M0ukg7r6dYBzdJIyIfuhOiABPrI9
	FsbtTkPZHGr+N/VMZHYD32CBlOIub6nQDBFxCrOXLaUbDWqn563tUMhWUepmVSlq
	ZQbkqjbeTqCKhMGHjT0qyjT8FYA9rzffpL0WeNTB3WQvFJvrLDZEwXo7pjEZNgBW
	yKxZ15jdKRUrd2uhK+RoY5+5GhruKDnFdvue2NNnveLXnLtEwTWNmjkMour0Km1F
	auZOVQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dygmbydj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 10:33:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b06ad8dadeso10412461cf.1
        for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 03:33:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908380; x=1755513180;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MjMB/32U3IxFc2us9Kf8imiZjXbuMlwszLS0hiGM4m8=;
        b=GbtbQiixPE4bJI66E+HcJdY12bIJlyj+vB2OIliSZL4qgguytfPTM0kjGJPawYTsO8
         nNBI/pEL+MvP/evmMgHjQ+A36Qpf0ZJ199ntleSkJQOSy23vFSAVqxirnf13EhWdMFrj
         0jBZHuBMcEMTNIvUDwqo7auiwZwvmNi3mcfneoKSqH0Dd13ZHxV4gM2sUyPVMZXWFDyZ
         c81/8TUNafB8uIRzCUQDUMdose3KWN+YKIUTyGYSpUnRyxazY5kcAH29w7iJMGYIEfkk
         r2HOnBLz3rrxU2wJFCWzurdnz6nDyHJrtLPmXKgzNO8atVCLS7yZlcNtsl1X99UkxM4L
         3bBw==
X-Forwarded-Encrypted: i=1; AJvYcCWkduaR3+KsRF90RzkMmhJjiX/U8HAymWXbZUnZl/eda9NhedjVFUDnSe1pqGOLKxM9mgOyr9VhZ50=@vger.kernel.org
X-Gm-Message-State: AOJu0YwI82mhqd21M8z0gWiFRIq0Ed2Q28dWMgKrSC5SiXDqIxomS3Zp
	DTfdSTVUFCq8pSGe78UlI0XeR0ncdC4HjwNYW4gA92PMQf/YYoQUL1JpjTukvxjaH+OxwC26J9i
	8raAce7MjeSzNUUO5rlzOgPGtKM3xIcunqSoHr8POEOrlwRFd64b7KUsRzabffew=
X-Gm-Gg: ASbGncv4zGgSntacx9jzeVWYF471FrymdppzJq6IyhmCFN32rih8DmV7+h0SqPDjuNO
	dLTUpL6CfZtsbJUYmENxG7To6sWwszxYgx3sscIRxeNmyvdfzNYfIcJ45YVEkvXAIceOU8OntLe
	rELhwKCjmjxvWA5zuiGUwpXZEhiKBBRiPXeBnMxfqdmdI8Gd/GbDlVDQqg0FOo5LI59AXdxjjUf
	mygwdJc0TdQSklq3EYZI4VXJmG/8K9nJhswi5DCRR50vZinyPZCtsyYKtfhWS8ob8c5o9XmlMbd
	iLhvdFY8Qsrr/O6rhCQk9vW65i+o52mp9EW5G1NjO/bJgWgm2bSh9PCPf2t+g29rU9S0hHZIX1c
	4mkSD7bEzxpeo66A14Q==
X-Received: by 2002:a05:622a:1ba1:b0:4ae:dc5b:5fee with SMTP id d75a77b69052e-4b0beb027a8mr54331261cf.0.1754908380530;
        Mon, 11 Aug 2025 03:33:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHZ3U7a4gt2KHpyBD0mE2prizsWoPQrACXSYquI2KmbQ+tAz00IMulPe82iKcOcMiQR8P9Jg==
X-Received: by 2002:a05:622a:1ba1:b0:4ae:dc5b:5fee with SMTP id d75a77b69052e-4b0beb027a8mr54330881cf.0.1754908379877;
        Mon, 11 Aug 2025 03:32:59 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a3361sm1997594266b.39.2025.08.11.03.32.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 03:32:59 -0700 (PDT)
Message-ID: <e410c5f5-227c-4852-9223-a935584fbb75@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 12:32:56 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/4] clk: qcom: apss-ipq5424: Add ipq5424 apss clock
 controller
To: Varadarajan Narayanan <quic_varada@quicinc.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        rafael@kernel.org, viresh.kumar@linaro.org, ilia.lin@kernel.org,
        djakov@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Cc: Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Md Sadre Alam <quic_mdalam@quicinc.com>
References: <20250811090954.2854440-1-quic_varada@quicinc.com>
 <20250811090954.2854440-3-quic_varada@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250811090954.2854440-3-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNSBTYWx0ZWRfX+TLcIVTv0H5l
 tc7KzkUXYwUuEJDTJQmuSF/noV1kvONRecJdIOP19g1RNgcqbmxRy9MVepMOTFttqYGj6ilmK7+
 Xfepl9GO01eBs1QdIVYGiQo++ZQGJ8Gp9yVdhjVyRJAUO6PMt3W60n2QFEfEUZdD2UoaC4+LqBB
 oArTRDItsEjGMeMhYqXktEVEAnJapEuhJw68q5sLmqrD5B0vWo8X4SpONZwaUS52i9eGxqO3UVj
 2ltgujHgdYuXVBcyI8jNDFIXoO5lErmxxmQjxCqzbv9OAN1WA3Z5jPMXQaoezSepZQqvfkTZBHC
 5EeNnOzHRER1U5g37JueY+EFm4ZHZXiwqxOBQfySKIhjJw57obEHdOJIYAa+lLYDUe4RQp9Q2NK
 GTl8igZl
X-Authority-Analysis: v=2.4 cv=FvMF/3rq c=1 sm=1 tr=0 ts=6899c6dd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=ZSjPvR6QFvROfIIkwVUA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 8JOoqSSZ-R-wwHGIefIVlOym9B3bwxhr
X-Proofpoint-ORIG-GUID: 8JOoqSSZ-R-wwHGIefIVlOym9B3bwxhr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090035

On 8/11/25 11:09 AM, Varadarajan Narayanan wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> CPU on Qualcomm ipq5424 is clocked by huayra PLL with RCG support.
> Add support for the APSS PLL, RCG and clock enable for ipq5424.
> The PLL, RCG register space are clubbed. Hence adding new APSS driver
> for both PLL and RCG/CBC control. Also the L3 cache has a separate pll
> and needs to be scaled along with the CPU and is modeled as an ICC clock.
> 
> Co-developed-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> [ Removed clock notifier, moved L3 pll to icc-clk, used existing
> alpha pll structure ]
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
