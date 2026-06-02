Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E9B2D7DEA
	for <linux-clk@vger.kernel.org>; Tue,  2 Jun 2026 05:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780376902; cv=none; b=pO5WG2zvDLOL13H3ahY3Y/VWvletBK1PrwX9BIoYy8uhjJHLMNKpdu1dVndBZXOQaJuaxAL5bYxkQWA9Ao8fdpCm1mQNyCL7WguRCJ8ibJcYTPVH0zLqYJAlyWDFPLpHknbcWbra8/s083PBrV3NKRsGcAH5UsiLYiYI3Yh/c+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780376902; c=relaxed/simple;
	bh=eKrV9zh3ZaEeey6RkTXbrqYYTtUHHVzupxgukWOVzzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vu3Dy4lEbQguAZRtsdStCAKQIMpXVVx/fTD6E9QcF5qOodvkZ5I2OK00q3WIwsQPB7l4nk1TqlgpqmkhVLqMSuRwz39QqPKqgnZeuW6PipTzEpTYRljgldOamjEOuuc2enyi6/15fPt9m0IcF1USp4WE2oMJdOblIXabj0/R1HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ix1Mp1wc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dm8PyLq+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ix1Mp1wc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dm8PyLq+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65245hwM2691980
	for <linux-clk@vger.kernel.org>; Tue, 2 Jun 2026 05:08:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d28Ha3EmmAL2GsQgsnbMUilRRMObNSU7bvAQPZBuHJc=; b=ix1Mp1wciowqktCM
	xHPoN72mcv1sscgpxCjYMLKg4xoVjKXqCDaqopi5lXjBXK5IT/rNRUnDAWBqfFTc
	lFubJkU1LXLNQ0coUdPtRUrR32PS0JhVBcEmc0XeH+XyvXI4joXWVjqvCJ688/pj
	jNVuF3F5vpQkmydOBqGHSc9eXhbIxg6UnC9QRA51i2QPS+p6v1awZ01O7/VuCJTC
	UiLtuOejH+hWI6XKgFEYiv63wcWUG5AY+spdQy6BD9R7kDXKnA8SOWNAByR5UTDL
	hM82tWCnsKWI1oTkP2Rw5UpRwq7vTHtHwOD0h2vMvp0ScjjqI3X5awv6W57kqgtm
	JCHSOw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehqumg6ac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 02 Jun 2026 05:08:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf11699875so52697175ad.1
        for <linux-clk@vger.kernel.org>; Mon, 01 Jun 2026 22:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780376900; x=1780981700; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d28Ha3EmmAL2GsQgsnbMUilRRMObNSU7bvAQPZBuHJc=;
        b=Dm8PyLq+G1drJo1GBWNGbJhes+Y85PTZfnp9AYdUsfL5RelpHayiDtxViDJALJdFFG
         zemqizjTX17SzCtu7nKcmoyscbQvrQXn6a03OflA+/o1adaCVUJvYKNG49VxTtSkiqZ6
         GZmLY/h9fFTiazGCG4EbFDtT9ZCrw0H9Ziw4klrERO+ApG/m12nwAPecB7MFabYwIKyZ
         sq9aEUCIlzBoUjD7Ven9F9HSmM4Eu497Bl5ycpvCWtLv0XFcxt5kPbp//+0WD0hX1+r3
         XA6+4NyB6zLQ92Wbv0ahDaMq/zgv45p/znuuObLbFOXQMZR1xCgwrOBRoslwcK7gvQ0m
         CFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780376900; x=1780981700;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d28Ha3EmmAL2GsQgsnbMUilRRMObNSU7bvAQPZBuHJc=;
        b=DSXftbjyylfa6J9vvPuL+KbedtN9HxO+m96DyQ4gBG+XqL2NVwJe17gjhbwpPwBVNr
         TighJfPdBSKucjzwPFVdx0iEcu2lIEoVNLMGEmVPnWCw817Q++EJB2mdzbgpW5ZU9wAc
         dvzeSUDg4lf4ti2POAoIXqBpZlsXiDDTdf+r9+khFhLKqTHc9SzE16S9kPeAeEvrqh3e
         cVb53EpeyYQBxzKDK4gVPSxRMNx7ePYKV9mn0dUa+A4qcBC0V0N++IvczdlPWqH3TXBe
         Lv375H1n8OMsYAVxstOWSDx0yg3bY/hbjNsmn6IIYN7BXQbd0zd+khv7YmAawv5C2qkI
         WcSw==
