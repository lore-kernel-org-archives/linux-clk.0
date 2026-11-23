Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795471740;
	b=Z10aHnMoE73l66ldBy4KL6dmsWyOzXi/Pne8eiDfIK5W3o3Q/gi3DDyL2RhKFCRvjs3a
	 MBQAJcH8XhHSU1uh28qgK5c4Td+E+G4TUP2SHGRFLOywkD3pgBKCO9YSkjJZnQhwjO2Rf
	 xGoO2Mp2JeeKq8ss3ZlMcpQvv0fTtem1+cgQQLXA7B59oMz5LQHyj0qJo4VHuuzCuuVX0
	 7dx1nNFxQNkwGv4zW0gY3T1Yu7D5cVa+8VAjzXYVWQykAYdgrg7zadjgRmSSY75/224v6
	 DTqnq+/NNbCfXkJGyNTWePvrtp4ybkRxG2w5dJ2lhZQdy0kVAxU+wAUyzbRavoSkbig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471740;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jO0jfM6XRLgagT8aMcVQmvm0DCRJ2+e7pbdmqZkT1eE=;
	b=mAQAXx9ksHL3LmCLdQyPTz1Gp1B3DwYg0sD3Lk/HdYGpQzyV/+ZKETnkWEXlGMR1zFjL
	 EoqGf0gfoPwlKh7bAUlpcdlYBZ5gcpiHk8Lqd2huekOwxipmwXIPO2vLzIAQ/gpC30N3d
	 b/1gEztt65Fx3LJUq1IM1oqnf/iL7LKkOLoH14mnYO4aDCuvykhmuETUEemWV85rpFMuo
	 D8C5d12g7RImQWSZQt6UtvjJwJRpymnUITfxdONBSNM3vcpzR7XUUqCvtouLy4/CjYk16
	 6mwCgz3/ksj8iqeM6cqQs0kLTY64ZWMWtFOF+5WJmktT5Sbi3qkg0F2sRnyCkH+hukA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S5fen8zl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A4YfQGzt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2A7606A31E
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 22:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D2A7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S5fen8zl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A4YfQGzt
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJueaR2827540
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 22:08:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jO0jfM6XRLgagT8aMcVQmvm0DCRJ2+e7pbdmqZkT1eE=; b=S5fen8zlThJ6oL5v
	9XBb0bL0KtRCHm2GWxYG65Ef8xgZXSabe55j7G517UjzDE4GwEwHVTg9NuooKp2A
	cCfM+ywFd8syQ+XDtTJnvgMGWfIem3WDxbUWsajAJAvUAuj79copV80rurNKFavT
	YE3/pfA/DzJ40PPzbqGWEBQXRoKcsXKCZLfZYLNE3Y3Ebdkc1iqR+Hh3+rZGpeS6
	fxqlNHkwgUGFgD7/9Aaub8KdNk08GrMxMXj8tchQsnt0LtuJqbGF/yVmeGxCMAMa
	SihGfuybYwqntjlPuXjOrZLb6dVRigcmNMhKlM3keJFWv94c/zBohRAl3dYUyLzn
	ObNeDw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx3uw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 22:08:59 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9213659143bso12192836d6.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 14:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795471739; x=1796076539; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jO0jfM6XRLgagT8aMcVQmvm0DCRJ2+e7pbdmqZkT1eE=;
        b=A4YfQGzttkYmEgzCKJXXcVvapu0i4W80QgJLO/Tg0X54JUghFuPBnSmtxjDMSQkgGP
         Bltb9TEk0CZk96v2E+9z9HAH8WGcs2m/HF03hIR9lqZJVC+Zy4KDv2bgM2U/rHZP5q6I
         Ly+ybfvYxsQZgFfqL+Aum8qp0nEbVM7erDX+4VoQNA1mVvf+eQz12kb0Zf4u5MAlzHZn
         au/LHq2s9HbUqaafXjVj3QGFzHLbsvSaQj59LegxSa7ZduYOi296sUVxPoYdGHW0hyK0
         K6zmlzR9LppYCghC/K8uqqqZPD0jmia5OYVQcrIUsr5s4b/azcyeYsYbAPtR7i8guIqn
         JL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795471739; x=1796076539;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jO0jfM6XRLgagT8aMcVQmvm0DCRJ2+e7pbdmqZkT1eE=;
        b=gcc1U0+lG4kMT2LIFmgcFAa+ZH4RzyGIcQOq3mVJeDNlzRLRBQKmAFk9vRHtvtbg4l
         44Tg8LoCfjVNWFocjKPK1uKesYP6KHVoqXRx+vxkl5CwGgbSjXCictIPSVO53Pomj5q3
         Q1m7p4wUhBeLmQT53sEd5hsPc6i7nI/Co0UeAcATyY/w2GJjDOOm+/a5JNptc8HzYFVv
         EuZPq0WM39duawP3Fi8PN02q6SVJfvpux/osF6I8eoL+8KPJ1gbFdmkOq1DhQvUxLjwh
         sZlPlHefEnvP14Tguclx2vM99XCmowFI0H0WFL0CmZ98jpGFoGqd0YksHweWGCUMRfyS
         q3Sw==
