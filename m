Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7433EEB3
	for <linux-clk@vger.kernel.org>; Fri,  2 Jan 2026 13:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767359977; cv=none; b=lNelExCKNfYniaMl+18Vo6rlLPzJECvCy1p2LyI0FA5//c3stNBYVprbPge3YVBcd7TORiLvUqN6dONoUqNq4ANcIfnHzYWt+culKMbWo7IL1V/9VDADJ5D8663KFD8YsrMm9L89d4Z567StVSVfV9mqGzK8Pzx8tJNY1psCfwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767359977; c=relaxed/simple;
	bh=LSAf/Rk3TdAEWsr3WqS6XJD+Y+HBBtBELhHh+tH2vUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b3IGoPdxu7NR8L9RpekdmZlLT71COl4EAgqBh6QNh6V54LEAZ7FKfTh+bfBz+VtuLMj4AC8uJVH9LIMT+f7Ta1brtVhP4kpBnIMkRxIGerEjQSsrpA3e92XZZlpcszhk0VI4tvDBu0B22pDnSbWr00u9n0rzHfXexVni9OQcjTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nq3daW5D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DAJWKdya; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nq3daW5D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DAJWKdya"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029WEEQ3961332
	for <linux-clk@vger.kernel.org>; Fri, 2 Jan 2026 13:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IZw/JJiAn3POXEdzsiw5cZbc4vxiyR7ZYVaBih2uKcc=; b=Nq3daW5Dr+ltfedU
	ClwLEDz1gERd71jL3x3HMIya9oQUymeAtf/WMOUFWX+oGODH+dQ7YqDeGP3z+2jb
	LBqPVJ84Ti63+zMDI30CmDvVjT0E3RsnyroK54ijTUB4ro+43aGBFif5dRNUQ2Mj
	1SPvtXCQ8zJYTZNgEEZf5/524ltCZslP55uiuEfgFhpfUapBgimBodgVAdvVX4S7
	a+mW46+rAlu9RlZos+ssYtYO57P2J8Z0UIARAEkFTYBYizGNMIcNdkGFTFVEm0Zz
	GJbQhskDQ4QE5ddBymvJE9lhrXLRApu7/SjBxVzrRPo46fBzdcQhS7g6pFJ3FpSf
	jjeHlw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd77v3h5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 02 Jan 2026 13:19:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f2b45ecffso198109605ad.2
        for <linux-clk@vger.kernel.org>; Fri, 02 Jan 2026 05:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767359973; x=1767964773; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IZw/JJiAn3POXEdzsiw5cZbc4vxiyR7ZYVaBih2uKcc=;
        b=DAJWKdyahrkd4vsy2lyQLL6plz6cvggdSRybMIwqySYeNhurj2+zGqs27SDSbcgDcR
         1z8D+MO2QrIzlrAacOH9kXFDJA1cmIgM4p0atn2lkYnMG55+QGyOQwOO3PtZdzgGLpuW
         ZYPNQfdpxziXTAfI0Fl55oI2iDXYHWgLqJAoFAzOqwjU9xA+ZcT8y/RTo53Q9ig6G2e4
         PySw6kofCH0NVnSuJEVa8mLB14O4SO/55ryY9JpQz5KVg7PLteDHHY+UZ/7dRm6gdhYe
         0gRPU8jOo6YMox9cxn5rXfMOgUP9eW8RcbBslCceUe2TGyfAUXzggLLZXEz0hnoT698e
         1dmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767359973; x=1767964773;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IZw/JJiAn3POXEdzsiw5cZbc4vxiyR7ZYVaBih2uKcc=;
        b=h29gzv5stQ/cbptI0RvNQGCtlmFX+gqFvH5EV2C9HUTBuLWQHtjx36FpGpoqYyMYli
         +2m02TwmajK2V2rPh0jV+b5UV4Tm5VrMGxoVCEeRWsaz9PrItOHDQ9OMboV7/QT1vcId
         LGltqaAE/4AqifTNAiNe7ms/Mr9FZwAFCzAR6rVJRnGfhQYKvaNPj3NDLmqN9j0FYNlE
         8zH077eaURiRwhXKeoycbyx3hfontHSqPKbplZ7Mj0rs6TM+ApNZMI5rN8vD8fMw/4r3
         CywRbSSw3ngGZIjCX5znTroiVwZ3BO4e9kxQU9jG+QT3sogeDPRRWxDVIVilTqWzbkjY
         nGQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyA5oagXW1xW2VZHWLkin6mWPJHu8H4nUfR4PjeY71DTXse0LQUapM2lKlZt2ZLA5q9qPpVQAtAsI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOMOnWGIFr7G4S+Qpq3exk3jJ6XxTulh2fmcX8YdFOwreUt88T
	ULTRx7WN7/IOEUdloXgh/C+G+St/+lZ6Gemzr9lMf3abch9ACxYw66pspU3FOdCLWoAGr6JOMD1
	PPceZ4u/tGeMqR7L2iKSGDhWIdxxvEkCmxbHMPCjFIIK+5BYpDsChDmG7wGZpB0w=
X-Gm-Gg: AY/fxX7Jpw0w243pWl+/E2U7wi/XEBUMfQ+uAM3gcLz3/i1ZGwrC+dfhW4xDBuZvCD4
	yqEsbveZfGiu0G/cwHlkeVkOI7/D63aM/FUXN27vuzZea8Vul8iOUQKMn3H9msRxv1u53QpFXS2
	Cz4NabRe0+mM3CUYHUWQS2BRpHxhCVLF36nJJ6WyQpW0faBFPhyum3mMMKcoWlNzqRu3lmrZsyZ
	bYb4raj5b8O0cns+cUijZidoz1YQwFbNipayBv9ZaBWInT0kqgxyNZujotmW9DwqZ6a5N8FX0QF
	7kLmlkI0HN8lh/mOxb/oj2S0iZvJ9z7Q/ox6J7ASOG4Mm+657zaXvYTR6YLVDSZ004GzoPRxO8E
	Fmn0Zri88d0SzS0bfhl4YqvoIEi6P5yf47rB/iy1+hQ==
