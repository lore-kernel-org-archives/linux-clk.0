Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D374A29D266
	for <linux-clk@vger.kernel.org>; Thu,  2 Apr 2026 13:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775136947; cv=none; b=Wa+TGhP0JqBqppeI8IJypN2xJ9RALurTPMuIL9jec/hqoJI2GFi/P9mPZXJRbuIdhav9sWnfaW6BXz1vhBXLK8tJhvKs1OmLkAA8GnEDTZPPe7nFQ2mZ4f3ONAHROl20QhXxg9YaMfsxP3SbeScQ0vbp7+QFuOg/191D/RFMqyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775136947; c=relaxed/simple;
	bh=gCGNXJFNQvyItlwAovW+ndYukDhsytMH2mPEFSyn5y4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KNED0TRvI5i8uq5KiedsiYdnDOVj1d8EdON3Y44VWc1f8FGMjfxzhnLfG921W9zW7L5aIufkjctU2j3pWRO81MKXGlpvrFF2urxWRuiqqDCMSs+GtX9nBwtCHKuhoYAqzNxjhZV4gRsGd8i82S3GeAo6Hkxdb/ljGauW3mZ83vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ajyp5s/8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GfBZ857H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ajyp5s/8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GfBZ857H"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632CGY7W1128810
	for <linux-clk@vger.kernel.org>; Thu, 2 Apr 2026 13:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xu94mL1Un+OWCMDeXx07PLCG15kkUK4/1ArJRluxXUI=; b=Ajyp5s/8ls5j2/dp
	42QbDOzFJMPgmNwiHMef1GziEaX97LNanN1FHwpgTVCu07snQQgYx2oFqvoYa0W9
	yghSULMmE/9OiOLREE+FMeVDgS+kK6Pon0bJFnwcdwiJcUgZkUU5ej7KnIrkN/yd
	YiIPSYnXdkh0Pz318zrftX6v2REMxFsbfo8xabrG5bp1o/pEJlPSIhwUONQiFw/N
	U1+FDifQBwGtfGDTHm0eW3J40XC6mE2x9J2vfWpYp4lguzJZawvqdG4F4FGSmKIF
	uYTiBB4VBnwfHJystk9oz7EITZ0VJ/pJf1+43wpKAVIHMHLB1Nv7VSKe82vVuv5H
	2WGz4w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d96k9cawc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 02 Apr 2026 13:35:44 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c741f038f7cso475957a12.2
        for <linux-clk@vger.kernel.org>; Thu, 02 Apr 2026 06:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775136944; x=1775741744; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xu94mL1Un+OWCMDeXx07PLCG15kkUK4/1ArJRluxXUI=;
        b=GfBZ857Hlk/uU16pVhFvBb7Z+wHM1UCpXWsBQg6+ZdZ2ltqKc8jtJMogVEEWsNAiTh
         qdRqAq9mZtJ4CI24H1YInoTqsdOI58huaZABENvJCaW5Wg1gGNh856OnDsKXKhBUSGBS
         8L0utUrZsA3Csn0Cpf9Ug3LCdtzbxplrlWW54+lIhdSexK8DwLG5dZOh0AHdTlLsgARv
         S2V6kwbRZEJb2O4KJ92Dwk9Y7mM/19cWtINTTPQZ/lUStN773s3DEz720vt5CBSOdmCo
         gVowb9ZI6EWuAFouSXjEoLq6nyxhWwCzhzL4ipIPkYC6s1u64NHr6yZvL99xPFvT1PCn
         goXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775136944; x=1775741744;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xu94mL1Un+OWCMDeXx07PLCG15kkUK4/1ArJRluxXUI=;
        b=E3FHusXdBTwSgFF+Ew+oBgYkrIdglkvcaY1Z+TX3HBGGYn5v5EWbiF0Ac9ZAd7Hqbm
         00zTQSiLWeBtrSjWRPTu4kWKyRyMS5Lqk6YYwcH5HPepzq9DwwUbYE6ifvYjgdV7S1F6
         zQOEJJMgTuk8Xrow+fgBeRfsKUvGvtYtP2qqF54/Ypmuo65W5YnQTWLc3xKtr3kfGuVa
         23GT6GmjIRLCLDkxf6VvvsYM/TQYbFkFSYMiBNpj8oNIAE7GF/kNPFLp2v6BGbSPujb2
         zzBjQDDgVGIyqOXl3DZFtmVkl2XwE6L0lR7Kci2nzRp+ZlFnP/I7brQp3457pSSRj5oI
         W9nQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4+c61CU47lqZa1vL1A5AmthqQ7X1TGHhknvyqMb8benDj7iQSCqBwpI9xj+vmyePIp35hvXhAHEM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRSlMzl5lJsnIs64yR3Mkc0aIUfKGM6idud/vZ6uW4q9UXbnV7
	E6nRZkr3xu1oI7WhbcwswajJeIbTHQ1oaA57kERErZAfRtxxOvLcMX7m7+pTkIo5Wa5yEUC9uIx
	pcobqKj+ogCSi+FDrfnLM00tHL4d+1yPkPT22F9EUf9Y3N86HXQ9lmI+JNpefQqE=
