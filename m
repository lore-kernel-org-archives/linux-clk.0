Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F172E040E
	for <linux-clk@vger.kernel.org>; Tue,  2 Sep 2025 16:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756831571; cv=none; b=qJ3TLsWW0ozz3PpyJeq8zkh1hxJrtVfoADRYtgY4ca8gP+3t+7/fM+UW+HbCAK0Mv6bdOvl3tCMpsLc4l/eWPSv74usKIZ41XhSpyBHyFFazQ2pdyXs7RpQx0s/F6Z4zlKrSbxyDSg+F2wFAjknJ73bC/Wn3moT2uT35l0yEHSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756831571; c=relaxed/simple;
	bh=+pd5ibWIKyHRFFR0VYcPPSihlyE9oJC51HBCwcLMQas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HD7uIcKMtGsbU56oiFpHXdf30f0iB/ieDKWtDgxOqzKImDmtUu+cDfPnALwu7wwDzdWRy8x77Gi/5rQv4mFq4VcdW5qzWpVszvF7XM6h6ayfsd8tf4o205/mzsCrxKYpRqRrWv7oZhOxUdgnjg3OTPvddh23wPTPK5ZdCmApudc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J4PKlm42; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J4PKlm42"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqCf4010164
	for <linux-clk@vger.kernel.org>; Tue, 2 Sep 2025 16:46:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/X6rGdPxT1UiWkrcEgByQOjggZJJnyxAl0XI2p+tHJw=; b=J4PKlm422wVwPu4D
	Mc2+lAOVFo9MKrDO5ujM4PiUEFzyZwkV+gGesR+qnpbJX23HOo+F2C5BU3RYQl5X
	Kr31+FJJdxeViNchZ8mMelrxvx6dK6nD5rSi5C2pHD3qkdb0Acr0LaCjmthyXqwc
	8nCX8akkRp8pTcbbAhe7UtoRxiXVf1mXKuUM+IUDliaUfnHI0J8RpEFlj/lYd1Ub
	ODmRslmztdkaHpxAq9f0nKQEAl/QcwQnLmmopveajSt4B9zCllVcv3yKcuf9qIiU
	XApT1/PdWplyo9BzjWqW+j1EkDeMew7uWYIEn2IDyWYOlLQ90imsPqs5pRJU0GcJ
	TTmGmA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0egqt0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 02 Sep 2025 16:46:08 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b4f87c691a7so2606548a12.3
        for <linux-clk@vger.kernel.org>; Tue, 02 Sep 2025 09:46:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756831568; x=1757436368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/X6rGdPxT1UiWkrcEgByQOjggZJJnyxAl0XI2p+tHJw=;
        b=FGk5gELxpYtsTPCgcKupLlAhA6I4hYiS4qVfIceCJ5Y0l5BveiqP5kR+G69yOOd8+I
         nvg8AYoDVfDvJN753lWDNxB3j88LRQpzfPl9HhnDHb9VWxTaJHZkbsITSpZby5vR7Mwa
         IaNyG5ScdY6fU1IVrusRv7EN9kYTLkRZ9UA+uvCL0W+O3u0a924yLTX9Ikkr4Ia0tllw
         y1VPPtjofnLZErtr7dkk7VUs/hKMpIVvSp4sehABXMZCavyhu/0yjiG9m8HO3a9t6OyP
         +GR9FNU4RlwBItIVSdOGxap5cw0CJdncr7QsKq5vvY6rExOXv5lba2Iine/9OuClnje/
         5QbA==
X-Forwarded-Encrypted: i=1; AJvYcCUM6+GxjBuJfuTrsmalSlD64cO/ZuI/o5yuIFeUf0pr644SocgyEFTLabKDKY87txkn/ugYjEjUADw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq/5S9W/CVe+FGDjQzrlPFN8r+MqP1Zgo2dGoKOYpPBtl7nVhk
	mPFK6EtVzkdRXYSOjfsckA8/GdM6FJS9Pb11hcJqHrQ54J+H9/8IBNAITi1C5P7Bg5sVVR8OsZq
	kix6Wbj/LXk7vx7X2Vf39vSLO4anLyvcXiiLfRlhtUPVvWkzr62LXfBCz2wmNsJY=
