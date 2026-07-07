Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F972EEE61
	for <linux-clk@vger.kernel.org>; Tue,  7 Jul 2026 00:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783385442; cv=none; b=p21/A8b5ZcdAUEakeBctdQreVzNOwJXu3+L1kpB+dlcTEsq60+SfAjAlZORN/7s+dmFVT7+5zRnVety3eHhry0T43lobhM9qYEy7ItK61Obh4qvocRCkPLzgmBQNl642i+wvAkJm3KnwAu888NyOSIQgSxr0lEtIY2KdPOHYIbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783385442; c=relaxed/simple;
	bh=WHXqkGv1+op9/RSasjwk83MuEuNNutgpJOBEdXbkio8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WuOaM/uVVgF9+iD3HwyJB1OqSsIVkdUO5IZqNOazp52uCeQQjFCe7V8vsf6WuFtGlLp1I3q1RHNoZ4BhvPJdS9xrZvUlWBc1I40VQXiZ5hRNRVnfik2yFwmLTJ7kdm/w24+k+O8djTNPWG01gdASiyROY6Fx8j3HtC49ouW+DuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eJTRIo88; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vd4RJSEW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eJTRIo88";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vd4RJSEW"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KEM0I1639963
	for <linux-clk@vger.kernel.org>; Tue, 7 Jul 2026 00:50:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kbaBHhic6gIIK0cxoTZmQQiR
	L9kgLJaSC+bKDRff9ZM=; b=eJTRIo88ZURLWQ5Lyl9WzJI/vCIsL6m0r6me8kbU
	E6GGdQxMA9C2sXJtRQxlLfHdSaxhVMho6axkjBVn/D/ok6EG1VXKL2iuAtAk5hdT
	8rVUBU7dMOL7PMyJCqzDhdveUpN3UDz1Jx6fVCpQo4AK77kQy1vhNGPuUkhS6oxR
	c1ijkLM58/VN0muS1ZQhuxyqEXvwudTJ6PJB0y+xIRGzR9YzCVwyNlQcntYYXr0X
	An0I1a372TVuEtU/Gw87JbHDk/YN6Xx4iW+amI+o3Lzox1waLgHqJYMvF2P0ZTyQ
	wOQ+jJQdcf0xOVOA1PJBnEbT6MepevICsboXtqDd0oLIdw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r3e9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 07 Jul 2026 00:50:40 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9693878131dso140932241.1
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 17:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783385440; x=1783990240; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kbaBHhic6gIIK0cxoTZmQQiRL9kgLJaSC+bKDRff9ZM=;
        b=Vd4RJSEWftB+TCcoWoy9Grde1c3I/pXFHzWX84CrjgixULjk8HohDXMJ5kVKbrmeer
         fqT4ufsX/JCtymxyD0vjquGFcFp6jmZg26y4uj0y2v9ciNAtcD6XHAHZnSArsI0/nEi0
         5OaCE+15eijD2pq9g1ftYcFIgkfwz+IgM+GzHWcA0wcUUu1Tpkmpir9/d6h+mCltGyhi
         dVnKZLAXI+1/UrwLrLoBfylM5KE6i1UlgTKu1p0MIouLSLJjMhiwGozjrqVeo+nvCiFJ
         9eq1z2Nk1mGPlPGk/GgzUaI02JlXds8sRQsxd1NHo+erl+F46f76LxhcmG6I4gMwRqFZ
         iZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783385440; x=1783990240;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kbaBHhic6gIIK0cxoTZmQQiRL9kgLJaSC+bKDRff9ZM=;
        b=InvrmcRTIpIyE2HwuDH0nGDfzXCF4xPCdV50dGTBuC5wxazF5NI5FjjV0ys63hasI4
         TCa/0CvpOzJYCj3AQbgH9kJUVXqLtfTzOLhrSihFNlpdXOkss3/QWP9NWclH9Q+jnRPS
         /7So4lPnUNoYaKTlhKgYLGaLYwubudlSdJyf+bhG68nT+XMjfiPlXm2IxH0QtYJa2RWN
         bhhWDoZuOo6oFoWFSECiG0S+LpBG9hi3qVC5gXqSNInkv0ulUMz3F6vEi6CmrtdFTLdz
         GrEOBDB/wncSQrllx4ZvmWyEkigCvYSmclYRf5zoqvgNibWQohkr4ZIwL1wALFAyL/Wv
         aMPg==
X-Forwarded-Encrypted: i=1; AHgh+RqQ1bSUvv/Qw8//DxP7grPGd3UDgVUK0YWRnicUWzYhFhZzGPDApC1LzIqbVOhDg+kiy6jtoLlYD/o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd1WL64knzzQ4kz7eE7i3+dqJyGZtfjTvxkJQTD32KrQ4QOQPl
	sEZ1omd7XXisrjF48nvohCGSgJJZIO2oFBPiRhiakQjikhmxHSGKKoe4+jnvS3CilBsPUgNAC32
	vhvzucVhSqdowqQlLbShjS14W0FmLc1Cg8Ci/ygXhBzUKnjiB5maV6vSZeIlwf+E=
