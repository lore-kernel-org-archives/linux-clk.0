Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72BF28B7C3
	for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 22:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749594338; cv=none; b=AyyUrTMasbRipqlUKzPM2nkij3ts0RxuDi3PZBAfj+xDE51Q0y8mfqn95T4b99CbXrCOLWEKcMw2gtnanTDK+S9Y+KXmSEStjDTW+7u9D+BKL53FNQmTFm3Rkv3X7dlLECsMnhyw6jyUXkVUaFTY6xjwJ5xruApsKJ3W3+tf42E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749594338; c=relaxed/simple;
	bh=ZblPVCW6RisPNEnVqYsXRlK3rux83HEJD1kpftoB4OQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QL2l08Ntl4H3crzZWGRUE2W1rwOheYNcYiseuf6g4r8N5GqeHMAztXv95n70Uuz0hnbiWMPNovTlxNyUh5fCnNQe5/k22xGeurmGfBN3uBRZuE0Aax/PvR0kerhyEQjRgOJDAb/c60wZBl7hiFh+zWG9+1LMec3V/WQshPZuDPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RrEE2rKO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RrEE2rKO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIPqEN023650
	for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 22:25:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NIZerdv5856btQLeZiz5wtEr
	Wi3yo26TMxxYpxr5HC4=; b=RrEE2rKOCsDtipjqNu3tng1rbnolbgehv7+H0EAY
	FEZ3H6HJXAhgS62zP8ebfAMARG5HvgV9pM3dCS4KYpPB+BbADg18KKaiF23MAviK
	aWKYFISZQw1nOkOu4S98mILVhI3YL8NvaIbMq+tSvVxm6RH7+mPzzhFd8kcdEiEx
	CbWXr38/2kLY4ZqvMTtkyibG1i6PTw5lI3XtrE4ZMWb9yKLIWvaiLhoFiQIHGo/w
	E+U3k3aU54O3uGviqpsf8HqDgVh5HwDx9qqUoI8DI1zZ2HEvyU02MNC4Z6GZ2G6f
	vwbOSUWzItq5h2m9uqp/dgqun15+RhvbHDPEduLyoYWF4w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcjx4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 22:25:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5f876bfe0so1063683485a.3
        for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 15:25:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749594335; x=1750199135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NIZerdv5856btQLeZiz5wtErWi3yo26TMxxYpxr5HC4=;
        b=QEySZ0dN2tDS/0S5ob/czbGx3zyLD9LeJeT7NtULIA5UdTc2nseIzqIBLnHW2meak3
         sWJbYBgefgQ14CKa45UBKjSTCgD0L+TyRmmVUkab4sjdX/sYwOS6Idz/wOYD4QZS6hKZ
         QhNQhz8YPpjKNlDl49/uCN5PPZu88Kw6bhM5xxfdRY+CFa5UQSEAJ6aMOTWu7XulX29F
         smeRqiD61lhlpaovtLimvcROONR94uQin9Pc+doc+g54qqEbxCeGctWqkIbbvo+AT13X
         IHK3z3fqeyCsGe5a9AQdEre8Rn0Km6vcz2YDYSNFm7LGRFw4wB+ppbk1VoUabsN/tVWw
         0zCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUU9q++C+6xV0cAAVt0cVu7WXU22mcAB1jbd1q6S7mCP46bF3FXbinHS390jzll5nEiUBJBqNiu5Gw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2rlP8Hyc/EIFqeE+vPc9cSJ6YuQS0but8l5PmrK6ikYEBXW8q
	8kO/GPzM2gvdj8V+R8ZL2fqeFCbJzzzo0wYL4YaHiTydo4SO+Hn3cmgWu1E6BAypBD/lrWdPFsS
	elbGIdl8wdFmxBn9YAW4p/qyqrSNDjWg5i//sW007L6Xmx5XvEXB7gxLqRU8KurA=
