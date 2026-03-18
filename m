Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3003C555B
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 11:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773833614; cv=none; b=mX6I2bRBO2S8NHM6PIuKlcW2OuMlNb0wNSmGln5x0pJYSAKF7l+R8Zmjq6mzG/M5+v8Li2Trrvod/wJms07WEaO5vMuT4gQNvNBMN8JzesFPEercmJuHHaSlLZMVpmi8gKkkOVFDzk8mm0aHpplMgRvWYAPcYZwj1Q2VLOmJ7xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773833614; c=relaxed/simple;
	bh=p+4V3p3F/eFuX1bC0acottRUz2aZQ7vSUfMRPwCEmV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ovSWlPulcyV8SXQDWOOzxcqVkI1MAzpWF7Wb4wBTwHCuaSoP8kIXM3hsBrpVowShb7aC5TAQvBHsyXG5AJD2tZoptukXv2hFJvUAUkiV+1S5Bdn8oedFPxSOjC2qJk4GkZ1ePZdIZUywJB29Khl62zJ0ssLd1O1fUH0wpg0CaFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KulQFRo2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xi3l3y9D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KulQFRo2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xi3l3y9D"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IAikek009627
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 11:33:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H2JeKfOPCA58cjIMuqyJWK+2kMn226saxkASuxuFM7I=; b=KulQFRo2ppyGCv30
	HzRdW1h/z7ipvBc7tT6iFwc/9hZATfqauRJtbGsEsjCf/mfPOAsx5wOp41Z1uToe
	W4WwTPPPvsqDTb4rymJu/5hEbBbhMI/Sy2Jp8CDuMIbaaMeIs4YrBZmR0uBfdA0q
	PXEHVPWweRzY4QPPK6VdK71aP7yhD12vgGUvfYa6oSsn43gTA04xSqWGkwdFEzui
	LMllPFwnIVapKEQCHX6cbEfvLApkkbJEUduXcN6XJ/OO09Xk1QsQiwF5k/dChpGC
	/AmICiYdSyaPP0+DOSyhSXPCjakoVVHRfRRfK9GmcdJHWEKZYStnJSK3OL1YZEt3
	ByOFPQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytj50583-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 11:33:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5091c7384edso46501951cf.2
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 04:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773833611; x=1774438411; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H2JeKfOPCA58cjIMuqyJWK+2kMn226saxkASuxuFM7I=;
        b=Xi3l3y9Dd+ig+hiEsDN54yFRD4vegsZB5lmB1x0E1vSdmt3rlD9bdJA2O8DU4ZlF/J
         cdIZ/pdlSRc4jUv7xWO1fWEJVywUHrh0E9BKY3WsLMyEUUh1SKN8367kFiQQWgfWnXOX
         CB8u1fCa+f8vbWA5vhRxZg/XIZlQTHT1jHKZvcMQK5wmcTu1XBCRwgubvqvIoufy8uHI
         fzN/0u7F3qSWCTw12b3W9Pkbcb0fYxeHo8JEpJq6oEuiLPv7jcRWHOLvBCRDcTfgSrIs
         AAj5fWGwz/ZcXEDqgCg1QuMz20IhxQoaPgk4gwOMw4Fy+LcAO7izcLCTdE+gKy8aMlYs
         QcNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773833611; x=1774438411;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H2JeKfOPCA58cjIMuqyJWK+2kMn226saxkASuxuFM7I=;
        b=qIfDx8kpy6UwFS+TLG1N4W89kspvU9Wz5ZTG+zvaMRyneDESPKNZqyWHVKRTMnEPtX
         HEeR+Gs4gl0AeEOoi48ydpZTcLiNOgbHynTqFAfG6KUP9YhdhwhVY1szsW+hkgfpHjAP
         sxa8uDHq3lB4+mvbuP/kkfgKNkO7VvgCTg03c6l/5O/4nkUzX7bKq95P9ImDM2uRkTu+
         54lPKa4ZxW+dy7o4hx1NYTtTuDc1ij8X3nc+ljA+vflNPjATZxXZnxHmgvwW5kwsfgg+
         riNmblphqghmicHppd9UOVtdQAf5m+OU4oRBfE8FYEp21N+8w/Y758ePC0Nl6hmHUHJy
         292g==