X-Forwarded-Encrypted: i=1; AFNElJ9CllN0z2kVB1Bv4+owsy2PJ+rcUPzArSwiyZX4D91b/J6ASe0lvJDgnD/Jt7Kpr4tq9z6RyLnt/Og=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCfs1xY1w+7UNOpLnAiBYwIMUjE6f6QfIPVY0xycINeDjIoSQO
	PxphVQmlKp1TDuJX2CbC5Xs6vJplfpYooztFoPNP/sHtP8c450b1GnD4/SeuS5s40KDxeyaAz8q
	yNu5daUlFx7QW7GWCzhg7BYoYwDsvhkdypD6vtCbEfq1yEYidT2VFl7OG1TUyYm8=
X-Gm-Gg: Acq92OF32WOghXFE+dyz+8nXgzkDmSMq4U44TjHMHSVBz8V0Dc46uvBUwIGq+XA39OL
	ciecYtnxTaOjbXnoEhWFXXqpcXyoLHk9G5uDmE31syFJS5rb2SUFqZQ4WspbGH34HZebG7sNGbc
	3C0ZwlMCyjIcScfOVAu49fGfwCESDWhJNfLMkGWqcPmrxmYxYs8GJ+jz7ytepl45LhjGF/PfAYi
	ghTseN5Mti8+zZcNxN5kp6+I8IKYutWmRrBo1yVMMNGYqVT/0WqVfAYWF0wJ1Pntaw7e8pZY6eS
	hCT/guDEAFkcTM3DPvsT9crolW1qG7CsJPjbOzVSi4ARaooLYlWizkg0YT0o+MzRhBMl1NuJuM7
	nzBEIqwqjlJeW4YnVMV2v5Qrwb/d29Yj7ZgF2IzMcHKoZ/CmkDb6xkarkpsYQI+GrBVjt/nugha
	f9
X-Received: by 2002:a17:902:ea04:b0:2bf:22f6:6acc with SMTP id d9443c01a7336-2c10cc0de7bmr21836675ad.6.1780376899848;
        Mon, 01 Jun 2026 22:08:19 -0700 (PDT)
X-Received: by 2002:a17:902:ea04:b0:2bf:22f6:6acc with SMTP id d9443c01a7336-2c10cc0de7bmr21836405ad.6.1780376899365;
        Mon, 01 Jun 2026 22:08:19 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e700csm156004175ad.10.2026.06.01.22.08.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 22:08:18 -0700 (PDT)
Message-ID: <e9d687f4-0280-469c-8729-cb4ded09dd84@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 10:38:12 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Enable icc-clk support for Qualcomm IPQ9650
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260519-ipq9650_icc-v1-0-4d3554c94257@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260519-ipq9650_icc-v1-0-4d3554c94257@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA0NCBTYWx0ZWRfX/VZcnhc3RZGW
 Ph+X2gxAb7motTP7XE1K6D9Yt6AFt6F5/CQwN/o2iJXMvNNf+/ygB/u5WJhklccJQcZQMjC/9eq
 55dowAMbp6XkG9tKItfXiCoH5LF2QPPYYW9RGP+cKbjSU3gcaBiyLVnmYbcdQ87uuTh2HxcutUf
 2zO1khvYGDgcZ9OMJPEYtisnzj2ebdfBQiEquPcSklQ27hRo+7h9cKhjMIBpKIvXN1U/uH/dD0G
 1Au0MmYiOnOCJ4wzP2dqcuZzfkjLEnZrqh5jmzhPTi0QjA3z/EOue1izmPPcri09oMbohmUJBri
 ssphT49ChR8Av24aB2HrqYioq5rtMeZY+ZuxCMXeY0TseUlPEcJQcm8GgdSUqYBwHm+vOv/nDIX
 gtlcBQAg0kMQUCytx4n4BJDdAhMCF0sjcWE/Vp0Is5AGCsmZomAKWVAZvfU+YaXFU+igNy5ofQ1
 6NKhUYR6VTiyNk16lSQ==
X-Proofpoint-ORIG-GUID: frb9Pd62kbs9rMBma9Ze5bWXgj-nmyk5
X-Proofpoint-GUID: frb9Pd62kbs9rMBma9Ze5bWXgj-nmyk5
X-Authority-Analysis: v=2.4 cv=Rrv16imK c=1 sm=1 tr=0 ts=6a1e6544 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=WYATWo6mIzdYKek3wXMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020044


On 5/19/2026 2:17 PM, Kathiravan Thirumoorthy wrote:
> Add the master and slave interconnect IDs for the PCIe and USB
> peripherals and enable them in the GCC driver for the peripheral
> enablement.
>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Kathiravan Thirumoorthy (3):
>        dt-bindings: interconnect: Add Qualcomm IPQ9650 support
>        clk: qcom: ipq9650: Use icc-clk for enabling NoC related clocks
>        arm64: dts: qcom: ipq9650: add interconnect-cells to GCC node

Bjorn, Gentle ping... Can this be picked up for v7.2?