X-Forwarded-Encrypted: i=1; AL+hErHZmFo3lCtF9C9rfdyzHJ32ZEJOoO1qUKBjpildE8EhQB/8q66SYyp9k2RSMbFkvBhI5y1DrYKJedI=@vger.kernel.org
X-Gm-Message-State: APuU4Z94yrbzDDADxPyAsZZYNEdaLhYtk0dSTpj0pWSFyhRsF1y+aiE2
	qgjCmSLgcy2SLcGgWB5j42KKXFtio5fz+bet+MvTCAw66Dv4yg6Fonj5Lgmb8v4zAnB/lZ6nj6P
	StoX2bsiwVvslm1+hsBhoMRot8uv9fBquJXN9TIyO8/dL8O/Mkxjf59rOlAaZcuE=
X-Gm-Gg: AZFdTZcz7+y0fpQTOHHXtL32RBmfwod1dHrTwn2x3W+rzkK2mE1CVa4nuUHGZO95Tqh
	iGvhFr9zLg60VwzGqvau4tAK02UWnIhjOZ6xseCHrhik50b0aafq0JsePWlIeO9cAryrnKCkQhm
	yEJ+pUCXP8FgAa+zPCyhtX/syxYcH1VQOuqLFQKA/qizQSP+kcCRY+TzeB3q8x9u0jD/kHlM3Ec
	pExZr1/Rm0wYzHpcCHm/Zqs8JXZ4PIvdL/7G6mKo6fDBDKCHjKF6a3IX+CO/gM3bCpa5GpyLGhS
	sMh5KADtZYRjmv2qNNnHhekz9EF9m83Mhlz7/OEudI22U7DEw7O9N6izNn6vSB0H1iC/tgBo6tm
	xCir1OSDZckNBEL3dqVFYOiSnNqazB36GE4bQcz8ZAj6qgN/Hy+IpDQoScOo2roaJaDhNDoOpkE
	Q=
X-Received: by 2002:a05:620a:2585:b0:949:727a:44e8 with SMTP id af79cd13be357-949ba9e6390mr2297185985a.35.1795471738549;
        Mon, 23 Nov 2026 14:08:58 -0800 (PST)
X-Received: by 2002:a05:620a:2585:b0:949:727a:44e8 with SMTP id af79cd13be357-949ba9e6390mr2297181685a.35.1795471738048;
        Mon, 23 Nov 2026 14:08:58 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm561786005e9.13.2026.11.23.14.08.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 14:08:57 -0800 (PST)
