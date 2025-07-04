Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B9629D19
	for <linux-clk@vger.kernel.org>; Fri,  4 Jul 2025 11:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751630002; cv=none; b=UT5Ym0gHRbyEayJaJq05tHNAbQPVzD83luI05+bltz+4gscLnH7wa+c7qi7ud+tunadPeCWUzkp3QKHR6AsqZ5OjVAar2MReCnTkJorX/w45lRZAaLPwVJmeOi2rxjiT6R0/t7jGhc5qc4+29pO4U1tP1dEdUgroMWtpQG9d0iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751630002; c=relaxed/simple;
	bh=MKwHGKOn7w0r1Lf5ecuBq9Tsh0Nc6l+P14YUHUHUuUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RzCBIqtvZi5Vm/5OOEfa6KGDPX1UyuLL+woTc09TmUiSc/ZDUxRnML6GnQyvdy9TwLU4pQwDvYSdUyYBBEdOSy0PuxZoWzV6i3a0qH+uT3i2H885I44pXjvoR+WgHDB37YAkSy5Af6obd9AQ8xqPg3Fea+1dU46SOXa+Bh+ABGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TefrVS3q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TefrVS3q"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56490USY025048
	for <linux-clk@vger.kernel.org>; Fri, 4 Jul 2025 11:53:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HwHQZhuMFY2xGJQ2mbeCbIoXx+TFpyI6+fnNo2wASLk=; b=TefrVS3qNMZjmGf1
	+igIX0RHUwi8Dg9Ttc83GCuTMBQ4WlzeRsB+Dy5v5eLUIO0EKeamAg6QQsB0vmfN
	IU1qBSN5bYIkGnOgHzBooRvGyK0js5LINnBGeJ9gqk8bEWphG0LiC2KP/Z3VEeU7
	kkKevQffExNE63V8u4WkStfgazMzhh/9N0LeY+vXPuwzaIgGqn18JKhoamsrl3Zw
	SfDwmz8J5frsX+4dMio2rl/viBV4AdtRAbx8c+odapzivuqu03Ogm+NwNvBJwvE6
	4x5XuQ+j9sJgGArbsTrGemE6fkMarsxzQacB9gjrMI2rZJ3VBLSMk2W9PBnTrfZ1
	URTlkw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j802bjkg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 04 Jul 2025 11:53:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d3ba561898so19626485a.3
        for <linux-clk@vger.kernel.org>; Fri, 04 Jul 2025 04:53:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751629998; x=1752234798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HwHQZhuMFY2xGJQ2mbeCbIoXx+TFpyI6+fnNo2wASLk=;
        b=llgTYmYT5qxJ6a6nKyujs72fMTySJ/pdAr1w1btI2QA2A27PMID1wi1gIGO6mV4VOp
         PL3iLNFG2zHi+8mOhX9AaOCPLrYjpcEG5BH8eLIOmuHmWBxmbUWQm/AvJKloW3Da77qj
         qQuIVljg6sFrC1qOJDqJFHMUqjlWYTdAxQyBLS7TNwVow1SmU8POfLV6e1FAU0PUD2do
         GNXwjHc9vq2EwwsoMAZ4QjICy02k92zEgWIUFhHGRHPOP7byyLFXASmIXliNcEYRulFs
         ad+YUW1oV06Z/ZfsnRXDhUcQHQy0URo9oBZkfsLEUCnekhihesk14mXMTDft4kKYxskX
         zFoA==
X-Forwarded-Encrypted: i=1; AJvYcCXr4OHLYD3m989nTjzQUs124+XCBD4wbBR/uk9kDUmn/5bHmeQoe8WkLiqfzxXaCT2lbXwx+1ycLeE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCa9ojtpCUVK3OkUCjERYbQcALsA0iuPtkcywVUoAI7FkEslW1
	zpHgQ/+ubXSPitfHc4xEsFPbbXw205agxQ8r5DLBqPONo/aKWI4Wgc3NkjQFUQzNUNz5YnAVrQ/
	4rnbxL4kWdwqxHn8ok6Ef/S/O6ipTgcfkyiMtxtgQZlWPmHa8Mlc6hJD8BEgIXPA=
