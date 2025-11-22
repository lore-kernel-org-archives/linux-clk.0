Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCED1B85F8
	for <linux-clk@vger.kernel.org>; Sat, 22 Nov 2025 10:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763805625; cv=none; b=cFEo0suR9u3Ly5+B4kHIvGfSYGXmtgr2FjYiAxepabSFLAp7gWrkFD4M6FkcU11UOEu4P2NDOUjrVqh/oseaO4U9IzvtOJ8LAtUrmgQnrHP/fCTIlhcJKAw1rMynyxXtSE0Eu+CElm1zDADmSVneHPqL1YvJMsj4cdbAhVfY4Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763805625; c=relaxed/simple;
	bh=vFK/fopWYKEcnzmzg2WZKqHLl202dBId2vQhix3vFbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KO1memJOYJ8D0CFJ2Vm6H9/em0Ta4YBl6JFrsDHTkFDgCfrTonw0oQjFkWc9aqEUPf+DP2admMuFsvXQQwEGZvt5lmyJjq67WyTQ62DSyE4BUdXs3TEcExTH8DLcWDFev7DhZqaqnVuapIwV6odFEGLaVXJbt+d7NcCYVDc0X40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dr2tumK6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XiWcR0Xx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dr2tumK6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XiWcR0Xx"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AM5IAY01719116
	for <linux-clk@vger.kernel.org>; Sat, 22 Nov 2025 10:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xuiWhSv+yQ61PQJwV+/RVVkjNi5HEs6bt1N7Kfg5jW0=; b=Dr2tumK6mU/LM+cI
	N10VUxRY7FMSqwSDAAguebDEIFy5V1BHwbw2QHTzaVOl4/b0oGIk8m/ULXAKrnto
	4dxTgFOI2QDHTheRKOUKXUWS2yeW9tOilB0uGTCp7Wvg4oNKZfvV1YjuqEqWYox6
	NJFxMIs7kY8REP427yts6Rd4ZcixCKXJiq/MKKupQn6utLD5TiRi0S7Ena3pJaoE
	rKipVB6ivI5vt4l/mROXvoWz1tFXUVQ0+M+0ghTtlOXpZi680s0meqL/B9JksGxw
	2UqDtP0hxyAbBhzbR5buTJv5K1VgofzZPQg3Y04/WludKaTH+KWhtJkN61L6+lP2
	NcDikg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak685rewf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 22 Nov 2025 10:00:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-299ddb0269eso38957085ad.0
        for <linux-clk@vger.kernel.org>; Sat, 22 Nov 2025 02:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763805621; x=1764410421; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xuiWhSv+yQ61PQJwV+/RVVkjNi5HEs6bt1N7Kfg5jW0=;
        b=XiWcR0XxNNGwHyEkKIDUrVdjW3i11ipmBN17qth/GHh4RoJ3xDk3K3BGzTyh9ELjsn
         VkfRCLUPK6+wXLU0ybduwgH1AFevauVfWzREBQdQ90l6dH/jXH1JNgA4+eFzWSK9C1WO
         RsfwiXHFm77hzvZCnZ9lIYQoTHfrffwxX202l8i41NOkrW+jdRObPYqDcm8PkLo67FkO
         kEObkDjINEconl1uRxLMehHMR+ZyBU+SOTqrQoSibW35Utyl2UUIXLhtbBln4Wio/mPo
         CcwaTKwNfDM0ponzp6QpnLYlHE9tNaeeIRH0YscNRt6zcXsLN/67amkFpv7/NCGDsoj5
         pr8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763805621; x=1764410421;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xuiWhSv+yQ61PQJwV+/RVVkjNi5HEs6bt1N7Kfg5jW0=;
        b=S6r+miBw7JKNpTvb+IXWWpc1hKSzgpbUDslYM6tywbBFy29UEBpxFZ/Uqpok0w4Z0B
         +A2uriW3Dc2OZiL36eSuKrr4YAGhtA3Fqdddg+ESrAIolDyhv8ONzogKRkkSDKZ0+a/e
         gK9hgEL4KHiBhN7IMdSQuMoeiK608bPMHjrbpjrDkCvZ3cSg+Zvb4wn/8t0IG9N0IO4b
         aBZv4jVmlot2TVYXNApukfgsL1Db6JJBon2sfuuccDAJdROsjUEwQbRpTo/x9nC3ZzN0
         DIAGmWP5j24RBaaBZ42bByDcujnvRtN1QNzlDqln0OdJWlajeqzNZV3Oyr6uXmZV8It1
         Rx7w==
