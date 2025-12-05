Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E19C31A046
	for <linux-clk@vger.kernel.org>; Fri,  5 Dec 2025 12:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764936734; cv=none; b=cd0EMhZ4fNX+Pw7PaBR6n7xcyoXHv/127qY+98yrw/khr3G6Rnt2kwRtMxL20Hs9GMtvZKLnBkOaJJZDWBFDTcVzV2QgeWi+laUr0hCK0LAamSKwZXG0+xB+n9gTcmJV77KRmpdiixA/ES4IKh68REeiSDLQkxtpn4YAz9oLqio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764936734; c=relaxed/simple;
	bh=aVwn2y330HaQw1xOwfB3lS9U454n+YnID4doe2Cu3gU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oh6yHNLJP92AVnE+zqcERkwjC/btIT8fXq9F4dyl8yOfSAs1RWKRNzE7eoy90etltOGE0+gpKNPuYjvoF2B6xw0yQI0CqZO0bpfXFQewEo+po3LPj5S2M7eeI9WlD3EsNI7fFjBRU1WgkWlH9rS0zPrFIYGJ/H+bXGbAps1PxxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l7BD2kD+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a2cfpN+w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l7BD2kD+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a2cfpN+w"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5AORnM3572182
	for <linux-clk@vger.kernel.org>; Fri, 5 Dec 2025 12:12:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UXe/ESWLSpyiDTiiz1o6w1zfmo3SmKepSqEQzhZ9jiw=; b=l7BD2kD+vxvbmFIC
	hi/L52M51x7bTjnKUQ4upCp8Y0acd0yOqqn+bijb6vBz5LI6bcAShJ96d2U2EM/N
	Eiamn/yZ18H4PdQUfc72DJwKpuHIGRe9+y0e2Lgf8WcbLKYMA08gG/GBA81LeLeo
	x72QxEeNOcjorerdDHg74lVjTQkk1XsyFjvQFjwkVhGqYBHDH0xMaQrgfARl7kO0
	GRrCQ0WcJZsLbL510YSVwgfsCwijohJP1G8nzuuTIJZaZdliZb72iPQiXII5H3cF
	iocRiahK2bpi0O2HkvOL0F4f7vvfzHa//m7vEKeVbwjrQohM7iS+1l61i6M3GSjJ
	Mp1EjQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auwm589j0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 05 Dec 2025 12:12:10 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b4933bc4aeso1899929b3a.2
        for <linux-clk@vger.kernel.org>; Fri, 05 Dec 2025 04:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764936730; x=1765541530; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UXe/ESWLSpyiDTiiz1o6w1zfmo3SmKepSqEQzhZ9jiw=;
        b=a2cfpN+wgUw5PDHkybXQ2iL58JqQBBmc6O39UMj6Vu0sSOFZBoDaLUXG3+W+jjKJBU
         eeAzUK0thdO1xTdtC65tROBKRLUqAmD1H590vzo3/8xyhLpZnAXVjuJrahfMa6iaQ/P7
         E+oQz6WGU86fFlVgaA3H9NU34lLu+R5Fy7/SHR5lXH444uiUOljcLJHUfWmPf6HeE8B2
         O8wqAXnmfOBz+LAJNJa5oxoCUju8iCS3qpHuRdi0o9J8fpdV9NWL1YnOjFO7rG5Z/XHx
         Qgm0sZeAZQ7nxnsIdRfs+8e0yQbnQ39o1FgeeWoOFBRYr62azC9ecjd7p7fLaPJBAKnw
         N5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764936730; x=1765541530;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UXe/ESWLSpyiDTiiz1o6w1zfmo3SmKepSqEQzhZ9jiw=;
        b=evwmCNw2GUgAt76beWdOxvNKhmQg8B7Tox2hBK0ethsmEwyj+aFjKYvRgnS1jppF43
         FAL+MD/YjE+ezIzHt0MBCz6wCakuGUIQxS4F0+yLVmbOKhA6v/8aIEIjNAtQrV90/odK
         BvvKgIXlGD+KatrASnxM0v147laJpg0SYVYh/H6TJqRvRxQTM5UdT2QIuK4/3BGNNjjS
         mrDZL26qVjVMC9jBXfBOtqm4QYoPk8f1RCTNSH7SJca1979q8wd8bkEQuBH9tABOM1r+
         B4eoGSzuqf46iRlfaQ8K9wrSSrAtqUOeGH7x8yF3sV8ELvQd3V/72vxn7aiNzLD4xI9g
         xZlg==