X-Forwarded-Encrypted: i=1; AJvYcCX1qt41dFA38MIaemlG3S1EKi8FBIfXa43/yM9MhewYY7ZOp8hjUZePbjjaEnm29X5BIS15izotnxA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfc0Vjx1q+LYCbsbXuhPpSGukFR2BTVS1WBfjzOwDn37Bp0VA7
	5oCRki+ZtJNmiy4fBxm8BtMBwwVirFxLNWgemb5+G8a/1u0xDUOUpoIskZGg396QN2BfBs9DLtM
	s2OPAfCKeytgQjrCNcuvbgYbbyS3mJPgy0zWgU8xFkfR5VwSU3hZ7JznOSoLiYRQ=
X-Gm-Gg: ATEYQzzudf0SbSa6vTMfkemH+tbt+VhVGXdiKAFhJ1o5l9eoFNgfgcAxdtl/Hfik7XC
	yWzE/VA/wVfr8SKyn+mowI4TuZrKmiclOJSb7xkCkyUmRlepu3kbEjcsIlsXhAjFxWZO1jbaPhF
	peANU0nCU2+trGMJbr5DKumPDnF/h3CA9sbuU2i99q4qc/sycVY2rS+GrPeeRsNqH8WI+hiUKLO
	k8XEZw6dxRl86DQsbf0C1rfBtAkF6wQOL39t60hSKzzUyHKwqLHWDmZDv/7/GWUDYFE68Y/JElA
	ZAhcaOZm08BfAIdjAg9cCQmh4BhtN5Xzs+Ytu8HJUdKOM1FdIOyg/f+Bf6N6yGWCbB5DqFs0s95
	k/Hannul3RJpCFH5clTNw13+0+xtGUDbcadC6VYsWImyGoWZsSYS40Gq7ht9ito/eop7eHNdQjM
	D7MVw=
X-Received: by 2002:a05:622a:610:b0:509:47e2:9dfd with SMTP id d75a77b69052e-50b14949a02mr26511821cf.9.1773833611329;
        Wed, 18 Mar 2026 04:33:31 -0700 (PDT)
X-Received: by 2002:a05:622a:610:b0:509:47e2:9dfd with SMTP id d75a77b69052e-50b14949a02mr26511551cf.9.1773833610947;
        Wed, 18 Mar 2026 04:33:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667b0eb9849sm1476868a12.16.2026.03.18.04.33.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 04:33:29 -0700 (PDT)
Message-ID: <5340bc99-df1d-4736-8e10-09d541f0d2b5@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:33:26 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] clk: qcom: Cleanup redundant header includes
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5NyBTYWx0ZWRfX63L5/XndkPpw
 jZlC6w3XEaislel28WCz9gcnI41xyadAehDBEpgIbII0he1rFkkmVVFzh/cqlVbodIaYJ2O+Q9M
 MLE9beFuYkEeJup8OtYe3U774B3zePGvae8KDcCei8V3XVI7m/24N3AHpftG3ISa7m+xxU3pirY
 KzmlI1aQyRcAIQ92rXw1qcpM8z2vy0g2QnGkKWY4gWnRUhPm+cg+NrTAsw7oWPAeunJt1W8Qmk0
 Szq/TWa28rI944MBzHpALzINMUwJZ5eS1HCHwkk5YPwSUYg0dPWGohZa9CGdI29aKD3KwsiW1An
 UpcNqFgbZIVgJGhk5/TNqQuCYB1LP8bMxAN0Pv7n0Y8sBj1OThTH3vj6rEf41VEVXhnrxPqR8/Y
 RH1BrA8+ZCEetQEP1lD6a9/FRFbl3jonghFF+5JUBohlzRNCsuAXW1RaxzS4Fsgb95BPjZMdYV1
 dcpe8Bd5Ky9ArTSbFAA==
X-Proofpoint-ORIG-GUID: 6--KdUvZwN5lXin62VCPycjAqDoUDZ5e
X-Proofpoint-GUID: 6--KdUvZwN5lXin62VCPycjAqDoUDZ5e
X-Authority-Analysis: v=2.4 cv=dM+rWeZb c=1 sm=1 tr=0 ts=69ba8d8b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=aywfhrhUYFgYpfM73PUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180097

On 3/18/26 12:08 PM, Krzysztof Kozlowski wrote:
> Newly introduced drivers keep repeating same patterns from clock
> generation scripts...
> 
> Best regards,
> Krzysztof
> 
> ---

for the whole series:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
