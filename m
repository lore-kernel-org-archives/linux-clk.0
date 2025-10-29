Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7378C325487
	for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 09:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761731823; cv=none; b=e8GDjMQtrNkBREHsN1oEB8Pf0akHc55Qq5dg9RzDSY+tZCfptZ6I0MOTSXmCa1iXSw9dHin2d+n/pdgerXusJLS52h/C9mw3Zq1grkHLJVSFJXFLcAMmpeRVU1vU2FYzFHrLHGW7EfXRi5yJOwZtJKP1cTuDM5hczQrnKdBt84A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761731823; c=relaxed/simple;
	bh=zFO1aO6erZNCnEKZzjaSx9KENRHEVHys2N7NvVHVqU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nEq2U75gvgluCKuTqGJ0yY+OyyZI9XBj8Yj3gGR6CqBNXpppOSqVWLY7BuqogExPUwAJiX8G3zWzPMs/pgnYmrLrYCDfH4CCYgFTI5Cn4UdbnR9nsdoU2kVl0dJk1QffgMl46vKKXTOcSAdUDcgs+/03NYs9kirRLKpAMPYhzuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lur2C1j9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BRE1VAqr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lur2C1j9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BRE1VAqr"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4usAM3757545
	for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 09:57:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zFO1aO6erZNCnEKZzjaSx9KENRHEVHys2N7NvVHVqU0=; b=Lur2C1j9P4kQAIWc
	RIPkHpoXkMQTAQoFe35/Kc14UqtPdJwEujwSXqLhICI0Untl3AcsEx7ukXLRF2v9
	YIZ2Dvleki1Vly9dRGLzYg9HokZ6xmF6BaKLC8YHXrX1qXoE6OH9PvFWyTIAVR3L
	ng+TDBSt8gCAPo2b5H4bxPzk8M9h0FLaLUrnvNGEUy1QPjitMqwbamd+tixQduPP
	D6IISulQIZV3Ypg1/GM+J/6O6cmMLqV7Z79xhRMex+7UBNY818e732yUpEg/pv9X
	MoPkgO5O21xU8LGqOVmY9317j+Dm4PLTf4DOpIqOAoOPsloJ41X0CHMb0+1nftAC
	xBIzYg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a349y2389-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 09:57:01 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-87c1d388a94so19490516d6.1
        for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 02:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761731821; x=1762336621; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zFO1aO6erZNCnEKZzjaSx9KENRHEVHys2N7NvVHVqU0=;
        b=BRE1VAqrmcJfUNnsx4N9QkGiJnQpXWuCw/2Ns3M3bxO9fDqOr4qfLazTknh5Es3+2m
         29AjCsYOuemdEaHFAjcQzVy/KPMBeHLAdNGqJMLsV9VZADyyVUnPp/B4YSfK9OMTpEFO
         GnLiZ8vgDDjUxDCmUCU+yiXWmYrz/Yk4jKSCI4yx+VkPPpdpPaLlDiJ79DePMJVjdKCQ
         7y+8gibcm3BZ4FYIM2gEAV1MpWdgm7ANHshBZkeDMb7+GtsrxFqg+asg8AnEBuWYTRSe
         yvpBjsMTg+LO2swd2N4iBRFyJHgU+kkT3u1QSoD9fJ3vtWbY1MvSzpyksVSBa5xavu4g
         Nxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761731821; x=1762336621;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zFO1aO6erZNCnEKZzjaSx9KENRHEVHys2N7NvVHVqU0=;
        b=BlatkszPAg8+oXcyDdkle9hajYdYVOzP+OxCgvo7HcxBtXTX/debLZfEk2HSyvX5C4
         L86/ZLAXjgCDmOF3M+sxvtXOh2n6AQOvSA4L4lja9C9IWhCZ8maBgQp7xpsd0Mt+aMSw
         54F3MO6EhD2K12OYo4cBcoHH5AxTPN7nQ0VMVAd7KNhaeG0JOBb3ElI2YCEDw1fZPkKX
         lMNoXx0sXreIufuRWUBRsDTQMaaajkq41DvZ+l3QST4NlqCzdEJGSfBCe3Yv0luC/jMT
         rwbNwnMt1cisjMPvf6g4USCkviNCAaJZ2E1qTNpzBkQxtPtmyX9MFLdWsCx0lbRjJhW1
         2ZfA==
