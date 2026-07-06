Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F541416104
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 13:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342873; cv=none; b=eg9fpY3bhEufpIpiqecWxBws0mc5DI0H0Aw2qwVeZT1LNMibkZ/2a7GN7d9nK085z4w/4dXFSRALr/ABV43qhThrHbfITU83JAFlzANlTvv/vrfYfxOml+QPrkaXy7evQVJp/xQfSc5vLgWTCnDuZWP/d1vVH2Rstd9XzIp1U20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342873; c=relaxed/simple;
	bh=gIulxm52U2pGH7kvolaopSeoZ7amTnOimNMWFMqAX/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nVN5hM3cALD5SwEBs4pd+C7WzAROOs71YR39S0u5BUZ5TEHoX1vj1lRjTjZ2wQmB9nuRgiNlfcpfSO+4NUceTEcGzhrcj729a7OIVYmHn/N3UInXAylw1ZxxiZlRmBEU5cGCaHWFs83qa/ebLFLYuOPKnYEoYXab4naZPSeR5y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pVuAKBEs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mx3WKTkV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pVuAKBEs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mx3WKTkV"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxR0p402161
	for <linux-clk@vger.kernel.org>; Mon, 6 Jul 2026 13:01:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PezbwLVx7HKugLssnJ1SOWYpFaEJMSvORVOhtdlHNpE=; b=pVuAKBEsXh9VJCHv
	ATzGsSA6zapipBOe4XLjPWRJjFlkUy236PEPtQo6HJlZKeAWq9yXmKNLI/IJmjkc
	faXxxc2y9wSvzBdHF49kk/shCzNMb9anqzGynlyL3WcZ9WpKCOUAAjFsMENFUeIG
	fFDrOMBjSadfLBiNx5YnDbQvlwQ6xkSEOHgiYTQJQ+91++IdoYzMuQHWjAa+Hjjr
	lY4ulTkLgSbFPSPtju8t/leMk9HGjqUh+3HExQqURoBL0+Y1B6rVekyzRwZElX3E
	e4FlXqmYn8vvng3SNjil6fWu8VdArxdgMLtLRYMZboqX9A7DXzr3MtjItH4wpCnZ
	1RC88Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3grp3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 13:01:11 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-738be9df36fso72191137.1
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 06:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783342870; x=1783947670; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PezbwLVx7HKugLssnJ1SOWYpFaEJMSvORVOhtdlHNpE=;
        b=Mx3WKTkVoi4Tq5CLTb3ImxX4xJElYYpbIkgBVwfJ0UKIq9BewT/zKwCMnw6gAgdQgM
         TCPk2PHUIn7GTVzBbxAr0Qrih7ZK5l81v8/84i9oc0cgxjWVIpT/2xXkb3z+mjPHbrdZ
         ENxBtoCdimf+hr6eENAUrKrIyOW0WeFbPhivjPKabG1dtIfYmBjqS2AgAm9n0vAk3bM5
         +cUcpqp52SAbyYXBJbMsxK1D3BMW/00pd6N8mH3/r78KToucPIcNyVtyUZx3kw+wKJiN
         Itglmn31brIem1o72epL9qRo95r2SINFCcz18FfIs9cx/XIuLX1KM+CRe/CJbh3aPCHz
         eTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783342870; x=1783947670;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PezbwLVx7HKugLssnJ1SOWYpFaEJMSvORVOhtdlHNpE=;
        b=V9TMTHnPb5CjxYJZdNqlo5lDOrMNwgDoR31KQLnO74Q4Qt2yERPhHXG+PFmsheECJX
         IB1QSqMq2yW6FLKwmYpnHNgMryD4rFG4hz+Ec8+eoP/X0zbONxctPr3LouImLh+IyQPg
         39r0kV8zNO4x0L+5AawWTDI1quaKBkJoMD3PXxVrlPI1IuprHmUqVuFwbs+re/cwmIX6
         YIdPrZnX1LthR+1EX+4hIbFtgdE8G3aHS2nh0qgDUX5AUVPXMIvwUTdjixmtKYqNRT5u
         pxCwwyiv/0cgOx1p23MI8vlfsIjUmIjC2cXqay0TNZOwmpvEbNs9evfVqS4ceKPDhAZB
         mF6w==
