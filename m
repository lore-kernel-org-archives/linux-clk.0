Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E1625A65A
	for <linux-clk@vger.kernel.org>; Mon,  4 Aug 2025 12:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754310800; cv=none; b=f9JfgIEC/Sku04tNOa2mJc62ejY49h0SuOgiXrbzsWNrz4zDDDNab31DpMCUxCnesNaLglhc1KNtj36WGrACWlf3qm3l37BqX/B/QBrbRSUoZh8POth/j/7AIaVgmc7+F46cxKnee1j8D00BZbZyL03iXf0T0EXSw7ZUgGtzqOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754310800; c=relaxed/simple;
	bh=ANVmw6AeR0GHHCK/HKaHO5w+extSI4H+i3GF9Iz3jdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RmOE+87QDvRGpDkSRw+RMfi4//N2IisgmTV9ZjBbAKhfsrD8fzi60gSXwxXecLWnxoP5qTBvAHPbmMcvyFYK2Hl6/MBlXujiqjlWDAWDQD98XvmxjI7PXAlm92rnQ0G4qlZzTLK+om83u0jbL8LrcyBFnE8tUA3zic/4nRXDh+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WqxekJlN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WqxekJlN"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574CRlYk009979
	for <linux-clk@vger.kernel.org>; Mon, 4 Aug 2025 12:33:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	46HAWgvv2MxgQgdpENwkPzAKGo1621//AEpZFMkCwFU=; b=WqxekJlNtED++Z3q
	iLHSuYwBGbF7pe7KzYohu6uNqSSJYYbYzafcZWS9UQXLPbpqIRg/Tc7xsa26i3zr
	MArzxNX5otzPpYwrdZu0CvGzPCra9Nwghji3mVvVBlfxXtXjL+t55zNZT2TrVavr
	7hkdUuvOfjDPaml7shA/N1BaOvBzIfFD0zB9uKVUHHM37RuJmvR13MOFzPhnGYAT
	Nhkj8XB1hA09ET1Cs+55oeJA6o01LO0mgWTFqIjSxwbp6wqKOd0N9x11cNoRTrti
	X/26e3/xsywbzRjx0lUTi51IKv80JSGs9d8/j+7LSu1NLeO0OeDFzQdsUEcaD6Tq
	oRkp1w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48avvu80c1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 04 Aug 2025 12:33:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e33e133f42so93870785a.3
        for <linux-clk@vger.kernel.org>; Mon, 04 Aug 2025 05:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754310797; x=1754915597;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=46HAWgvv2MxgQgdpENwkPzAKGo1621//AEpZFMkCwFU=;
        b=jkifEMvZ0LeWikKe7ssni08HhAuZEIREIWzuT7+fDIMazEtB57ETM7cpNHzRR1JrrO
         spiSM7HRHvhEd8XuN02Dh4KXDgSQxe8hQl+n7ANgmPkB6kWA5XvrMdCgr/1lw+Pdt/Xb
         AKR5IB+qD1C2bMGQqmVfgCv+3AYxO0aU0Tp1CbpHj9lYBam6Ryn1OvSNWxtZ2Vo0ATyG
         PEWyKEpmbxWK2jJlapBgCjEKgjDkYC+i7IkI7dfeEIDeBIt+7bTY0EzcDBcGFR3vtepX
         psiwZls9ZnI3/S/bqKy420r057ENetQfvDHduAXqF4VpUyvYLD6qskMPBwa+AfDNQh8t
         Osxg==
X-Forwarded-Encrypted: i=1; AJvYcCVKpj/5FC3jhui3Rcy9d944uQTxH1eDT3vh4OA12Q2ytcy0CqlfJ8Rgd6pBlgZOmcPUnA+Jnw/0EJw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxF7Nqyg/HsC/BtgFxOmdiHNgj0RuyBNpy/13QeeO4uN6mCehs
	ub1JtEyiQiXVapdV+yWO0NH8hh52OUjtIn6nx6Imtqiawh2s2+WrZSHZ8p7tWiiUut0OMlhUwIp
	/iaPonlhOHOJo8DERKjWRcEBuxwz9WuDAEwLT3rtR9gb3OsTcT2n3zYetXkH5mVI=
