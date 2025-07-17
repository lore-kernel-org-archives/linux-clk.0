Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FFD6EB79
	for <linux-clk@vger.kernel.org>; Thu, 17 Jul 2025 20:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752784931; cv=none; b=k7y37+YF9Isccg3qD0260b4mn0G3XxOO7OM32NVkZgt4/CZTjXAcNJlGGOf5QxpUyTbz4p9HH/rTT0cZwsELSt/KfGwVzo5C+pAmnm+MLeNiVu1KF801PKrZzqRMhYQ98mu9/QQ3d4oUNEq8opZvA2ZPGE/VZZ1sLHTsXd4Tq+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752784931; c=relaxed/simple;
	bh=rNJhrVaOXBgN447nIGb70CYE7BeWUHH6Lro6HxrOsrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bg1/kR4z8fRv61joK4vuOWfKEyeAK5df1myqX5iZCQm9fzX/tj6f4m+jh7L7zGEPiDmCvjhEfLzhagvCgiSbL7rgn7qHX8SQLiYPKYbY89u5FCnFXPLFyp8Mym0ICrhuABxt5Wgr0a/mzLvbBOx2G5zZFF16kJdgZe+towhtzjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FhQhQ2ET; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FhQhQ2ET"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HBunL4025180
	for <linux-clk@vger.kernel.org>; Thu, 17 Jul 2025 20:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TmpfxjkNhdt9dhUb9Z4sklqbRlDt+2S3rq7vCoARvZI=; b=FhQhQ2ETqrCc2+y4
	HFVwT1131Db7D+9s4XwC3oIlNrsScBTDWs9VTASF3EX4t8uZ/yISjsuRGBcRa6zs
	qy+oi3CA1Zwn23UH1vLa5d05L56n8CaVyfCMD3kLvjnVJErJSBm5RiislTStFI8M
	7Vph2rnsQTY8rU1WGJ6uY4zUNnBFZqf/brojlUeokI7DuPmEi9S+xR5ETye+2F/D
	ZbvqLezI2i+Yfld1A5Qwh45Osx5U3+wKekfrnR3kgA7L8UbvYxTirWo19hrWXIAB
	ZW0Uf2kPXZck9qz4j/rdpS+s2XL/alH5pw2VDRAU82BsZcE2mBR+VawUaxsvhbrW
	8VRfRQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47xbsqdagq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 17 Jul 2025 20:42:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ab61b91608so3974661cf.3
        for <linux-clk@vger.kernel.org>; Thu, 17 Jul 2025 13:42:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752784926; x=1753389726;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TmpfxjkNhdt9dhUb9Z4sklqbRlDt+2S3rq7vCoARvZI=;
        b=YjR834sZusNkaKT3EWnVF7NKPjbZqRtKjIPwbBnCluZwG+rMwOmD3cNbzINuk0iwb4
         vgPhPh33y7xV1E7IR8I6ZQZRzLkOOmxR2OwvTXfmDDkvBWyqi/Osro2eMhhSeFBWMsG7
         uhY7ofAvmlPnxYYxuyuXBVICKQOgtW98u3RWQSxtS+NW1ky9una0GCB0HGnmNqKx6SwD
         Q5wIRkID+AheekQiH8di7bpCJPvXMZHOUtjNdN6fB+lfHbW+ITrvq2fXaPVQxsMQLowr
         a41941evludWuX95ekw1h0eZRwPHnfikGVBuoXKaqGIiSqiN0v335xN4L5pEdDRPqLSH
         rBEg==
X-Forwarded-Encrypted: i=1; AJvYcCV+fxsCogBAJvSR8TQntPfWVdD0ceHp+h6MbRofkZWHBCVYcz5J/R8E+1sAtXkM5cv56jX27q5eK74=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs8oO8MMA2z8lBeaeCmbX6MdoKVBClgK30qYqH8V7mx98yZtQY
	jpQToSTd1R0/trQJxx1iHZ6a7nKwoUqXIyBBIRQS+lh/pChw6Gcg+tMehMJf+13HB9LrwrBQtBW
	L5KuR6veq0WkpFHvQ2Kw+77SUjwX7OhZV63GeBnHa7Y2vlmPvS12AXa8/GXtdZm8=
