Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF3F328B47
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 09:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763458781; cv=none; b=lzA6Y2hLdqhQcy1pI8cfmtY7BK48W0rt3jEyf/+6AgxflWOlt20y2BX6PZYbJtkSNcgDOL+sIvImV47mNdqG+EdVa0WAAk/0XgaYftQJJK+QqQyrnO29zEQjSeVlDRxZtuYbYodrRTjRe6fvrYlRd2CFh+uVLjTquQ3wTmDcDCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763458781; c=relaxed/simple;
	bh=vd/DI9skSNB82yPFAdSPCwHHwe2VIJuiiIiMibHoT+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mmLscD5RFyEAWTb29BapWYBgGan/bMy3qtq/NaeshntZJ+oZUTO3fspTMsweMh3MgCW8fYP+Cm+P/K0nHN6Ycb/mPZjH5xtttW8RxDPvT5hzIpVpIkdesbMHI2wGfIS4M9bofi8FlwJfV4gh6mklSyqIGQdhB2T20Z3OsBqNnOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=optTUD5u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a4/D9eqx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="optTUD5u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a4/D9eqx"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI6Vp4R623768
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 09:39:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HVcRIuuX0FpVDOFtYtFkpiBjrnGWOGLMg+1zUM6LV10=; b=optTUD5uLQo4954s
	h4WNQDLJ70ez23SmbOUg1xqddZz1GDn6cENGgETYvufXI4JyFoO6OeiheIe1gc4k
	tv9Bk0I7hNPjvSt7EQmYqiNmmCwLj1CTqf+HgaDK9EUTqod4Vj8ibtpIlvXqT6q/
	aAqhglKmnZQ722YuaAMVmC9TBef/COw2sJqYJNVqOq/wbFCcetz+Rqj2Y4FkJkw+
	+Z2TX3WvIQqGPiVYGMTHj753rcYBpZU6+eeJlzcwCYwHzp+g3pSKcR235t+ChqG5
	bR60PmWG24MHgWOOOme6i0qckgHAJbf1kSs428NK8b9Vxye1a7RV3H2dGl6q7ytn
	vauBwg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agahf9xxf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 09:39:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b227a71fc6so174079585a.0
        for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 01:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763458778; x=1764063578; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HVcRIuuX0FpVDOFtYtFkpiBjrnGWOGLMg+1zUM6LV10=;
        b=a4/D9eqxiPsX/1axu2lJfzJJwY0+76zPIBy4SAR+WPpGzMpH3trBUWSxrg6OlqjBN9
         LgxLUzOKy0132zYpNuwv6E4IX7a26x+bf2KURJ7+Yen9rm7Xc7GsdaZZWHG8onSGb7b4
         iNBq6iqThjEbscfbXv+RJcRL/C/ynRqxMlv2K/yM7d/kW+QgL054yBWv5eYtTQQkS+Hl
         e19iL/ybESrt0HHHYX5qPRvqRhxsNEOWV/DCfio9YdZPOTy0UZpC/HK21b29xJIPFfwW
         NfYLy+Hx07AqQ5DzpMfgdnp06Jy/4QxLhqwszz8SsLeeF3pipvoUbKzKScvl8gy0BAwx
         qEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763458778; x=1764063578;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HVcRIuuX0FpVDOFtYtFkpiBjrnGWOGLMg+1zUM6LV10=;
        b=f1A91pwljVsuMbYJ/te12YU11hmxzWSiSwGKGnJptNJwJD7MQSiRoT15iIFrdaB1k1
         WY8w1kIgD5+ZFeRsxCzWEiRhOC4hJTNGQHYE/4ul9SrwAc9MsuzrUdELVt184+33/iZ9
         yRtsyGrsAbrAbbe+oII1ZM1aOo8XDCtgpFUL84pUNyeH6+OGealq89APxtjaQ85mvpdO
         UyJUG61bh1MgE0ogq9iNM5J+iTTQ62i6ne55BMhx1krgP4SGYT3SowqUCdlA094RNnhW
         EhUaZcZjh2rB1USkRgOWVeuROIrM5fJnLRqMyPxjEW3nCD4LYSIa4TL10cm6OsZ3/u5y
         2RQA==