X-Gm-Gg: ATEYQzwkixkZVGDBVk+WjpY//bNC2+Hkv00mDGdsc2d/RkhvRORdBO4/zJf3bqKVWOS
	n6Qr3LRxZw20hoagLcn/yHeLpqBwqO96GxaceBkU+gsYKZUUnE4t2N6twlkjxbX1PwFFx5i5RkZ
	8rdfPBW9M1r1OkgpEZyg8gOtnWulW8z1kvUAqyY9btjB/BgB3u5xLVZW8eoMpRuvH15goctMNc4
	ztmNvJqfDOFl+ZLmOXWEeVitfdXaok+QAYccTTFu8gxlvL6Ok4PJJcdL/zMLOXSFVzvPVKIrEO8
	g7LyTlMigNvFPrMqyXNkUxIC6YtIYv8Zuye9j6DuZfp5LK/XMqZre9/1S1bFzL5XqQ8SmuYCoLu
	DsMnxpeF0E40tXGheDsKWpOBhALKDC9e/N1Lxhctqhr6T8CPa/I23pg==
X-Received: by 2002:a05:6a00:1405:b0:829:95f6:7625 with SMTP id d2e1a72fcca58-82ce8ae544fmr7252936b3a.28.1775136943610;
        Thu, 02 Apr 2026 06:35:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:1405:b0:829:95f6:7625 with SMTP id d2e1a72fcca58-82ce8ae544fmr7252908b3a.28.1775136943090;
        Thu, 02 Apr 2026 06:35:43 -0700 (PDT)
Received: from [192.168.1.5] ([122.177.247.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c41a2asm3395236b3a.37.2026.04.02.06.35.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 06:35:42 -0700 (PDT)
Message-ID: <9e65a64f-b227-4107-873f-5800cc79ee21@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 19:05:37 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] clk: qcom: camcc: Add clock controllers to Titan GDSC
 power domain
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260331140142.892579-1-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20260331140142.892579-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=doLWylg4 c=1 sm=1 tr=0 ts=69ce70b0 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=HITMEuADKAZbuvU9jplFJA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=zZH_qJBfeQ1MonjMHkkA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: Gd9xvAmCItwYS8sEAO3JTjuYZAtsTeo6
X-Proofpoint-GUID: Gd9xvAmCItwYS8sEAO3JTjuYZAtsTeo6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEyMCBTYWx0ZWRfX8d8pdBJAGqEI
 S3/1MxJ7ntpGa7xgSkwz5C6XKkA8X+p+xrcNkESVVj64HJZBRtVqemQ3hizlHprx9RgRPtulw5V
 r5TS+SBRdk7b2bgjvv46ewWZ8oKJXJ4cbnqIlpdVh3gykFqWQaH6sN5nNsC9/rUoUJobZ65zZZ7
 XSK5eryN6EaENiALPx1iJift4U3WzYegge6tgnQ+ZbcOONyRhr3ulu4qebAYfLAFg/wAE+RSa6D
 5ed7nOE2tgGkZGsbgD13uznOEW8NUCRDSQsbXmTWT1jN8yyAqfbJU56xJDH2TNqzoMAk4Acg/rs
 UeHPlkEwHCTolD0fnhOa+i5zfO0nIEGalDWlEMHaPjm9LIEm0OVRVik9P7gbe+4N2B3NHF54nGQ
 wa9gJ3PkhT2pkdCJVtrDBHndDVCt4QKxtcNZ1PcCaH7Ewf9XSOzFpo80E87Ai+QrywRnSAiVUf1
 Qb+/+TwmRJ3tLEomKyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_02,2026-04-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020120



On 3/31/2026 7:31 PM, Vladimir Zapolskiy wrote:
> Starting from Snapdragon 845 SoC CAMCC device serves as both a power
> domain provider with a special Titan GDSC as a top power domain in
> the hierarchy and as a clock controller, where the clock provider
> function of the IP strictly depends on top Titan GDSC being enabled,
> thus it makes the CAMCC clock controller to belong to Titan power domain.
> 
> Today the formal hardware dependency between CAMCC power domain and clock
> controller is managed by runtime PM in every CAMCC consumer device driver
> like CAMSS and CCI, however this is terribly scalable to any future
> CAMSS IP device drivers, and unfortunately it is not scalable at all
> camera sensor drivers, which are also CAMCC clock controller consumers.
> 
> The change adds an option to describe CAMCC power domain to CAMCC clock
> controller dependency properly, therefore runtime PM management can
> be simplified on the CAMCC client's side.
> 
> The series touches only platforms with CAMCC drivers, which marked as ones
> using runtime PM (see .use_rpm flag) but Kaanapali, which formally has two
> CAMCC IPs, on the opposite end e.g. MSM8996 can not be covered by this
> change, because camera clocks and GDSC power domain are not separated from
> other media clocks and GDSCs.
> 

Hi Vladimir,

From the camcc provider driver, there isn't any HW requirement of keeping the
GDSC ON to access the CAMCC registers. From the camcc provider side, we are already taking
care of camcc required dependencies(MM, MXC). Similarly consumer drivers need to take
care of voting on their own dependencies(GDSC, clk).

Thanks,
Jagadeesh

> Vladimir Zapolskiy (2):
>   clk: qcom: common: Add option to link clock controller to power domain
>   clk: qcom: camcc: Make Titan GDSC a power domain of clock controller
> 
>  drivers/clk/qcom/camcc-milos.c    |  1 +
>  drivers/clk/qcom/camcc-sm8450.c   |  1 +
>  drivers/clk/qcom/camcc-sm8550.c   |  1 +
>  drivers/clk/qcom/camcc-sm8650.c   |  1 +
>  drivers/clk/qcom/camcc-sm8750.c   |  1 +
>  drivers/clk/qcom/camcc-x1e80100.c |  1 +
>  drivers/clk/qcom/common.c         | 16 ++++++++++++++++
>  drivers/clk/qcom/common.h         |  1 +
>  8 files changed, 23 insertions(+)
> 

