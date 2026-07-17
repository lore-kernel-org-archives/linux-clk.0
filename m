Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811BF32E743
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 08:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784278102; cv=none; b=nE/4HSBve+kk8I8ihXWgqJmTXR8yg0phtw1oRkHMtJamOjcegx/T8fqV/oAsuCTGBr44rnkfheacZKDwe2VvrFjXhhUz86UGvSWUsAqtzXj5is/gqaL3bPhW6LW7hu3LcSI/kje9GWtcPgm46PR5GbhnGAQRNR5V54nZAlBe7IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784278102; c=relaxed/simple;
	bh=OXTvYuIrTYj2yqcMWQ+UUH5JKGO7YAhoI+uJlb6ojO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aUG2/y2RaHfp6bzXpnc53VgS5GHAr8/dJwbkAufMt1wO3cqOsiW3CBeppW8It5jFPsJbS4144GLGnlyVkreI+HRlu25PBgp106sXGXZzDQ5NXo8JG1W0FVBb9ASIajG5fA8pJXlDBGPh28t5YnaTWFfr9EQYvxj0TccrYLdHYPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mwf6N+gD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f8pGU93b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mwf6N+gD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f8pGU93b"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cIDm1065472
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 08:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qafs3q2lCEGe0hturJ5yo5oxGn5+x5N+Xp4+Yu5D8aI=; b=Mwf6N+gDqmQeB+MF
	gCIffkZmamCU3vQtthCcJufKjkarHk4uyCo1FU1fc9udEyjN6sbrITXYO+6lV1mA
	s8UdZutvCLSKuQV/KkwIuU4D9MuOy0kno9pp2O2E0TLOLdRVFRmLsHNLLgtCRlBR
	MT7PAEAA7dgisrmr37yyV5yhfjcYz1cZXYP41v1PHVz0M3Yzzz+fUkF7kd3cp+7e
	B7N3nd3DSomfuxNYisLAxmYHmIrccR7OwRDgvxJR4L/OGIiSQG6NwNxEq3MOjVT8
	QXHvRElMJmiT0q0vvDrl/0EOymu+WOMTawFDl4qdgKfH97Fwo3HaeEfdE1zTWAU3
	THaXNg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffbquh8n6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 08:48:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930b81c13b0so3154185a.0
        for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 01:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784278099; x=1784882899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qafs3q2lCEGe0hturJ5yo5oxGn5+x5N+Xp4+Yu5D8aI=;
        b=f8pGU93bgm6Oxl/TdYFoRkD67hWa7TJLC9dg+erYYnqSB6p6VMoquU4qDywd20DbVv
         RPzmWhxlu6+Jzuz0KYln3VGPfR12PGv11mhBQryjkIKd7EMWW4h41gIwPqs8Q1JC+7H1
         MAqD/iwroXXXk+BPbkaWUEO5Y2ETNckwlJrGWLOyUbgliU8BxLtL1n7kRSkN0Ls8/6Vq
         TY12pRofbm+BJ7WEPUcPd6gv5A3iinByitFkkWMKVhlqNTCi0GLugfFVLgZAlzJn1W+B
         83+mKqrdeLUth4VzU7q6g6dRJKxG44t5NQkNhYt/j4C4cUYjQU6INxHf9Q76OY4smeIi
         KudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784278099; x=1784882899;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qafs3q2lCEGe0hturJ5yo5oxGn5+x5N+Xp4+Yu5D8aI=;
        b=CPabOaPDFtaSFN2Vhw9WBFlACLnHBsLypaSgoQ7QG1agPODNRi3SDGHLiMg1NNaGLQ
         P/g0ANEH69dg5HPX+V79Oaiq9MTM3tHJI+49THyNeLhiBoJzcY4RHZyvQO390Mqb4aN9
         Xys0UzGR0b5ci1F6gUq0YyOxsj1p5AprLCqT66EOFHqjm8a9zwYES0ZMA/chpe/Gcbhc
         jxMW6+fpqIbQFSf3SKam3zHM75VvrSXu4Gls/1Mk7gKlxM4QUsHDCG2G24kytQQpxpW2
         qSs59abcdKT7ruqLeipzS3D6B+0mk7Z16yPzjG+kIYBdlm7bvGmDgcspoTWvbq3ZE5CU
         5dCg==
