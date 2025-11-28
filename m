Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC2A329C56
	for <linux-clk@vger.kernel.org>; Fri, 28 Nov 2025 14:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764340204; cv=none; b=Al3uKe2Hvh8YZYh3LbHF05d0XwUcfJrxdHAXc/danPDTygn+iTcglunkGhS3CJ2LE0p+Vmh1PJWX8TainyIIPfLPyaf50xgCEVPSKU5i4ttRHt9HZtHbyftnZ8GozYpb/tiZv5KC2FKF0W0j6qct8NNpaotrQsFan8AeqRa+G4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764340204; c=relaxed/simple;
	bh=tRNBe4fjRO1hx9IAslahBhVvZMSRTvihSK2tbffhBp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ns6TZfGy/XwnmJEHh9FfYEb5obYqyEYEXE0+jkLrMl7njFli5SoNON1ttJYqQ0+0VgdtghcfNYpgIRcsIKdkC/v8EdZKpP3o6hHGF+BPiCoN+D+MTFnUNgep7pLVfH4wEAvzplzNs69euMfP0kP2pgbA6DWxkttpd/a4T2fxh78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iG8Ozd1t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a+Ou6BND; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iG8Ozd1t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a+Ou6BND"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8O6nr3476530
	for <linux-clk@vger.kernel.org>; Fri, 28 Nov 2025 14:30:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I8m/Cd13luBRYG7SBIJit3CvmjCN2CxIcV7mIbzooIg=; b=iG8Ozd1tc2RsfYFs
	sSv5uIi6bkvfKUUvQYZ1efBDhdy/Nsbf6VL/TCtjnHct7tR1j+5J/fZluNL/wERy
	OCV+HreSeU4pB/zn2RgitxSg+nh7g3zdr53Smk5QLk6hQqFc10eEoxu0G/vjtUu3
	AKglRC/z5aFpId35ztl8iNZOsxTXYNw3QdmPkigDyoYijxTA5mctG6Z5majWcX62
	436bPIlgqeFEexVB/FyqAfcnY/VXv/lAb0iQHzLB4Z3FWbM0+3mDzmAxpkWVdyrt
	GLrEkWc0h8sElqYW3O1gddf37pSuOrpeOpHW3f14YJJcgDYHaS1E8nQ23IUgIetm
	tDETWQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aptpuap17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 28 Nov 2025 14:30:00 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ba4c6ac8406so1548400a12.0
        for <linux-clk@vger.kernel.org>; Fri, 28 Nov 2025 06:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764340200; x=1764945000; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I8m/Cd13luBRYG7SBIJit3CvmjCN2CxIcV7mIbzooIg=;
        b=a+Ou6BNDQRak3prVWQh81bkpVgDNzdYyb+5ZyD6aOjZLwfOl0ExP6GZZwWUzFZgDzE
         e0UtmDw+r4oqr/LYxYrXO95EGKbiT7D20QGX9vcA2BGAmvdvcYudgb43W5gvVc1RhEyP
         l7TbSOsytajJ5oczGPpUplZd7VpdzyIivPGGxWJNgLYpFFui4+TKHuEMbCknVO7XMu1H
         pOpbqgH3vy93cCpiycb0F0TozETIyAz9Ko+vbUBnLfvTRiplJ4H4mdo34xnb4B1l8VbN
         8EDdRR0PNXhYbJDjVCEbWJ4AMqjCDiHZxEn5qxjdXSmjQiVvwrN54GuaP57SYImAkAo2
         Mb1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764340200; x=1764945000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I8m/Cd13luBRYG7SBIJit3CvmjCN2CxIcV7mIbzooIg=;
        b=I7f3crvnunK6rkeamxFfVvViFRVzCFa7Of5evgTte70dIBhwV2KqP3R8kAF6adpetg
         Gb7Hjh6w0s243kwY/cCcQ+lHgV1Ny0I2yilU89WaI9Tf9EaunQr041KAN8Stz643z06J
         Og3Fuy7LSDO4CqHnFzaxXlESmI++Pajp1P9nLOJlUPvwYOdYzvrYvKnTn/Z+bg6xzKxA
         mReddB8UURgSFQ8xEMylz315rahimqjbsnicBjpx5pK63RRepBvD7pNG+Z50yhtgXAS6
         aDvk13dqyXVFwhkgObSRxPdOhza7GvENTAeWKKPotRmULrRwfbSIKwqSCwqOfAU1MHDh
         VZVA==
X-Forwarded-Encrypted: i=1; AJvYcCUFlJ2m0fHjQ5EkHTYiiCgrO+2hMqKL/sH561y/SUG9R3Rk2mxnn6mNAfv9184YNV5dywD9yx1enMM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5nR9PH2rPDe8uN+jVaao4hmC+wKF4/EQRVFCHbz28paBEoJId
	H3YAkYDmP8Byoh3fhUbKg187tRxLIyeChtrvCNVxIHrChUU5TqrEw6Y+NIWVHygd0QFDR0a2thS
	InVFK+CqeWViMmdYN8J8sYDRu88rXNNAO7AqZOYXjAvKwE7MnW1oRfAMJFOIzsp8=