X-Gm-Gg: AfdE7cnX6lsl4rnnQrRH7fLpDUgvF68hteH6IfZXsON7Y4bFXSCbQnXHK51fkJoMFtK
	ji9eTki+RZY+vGbm/x02s324bm5ns9Rcuug8zvSVoE2vL8UuY2S3v/I7vDqcMdxQKsHjMea49Z6
	6esiU2geZ/1AVE85kiwYqep4qk0d/iDeXpBTA/nJaS+V5IDaYhHlVYiVUC2uV3wtdq2WsRxX2wD
	uJqx0UidwpCqA4SH3kctQDEmIF9bR4vaO1Tb+m3AZzQNT9UBMD6L2TKy/m6ogW8vi+jyZgeiFES
	97jcXaAqBvPuW0nkkGxE2pgX7CDOvv/iie+nzJwPBczJbeLQteHFYjM7X0Y3dOs4b0dY2zroGIq
	y4dH5Bt37vzZVCKn0plP0l+ysXV6mELvo3866Yv7cC6DrQ57eYDeF6Y3TduiS4IOahrnIqqHsjY
	lc33C0oR/b3yuMtkTJPhpXvMYj
X-Received: by 2002:a05:6102:3244:20b0:738:9c72:58ce with SMTP id ada2fe7eead31-744c238cfb9mr307040137.12.1783385439560;
        Mon, 06 Jul 2026 17:50:39 -0700 (PDT)
X-Received: by 2002:a05:6102:3244:20b0:738:9c72:58ce with SMTP id ada2fe7eead31-744c238cfb9mr307026137.12.1783385439176;
        Mon, 06 Jul 2026 17:50:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13770a1sm3261848e87.20.2026.07.06.17.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 17:50:36 -0700 (PDT)
Date: Tue, 7 Jul 2026 03:50:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: esteuwu@proton.me
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH 6/8] phy: qcom: qmp-combo: Drop qmp_v4_calibrate_dp_phy
Message-ID: <jnfko7lrdlda6qqc3453c4kjmmh62e5vd5pcj2icbnvu737wi5@qttiawd4vjrc>
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-6-37e2ee8df9da@proton.me>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622-sm8450-qol-v1-6-37e2ee8df9da@proton.me>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDAwNSBTYWx0ZWRfX4jze978j+QBo
 LimWIwIVxMpC2xeUDf7oXcoEfOxtgTDlVjIrHYAObKKorYmp2kFfToVFWpz/XXJfaflGMBm66Rm
 yhc2w68XWsFH6fYPHCc+RoKTciWP3Iq9R6o4Nm9medr8npE1plb26x58c76RmPhMt7ib3XxydWV
 vGfJgqzTkLxJw4/HHpuQp4HnVBbAj8jLs8Re/P5yiS44/dK8J+/lmbmQYow7RYgVovT9ZKFA5hp
 eaMgQtMct7BnVHEXGZ28/3Xxf92rfnk+6vOqygi5QNkfJNQkURpMdh/AXFn8maY7L4C4pvXXF6r
 wW8jGpQtflSepEDh6jFeH45pqrsgjmy+L+/30Fl+SLRko8K5px29uk1sjaL0Jc55RKq0bhzp48h
 T4mDvE8Zmiq+RXD6FrHtZ4RZTayq+Q5TKnZAHSLch2Rcp0d/8g/OhP9GaLZf63NiKqx9x8Z+kgc
 JTbgFSZCwJ8Yv46c5fQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDAwNSBTYWx0ZWRfX7IVJrgb4A+vD
 ZobPSovd0AzckY5vZIlxZRhk/w/Qr/CurFe+HIdEH/0LtXm0MBT2RhH5eQRG0l4cMWhnsrTCxjS
 ldlQ9bgTGx89l+KYn4i5a5PEtYH3cMw=
X-Proofpoint-GUID: UpF7L6OgPb2tcwh9uRC8wKIyiC8HGePp
X-Proofpoint-ORIG-GUID: UpF7L6OgPb2tcwh9uRC8wKIyiC8HGePp
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4c4d60 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=0gM5omY_zckdEeGsnHYA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070005

On Mon, Jun 22, 2026 at 08:54:27PM -0400, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> There are no downstream device trees that specify five values in the
> qcom,aux-cfg1-settings array.
> Plus, after cross referencing both downstream device trees and entries
> which refer this function, only 0x13 is specified.
> Since 0x13 is written at initialization time, drop this function as a
> whole, and remove now unused variable assignations.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 31 -------------------------------
>  1 file changed, 31 deletions(-)
> 

Indeed, 10nm and 14nm PHYs used several AUX CFG1 values for calibration.
PHYs starting from 7nm don't use this calibration.

Fixes: aff188feb5e1 ("phy: qcom-qmp: add support for sm8250-usb3-dp phy")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
