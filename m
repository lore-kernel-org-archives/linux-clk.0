Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45721E2834
	for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 07:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754982251; cv=none; b=QaHbA+qx2c5WxSPd07lcj6oJitlYV9iQmtOgostr8beTP7HeHsjn6bp+u56JoBWODD0ew+98EXV158z9V3990L2ntfW8JLmlvKRdqjYcyCMQFClfQgOgdz913UFgl6YNuSziYzuQiOOoQxKImnaKFqHj6XL7qidwE0Jpp8+RvAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754982251; c=relaxed/simple;
	bh=SeQ62bmZfam91Oav+2opoIAo/S3/fQamah6X6vhlZQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QzjwZsrl2uEf18n5vr1ZMJ/GI4rqZlVgvOzMhBTKvLm6BdXqc07ye557X6+mdCu2RoWl6Lv8kNOSWT/xZicDJl7IRvXG+GAePFjX27w546Iz60Bxt2YpeloO4vIDD/v4GYrc9b85PIp6vDe0P3AYkDR5lbMaBJPsYR/pvR27m84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cOKTe4tL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cOKTe4tL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5H71F019161
	for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 07:04:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mV/eefy0c2LWvZ2MBX9aTUa7zNPhALNcsIQu9WG7amw=; b=cOKTe4tLh4hgEZgN
	NiFndJLjrITvDbwaOLCSJ5JW9Q+Dp0pQI29IEcPli0z1XNcoaJb9Zbchk28bgzOV
	9v+Q1fbm6BOrIkk1TCnOT/wovin01acpLFM5ldjkgnnmdVD3jXibZW6eLU0jVyQy
	UPPIu8zyvxPh9Su6u+hPa3mXRpiTZNwxZgIQH7mmBAyJQzXAk6mVfI+qaDPe1gIF
	BzvYSH8ykAXqJwES7eEafRrS7WMGyc35JGgwUim+7gV+Ud+fiptt0mJgOERvcYtD
	T48n1tYzFJtxfcv4EGpKiihMO6ORxNvlrTQFBwP+tVhGt8GzLUoL4MZJWKQhils3
	cZdCig==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxduy50e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 07:04:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2403c86ff97so77188135ad.1
        for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 00:04:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754982247; x=1755587047;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mV/eefy0c2LWvZ2MBX9aTUa7zNPhALNcsIQu9WG7amw=;
        b=kpboGHQv64D0/IZBelL7bfp0WtBYxpi3Me4R9OXg4cAf/+N88a2/pNA9Cr31LKEapO
         tBMfkm/rXatPn5VnLu/z7XItIr2uQqybE/WQbea3xjCwco9wqjmmjJ1qORV2o86hJ+9W
         losJsMMj5xerWGwiXcWXr7l4GjRDeD+2DKI6f9ULadONgUj2ds2oCJYUYgmpu/fBbEAa
         N/Ug2mhD8DYm7xw6BfyZsKilJR9gwnCS7NuJIOJ29c/KylkCOUPoT4BeHcgQW5gsEkdy
         P2YE+CcL3eKo3U02PuEqA3kytDHCnHMYc3Nckyu/ordXWS/xIldk1eHDfkAaObQjj/Po
         fTQw==
X-Forwarded-Encrypted: i=1; AJvYcCXhOcuqqVvCQhJ4VdutFUpY/n19J623olyyGuz9rQ354ceEnBj7vZGLn1r2PUPVNH0CgYKH3QV+kNQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJsLSDdwjKLjsQnmJHEVN6SQ5uxZlU0OHei/DfUebGyFbPs5jV
	lTN0qXDzldfX57S0H3Q4YjlwPcMrZO1WKcz6HeCk5tNWpPxBuDPckE6LtvEh5cB5HfYF+WADyVn
	Poq78zg6ieLNFWqqCL7/aGX0rOOKZtBBrkNoY88/cSLwOVYDAznBmkndrsCv3a1w=
X-Gm-Gg: ASbGncsCFDlpO6L2wpoKFutS2UlIxhdsB8zgtEvNtmtsRAXhJHPB6VBhdkdx/6185Pk
	DCo4Iy+LX64Jq0JMFximDe8+XjLzBOqc7dR0J9Flkhw295ZNpfli+Dcm2Bj1izoRfIsLlBC2Um8
	ojVydWi/PUnyDau73nAGl7xeXMUWIgGdC4fLMVpqT29mBJ7VsofoNaFHvYknGpmKrMn4w1+YVcO
	MJDy5ysv0oxNUrv52aBFaz5kNXXWRxyfe6vxt3vdEQ+oleKjkroiuRhA5bYPCOQ1GRNPTnKj45V
	eW50VrVR4oiBZqPf5hnvuIxSro9LcalkM+io8gfaiouJWuiFbtjX/CuMRBoTEA5m9tKO
X-Received: by 2002:a17:902:ecc1:b0:23e:22dc:665c with SMTP id d9443c01a7336-242c21ff9ffmr231135595ad.33.1754982247350;
        Tue, 12 Aug 2025 00:04:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGO/1UIN7L4sGlkN3jDrUIwqP0FYBWbFECG0kM5UiwqQaO9PrVZPlbyIJ4bCydXasYvkxNGSQ==
X-Received: by 2002:a17:902:ecc1:b0:23e:22dc:665c with SMTP id d9443c01a7336-242c21ff9ffmr231135295ad.33.1754982246875;
        Tue, 12 Aug 2025 00:04:06 -0700 (PDT)