X-Gm-Gg: ASbGncsqVvGxah3K5XbM3jd8UEhBcDl0GcEQb+3A0oybBWUWhUeMhx3P98d0u5D+Jp1
	NEDW2M0YrMfZZf4BazImteqnR+aX2UBx+t9J770rmB3za4wO2oPECp3JZyI6yC3YSbN/Taq3DED
	bxqpk5ioJL7k6zVOHko+vwqf65v5oHASaey/EsZf1HZ0bKtqk5hKfmVZgfNPe1/ixI7evZCW9o6
	BXNKC2M0xgzkcoOQLBy4j/PDbV5rEO7Tr/UHowhOKeRRNLs1Q0POsRkw1jhBneMJplg8xNwK5NN
	CL17qjsnWGZxELQ3RIuK4HvDRGztJTkMe/sNJXjcS4nCVs/OcLLXjdSfHQPDTDsMs47Yv8qz1TY
	iQeYhx07eJsbRf13F5sac
X-Received: by 2002:a05:622a:1a98:b0:47a:e6e1:c071 with SMTP id d75a77b69052e-4ab90a82a28mr55030291cf.7.1752784926060;
        Thu, 17 Jul 2025 13:42:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRWAhwxvL0YQ5lOLx3J9S62rBalvJHOr8MWbHqXNprUdHSqk24MYX4tdyqOdn3P7ha6yUnvQ==
X-Received: by 2002:a05:622a:1a98:b0:47a:e6e1:c071 with SMTP id d75a77b69052e-4ab90a82a28mr55029901cf.7.1752784925586;
        Thu, 17 Jul 2025 13:42:05 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611d04d8347sm10357916a12.42.2025.07.17.13.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 13:42:04 -0700 (PDT)
Message-ID: <193de865-980d-4fd7-9c43-39ae387a5d0b@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 22:41:59 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/10] clock: qcom: gcc-ipq5424: Add gpll0_out_aux
 clock
To: Luo Jie <quic_luoj@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Anusha Rao <quic_anusha@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_pavir@quicinc.com, quic_suruchia@quicinc.com
References: <20250710-qcom_ipq5424_nsscc-v3-0-f149dc461212@quicinc.com>
 <20250710-qcom_ipq5424_nsscc-v3-4-f149dc461212@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250710-qcom_ipq5424_nsscc-v3-4-f149dc461212@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ad1hnQot c=1 sm=1 tr=0 ts=6879601f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=qx8TOUd7-QwhcYYS848A:9
 a=QEXdDO2ut3YA:10 a=jh1YyD438LUA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: N2IkGwb1rwQe6hPP1a9opMNEtM5EjmGe
X-Proofpoint-GUID: N2IkGwb1rwQe6hPP1a9opMNEtM5EjmGe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDE4MiBTYWx0ZWRfX6JDdn38xKBaZ
 O8LZaqyHS+Ii/IQ7AkfLQ+cPQ95Oy8T/wAuW+/CCZ9aJWNPI+vH0aL9f+Oqjie857U+2gmEtkWk
 p6C1ujq9eQmFQiCejetDQplLsGwru0PFtBGp25U6d/AcjlwJ3GwNFZujqsNykr9drUDNFvmUs6I
 5hdSIcQWMjcBzBVKD2MJHokziITHIkeVDCarHg8vpLZlfksJw6eLAW3V5FryITV0PJYe0O2yu69
 8vu/pX95xlMaUiku6ru6Md6f9fwvDy3yFDWTody2R8oLwbpRP+WaRK2Ac/UXRl0RksGbK/+cy0P
 CczMX2Bg4W7BuTqxyBDPv7zZziOTDtnvq5bjLKmJ5mlvK09d2B4P82ZIQM2zOtIo1vxS7FBd5PJ
 v+JE1BK7rsNFZKACqs/IuKAEEtSjUmXsJYddxv0e3AXbiAMsuGg2mIbv0sJ0uYdXX8Jenksz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 mlxlogscore=941 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170182

On 7/10/25 2:28 PM, Luo Jie wrote:
> The clock gpll0_out_aux acts as the parent clock for some of the NSS
> (Network Subsystem) clocks.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---

nit: subject: "clock:" -> "clk:" to match the other commits to this
subsystem

Konrad