X-Forwarded-Encrypted: i=1; AJvYcCX4d40Iop03nuOyHCg96oDZfhAOn2sYTngwvsK4VbNsX4qR1uhJeTjX2rzMCxOn7PHc34updxwTwJQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvDpPHG0umsXAdmVAPHMZihSViTTl87zkI5HNbFXcYu7UN66xR
	cICU4iS/LGt/W978WO7l1ysPPBxSYARXkNkolVYS99ZzT3xziGmEPIlbf6g+RJySj2QzLYBjRIj
	gyMW9TqI9HtAq+XTAsl9wwIBM6ICHFAVyQ0HFR26kMmLESzbj0Uk2peh2ERu5gQo=
X-Gm-Gg: ASbGnct2WM5zcN1lS8ZXVss/M4eugJQxVayS317SNb5dHlSHUK4EzFQ+/1OF4KeVynQ
	MTA+Tzfh3FdKzoqpEtBYJ4iW/0jZ9Jaeee8XXD+Ykq6kDWCthOiq7CTzMjkh8UHaZbQFDIj9Bc2
	TF+KNHe3W+5qkm45WokFptlmv3/LNixXC8p5M8oSpMTLKAy9v1esuhp02nYt0rk9YgvfL2XboEG
	Srd63ZZbkVtAayjuveSwLChYQj5CYMnwjzW1QLpTRdRNHDsoKP1b4jMl4jT/wuhgeyCu0Jn8qy1
	YRPU+qE1/fMhitgQne4yQwBOtN5ldkKiT+SSy/G/LdbZieNMlD5Av6SUnE2d2kHExUtfbETIhh0
	F08J19P5hb9QKroCmPWu0TeDsig7GgzRBF/fc88/7EQxAkP5AU+dIUpaL+qK9RljCCIw=
X-Received: by 2002:a05:620a:4410:b0:8a4:5856:e106 with SMTP id af79cd13be357-8b2c31314c9mr1296571885a.2.1763458777961;
        Tue, 18 Nov 2025 01:39:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGl6wK3vcB25z2nW8q84y1SB4kZapcOKClEiu4eFI86WrG0bsKvTmyoNea89AmtzxyNgBqYSw==
X-Received: by 2002:a05:620a:4410:b0:8a4:5856:e106 with SMTP id af79cd13be357-8b2c31314c9mr1296570385a.2.1763458777528;
        Tue, 18 Nov 2025 01:39:37 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734e9e0f20sm1327239366b.0.2025.11.18.01.39.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 01:39:36 -0800 (PST)
Message-ID: <c52b0ff7-6be4-4ae3-bad9-aa379b34715b@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 10:39:34 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] clk: qcom: ecpricc-qdu100: Add mem_enable_mask to
 the clock memory branch
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20251118-sm8750-videocc-v2-v4-0-049882a70c9f@oss.qualcomm.com>
 <20251118-sm8750-videocc-v2-v4-2-049882a70c9f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251118-sm8750-videocc-v2-v4-2-049882a70c9f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA3NiBTYWx0ZWRfXzA2zw9OQPMjz
 HUHVD2q17GiOuU3TRY2ObfGgHtatwq2Hyr5XEYIaNahmiCNdg5CxyEzucjEp7l5NqVII59cZYKA
 mHvwVjP9aR4hDo2Bo5o8Ey9L8Tqdx6TvXKuc+AcOVHUeryOJdLCE8tk2zW8FJCXPHhQEQdayRzh
 zZGVRhNP/p3XWtuJTBBrUDmjR1UlEfapj9viVRLEf7Ji00PaGmF2Mdn/gwofUv42Ovml5W3tBD1
 zK/ibl8Pq3Tpau8wxPQVpUFYwAc5/oGNV3k34/jkE4ldbFNnwYd8LFz/PizZ/H04yTubwllEdey
 0e8sB/ZQv2s7SRACOz6SQ2u0WMqoE+Klj8E8Wg+4uBW8mNbYTLPjYlFNWp6sMrbB1+GbXK9USId
 Y6oax06IEiQJ4fOzQdorzAsBnkj+fA==
X-Authority-Analysis: v=2.4 cv=RpTI7SmK c=1 sm=1 tr=0 ts=691c3eda cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=BshmeMc5q61FwYeMDCgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: fmSU0m8TALqaxLm-pqZ_-njdAfEovXs8
X-Proofpoint-GUID: fmSU0m8TALqaxLm-pqZ_-njdAfEovXs8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180076

On 11/18/25 8:17 AM, Taniya Das wrote:
> The ECPRI clock controller’s mem_ops clocks used the mem_enable_ack_mask
> directly for both setting and polling.
> Add the newly introduced 'mem_enable_mask' to the memory control branch
> clocks of ECPRI clock controller to align to the new mem_ops handling.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