Received: from [10.217.217.159] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-242b0934d33sm127719215ad.46.2025.08.12.00.04.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 00:04:06 -0700 (PDT)
Message-ID: <adcdeaf8-a3ba-46c2-af7d-e37bbc5341dd@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 12:34:02 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-qcs615: Fix gcc_sdcc2_apps_clk_src
To: Bjorn Andersson <andersson@kernel.org>
Cc: Richa Bharti <Richa.Bharti@siemens.com>, mturquette@baylibre.com,
        sboyd@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        srikanth.krishnakar@siemens.com, cedric.hombourger@siemens.com
References: <20250729094943.863392-1-Richa.Bharti@siemens.com>
 <81a1bd2c-ad4b-4042-9116-c1604e4f0d98@oss.qualcomm.com>
 <e54l6omqbop5tlithm7cseldtbcz47sde6fo6wcoxvbordoa6w@l63sxertlypq>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <e54l6omqbop5tlithm7cseldtbcz47sde6fo6wcoxvbordoa6w@l63sxertlypq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689ae768 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=a_U1oVfrAAAA:8 a=bt-eykdaRR2Tth2JHncA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: X5UWVkVRA7_XFI_MSVSKagVFjh69uh-r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfXxSsSGEE19zuG
 Gs/o3yb9Ma5T7ZHMTQ0oEcU7gej8I0vw7mUfuIfpebtGoE0+MqZ5wJmiZFnEQ7PLzBrOtLCRGjy
 SippCcz76cSmMFf1ytdKYUOw+EycJLrRYYW74kRWzsjxVToTWYzcpOZIMR5jF/B25Hza0QoLCAg
 amnNTxH0GtONeokBt2zJdpAIVRo1csePH/Ml0zljgx3pt6wz38BrED8NJyquJcgEKm0YJeh1B6s
 DzDSaxTU57W4ydK1XgEKbK/fvKPBQga4q3crIDa7C5SM12uByq33AwE/3a6/j1gkTE2585ziTWN
 rZ20DjUoRCeExFl0WsFkymvXVmRZrWrOQtYwRcw49eeTGEDYJTrnuSPiYeG4r5jV6xMFiNvpvEt
 XI36Ylwh
X-Proofpoint-GUID: X5UWVkVRA7_XFI_MSVSKagVFjh69uh-r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025



On 8/12/2025 9:20 AM, Bjorn Andersson wrote:
> On Tue, Jul 29, 2025 at 04:08:21PM +0530, Taniya Das wrote:
>>
>>
>> On 7/29/2025 3:19 PM, Richa Bharti wrote:
>>> On QCS615, we see the same issue as reported on SM8250 and SM6350:
>>> "gcc_sdcc2_apps_clk_src: rcg didn't update its configuration" during boot.
>>> This is due to GPLL7 not being enabled by default as a parent clock.
>>>
>>> Setting `.flags = CLK_OPS_PARENT_ENABLE` ensures that the parent (GPLL7)
>>> gets prepared and enabled when switching to it, fixing the warning.
>>>
>>> Fixes: 39d6dcf67fe9 ("clk: qcom: gcc: Add support for QCS615 GCC clocks")
>>> Signed-off-by: Richa Bharti <Richa.Bharti@siemens.com>
> 
> Thank you Richa for your patch!
> 
>>> ---
>>> This change is similar to upstream commits:
>>> - SM8250: 783cb693828c ("clk: qcom: gcc-sm8250: Fix
>>>   gcc_sdcc2_apps_clk_src")
>>> - SM6350: df04d166d1f3 ("clk: qcom: gcc-sm6350: Fix
>>>   gcc_sdcc2_apps_clk_src")
>>> ---
>>>  drivers/clk/qcom/gcc-qcs615.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
>>> index 9695446bc2a3..b281f0dfe165 100644
>>> --- a/drivers/clk/qcom/gcc-qcs615.c
>>> +++ b/drivers/clk/qcom/gcc-qcs615.c
>>> @@ -830,6 +830,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
>>>  		.name = "gcc_sdcc2_apps_clk_src",
>>>  		.parent_data = gcc_parent_data_8,
>>>  		.num_parents = ARRAY_SIZE(gcc_parent_data_8),
>>> +		.flags = CLK_OPS_PARENT_ENABLE,
>>
>> This is not the correct way to fix it just because SM8250 and SM6350
>> uses this ops.
>>
>> We are testing the right fix internally and will be posting.
>>
> 
> Please use such opportunities to educate us, rather than just tell us to
> blindly wait for something (at least share your thoughts/hypothesis).
> 

Sure, Bjorn.

https://patchwork.kernel.org/project/linux-clk/patch/20250804-sdcc_rcg2_shared_ops-v1-1-41f989e8cbb1@oss.qualcomm.com/

The RCG configuration goes to a bad state because the current floor_ops
tries to update the rcg configuration even if the clock is not enabled.

The correct fix is to ensure we do that when the clock is actually
enabled which is brought it by the shared_floor_ops.

Please let me know if you still have any queries.

> Regards,
> Bjorn
> 
>>>  		.ops = &clk_rcg2_floor_ops,
>>>  	},
>>>  };
>>
>> -- 
>> Thanks,
>> Taniya Das
>>

-- 
Thanks,
Taniya Das