X-Forwarded-Encrypted: i=1; AJvYcCWXGqLsqGFt9A756kyWYTS804Zbo38lREiAIrbHys+M6oKOeiD3UGXgbQ9ZI0FBPDJCeLfrHgWm0p4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIKX4/8OC7VxM9n7GkAYgMrdJkgftUKi6cinGA96TPKFM45Q1F
	hIJFi1KluXuouJ2/CjS8Wg0rI+ey6xCXrdkN7k2SvcoYN9QWKhvgkBgtzbAWuiEYxAL2OXdK1u9
	CIWuxN20UXosuQBWmVF2fJNRHvTG9+HOJgokfAMNMgRm2DkA022xmI+9zVO4eo6w=
X-Gm-Gg: ASbGnctrUbi42F++1FstsNhWWCTKZhU9doRNusNbmpKpvPFx46mh2M85FcqUODasqe5
	ocwo1Oe5fxRZiGQwTtJYDEl1Nb1rCqA7eOvh8j4d1uYiTReOkYb4tiFRb4LTL1OROV3HJ/ZPSvE
	KNOiGiF1Tu2lEM3g+JPj1Ipk6/iEPynTjuoQiqPdk8nNk3DN5MvqnUs+KRaMHoWm5K6yh8W90zF
	5o7UIgS8/HK6wPrgotcgT6jV16wClgi6iCWAbzgc4t684wFe5MdGRljbyHlkOVM0ATWLvD2kSZM
	idKKRCV+ZBkvFckODgWCbuwy0xPFYSc/76XSuca/NWUGduP3gGZ9gKSp0XHUuq2Be4UIlwwjm/x
	T5OCttRaRRoHueAr8ET+zKCn4r27DIeRCbG4i0tStYOp9fAWTbOpl9BUgYNYcVIGJuFf9nl15E2
	k=
X-Received: by 2002:a05:6a00:c87:b0:7ac:acc:1da with SMTP id d2e1a72fcca58-7e22b97f52bmr6933392b3a.25.1764936729441;
        Fri, 05 Dec 2025 04:12:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQGzsbV3F4h3oMJrcer/uaLOYOw/gOuUSGKFkmONiPaPx6GSGi3mUcqUkgXbtMW7h7XsDUVQ==
X-Received: by 2002:a05:6a00:c87:b0:7ac:acc:1da with SMTP id d2e1a72fcca58-7e22b97f52bmr6933360b3a.25.1764936728956;
        Fri, 05 Dec 2025 04:12:08 -0800 (PST)
Received: from [10.133.33.167] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2af658d84sm5030638b3a.60.2025.12.05.04.12.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 04:12:07 -0800 (PST)
Message-ID: <a548702e-c509-48bf-b3c3-97f67a95bcac@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 20:11:56 +0800
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
 <a3077c95-e6c3-420a-b65e-e4e584009c6c@oss.qualcomm.com>
 <898e5a54-3a79-4fdc-bb51-f1eb6a79dc0e@oss.qualcomm.com>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <898e5a54-3a79-4fdc-bb51-f1eb6a79dc0e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XyTEHosyjFY15Zni-u4NtljoHm0MHuEF