X-Forwarded-Encrypted: i=1; AJvYcCW9mAPf34FE8L3xMxcGV4SH9Abw5G9HCiIOdAPW8xYrYYmvG6K0DP4FEjlSCNKYCCAJ//1f17BAZvs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHDIcTuBNKVA6NO5KEvxbqguEX0tIosQpz2ZHYHWvZokoeYMCb
	a+pwMquAE4CUhuGy1mDCi14xP4xenHzuOpTZBrsk9UAqZwO0053Pq3l9jecpls9upHrlPKPK+hm
	ZGR++JW1UODNiVaypexzpsyGXuAF/pCu5GeL/d3uQEUOzjqpZ3Ek0QCtLLUlkYvc=
X-Gm-Gg: ASbGncuQWCuDFu0qnPqGv0urAcvw6kcwaWIA/9Muds9fOF+AIQI0EBZehuhzPJoK/k8
	9wMtWSdLcYUkYUXQ0EaV0RKiFnqb2M3q59g1Td6dwbVbiiVjYy1kwy4KhzomD/zP/kHHX8jlYU4
	Ll3xJTjE7YMYgLTFbOUXNXB55CjridgaE6WzwkSJAaTmYhMpVY/nXumfQU2Dg0zTmmIvRNi7Doo
	r88ZqQmkFGb30Sb3AelIURewyJ/U1ZhfV/SgxuLQuGTpNiojIolGP/Vg3a12xmNE8W/4037szXW
	WkuLFGx5JXTaNLa8Wjlng2SmpyLffFsOCmr7AKibfD/sPgRZNZ3t0bqUdQ6RKURX8d3cMas/zO6
	GzFNSoMtX6cB5uPEc7pb6hf6TzL4QE/SfNG6oNw==
X-Received: by 2002:a17:902:d508:b0:295:7f3f:b943 with SMTP id d9443c01a7336-29b6bf3bce7mr76385575ad.28.1763805621335;
        Sat, 22 Nov 2025 02:00:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDEf35TVfVNEVsmLpL4nghzk513GLPSV00sS6BwfLhBbhSj/WbuA002eWMZfAjwPFPQhu8jw==
X-Received: by 2002:a17:902:d508:b0:295:7f3f:b943 with SMTP id d9443c01a7336-29b6bf3bce7mr76385145ad.28.1763805620832;
        Sat, 22 Nov 2025 02:00:20 -0800 (PST)