X-Received: by 2002:a17:902:db12:b0:2a0:9040:6377 with SMTP id d9443c01a7336-2a2f242aaddmr409853695ad.18.1767359973494;
        Fri, 02 Jan 2026 05:19:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1hlYxp7YshVj7hB0XX1WRZM787D0V9PpumPlGwEaLRUxkh8qU8paZNSAZAb4rM53RY4rTtQ==
X-Received: by 2002:a17:902:db12:b0:2a0:9040:6377 with SMTP id d9443c01a7336-2a2f242aaddmr409853425ad.18.1767359973021;
        Fri, 02 Jan 2026 05:19:33 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c666casm374709145ad.3.2026.01.02.05.19.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 05:19:32 -0800 (PST)
Message-ID: <4d61e8b3-0d40-4b78-9f40-a68b05284a3d@oss.qualcomm.com>
Date: Fri, 2 Jan 2026 18:49:25 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] clk: qcom: gcc: Do not turn off PCIe GDSCs during
 gdsc_disable()
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        manivannan.sadhasivam@oss.qualcomm.com, stable@vger.kernel.org
References: <20260102-pci_gdsc_fix-v1-0-b17ed3d175bc@oss.qualcomm.com>
 <a42f963f-a869-4789-a353-e574ba22eca8@oss.qualcomm.com>
 <edca97aa-429e-4a6b-95a0-2a6dfe510ef2@oss.qualcomm.com>
 <500313f1-51fd-450e-877e-e4626b7652bc@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <500313f1-51fd-450e-877e-e4626b7652bc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fKMLQmj1SNkUjNWIeOA_HqHrd6W7GfZ5
X-Proofpoint-ORIG-GUID: fKMLQmj1SNkUjNWIeOA_HqHrd6W7GfZ5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExOCBTYWx0ZWRfX07JWXGdsSqwS
 CAFeqGHz6lMTU2l1tO8BPd2wAkvu4SF5oWc8JZXNcqG1vxiLgeuP56wXm0YJHwg8cI8E6iB0c3A
 GHp5dwlIIijUM2hoQXGgxbSUEmzIGbKjEKoYbGxlin4g4nu9rTuphFwdcSjfr0RVbZboqkfp/5Z
 rOv74+keBBukQW8mSLg/wA7uFz+kqlhRkccad78ORQbkRfKnR8cPKuBwAbF0cY3vGZq65fOntMZ
 tQQ/bpGSIIV95vKycze/XEIJoV/f/VCY6ZACuf8a7DKQkOzxQosiM7utB/2KLtDgjhBjLfevpUb
 JpSS1yAvCN7BogelPDveJ6rTLD/pEuCaSE8BcgYw8tVgsDf9I2jBAumdv0MIOmv1A+7Xn19ZF3A
 1l4YjpKZxcPEOsgWXaduKmAMg6XWEjuNWMNYU2ogy5PSQe31OJmv9960ezhG3RRLnHIeJQ+aOfC
 VBTkWCsbYEt5HvJvl0Q==
X-Authority-Analysis: v=2.4 cv=ev7SD4pX c=1 sm=1 tr=0 ts=6957c5e6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=_935WOAJMPqh-kFyC1gA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015 adultscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020118



On 1/2/2026 5:09 PM, Konrad Dybcio wrote:
> On 1/2/26 12:36 PM, Krishna Chaitanya Chundru wrote:
>>
>> On 1/2/2026 5:04 PM, Konrad Dybcio wrote:
>>> On 1/2/26 10:43 AM, Krishna Chaitanya Chundru wrote:
>>>> With PWRSTS_OFF_ON, PCIe GDSCs are turned off during gdsc_disable(). This
>>>> can happen during scenarios such as system suspend and breaks the resume
>>>> of PCIe controllers from suspend.
>>> Isn't turning the GDSCs off what we want though? At least during system
>>> suspend?
>> If we are keeping link in D3cold it makes sense, but currently we are not keeping in D3cold
>> so we don't expect them to get off.
> Since we seem to be tackling that in parallel, it seems to make sense
> that adding a mechanism to let the PCIe driver select "on" vs "ret" vs
> "off" could be useful for us
At least I am not aware of such API where we can tell genpd not to turn 
off gdsc
at runtime if we are keeping the device in D3cold state.
But anyway the PCIe gdsc supports Retention, in that case adding this 
flag here makes
more sense as it represents HW.
sm8450,sm8650 also had similar problem which are fixed by mani[1].
> FWIW I recall I could turn off the GDSCs on at least makena with the old
> suspend patches and the controllers would come back to life afterwards
In the suspend patches, we are keeping link in D3cold, so turning off 
gdsc will not have any effect.
But if some reason we skipped D3cold like in S2idle case then gdsc 
should not be off, in that case
in resume PCIe link will be broken.

Link [1]: clk: qcom: gcc-sm8650: Do not turn off PCIe GDSCs during 
gdsc_disable() - kernel/git/torvalds/linux.git - Linux kernel source 
tree 
<https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/clk/qcom/gcc-sm8650.c?id=a57465766a91c6e173876f9cbb424340e214313f>
- Krishna Chaitanya.
> Konrad