X-Gm-Gg: ASbGncvQU1jqOJ/G+TOrYAYYjQa7F+9aJYXwhHOGAjUNkiwQ5JUby30/60lA58ueuwu
	wf7svo8y2qzFNeCmyuT9qvErIavBJKdkD+cB5ExRBKUmfHzbLDOUPDRajr6jY2dQFQSkjYfFkih
	pj7NW5igX3e2G1GTpMeTPPBvTXyFIy9Cczq2/UhG1fgFkcFNNPJmuKPRby/wEf87oGI/bDZi+ka
	R4ddtM6NYrhsyP/LnRF1kowNReSBWl1rn7X41TLcRZ2oS0kaIk3xXchr8uoen2ZHaTsOBQhJrH7
	lAXfF+mgXrDIJqtFs6wlIMhYfxxu51bLA5gIV47TzgppqGufQSjYZWzXpwZ4DGoeW1OjajY=
X-Received: by 2002:a05:6a20:549d:b0:243:c5c7:1126 with SMTP id adf61e73a8af0-243d6f0324fmr17153217637.30.1756831567553;
        Tue, 02 Sep 2025 09:46:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpXLMq++UENp17zgkzAVidoy/rMcBj+5w9Vi09jk3fctElIIy1kaIPr2lyaGmIxwQhJIRuaQ==
X-Received: by 2002:a05:6a20:549d:b0:243:c5c7:1126 with SMTP id adf61e73a8af0-243d6f0324fmr17153173637.30.1756831567069;
        Tue, 02 Sep 2025 09:46:07 -0700 (PDT)
Received: from [192.168.29.198] ([49.37.133.120])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd366f95asm12393842a12.51.2025.09.02.09.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 09:46:06 -0700 (PDT)
Message-ID: <0855853a-4b77-4bc8-9e78-bd4e8a211b65@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 22:16:02 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: common: Fix NULL vs IS_ERR() check in
 qcom_cc_icc_register()
To: Dan Carpenter <dan.carpenter@linaro.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <aLaPwL2gFS85WsfD@stanley.mountain>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <aLaPwL2gFS85WsfD@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SB5YpgUbI1ZepgOvk-6NvVD2OtTbGkSZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX/mEQEmAZjSMU
 pppGnzk6Edytp7MQjEUreONKzIJmE/P00zZp3Sw6T4RPPcp5KS0mxpfqpr4GLtd3RUpS2KyCgd5
 ZGhZb/4pXKaC/rTpVakJ7yucP6YQKzqvkc7Ye5v6B81FzjDgsRgjgwFCw3GQqSOR7/MWNAJbs/b
 SlKPjonyzQ8DcLTm2MG/PhL/eIGRTAlmqRzwMjTUWBXW20+Jjke9xsBtSLXQeTZq0I7x4w45r2W
 vupcSMvWk0YxU432IprcqPu7nMYqQP9ixi0MMnxrknG/xMf6j+7uYxOjrLktWyq5KZtVz+6Wmu5
 /JS6009OJ/mKOe+DjaznK3Su+LBrysbSXdxJCvBiFm2B2TnCruLstcnGxmH8CPeKnwBgwzUOr/s
 LefoiC6w
X-Proofpoint-ORIG-GUID: SB5YpgUbI1ZepgOvk-6NvVD2OtTbGkSZ
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b71f50 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=+KjSowhBs1waSO1ngDLaHg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=8T--ygq334zCgzS6G-IA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004



On 9/2/2025 12:03 PM, Dan Carpenter wrote:
> The devm_clk_hw_get_clk() function doesn't return NULL, it returns error
> pointers.  Update the checking to match.
> 
> Fixes: 8737ec830ee3 ("clk: qcom: common: Add interconnect clocks support")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/clk/qcom/common.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran
