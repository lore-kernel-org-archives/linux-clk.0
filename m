Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2B42EA171
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 14:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778680885; cv=none; b=us+ucppt/5F+CpJs/x2JQPWaT79mDM/j0Zs4XBStofgPElB/s5cRVR1vGJ/SOjUESQSvSnpGOFCKz279aOPg7DDUTpNxgS6hunlpyBFX74qlPadv4mRaQihVDp2gSxGUdIXGbBChgCBDJTv8Rd1ih93dmyYoXJL+b3t8Zpk6hWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778680885; c=relaxed/simple;
	bh=RR1P+F/lK7MWgQTUPi8VJdox4tXBmbdLcyaJFRdb5Ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gq98QxpeZAtGnP8OZXi0jEPPfX97tFu8lusXAKcCvFxhObd/CCptq3aB2veN9/iiUWtzE7lf640TIFf6NqzZWM0q+XDjfU19Axvpu1M9XO2jDF6pUJRl7idDf6WrLNtWx5MR51APvAcugmVGLgAuJHtxqIFWtk4OIyfKl6NOc5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PHZJVhkn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QHbqQuFt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PHZJVhkn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QHbqQuFt"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8mEiv3474773
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 14:01:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W1d5o2XJOwpJ38A2n5YuZxfC
	k7Q1SB4UhnBShn0r8oQ=; b=PHZJVhknZYvlYbLQnPjjS6OE1Frx5EwaUWO4uqA7
	/Q9N2hO7Y1mHMqAAp3jbbx1HzlbjSO4dh8kgb7gOleBP8CTxMZoDM7S/kEp2ZeGc
	Zn2FABxXRGcmTCvIBUlfhPj7RstokeuEaETrNxXNPe/dU3y7VsVfmK5Ke6G2ezRO
	1MfAMHJbsbHxHrGOKfiEh//H+VRcQlY0tsbqyoMGEas16O8DbgZ1blO+O1gbB4fe
	K9R6eNcBQIHrwWMBXPFPMCpytgD4wC9F8vCDzdKVm3mOi6RSpwfEkktjBcjxQHhO
	zjX+ZCdFCrJhX3uBK6sz3JnXWWJgnMu35p18jXj+MLEJBw==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p41955f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 14:01:21 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-69b4f753046so6422826eaf.2
        for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 07:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778680881; x=1779285681; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W1d5o2XJOwpJ38A2n5YuZxfCk7Q1SB4UhnBShn0r8oQ=;
        b=QHbqQuFthvFVuyF5kSp1/7BpqpNI23olNIC4WTEEKpKbmkTIqcfJe1iA6/GcuPJSKX
         OhfXk+EzF1y+Ci+elQraP8wREoTk6wFveiyR81UNV2lZvDTbqn9VwMBa5IE/etRsjRX7
         3Y4DI2dniN5WDc5nk63Y2OYZ+3xus4q2vk9gh1kF6GG1fQQn3RxVRpfr6LDLDCBlical
         ZEfBY7xb4qafmTFw9ZtlbmpL/DtRwnr/NGyC/MbLLeubiq10uqlzc14kqKVoG/s31Omk
         2J5Iah9zB1SyK+OOclcwScLj6mbibHQkFlLs09bxcGFxtxYkf3eWzHbYrxXH/2f+jKLf
         XJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778680881; x=1779285681;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W1d5o2XJOwpJ38A2n5YuZxfCk7Q1SB4UhnBShn0r8oQ=;
        b=abAilV8Y5T/MSmMCrI6uKGSKceCLc7m7s9NQ1crMNd/hq4CTgMO+UT3PccxV2xO3dR
         B4y626QcTtlDbRsFUD9IQnWUgjlDtwGYDGOwGa1mt4QH+0B/XltRyPWu/ISyrIJGvhGs
         UCawM9mIz5ZPSi0nPS8kKhK8kWuQ7/Zohz54aZKyWWe7ulWN6rxG51ZOXE6pt03vQ+RS
         hQXMTeOpc9x0qT2JfEV/F+N1RMjaemRcrKr2u8gOY97jppvBw+8663TMxCN+hqTAlbw3
         If2ogcG46oIicdxxpw//v9Uv+Ay1RZuvR1Tetk4vV30ljG5L4zp5Gu+h3nV1kIyyFd5B
         mDbQ==
