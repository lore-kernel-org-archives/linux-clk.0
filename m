Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD6D391511
	for <linux-clk@vger.kernel.org>; Tue,  3 Mar 2026 10:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772532354; cv=none; b=UBhVbk/emx1bagxQNUqol2NbsFGCx1A1URR74zQCDus9fkSqNFaJ9K8OeJaM83x8iUGrUL/IZtsqwqLWSaAnYMGKOneSYpxe49FFZjm+GDC3OJvzPUWwfQzY6Hhaoo4dL6m9PCEq/48M/T5L7zP/PpOIJh6tvGAkDiplINwMGT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772532354; c=relaxed/simple;
	bh=qFLBQkKsWK/veah8i1NBDabVvLBhw4dsDGNp0Ie0vVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VvgHxxf3gljps0qXEqN2JCYm1/bZd1b8Yp2feDsV7R1jQ3XSdW9+Sq+lgb8jP/RL8qu2rRRxkUvsGmkzXCahqHHna+rJTk0Aa9UUwU2GngA0P+nFz+bSyM/MZG3hvK4aR9NP+zqaovDXcFZO518NjayY2vh04v4+PoEimMAdnDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YZkoXlln; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dY93DGbS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YZkoXlln";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dY93DGbS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239mn5K3995369
	for <linux-clk@vger.kernel.org>; Tue, 3 Mar 2026 10:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xTHLd7VzmLBMLqMp66mPycX9lu/jqK94ttS1qfwmJjA=; b=YZkoXllnrMzRzKe1
	beKnK5Gd0EvrrqWfvm0PAPBGHfgmEGLr/aPRwFwIESsT55IgQm4LSiuEQEKIYW8L
	ITUSa8UyAYf8Xb9zieBOttcREILawUE0TzB4maidd+FSNkrljppGIUFra+hVceqN
	T0RsZBPFwlGwwK577Hd6Pma8JEZ5NeKpuAkjL2RDY0YppgChpuooD3dhjmNp2NmC
	Podx+5r+zZA5aHg4gpvEgvUYNkmSQofWnst+jIw1r275selpLQo4/u56o8QOs7Hc
	/jHnQ6ZtD0BxsrXxSbgQCM59k9HO557uxrQg7hIiBnfCv9uPLwc53RFAAKsG/Kmt
	6vc6tA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cns5fs113-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 03 Mar 2026 10:05:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb5a76f13eso347580485a.2
        for <linux-clk@vger.kernel.org>; Tue, 03 Mar 2026 02:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772532351; x=1773137151; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xTHLd7VzmLBMLqMp66mPycX9lu/jqK94ttS1qfwmJjA=;
        b=dY93DGbSVRpOdfnTmGs2lX+t2wg9cfAnhmu4cm6NQGhzIO69D2RCITpM2OlVaF7IYS
         Evaz/9bKrNY0kViukv9ZEXt0+n+VW2mGpGUjUHRFjZTrodeDsqyJKn31gFbPSA8xJ02s
         AVpAnVNy9BycvMYLVrcODutiQ4NnonipMRl9iW3W0CWjQUboqs6bgsTY1giiQ8htsJWP
         NJGK7jjx2oku/sOJkaGbL4Wkfei8kZIKecgh7TJaSszfag2CMY42+Fljr9gBiEqOfX/0
         b/AYv/uwSLj3Eyyz5gxy7a7UjZMl9w3EDZMWn7PEEAp3BC3xu36MDEknJrYIWrB29SmV
         kTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772532351; x=1773137151;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xTHLd7VzmLBMLqMp66mPycX9lu/jqK94ttS1qfwmJjA=;
        b=Rubma8R4gUfQsPh7qSpNkh2JFfNG8i7bAH3IwOSl+cuSyiAzTVVwpz8WzZJytIPSbg
         ekkMfOAZenodH3ImiQQZm/ZeXCtrPEZc4e++JUR0l2AGn2hdifNY1W8c1PPobC7rtZEx
         +5ZWII1IHroH6qADOcxdPIMosVZURPUo8UUWxdwj4b3q0OhDlFyCqwsUUDf230+kyVFy
         tQS0M6rxcySt7aqplSSkk4YasMYHM2+C5Ix7PQs5s/L6wppNVljZDTQUohG7C7NSCuYz
         wKhpdmCyCUTb45C6nHkATnjB9UCZBcG+hfN8w2RgDDIaJwMI0SRohMjGgXrwhgn8cBVc
         FJOw==
X-Forwarded-Encrypted: i=1; AJvYcCV1vwNaLXC8Wsy9w/rrzUsnnqHZBOq9wVbpWMqHH1KLrXhccp85fsV+H3xCJoYN4zWdUKRfCFJp+cs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh46DFxr5IgYGPXeABt+8b/K+rG2+yM1T2W59kY8huVV6ZvRcj
	N3KWvkenaBJQbKU6mMCic5fGFhlcSChUDpVTFmAggZAHNEihXLzoD7B9vw3KMC6LMJ7mmCS72gp
	LJIQuiB99atclttZMvtt36yHmCxHeKiwEbcB1zt3BrUX0wZJjN9cdiFgMiWFdNSA=
