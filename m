Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1BC40960F
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781099012; cv=none; b=SGsSEnGLcVY0KQO1Y/74U1u3xcY92XPtRD9kXRTEYamwFKa6Ba6kD1fNKTVdQJb1NLzx/JdMjCKk9igoT6XeTfeq0ioPusMCjAZsj8Ul7RtSp6hGWwHyUpsAn9BRpzD3C0umtKnTrO0C1ZrLpeOPpJ25yzyesyLQdsrebjLwhIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781099012; c=relaxed/simple;
	bh=s9ua0UmvL6f5kRD80XRjmdjy55LKKwOuM9f/hvYKY40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BvLVsVoTRl0129yUKFXnXeGwE4g9jNI8fLetBackXSw71izVajInP9afKQqyhSiSn/eZjRmJuM9FcULQKQdV1MUR9QkYR1l6rLUp3fqAqzLGo+eps+VkBSAlOOJBnajSM5BQygDgE3cK2H6CWHMq9duIxsd6ZrGKL479DHfptK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FCeOFlPS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NWhitUcN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FCeOFlPS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NWhitUcN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACCMlq1554787
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:43:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+d+uOIy0pDXw/dS7D+a0SvZQsQcUuq0fUhk4Xwj0hOs=; b=FCeOFlPSDayy77sy
	oTDBixrF4W5gcabMe8lO0FNstbB8A1Ak+3MTq/TjEaxVNe2CFLi+kOmwzv0iPdDP
	SWrztpVvtDnWO3T30BcivsOFNSnsB8Ee8TNXJ/L4A9yrnSOQpVg6s7zTaIS5BfUi
	NpWoIGjx/gJI3QWNcrqPwpyOLc2b5NSs730JPanq6UOq6A3LZ80jXx1QmtfLNZpF
	9UvudnifUluefpcW5AWdXs+Nbr/n12m1hbYZrBN7DDVu/kLGXOjqhtjGnF+xqXrl
	7OG61ivjoNInaRS8CrMB3FO3vSAqTzD7Uqz2TLszuTe/kzEby7/hc61iwrAp3CV8
	omdz1Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnntqv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:43:30 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c53e2dd1d6so302975137.2
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 06:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781099010; x=1781703810; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+d+uOIy0pDXw/dS7D+a0SvZQsQcUuq0fUhk4Xwj0hOs=;
        b=NWhitUcNMhyyLH9LhgK/P4UjqOb0KT7e90wmdsothcAcLI3XCZfug8iXcYCkALKE9C
         RlSinjgMZwqJUR87O8kpszzUL5GjiVrU/UUpTT8OznZO4g5doEN3M1k3y6QGBxSCEEb1
         o62OftRP5RchSibINMTdl77WG7NP0xNAW76MccFz+OzEM66QsuGGQKiU6/ml/K0x5jlc
         theaSuWGwvs0JfKGjyx42KVAToRgM7R4Y1FTXZRqevarUP6lsMX3+8JseSzAIacO4GSn
         kDu9aye/ZYu3idZ3jdmx6T6vx+OAAdii69tGpSx+vRdUC8sS1rZc1E0Yg7Rj1vDlI4Ga
         3ywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781099010; x=1781703810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+d+uOIy0pDXw/dS7D+a0SvZQsQcUuq0fUhk4Xwj0hOs=;
        b=MwToRLVYy8cUUmZdaqVQxep7epqrd8sRKx6LTxbCVqti8FlZD+b91qNPkN+ENtFer6
         NXbw0cxV0vASrxIomxDVgK9vD6roQ/2Cqzhlhvnf+cM0eRkMth6ecGmntECbDCl6Zmhp
         2fqRpjF72fW6rJ7SIVp+EwPpXsbOqiulj+KYyA7RfLRv6BrHeD2kOPLVWisksRpS0m3L
         tnDovRz75W6F2ZiN+sWkU9ubdmRqAxJN1IKFwvxWGkO4h7sUL9FY5T32z9DrumAiCqcb
         w6nbnk24YgABk9Vn9sQrACMyxbQNBB1I4KK/DsDZCY+dK7jyRGDpFpSFGzh6oaIs6vXL
         DqwA==