X-Gm-Gg: ASbGncs7UGaWoNnh14JtVxKmzRnemLDHNjNxHUhNh5VDaaT4rhZtOCsO8Oot/JEyCxd
	mrEn7gPExbTwmB1oYkpVYP1SqBt3an2jGjnHl2ju54+Bnwq9+GW3IzrcYo/1vJXu2Sm7X9Mnfzi
	jzlmV/KOc3DkFmoLlKB2dMfrLB28qFBqa8BGaEdCaE7iQI4T6YrF0fWyorDCMJ7SccshlvPsDoT
	TzNbNaaoQaC8aEc4WE93wACiVwHL33jeznlOOzvX0c6m2cNUNqZ4qv1Gq8yFPFi7h7tTLvOOWTE
	5frOw5oA5ZRa7oVXBAC7bfvZi2IMMogD2aS1hQ7D9w3s6AQTJZMD6bRpNdv2/vt2eJ7W5LFoAt+
	x4EwYAQ==
X-Received: by 2002:a05:620a:170a:b0:7d3:e9b7:7121 with SMTP id af79cd13be357-7d5dcd42af1mr119899485a.12.1751629997970;
        Fri, 04 Jul 2025 04:53:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPlgLXzQaVRDV5W/CN6Yajx9iz9BViPuW1BhPcQXauAwU9MM5dRRtATbVw3ZexdZDIvcZlHA==
X-Received: by 2002:a05:620a:170a:b0:7d3:e9b7:7121 with SMTP id af79cd13be357-7d5dcd42af1mr119897885a.12.1751629997529;
        Fri, 04 Jul 2025 04:53:17 -0700 (PDT)
Received: from [192.168.1.106] (83.9.29.45.neoplus.adsl.tpnet.pl. [83.9.29.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d931csm164525466b.10.2025.07.04.04.53.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 04:53:17 -0700 (PDT)
Message-ID: <c0908ffc-f973-4fe6-9264-cd038b0e5fb5@oss.qualcomm.com>
Date: Fri, 4 Jul 2025 13:53:15 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] clk: qcom: Add Display Clock controller (DISPCC)
 driver for Milos
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250704-sm7635-clocks-v2-0-9e47a7c0d47f@fairphone.com>
 <20250704-sm7635-clocks-v2-7-9e47a7c0d47f@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250704-sm7635-clocks-v2-7-9e47a7c0d47f@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BvxyHuqyE71LZyItgtOHR5ZbruoOZ_5M
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=6867c0ae cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=qmfFy4ndMtQ753Zl/n/b/A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=ygkTYHpWjZnbTFMe8PQA:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: BvxyHuqyE71LZyItgtOHR5ZbruoOZ_5M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA5MCBTYWx0ZWRfX1paGWah4flR7
 F7OAcIq34kzpGsH7pXo2UDPg974ttl2ih2pYpi8jtG5pA/7wcFSURPlye1sjnYTyt15/j35yCJe
 hSHfXOQ+Aak6uTUPvCdp8OHUUqfDV370l8iddtfQ6iSfwOqEtNmST9Z3ahH3IQXR3YmlYFAPZdb
 3VBS71WD1Y5xv6+q9UbM+5VtBgishUyS6jwN/KaIFTzAhPeO7aMAAqjn04ktcZw2hG5kN3mttcE
 uxNIvfvmPUSaI3Y3CLEViw0LkXJDx65FWZtLxmCZo/eNN49F4ldSR1DUG0BPEcPzaHwJnp9+uaK
 UERFNmTmkDqtODC7CZZwXfb3zgStlplY6f+TXSMFWpD66zDa3fhw5TeisfTAh21d1nNL3+LyDTi
 rplp+LY0lr9YMWmj7XrY+SjGAaSnSenaze55UqYcRuBTURFlHwen8bIdf6J32c4Hyx8XfpQw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=961 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040090



On 04-Jul-25 09:16, Luca Weiss wrote:
> Add support for the display clock controller found on Milos (e.g.
> SM7635) based devices.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