Received: from [192.168.0.195] ([49.204.24.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b2a155fsm79677115ad.88.2025.11.22.02.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Nov 2025 02:00:20 -0800 (PST)
Message-ID: <ab4bd349-9f63-4a2f-b643-414510adf8f9@oss.qualcomm.com>
Date: Sat, 22 Nov 2025 15:30:15 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] clk: qcom: rpmh: Add support for Kaanapali rpmh
 clocks
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251121-gcc_kaanapali-v3-v3-0-89a594985a46@oss.qualcomm.com>
 <20251121-gcc_kaanapali-v3-v3-1-89a594985a46@oss.qualcomm.com>
 <gxjidpjoc6h2rvuqpv2wjynumj6qfk6ktznte6igem5g4gt4ai@ukflachqlg3i>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <gxjidpjoc6h2rvuqpv2wjynumj6qfk6ktznte6igem5g4gt4ai@ukflachqlg3i>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Woom8Nfv c=1 sm=1 tr=0 ts=692189b6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=GH/ppe9Zt0ppH6VRuhbLmg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6HBrFCV5obpdwvJ6M5YA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 6hSf8KQK4keiXsQKJgubbiU8l4Ls2g7U
X-Proofpoint-ORIG-GUID: 6hSf8KQK4keiXsQKJgubbiU8l4Ls2g7U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDA3OSBTYWx0ZWRfXwREVwbb0DKMQ
 vf9owww14IlfGGA8daH7aWUA2yWneO3qlm4GfpL8xipX5Pd8/p6L+lwTZ58QlX9WYDzKcOck7SJ
 YXtdO/J+vgdQZL/Ycag7SXi8CXWwxyVbV396kfsiY9JY+jucEOgOaiIonOyg9fb+n3mER4wEZAb
 tGzKP+WmnFE1GzBNZ4oNjsbsPUVICr9BNw0BJ+7If3g4eqYNOQuw7k6G8VAhUbfivOEwg1mvrjJ
 HN7s1XX+6TEktSsSJ9qNRPthfZeU2/qx3Pqv8YWCBmPVhsh+uTKs41UlNa5e/Y+gDGo9Ar99Zk+
 JeoeW9gk0o2IzwUg7tZrH+SvlXaU9S3XFoW+CzrcfgcN1bap7ZSUmWNJeC+mzpfFsu/wejTryTH
 4loXoZpPSOambP3nw6Mq4AhByboXtg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-22_03,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511220079



On 11/22/2025 2:10 AM, Dmitry Baryshkov wrote:
> On Fri, Nov 21, 2025 at 11:26:27PM +0530, Taniya Das wrote:
>> Add the RPMH clocks present in Kaanapali SoC.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/clk-rpmh.c | 41 +++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 41 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
>> index 1a98b3a0c528c24b600326e6b951b2edb6dcadd7..c3d923a829f16f5a73ea148aca231a0d61d3396d 100644
>> --- a/drivers/clk/qcom/clk-rpmh.c
>> +++ b/drivers/clk/qcom/clk-rpmh.c
>> @@ -395,6 +395,18 @@ DEFINE_CLK_RPMH_VRM(clk4, _a, "C4A_E0", 1);
>>  DEFINE_CLK_RPMH_VRM(clk5, _a, "C5A_E0", 1);
>>  DEFINE_CLK_RPMH_VRM(clk8, _a, "C8A_E0", 1);
>>  
>> +DEFINE_CLK_RPMH_VRM(clk1, _a1_e0, "C1A_E0", 1);
>> +DEFINE_CLK_RPMH_VRM(clk2, _a1_e0, "C2A_E0", 1);
> 
> This got better, but not enough. Why do we have now clk[12]_a1_e0, but
> clk[3458]_a, describing the same kind of resources?

I am going to fix those as Dmitry.

>> +
>> +DEFINE_CLK_RPMH_VRM(clk3, _a2_e0, "C3A_E0", 2);
>> +DEFINE_CLK_RPMH_VRM(clk4, _a2_e0, "C4A_E0", 2);
>> +DEFINE_CLK_RPMH_VRM(clk5, _a2_e0, "C5A_E0", 2);
>> +DEFINE_CLK_RPMH_VRM(clk6, _a2_e0, "C6A_E0", 2);
>> +DEFINE_CLK_RPMH_VRM(clk7, _a2_e0, "C7A_E0", 2);
>> +DEFINE_CLK_RPMH_VRM(clk8, _a2_e0, "C8A_E0", 2);
>> +
>> +DEFINE_CLK_RPMH_VRM(clk11, _a4_e0, "C11A_E0", 4);
>> +
>>  DEFINE_CLK_RPMH_BCM(ce, "CE0");
>>  DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
>>  DEFINE_CLK_RPMH_BCM(ipa, "IP0");
> 

-- 
Thanks,
Taniya Das

