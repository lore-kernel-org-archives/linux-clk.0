Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D508843E4A8
	for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 15:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777564049; cv=none; b=f4VKTJYsfxys7eKai6NCGhz02rgQvCOXHOGeTTRv6uhHHP1S5w/+k0XER6NkTxI8JuxMMMo3OtJSLxpWOpvPlPaWU0A9X6xXoxKGzxHDa9wfk1JgdjLBgdZs6ObdL9twGuW4r7pT6Sl24mC8cT7fbusSdq5NRVC7laAJ2BKrj30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777564049; c=relaxed/simple;
	bh=taYUBNhelatZqHbz7w7iL8qAmVUpgnOLmkxTrhjIj1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DFvGORnKgTdxzd33zSPAz9WHzydOnk8MEWTiPTpvzFMOfCmupE4qJN8AwHHMAbn6s+KGkUGONw1JDU4/yDcAqHrvDRHnYaFOwAh4FNp6q0eQg8CHtXDX9EsFZ9KdaPt+vpS7SbI2u8xgxQ+42TlTIYpocQcgWRRF47Y4QY/SOBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ax+FNWHZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E4QVsKT4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ax+FNWHZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E4QVsKT4"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UBk6gW1820428
	for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 15:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P+lLMVQj5bS5ETHwl6+CEGdqgaWOFgrQQ6MT/bMnizo=; b=ax+FNWHZmrK627GE
	hhzPrw/vk5iROTcewMdWcd4+OJWsYeNlvt2KXg7FC3Vlbme7Of9B271IojfpkbLn
	dVw5ohU9X1zqHwohBYfUTNUHP5IalVbIcjGkJmMuzoZ0LqJGGnfhLlIqQ0Fpza40
	/Fo6XXiIpf55q81YicgsKwJe/yKzOjsO7Sgq+hkMX9AJ0Pu0MPkSMyQ2zbvwzLkK
	eHeVRhFiZE5QhaPZTlr/uj5Ng3Qmc7+BDNeFMT3+c6L0dbVq0jTjzrKgp0/kAx3s
	FLUhOOSPyWGYAFePZyOpwjoMyDqkh16zljC2ZpQk72CGol0q5QTwu+zrQ9b+aZB3
	vW5uBA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv6ges542-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 15:47:27 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5ff9e60dd65so104481137.3
        for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 08:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777564046; x=1778168846; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P+lLMVQj5bS5ETHwl6+CEGdqgaWOFgrQQ6MT/bMnizo=;
        b=E4QVsKT4edM/AxYdx8kZVZMCQm/5Ax+6+D8bTMkhXUO1AxYw/3PJgl+o1bezAQp+w0
         5DBjx+iaKntOhWRxvaZ4SCtHCgDy5gtF++WiwAf7jakV6ZWjdptE5QJ9IwNad5c5gAPM
         3k/ENMXHOYFCEwrp/HrfmG0Z2ZtwZPX8ZL3teZaAfEl66q4IW9iMVVfvHYsP/ntHS9QJ
         YMXJnm47RQp+ZKD2/BLpoJFZI01Qya/wn6XpAF5bPCeWkT9YOOmmoVna8GjRmqzKBoas
         k1kMgh74D/CZ2mSbaa0a4zDHctNbgziJ1BJj628mn+Qe7iscTQu0a+cXfb7LOdh3T+Yn
         RV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777564046; x=1778168846;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P+lLMVQj5bS5ETHwl6+CEGdqgaWOFgrQQ6MT/bMnizo=;
        b=PN/v6Hh/x0BHfZZ3fgGiQPndhY8SOC/TYFE5ocpbYGz1JzhHTQJOjldsjsLTrAMcj4
         Avl6AFOXSLgWMzI6AWhm/iORKRLibG8ZctT8WCIRrcutKzdt0i4/g8E/45ON3CpeBPC/
         g3Dk1XLp9kgPF36ntGV62pcXC4UYjSvM5nCT3e9eeD6fXw2r5kAH+qOcaRnIRXRl26de
         RCUD8OLYgmxIfCi8sprqZ8Lv8bUp8gf+wa6v03cYZD8OkDFVlySfGFnnfH9Nt1bHxvwt
         Jq7mUG0ewiEAIGdk3U0CSZcbd8PBXo4CP2hmk2vZIwdEBiTIxXBQ04NK14jnzFGygnzU
         ljkQ==
X-Forwarded-Encrypted: i=1; AFNElJ+SCOHhs0xCxP8Tc50ZewkxmmykBnmb2rt3qjyrp3COl0z0gNi8zguj16pHSGF5gIu2BHMb+gKOZxY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2LGfMMlOLZyBWVzgV6YLmHEpFRxCMapGrDU5V5Iw/z/Wp9IsJ
	aDs0erD4aFlEk0/jFKNYwwz2hFUFDV0iCPdgktPigFB6yiSNwXwT51lZSsRbqy70o6ln6jP3NeQ
	dXTVHCWd/dbwe9vKX9RFcDaTZxqAF/HsdnyZNAmjHrVXtXrtbiGZPEs2esOsKP8I=
