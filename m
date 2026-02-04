Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06BC34C83D
	for <linux-clk@vger.kernel.org>; Wed,  4 Feb 2026 17:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770227177; cv=none; b=N75ZZXRY7Qtap2uZEieU/dP202yby++al0lkJZfxhPjlQnhHXb6tfAe5VJkm2nlDe8C6SEhSTCy/sdqrODMcl7cNQGYr/hQbg3fIEZCCRXRs+wzYtPKIccaTc1YazwUmsrKWXMfuOBLlxkgGD+Xt9MuSHeBu+/D5ETYcl0uboWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770227177; c=relaxed/simple;
	bh=q6aJoYYkOWu4y+iIYT/azwE11X8NhPbw96tSLu3BCZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XrnwsJj8h4Rw/g18wkLiBA/ls1edXQRhaqNSlWoBS553xT74VmF7Nw+IejC2JlF9/cnEloNyRBswz6dLKYHmbMUV8d7u2z5wUugj/3L94hmSoUgw9noN3qR9NVYx1Z8jS9tY4qHnmW0UGx/7SjWe5ysC5x0HJPJY2j1XCp6fdz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BaeTvT7Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VNMRQXIx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BaeTvT7Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VNMRQXIx"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CISjF096170
	for <linux-clk@vger.kernel.org>; Wed, 4 Feb 2026 17:46:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zqj15cZBNlJt4qforcNTiS9Iq8vcHwxu4xpL+2tTcnI=; b=BaeTvT7Q31/iLB2/
	Ppe9MI+7oE0l0flHHdSt/ncVYt1l9bmLdaGcBh0xssyZU1hyae2UherDltL5eLNP
	4mltvUaCa7+O7tbJb0y7ruO3Syg9KrZ1u7vgNP+7wrt6t3MZkbKp37nDcw9Cl8st
	/btutYLYdz7oXR45kYugGJu9GHkhp5PXpdQR1dfuUAKkuyBiEvCivZuHO1tXVEU3
	2tpHZyQVlLXh4+eUMNsMHCVszwWAaT9Fo3thm+2lPBWmkZfN/9cmBhVu4ckzKQ5X
	vSsguALhByiO/ssviObqK+Z3is0peeRrkV4KQeT+jvnM86mfvgDcpkl5JodyFPy2
	7ddGZQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c44kbhagb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 04 Feb 2026 17:46:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a8f8c81d02so773615ad.2
        for <linux-clk@vger.kernel.org>; Wed, 04 Feb 2026 09:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770227176; x=1770831976; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zqj15cZBNlJt4qforcNTiS9Iq8vcHwxu4xpL+2tTcnI=;
        b=VNMRQXIx0c8ojpnp8o9nYsH0lXyTjdMy/EjRVAveNNa/i63ih3pC1RgSMkLp3XxtK8
         IEKEHlZA/5/p4A/bVXA+Ota6w0qhd7JsWoFogQmFa043dWMe3cLrmWWCUuvBXKIcSefY
         wDtZ0C+oICi3a4yR9X+VJlw9OarZE0Ba0qBk13Kr83Y36ZPae4t612JkyS7ipdmWZ/hr
         mAhKZwiy2W/bgZ2UHvY+9J7yBVH8gROyQPJ9jW6udoET2oHp8F8qmoeK6fXLrL6m4Ywt
         Z/ExA0PHPlhRFFMKvoRUtJSeX9dWuAPrZrnjKTwASYDU6E1K1Y+OTfzgxCFihXIXLt/B
         arng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770227176; x=1770831976;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zqj15cZBNlJt4qforcNTiS9Iq8vcHwxu4xpL+2tTcnI=;
        b=clMlHYykl9sQyKSYFD5eL0SvId+pugZe+lR1PzbRwBQglk6osFKeRDq38JM5FTvYCS
         PJAtBLWdLKdnvwX3g4q+6YHCVtAKrulXLWhrp4PKCAEl0KC/ZMVMvZZ7P2/vqrJhQwEN
         IiNdltMUuXm64MijN6BQoom6Z+qHkMdDSk7lhWE3NmzSLRXhsyzOHd8BLUYulfvsMCPk
         bOOZZle5hm73eaPyMVo/RrrjyaXr778qAQYD5dEXM0H2bwwkZgzA5qqkV5PDAs8VBDUu
         rQYgOf1p3hgOrylnWm8VuO2kKI5Ulg8tA9CCu2HN8oqgB0Ig4jy33kpjwDlSZ34lGtzI
         iYNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXzz1U/bqV7usrGc0CdPzrky2n3GRN0CKh0ayMwIGnurgIbRh55Pim1xBoxoe7cvovF6WokPv+X6I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTC7KjVRDiXn6LoPMPFUIRYPigacgOCoxEprgeDkJDcs6fs6OM
	zhEYYG+URX8CoUwXK7LhOsLtmWgM9l0b7sxJbThJRBr1qdMsJTYVCBc+z7mviEUmWqi8Y8jWj3Y
	kbn4GOtaPkefU64+MyRrYoruzzi28n101SWWOKeYftKakPknog6HQZZQ+nXoPgaQ=
