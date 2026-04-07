Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF1D2ED843
	for <linux-clk@vger.kernel.org>; Tue,  7 Apr 2026 11:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775559616; cv=none; b=E+pvpE7vf++DaDMkdqhZfhB/whi4hYC7alFciImn6MmvLvFv1um3fZh9u5FxUD834WZ6L4C/KramGCXO4rQUFxxZCg1eBxI/tCu0HL/ovZ6tlTUuuCIfsWKMGvACyZk/pA1rPhyHJNOPL2vHqfRveIwk6Myn7W0PMQ4HCYbSK8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775559616; c=relaxed/simple;
	bh=f0lOL8Tip+z9pohOgm0gCI1BDvaKi2M5LsQBnXqvCxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IaqWKspGbcJ81bfwJ14hbfwYnsJ5n74Y+2ded/OlSQbT4BDj92YpYVSG2N9lz8JIrwS47ixEjjS/Pi1ZeghQLcOMC2RLDzyMeoURKLwgoXMOlizHcbTG9icpI2EXD/rS/+BlT3VpXaP5zs8OUmy3cN5iDIuH6IGLDC8lUQZpbBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o67dsR/h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NcSKVKCp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o67dsR/h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NcSKVKCp"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63772E0A4009149
	for <linux-clk@vger.kernel.org>; Tue, 7 Apr 2026 11:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fuV+iVO4z24c9uYmVpxN15rS9osl+Z617fWZV5thnxw=; b=o67dsR/h4UCPZhQO
	v/KIvttt9gLEQwppsfB4RueL+KBSPO72WkU77sphzTPlBRYWAdHE42Gm4/F0ppR7
	Ox94fVBZOE5Dt6lFD6alqy3PuCzXLQcr0F14l2G150/1iaSkbtcRVIY37xGOhLoz
	q3w/hBWTeNMhK9AKO4lp8Lk2ljDPYMnSmllyU+FBYPuQC9LlUG7KrvCKyi6PWNsJ
	ItxeU59Y8FMmEhO+mOMGSN8RfigJ5OuJ7rHgS17jV/YLhEzhuxez69tE+qTrKY22
	2aPSJcyixdUaNEovusfhCqlweB0JbJk6oiWX8fvSJV9jdt3NPNXRtgagd1iaiGKp
	i3AaJQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrktbp9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 11:00:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b2955cc1eso6881641cf.2
        for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 04:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775559614; x=1776164414; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fuV+iVO4z24c9uYmVpxN15rS9osl+Z617fWZV5thnxw=;
        b=NcSKVKCp1jMksRZKLGLhzfwm/gSDhe3MjmRRazPeAz7aOYbll/Z+ame0DxHFvsms5r
         mbnsQ/B6xx8i62TDmS+5ZqNKTU3P872al9V4BfwpZXE6z7gOLn4HqeDsE62D2XjXrbY4
         uJGd5qCH8XqeKgKAiMYMceGNrKbQVp/yK1AnvzfwzDvy0YHb92f/IfmfitMya5u7o5sS
         dNSGAOJ23VtqOPuDLdZb9yi1thuVIL/AHIKKEHLHab57aZKyMl6SDiff0s1333A5yUMA
         a103mFHHfEgtQW9g4McR85i80OkTfnHi0Df/93Q2Jr6SjTW5hMKETzTDMLeyk6JokTNk
         qDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775559614; x=1776164414;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fuV+iVO4z24c9uYmVpxN15rS9osl+Z617fWZV5thnxw=;
        b=omNVZpI+X5mEG7irftdvxgjN7zt9DyKU6I5vJOO0eqi6EKfa+TPI2dGLjzepz2+3fc
         5F5XK4lRhVX7MYysUWPtsUmTgel1T/x7ZCjW1HWZBS41YoaZ5G3FVQUX9r9LZNCBsnBM
         NxdREv+rV/2BExAG/nTjyLPIIwyPlKdVeYBychayqDBcbCvUKLAxXR79aqHAI+SVwdbT
         vEG7sqkBpFhLn6ehLmFSaTi0h9/kIlEZIW6DmVUCMoo7Q7VVr7wpKRaR3Lgj9FuDeUFy
         zOLRo4buMWc0T1KsCiO4un98ZS7aoyoBUFB1JL/91A3lU23qIBnxlD62fewwozZF0prF
         hjZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXom/Q+Qk0t3MyG55r3BwqdHtKeLKCbR4qjGyAjCrqIaUUNNeWd4bVO0NCrl7pys5P2vW1Ks205WoY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhlwE6hA7jnySPmARUgGPcOccQPy0hP+FUKEe6wkCswHI+fm8g
	MGPRoZTjJ3SF9Ar4dxcMS3Z3AB4e3y0LIvBRRjPC4RXzgEQdEu626+s26ebpF2CBM3YwyFBK2TZ
	LpU37z7DJoMWTWRgSy01mtiWwb/ArciX/4uwNIVhPDfhUMquGSWzlYh2daXiW2cA=