X-Gm-Gg: ATEYQzwiHkRqQYyIEQspbts3N1S7Oa/p3gW33pULbyaleObN8UyPFxlpUqQ7PS+zr2M
	RjcBzO+0rsiIYSSz86JfkvUz5LStV4uKNQZS3G3B0sUWqdIaJUE3H65Q/oMWFAWd26s+zT2l5BV
	FgFj4g8EwrWsQjC28QCp9Vj0bvEf/fdwQqkDJr0Vm/Eek+HhlFa76eYFB/xKaRWBmYaBjCxFESs
	9NsrASF4tFQGPM4h5FsXP0i8jJ9oNvTRLduwllpQyYMJ6fneeRH9Do9eAPmZrcKs/yCasKmpjQi
	Eh1HMV2VNy+9/0GK0BiYKkJYjx1IXlqzKq48tt4DUEmyXDYuVaQIsJZUMxpkdPoSaOoO6mJ+J6/
	6wAHjyS3/6zEk0VnPExg66BaHHfMV+jj4y3aMqHi0OeZol9uznJxmP4VjFWsSiNoMFqFFLCFIIP
	q7o/s=
X-Received: by 2002:a05:620a:280d:b0:8b2:ec2f:cb3d with SMTP id af79cd13be357-8cbc8e970f7mr1346491785a.10.1772532350976;
        Tue, 03 Mar 2026 02:05:50 -0800 (PST)
X-Received: by 2002:a05:620a:280d:b0:8b2:ec2f:cb3d with SMTP id af79cd13be357-8cbc8e970f7mr1346489985a.10.1772532350510;
        Tue, 03 Mar 2026 02:05:50 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabd466d7sm3999861a12.13.2026.03.03.02.05.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 02:05:50 -0800 (PST)
Message-ID: <382725b5-1e72-44b2-b9ae-38aea1f7a976@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 11:05:46 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/18] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-8-95517393bcb2@linaro.org>
 <4fab8e64-8251-4424-974c-19434ee04c76@oss.qualcomm.com>
 <9ff1645f-b2c9-4c1a-ae2d-96af416b08d9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9ff1645f-b2c9-4c1a-ae2d-96af416b08d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Pv2ergM3 c=1 sm=1 tr=0 ts=69a6b280 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=tQIHczrEV2zaa04Eb40A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: PTirvEQLvuY-H8zDMOjK-Kfow4HnaSDH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA3NiBTYWx0ZWRfX1+A9LPqzM6+c
 oMh+shOb7HBL71Ps08QgrBwmMKhdsZwzFXRhbMndV9nbwURK1fGTVk72uJG2QNgacyouY3khM1v
 BrRixpkvkD5KvcnrCQxBNrAEmuWlhqC8S7UBdCQiT8kuRFh7oBC4r7gD6uCxC47OsHhUYT8lWKO
 +U4FdLpgVs+t2t1S8UjUYxtPNdwz0pWTYIJaUZ/U5YjUvhYDsgKIKXsm8Te9ALOEDA0ga4sX5Qj
 W6fI5lDmoBzDYx0B3bzBIH5o5CBMChF5gExFseRkyXDwHkCMrBo+IowPCA7dini/8BaBCQvw7f6
 uPHuejDNKUBisBN6L8ol9nSk8lgnVTeIU3zygGOjYCZmEGIvfWwVRtBDKdJYRRFNiqX1PDJ7Tjs
 ooD9rQL5yHz6l5MKn8g6KHrAlSx2K6hyqxlKp2HFoWn5Xc1HPtGMB9y0vMkWpMLZNA7f4ZKcBvE
 sfnzGiz+SS1GCxzwDRA==
X-Proofpoint-GUID: PTirvEQLvuY-H8zDMOjK-Kfow4HnaSDH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030076

On 3/3/26 6:56 AM, Taniya Das wrote:
> 
>>>  
>>> +
>>> +		camcc: clock-controller@ade0000 {
>>> +			compatible = "qcom,x1e80100-camcc";
>>> +			reg = <0 0x0ade0000 0 0x20000>;
>>> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
>>> +				 <&bi_tcxo_div2>,
>>> +				 <&bi_tcxo_ao_div2>,
>>> +				 <&sleep_clk>;
>>> +			power-domains = <&rpmhpd RPMHPD_MXC>,
>>> +					<&rpmhpd RPMHPD_MMCX>;
>>> +			required-opps = <&rpmhpd_opp_low_svs>,
>>> +					<&rpmhpd_opp_low_svs>;
>>
>> Taniya, in light of the recent discoveries on other platforms, does x1
>> need a performance vote on MXA here?
> 
> Konrad, MxA is always ON, and with the current clock configuration, a
> performance vote isn’t required because the clock controller currently
> votes only for the minimum level.

Yes, it's on, however I'm asking whether it needs to be at any specific
higher OPP as the clocks are scaled to higher rates.

In particular, PLL2 and the MCLK RCGs/branches have *some* references
to MXA, yet their FMAX is possible @ LOWSVS_D1, so it may be that we
*effectively* don't need any.

Konrad
