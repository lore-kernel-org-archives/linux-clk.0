Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107FC2264C0
	for <linux-clk@vger.kernel.org>; Tue, 30 Sep 2025 19:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759259652; cv=none; b=J/2anUtmWImeuvK/3RemsP+mFM87o1UaBzS6zrbVEnuZ4kzL5nUt62IfEdY5KNslfASxpMinMpXohJ9JGXphBvPsJjrQnqPTbUlCt6wlP3XrEKd9Ic9k0Q4wbBqDVrkCk/v/4jEBtavgm5SNvhNFaQCcjKyOxf9ulsjGD5I1Gkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759259652; c=relaxed/simple;
	bh=PawSnYt8WmMj8SZdGcAwqC+TWH/Zc85+nywQIoFiozQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RdrAHubzZfWikts1foEIjskpLRpueZ+8Na+Yronr4LwLPT6wFAGnOdeUBZuK17fx5G6gaXxLb2aq5Keo/HRNDo2PtylOf+3yrZxqQUMdZcPE6dzUcNSNNqrA7fl7lrTsx+ECaq0RfHF9YQsXCGhZoTbuCISwR2RtdiAsDrHGKyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lN1CLLIy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lN1CLLIy"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UCA4xt031650
	for <linux-clk@vger.kernel.org>; Tue, 30 Sep 2025 19:14:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=goYALe8rxnHCGdz+Re2W+Iqv
	KOXN11Rt4Lm5Gbd0TUY=; b=lN1CLLIyEBzJH2h//vLM/tnqcyL/ZTqyB8jJGtz+
	nKuSzGK8gPGsen3+t8npQOsros3KwkhLFekmnHgCT94weutkC3wlwz8Rn5zucHFK
	tvALcGzJ/YeuVG+8J5C6j7KttZb8iDMf06eW766+vFsSno5mL7z2cfOCCSrRK8gX
	uba+ufvKMHQbvb6elYfGG5vnRijU+GLrdzhuzKh1qmZf7ueCGTwNpBjR12UI0h9U
	Le9jNSfn2tInM6VTQ8o8w8vUenQwzfH8CW1dGOXIHSHiANiK6NDqBzmpgmTzl5IU
	lOu2lfdFfVFfQPlhJAC0gS3AJt1lXxJ7Jn9b/iFM/RsNfA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pdhxds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 30 Sep 2025 19:14:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4dec9293c62so100144471cf.1
        for <linux-clk@vger.kernel.org>; Tue, 30 Sep 2025 12:14:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759259649; x=1759864449;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=goYALe8rxnHCGdz+Re2W+IqvKOXN11Rt4Lm5Gbd0TUY=;
        b=tYR9nCtyDhHYSiQe2TxxJYJNkDewJw1uOWJ7e9ndaoKwDNiDImuhXWDOeKv4uvvIcN
         vXSKXX8BRBzTtA9s13aAPC3GKw2ituiaoNVdHOamVRmzvqm4EmDDQYtAwwy9w7V4YEGd
         EtxK9ixt6AHRInVveX5YT7BIpjzd+OqL8du6mhOsoEfNMQR8ZYD3NmAqOsgaTXw5HVUl
         QQGWlrLe+HSJtENW7xPwXWBQ5tioBdvurrioyrlP/ooQ9cQI+NIv9RCypGCcbMuk17eR
         tKgvUe9tZXaRzRh3fHgpyHJQbmU6hXmVR60xxZsoVk4Qljc1COaukzrJYXsW6hH80r7f
         rx/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXTfv7fv0X3wbvaW110rUcBTjxOFPdqANkhGivJHXeG3q7+SdKnZoIeEvD/Gea7ChLNRG1ZDjdsJzA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrid9OmL3H8gAimEXWlbII5BH251LfiVx9QIlPVUxuAAunOL6O
	NgqV63mk3eu7b/l/HCYZxlAohFv9UVdes7gCInds51JUnJ6OF7iJsT8OwcTwgb//ZElyh3JUkK0
	Y+Omfd7tV6FM7R8TKdVTb/k8j+9LxsKn7drN/yPVZI7HyopdVuV4KoxGVe0PL4hc=