X-Gm-Gg: AZuq6aJaK0dNKv9eqGaN1TCpNM1UvbHTz23imvosanE180XBJxXtTPwA26HiAG6GN2T
	sU6zp1LQcunifY/hGR61ipI66hGaoglZgPPdA8Scp1Ezjctct/Ai/knvslxs2H7OxAAAhmVuOYB
	75K7DYqtsOnlGBFLVd/qjt4h6M+t/C19O5bivIozs6ws6fUkUfAG8X88ZRfQ3SdpyHbyd81vdqj
	LJnrxXus2IIKrjMX8fjyVmvNvOax3pmt2que4WcBGkVYxVswqfxVKSaQe30kcKw3VICJbmveckr
	ks7t+WYqRa+wa2krP1KzhFbDXV+5wcQtmgWkPGlUhfHjlvPw7y5w3hBt0kgrFAuAIt5P0fvj+k+
	0QnMsE4kArtlU7ErGs7qhnvC1xRKBIABpQLmeMrF/JZPi
X-Received: by 2002:a17:902:f789:b0:2a0:d629:903c with SMTP id d9443c01a7336-2a933e91e59mr39762155ad.30.1770227176315;
        Wed, 04 Feb 2026 09:46:16 -0800 (PST)
X-Received: by 2002:a17:902:f789:b0:2a0:d629:903c with SMTP id d9443c01a7336-2a933e91e59mr39761945ad.30.1770227175852;
        Wed, 04 Feb 2026 09:46:15 -0800 (PST)
Received: from [192.168.0.103] ([124.123.178.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a93385127bsm31549295ad.1.2026.02.04.09.46.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 09:46:15 -0800 (PST)
Message-ID: <41331d53-d3f6-4238-86bb-eb1f43f263ee@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 23:16:07 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: clock: qcom: Add X1P42100 video clock
 controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
 <20260128-purwa-videocc-camcc-v1-1-b23de57df5ba@oss.qualcomm.com>
 <20260128-resilient-industrious-flamingo-bac209@quoll>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20260128-resilient-industrious-flamingo-bac209@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: O7AvBr3_OOhMdzymwIvVG07JgjpnCDWY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEzNSBTYWx0ZWRfX1E+Brfl92TnB
 1mlfY+q+MTm3eVjBNvn3f3mzwetNdawkO1fcDTbsD+f89lpDxRnrkazpVuk0Wg7kdmyRycj514L
 A2JsGE9ylCeVaqFacpxNyAoi21VpR7T8MDygxj0iwRYP5LwGNY20DuQiqlt0xc7FOyTkH4fNdG3
 d166p1jRFZvZ6C5BhpidqfYsJoYPSETVHjPC3MS1O0AlXRpr20aIllbImksjVRbTH/vHEjzcSfP
 k84TGPAsvyxIP/iMIujEsr6Zz7XMolxKnSPgjyX6B5pBiQXYPIw0MH83ryeA2vQSxyPiJePp146
 J20NQ+fWjdyIqPbZhbuQzyENm9LPY4kyjuiwJe4gwYwOJA7G26OqtPbzWIEsuFCCOZ0dBkhYjLg
 VgduXINVqXcwg9xaAlxJFh8po8MBBqtJd6evqkpWEzBfKjvs5xZT1jJAkHu42A+5UEHypNBGHaf
 JTwyiHn/PQpvjvr63Rw==
X-Proofpoint-GUID: O7AvBr3_OOhMdzymwIvVG07JgjpnCDWY
X-Authority-Analysis: v=2.4 cv=HN7O14tv c=1 sm=1 tr=0 ts=698385e9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=2H5/5ZkxJs/wMzWGxXwROQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=5u0znoZatv-JOXQg97oA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_06,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040135



On 1/28/2026 5:13 PM, Krzysztof Kozlowski wrote:
> On Wed, Jan 28, 2026 at 12:56:32AM +0530, Jagadeesh Kona wrote:
>> diff --git a/include/dt-bindings/clock/qcom,x1p42100-videocc.h b/include/dt-bindings/clock/qcom,x1p42100-videocc.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..eb6c9b7264f8cbced7cfa0001903238ffa168431
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/qcom,x1p42100-videocc.h
>> @@ -0,0 +1,21 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_X1P42100_H
>> +#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_X1P42100_H
>> +
>> +#include "qcom,sm8650-videocc.h"
> 
> Don't do this. It's already a mess and was allowed as an exception. Now
> you grow exception into pattern of chained bindings.
> 

Yes, will drop this approach and extend the existing SM8650 bindings to include new clocks and BCR.

Thanks,
Jagadeesh

> 
>> +
>> +/* X1P42100 introduces below new clocks and resets compared to SM8650 */
> 
> Best regards,
> Krzysztof
> 