X-Gm-Gg: ASbGncsESTJ5G8S+778R78P9F7UXRYKteJCD2/uDjhKv+1IKrTZS1ROwj52ukA+jHAA
	tIyIEvE6jg90vxG0PKAuewDUE3bk+Xx4laHyh7p3V5IjZ/UE/Fjn4Acns3eYTvWk9k4SMcirGCC
	bMj91Hn6fAaXlY1Mked3sSyZKdCkpuuLKJ2dhSjpKls3Wk37afMWyPbdvogHf/jG5pHdimnP3MV
	LkD0U6c81QINyl+TW1AULM9l7ZNmQmP537pioyZ7mEL0ZJGPMtszbVmPOc2dYWbZZyIgKD62w7x
	XIWQkoaCzT0+ij1805Ga5x03bG40Imxf/5MYx22Q+CKRyt+naUrSdJHBa0W1xfv6/7DuEuV/6h0
	gH1psCYWBJzAvID/zjmD4tmDAOUObJLaINOM=
X-Received: by 2002:a05:620a:1a85:b0:7d0:97b1:bfa with SMTP id af79cd13be357-7d3a8806306mr191674685a.8.1749594334714;
        Tue, 10 Jun 2025 15:25:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvqgKPApzu3rPogEhB0z1OsbrjkQcClCu9eRwx2CiVtQGPtd7+Q1xiMRbqpX3rcwtgL9CA7w==
X-Received: by 2002:a05:620a:1a85:b0:7d0:97b1:bfa with SMTP id af79cd13be357-7d3a8806306mr191671485a.8.1749594334288;
        Tue, 10 Jun 2025 15:25:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536772a80csm1706310e87.162.2025.06.10.15.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 15:25:33 -0700 (PDT)
Date: Wed, 11 Jun 2025 01:25:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Abel Vesa <abel.vesa@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v6 13/17] drm/msm/dpu: Consistently use u32 instead of
 uint32_t
Message-ID: <gvxglu5n6esoortifeyeapjlkwks4adxktshj4mcc2iyigq5fj@ztsuritnshkf>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
 <20250610-b4-sm8750-display-v6-13-ee633e3ddbff@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-b4-sm8750-display-v6-13-ee633e3ddbff@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDE4NSBTYWx0ZWRfXywLs27H5cCYD
 FGLR02OU2dlqRRJcwAeACCjlU4APRshNMBCvcLPFsNJuT3p22+YCY/tJp86yLRvVn0BvW/fuGyJ
 rGGvJuIN5SbypfYDdhS2yXTAXLU6THS5VZBqEcYGP0uRUBzIIAMENZqMwDIwPl9GczdqXfg/ksE
 XbuW7+HB96gIV8Boc6iDb/M3WklJVPCGpBq55MkMNJM1gJkx9PeBY0nklkWZGIG7lYPFbCO+z8u
 oYuty9YiIBRMiLnRH08PUuD9C8nFStzJCTL4inBmPzicZ1AnACl6q6PUVbindnQUDfr2DO+BHyu
 Oyb2ey1XswDH9COc/k0Hhrt8zbiQ9eMvouYcxuBizAx8ySN8PonuCaAReUgh+Vj0Rqiw4dVyfNy
 KjWKH+Zt1x41nxKaDF6oNORaa6C6rv//iRvgIjvQgBRbAwr68JwtaH7pK4eGjrVvxDyiXC+v
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=6848b0e0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Sbni8NmfYZyP3K5nzVUA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: vSDJo15H4d0VHU2RA12l6kY94_a1N08h
X-Proofpoint-ORIG-GUID: vSDJo15H4d0VHU2RA12l6kY94_a1N08h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_10,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=810
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100185

On Tue, Jun 10, 2025 at 04:05:51PM +0200, Krzysztof Kozlowski wrote:
> Linux coding style asks to use kernel types like u32 instead of uint32_t
> and code already has it in other places, so unify the remaining pieces.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 
> Changes in v6:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
