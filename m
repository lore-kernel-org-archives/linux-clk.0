Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A44F381B10
	for <linux-clk@vger.kernel.org>; Wed,  8 Apr 2026 07:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775633171; cv=none; b=XTNXGdAYUKi7eRghXiB+ydIk9Q1mTAEY1g+5Q2Tci2g1cFyUMWoy44uKxUL5H0P80DogWMeCuQC+TVFOoLMKzHfLm3sdGSrJTXtYFEGZqKHYQgaoB5+A8DPQnxOAvpYy+U2B33eVT05AdOJvzrHIsbFR/C1l2nE8ufpBWamrJu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775633171; c=relaxed/simple;
	bh=Ig5jcY66F9voThV2woqtPxfrHIzxaD+lt/JsXQI6rqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AVrFFunwWR45EKy6dA+PCBhkHi3mUezMycZDDcEzqKonrvBgRHPJc7nUC+J1d5SJGKT/wr56JOEOfXuqq/jligy4lWy6X8ogoc80MKI3hbKhCk0hQB5NXPV8uov79PrMSr8L0vuHgb/LCdE7DMqnV3EJXQETCRYzdtBbK+StKuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DxWrO6rl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bexe6d+M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DxWrO6rl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bexe6d+M"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6383or7T2412209
	for <linux-clk@vger.kernel.org>; Wed, 8 Apr 2026 07:26:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	11H98f1tYHIJpO6RDSqhNnaFKcnwdWAOjgMNXJCTo68=; b=DxWrO6rlXv/xzJmY
	PuJypwdfwep3auuCEBuDudk9VTN1ivnHRmd6ih3uO+QWRP5ksr1+N2jE2o+BDT34
	lljlj6cVRiAPVOPBulvVDDViZd7Eo9vPeGmpQP/zeG0jGDIhppWuR2bgOBAiCILR
	ZyNDF6EAwt8n5I4wUK+HRbM/KXGFEVhWhUmJ2eG0pVPRNAWyBMXIhF7gDlzxj8q0
	/GoNnZHNHs83F+GE4cuojKTGouI0YbaMKN7WfcgiIaksaUwO8lQ1g02YMKFIpN1g
	aw8sGl3pztCYv29nY5rcrQ1L8/GhNBeuxyajHRi2B01qdi4Quk9xzM1eJg5vGQfB
	MrWKjg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd61vaj59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 08 Apr 2026 07:26:09 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2523e0299so147387205ad.3
        for <linux-clk@vger.kernel.org>; Wed, 08 Apr 2026 00:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775633169; x=1776237969; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=11H98f1tYHIJpO6RDSqhNnaFKcnwdWAOjgMNXJCTo68=;
        b=bexe6d+MPZQrRuSLupaRdi1MKNcq1dIMDKeF9gEhQto9Hz07t1yH2wXhRxObhjtUQe
         cVyjLsKa3gN3rCxvQUTiiWHe7eeAz4TuNVoyMGqTgGROjYKDKqwDfjWGQh1CqaklbrBk
         gLsX+i06HIW0H3qnG8OKfwW37goCkAUxiBktsyqyRbbg7cwEtIVkdfqUGdbc7X1bRxnF
         CqzleaJjfrSoWKHeWaPBa2eZe+BWpf8BOg2r5BZwdj9gBYyMatwskIRG4y4maZBmXcfz
         M+l7xS2rgnMF9YpiGZr2a8tYjziuolRBvDnMKMjTrdxYQkCUIiihtQh/YJ4XviG7GNMp
         atzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775633169; x=1776237969;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=11H98f1tYHIJpO6RDSqhNnaFKcnwdWAOjgMNXJCTo68=;
        b=Ny5piGhldpqGktk4OhCt6vUFCJM6FwZ/MvCx0nVuErwNxF9v0gBMxDGi5CyCItNUAH
         2lKU/8OI4ZMl1Jw1oBL9GuueFVsJLbqwo36rRQgXQ8TX95T2w5I+F3jUK2cnJCuh1+J+
         cShCOR9rmdDDn1Aq2yD2gkaxCXs1o89ASCPHQE1inBdtuVAlJyXpZMnqqkOZ3X+6VNuZ
         KvWVdfwix5ZyNQ508h4UWXgmv825qEUzd0fGBUKI5hoW+eFbB4W5waNXjdWWsOZ7Rfhe
         ZJN8ZzLMEmHlubiwda+SuhU4v0w5sgbuF4REJWZMZqpRl47ohZWKvAd4yDnYY+2H0SkO
         B2mQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKDDjLWrlgzkwuM6MtKOXS/CnfzWvD/n+ccn+pIStIWg/eIhbQXZruy8EZQBFvYS4I7yAniXYEcys=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhXzunHafH+zows99xMFzFi11GcfvRXrBeLb2wn5NBEEMx2mRg
	t/H8gKI1X/zZp7qQd6O41wY4l6y3UpFZrjxR1Y4FqKe6Pnys63vm+WyraKuf839xsKigKgFPzDS
	wWAm1f6jpYXV3ohs0AnLiL/6lbfPIH3mpu2wb5isE/rrO6RmgS+3kzCKqzwIfvjE=
