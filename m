Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A1A310785
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 14:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778681471; cv=none; b=CyFHsRGZ2vXjm3zBB966CeWZNPP4XXw0jSgMewpWrdmSrI+CiHBu6hbcesrkfqGR+WITHKIeHmhnKgjstDxkc6u1yN4RmQmNCNBjdm025durksRTNOI4TwJ6EOq+sOgYoGKK8T4fi6nglzpTuwSenNW7BuQzTMXyvJ9bLfzmzEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778681471; c=relaxed/simple;
	bh=jWE29w4nh1ds+QkDLiiY5h+gfOiFbhOX8+ULzkp0trk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tIxJMW3RfmP+XykNOaqAX0VL9aNe1vAFm0Cnk/S1FG1X0PIT0H7h2bc0Mt7O7nfgS7vIzZbzyjZ+Csc8QBsAO5uiUfTeJd4zVBMxTNpqYBlQnrG4L5dycW2OcnlDIPmbvWVWlcFaci6WPrRg18ZUdxbb2bClovyOJOml+YmsYw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fu4TBP68; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I1l6nbjX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fu4TBP68";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I1l6nbjX"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAVKwO3430137
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 14:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t8SLqEZHWB70SufbsgWahPyh
	ySxOVNvIZVdCxL+wGqc=; b=Fu4TBP68CspN4MooDApKnRAVoNX/vS5Nyv8FI1iu
	SoC9IItvqWaKJ3Tzu/oV1Xn/eysEwlnGJsHMceigz0c8rwALfvCgXV0qfvfbb5Bq
	+UfyTcMZVgrv3dmYXJ4HWUGcW2feri6u8cJur6w4dFBwnYSCi9k0G8NWW4Lya0FX
	KizohsduCHo3tSuN0e4M1JOVmX437KH4xWo6MsDkisvhJ4iFjb2tXQqJ59WM46Q7
	x8yV0C9c78lnhorIn2p7svinAifUzL115pQ0C9zPyVyvLjgdDkmnIrolxkHl9q8+
	vdYe6JWgyxDeEcRET52ofWTXOrG6v/uRjXm1d/KuFE5BPA==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4qmcgt73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 14:11:08 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-439e3568bf0so532089fac.0
        for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 07:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778681468; x=1779286268; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t8SLqEZHWB70SufbsgWahPyhySxOVNvIZVdCxL+wGqc=;
        b=I1l6nbjXFmA9UmOUQIvgyDFN3GjTJSB6hAtsXMBJzKM+BQr1+tVg1ZjwEWakTAi4Rg
         Ju+RatfI2FR/YBw8QEpueqi66xhM8n3pQaNoLexGg8TbiShmbFsASOnaDTupTNGAR8sU
         FQXKoZvGItmf9QSsUnIDdkHwXRa0TB25R2eamzjvXprF4R1ne/aigiglPiYMMxlZcSfP
         yow9uSVdevzc9vfSx61XnljTncJdkQ/K0jSxdgmCgk/SD+KcNddYA7/M5I8tm3jUGfZT
         YkfMzvPpJ3C9ltgqqi+HEXoV4dxN/wmz0UYO6H6iW9maGICU+zDXUih0kRgqXsW4NAAK
         E9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778681468; x=1779286268;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t8SLqEZHWB70SufbsgWahPyhySxOVNvIZVdCxL+wGqc=;
        b=LdzL36dDTrJFRBc5Ank7WhpqOoOCOK5vEXa6jGmiddJTryVwMvxh9Cut+8rmgy7esT
         CwseDa8hhznh2q7c5jKAMDY4XrUm/LvvjMHljwB9fm/2trKi1aYSNms9f4agL3NhMqot
         YnX60Z70vm/f9fwm9Ot0Es2GlK3UUTmQOdva/ho7GkFBsFq3g5VK4P6g/Mvyq98fIg7r
         49k6zhR6QVzOEEE8g4VYN6gXpaU82A1sHH2jv/fwfpomxzNKNsMN1d183FSe5fb6hQyc
         TmEIcmmEO9qHE/vjro7lh5/E8tyZNf7yKU1qdAcqIc+IaglYuEn32dnamIP1i+7axefQ
         JZzg==
X-Forwarded-Encrypted: i=1; AFNElJ9tlPj7qysFWiH+AczJjBBi+/OZcL2vjirE9NBrDEvGOEbpiTC3UFlUvi0YulbvIuwZlK4/KNxaeQs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwC8t5WbnlSTjgReqGWHtRxw7pLxbZLl8zwVdhHMKQdki1H0Ftw
	Bqu0QqCTeJ5mF3B1L6KpBPwlFSl14IHhxMdiGVVecwBeVzb6NHvguk00jPwcqooywNW2uzSut3g
	rV3OEVOwek3WOuKu7BmwvTxnnQnq5FMxQ3q8D00aR8IYebX0NxUSNa/fZWdrOhaM=
