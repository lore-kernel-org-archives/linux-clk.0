Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9B733DEDF
	for <linux-clk@vger.kernel.org>; Tue,  3 Mar 2026 12:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772539850; cv=none; b=Q2g8bZz2+veMmvgSWZsk+1OdVHRJbl4D7bxbdtet73A6iqzBe2wTY4qsjUaz4XL1HOGlmaLI3i6tfpcw9FuB0m1owV+P/9+vYOdJ29+MPB/DZ8WJQ7zFIwb5pGRfMHLDCPoTzSfnoyXKHnx8rrvyhJq3kRTW/ePjLWvjmpNQMGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772539850; c=relaxed/simple;
	bh=duq8E/FZGZzRF+AqYQKvs1DBeFxeK15Ta1sGJeaBe6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KDSU3AH3KM1OCUJpdiDUFBHqh0550fnun4SwxTcQ2cPC1I1nNxgafSyx1hIy/JXUltUvQt8PoPN8JoAzop3inn3G2ACfBqfZs4Dkvhw683LSP5GauH1nmUDv2CwQiSCeneNnPQytnBeUJF796INtVOBynKhunEVfnFzk51tnu4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W8KUfWrg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZcCRJnZx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W8KUfWrg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZcCRJnZx"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239moCM2773388
	for <linux-clk@vger.kernel.org>; Tue, 3 Mar 2026 12:10:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uwoV7ee+qwQfSzw6umsLl42FYWoB+twf3uFaLe7Fiq4=; b=W8KUfWrgqBsf8V1O
	tRQCvcWznKtLP6WCii8wxk4le0oY/3e2lA4evKqwl9lJoYWTfL9oybRTavjdq0FP
	50vZ5DZeeU4EZ1grE5bCxU3zZn1wfwTfBLCpoC7+MdrpKjenSvup+/tJMskZFeFh
	AS/7EwMLT1eI+v3+QDNIUUCSkHJXrT2IbKAXz09LSCQymUmaI0ePZwdxu94jb7tU
	GPETtsxNBPQ9iyrp51sjOo+xP7S7/fOwvU4cT7lJXT7Ch8BdKoXYoDyLSuEJEMns
	SCB7WquSuig4apOzdUZm+EA3gkUCSlXx1Y51yPhFGlaWCl6NmUYxKo7IrNFlVdQi
	5qJ/vA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnsjm1aw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 03 Mar 2026 12:10:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb485c686cso439703585a.1
        for <linux-clk@vger.kernel.org>; Tue, 03 Mar 2026 04:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772539846; x=1773144646; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uwoV7ee+qwQfSzw6umsLl42FYWoB+twf3uFaLe7Fiq4=;
        b=ZcCRJnZxIlONbLwsj1k15F/QjCWxqAf5nnya8gvTYXclWksfzVfValRvM6FONwarUu
         Kj7kR3MyVjQqdX0j/b7iHUhYxiZ8T+s1I7xj9xVmMLhw0IroB2erfqSq8RHfTVHuWfag
         /sml0wfSJBz7h3avKG4Dvkc5v2kcwoPBEduqCPL7Tzh5snMMGKxlhjszZrEUSe34MdZ3
         74NH7JKnQlX/3qFfWvcn/KNrm6r/NKYEfjs/cana0JDzvXl+sHbKo3JpdiQn19i70Smv
         mtHGcxwlUy+4n3jC2mZCz5F86NGsZfu9/rMddts4hQvAHtFkeN4caajiiYvKT95+eiFh
         sHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772539846; x=1773144646;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uwoV7ee+qwQfSzw6umsLl42FYWoB+twf3uFaLe7Fiq4=;
        b=Blzx1zGtYb0UIKcG8GqLcPzxYTdqCShq9rRthfkAGjMKXaLZ4eDTc5/PRjJahFe5Tp
         TOrn2HbrdkyhVk1T5dAT08WGCGKP5DLOCGnkWDENybtxe0z3NLYyr6+TgtPYPha4LTOx
         rxGwfSCuyBp+xSLaDFW5cedXCLETukCuLddM+G5FKGNJFaK+SqSYg2Ec8RI54TDwt8e7
         Ty1AGY8jLnipyr2p+OuX4XnzdlYI7Nf2tMiI2x0DXEsZGhlnrX5BoZqFLdqUQqUNQt2g
         Qa/eAH5l5FSUGPDfF/JJ3zni1UXK68baaRUGM+RvFcgm+iJ4ntfeE+/WeQ98RjZM3TNo
         N+6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWLUe7prUtpqXEoR3IOcQLubO7UU6qL1JFm0wvXBROZjx6Feq4Dy6t0REVQ/QaWIIz2BB+O00R5144=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzyJsJXHev7Z25Tikfv5nDHSdOtIoRbE00zlUF5Pbdj+Zvo5vi
	Ns9Fnhb5ypjI26tSbKmn0iMVQZAKubvC3n0/hFuFa4cNNE8X2PFUnngPpi/59v8eJwVMKSohT1g
	OQeR4SDr6zTv7JWbQ/D7csfT+cVbEg6ec0EHKzV9jaLQ5ZIIk7GEZ+ObooW73OO8=
