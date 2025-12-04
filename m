Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B78C1ADC83
	for <linux-clk@vger.kernel.org>; Thu,  4 Dec 2025 08:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764835797; cv=none; b=h1GQDrcA7jbK1KEL0dmgMjMQVuZ4q+wV6g3vxzdlSwUbQF54hJc+p8ZGEC8IUX/qJX82GgDb98r6eH9/MCPUfcW8syjjSYlLar3T4Z7n7E7tbqcipuJhK2COxWSkTzP4PMFEfaOSl7bD5w0B8IQKkj2Xx3vDT4r74FQd/i2UtGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764835797; c=relaxed/simple;
	bh=29zaKRK8DZ/Y0cTah8noN4SaH64zRAhhdIyNHRC0chM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TEBd11KyLcO/iz1hPHaN59YeyGcpzUT9rlHchj+jBfvcEbds4CikeKrJLLPDh1vkkJea2RDLuuYCiDak8vwAvDxG0e3bIiMtqDNbpl0ZlGBvWpk7/3C2DToQfWVpe8s6ooJfBOCdNkA7RJclz9W0qv52rJKmyQe7Ixet+nTy7cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=asi9q0hE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gD4o2t7d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="asi9q0hE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gD4o2t7d"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B468qJA492212
	for <linux-clk@vger.kernel.org>; Thu, 4 Dec 2025 08:09:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bHP3kqTtgiL/DBdd4MoubS7RXA3zn+J4BPW6m/RUtiQ=; b=asi9q0hEH59sUEf/
	YfyQYCRXtP2pSUYWiw4ol++aXAj0ZSWgswhBkQNSLJDuOoS1tTVM3oIs2jrCia+5
	1YBcOhHZDsSo3NLvujGjYR+w30BIP/ChtThq7jXf3qDD/kfrPGW5hVarOniS6u5E
	zoOxMczWR5KuhE+ZmvLEl0HaNJq/eZ5u62Yk63W/I/MklSRQgm/M/xYf+gmgE5i3
	ABfwBxpWKH324heebf/Vyt599dqQpWns2lMfAp8ev81Prcn9/xGVGCZ+/839E5FR
	qZM3kodFLXKQJqVw0AUC3ABwGO+q9YRUIvpWpEi7m0Vd/CBci5ZZ7vT+7HsXgFYh
	np4HAg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atmbtkbxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 04 Dec 2025 08:09:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297dfae179bso14909835ad.1
        for <linux-clk@vger.kernel.org>; Thu, 04 Dec 2025 00:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764835795; x=1765440595; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bHP3kqTtgiL/DBdd4MoubS7RXA3zn+J4BPW6m/RUtiQ=;
        b=gD4o2t7dyogOppQorf2F/+zBNh+WZ4XGcotUFnALIb4YkNETEXydkq41zcIj8A8Z0h
         PM4j7HlexW//QQrMXvbvmOHXzr9EF8tPatanFqYuJuG4GR7bivpU9EaiR8xyz+0wbk3+
         WeY3nJutG1Ilwck3/PuiRf6RWub8vQZNEliNrkumxCNn7ryeW1VlqqEoVZV88+s7LO0O
         2TvPw0POaj32bzuc2mYNdgonOvwwooXG2EWtbenWHI9gKiHtuGRFQYB3hnt5M5DUIAOr
         8qEf8BIHhhtYXNYNDyYvCvXDbK970ueP0f1lmpem7OioSE5B67wZ2vwXNsBoRF0cqLIh
         bwNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764835795; x=1765440595;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bHP3kqTtgiL/DBdd4MoubS7RXA3zn+J4BPW6m/RUtiQ=;
        b=uUqIFepdGfRmAIDcvkjJtAupHBPcGdl09/wy9jFxXGXNyMwmKvGH+e4LJMk2Ht8rm1
         o/sXr1mj08+yYZp0IifJz6AFEU6EDKU029Efkyp0UzPgdzbXaNhYrBZ4FFK4OWCwy2tp
         hXpS6sC4coeB3GzJNYJEICZ+QKuLHRvYpRWAGRyKwN+0Uyyck0lpy/3iWs+vP6W6vsJZ
         WIKPc5hmsw3sv+LaS5tqA0k8XZR/QtR2/vIRAz2UYusJLak2/Kkr9Z9WH9fwUiOqw572
         +bWvLNOcJ1Mu7Kwb5rzH28XCpZIhxxODTEdKvTrstnbzAzGuvkfksARPp7Ks1AVIg5t8
         qPEg==
X-Forwarded-Encrypted: i=1; AJvYcCWklYuUbsqrnAzBvL3n/Mi2pXtaObQNbCyI9wR/mHWjtTg9tBMQB/OQxqtfINJ1i1FW7SDOSDTBrXU=@vger.kernel.org
X-Gm-Message-State: AOJu0YylTCuRMDZ7UovzN7M2Fg9tGubUPb3HW0qldlT2rIjRv6/+SiIb
	Fw1qgJKtxle8A7FstH2GKhLjy6GUcWsjkJgl8dQj9lz7duXHNNqpWgc/I/ioEYsrTuEfiXvMCZc
	CVP0Hx5gLibDoG/mNZ/fJM/i3VkfnxsnC4UavYfB8sWCOe03Wp72Glp7AUKH170c=