Message-ID: <c8e53787-adee-4fe6-8a8c-66fab28bbedc@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 23:08:55 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: qcom: qcom,ids: Remove unneeded ID
 constants
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
 <20261122-qcom-socinfo-id-dt-bindings-v1-2-eeee0ffa25da@oss.qualcomm.com>
 <c4509c17-2c67-4f76-899d-548edc47069c@oss.qualcomm.com>
 <b10fa9da-39e1-4bfe-8c09-cc1d5cc007f4@oss.qualcomm.com>
 <786351d0-c7a6-4ebe-bae3-0c81ec20b833@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <786351d0-c7a6-4ebe-bae3-0c81ec20b833@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b04b97b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=-8XAt7TJbku-FhjSX4IA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: eOQbHR5s2ls-LemzwfnUM1G99yYh_9mC
X-Proofpoint-GUID: eOQbHR5s2ls-LemzwfnUM1G99yYh_9mC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4OCBTYWx0ZWRfXw6a3WRugIXFc
 eLpt+jDM/6nCuZRr3x5ioegWWifv3y1aoQXXvTzoXjTG+dvcZfAVw2/Mb7s9l5I4pAjjj0QgHvN
 cKg6MAPoz0vjZNHiA0QwO/HMHUbG1kQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4OCBTYWx0ZWRfX/DDDI7eutyKS
 pKIdIq3iF1wFz859J9MvksBfbpKsFN43o8RErZ+0i9yqWkjn1FoARS3dXQlvrI5F35Vp4mWXG+C
 o7yUwHpiE7yj8s/IDpTLsySe13jIY0dzklsChp9G5pKF9628f8pqx21yREsWTQKmeEa36yTIt+y
 Ts1HD/wsgcKKLmHpwl3GOaNXV/iBEXtQVDnT3wr16h8qZ9JOJnq4lNJH7uANzOCHKOztutXUgKq
 uSJfbITRdq51ikhgR0sg9eA3VCwpXNyLJJO5CL4/tFxACxtliNoNKfh2fQJxYCmG51CO9GGuebl
 xifDCDnwHY4g6565zQ2kFf+/NPic+VA0uPVx67Om9KJn9YBWsas4BnSkYsEUl1U4v6R2eBctc3X
 cT9Ss9uZ+KYq2Lhr6AVvEFMO3GWt71Ly/ohiJtRfMf69HN2cj+Um8nNgE/G8UxM5L9o7h3PRFL0
 KyUnEFduydX6MvV806A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230088

On 23/11/2026 20:06, Konrad Dybcio wrote:
> On 11/23/26 4:22 PM, Krzysztof Kozlowski wrote:
>> On 23/11/2026 16:17, Konrad Dybcio wrote:
>>> On 11/22/26 6:46 PM, Krzysztof Kozlowski wrote:
>>>> The IDs of newer Qualcomm SoCs, as reported by hardware or firmware, are
>>>> currently used only in the socinfo.c driver.  There should no and there
>>>> is no in-tree DTS user of these, so none of these constants are really
>>>> proper Devicetree ABI.  IDs of older SoCs were being used in DTS, thus
>>>> that part matches the concept behind DT bindings.
>>>>
>>>> Driver have local copy of these defines, thus these can be dropped.
>>>> This has no impact on in-tree ABI, but any outside users would be
>>>> affected.
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>> ---
>>>
>>> I think we can move it altogether, to prevent a situation where one has
>>
>> We cannot move all, because some are actual ABI. I could try to leave
>> these ones only, but that's a bit too much work, IMO, that's why I cut
>> everything at ~450 value of ID.
> 
> If you mean ABI as in "used in DTS", I don't think that's quite ABI
> (again, looking at the glymur-ipcc.h case)


True, not ABI in meaning something agreed between DTS and driver, but
the values are used by bootloader, DTS and the driver, so I would just
leave them as is. I rather care about not growing this for newer platforms.


Best regards,
Krzysztof