X-Forwarded-Encrypted: i=1; AHgh+RrSAHrgzbHmkYAvYRVfBkNkwCVrdoHijmJvmdC3P/HBeyLdymu9v79DdwbzQeY/eGncB7YiSsF1bDM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9aAYdVvvJo4eu3qFVmykhAmer1MLwGNrXnVUj+VtWGGP1TIwc
	AUfuHFX/XFA0dTkDTVHeCpj5ES8+NYv36u6cS44naIkgebqt2PvP4y4qlByDElw5LSRD/Z21o0k
	Ds908dltnWZy6E83vsgTO1vf65RNECGJxuZxhDsjkJrSKNxwygqH+3UfRzmwrQrA=
X-Gm-Gg: AfdE7clThv9iWAHEZa5cIm8dGs3OaKNvKWUPoQ13iiNVjjhvgQOxP4NN/ZYDERVI1N/
	GLG6B/YxaZt3I41B4Op8s5fJUKcUb5FgMkDgT25t6BRQa9yv37seLjbltkFCPuQxZmYD/HPnr8y
	5MHls7txIjV/KjQQh+Ycy4m3KXJM6bVHTOoHGciGIieWNa+QrgbV7o9XivrOYCLfF2345797Do/
	8OAXeMrQilfMpv2cGSG42tUsq/fLYtiejyrqKFKe7iZU+X6Ka3+7YWxKcd9aqieIDn+vS8IlUSz
	EQ0+KiDhbuFl18KH11YkwjrLxdmc7pNEESnNDQ6tjhCcn3ERawqCzIintG3Quwlfm6IBLMfs+Qw
	YPCh7XsAcLmoNWWWbJh/sE9hzTyHmXl/3UIY=
X-Received: by 2002:a05:6102:e13:b0:631:b312:a2a6 with SMTP id ada2fe7eead31-741e881e5b9mr1283855137.0.1783342870343;
        Mon, 06 Jul 2026 06:01:10 -0700 (PDT)
X-Received: by 2002:a05:6102:e13:b0:631:b312:a2a6 with SMTP id ada2fe7eead31-741e881e5b9mr1283786137.0.1783342869189;
        Mon, 06 Jul 2026 06:01:09 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d9e701sm4282774a12.21.2026.07.06.06.01.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:01:08 -0700 (PDT)
Message-ID: <bb789efe-efbf-4212-934d-a02913dbbdcf@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 15:01:05 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/19] clk: qcom: gcc-qcm2290: Keep the critical clocks
 always-on from probe
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-1-cc13826d4d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-1-cc13826d4d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nslmuyE9MnyEPvP2lxbxOSOJaDsnce-a
X-Proofpoint-ORIG-GUID: nslmuyE9MnyEPvP2lxbxOSOJaDsnce-a
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4ba717 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=IyfWUWnWmjsiacPjz4MA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzMiBTYWx0ZWRfX32rZlnzx+r3I
 czkrTgHyt0vuW2CLPLbb/wOUbLlB/HWSf8HA9ZQ2KrO9Za41c2ZC8TGNEXAYCDCpJX2niSXYEAU
 yt5VPV0KN1nrVi3dtyPSNVBLLBV1HYCCOYsj5Jb9bDh/sdKoQ794WtXC1lryuNbiwRsmA7/aR2i
 GDyyCTER9vOhw7TZMX8a3LaTcIn9DrkJYCk2OBR+IGOo8nXbYRLQaFVXveH7Ev+FJbh2RszDbt5
 VKRvRZXaA8B4gy2wmPBqU6c0joHTTXCZJ2Ps6oxHmGK1JgTGvm9OmtxleKzyrKGCzXYfRh+nLtn
 99XpvNyS3ImvBuveMSasHRRW0X3y9LUZgv/W19lzw8xBzenAJeLbN4FxHTNTERIznJmxGoDvB/y
 mOlN0y00AcxpgIuU/aBHY7d6IqCPvSZk3KOV8HDw8TCRRyspvZRd3emZcM3NmZu6Av3pHsv0A83
 2APfB+dwoqo0r69DUng==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzMiBTYWx0ZWRfX1WxHFSaCCkfd
 A04ZL0lJmAhrC3q8x9HtVDZO2s7p6UGHQoW5hmKc81QjpUSX5k/+svnEbq6nOaeAVRYW7jFM03v
 SMPekrxU9ksw0O4QwEu+nEWezPfOzJs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060132

On 7/2/26 8:31 PM, Imran Shaik wrote:
> Some GCC branch clocks are required to be kept always-on due to the
> hardware requirements. Drop the modelling of those always-on QCM2290 GCC
> clocks and use the latest .clk_cbcr convention to keep them enabled from
> probe.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
 
Konrad
