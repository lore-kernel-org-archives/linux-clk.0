Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD431A0730
	for <linux-clk@vger.kernel.org>; Fri,  1 Aug 2025 04:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754021697; cv=none; b=kNyx5jDYZz3bCWLiyBZE5atEqbiVExnikFLw8aVF3TQVMLdWQZri4M/JasrMmInhMICU2hpYEu1Bvu7qGTYtEuiGNaOVSXtw+LrAChw/c5/caBaldiTNdnD65diVR8h0GY4rLto88+M1zZeL2uW76wfdCSmAd8joefKRGygea78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754021697; c=relaxed/simple;
	bh=Gh2ntd814sIoBv3VZBGnfUAB0tOVDMLn2NZVjot5dm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I6NmGN/OtK9q9MLUixlkvCozzTPspAdHFFa3Nb1ELXZliqiuRZlB0betD5IoUfH7k3C9fCrj/4C+0F1ZBS3vs6g/usIVyuopiFKrTEtGEMTrrHVLg+z4+E0JfZ27ZJa+UCz6zpY52a++LhD4lpPIBKdwDsOTck16CkQupoRS+k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aRYK9Flc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aRYK9Flc"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56VMglkK024725
	for <linux-clk@vger.kernel.org>; Fri, 1 Aug 2025 04:14:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KoEUODVqVvmRTyBdHpSdPr4lOpOEHOdK4PtMa4kjFg8=; b=aRYK9FlcEoQPkOHR
	BmZvttV8RtzDfkKIi3R8nCQbqM7q9GCW24EdmyUS9oGn7Jd4wWGvtg3YIggrBDgj
	OfOzF4IM3QA0YgixlVE5a2mVycH9ltbmjtQvUJdmttagZqk9CWOV50EwOiRiHLbo
	9k+VckbfNi1qPKQqoR4Dv4Cqps2u4YMOxssdeT4gx8u/OBw9wPpF3eOhOfc2OsaM
	nGY/eWTEeC+PHWb4juj0P6el83zMykvuENPJDljTQOa9uoWAp9ReZOeKDSwkJfwV
	tl6xf7U+XXEAwvBookslk9RAwqzFhhjedGXQReWRFp9K3gNr2Dx5kDRAxCd5BLj0
	VoJEOA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48887g2r7y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 01 Aug 2025 04:14:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2400cbd4241so22170905ad.3
        for <linux-clk@vger.kernel.org>; Thu, 31 Jul 2025 21:14:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754021694; x=1754626494;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KoEUODVqVvmRTyBdHpSdPr4lOpOEHOdK4PtMa4kjFg8=;
        b=M1fFO6v1x+Bi2Lr4QS9Kny9R4ur0y/UBCGnwkHcSpNm3ALaqek4KBetxfyj0TVKrd0
         2mt4fplFl1jfAMYMQ06DIBSaH3gbGwW4/+cyfDW0FcKtXWM5GemKj2qUrHlRj73zNcYc
         BhIeR7CkODjX0IW5NbAMWj6fdwm9qtwshqspfz0z+YaQrEssZ26LFL/oqXx5BuKBXt4i
         268Mt5Mzhl7PNhBHDKCX8rlaGtwKMYGpRi/VEI/9yUq3uW/lPouLRO7/jdFZ8oYSPpQo
         W/xwmCYtqlhbPffPuRYqC5KoFsBT05jlxYSDQseiDCwpb6Fy+C1qT81FsFPcJiU3LQ3t
         ORJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJbewOSFlFPksCrgGbBaKfMzRZS0PL/mpsLiYGHPL+NhDH343XylG2Kek9RC9Eqdt3zZrvCnuETA8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoBOyBBg9INesm5+thenSHXzau1WzSQCr3LS+VXdro99yklTPi
	Rp8jVD6HMDUfNskJOn0KdfNW+gCbP1ovSYp2zLEhSWOxH6dtWIXR5LCSYb1hJQoeJTK4/UKv0Pq
	6YJoozH3hymS3OaOjr8qK9shl2FJR/A0GC4fIHvEDDyNNK5Z/qPlG7yRyR/Vz1rU=
