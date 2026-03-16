Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D9B34E754
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 07:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773646039; cv=none; b=l6wxasHlwhLXvAgiB2iT1P6Zqc9CWL9afJQLqtBSKTp3qaW1DvM7Uz7+vIkPKGinVUk7WTftqxKVMxUl2JpVng83o87MW8Jl2ZPo+39yDWrqtnC3zEwJEoRtn6Bs6kdTwsAIgIpCRCgoaYUYxcFCTtYRaQAkpadMMH+yK3buUqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773646039; c=relaxed/simple;
	bh=idhP3raNCBc9CYcTy8C7XdEy8xQz3oMFvJUQt6kJp9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Thl4mMcwyLbt/Eh49hHzwUSFkf5dWv6DnVnKXPCWH1X9KAbiaNATWHKIURYRuQdTLROA+bLkx0xUqS9n1/nJIwdLnP2ch+tk+i8p5oh4QaqkOtMqm5FT/3S3jTIFdpyjMrxl98krO+w3CkEYZ/7kgllEaboIqw6HGA6s0FyablQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JlV0p3nL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O2tQ6LVG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JlV0p3nL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O2tQ6LVG"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64l1U2672292
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 07:27:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OK1uBq1HcvaDU6l8IK1ArJBmNEb/gYGGSynId4hWAm4=; b=JlV0p3nLaJb6ZV3W
	L+WI9NGSyz0XgCZJl9CYFvtLJHBYQP4jdieJFB7ehexKdSyYlZ4iadN+rtXTOrxp
	iFoNOIucy0yhjE3uI6B7EDYgcV+W0J2tXZrCn213m71D3WBJv4uStjT1giCY021g
	Tm8Upjs+VLrWtGkYXrJRfpulNbTXRTrxmKcVnXgsmawsINWU8r6DmQ6nCVCixqgZ
	Qqqhg0aIXWi7lekGFt23MiM8cSQOTLPgceRSfl/enL8FLFZNvRRbxlVhSp6QMSfT
	FNbRqu8yp5bqtl9w3u0SyrA0iYOCE694iGHTlEzKrYs9ccJJyV4+NSTk2s+XWPOO
	x/Ue8A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03xmms8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 07:27:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b051befbb8so13099135ad.2
        for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 00:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773646036; x=1774250836; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OK1uBq1HcvaDU6l8IK1ArJBmNEb/gYGGSynId4hWAm4=;
        b=O2tQ6LVGgE08wJ6Gyfjh5M3xxcPL52Ki3TNxzYNr5oG0+x3XY5dq6VL7NEjZ5S1hKi
         HzEwOq80WO7ZSTY2vdNyTJ84a8ozqnXQf1vxG+EyQqvk8dvpsma4g0UMBFSV/sCYDZz/
         CazyyG+V/occYsbTy1ygIX6Tibc1N8ouqPWbYG/hABFkagGgA0937kW3YdSTEdQzBeiP
         tuPh3YEkvv6K+SoZV7VcwCm9VccaDwE18H5cAj3g9ZUX40nY72bZ015yFoOPuwzSOIit
         gTiz7FELgi9FNha/8AkNWkOTsQL6etoIg1NYZbS3b6nTYBcYCsDYlyWcMy6Mjlpspt2j
         WJrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773646036; x=1774250836;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OK1uBq1HcvaDU6l8IK1ArJBmNEb/gYGGSynId4hWAm4=;
        b=mMPMdgUxh/K6t9rr3Nm3f3Ye3OMMNHnd9OKkdALPKkXyFb87BFN4K/U5C7VyVhmIC/
         CT6fExJyPa4DuEqoiCSqSmqZ1aTR04mcnskIRFpaydJQclhzKHhqrUN+/bw1JREc5vEg
         uL4MYy79eWq7x0MkYYc9e5o59iBIwbT60h+zQJdpB/HJUn6nZMdDY9esAy6JY05emiy0
         UFeiD1aFnR35JXwX4SDpscSFaKxJnmmU7H/CLr5oMfIBVzBU3uj5TBw3C7G/WhAgnwui
         a906++Cgs82l//bDrYnq6ihc7cx0GMxsSfkV7Nsv3F6HbpctAR5EE+99WSvRtFrGM1Be
         OJqg==
X-Forwarded-Encrypted: i=1; AJvYcCVUB7eTUR4D/dv26aQa7Rpv1T/+sk6/162PbFgHwgu3xvGSzdUVq5OHaNh8Lwvdmj89ITjYQ7ijcy0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMu/ztJljLQ92+0NylrQIxk5SWbWX9u7gBZjvCAzMBY919Ymqk
	DNjR5LgvuVOa9OdI0JxNsWkK/16vk4LxpeMLO67TNjq6+7AQRz/at7nMXcCdnd4As5edkDayHvH
	OOoBnrf+x1yBjpAyC6ATh+uyXFvbUG87yRzeyCaKvfaSN/9fS3t1hUlCY8ewhCs8=
