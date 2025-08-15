Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED02255E53
	for <linux-clk@vger.kernel.org>; Fri, 15 Aug 2025 21:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755294770; cv=none; b=oEKVyT1D1LDW9qNE2K42Cjh2jRZj4i2bPqHGQtYycAKD/XrluSTUhtyRIsnjwaeESfgOls4hBfDA+wU9YjzkfOrDCrj+jUbVzq7I36IBt16LgjOittOUysImaJ5YNNpdKj3fVETk13b88uQrKuv6jL/r9ul5z9Q7sTvWMvhWddA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755294770; c=relaxed/simple;
	bh=gSjoCkpGQO2hO7lhbivtChUUCThBql0jPA14fGQjWzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oMDfJu4F3Ei99dTRzmQ/i3hsWusxujLlGOtmgRl9jeUY6/7kYOxaDSkUgNYuEmx+/WX9AE4xx1xBsPfi5uSz7DtEl24VAaCJSEGel+sNnnhl9RdpF5CufskT9G3uaC4vfilZIzEnwbIqFR5eKtsE9MvLz+rpmrdScZxlCkhF0cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dSsfgeBq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dSsfgeBq"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEJ2So008748
	for <linux-clk@vger.kernel.org>; Fri, 15 Aug 2025 21:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+ucY422Zv59eyle/8tIZ1eTA
	qJLZoYCyEZljqLnbYhE=; b=dSsfgeBqib3EBhRt3kCVLvF94VAfd6AttarohzKV
	HK8kwYNAjZHr/WFdDzsar1Tra8fUJp0w2rMBGVvcRUmgogsDaB5wEQr+mIbRQ7z6
	S9cOhsQVStI4TFY4GypCDxtBkZgYitxH97DI1aWTrDyQSVDJlAR+Nw9dsw8fgmsP
	YuGo2q8QOqYUXygBX9lRKXhDXZ/m8y0KOl0mRsXYDQvutj3GFbjbWFzEFPcUQh/B
	rdxfmIqKm+hvuHK3/pCnnOCbuObrYg5c3zqiHmHN7C7c7RIyEfAXO2blQhJvqw+X
	oFatoJMO6mdwjqq5M2NJvcznsaabWhEzZLAOh/dSflNtNw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffq706pg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 15 Aug 2025 21:52:48 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70a88daeb18so51363736d6.0
        for <linux-clk@vger.kernel.org>; Fri, 15 Aug 2025 14:52:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755294767; x=1755899567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ucY422Zv59eyle/8tIZ1eTAqJLZoYCyEZljqLnbYhE=;
        b=cFgL2nl+BSOp6U4UQ25qBhrBzJDFe48xbMeBYW81MksDWQ1cD5TVJMDjgHvuets/dG
         367RINGsWaT/MXEr6fZDwjibPfM+foCtd3C9kjcp69vcBEA7ER5LMQuJFCen2myYy7Ve
         3HfKM7I8JIjwmTpOlV3LdgqVoIZ3PiW4Mq0ikW5pDOWRVNRcjhsrqwpFBoS2b1J2Ff6L
         FAX1zcj+hDq5ROD73GPxotv62+I4I/FRdieegBTaCmJOOblVH8kX8FEmRCP8s+wxxNcy
         t4ju7cLoGWnRTfB3FAR+MscdIwDiHmf9IYkd2QyMIzPioXh6DThi4oTNpZ5mNA2Sdw8E
         rR6g==
X-Forwarded-Encrypted: i=1; AJvYcCVrhekUXG8RnXb8fe7jaF9htT92p9j3c6X3KVYvqUcLOZcwI7IRkfuomFrN00c/M18TFGpU796dNZc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3QroA7uQeJa54yY1jpCH5NhAVsJTMY/j9BceZEbam11TAVhNi
	e5xgwH9yqDtUO4iTxOH+9YKNkBIJqasRIMVvmRZJuA6cbVgUsQMw+oBcnrm2H++CyTAktUtGyzJ
	jl7hAd+O1G+rUsNIHfTqwidjPSS/NXqkyR7hYsUv4lrqdbLaEAKawmGOKBlB1awI=