X-Gm-Gg: ASbGncu3ZKbQ27z5/pNTMeLeBxvRdw1POnjDb9GA1YaNF4+smoA+eQXTJolq0eOXJvZ
	bpwVz9WmcveeLO5BQQOfWu+0xXVjZ5h4Jcgb3iZrw0MNiw+q/upJQF3m9TtnkKAVgdltmcUHl1a
	iJJltTm4SpdeMB5JyZq0ZvkKd+IagjqMI9OMT5spmij1qmu8vgcSe1Z5gRBtGuHeaoZwJihcYiI
	isDTIWdJZ99GxJaRdMiLSz8C6lKQhuDzHaQmooouyh6K8qYyDYDTe+1UXJC5SIe+ArCK22NhTaf
	da+lyGPaeRto3UYKf9bLU2gyEYyhlPW+RmD74EMAMULjV7pgWKyiIxu9uN5YvH3BYwr1pH0A0rt
	hfUEBmEyEvdhuVLYPhZ9kuVZY1q7wTZZ7mQ==
X-Received: by 2002:a17:903:234a:b0:299:fc47:d7e3 with SMTP id d9443c01a7336-29b6c57224emr319638445ad.31.1764340199731;
        Fri, 28 Nov 2025 06:29:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQDWkrRLq6Z/YilM0CQ3+TKY3UGACkoNWNyTlguCOA8KyIumCSBYe74T3rnKhV4ld7zREH+Q==
X-Received: by 2002:a17:903:234a:b0:299:fc47:d7e3 with SMTP id d9443c01a7336-29b6c57224emr319637915ad.31.1764340199231;
        Fri, 28 Nov 2025 06:29:59 -0800 (PST)
Received: from [192.168.1.119] ([183.192.29.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb54c6asm48719675ad.90.2025.11.28.06.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 06:29:58 -0800 (PST)
Message-ID: <ed2aaebf-f0ed-4eb6-b880-9c39d4f0533c@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 22:29:32 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] clk: qcom: cmnpll: Account for reference clock
 divider
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
 <20251128-qcom_ipq5332_cmnpll-v1-1-55127ba85613@oss.qualcomm.com>
 <2d83f0d3-4798-4183-9e3d-9972db706cdb@oss.qualcomm.com>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <2d83f0d3-4798-4183-9e3d-9972db706cdb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: E4ZTA5paEbf4Zz2x0no6PvYeJ95ra3rz
X-Proofpoint-ORIG-GUID: E4ZTA5paEbf4Zz2x0no6PvYeJ95ra3rz
X-Authority-Analysis: v=2.4 cv=WIZyn3sR c=1 sm=1 tr=0 ts=6929b1e8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=sdhyOahhduPysBwc4dimug==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=HfvJj5BQp2OzgikQKL0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDEwNiBTYWx0ZWRfX1tDCZRFdHZwE
 RBCxSJTxe9SmSMUtl/IZH4hhBbj55DmPNnEF8sFQ1zO9dWrgO4DYI040VY7YR0rv+ohHiYhLCe0
 8d7oIRPGm1qO8w71cPsNxRhNqMKhSLv4bVJ7tL7X/xNP3koXaQu/ZtoOrreDJh0G9Pk89LQ6j6E
 wfuR2mGcyu90kr2i3aZgGkfTA5sqEYsn3eG7LS4hAYWXMsn7b1OWj9AJ38+ySGqsnJ6bKaS4iOy
 kN7rr+1WLFleQ2mbNmpBxG6QyIYaPVLJmu+wPV5n+62+p1UFah3cKE86lepGA29OobKT72bL/Sh
 9SOUIQ932EhEZRs4od7u6d/cAwCzPQF/fh0mcxcZ2iYD1HcDQjAN90Ugx7jlz6MrbpKv+tbkUnI
 atxrGd1odKGa8ELXj7BIu4lbmIKV9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280106



On 11/28/2025 7:38 PM, Konrad Dybcio wrote:
> On 11/28/25 9:40 AM, Luo Jie wrote:
>> The clk_cmn_pll_recalc_rate() function must account for the reference clock
>> divider programmed in CMN_PLL_REFCLK_CONFIG. Without this fix, platforms
>> with a reference divider other than 1 calculate incorrect CMN PLL rates.
>> For example, on IPQ5332 where the reference divider is 2, the computed rate
>> becomes twice the actual output.
>>
>> Read CMN_PLL_REFCLK_DIV and divide the parent rate by this value before
>> applying the 2 * FACTOR scaling. This yields the correct rate calculation:
>> rate = (parent_rate / ref_div) * 2 * factor.
>>
>> Maintain backward compatibility with earlier platforms (e.g. IPQ9574,
>> IPQ5424, IPQ5018) that use ref_div = 1.
> 
> I'm not sure how to interpret this. Is the value fixed on these platforms
> you mentioned, and always shows up as 0?
> 
> Konrad

On these platforms the hardware ref_div register comes up with a value
of 1 by default. It is, however, still a programmable field and not
strictly fixed to 1.

The ref_div == 0 check in this patch is only meant as a safety net to
avoid a divide‑by‑zero in the rate calculation.
