Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE5F346AD8
	for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 05:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768369381; cv=none; b=NTB8JB0WUyxjE6yddPN/Dh3SJzuLyMtbbpIxkQUTmbNINibYaVbChXnkmK4/MbJIt4mg2B2ynpfD42blVRVkM+zw6uverV211hQ5gIPjZRElFI3se5dqOiW9xvahNVD6UeyF/uB6m1g66heoarmF+al7CYL79ZYl2hXsYy2Uh2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768369381; c=relaxed/simple;
	bh=JJTMFk75Gutd2cMz2WE3Y+uKgBt/r2fjdYpl1po23nc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sna/S5wckmqldgO61qyBIb6R8VrGT0IgKR2ZhJX9Ags2gBLxufcdbnvA1DGQoKCgwbbsAPvm46m8FMsOEIgY6WXdzMsXcwB63xKLc3+EEY1Z0SV/6+Qllw4UAnd79sgTOrF5aerAx9zVEjUKycL6G8nUJPKs0tgYSK+x6A770kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P/o+CV+S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J/6DRws8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P/o+CV+S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J/6DRws8"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E5EVGt2467149
	for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 05:42:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VxdvyYzIZyOHUwmxqd8hJRQXBpXJoAEPCSYU7mtFibg=; b=P/o+CV+Su1NYNCVk
	rrJMjpCGKB97iInfMqhn816TuCnId5jDZQFcrxYKsiKFxXw03Ez6b//ucOJOBacS
	Hrqq85OyN6prLm1FF2bRcqizP7rMPV1bPzy1i00pX3n3XMZI0grqOJa9R8fbkqPQ
	daTqxfG7E+NDbJB07sqxT5b7AfcOSy8zcdJJ2VhFJ57fKp5tgmBt/Or65vec9KrE
	Mvw3x7Hx0yEJWgLPKKQW1tqsZ1EJlMYcRvPHLL7AdeYcg+GShI1PjUzXHFKcykxh
	SW0ape/gZbSZkdIvXdfOnCpG9cHM2SnVJRPd14fsGfZEsOyVSidvAmX3zohKyCxr
	J5gTsA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnw7v9g7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 05:42:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34eff656256so8290696a91.2
        for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 21:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768369372; x=1768974172; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VxdvyYzIZyOHUwmxqd8hJRQXBpXJoAEPCSYU7mtFibg=;
        b=J/6DRws8eWNKJkF0SttomNs8FM7m77MyqPeFJa4nPu7cxfYyjDAR2ZvnWjRZQXi88s
         gYrVMIVV8XvyLChEd+exRu+CJaRhC63sjqxDuVqgYyEjZLAImcU6A6Eet21+9MiWEuAO
         C+QaGYJqZSvQvNnmsWx+DoBg7wxOL13gkL2OurCl+0EtTmRsdTykCWqxizb13XPEMSnW
         kg0jxjJQ82xSqRtSqO/gELBuO2nKLBzRBfoffTXDln/EkWPu30Tl1O2l0DLrEhdt2H5b
         VJPK/ipqzNsIxmshljJSuKoeuW1C5VIGJBLDCpKUvIlZ0cGRU2sFxW2R9+R8R+Ec7jHv
         syXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768369372; x=1768974172;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VxdvyYzIZyOHUwmxqd8hJRQXBpXJoAEPCSYU7mtFibg=;
        b=ZBo6nojqSLCkLIFrFti6fiqxztixraszYGTbyKEjrLIwLrKPiQe/3Ywt5nen5rSNLb
         1dY6Qxl0Wlmsk0HyC0f94uk7GuIsLWfrThexzWn+RpkNcrOyJ5+d3GHerLKjqeKo9IuG
         9nXiEqbuYWyIm7s1r9kotHOfWkNS+44+6xwNTRDkR+UeePxP5Oe0yhqUBIBM9t3LLfaV
         I4czsCqqjh8rPOJt/IqguWlPVw/O0JhpZo/CsiDP45eNQTkwYcufdpgLVFg3D/CuYLfH
         TsOemoV3B27d5Pr7q5hjk5Vq87IUz3YUK5DJyeiCxoB7mvJgr4mgkqcXTEi/wUKVIsb8
         n4TA==
X-Forwarded-Encrypted: i=1; AJvYcCWC4CQZ+wWxOrVcDPxQXzxvx50At/f/XthEJd7QEOdzcqt19p0rBJxQWwzvLhmowmpOEXwnEoe30cc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpxXzc9NpFS8+0PLqMafezP1ZE0UZHf1tdsRfOUujT2Xe0hJTC
	CvOQLhdDl6X9UzVqqorjCl41svGNkCViZZB0flfmxhevuxP5b6R99aIyKxUebOAftXKw3jNnJD2
	E6PHI+50Y90b0dK50ESvw4R1Zszb0cmOQm7TP3FyMfkU7WJ1+edRDb+87bjVCXQM=