X-Gm-Gg: ATEYQzxrABJara/Zjj8hMEMfat5BqnovISdnfAqcmtTxN3lVHOx0i7TCAC8nT2GovDv
	nELmxr4TYeti+FXWV4DxwaiBG7BWVwiUtMBsL5EUDYZyVe15xrDtL/5a7xTuXCPdQCX+r/LxO8P
	2FEkBY+FqFjsw+VSFS4UrUvypVrj4r58+wZk/ueCnNnKfGxbZ93qvWsrcq9zneV8zqlOodCMiNG
	g17k2rCvaR0TRyCte0jYXLhjRmpUOm09KUaZG3FXK/137IHZqtxcooeOmsKrfVK61YgoZFJzbmd
	6ityhMEy02X83kMDX8iNHWf3H9NUyVLYgZv8trsosFl6Jcaw1yaTGlVdkodLkI/bNRT5UfIOkAU
	oQL4h7Hn2UKWA5ZdRgu/H84MWFUpzWnRPpnTljQ+F+FAiJBvkX4+IlIWSvvo8UITnGg==
X-Received: by 2002:a17:903:94d:b0:2ae:63a4:3baf with SMTP id d9443c01a7336-2aecaae66d3mr113855705ad.46.1773646036225;
        Mon, 16 Mar 2026 00:27:16 -0700 (PDT)
X-Received: by 2002:a17:903:94d:b0:2ae:63a4:3baf with SMTP id d9443c01a7336-2aecaae66d3mr113855375ad.46.1773646035745;
        Mon, 16 Mar 2026 00:27:15 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece7ee9f2sm99694215ad.56.2026.03.16.00.27.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 00:27:15 -0700 (PDT)
Message-ID: <9b49adde-3414-4e2b-81b7-ecf54faf40b6@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 12:57:08 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] Add minimal boot support for Qualcomm IPQ5210
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-mmc@vger.kernel.org
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
 <20260313-serious-calm-chamois-4a0af3@quoll>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260313-serious-calm-chamois-4a0af3@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA1NSBTYWx0ZWRfXwuvJwTMPEmqL
 l3cqIQ9pUAzbR0wsym6xSIsTHmBVQ/2ja14Rwk7bfFVPl6TcfWK8LYo5iHf/XykUzC5QxMRvBOW
 lMtG+NcOoUJ8iF/h0wjlp7iHz2aCPG8zOR7HAzsA8ktg9jByhlBo44s8+efMO1yyOM7L6Sbc2eK
 M7uOqesLWihhJF1cYuFwu98di4LUE0N/P9WWFB7SeM8Hc1ZTOVdW3ckPli2BQebMXasBwnGX1px
 E2N7YD01D+kIHxTPLy5YIaxcCXWBIcampHE4XEBskP7ZjYwiB1fbdYdjUKAgVNZaYt94qWFTn/w
 9Xxhvod9D/YFv7Qfb8vJc+fg5EBc8zzjTeOTm51TY1hLKYfaLocZ8D5g9+/CDi8wcCkSja42B96
 W9PS8dZ8HXdmRBEXqfPdHVHDrjoOD/IXNY8xANUvs2ZA0c90hZBhX4bDHl4YrPhIe2JxB1WjUvZ
 wnysV0RU4OasDTipSBA==
X-Authority-Analysis: v=2.4 cv=YLOSCBGx c=1 sm=1 tr=0 ts=69b7b0d5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=e8CD1ygSFDIBAwsAQqEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: VKeBQM6iQ6i9pDLWOaTaDbS1VQf00lya
X-Proofpoint-GUID: VKeBQM6iQ6i9pDLWOaTaDbS1VQf00lya
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160055


On 3/13/2026 6:55 PM, Krzysztof Kozlowski wrote:
> On Wed, Mar 11, 2026 at 03:15:42PM +0530, Kathiravan Thirumoorthy wrote:
>> The IPQ5210 is Qualcomm's SoC for Routers, Gateways and Access Points. This
>> series adds minimal board boot support for ipq5210-rdp504 board.
> You combined around four or five independent subsystems. Where are
> dependencies and merging conflicts/strategy explained?

Sorry for the inconvenience. I will split up the patches per subsystems 
in V2.

>
> Best regards,
> Krzysztof
>