X-Gm-Gg: ASbGncvazryci6tcCb3K8o7rtDz27Fq8OQ5gmso59cd4XtAvxMUMtTwMDdyvYZep/38
	5ynX8smfAZbWW1QCdKGAg8xf/+aXp1v+OhbkAwKn+wvvY7uSO1LHWh/m832Wn7VvSNOtakGR+t8
	WUqRkyO63fSFjWHbKny+ZMwdqPortMN0QB15avZCsfKF/cbShhY3AjhyGJbZc3C4l6uIi0WHObY
	cbqgLxjfaAydp9hYbg64pfw3pPeD/k4lTBYcFyHdLiw2ftdC1tWL2U8ZdDE2sKrzkOeVCdVzKAG
	vnaj6MMliJkEXAVoTxnQs1t8q4kGnI7d5vm6V0mQ6zYiyqp+Lzow0Mc78pGFdV/g0R2oZgmqre6
	SbBsBFIP5j3kZ05Az2Nq7fLGS5lEoEDTuze+KzllTJ9btCEaHqAaycE3aYw==
X-Received: by 2002:a05:622a:5a09:b0:4b7:9171:7b10 with SMTP id d75a77b69052e-4e41eef7075mr9962991cf.64.1759259648941;
        Tue, 30 Sep 2025 12:14:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWaNA0ZDNYeL9wcUtcyeSgm1Kjom+qbg+3Fbj0RuE8VjgW7lsTtOWKRJ0PJ7Wa9FP7+7IEvQ==
X-Received: by 2002:a05:622a:5a09:b0:4b7:9171:7b10 with SMTP id d75a77b69052e-4e41eef7075mr9962581cf.64.1759259648498;
        Tue, 30 Sep 2025 12:14:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5879e9b81d7sm2043093e87.128.2025.09.30.12.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 12:14:07 -0700 (PDT)
Date: Tue, 30 Sep 2025 22:14:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        patches@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: Fix SM_VIDEOCC_6350 dependencies
Message-ID: <manv5cazdhashfkduondlikqn4ut6q53dhjhyepu34tszrdsfx@bmnjqsrtcf6n>
References: <20250930-clk-qcom-kconfig-fixes-arm-v1-0-15ae1ae9ec9f@kernel.org>
 <20250930-clk-qcom-kconfig-fixes-arm-v1-1-15ae1ae9ec9f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-clk-qcom-kconfig-fixes-arm-v1-1-15ae1ae9ec9f@kernel.org>
X-Proofpoint-GUID: klTXokAHSCRcPOjP7aFibEarM8u9LtPf
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68dc2c02 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=YvO9g5Z2dZ-zDM10cScA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: klTXokAHSCRcPOjP7aFibEarM8u9LtPf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfXyU3jPze7J/3z
 qHfzb86Yz7xSS3fsmHSJo/XucjWrCp0owcyqeoWlfPGyy4jr4daicRoxvy+SYPwlMiBIp3CbCLv
 Rd0UuR4TibUSiMrnlbi7h9EXy6UbDuOuDjl5Q5u8E7GR7cF86nhHMWtB5VoOOt+N292CLKavPsN
 GUyUekVVRxhNqIMOdF5M4CVFx9pn35gRsdnBqewhycp0MBJmZLq6B53s4fW2EpVbo+m7nG/grRi
 voZdPSL/epj2ITkkLGjxuN1I0tS2Q+lGxkr+5+490Cp28tIKrA/cGe2vNLHEJzItOv7uMPVBWUn
 eiRcZ1Qt6dcn6vDyBZ2bf4qMHUEnldyX+33g9xMnqScOO3thKLbpiJNY2wzhJ9syLlWqGe1AfH/
 FCrLHtZ8NO8vhR5Ap7GU1grTIPc9WQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036

On Tue, Sep 30, 2025 at 11:56:08AM -0700, Nathan Chancellor wrote:
> It is possible to select CONFIG_SM_GCC_6350 when targeting ARCH=arm,
> causing a Kconfig warning when selecting CONFIG_SM_GCC_6350 without
> its dependencies, CONFIG_ARM64 or CONFIG_COMPILE_TEST.
> 
>   WARNING: unmet direct dependencies detected for SM_GCC_6350
>     Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=m] && (ARM64 || COMPILE_TEST [=n])
>     Selected by [m]:
>     - SM_VIDEOCC_6350 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
> 
> Add the same dependency to clear up the warning.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
