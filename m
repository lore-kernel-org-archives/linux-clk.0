Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF703BD641
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 11:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777030820; cv=none; b=kCrufMkdA9cp2Wfplwf0hjJ+ZN61HbrCBy/pHmkfKk6vu7qg5aUFnBXN1vm0SkbdSFQnktIxWaCKpIzAX40ackwQfL/sa6JcO6YRhjGDPW2+6HDq201Gx2KSpoim/VfyjSR56lvAf5LZIgPT40JMx6Jv1f0PGJw8pgIArQ7cQ1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777030820; c=relaxed/simple;
	bh=zAGY6O2hizEENAg918dpM+0m5lOBf40PuOwM/h9En8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FUto+nZiDmLvzHWkjKAVaCAGp1y4WyKbmiva9fddO5eVp3xx7j2iiR1SLIYEJdJl4dSfOkQmNR2D0lpUjPMrBgPTCfSdnIswx7FEs6cq0VozHY+Ej/a+JfTyhibvUfgm6PmCFMEYwc7sySJWi/VcYhB7Blym+JBd2qi4A8ZdbAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kMcXYtU2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QeqYvANB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kMcXYtU2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QeqYvANB"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O7Z2Se4167478
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 11:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LPbX4HtvAPXyPhYOHpIX5qSzN0AjUwOwX5mxwxSzf6U=; b=kMcXYtU2JntMEEVO
	vzxBHYitkpG0WikSf8OZ/TXJl6KZ9jjhaRbOODsSjyJlXFlG48/rS7Fck1x647fv
	fwsblb0RLUjoQCY8RhGr0osUsuf/pLR99qOYB4djWLOcNP0nvtWjbrqy7CRL2deZ
	F+BD0eLyge+FHFd2zkaH9rWqbHTslKQCSjtBYxPumXsqXZfrgrgyqJPai1pQW/y1
	3OpzEDSGU4LAVNIih+bGsmC/L4zF46teE5m/SdYZYoOgwzTROGYXJf3Do9VDHLLh
	hw8vzazFn576CfZd7gbGM995J1swZI4kHpSc61GSMZn0jjHZYcEGpzfnJ/7yRiM8
	W4352w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr48n13yb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 11:40:18 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8b047093195so14484706d6.3
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 04:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777030817; x=1777635617; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LPbX4HtvAPXyPhYOHpIX5qSzN0AjUwOwX5mxwxSzf6U=;
        b=QeqYvANBq0jm4eop6FBI9KAIOA3FeG8pfpFRMOHQSOUmOB3de0u8SxrKs510fA2gRB
         UUWp3I64KpgRsSnpN7mnwpamQSpd0qmK7bZz5efDVyO9BPHDCLGs1UkO+l5SAUWZnOFd
         ytZA+nFZHVTOJR4GrQ/L8FKLmSKlc2DXXSsY91aVe7SylXOMknSxCcB5BzOafH64IpXl
         Fg7ZVaqI6Z3eLtiuA8XX+a3JogIEvIpIQJCn8iOhMcyHudyRPlGNznXeJwIBi7RDTwVE
         jwMkpN3k/Zp6wR3oQkyO5fGbcr4G5G32gU9TWQylwba5CRDaSJX1k+xOYLYy6Spqpgyg
         6p9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777030817; x=1777635617;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LPbX4HtvAPXyPhYOHpIX5qSzN0AjUwOwX5mxwxSzf6U=;
        b=hqYxKmVmY44DUowKNZnVtaPWw1CXIKoaIgY9IsXXzxkm76aLdDXBv+eg+My+ugpawq
         l8PgFQdvJlHhj6hjORt25pxmZhhIF1F4bzeC2SegOMv+q6dFNhUJsWdc3T34pO/lKQFB
         bWd2mueeVmlFHCn0PFAy7p+V5tVmpRieE2H6sirshPjrS03UYY6AO6aziY/M+EjQni/F
         cEbqyYj8I+G0iufbHfh0p+0f08fI8bWGo0ss9F5T5YvSPbjJ3lv0x5xDmYVLeFZSxPHB
         b4IaTByV1rhxZwI4vafdgJE56SjEM7gatdsukvNJfIyi1YQpoZTF7QBGR9f3yYnyyR/9
         u7Tw==