X-Forwarded-Encrypted: i=1; AJvYcCUv7cnlikWpQgLatiniA6bhYVpE0ZadjA8tUnyLSUYarwO00aMo7UFO8DjHKUpsXYMtVmhLOQZ99tI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLa4JX14+gTmJf4GbX4m119wvuIOmI2gWt8Wfupl1Ob94ZzYLv
	o9ZJDXzX68odb30J1b8EeX1/7tPAnHiKP5pDN8jx559wUmO3rxnp5/9hdRjEgZM7X5PH/1LuPk4
	Gxsw9zSFJwPWrkhO/GmiNwGV9ltiLNiHuCYjE8QZyLaYMRSKImEldvd/Hb8KTaN8=
X-Gm-Gg: ASbGnct6JPn4oop5zu6IB8cQhheQBGaU1W21Ltjh7uA5NiMCAVap7ybLE8YlW41G6Ww
	0ntGn5ofCH0NPh5ZX1X88uMtnlFQZyqd8ci0cgLeEvu5Bjhv3IIBwvhnGJcBg8h/OrHg4zCacvX
	YKXJEA+PLARAHi2RBZPpcY9YKQrdjCjymVFT2XUwNTb+FynMkgnBPv4K8SQ726xXfyqgF1E5ajm
	NkzkANTPZZ04ZswKukWHa+cwYr24qbqvjgtX7z7GFxKhdQvrdzakzgoZPGW00NTK22LpJ4LbCo1
	ghRQZZ8cfouAJFajtQJrxAUW1L57xZYpGYFm5huzrH0l2hQZj63F8BWg9L0pGXVRLxXOKe8bFX6
	ubR0CAT6cE4HLstq4xKmay0r5II1a4/XbJ1qGOOzEXzfb3Pg0D5vsvGyn
X-Received: by 2002:ad4:5d67:0:b0:77a:fa17:551d with SMTP id 6a1803df08f44-88009bcea29mr18956726d6.4.1761731820646;
        Wed, 29 Oct 2025 02:57:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCsBaGyKgmNCMDA4NCSIxtCQwj0AhQLLLMTnXbsb+Ii7K3dCO7DOjvpVRwoUPvaYD2FU0OQw==
X-Received: by 2002:ad4:5d67:0:b0:77a:fa17:551d with SMTP id 6a1803df08f44-88009bcea29mr18956596d6.4.1761731820120;
        Wed, 29 Oct 2025 02:57:00 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7efb9739sm11517523a12.29.2025.10.29.02.56.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 02:56:59 -0700 (PDT)
Message-ID: <abaa9d52-6e82-4beb-b7be-fab0496338ae@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 10:56:58 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-x1e80100: Enable runtime PM
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251012230822.16825-1-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251012230822.16825-1-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D8RK6/Rj c=1 sm=1 tr=0 ts=6901e4ed cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Em0PNhu3BUuMovijCD8A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: z0wFwMedclPElfaJuvOc5gVcNz__0coA
X-Proofpoint-ORIG-GUID: z0wFwMedclPElfaJuvOc5gVcNz__0coA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA3NCBTYWx0ZWRfX1glAzh0CUeGA
 WwJuGyFwra7O2HLcU5RIxsfby1WYBOmbHhZragQ4Jf7QVuTvXeVPplK1mn3qKat6RZrbhEYvTaF
 2udRmGoEmbLp7rfXDlzUiJWOo4+c/cvubS6e1xOSsiRRMAqTDd1IF7nSsQTNbY+kHM3Y2mcnfKt
 RgYC/y4YDFSvSHgVJEJ914YfaQamHW2plpNHx2g4AWdoaB1pigrDuApcZnDXx5YSeH3yPo1VxuI
 SplbeSeDbeOx3QI7/zjAudf+0y8CSmnCOn6aE9syZDo3nogttZiUh7Mx9J/iIRaxSjDHR2foMew
 ImAWlTCu9mbgkTpg7X+vO3lyAykVgEdHxFIJ+AJ4MfcE7cXKxzEdl1DmeXU1tfKc0yqzNQnsk7z
 /ti7ndM5cPqIUqKxUTRQvZaZ+bv8Vg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510290074

On 10/13/25 1:06 AM, Val Packett wrote:
> Enable the main clock controller driver to participate in runtime
> power management.

The commit message does not explain whether there's any observable
benefits to this change

> Signed-off-by: Val Packett <val@packett.cool>
> ---
> Seems like this would be one of the prerequisites for actually reaching
> deeper power states.. I've been running with this patch on a Dell
> Latitude 7455 for quite a while, did not see any harm for sure.

"seems like" is vague.. is there any change in behavior that suggests
this really makes a difference?

Konrad