X-Gm-Gg: AY/fxX6AOPrnWIjQBlC3uKrmj08mNywY9gaDX3IpU6VxUBtCmkqgwAqjaTEenLQ+abt
	n4mlZ4mHZk3S9xjn2nF5uqktCjhRTMwTPGm//mGoQxVSaCVrLRk+JTQFbO6MF1n5xznFCh91+5J
	JouZ3o+aFmLobpsOFe4XYtg/demrUpoa9eHRdql+2PJyXvjO52DdM/lKYd0kBmukBqGs7cH7Bkc
	KMG8tL65KLAETox3jatu0DwtyYacsGKcBQSNJsI8HRCoo/Rpa6S2rdnrqpgmYRpuVLWqoT3l3db
	VT7yPcEhT0JOIb32lKi6WjnnaeKqQDjFKHs+b+tjHgo4pO6B404rfSIvJbmBiEqzQOTjT2UkqCu
	83zlEmeuFsUn1lUSWc5jIBmdcHRxDnPAGqUF5PNErOIFCGFGM
X-Received: by 2002:a17:90b:3806:b0:34c:75d1:6f90 with SMTP id 98e67ed59e1d1-35109129c2bmr1728005a91.17.1768369372426;
        Tue, 13 Jan 2026 21:42:52 -0800 (PST)
X-Received: by 2002:a17:90b:3806:b0:34c:75d1:6f90 with SMTP id 98e67ed59e1d1-35109129c2bmr1727981a91.17.1768369371938;
        Tue, 13 Jan 2026 21:42:51 -0800 (PST)
Received: from [10.151.36.141] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35109c78f20sm784491a91.13.2026.01.13.21.42.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 21:42:51 -0800 (PST)
Message-ID: <cfa31127-2208-4c65-b8ef-3b5d534e050b@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 11:12:45 +0530
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
        mturquette@baylibre.com, linux-remoteproc@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: mathieu.poirier@linaro.org, robh@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, sboyd@kernel.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
 <14283f23-31cc-4bf8-9762-f0348c30618d@oss.qualcomm.com>
 <4814455.tdWV9SEqCh@nukework.gtech>
Content-Language: en-US
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
In-Reply-To: <4814455.tdWV9SEqCh@nukework.gtech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA0MSBTYWx0ZWRfXyEfLyxJ/A/sI
 lp8ZH8IWPBQKPDWIToFX8PUiSm0jIJdIIYQVeBo9Ynr5ebzLqYbjWHGWBZuZyWLQxQMhQa+5dLc
 +Z747HKvMbqRvVnDmrcFanZ3PZ5Ego2CppD5j6q8RVbS+FzjE2jVQElz7ym7OxB1kKRckWzWpCD
 yH2jCPY12VEPBHiYevylkOtlH6QfBnfJrL+K5APe8DjP2ad4QM24CBIzkfd/QHoh4gnB++FoSM8
 4GfyTpq4ITXaMg6BPx1JvLaQWn4XNnv5c4VSNNaa+vfQb649gP55MdYBhIbFfnK/4zWV08NrYhV
 jx75sDdMChVd8bK5sxJARA2YoPKiCSW6Muru6geFPwBo0C1w+3h2E4irz/Y41gs0dey78eque4+
 lHOjSWUspWlz1jXhJPljW0hdhzoTKiT2raUm73wG0Wi5T012UfTELQWCCcAosTnF3ayQcZkkbp+
 zCRhd5IrsRcy6kJMKvw==
X-Authority-Analysis: v=2.4 cv=PJ0COPqC c=1 sm=1 tr=0 ts=69672cdd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=MOnJJczUH92I72-_oswA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: nerKgfUB8aF1ZmYird_YWLp_TTs8qTqS
X-Proofpoint-ORIG-GUID: nerKgfUB8aF1ZmYird_YWLp_TTs8qTqS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140041



On 1/14/2026 9:24 AM, Alex G. wrote:
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

Exactly, the TZ interface is present to address the security concerns.
Also, as I mentioned in [1], on some platforms, TZ might access protect the clocks
and registers which might prevent the remoteproc bringup and throw an access
violation.

We can keep this support added for IPQ9574, as it is good to have, but can we
keep the default compatible in ipq9574 DTSI to use the TZ interface, which has
already picked up an R-b in this series [2].


[1] https://lore.kernel.org/linux-remoteproc/21468f66-56df-43ea-99c2-7257d8d6bb7c@oss.qualcomm.com/T/#m688033ab79c63a8953e38f5575d1c0ff6b37b13a
[2] https://lore.kernel.org/linux-remoteproc/20260113092021.1887980-1-varadarajan.narayanan@oss.qualcomm.com/T/#t

> 
> Alex
> 
> 
> 
> 
> 
> 