X-Gm-Gg: ASbGncvDkn3k3CntBCE+g0qxzlLYXmzm1+6io62fJCM36wIPzGQAOStHtASeHENp+Dn
	cl5RtB8/E8A31hoig3LEN+TZzuw3HodFBVnYHOZi4dUfgmHCxOV2552PpqecN4XCN5G0N34Qx2Y
	KYSIs2DyqOQ8MBDO8zyHQrgKThekTSotn3JLjV1BzOoDoeCDn+yGrp/g7sKThox9KUaxGsHZHO0
	geYtlRJmGus6wY0sJAX0WNjhBkCRmeMITpq4FcI27GJ3ZBauoVBeJsZtXmnu6OYibAYUUXUy64t
	WSKG4YTyKN30BF5tHDzr8bDTHp1z2vkxVYc+jEWz/KrbuW/450UUdP4wreJGWGnjYC0knaR6PMZ
	kJJ6WwwljPSyChAYBEw==
X-Received: by 2002:a05:620a:6087:b0:7e6:9e1a:1d with SMTP id af79cd13be357-7e69e1a0795mr468467285a.0.1754310796931;
        Mon, 04 Aug 2025 05:33:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIA4r05fZXfrH3ID5bH6u1l2Cc6ps0sG9WuleJWFvPFQHdK+8Dza/BZE8ttrEeY9KjyY/9Qg==
X-Received: by 2002:a05:620a:6087:b0:7e6:9e1a:1d with SMTP id af79cd13be357-7e69e1a0795mr468464085a.0.1754310796438;
        Mon, 04 Aug 2025 05:33:16 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af919e96050sm731035466b.0.2025.08.04.05.33.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 05:33:15 -0700 (PDT)
Message-ID: <4890c832-3b78-4294-aaba-b62735f7934e@oss.qualcomm.com>
Date: Mon, 4 Aug 2025 14:33:12 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: ipq5424: Enable cpufreq
To: Varadarajan Narayanan <quic_varada@quicinc.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        rafael@kernel.org, viresh.kumar@linaro.org, ilia.lin@kernel.org,
        djakov@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Cc: Sricharan Ramabadhran <quic_srichara@quicinc.com>
References: <20250804112041.845135-1-quic_varada@quicinc.com>
 <20250804112041.845135-5-quic_varada@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250804112041.845135-5-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA2OCBTYWx0ZWRfX/5gdAa/UQg+o
 o2hNT7/320mc27xxpWhMBCCRGnJ3WVWdYe+RLgXKMwR+PSbStbNTSCoHDrzSoCEddKRkWr0z5ml
 2FpZV1YDYcY7kF2UFF//FGkF/yPyMwjvzUPA0kdRwzCmT7UDrWQo40inXnicd/0SD/4JXq2LJVw
 Ewm+EU7HiF7XvHqBylGkx1GI7nCtNYuAx35ZiO249faIE/MRDbhUsbLJEsK0EMHMlhwBNEwwg9t
 nXR9zeoekm512m5ylU0prPoMFMun7BaRUlzdoLiEhK3I8Ye3MFGsC+bMo5tid14F6hhqzpLgi0y
 buOmMNGVEffvvUGIvCtm9830XISVOBJIte/bxuzOXNv13zdluhVp6JCfptOcRaUc3mFjWn6z0x3
 Pwp7Y/OLAbwFKkBU0m0oZ58mWYD7eCTZrtcvNs0g7zAuX1neZ14rkLP1+q+GlvE87lpHfwu5
X-Proofpoint-GUID: ZSfTIhFFV13QeZsTTHgwNB3mV6XoWUo_
X-Authority-Analysis: v=2.4 cv=OYKYDgTY c=1 sm=1 tr=0 ts=6890a88e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=vuI4R3Do2uEHNfh2jzQA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ZSfTIhFFV13QeZsTTHgwNB3mV6XoWUo_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 adultscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040068

On 8/4/25 1:20 PM, Varadarajan Narayanan wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> Add the qfprom, cpu clocks, A53 PLL and cpu-opp-table required for
> CPU clock scaling.
> 
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> [ Added interconnect related entries, fix dt-bindings errors ]
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---

[...]

> +	cpu_opp_table: opp-table-cpu {
> +		compatible = "operating-points-v2-kryo-cpu";
> +		opp-shared;
> +		nvmem-cells = <&cpu_speed_bin>;
> +
> +		opp-816000000 {
> +			opp-hz = /bits/ 64 <816000000>;
> +			opp-microvolt = <1>;

I just noticed this.. I don't think we have CPUs this efficient just yet

Do we know some real values for these?

Konrad
