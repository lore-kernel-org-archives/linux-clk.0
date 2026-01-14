Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B8534EF13
	for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 10:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768386403; cv=none; b=uQi81LNiF+Z+GOU/tM0TSFeciD7FciF2MID4vgDSOAoNbUFisw3fBIHzfCA4M8NQITOy1BQh/7L1ARzpaXpFkRisx0Ra72IE9Dx+Nsj33aCW5EXMo5hWm+j2YlRjfGm2sbrF3+i3I+kTnDLW0iXb51q1do1TxEEbRUiBZmt/geI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768386403; c=relaxed/simple;
	bh=Fu8MtgpqCxZ9sGmx8hkJ/VocCQe/lZv5XoRHvC6Yeb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WT0WKHp1/lFQw1yeY1pb2KT8gBMApV0uX/XYWmPwNEuJYpYPfkKK1cYlNMmuDsVGAISmodvUwAGL32khApW0K0Q0TxhUtKtKxpxfqa0yLHMlHGvZLyrJbw5LyYO6gfgfsHMrTARSpYPvR3YdPuH0+fSFaDEAhOtePaKPwWDspqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WDt2rwrK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TN8ls7qD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WDt2rwrK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TN8ls7qD"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E9jpPb3296284
	for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 10:26:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fA5tFWc06sbtbJJSPWLf+rY1+5q51zBFBkLrZ9oIlz4=; b=WDt2rwrK9qwcNcxN
	PCA5eli9kwn0fjmAmwsHjzCBb+34sd4HbPxF7BWP5vXSP8K5EkZGAfL37cJo4ebL
	9ZX/ieJPUd2B+sWQvjwpTjWcnU6FSYOKqmpevHg9wIKOG+EpTIC5ZKEa52lo1vtR
	Kv3N4YUMK/Ju2sWbAWEzINeUf936RT0ZzbbWKRN4XjObUTL9T8iyYDEKYZ1BO9yX
	gcM+UJZnB9cYIdUu5vqH2sRpUH9Qhq467OAWsU0fjQrbMing9XG8qhd9Og0CXQJy
	ZIAtelGIBKx5VYOm4jM43nRDGc6Mkgb9kBtFhPWm4WjnUbHLJbOlGu48KsacyXPg
	3M/0FQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp8t2r5ep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 10:26:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50148db807cso1115391cf.1
        for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 02:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768386400; x=1768991200; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fA5tFWc06sbtbJJSPWLf+rY1+5q51zBFBkLrZ9oIlz4=;
        b=TN8ls7qD65k5AjZpG582nbJjLFlz8elNbcPfps+n+hLGpFLLzPAE3WE9NfNr2GBcFt
         aDwyrjnfEiE8Fcsw02119/AAAIk1L7C7bbnMyFr7NGoXoP4qqpjWXcYQ912td6byGwlO
         z+N5nTaiBltJQW8b88DV+FXfIx0kahO0+PFZ3zhSrJdwVeDYBGW7syOo7R0WN+EbzaKG
         2nvUkmVNF8UOFW/x6UgD8i+xO+6pRx2apEBHAqnnGTFK49cNmiEcbGbvliQjvVjvL7k6
         L8qjQQ46tOo4JGVaiwQzYty7lPkbppMob+4RBSQIWcKJjNM32rxNnowufcmUS0df0W3r
         Nn6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768386400; x=1768991200;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fA5tFWc06sbtbJJSPWLf+rY1+5q51zBFBkLrZ9oIlz4=;
        b=BnZP5qHq6P7rbxPu7YiITfsAJabPwoHxEyDqjDIeYrqlSeT+kXr8qAnO8T2sV65VMJ
         0vUhkh4+zSRFzjg4u2thHuIa0CAWDhv3e80htDToYPpNzefYQfsAgcs9NAiu7wbCAHIk
         6y0/PxkOPaGhvEY8AJ/k1H5o1uODVlshdO/D6rT59h5fVNvUPxUEEjwmIaOkK+OL3HsX
         I/i4gF+cHrbRVzrFgLB3Aunnz34OmyS25FmgknHSVBrG70P0nLC19ilMaBUygzgJ03ck
         VztSWDTeHwOzceRgO79v8ugv/TwPcKufTBe4lW4sVDY7XRPHIkThvUOlP1VLDm0wdl6i
         Nfzw==
X-Forwarded-Encrypted: i=1; AJvYcCUN5Xixo3Crr5pBfLb2avsgesR3AOfNYolH/LSjIPUqub50sPzCSeh894sjXkLNQuT63bt27dACYcg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjbTXwHMUzIo75zRxQ47fT1InM2BiAigkgoXHlSC8RG89rErBh
	6GzyHv+YCgoo8bEfF8uBODmz2oj6RxT6+9DGgLpDVL9269xqr6fmKeijQ4EU+Nf7nMqa0Tzibhg
	rVFQOXG6O/sRj27ioIRZe7NE6aDJEAyH30Ya3BdHB2pIaqdBpAjWGl7Qv6cGsi4Q=
X-Gm-Gg: AY/fxX4D+998t+SQMAKc1+VRX/qzbDsGVYf7upcvoHO2NpFsngThFXkzFK+nkZ/Cz+J
	8q+3ZJbGXw44qj1M9kkl/GkTK+iQ9TP5ZGx8xxft4SxOlvbXxU10oTaIfd5CGH08Yj1QP8X5F41
	iTyEdu7y/0BmVZNh8RrM3ymlshVklsvZVZ91B9hZLZfvM9Bi6I8wpbz5LomX6XpzJAxZrQ6iyLJ
	HH7gZz+6wVGX9uaER4mhOdB1XLaWvwn4g7QdJ1NBTP0DblVFil2ES3xoNG27xKiZH9FuMLIMKuL
	5Y3+7Am2NAorcLP5conNHgcVsrLhupJqXPmhoGnJIQVijOVLSNjHAvOwa+gSpIaVypfieS53XL9
	mcOrCwArexLA8AS59iPvuXg8qIqLYwyAY4x73Q6/u1IFMQc8LMFjRlkFFyFaclnQqOig=