X-Forwarded-Encrypted: i=1; AFNElJ8/8wXxeTf37o6PLsIp3ItgLNwgsTEtSB7hfPKGVuW71Db6pLNv0gx+jM9t2U11qX7pn12PaM/IaMY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8c3ANhqQNEhG2BTgCBJmQAxesM9+HPPcUq9HJw43HyrBRUWP1
	63whuWdrQgBIJQT1jJIpDXsYlFpGUEnKixToNiRr05jTBKEVGFN/yCAHY935xU6ZPSOUuy9xfkW
	DNI2iEbDtun2BZBptwqzQfbFI/g+1PtBi0+8OCwC16yiS0duv0OUnCoHbWA1IAJI=
X-Gm-Gg: Acq92OH4sfkWreilgUU0cvAj0dG5J/Bn/1ZUfVAV985cA6wULjLlmeaRoiuhovxthls
	mI56A/8RzCNr3+KJ34fUqUPMuPITeMBC5B0dEeA9/00drJFlpm6jPp3+4Akj+v14pXyRBZ3qjZ9
	7ZiabnJUqUYLsnciBef7+OafPPApRUJg/oKkD5T7YvOK9NBcXOrLpeZHBNKYE10Xp2nXQBVseuD
	nmeb6Entjn3JoIzrBnD3pjGWf2ow5EHJ5VFERgTxmUSHUl3PMPHJAeJ5VH4z/z3zrYRkG+105ux
	oJSenzIXdVBlIn5AA8k3iWZlyg60V/9p4U3/2Iptu7fhgBpdAN69rO64G07uNSxWKt2GP/U5UZ+
	IO3mpzrUH3HreIlORbHqU9DYGu2Bq4UUmyQdAMoKZt3Ip76saehoXZ1BY
X-Received: by 2002:a05:6102:2923:b0:634:8685:d331 with SMTP id ada2fe7eead31-6fefce7da37mr4023449137.6.1781099009684;
        Wed, 10 Jun 2026 06:43:29 -0700 (PDT)
X-Received: by 2002:a05:6102:2923:b0:634:8685:d331 with SMTP id ada2fe7eead31-6fefce7da37mr4023441137.6.1781099009218;
        Wed, 10 Jun 2026 06:43:29 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396abd6cbe6sm62688081fa.0.2026.06.10.06.43.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:43:28 -0700 (PDT)
Message-ID: <e93a57c3-8355-4437-9b28-d04d30bfc765@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:43:25 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] clk: qcom: gcc-mdm9607: Fix halt_reg for
 gcc_apss_axi_clk
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-5-5e9717faf842@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-5-5e9717faf842@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WdLGFC-CNlhh7kgGLaqdCXREh32D0pjm
X-Proofpoint-ORIG-GUID: WdLGFC-CNlhh7kgGLaqdCXREh32D0pjm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMSBTYWx0ZWRfX8CnNVpRxzzpp
 TOmUHKq5mPS0zXgLDI5YH2n4yj8k5dO4ZxmfVlPfl1fyddIBBEDiy4xX015fPpuzHru/dQqLrbY
 il+e3KhvHNzxkgiG7tqfStg4XkwRdDlNr3kPfEb+x6WZQD1m/7qyZdX2o5TG4kOzoUF9epjZJM0
 Oh2vv3sYbS0guwc7/p+uiIDgJGvGAO7g385hPiElZHXGHibsJX474RoMyH8MAVv+OiPD+HHfMqL
 3oYu6ukqJ51bhXSXshCbNKpB3PpV69CzTuUMEoQUf6K3DwC55S5nkdHm4eWfy/IGDlud+fwam1M
 ArmuW79xkwZBR2WePhsPIOv8OXxl2LpFefzHpSIh+AkPqTlggEs1LtvuNcyQR1TwLjPPBCqXTUp
 2tumm5f+1GFke2hQdodxzTb8Gg7GCoKCB1SutHi5qgrYfUZk/fZ/TC1d6AqPolrHBuAXUNpfSLy
 zybdryvJqwin16+b9eg==
X-Authority-Analysis: v=2.4 cv=epLvCIpX c=1 sm=1 tr=0 ts=6a296a02 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=TjGFBzvoXwbZ9D7WYpMA:9
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100131

On 6/9/26 4:14 PM, Stephan Gerhold wrote:
> gcc_apss_axi_clk specifies a halt_reg of 0x4601c, but this is already used
> by gcc_apss_ahb_clk. The correct value according to the downstream driver
> is 0x46020.
> 
> Cc: stable@vger.kernel.org
> Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