X-Proofpoint-ORIG-GUID: XyTEHosyjFY15Zni-u4NtljoHm0MHuEF
X-Authority-Analysis: v=2.4 cv=XeOEDY55 c=1 sm=1 tr=0 ts=6932cc1a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9yv6RJPhSQAcbpPXtOcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA4NyBTYWx0ZWRfX1eVuS8xa1VEr
 kX/JICBZrEMPFqMVH34zmnkYuzSL1GzqRGXOGX61CCrc4B50T5/e4zjgZr+wQA42Rq7+OS3RB9y
 lAzpXsf9j3WfZBIdOrTzLJ0PrKePnFRhwyK/9LjfcsHwbftYRnyNUOiDAWFUIqgXyJHO6N43aWB
 88P0YjsFGiK9RG4BTdW0XIx7/y543zKqlai5wzHlZcWcdUjwp0r5lLhZ7xOBl5qZOm3yD7HKYhP
 7dbulhUXxbs8RleGhn2lh2Ks4jKp17bslzS4/83bHh3LexnGi51zD2DxZKoKTePQK1t0JtYYWYk
 ztcj7JWJdyZt97fyAdJLSPACnBUX5ndRjJbfu1iOUVq2q/XRZEbMnrh99RGOVid35uPe+Oql/xk
 eKmQhHUF4xDiJhMDdn8Ju3xJzCsTTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512050087



On 12/4/2025 9:48 PM, Konrad Dybcio wrote:
> On 12/4/25 9:09 AM, Jie Luo wrote:
>>
>>
>> On 12/1/2025 9:52 PM, Konrad Dybcio wrote:
>>> On 11/28/25 9:40 AM, Luo Jie wrote:
>>>> The CMN PLL in IPQ5332 SoC produces different output clocks when compared
>>>> to IPQ9574. While most clock outputs match IPQ9574, the ethernet PHY/switch
>>>> (50 Mhz) and PPE clocks (200 Mhz) in IPQ5332 are different.
>>>>
>>>> Add IPQ5332-specific clock definitions and of_device_id entry.
>>>>
>>>> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
>>>> ---
>>>
>>> [...]
>>>
>>>> +static const struct cmn_pll_fixed_output_clk ipq5332_output_clks[] = {
>>>> +	CLK_PLL_OUTPUT(IPQ5332_XO_24MHZ_CLK, "xo-24mhz", 24000000UL),
>>>> +	CLK_PLL_OUTPUT(IPQ5332_SLEEP_32KHZ_CLK, "sleep-32khz", 32000UL),
>>>> +	CLK_PLL_OUTPUT(IPQ5332_PCS_31P25MHZ_CLK, "pcs-31p25mhz", 31250000UL),
>>>> +	CLK_PLL_OUTPUT(IPQ5332_NSS_300MHZ_CLK, "nss-300mhz", 300000000UL),
>>>> +	CLK_PLL_OUTPUT(IPQ5332_PPE_200MHZ_CLK, "ppe-200mhz", 200000000UL),
>>>> +	CLK_PLL_OUTPUT(IPQ5332_ETH_50MHZ_CLK, "eth-50mhz", 50000000UL),
>>>
>>> I can't really find the source for most of these, but I see that there's both
>>> a 200 and a 300 MHz output to NSS
>>>
>>> Konrad
>>
>> Both IPQ5332_XO_24MHZ_CLK and IPQ5332_SLEEP_32KHZ_CLK are intended to be
>> used as the input clocks to the GCC block. IPQ5332_PCS_31P25MHZ_CLK
>> provides the reference clock for the Ethernet PCS, and
>> IPQ5332_ETH_50MHZ_CLK is the source clock for the PCS PLL on IPQ5332.
>> On this platform the Ethernet clocking path is:
>> CMN PLL ETH 50 MHz output → PCS PLL (divider + gate) → attached PHY or
>> switch.
> 
> What about that 200 MHz NSS output? Is it just renamed to PPE?
> 
> Konrad

On the IPQ5332 platform, the PPE operates at 200 MHz.
IPQ5332_PPE_200MHZ_CLK is the 200 MHz reference clock for the Packet
Processing Engine (PPE), sourced via the NSS clock controller.

The IPQ5332_NSS_300MHZ_CLK refers to the 300 MHz clock that is supplied
to other NSS blocks, for example, crypto (EIP) block. This is also
sourced via the NSS clock controller.