X-Gm-Gg: ASbGncsxi8SPI4uGbrXHaK/I2UNX8zwZ2Hr1JhQ0mXkkv2zqUrjxG0HqTuI93LPRgBx
	Qs7IY9RMZnjb5qPZFFlllMk/HI5egmDEd7WhKz3yN/7Q4u1vhaedluoDRwtRrGPWiq6pYl7t6PE
	rnZdMNTJ3uJwNL4hHHxynwK4PlP8/zb763Es8CcHc7ncTioIX2cLCdvUKlSavEwhF4czRf57J7g
	/D6s3VI494tQm+Kp6DTYYZyaFdz2DuGws80BrQ4+b5+CHMtTl1boW5E886w3MtpT2jLOgH/Dpqx
	HOpe9EYKIt1dEAjRrjf/r5gBy3PUQ/wjRIsaFZWkRJ++8cHCqo6QEX/w3fyecjbOUJDwgFKTtwC
	eoT29sFr9BCepK3mRJMu8ifCyYfls9kI2hD/ZGJLAm+Y+4hLi/h+r
X-Received: by 2002:a05:6214:c8b:b0:707:a430:e01b with SMTP id 6a1803df08f44-70ba7a5ebe0mr42596426d6.3.1755294766986;
        Fri, 15 Aug 2025 14:52:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyBgvbgFRklSHyhj3CH97naQZBMoVWHYIh+7R80r7kXCtbNHUMb1dOMvYdSmX8rEDFDg6bNQ==
X-Received: by 2002:a05:6214:c8b:b0:707:a430:e01b with SMTP id 6a1803df08f44-70ba7a5ebe0mr42596136d6.3.1755294766500;
        Fri, 15 Aug 2025 14:52:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3ffb0esm495523e87.135.2025.08.15.14.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 14:52:45 -0700 (PDT)
Date: Sat, 16 Aug 2025 00:52:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: setotau@yandex.ru
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] clk: qcom: gcc-sdm660: Add missing LPASS/CDSP vote
 clocks
Message-ID: <gg3pzvlxgvcfqkl4ko65dgyf4jv7umsdthcpyrb3orgmix6xfm@3obaewnzgat2>
References: <20250815-gcc-sdm660-vote-clocks-and-gdscs-v1-0-c5a8af040093@yandex.ru>
 <20250815-gcc-sdm660-vote-clocks-and-gdscs-v1-2-c5a8af040093@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815-gcc-sdm660-vote-clocks-and-gdscs-v1-2-c5a8af040093@yandex.ru>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NSBTYWx0ZWRfX1C9Gg92P1ENc
 doz/V9PA7Ay+AFF0xPqlu7XeZeEiXEx0PqpwmBPH0CbE87ICflx34mrsNOexnU2HeizgKW8KXV8
 EZe+QwxRaWWMJGCfF7s/NXK+6iWn0mbIBn5CblhEt0qc9OrwFXJmN+XGn8ZvedzwlKy+oyMmLiM
 8AJoz5Jpg0rWoDpbMrqtPlvL3gY64uaKunAz4D5IHqq6XySrIzdd6McTmTG0qSIlAwAiIlYz/bH
 dBpefsJu/0xfQf3LKxtmzuZwcGh7Cp3f1QRWzdiK9/MkNFJDiEB+qxoHVZtnsg2SBTOVfycKCz5
 Owd0GP4gzw8+OKDWkPHSVrUo+nzWoH6ArucCTDhFemtbT5PoMNFkDKN7srPScb2B5+CWi/j6PWr
 eJvEfFFQ
X-Authority-Analysis: v=2.4 cv=TLZFS0la c=1 sm=1 tr=0 ts=689fac30 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=vaJtXVxTAAAA:8 a=EUspDBNiAAAA:8 a=FM-fRCrO_02lKpoybmcA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: fOt8IJi11dFL4_-rz-WK6XLvldgt4wqz
X-Proofpoint-ORIG-GUID: fOt8IJi11dFL4_-rz-WK6XLvldgt4wqz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_08,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110075

On Fri, Aug 15, 2025 at 07:56:52PM +0300, Nickolay Goppen via B4 Relay wrote:
> From: Nickolay Goppen <setotau@yandex.ru>
> 
> For the proper functioning of SMMUs related to the audio/compute DSPs,
> it makes sense that the clocks and power domains they rely on for
> communication should be online.
> 
> Add the vote clocks & GDSCs that, when enabled, ensure all such
> requirements are met, through various internal mechanisms.
> 
> Co-developed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Nickolay Goppen <setotau@yandex.ru>
> ---
>  drivers/clk/qcom/gcc-sdm660.c | 72 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