X-Gm-Gg: AeBDieu/c8uHMavrkyRChDx5fQGw22narDUeUN32iogPGxfqhw9g8KArahWpyYIcedx
	F86fUOlCBC1KUKEIN8+08XWdsEkRncMmoyZzqgAcWyXie//FFLcaRhUxElGd4ayXDU+V3RVdrTT
	GJVrG1hK8huY7TyqD2UQNwY4lsIpi7mgt9mR4NFAtPyYYla2AoLyxa7goyhVHhR2p3HkcmoiHoy
	P1iEMqjVBaWHgsIjTKYYvWpCHc5WXfz9evSOYyOrSsXvlxkxofcb/h+rqQNZk+Zb4G8hDQwEj96
	zfzkPAaISbXaf236BcznDlaHBfE0umoz0niskgaDoozRW8KJyulytvw5t7U6cBOXY1vO63RaW8+
	hXv/izHmdKpyBGmOYGjSEREiTWJbiSWvMuMVIju6Jjabu5G/o8JfKdBZUGdcyxghf76lx1bTHJv
	YUxysniAjhFG4Juw==
X-Received: by 2002:a05:6102:2432:b0:602:b87a:3524 with SMTP id ada2fe7eead31-62ad661baf9mr648858137.8.1777564046043;
        Thu, 30 Apr 2026 08:47:26 -0700 (PDT)
X-Received: by 2002:a05:6102:2432:b0:602:b87a:3524 with SMTP id ada2fe7eead31-62ad661baf9mr648835137.8.1777564045461;
        Thu, 30 Apr 2026 08:47:25 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6da73509sm10510766b.53.2026.04.30.08.47.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 08:47:24 -0700 (PDT)
Message-ID: <009ecdbb-2297-44eb-862d-233e3290691c@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 17:47:21 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] clk: qcom: camcc-glymur: Add camera clock
 controller driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260429-glymur_camcc-v2-0-0c3fd1977869@oss.qualcomm.com>
 <20260429-glymur_camcc-v2-2-0c3fd1977869@oss.qualcomm.com>
 <7aa439cc-02a6-4b80-84be-1358ba8a6d60@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7aa439cc-02a6-4b80-84be-1358ba8a6d60@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=f6V4wuyM c=1 sm=1 tr=0 ts=69f3798f cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=-yHGr4N8GCYiLiAxFAoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: ti77J0Uzq88zs_Hqgf4cOB9gWV3W8qZe
X-Proofpoint-ORIG-GUID: ti77J0Uzq88zs_Hqgf4cOB9gWV3W8qZe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE2MyBTYWx0ZWRfX/IObx9LaRSPX
 jIeVu3ALpHftdhzNI44OYiZ8q50doE2HBk6YETTUGnC0lHLwH9WqyjJy5b5K2Q2TEZ8OFqSzDP6
 4CrQ8XendOymqhnvsfU5qfKghxRE1/lr9qRyZIN6gSmVFH4MjqTQrT+NYBFt4R1zddlWUQNnxnK
 VN/zHGV5eLfhPCQTdz0n+HQRRuPW+a+3MClVat8rvMNJht24+7N4Z65UcAayr3QRDZFk47BhTBp
 yehz+thV9g0GulVi40aynr6ydKf8YK1xafAdxPSzX+hX4j6cFgYajL9JpNkTyXpEPe0MthYk3Bd
 YTTuD+e50vG1w1Y8zmqGZ0fJO/JgoZf7JRw+diwDVGcX8/qRFlYfNviys8xfrQRvluDBiTQtWNN
 sOgxflUbKsSPbcI4y/nJKOvcfHqPXcrzu3hs/l6FUVY1EbA5hZActcq+FFVvVKXRg9TQO0P6Ltb
 my+e9kko5GmZoXFWPug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300163

On 4/30/26 9:19 AM, Bryan O'Donoghue wrote:
> On 29/04/2026 15:14, Jagadeesh Kona wrote:
>> +/* 1200.0 MHz Configuration */
>> +static const struct alpha_pll_config cam_cc_pll0_config = {
>> +    .l = 0x3e,
>> +    .alpha = 0x8000,
>> +    .config_ctl_val = 0x25c400e7,
>> +    .config_ctl_hi_val = 0x0a8060e0,
>> +    .config_ctl_hi1_val = 0xf51dea20,
>> +    .user_ctl_val = 0x00008408,
>> +    .user_ctl_hi_val = 0x00000002,
>> +};
> 
> Could we start defining these bits intead of stuffing magic numbers ?
> 
> I can't imagine a PLL setting is commercially sensitive and even if it is..
> 
> There's a difference between someone in the community doing a port of a downstream configuration where the bits aren't documented and a vendor doing upstreaming where it the vendor has control.
> 
> What does 0x0a8060e0 actually mean and - yes its more work but, why can't we define those bits and bit-fields ?

I think this is largely "this is the value that the silicon was tested
with and what the entire frequency plan depends on" - some of these bits
are defined and acted upon in clk-alpha-pll.c

Konrad