X-Gm-Gg: AeBDieus6uL2+3tb0Ct3Or+++I9LVqmg4dP+XzZ+QJfHXGi0Gp3IIw333wF1T9zGh1B
	PeCtXRnX291Zng3LIBDX+yxdUSv2OKB5AIvJRU2LLBye2iUVkVCX/bgYYeDb7zQlqIgKfpVoxEv
	RP5enfjsebkwDPgMsUnV6cDW7gG7BFxf1eFjPjBs15qwk8OTRXZ5wmJgHIEAkgUJsS7hcnRUInv
	A/p3OQ/hnhLa/bDTSXFbcSB3J3f9x2MlQQ7semaDUCN9ppJlXjLiDOSWmy1sUaZy3vsTKOL/Wto
	i0dwP+eUld397UvQOSQRLa1zo7KkctbkhZE2uh8kII+8SDG+c2+UtTghKUmXun1+RoSQFQmNKeV
	l2B0CDs2+odhFimQ4OjS2tBdFAo0nvyqzzkWLrpdst33ksS+a3svZZeaKPzTTYZv7rMQ3aUJ8Dj
	7nEZk=
X-Received: by 2002:a05:622a:260f:b0:509:1057:4a67 with SMTP id d75a77b69052e-50d628aee82mr172730021cf.2.1775559613701;
        Tue, 07 Apr 2026 04:00:13 -0700 (PDT)
X-Received: by 2002:a05:622a:260f:b0:509:1057:4a67 with SMTP id d75a77b69052e-50d628aee82mr172729571cf.2.1775559613244;
        Tue, 07 Apr 2026 04:00:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff19c0sm541077466b.48.2026.04.07.04.00.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 04:00:12 -0700 (PDT)
Message-ID: <5ced60bc-e588-4bac-a6cf-3a0f97091993@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 13:00:08 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] drm/msm/a8xx: Make a8xx_recover IFPC safe
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
 <20260407-gfx-clk-fixes-v1-5-4bb5583a5054@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-gfx-clk-fixes-v1-5-4bb5583a5054@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Rrz16imK c=1 sm=1 tr=0 ts=69d4e3be cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=fzR4rbe9g08MilRDY0YA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: JUbCmRoW7bMcYhn3leTAK722E-jraqRn
X-Proofpoint-GUID: JUbCmRoW7bMcYhn3leTAK722E-jraqRn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwMiBTYWx0ZWRfX9Q9ea1OsTUo8
 j4/TUK1oAd3qlCM/DzDZTmW3lWQ3+j+lNQGMo7A2L/Hxxmh+VzZ8dTCQ95XoIXJS5uM3JOtB5l5
 sOFFZnhVnHTJb4FR7UHsfBSHgnK++bjCnNIaa+9JA61xn6ZVcgSz17aTaYKxxI12LtMHcs9oDfj
 EKUSQq/sPnUJ9h9Y6a+jv7Wnkn6i/3jCCMV0RJpXypSbKo37c/l6uWRVvcp8jFT8BTIcz1JW5mm
 brCc+sKFlSsc2cG3rVYtzcYNlW8F7Hsa00Sg5ai7n+tOUOgnvR62gpCFpBIsj6ovMbJmzJbmNxU
 u4+Kk2oqkUAq9Qok9gQU6/bpQMnMcbnLV+5WTzqWhQZMWkVpqcuIfYW//o4OJiTAQZeWat1AFSA
 NyhQ8OoiinYWwp/pyBArVL+OArCZ/vjMSJQcgaMS6KTJnYqn4v4PWDrzoOxeGTuUoYaNeGiTWju
 nSTZpIBApDnZTLF7eWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070102

On 4/7/26 11:30 AM, Taniya Das wrote:
> From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> 
> Similar to a6xx_recover(), check the GX power domain status before
> accessing mmio in GX domain a8xx_recover().
> 
> Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