X-Gm-Gg: ASbGnctxcKTLReFuVlFd+MGkUZ+59XSpD36+PZSR9m0o9Pf17gBOa4y8/j7bmPEH01D
	7MXjLVus6pz1QPhKKtzH+CbJDnRa5hGvwrDsKHpUDzR61JT1QqMcXNafgtmFIF8g4Bj6jIOkaia
	gxwOio66NbwHJIiOh9boRCb/a2qXAyUH0JQ0SmspZrOpY0lQwAeR4+jrL9CoSB6klLuDotIge9B
	TU2Y5aO+s1IN53lzpjCfz5a6SoFzrYXIJlWBwKi7RkCDMZbWQerfJHk1ANWRyKrtxsa+xOH8K3b
	kw4L3qdJJ34Ld7BdeYdn0clSqYL/870OEluW9eOOeRUVIyfgnAeNkkOF4JEoucG4xvtqQcN4F8/
	DYK0um5SZDfkg8qUuhVrwfGsVp8dNQb1fzk7heY9SlKFY7pDu/JX2lOAIbFPNvuLgHgOV9R16Fy
	s=
X-Received: by 2002:a17:903:b4c:b0:299:dc84:fd0 with SMTP id d9443c01a7336-29d683632e7mr70490775ad.17.1764835794844;
        Thu, 04 Dec 2025 00:09:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDyOQ1vLVsU5V5EMsxwrhekjlP1A6NK3qfv4d4oxdKwY9CgbDHj0XxLOkRe6QdOid02VoGTQ==
X-Received: by 2002:a17:903:b4c:b0:299:dc84:fd0 with SMTP id d9443c01a7336-29d683632e7mr70490385ad.17.1764835794377;
        Thu, 04 Dec 2025 00:09:54 -0800 (PST)
Received: from [10.133.33.164] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf68155047asm1030207a12.7.2025.12.04.00.09.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 00:09:53 -0800 (PST)
Message-ID: <a3077c95-e6c3-420a-b65e-e4e584009c6c@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 16:09:47 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] clk: qcom: cmnpll: Add IPQ5332 SoC support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com
References: <20251128-qcom_ipq5332_cmnpll-v1-0-55127ba85613@oss.qualcomm.com>
 <20251128-qcom_ipq5332_cmnpll-v1-3-55127ba85613@oss.qualcomm.com>
 <6e12f446-7792-44da-9e06-99729c3b066d@oss.qualcomm.com>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <6e12f446-7792-44da-9e06-99729c3b066d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KNBXzVFo c=1 sm=1 tr=0 ts=693141d3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7x-uUUuUDX1a27h2f7UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: wcvH2bSNLl-w8aB-zzQVTPrBQvMVqTaf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA2NSBTYWx0ZWRfX7Ls5Tcy0WA/O
 iRH1/ch5fz7/+d2piBlcPIRWukqA7DeqqsRs8qJjJKIkAN/lk/jRS8A56F3cPhlRUJqNbXqkMXl
 BV8eQ248sZjysgMx1VzAs2Jj+Z7QMAwmZsLGmUab+RHDVccKfSp4eDXU+Zlj0OtcIkcU7F2wIeh
 CPfXRCxdRA3TsczcPFOl5jfbvLL6RW2BdIykYpXMDoDQZi0IQE8RsiaS05bvkWTadQ8/YgdcK6o
 VDezVrsUZyuJN+VcAcRqvjJB2C6e2ygJf4PW0IY2CkxpBZ9sBUG6DKmMSbmncK95ZdFyqy88MDm
 9eT9Tj7yxkA8Dy43dy1HQv+aMAZ4zASNdO5DjAE1Csb1vnfN8xaYeWitOqGCOBKgc2ucuzmkQuB
 BZohvzGTpbkOfEpJsWY+EI1jgbbGpQ==
X-Proofpoint-ORIG-GUID: wcvH2bSNLl-w8aB-zzQVTPrBQvMVqTaf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040065



On 12/1/2025 9:52 PM, Konrad Dybcio wrote:
> On 11/28/25 9:40 AM, Luo Jie wrote:
>> The CMN PLL in IPQ5332 SoC produces different output clocks when compared
>> to IPQ9574. While most clock outputs match IPQ9574, the ethernet PHY/switch
>> (50 Mhz) and PPE clocks (200 Mhz) in IPQ5332 are different.
>>
>> Add IPQ5332-specific clock definitions and of_device_id entry.
>>
>> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +static const struct cmn_pll_fixed_output_clk ipq5332_output_clks[] = {
>> +	CLK_PLL_OUTPUT(IPQ5332_XO_24MHZ_CLK, "xo-24mhz", 24000000UL),
>> +	CLK_PLL_OUTPUT(IPQ5332_SLEEP_32KHZ_CLK, "sleep-32khz", 32000UL),
>> +	CLK_PLL_OUTPUT(IPQ5332_PCS_31P25MHZ_CLK, "pcs-31p25mhz", 31250000UL),
>> +	CLK_PLL_OUTPUT(IPQ5332_NSS_300MHZ_CLK, "nss-300mhz", 300000000UL),
>> +	CLK_PLL_OUTPUT(IPQ5332_PPE_200MHZ_CLK, "ppe-200mhz", 200000000UL),
>> +	CLK_PLL_OUTPUT(IPQ5332_ETH_50MHZ_CLK, "eth-50mhz", 50000000UL),
> 
> I can't really find the source for most of these, but I see that there's both
> a 200 and a 300 MHz output to NSS
> 
> Konrad

Both IPQ5332_XO_24MHZ_CLK and IPQ5332_SLEEP_32KHZ_CLK are intended to be
used as the input clocks to the GCC block. IPQ5332_PCS_31P25MHZ_CLK
provides the reference clock for the Ethernet PCS, and
IPQ5332_ETH_50MHZ_CLK is the source clock for the PCS PLL on IPQ5332.
On this platform the Ethernet clocking path is:
CMN PLL ETH 50 MHz output → PCS PLL (divider + gate) → attached PHY or
switch.