X-Forwarded-Encrypted: i=1; AFNElJ+mKbleuqo8gdD4vZmivPFzVqAZpPHtIk3xqp8T29OA6+v8Jsv16y3ab9fGNQ98rZ8uEaNZExSADy0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9AUZmBl7eybtYg1s/FETqnlim53DAY/S2DxoWVehEwrbpXumM
	IhFykYuy5VTTDRHvmS1+h2bexmMnBNphAQZup0LWjLHLpku8Wrcpv/dTsdS3dYtGGAbA/khmNHn
	2SK2LxfSJo0qm9Lcce9d+59vSSxiy1OnJT7R6dlcTO6Pi7R2t/vWT4n5NuF2rMd4=
X-Gm-Gg: AeBDietVDVG0O4b6M2WZ3MSEnA7d+oXetQRXRHHuco3sPyiqRNMgGFGbE9zwCEblQKo
	9FTKWcu/OnqFiXl9wKg++Hu43B7mIdLvUAKZZU2sjxAc3tD11M95DPjxQfLbm3SQWuwuwHjAWUP
	z8ULNY7SWOxrxmdOr3LLFknlB2+AxvN7/7xIWwfJQ03wbQWwVzMSLee/lzyS7fWVB+uONP84CPr
	bBqLZViEmBv7WgJ06uxYDEersex3gR+D6DznqKB2cFMnvJeRiDCwmopRSRcApKdKviWNxbbj/Y1
	86N7wYZ4hrRqB2VcTcW8C8sSMq6UQ+XETY7M4n5GQAiA2qmPC8OJSxsiv5X/vsbhyNpudA3NSjv
	azI5aULKqGIQn0K6/oQYx/7IgzfviTbztHi1+FT65Jaf/ry8WiUE1DKQqAujoZrQGNBVpvsAQwb
	6QmlwiX1GFDqaJEQ==
X-Received: by 2002:a05:6214:411a:b0:8ac:a91c:c9c with SMTP id 6a1803df08f44-8b0281fe001mr342499346d6.7.1777030817368;
        Fri, 24 Apr 2026 04:40:17 -0700 (PDT)
X-Received: by 2002:a05:6214:411a:b0:8ac:a91c:c9c with SMTP id 6a1803df08f44-8b0281fe001mr342498976d6.7.1777030816944;
        Fri, 24 Apr 2026 04:40:16 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7dfesm5896580e87.71.2026.04.24.04.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 04:40:16 -0700 (PDT)
Message-ID: <b0690213-da71-4b8c-bab8-8581fc3d0211@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 13:40:12 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] clk: qcom: gpucc: Add GPU Clock Controller driver
 for Eliza
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
 <20260409-eliza_mm_cc_v2-v2-5-bc0c6dd77bc5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260409-eliza_mm_cc_v2-v2-5-bc0c6dd77bc5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _9kp1gI3wef-NkA0zEaN2WF1kRFD36QO
X-Authority-Analysis: v=2.4 cv=VOjtWdPX c=1 sm=1 tr=0 ts=69eb56a2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=whjPl3NbLinN2m9j5McA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: _9kp1gI3wef-NkA0zEaN2WF1kRFD36QO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExMSBTYWx0ZWRfX7SZocjdf29EC
 aAio2ZQ6JF3s421mSAVwqBbj/1Uj4fTRqO+d8V/qebe6XTa12CYQ9QleeeJzI/v1eW86zwuNf6G
 FJBNC24J4Q8GWheJGbmRRos3Eug4Ivwjji/CIYTk7/+bAZol/a2+qIW80XvZawvdLZvtRn0oUPu
 Vx9gdxS1vtjQGz9Eu/DgcB45kGcFv+tlJYt+mS/V9xFqNLII3Wv+JyJehxEHBgBVdHJwcZ/Zywt
 l1UHPqQNybAN9hQDS2e9rBXHml7mtPqi/+iwvHeS5lZvV6L18PKURYlKiVJT/8IgHUm7pSn0juB
 UWWtU3x+socvk+F+kD1E8LuKD7HMtkPEvvuGj+57zew88jmxFZzmZfNGg08ieE1Yd9c60E6K+HF
 hwoQ7lE/twemLZZd2kgsBSFktG5KWgYYP14Q+/5Vxb0Ff2ahn3NToA91/YIsKqAPwZHdNdcTk/l
 YwLGGha4dix70gJLx+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240111

On 4/9/26 8:10 PM, Taniya Das wrote:
> Add Graphics Clock Controller (GPUCC) support for Eliza platform.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
