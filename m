Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453384BA1D6
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 10:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061157; cv=none; b=i5u1ocBcYzFp9OBBTNPIGzvTs1sjAZHBGbXB12NofD1A7gKylEDAhHnCpxBhveaYH7pqyjlnRUjIOx27uITJ3AVgN7mrdVGdrQciIgKRSbz1IiG9QzO/RYSRR19yn/OeblvrRfK6WbBhFjBrnl/jyYL5gkP4WB6uF891uSfD2ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061157; c=relaxed/simple;
	bh=NA3boDKAwC1ACfxc+FiFlcJYSUIqrYD95FMKUqgjSd4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a/tBaYooJO4U7yY+kaHTtajUV+TWamSPZjhAXcSfiAuHtQtw9HVLgPWldPjwxLddoGXFFjAgUtMrgwCpPS0tEZbM22GSn35Oi5peAwAc0f7JWFOdIISAuwjzFiuF4aeB/+CInpD9mbCzvwQ1yD02qSgZWtzRFnVWPCJHm9WgX9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X95/FT3n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RmqR4Aw9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X95/FT3n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RmqR4Aw9"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9kHfJ2999213
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 10:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xVES5cjeJjK+Muq8ExAtlSTp+lSKmw1ZNAsjhYRd9pA=; b=X95/FT3nTlaY3tgc
	GlH612If7g2x9adSVaHJhD7mDqsj4m0QnJ/6UQXRIlEh0fDsf3zOyhkooZoCfTEm
	TZQFkL8HFIKpeMlFUg78hqtoB03InOn2j+GkPCzW3N7D9vN7X0NT5tC6AdkDDl3D
	210YS8tyR8qVFf9nzT+waR1Xwlr6BZa8FkuhAp/Qc9dwTvePisVvD+/vm1w8yte+
	xQllqj+EjBbPeQGApMcnCMn9Cn5pvpk0GXYZf6iNyZTthaw3UQoq4sy45FKhhfM2
	pYBFrVPctjNxeUKEdSkLD/xghyKuQfKrg2MGyHi0g/TTT1Kcv1enLfMdFkyoWfEG
	sPGcsQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hausm0ggg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 10:45:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e93f266d20so23050285ad.3
        for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 03:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792061154; x=1792665954; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xVES5cjeJjK+Muq8ExAtlSTp+lSKmw1ZNAsjhYRd9pA=;
        b=RmqR4Aw9ICiHMlm7mV5wSi0Eky8M5+7gW73nlNgzOhP3in67oMcuuGQdDYgdNtQ1pb
         Hj5w3hfJEgHndSDOmYUKPQkiczUwJsjP3wAscAq344NqZIWvd7e5dC3NTsDibpdYgZVc
         GPun7fNBc6BqXBCVbESZjqA0hlnmvsBbqskm26bu8wxZEkh/Wb5unvI+0A9cI6n4UEMa
         Ay0VV9ITRTPtjPYjKMNGjoP85xIcPoRU3vS1nSBwZnkUdgRg8o9EVA58ywq5bGkNlM/X
         dr38XeYq8rCZTRZFr4ScpL/Myg6HHrjiNwTI9nVCR3zOyIIxT05dEvODZ2lYO9Y63Egf
         uHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061154; x=1792665954;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xVES5cjeJjK+Muq8ExAtlSTp+lSKmw1ZNAsjhYRd9pA=;
        b=hyIb0IzFNqV+hafgNncHwlB5QE+75tT6zZJfB1OOR5p2QssNs6H8EJ1Wd1EC7MXfW8
         yhP11aZgV/DZUcSaz2TAEIQEdzwFFCYZzzJXrjqILhZOMPhxZVesPWUEzsMw6dBWZcoX
         rzxKcLOZuT/wfTcwgK9ShqTBytCF6KNqFLoJx0RgjxN/T/GKjuDEx5OSPtcgdKPObcsG
         PRcXpIttdJla4jdWKTmBgr3f4eSEyH8jWI1KMnpbC061vJzLzW2RtMMcQDxp5LXR0o3J
         X165f23pD2UpJJZSqxK0Vu+MptF/8uOOSbrFI5X2Hwh+ilxF2A18wejgfVmECWn0nonO
         HWOg==
X-Forwarded-Encrypted: i=1; AKwUvBy7E4eBtpwCVbANgiqXrL7bzqNpdwqvFeGX7UwswrQ5FN4RqPJL87MtWinpdKpy7Nm5DIlqVzVuRXc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJwz7iarui1KaGkDL1ZBsLCGBmL6wXKMXofw9cjGmcefOFAwsX
	VzWD116qC0qWEctWzBlODTRMr2YyAZVqNNjYPG/Xklm0H9RxDrkzUw9CaqUxK48Frec2UUDA7xE
	L+Z5XivrQuYtI11sJ+97MRWtUDfDLqeEK7UJ6f7Y2IEiYAfKvNMjM9/BEaRj1n/A=