X-Forwarded-Encrypted: i=1; AFNElJ8sRv2paksATn0XzaauJJDpMeiEesf9LWWcbr+o12eYQj1WIfelMrywt7TYHVpxfQoUwFJ3uJq313s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIfFA5Rpc7WHzdymfL11LUvTMboACpU49GqBH9Yb/WTF3qrqen
	n6QLwMNjS/dXssSwklSC8zmQDDCn2s2XTcCPeSWjnFCTpQdlheRyTeI9Hkz0PuV4sCzKCbDKXkX
	mIlQ728BoVie0eCnqlnj9PdcULoRjX3PS6+Rzw1y1TojUl3y18X3SdkKCspCyCic=
X-Gm-Gg: Acq92OG02OSwtmEk5OXAp4NJ5O8+HSln1wFR5EwKhgQDMDcE7kqAkIhpjkVGhbcIT+s
	y28KV/cmFMt73SiAvQQ6ylmx5p8aLcSp3Ze4+V2QE6uAWoRgGcZUZBs2CV1c9r9ZehInq9xqul5
	EZfgjpc7/gg9SNgDUhy+6FgRBuop5AsyrZMwLr6iPA0jRwou5INHplj4tlnSLVbYEGaTUJc68Zu
	5i4C+kDGwEiSZzC3nmHC1j9grYa9Q7qnXziZuZlLbCNWvOhVhbHB7giOas9O+Y3k/G3xHI/JcQl
	9O9vLTSmn4MdyGymZBqCQe1SUZCbO9U9pcON0uWZKaKKcx5rDKLDtJZDOEe0oPn7VIt/d60Svap
	6ezy1KuLr38gBgLGVt9pnsrLpwj3d6Tix8lkiz/eKY/R1vCPQL93zQqKDC3aDNtJ/pjOL9lo82v
	lcPQq7889/yhnD8aZmP3G45DkiFaK45iWdK+U=
X-Received: by 2002:a05:6820:4d09:b0:67e:160c:36c3 with SMTP id 006d021491bc7-69b7ab72c62mr1431531eaf.48.1778680880800;
        Wed, 13 May 2026 07:01:20 -0700 (PDT)
X-Received: by 2002:a05:6820:4d09:b0:67e:160c:36c3 with SMTP id 006d021491bc7-69b7ab72c62mr1431475eaf.48.1778680880179;
        Wed, 13 May 2026 07:01:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f610f5b6sm43728381fa.29.2026.05.13.07.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:01:18 -0700 (PDT)
Date: Wed, 13 May 2026 17:01:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: qcom: Add support for Display Clock Controller
 on Shikra
Message-ID: <n4wgnno2td3xmdsgwadvdtvr4ncitzio3ufufg5bp7wnga4ouw@mj76764e3uus>
References: <20260513-shikra-dispcc-gpucc-v1-0-5fd673146ab2@oss.qualcomm.com>
 <20260513-shikra-dispcc-gpucc-v1-3-5fd673146ab2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513-shikra-dispcc-gpucc-v1-3-5fd673146ab2@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=df+wG3Xe c=1 sm=1 tr=0 ts=6a048431 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=qXpo7wsCot1G_wR8kq4A:9 a=CjuIK1q_8ugA:10 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0NCBTYWx0ZWRfX4H2Z6wJMuQRh
 YEi19cCk2JaKS+uMSgKCCcV7KCB6nMXYSjLbB/RQYM/6801jsv+/7RMSCKUAEP8eWcqyeXai6AF
 XiHa7aeQL0b6HOtqFTzGTc4VbHv4ABHP5//Zkw6krU9q3zrD4u23d+uNWfNDy2EGHZmiWIVceBk
 hAVDAz6BvAqQ6buexitRu4bXkNkbovIf20eLJHCaawS0cwqvBh5byXw+uHXAqSJj5q/MalWO4ot
 33nW4RutGH9L518Ei9lRI/Tae32//E5M7I+ixkVYdYUtJNbhQ+E3UMOdjZlLxUtXK1Wq0Wlig/G
 su92yDZ2+XSdk+00OPUHM8yoaNz2htrWKGiVBobK5P0gpnM0roCZt4PEs+6GjZC7bnI2uER1D0o
 /mLAaqAS8ZJBZDix9pF538En4qYoiQ==
X-Proofpoint-GUID: UjkkoaTRBQAqeewHOP3Xkz8jLzkyiY4y
X-Proofpoint-ORIG-GUID: UjkkoaTRBQAqeewHOP3Xkz8jLzkyiY4y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2605050000 definitions=main-2605130144

On Wed, May 13, 2026 at 07:10:38PM +0530, Imran Shaik wrote:
> Add a driver for the Display clock controller on Qualcomm Shikra SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig         |  10 +
>  drivers/clk/qcom/Makefile        |   1 +
>  drivers/clk/qcom/dispcc-shikra.c | 565 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 576 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
