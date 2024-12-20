Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6BC1ACE12
	for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 09:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734688732; cv=none; b=UqnBVYPmwJQwNFS8I8juiN7cAqetzJyEGNANC9hE1vtLiXYG3x6g+tNoGwA7mJwDtJKG0Hq16YKpwLzBNGRtg1IEY5fE/eUhuEyvvFQN9q3/6vniBohpbNlZ6MXrMm8rDIx+RjCJYocTaYsyfe4yNW/QWwwsszBCmpo4nRnhphE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734688732; c=relaxed/simple;
	bh=imySxLI+xVtc5JfpHMAWOzIYiN0ng0zYOR6IfzQEzAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AHwhUj01UgscO4Zhq/zVVaDVgQzEQ2LaI2GPHqsW2pAJVs3vD4OEnT1MI3Jc+HwutugjHmdFCErKDZM+ur70XzRCHX7sQoV9BLPI0BFkNL6Mp+OFxeRLE0nlpAt8GtvpNnAtEZCpEgHRHW25KOOy67Ct8n8CWVrbWZKnuOF2lZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ShdJ6xlT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ShdJ6xlT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK7Liiw029453
	for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 09:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	blksKWbfz7iJ73vjVjSdGaxJFijwIi/hjpQpMcGlYQA=; b=ShdJ6xlTXIxnP3k+
	kEBHMhqrxaI9RAz1ZLTYKff0rfg+jDOI1RvrB0GNfqqvzKcZvdtX+h38F0ex1sj8
	DTIjQRIsw4h8zfb+eDYa6Ca2QsWbWRhZsAARs38K/vE66ThHEBnlduDbEBgQawi1
	Yr5jJB38SCbgwZbfKV/z2OizaW3nRM1uV8J9S+AX0vlai23BwUC9trT1Xxi5JTzX
	AOy4EEn7WDk4r70sfrXM73LmiNb1Sd+nanZSKg1CjJLePihUzZOPW2R8IVNnoVyX
	WTODXymuYAVXothUgUNnk38OZ5Rh3/itUOn0aviqi26s6iPv2G0RwAHjbgclz6vo
	F5Dt/Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n44fgeqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 09:58:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-46792962c90so2786351cf.3
        for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 01:58:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734688728; x=1735293528;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=blksKWbfz7iJ73vjVjSdGaxJFijwIi/hjpQpMcGlYQA=;
        b=Z3j9l/vk5axyxR4vvvBr/6EL5bVj08ciHIP/XStYSd8avNeu16hukZaz+3kzx2YYL4
         +PRY7Y+Wxecl0HW/S2bhQn/7LlJuEBGp68UnsZuNLciP2ymLBDX5rfH4HpXSnIJRG5pX
         kO958wx8bnQIUlv7RSATBFl/7gU7MkmzO9Yu6y8bwKPbDf8S0p8nhwKL0ZCiFPVsBs86
         QeJSZW59uBECrspg5AUiPzX4vjobTHx2+A+YX+RZvjl8mhJMW8XE3TNAgDzSQNhMHkvE
         ZMBnEc15RQzR6G8h8WhxgHTgS4Llxu17PqBLBuw7XwTrNye24A/ydKcmkxhX9ruBZIw9
         tjTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgJEXrK9WicTd6yH8iUdqWp6yCn+6KUGJBuNyovWYS4Foy5unec4ZjsozABZFiG8sLRZLbiIqzSiQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0g4cGomvhSnUoNzwNnFgCCBpmZflWPHd745Q+ysBglfcharEM
	VvvgDW55popnZjPf0xRLBf86z2tFC4oe0/Yt5MmioAdQyPf0f6Squ5iEw9rkLQcw3emrU9jnHkL
	3bMUg24MgA6T+8ikiwXiCAAzbw42YDjqfQ0zp4HO+71FeKu3mho17qhUrmu0vsPY7jlQ=
X-Gm-Gg: ASbGnctIQRuZEpebnUEbSqSvsxrFGMxbG2giqDUfsjmh80sRTrkBBdI9dIyJhUAPTHh
	kRQ7UlSnNmP/bEMqU9aq8hKBrJTehKELaH8bu873wo4615A3NGDrGS/T4417l370KftZ2ugckUn
	xPx1mc6s7i5Wfp2d5fEpQyI472marMtzw/l9oKVmqG2HcdH6AA5505RBArg2cQJ2EUeJJd55Wxc
	KX7pahpm+mUqQQfVXJOeh/MKgkyR+k1p/BBZoJSy492YoV18jJ2pOOKgnoD+fjzHpiuC03y+MJK
	46UomaaAfd5BbQ68UeW9eLcMi9w4VFbLIT0=
X-Received: by 2002:a05:622a:13c9:b0:467:5462:4a18 with SMTP id d75a77b69052e-46a4a689a11mr14304021cf.0.1734688728444;
        Fri, 20 Dec 2024 01:58:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFg/XjXPUy3NM6qqF0HqwQmuUXctgdk+5eZjQ2B4M2wRVitgkcn6HzJBq2Bl8mYsFSmLBXKYQ==
X-Received: by 2002:a05:622a:13c9:b0:467:5462:4a18 with SMTP id d75a77b69052e-46a4a689a11mr14303821cf.0.1734688728096;
        Fri, 20 Dec 2024 01:58:48 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f7casm157398366b.3.2024.12.20.01.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 01:58:47 -0800 (PST)
Message-ID: <a41eab9a-665b-48cc-aa4d-63ddfba27dca@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 10:58:45 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-mdm9607: Fix cmd_rcgr offset for
 blsp1_uart6 rcg
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <quic_tdas@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, stable@vger.kernel.org
References: <20241220095048.248425-1-quic_skakitap@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241220095048.248425-1-quic_skakitap@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: D73ZkmKxURaKNUvx98sQ_EcLve6-yHs4
X-Proofpoint-ORIG-GUID: D73ZkmKxURaKNUvx98sQ_EcLve6-yHs4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=839 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200082

On 20.12.2024 10:50 AM, Satya Priya Kakitapalli wrote:
> Fix cmd_rcgr offset for blsp1_uart6_apps_clk_src on mdm9607 platform.
> 
> Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