X-Gm-Gg: AYBFou3/jgnALSIA6ULRtf27JJUytFDKstpoALlVKOGjys/sNL1dAXMOVD6oMRPIaMS
	zlRHkCeZklh/rOJrhtf/6NNhTX29O0agRmOiulTVBk8hRHUel5vy8LywYO3j4NBwDNHrV9YoWZz
	W6DKB1PEX05dxTb8EM4Z7KgzKIp54SoOq4v6ck2rz/zgGB6NVPmVHLqD+CRK5QAigcveQBwzRHo
	YtG+cNKZKOuY3qLsKT4lFAZ9wyBe2T6Zdc9Lji51Z/zIWOHvacKwxIatpXqZef2PZH7wsAeXfdA
	vPDvKM18VFdMfmlG1RzTw2WvmGDPOserHfOQzF+7vGKJdReyiJzoYmlRmjnZspdtL6vm1EA/M+a
	hITq16K4PWeXbQ2cNKOIyx4YNQ1s=
X-Received: by 2002:a17:902:cccc:b0:2df:7fe1:72b8 with SMTP id d9443c01a7336-2e8429a649bmr162354905ad.16.1792061153847;
        Thu, 15 Oct 2026 03:45:53 -0700 (PDT)
X-Received: by 2002:a17:902:cccc:b0:2df:7fe1:72b8 with SMTP id d9443c01a7336-2e8429a649bmr162354625ad.16.1792061153359;
        Thu, 15 Oct 2026 03:45:53 -0700 (PDT)
Received: from [10.217.216.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8acfa3b6csm55485005ad.41.2026.10.15.03.45.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:45:53 -0700 (PDT)
Message-ID: <5be485ec-7abb-40e1-9a62-aab90524de2d@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:15:40 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: Add GP M/N clock controller node
 for SA8775P and QCS8300
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-5-1522662b6c53@oss.qualcomm.com>
 <DJ3HRRGJZN8F.3UNOV86ZOB47B@fairphone.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <DJ3HRRGJZN8F.3UNOV86ZOB47B@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: n5P4Aj4A1dqLros243lP_k_nhbEnoM1X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MiBTYWx0ZWRfX2G5U/YQW56Mq
 Hz7bh2iED1/78m+0jccUQ1itbG7aE3BxN3YwTtTzm9+YFwzqA9mYG7WeazZkLKI5mHPekfvyikx
 gVJNV7hux/2qZ78rHUXZ6eWRnSbg93YMI0eg2HDFnaybV5GDLb3aKMQVJdKPSks8ZqK/sJN+BSp
 mx2y1jBUJzLZd8G2dIsD6rdzBtcEOMN8a1g/XaPRBHRiWJzF1m66XbGcrCGG+muBX6rk+56VQH9
 W//sWHi3DA/bpfDnDjU+2cHnB4+Z6TaaYBsRVbXfGthjXWuH7JPVVmOS+HovRobl85RPYdb6oDN
 x/YX0pohAJub8Zj1gOZlocaStvPKlnziWomBgHvlSCQXDCFkELi68XfmFvu9D4B7B9jw+XZxu0r
 /N3lL5xaoY1clDXnIv0W61XKwcSOd8WTszWRHvtiWDvMxJb63W5rVCMayD9JaCdgFr34C3K0U/P
 8W6Lv0R8a1a77DzEZtg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MiBTYWx0ZWRfX5m8WtqAd2mNY
 zsXPfNv/FkgcT8TjuPLz/yxzXk5SfE9NHHgOruZniBJqwe1I6vajD+wEJUASWHIF3WISNKuXOtA
 fdWWuZKbBzL3rERPwk0D0zSEcXBm4v8=
X-Authority-Analysis: v=2.4 cv=Eb5d0/mC c=1 sm=1 tr=0 ts=6ad0aee2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=QRVzKC9bvf-Z0aX3qjUA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: n5P4Aj4A1dqLros243lP_k_nhbEnoM1X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150042



On 6/8/2026 1:02 PM, Luca Weiss wrote:
>> @@ -4412,6 +4412,20 @@ usb2_role_switch: endpoint {
>>  			};
>>  		};
>>  
>> +		gp_mn: clock-controller@88d3000 {
>> +			compatible = "qcom,clk-gp-mnd";
>> +			reg = <0x0 0x088d3000 0x0 0xc>;
>> +			clocks = <&gcc GCC_PDM_XO4_CLK>,
>> +				 <&gcc GCC_PDM_AHB_CLK>;
>> +			clock-names = "pdm_clk", "ahb_clk";
>> +			clock-output-names = "gp_mn_clk";
>> +			#clock-cells = <0>;
>> +			pinctrl-names = "active";
>> +			pinctrl-0 = <&gp_mn_active>;
>> +			assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
>> +			assigned-clock-rates = <4800000>;
>> +		};
> Am I missing something, or would this just configure gpio60 for all
> boards for this clock controller output? On QCM6490 Fairphone 5 this pin
> is connected to FP_3P3_EN, so it's definitely not unused.
> 
> Maybe disable them by default and let the board enable it, if it wants
> to make use of this clock?


yes I will keep it disabled and will let board enable them.

-- 
Thanks,
Taniya Das