X-Forwarded-Encrypted: i=1; AHgh+Ro5wu9M1JHYrSmefcvUPxS8jK9HCvb1D4gQjgYSiBzZvzZFIG5gaeBHHVmW+7IeMCOK6uz9X6MFZnE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoeyXTGjRGbGcmwY/Ze7nLRmiLigxQQFcsV4/MySPvcB8PsUv/
	iQS85j3pp4/A2fxUdEFKeCzg2rFY4LaIcRP3/Ao//rAhix/dnt2RibDAeBcbE9NRsHXwpiTh2mh
	lHD+pgn5uXhOOuyF96wyn5TZlLUC4gpfCq1YKY0pbAwftx0a/mAhrByvzfk+DTZM=
X-Gm-Gg: AfdE7clgoF7PPvf/JepMkOjzRZiLZl6h7JK7ROJ7wKJUe078L8Hk2hC295JJoWr9kYK
	zyk+o0beG3q9a4ab4OJ3H4rx64SpL5rn5dZopSVTax/F/uofFqiSLYY5kHon36C+koCTte0oNxf
	NWhwqn+toU5yG1Z+ZhnNpFqqqUgekKbkSai/iVlaoQ2dmjRd+WNFRA+Dj5pNDCtYnHhvxJzA3MB
	UXKlbIfFU66/dKBpKn1xdjYFhRvuhWLVoBxa4ZZR9WYDvFK9gGkF77nu259Fwv3gZLcl+6y64yQ
	3t8Uy3LvorxG88VJPzIMI3PhjmOV/kXo13lSLfNWvwsIm/1b7PRjKQF1LKQI3/ACP4vUeIJEmoj
	5D40YJcOS+NIK3fLaEbNggmj/
X-Received: by 2002:a05:620a:19a2:b0:92e:5023:78b with SMTP id af79cd13be357-930b41ce6admr140720085a.5.1784278098865;
        Fri, 17 Jul 2026 01:48:18 -0700 (PDT)
X-Received: by 2002:a05:620a:19a2:b0:92e:5023:78b with SMTP id af79cd13be357-930b41ce6admr140718785a.5.1784278098500;
        Fri, 17 Jul 2026 01:48:18 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6fee321dsm330199a12.6.2026.07.17.01.48.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 01:48:17 -0700 (PDT)
Message-ID: <627d9c30-5b6f-4634-92ef-5d70d3843102@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:48:13 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-shikra: Add additional frequencies for
 EMAC RGMII clocks
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260717-b4-shikra-gcc-emac-freqs-v1-1-110966417ac6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260717-b4-shikra-gcc-emac-freqs-v1-1-110966417ac6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mI0n1lOGHKRH8jPhQJpVZU9FmRNXRYdj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NyBTYWx0ZWRfX0aARzTOFAKh6
 F/qsTW0SGeCBUm9PNd+LizOvFtgX/F4ZmNjHUGxVDHB9K18IsbPM/u0wh6iaL9DLzYouD4wnkok
 FN1oCOf50dezhIYrCOG0WyrFy7E7uau9axm1qmRpkmT2qlOmUXGDbu6rhlIDHEeQMxLcMb8Njgv
 kW25LMLe270+eVvv54C+wHez9nIgDolKs13QYPBMn1QtgaVynp+eK2rSzWPgmJYVEEQ6BcVg80D
 FWgZ+z6J9ToX57Q8Qmgnfw1W+1RqwzKiB1XnmIuJlNqWlCoEqVfOSoBGDXdFMz4zHqjXemH+c4Y
 sXnXRxKlwYwht8RSoaQwPFCwABPtlyxtB+Ph/a+9KsTQUcpVN015LwkAYikdB8Tq5JhIFphPN+F
 Oj+8P0NRDDRlzFddOt7g0BN+V8QASM3SUgcBBiREE1u9/dUw/+F41CVtDLr7AsqrapcKd9k+NbF
 AXXuYeqi/a9FahIkLJg==
X-Authority-Analysis: v=2.4 cv=NZ3WEWD4 c=1 sm=1 tr=0 ts=6a59ec53 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=qRxF3_AoLalPgMY6OWsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: mI0n1lOGHKRH8jPhQJpVZU9FmRNXRYdj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NyBTYWx0ZWRfXxhH1smGAgWTJ
 M2lWkYKg/yyPuGXy3111J5XTI2jIlw/IxNwq/ENzA42JdL4KfsN8QI5cxfRVllv+2uRNDu+I0j+
 G/kazSWTELFCMtc1y1pYsWzf1piXitA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170087

On 7/17/26 6:03 AM, Imran Shaik wrote:
> Add support for additional GCC EMAC RGMII clock frequencies (2.5MHz and
> 25MHz) required for the EMAC use-cases on Qualcomm Shikra SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

It'd be useful to mention that they're necessary for 10M and 100M
speeds respectively

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

