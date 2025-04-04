Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC62188580
	for <linux-clk@vger.kernel.org>; Fri,  4 Apr 2025 23:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743807773; cv=none; b=BB1TvHwaXh7eBn/rEfBj7yz7Smxm5B48QDKYPQ5AeIw/Q3FTJPKDcgwCIwQ3uwjlYMOWYmPSnO1Z5yfr2l2cnZ2sr8QsFITJv08fOIOdpboWPljymTRSuRJD4QRshl+c0da6ghzFLL9znOeT/aPdpxpwzKEuYSxFv1DFJQpD7OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743807773; c=relaxed/simple;
	bh=/dlzUhzNunhYTNbApKqVE/hjFYpfPkh5ExgCEoMWEzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ujnnLDHK4fE1pcCLXTWWIMwrKyd9JiND47Ln1vc1UkEuqt8N+9y5CGAvm6MMYwekBJERYyDWJWEEf3qTVXW7RnVLXstAbfjO4eFl/ilsHpepxVqYedtAXsWvkBaycNv86IwOuTEoYC0fBzl16bS3saPCWliQV8PSE+2GpP5pq9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gIaWJqp0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gIaWJqp0"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534JEZYk005643
	for <linux-clk@vger.kernel.org>; Fri, 4 Apr 2025 23:02:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LRA9/KTy8C2+7jeNa+M/5I1PVMUdhFQewhL8s+SLN4U=; b=gIaWJqp0+ubKz00p
	aNh+FjNpK6qhmfW0Do0djfTk17b2h9FJpvj/sN6wayZcBAW3taPyPJUC23+u89Wg
	0je86u2HdiYNBTY3Vj7CrihcB/K6sIZpBLENrmeKjAMQ/sZvQXilZfwhMjQatGNX
	yW5zl8QmGAMoj3tAohfivL6dMN3lCBno957RvhNSHJrqsPqmb5z+A7N/4SJ+OyD6
	kfrnKwtAJQ4CwNQZuJj147yVdbaDXZrxwVPa3/OphKm+rGsCMH36IaRecAVZUJY8
	O1TCwqiwv20tqFGUhKdOiybn0IYae7Kzoeiujl85uxUdMBksgghI431GOcF7ehqg
	qHEZsw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2d534fs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 04 Apr 2025 23:02:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5841ae28eso70215985a.1
        for <linux-clk@vger.kernel.org>; Fri, 04 Apr 2025 16:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743807770; x=1744412570;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LRA9/KTy8C2+7jeNa+M/5I1PVMUdhFQewhL8s+SLN4U=;
        b=s6h2WN8xWXjZe7lYWVEA2AJXKQcVLjV2P2HBvb53iKW8xMoostvdSMrGbubs9FPqQD
         QJzQk8TyXVyf4BnYzRmahDsmkYSxsm/nVTliNzMdlgqaCpHPYLuL4izxl64u6ao4j49z
         27oiVrPBNqmRBugFOhs9EBuXGSw6XGMMmHqr9Mc8wR3FfmnZ5DPN4WbmiE98cSU7t+Ip
         a5Lw2+z0+zVeslK5DANZi1ODHSgBT49rhOQzcwKiZ1WG2QtpG8Kl3sa5vnMhIMBDGLc0
         kxSwxomaMaAynPTyNWTXZx1OlmN58HgbaRIhepq7iBGOGtFD1185sl0uHCM4ti9+4cFV
         j+nw==
X-Forwarded-Encrypted: i=1; AJvYcCWJ+g+Z/k5FB2jUe6n/0WYgBD3YF5A4x/FeoIzQp/nyd+71/WN+h7PieiHew9e1BcqqVX0kQMNEoMw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEOrbYN1Hk7HjcC88f+zHCqfxoXGs0YNbg6mWR5MpjDiGlrnsi
	0IEZhHg1dRrfbVJ4kCNzSadl2D+O8OxeVIyepd/8qvZFz1xEmPc0ml9PxtZ8xJsQ9pgKGEPEpOW
	LdJZoOIH4OeN1nycTPxMvKhAgwHrfOF/p6w4VUQhSMcRnbMwGr0DBssbbRv0=
X-Gm-Gg: ASbGncuM9tWDFV1lCYEaps9aXgjb2Ry8kb5pEZG778I/PYTjstKS6g+N3yHzK8UzQTp
	XKCuvdd8nbjcBR6LQQJZq1GTQAT59fKQvOlwQkHprNkKXUC9Snxbzb/p7By8jHr1um0IRJtOuDR
	2+iixLLMHZuJGmuVgc/kUOofEnlhldM5Q1t3r9Zm5keyWr3VsQqPuXeGmZf6LO7eyAp8AQUwiN+
	DDGrjCBTYITycJX8TuoFktDS6ZexwV/8wr378c1gBjgL15fxBKYDhNqzQq0wKQ8Bm7lsWXzkV5/
	wN9CXaxmu8B5+MbaPtA7dV71PSvZWEOvCn94CjYCxS7TYb8yzRQJhcGXYqYS3xNCmRpWWg==
X-Received: by 2002:a05:620a:454e:b0:7c3:bcb2:f450 with SMTP id af79cd13be357-7c774deefb5mr256193285a.15.1743807769615;
        Fri, 04 Apr 2025 16:02:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6MHU8Tgt8a8CQEhcefjPtj3ZIKu6Qtk7j4wVYGOhsJgBWQJhk02RvEJAWLOpHIAp8RfiPSA==
X-Received: by 2002:a05:620a:454e:b0:7c3:bcb2:f450 with SMTP id af79cd13be357-7c774deefb5mr256191985a.15.1743807769258;
        Fri, 04 Apr 2025 16:02:49 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c013f66bsm321160766b.118.2025.04.04.16.02.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 16:02:48 -0700 (PDT)
Message-ID: <4adc7b02-94d8-4ce0-a65f-6cf1532c7d28@oss.qualcomm.com>
Date: Sat, 5 Apr 2025 01:02:46 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: ipq5424: Add CMN PLL node
To: Luo Jie <quic_luoj@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_suruchia@quicinc.com,
        quic_pavir@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com
References: <20250321-qcom_ipq5424_cmnpll-v1-0-3ea8e5262da4@quicinc.com>
 <20250321-qcom_ipq5424_cmnpll-v1-3-3ea8e5262da4@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250321-qcom_ipq5424_cmnpll-v1-3-3ea8e5262da4@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: U4jrDiVzYWqb72aAi0yPusrhVsjFOR6y
X-Proofpoint-ORIG-GUID: U4jrDiVzYWqb72aAi0yPusrhVsjFOR6y
X-Authority-Analysis: v=2.4 cv=bZtrUPPB c=1 sm=1 tr=0 ts=67f0651b cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=FgJnXFQMKNkajvnM-RcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_10,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 mlxlogscore=710
 mlxscore=0 bulkscore=0 priorityscore=1501 spamscore=0 adultscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040159

On 3/21/25 1:49 PM, Luo Jie wrote:
> Add CMN PLL node for enabling output clocks to the networking
> hardware blocks on IPQ5424 devices.
> 
> The reference clock of CMN PLL is routed from XO to the CMN PLL
> through the internal WiFi block.
> .XO (48 MHZ or 96 MHZ or 192 MHZ)-->WiFi (multiplier/divider)-->
> 48 MHZ to CMN PLL.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