X-Gm-Gg: ASbGncv7dTrEBSPaMByFkj4LPLWrMMlWEc1tLwSB2168aYecrb5M0dpBj2vIXG4JZc1
	Esp+pvIi0YHignRdzn++yD2FsEnzJT1MEWaW6oBLUPcbF860bAjQdypaV8bRE9AdnAGHKK4n2GU
	lsgeCIjp7z7ZtoqX3iEcHElTlEmMjXWURNDpbhiHzQCJnixDDz81FLDMvzlyUztKqyc6wjdtZQI
	MpEhWQmr5HaKKneZ43dBw1x2dloBMtc+S4FymcEj9rFYkCo8lNwtUunbHyun3AqSAHSwO8R+5LL
	cKlJqfL/PFiqFHmEBBYS9m4+FKSczYZnEfRT9AjkqdEVPu913tO+gBHa49Wtc1NZ9Yg=
X-Received: by 2002:a17:902:d4c1:b0:240:3f36:fa78 with SMTP id d9443c01a7336-24096a97f96mr161069195ad.21.1754021694218;
        Thu, 31 Jul 2025 21:14:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRs7ytQBzqDA73c4cijGGPqsYp4V5AKtdxtskR/1bICgpcEqSGo2+1y+ueP91TM0aO1GU+/w==
X-Received: by 2002:a17:902:d4c1:b0:240:3f36:fa78 with SMTP id d9443c01a7336-24096a97f96mr161068805ad.21.1754021693753;
        Thu, 31 Jul 2025 21:14:53 -0700 (PDT)
Received: from [10.217.216.26] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899acc5sm31273885ad.130.2025.07.31.21.14.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 21:14:53 -0700 (PDT)
Message-ID: <9cb06263-2a61-4acd-a9cc-157abb832d62@oss.qualcomm.com>
Date: Fri, 1 Aug 2025 09:44:47 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] dt-bindings: clock: qcom: Document the Glymur TCSR
 Clock Controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: kernel@oss.qualcomm.com, Pankaj Patil <quic_pankpati@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
 <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-2-227cfe5c8ef4@oss.qualcomm.com>
 <20250730-mottled-myrtle-bull-3ae03c@kuoka>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20250730-mottled-myrtle-bull-3ae03c@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vdn3PEp9 c=1 sm=1 tr=0 ts=688c3f3f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=axNqULdi0T3Ot6y0ZkoA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: iplE0-ayK3f1LIBwV4FQJtX7HnSS_-FV
X-Proofpoint-GUID: iplE0-ayK3f1LIBwV4FQJtX7HnSS_-FV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDAyNiBTYWx0ZWRfX+73B6qSfDLNj
 wmKvbHt979wH2dLA+OBJ6QHLC/p/LKoX2blVD8akw/hMiLRqjjygx/S5u3YmLq2RjdAElU53CxJ
 Vi3fWJGBfVsrM0RMJGUryxi8Epl2X4pBqrTCb9syRLtlTMQY/WjvsCc7Rb5KyhLDKMcwY7LsabQ
 EYxLca7ydOncMoqjofjJYm5sxemYoV1jRz8k5pHgbMwWQziXEUSTv4USI23oy/DTjLXQjmQ10HA
 Nn7DqU3PIEqwVq/jVnnyX6DiW0k7eZvgc5MdhFI3y9rWifUxlGBZBICrejEdsBZNOluGm44PCfe
 RRRnEoj1i4ulIXNVBdDz9tzbr83VUcO9tAbHjRx2ewIInvf6ZOFEXcxRxQaiBb/5yNdMroX+8qR
 fZqMLGstxA+pKkdsE0FXXvDeBliIts7OIBmq8XEfX14aZbmA0W1sMl1H9PSiWlCW7Lsx+9Dt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_04,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 mlxlogscore=971 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010026



On 7/30/2025 12:47 PM, Krzysztof Kozlowski wrote:
> On Tue, Jul 29, 2025 at 11:12:36AM +0530, Taniya Das wrote:
>> Add bindings documentation for the Glymur TCSR Clock Controller.
> 
> Same question as for v1, what is Glymur?

Glymur is the Qualcomm's next gen compute SoC.

> 
> Where is any DTS using this (or explanation of lack of DTS)?
> 

Krzysztof, the DTS will be posted separately once the driver and
bindings are reviewed.


> Best regards,
> Krzysztof
> 

-- 
Thanks,
Taniya Das