X-Gm-Gg: AeBDietNrAkfSuplJ9uCOVZeKcGmcMPP8k3I2WuiYvQ129+FJC4BZBpF20MGh2fjTUe
	9jSTcY6Uuh7rWc/UlNq7mFoUu/99lwtGUXCnM9nf/7xj/thIlr1y60uBUrAnh+HzBzHWm/L0Lxu
	iitHAbaYfJ1fkXGPtoiXeqEuvpveHSuowtTglRA98v07SDh2UgEpRm7ve3hQ0JLSBUTUqGrhlWT
	YKd4qrnxw7RbjIM3aYN9PpQdcDtLzBP6MVUWxOmoBxrpNn7J1hqeNbwugy/Vpw9bhICOgfU5ihr
	QH/O/R5FqFVX+EkA7PyiAwgMzwsgbbwBgeI622ftmMn0wEz3ek38BZKnD3jV/Bh78kY/zPPNXGf
	vgMNgkypL/bOtc3p5Mkn97lNcBOOz5l3uJTUarAUB+8kqRV+wAQ==
X-Received: by 2002:a17:903:2c05:b0:2ae:7ed6:46e3 with SMTP id d9443c01a7336-2b2818016dbmr223333245ad.27.1775633168698;
        Wed, 08 Apr 2026 00:26:08 -0700 (PDT)
X-Received: by 2002:a17:903:2c05:b0:2ae:7ed6:46e3 with SMTP id d9443c01a7336-2b2818016dbmr223332875ad.27.1775633168219;
        Wed, 08 Apr 2026 00:26:08 -0700 (PDT)
Received: from [10.217.217.198] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749a4791sm192337875ad.66.2026.04.08.00.26.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 00:26:07 -0700 (PDT)
Message-ID: <a573a9cc-7426-4d80-ac9f-e084e72207b2@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 12:55:59 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] clk: qcom: gxclkctl: Remove GX/GMxC rail votes to
 align with IFPC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <20260407-gfx-clk-fixes-v1-4-4bb5583a5054@oss.qualcomm.com>
 <73196147-0133-4646-927d-dbe93c254286@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <73196147-0133-4646-927d-dbe93c254286@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA2NiBTYWx0ZWRfX+2VnU/uioWXA
 LCWFQmbpmAHwATE8sgWT94S5LjfnOKksR7mJU1QOPvuzel+UcEluDmfiGEhzGWu9n7ALMboTeRu
 4n6cRFamVxMBHHTR5CWOob/XkTXo9OuTZ5E+rylH8CucIs1crSdl1YWxF0wygvz7mtu4YXyWQI0
 3teTvwlXsyvoSBgmjb5iwztnC+Tjm2Lm/NXjch8yOVxAYRZrNe8f9+q0Jsr88mr7qRo7ZtKzhQb
 YWl/Qzg6euY0bVSMRbjdQQ1fE2ymUwQyLeCM0g2HgpVSbBtv2rRblxAS0jU2NKaPcUEIzlJ8ulS
 R0MNBiQEwOB/YxgFaaiU6LDehChgS3x44x9jDTi4wtl4Y67+9zW18NDHhyCPOFHXmaoY83IyKTj
 ka1A4VNLnzuR1YB9wtF1Au85MM9Q2zXwQJRHr8K//ZdpydsOptYEA6jaIiMDcXEZerFojyI3FwQ
 HmF/xY4ChKLWm3RmZrg==
X-Authority-Analysis: v=2.4 cv=FecHAp+6 c=1 sm=1 tr=0 ts=69d60311 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=lwYRxUUayc8gUbovT3YA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: kWJ29iJJPjxaz9jU3y87mKiVJ_nTkJTh
X-Proofpoint-GUID: kWJ29iJJPjxaz9jU3y87mKiVJ_nTkJTh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080066



On 4/7/2026 4:59 PM, Konrad Dybcio wrote:
>> 
>> #include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h> @@ -61,7
>> +62,15 @@ MODULE_DEVICE_TABLE(of,
>> gx_clkctl_kaanapali_match_table);
>> 
>> static int gx_clkctl_kaanapali_probe(struct platform_device *pdev) 
>> { -	return qcom_cc_probe(pdev, &gx_clkctl_kaanapali_desc); +	int
>> ret; + +	ret = qcom_cc_probe(pdev, &gx_clkctl_kaanapali_desc); +
>> if (ret) +		return ret; + +	pm_runtime_disable(&pdev->dev);
> My understanding is that this works because we have more than one
> domain associated with the nod (so the generic code that would
> otherwise enable a single one so long as the device is resumed
> doesn't apply) and your previous patch ensures that after probe, the
> clock controller is being put to sleep, right before
> pm_runtime_disable() executes.

Konrad, by disabling runtime_pm will ensure that when GMU is moved to
runtime active the clock controller is not runtime resumed, which would
prevent the votes on the rails as per IFPC expectations.

-- 
Thanks,
Taniya Das

