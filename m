Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBA227C150
	for <linux-clk@vger.kernel.org>; Mon, 21 Jul 2025 06:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753079904; cv=none; b=n5jCluucE7xUzEptOmY61UHI7TnCYOcOtl103MOgEx6vdAZKUpY2gnY+W8O3PXKwrDbmFtMCvtZwjBusVjKtT70EKoMgN7n8Jj1agi3GejhLHRCDedsynuwHJ2tji/EViolDlDDsGiEeBhx1RrjxRlmZqHSX0rR5PvCoumUBD+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753079904; c=relaxed/simple;
	bh=ZcoU0TGwdamvkaiI2FBd7ECUaQOwGpBw3EYD+sAv8S0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iS2QIASIusUNpumuJMFhm5ag5zbWSTArMqLliKjF4+u9owFFpORv3AORldkYRyKX5+uhSDwaRXJJL6urlcPdZaSuHlDzvG/OgxJl1pqpeShWOab8yxAxTre7gndcg4rJw6zjJ/7vnwYDLGkLLpDLhgXVWgJZh8K9DyGSb0hQYMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BDRFiugy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BDRFiugy"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56L40h80027797
	for <linux-clk@vger.kernel.org>; Mon, 21 Jul 2025 06:38:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZcoU0TGwdamvkaiI2FBd7ECUaQOwGpBw3EYD+sAv8S0=; b=BDRFiugyrqxv3i3i
	FgVP9TWHbvtVHHPXQ+WMfOkJp6KGmLgOn2C+oThHXkr/ldbeYRzjvW9IVUCvEmZa
	lnWWvYBLovX8LFWkxEeQ6BErK6kSQ51grGvDtRX7bVxeZHm//AqE8gIR2OAt7qEl
	FB1hfvJri+SSVfKjCFWUUbN9/duOdQSzrL3AlCVwAfuMqsZ2aW4qYedStdmbOnYS
	iZPzROKQK9ZjkxbI25hTq4ZjEkH4qksPcgfayRBtEEnWksdDL1Sd1Y4rXubOZYca
	1qmDol+rRgOOt0ZedsfJcCo+9ProMn6lLbsR+0lqEfjI8iirlovbgHEsO/q4XgG1
	rfRt+Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045hbmh2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 21 Jul 2025 06:38:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-234f1acc707so36343965ad.3
        for <linux-clk@vger.kernel.org>; Sun, 20 Jul 2025 23:38:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753079892; x=1753684692;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcoU0TGwdamvkaiI2FBd7ECUaQOwGpBw3EYD+sAv8S0=;
        b=n+Vuc4fSrS1YyTMmfflZbEsEWCXIFws88/xAXLOFQ6V56/QWRuwZ0g7F76KVzFcM0M
         sYRYHYxceu6lB8YSwruy8+zZxFD4eiQ5/QtGBGDxdeU2cyyBrMs+7D/0JU3vRw+V6rMl
         tLgMMqaxZnRqi2MsqYHTh62ibRpp2wxnUZOP7NJ9dcy8JY6R43qcwG2VN8/1qaGuYisU
         FEqoMqR4XA2B+G4+2liHs7sATwzNgOm3amlTQHkb0/8npPKNsX4mYWjp6JWzVBb9u8WV
         Fpw2xDqidrDtQ2D63l9HWIjMbfSIHHmkKWCaDpYWNfsK0/bLmDyLn70J+qI2nl1CRTcH
         YCbQ==
X-Gm-Message-State: AOJu0YxSiBzY/gtE+jNdarG4Rz+C/BgFLb5F/bSIfEjipOQDUwRjR+DV
	A1BxwgIQ0at6n0HqCQ2PZJ3NUw9zx032YIR9dOLqkSUUPujXBvnPbqHIRssHfU67zQ/AmaO+6XJ
	XYBl6m+xu7fu7fLhJY3GDqHQyQ7Rf7vPLYs2BPqFUxNz7h/kCrZSx6OKGi3EbVSBI7s8hIXk=
X-Gm-Gg: ASbGncuU7ukSKUwBjpV/8SXEhSp7L+SZYJkqLxyPj6w213diqe3wQnFEuPc00fYB8lg
	AOzXGhYiF7nLCjTchBMi5+sdTUBGJRZ+KUr+1lKqdgQE1nz7uEGeoEQyg4Bd58uaW2YBQaE7+HH
	eOCUXbIhWNB/eAfj6aQ8WlQwm/H9+W4Gb1k2OA8oXUOXW86Z44I3BYkRRsWbGinmtB24SGKd+gF
	1cSz2SzTWx+JWTLYrG9PJTQUrGZm9+Fz1GEioF3cyF2R14nx6d8DqWRCkl3a1QS/6xfPBz5Uipo
	TJ7GGzs8k2Dk67LfaZqI0PLNvdX65NhPhcDtvsy0bhJYOtZ+TJDc+PadHmuogNoGOkHLdl2UE64
	uVVfOB0qONlHWaSlimQ3Dx+OgjQywnhL6LmyFxwmGat8srHtNInPy
X-Received: by 2002:a17:903:1a85:b0:234:b41e:378f with SMTP id d9443c01a7336-23e256b5f80mr272335695ad.15.1753079892323;
        Sun, 20 Jul 2025 23:38:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJPo/UaVeW+EGlYevcpLuFgKAeIRLV0gRofHorAuBZ0G3Vhe9/bgkD/9w7yL17PZR7jZP6Aw==
X-Received: by 2002:a17:903:1a85:b0:234:b41e:378f with SMTP id d9443c01a7336-23e256b5f80mr272335385ad.15.1753079891894;
        Sun, 20 Jul 2025 23:38:11 -0700 (PDT)
Received: from [10.50.52.170] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6b4de3sm50912045ad.111.2025.07.20.23.38.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Jul 2025 23:38:11 -0700 (PDT)
Message-ID: <ee2f2d91-c18a-44e9-b048-10cab911e65b@oss.qualcomm.com>
Date: Mon, 21 Jul 2025 12:08:06 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Add support for Clock controllers for Glymur
To: Krzysztof Kozlowski <krzk@kernel.org>, sboyd@kernel.org,
        mturquette@baylibre.com, andersson@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_rjendra@quicinc.com,
        taniya.das@oss.qualcomm.com
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
 <bfe8b558-444d-4fa7-9e01-e55aaf48f2d2@kernel.org>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <bfe8b558-444d-4fa7-9e01-e55aaf48f2d2@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZtDtK87G c=1 sm=1 tr=0 ts=687de05c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=8bVFQ3Vb14ZConFL0MkA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDA1NiBTYWx0ZWRfX6DsH/BfMzgqv
 5owALf7Wz/RC2oDtlnrIIi+SV/ywZTZNMLt9PyLlPQgq3/NF7CejmDHOtk88wE9WP9qle3QoxW7
 gRpnUV/XmqFeMXyjSHkucvA7FvxBuVqx6MIySALdpZK8tW7PZt0Jyp2OvOSbjJfVR714WhrWiVU
 l9LZLJM/xx3n9HmWbC0+qbBoWy0NVZgpBEGLaJpOD644UL9UQs30hNiZ2Lxwyvm8WQ360+L2161
 XtMu7wnGakKBVg1oQh8qQWIQy2ObQ4RevkXyo4DR9QF5X3SPPucXLwE512Y496FSIcT8L/rNB1H
 XQPDWQws/oLFu2HGGMr14aHT9XRDdt9R977aLYC/c/i2IQLE+2uo9rRTyWcab+h+6rsaki+Ti/s
 SaIXfffxm1Ka4fCYXsoIg5oSEYFxpjPDLMcJjvruxylx70UVq7oXXGzI04XJRVfV5EQqTCfG
X-Proofpoint-GUID: 1i-ZagYNLswyKUhYqnv4-oVJBJHCTvjL
X-Proofpoint-ORIG-GUID: 1i-ZagYNLswyKUhYqnv4-oVJBJHCTvjL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 suspectscore=0 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507210056

On 7/16/2025 9:42 PM, Krzysztof Kozlowski wrote:
> On 16/07/2025 17:20, Pankaj Patil wrote:
>> Add support for Global clock controller(GCC), TCSR and the RPMH clock
>> controller for the Qualcomm Glymur SoC.
> This is the first time this name appears, so if you do not have
> in-flight board bindings patch with full description please say some
> words here. This will allow the community to understand how this maps to
> other known products, of which 99.9% use model names, not internal
> codenames.
>
> Best regards,
> Krzysztof
Glymur is the next gen compute SoC.
Will update the cover letter in v2