X-Gm-Gg: Acq92OEzMfYnEEGjFebSIKtwTOaisyvxqukD4Bn2dgKsJbl7YqUYxKUjL+QY1ShBWIF
	8l4aVd2s27olNw3lCWfKZzPaZefQCu2HV7vi+tKELunvjbQmROqU6GksMdUMEhl/UQr8h4jxFdf
	SzQnwXk+WzwBHAHIR8LjiyNgVFZCWFcv1yVaSFbvrK1CWxGt6PybWsgqyJ47wlYRUfHONH3yTQ1
	Y0u+AkKvf9f6nz4oRHX4ooTqpLQqyUYo9buV3fg7n326v7+ezP9BH6yJPVWIj37OGGGbNmJQB3d
	4W1/MF7lMCBO6bQvkZEYzWu4DLydV1reqMDNjjOMyhXzfB+J8w8AtV1XEw0hNk3wNLLJKLfwib7
	S8sC+DwYGGOTCdf9Ff7uB35wKD3WeusXoots5+FnPJ1DHmYwTiukZNW/6NX9gRwSn9KPhmXLIIT
	WmeCFeq2ryFvmhWaG3VC8iO8sdzvkIXDIQlIQ=
X-Received: by 2002:a05:6820:1c90:b0:696:77e2:a83 with SMTP id 006d021491bc7-69b78e5df29mr2043256eaf.53.1778681467834;
        Wed, 13 May 2026 07:11:07 -0700 (PDT)
X-Received: by 2002:a05:6820:1c90:b0:696:77e2:a83 with SMTP id 006d021491bc7-69b78e5df29mr2043224eaf.53.1778681467404;
        Wed, 13 May 2026 07:11:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f18ef9sm40743831fa.8.2026.05.13.07.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:11:06 -0700 (PDT)
Date: Wed, 13 May 2026 17:11:04 +0300
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
Subject: Re: [PATCH 4/4] clk: qcom: Add support for GPU Clock Controller on
 Shikra
Message-ID: <ke4fzofnylbxtigpmg3pby67pu5kvlut5kbb5nikr5yvpa73rv@gsmhpb5s4qqw>
References: <20260513-shikra-dispcc-gpucc-v1-0-5fd673146ab2@oss.qualcomm.com>
 <20260513-shikra-dispcc-gpucc-v1-4-5fd673146ab2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513-shikra-dispcc-gpucc-v1-4-5fd673146ab2@oss.qualcomm.com>
X-Proofpoint-GUID: cxHl1dO38VNwiiCcKR4Or0IyFTFjtrvm
X-Authority-Analysis: v=2.4 cv=Hu5G3UTS c=1 sm=1 tr=0 ts=6a04867c cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=qXpo7wsCot1G_wR8kq4A:9 a=CjuIK1q_8ugA:10 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0NiBTYWx0ZWRfX759sH8xEt42e
 umFF9bt5EdTt7rWtRw/fFkYwqsCkxJM/emZoNwo9YyZkU8xe1oEdph4NCyEVSWIdrjwHj7O024I
 VhrOFxQW192XcdLJ+w5vjLx0JCU8IaoF05EFMVzY5kaxa9RGmXjVEvnTJw0+2WXhmw1DDU/tt/j
 utUgyelIDmsYJGiPgBIQEYSbBG+BY80HMRcWyTlFGfbUPqILPjTWjnjUPi3989nBj2iSRbQCx4Y
 c95bqPYeAUowqyapwQq9R4ST2AWS1DD35kJljCFO16pwDBFaMgB2bakcdyXL8OIrV/pxFxVzlZU
 3qa03RvcuYVCgOp1F9ojjy2WVPUL4HNBBVwEJerpFOCNM+UYJ87MAhFFqyYNtR1HDRvuLCIFHN1
 PEQxkHpoZt54hMZdLmd5zhjSD4+0yI0WWoPG9HloxaXhbnsk0QfGKNTKt7IJhfaMtOYCAMsMwug
 wdAiE+XkdavuIHG/20w==
X-Proofpoint-ORIG-GUID: cxHl1dO38VNwiiCcKR4Or0IyFTFjtrvm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130146

On Wed, May 13, 2026 at 07:10:39PM +0530, Imran Shaik wrote:
> Add a driver for the GPU clock controller on Qualcomm Shikra SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig        |  10 +
>  drivers/clk/qcom/Makefile       |   1 +
>  drivers/clk/qcom/gpucc-shikra.c | 406 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 417 insertions(+)
> 

The same question, can we use the one targeting Aggatti?

-- 
With best wishes
Dmitry