X-Gm-Gg: ATEYQzz2vyZL7W0txphQHGMbVY+MtDXv6GKUQTRSjKS2Pu7MlgsVEHmtXdPW8Qbh3oj
	EcLs0bV+fPvC3cGo1kp+T90G96YBe3OzAb2Qr6PkJ7HVfph4PWZERafqrj4bSnKiDQd4bSqQW6G
	zw6PiS+k5fPhsZzzxyyEdXyOuni/NxjL3ieBuuSk6Iub97aEbknLY996MqhbuRnd6uZOLSQeDa6
	82qKdeCAc6qreyvdhmjVjxo+baxAcG+4WShOhCvLS0ULD0EvfRkSRCIZpwmCnZDBkSY0zJKb4JJ
	D+PyNKoyX/4uOCPpHxPCe4wzqlK/G5TKN0FRRRsG2dV9pNlUBVIv0y1c5b3o6ijnGRplCTJfh5f
	Q/jg6Md6tN8Rvmmr+N0qKamCfjzbGYoWIPt7fB+sroTDfKLY+GyCdfxVkEpEZJNHjNaQSIfWfPL
	N3THU=
X-Received: by 2002:a05:620a:46a4:b0:8ca:2e37:ad06 with SMTP id af79cd13be357-8cbc8f467c1mr1563173585a.10.1772539846231;
        Tue, 03 Mar 2026 04:10:46 -0800 (PST)
X-Received: by 2002:a05:620a:46a4:b0:8ca:2e37:ad06 with SMTP id af79cd13be357-8cbc8f467c1mr1563170585a.10.1772539845780;
        Tue, 03 Mar 2026 04:10:45 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabbd98bcsm4567887a12.0.2026.03.03.04.10.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 04:10:45 -0800 (PST)
Message-ID: <d2cdaa7e-1a17-4e6b-879d-266844958410@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 13:10:43 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: dispcc-sc8280xp: remove CLK_SET_RATE_PARENT
 from byte_div_clk_src dividers
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, White Lewis <liu224806@gmail.com>
References: <20260303115550.9279-1-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260303115550.9279-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: idnLlyvKCJV0yEt20yWW9SkzSi7Ife-m
X-Authority-Analysis: v=2.4 cv=GIUF0+NK c=1 sm=1 tr=0 ts=69a6cfc7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=r64ZnLUNze7Q9b7ZCxUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: idnLlyvKCJV0yEt20yWW9SkzSi7Ife-m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA5NSBTYWx0ZWRfX37l9I6zS0gRK
 Mfet6OrN6ZN61UO2UAfln32e1+NzkCQQGMulHxtCh6HeN2yA/NjPa4FeBNZFrEgdhaeouXyc+xW
 D2E0CcvARR/Ivb7zHKRaw0VFsm1pFuFnCO4+J+mVVDFLx1M71fwySLcAk+MBg1RvrkYzgKy5smu
 yYkfCBHfX7fU0DIiN4YF7SoCvA6xOzIPhap8Hd6Ze+37Z+bYj94nAMuPuFpx3MtCUsdRx4IDnck
 A3Yn5oMt6skOh7dgRL/SRUL+d479EJfvF5vvU2633+mQuUmV54y1u4UjJSni6AGjy+LX7hOms32
 UJC0WGZUAgUPf8Y9Xnyjzu9eyQu8ETP4Fuio19vHHuA4SLqV8LFyARttlPTDsM5UEUlUQOw39Yf
 5EeOyEpDP3c9+5WyOzl5kwbaXH1qIed+qq73ablQUGlF2pY1K+dvrSszSARf2mB0eHpofYkG7S1
 IegUwfsL1xvpuuZx3EA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030095

On 3/3/26 12:55 PM, Pengyu Luo wrote:
> From: White Lewis <liu224806@gmail.com>
> 
> The four byte_div_clk_src dividers (disp{0,1}_cc_mdss_byte{0,1}_div_clk_src)
> had CLK_SET_RATE_PARENT set. When the DSI driver calls clk_set_rate() on
> byte_intf_clk, the rate-change propagates through the divider up to the
> parent PLL (byte_clk_src), halving the byte clock rate.
> 
> A simiar issue had been also encountered on SM8750.
> b8501febdc51 ("clk: qcom: dispcc-sm8750: Drop incorrect CLK_SET_RATE_PARENT on byte intf parent").
> 
> Likewise, remove CLK_SET_RATE_PARENT from all four byte divider clocks
> so that clk_set_rate() on the divider adjusts only the divider ratio,
> leaving the parent PLL untouched.
> 
> Fixes: 4a66e76fdb6d ("clk: qcom: Add SC8280XP display clock controller")
> Signed-off-by: White Lewis <liu224806@gmail.com>
> [pengyu: reword]
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---

Looks like more platforms have this issue.. thanks for fixing this

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