X-Received: by 2002:a05:622a:520e:b0:501:4ba0:e06a with SMTP id d75a77b69052e-5014ba0e3a8mr6840391cf.8.1768386399678;
        Wed, 14 Jan 2026 02:26:39 -0800 (PST)
X-Received: by 2002:a05:622a:520e:b0:501:4ba0:e06a with SMTP id d75a77b69052e-5014ba0e3a8mr6840271cf.8.1768386399212;
        Wed, 14 Jan 2026 02:26:39 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b9eb402sm22427982a12.15.2026.01.14.02.26.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 02:26:38 -0800 (PST)
Message-ID: <577d547e-6311-49b3-9c74-84797b281447@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 11:26:36 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] remoteproc: qcom_q6v5_wcss: add native ipq9574
 support
To: "Alex G." <mr.nuke.me@gmail.com>, andersson@kernel.org, krzk+dt@kernel.org,
        mturquette@baylibre.com, linux-remoteproc@vger.kernel.org
Cc: mathieu.poirier@linaro.org, robh@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, sboyd@kernel.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
 <14283f23-31cc-4bf8-9762-f0348c30618d@oss.qualcomm.com>
 <4814455.tdWV9SEqCh@nukework.gtech>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4814455.tdWV9SEqCh@nukework.gtech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YPaSCBGx c=1 sm=1 tr=0 ts=69676f60 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=MOnJJczUH92I72-_oswA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA4NSBTYWx0ZWRfX7n3fKN7WtbDz
 Pd9RC/xRcFI1B8oaOXBfMVYmEM4zqDhFHq/QS27aVk/bOmqc+ZJ9gh4lnTvpckDeTYWZyPKloSn
 1LxEshxXrqkj1ESRBbbX1VIUAFNlczs+DhSqJY0pUxOlByycww/uXS6U2fVjDHJb1MS/5RCt704
 fZJhPhazxRA793meDomCf1uzMqzed913bosRy3P+VcK8nNmUsoi9shHCnyPEPqVUAjIVX/qje+O
 jQ5PH4n0iMAz3CFzmRlPN7wJbDOtrd1RKvOhKqtVBysDX/N+rcj6X/e8pu0gqFg7QY6D9ADMeid
 WsKMhW4mmNXIQai5mMsZKHsxZeWQrr6XXeWxCvxB9NlbBd62Ej4kZKOhPGbXNRp3x8hLf6K2CJj
 xE62dqwgCy11lPGxEX7h4cAP+hdMg4DwA+uGoKOFtATs14MM5H6eGJf7DCipYOCs7Y53PxfDqoS
 NZSGcGn6Xrh3AnGOBrg==
X-Proofpoint-GUID: 1vtQ45NSGKzms9lVaSXtWwBGTmmZ3tqJ
X-Proofpoint-ORIG-GUID: 1vtQ45NSGKzms9lVaSXtWwBGTmmZ3tqJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140085

On 1/14/26 4:54 AM, Alex G. wrote:
> On Tuesday, January 13, 2026 8:28:11 AM CST Konrad Dybcio wrote:
>> On 1/9/26 5:33 AM, Alexandru Gagniuc wrote:
>>> Support loading remoteproc firmware on IPQ9574 with the qcom_q6v5_wcss
>>> driver. This firmware is usually used to run ath11k firmware and enable
>>> wifi with chips such as QCN5024.
>>>
>>> When submitting v1, I learned that the firmware can also be loaded by
>>> the trustzone firmware. Since TZ is not shipped with the kernel, it
>>> makes sense to have the option of a native init sequence, as not all
>>> devices come with the latest TZ firmware.
>>>
>>> Qualcomm tries to assure us that the TZ firmware will always do the
>>> right thing (TM), but I am not fully convinced
>>
>> Why else do you think it's there in the firmware? :(
> 
> A more relevant question is, why do some contributors sincerely believe that 
> the TZ initialization of Q6 firmware is not a good idea for their use case?
> 
> To answer your question, I think the TZ initialization is an afterthought of 
> the SoC design. I think it was only after ther the design stage that it was 
> brought up that a remoteproc on AHB has out-of-band access to system memory, 
> which poses security concerns to some customers. I think authentication was 
> implemented in TZ to address that. I also think that in order to prevent clock 
> glitching from bypassing such verification, they had to move the initialization 
> sequence in TZ as well.

I wouldn't exactly call it an afterthought.. Image authentication (as in,
verifying the signature of the ELF) has always been part of TZ, because
doing so in a user-modifiable context would be absolutely nonsensical

qcom_scm_pas_auth_and_reset() which configures and powers up the rproc
has been there for a really long time too (at least since the 2012 SoCs
like MSM8974) and I would guesstimate it's been there for a reason - not
all clocks can or should be accessible from the OS (from a SW standpoint
it would be convenient to have a separate SECURE_CC block where all the
clocks we shouldn't care about are moved, but the HW design makes more
sense as-is, for the most part), plus there is additional access control
hardware on the platform that must be configured from a secure context
(by design) which I assume could be part of this sequence, based on
the specifics of a given SoC

Konrad
