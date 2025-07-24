Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E251F4C83
	for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 11:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753358131; cv=none; b=iGhgXx9llt1l6YZrvRqYlm7IHT5H5zAtkNuUEDtNmB3IE2qZuxzjADGonX3lWUvI9h3zmSZ8dKKksnZdq5951PoZBjKYkYsOMTWPEDgDkZAT2ZODgmQzmKBNKAuWsk847gOK3iWybyqH9JnBBEz/rbqbvJ4AdRXGotaJaP1FNhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753358131; c=relaxed/simple;
	bh=jfCb++kTsyb3iig2h1ycKbyRXElJw3YUbi8qzbAl8/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C9MlzqLciNOsONtDvCLTkn0PXMpfmriviTLYntzIGHmsyxanvwBVB+v9c9zJyc7cjNju5+gcb0kyeUwj9cFp9myuLDSnbr1W/0hXM8Cm4um0KW4hwlMLV2sRmMJhaMLSZ6p/TOF3U2NBpSFhjLgisCmX23xemfNZDaPoavnjzfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JtWQumYZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JtWQumYZ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9wQic015791
	for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 11:55:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mINbh0hT0mOMLjUaQwlGXcWW
	ToNWDwkhWfpfbCEFXxs=; b=JtWQumYZJkZLJV4AipaSDwxut0syaib3lRas6zal
	9hzcGjFLqShot4RHdNHklOX5WV+cPhH47AAe8yqT0jX2d8dZgOUbuVwDQN3OKcIo
	pBJnKVL2u527aYZm/oNeiLL+semul1dK55OAdm1vjxvEljN2GLcEAIlh/uo/IQnN
	M/daUF+SHZ/V3H5qR5zNd3iJ5CTzl317BIg/R3VLv9vHtebx4LuqPL39ye3qbMjo
	dn/BtO5izWiF09IRSUhHoca91PjSQQn6OGqTH3NALZKHEmPZ7bsVy3zkYTl7E/Si
	5rnvn6vHyUC/lAVtRld3HfnxzmR/Bbwj4BInBbpO5p/ZKQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483379trmy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 11:55:28 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fb3bb94b5cso14821296d6.2
        for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 04:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753358127; x=1753962927;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mINbh0hT0mOMLjUaQwlGXcWWToNWDwkhWfpfbCEFXxs=;
        b=UFBbbh9FCYoN1Tn2x73FkNRQmZlmKNvIwhxMVnuxbPcvehFx/i+2tR5F9yRXbc3HHB
         epLSul30eA8b2yDCiE4owv9OkKaX8j3OiVVqt8Hv1ePoaBaVUzrsYxZHLA1wiuisX/i+
         jFkq2FEV8PeFUFzgbSN1OwMdHmHQKuodUjLTavWlZKARynJ39CtieQEElJ5GpKEFU9J1
         jzJpO5u+aLLSZiysXSnqHz68oaPGzv+toXeCUQumQh0/b/7CA30eSuFgnsMJQBtMiraS
         UujzlGHFoBzLIaAW1ktmfaIq/w1ysaqgsgCtgVzvPKNNl1TPZjhHCShKIt59sgw3Plo7
         zbnw==
X-Forwarded-Encrypted: i=1; AJvYcCXk33OC4PVrAK1xwltDxKjdcafTVWlgNb+fOIKIB2r8Uc/4O/5Vyc3RwBq+gb/IYx2lScVvcP3lz2c=@vger.kernel.org
X-Gm-Message-State: AOJu0YydQCM+bv7Dl1uHCUwstuotSs7OJcGV/2UXgIg/HrsO6SRM3TJT
	yP+X0uIdB9TM/G3eCxryl+3B8+WMfkLd/W1W+lSNxDAa2SGt83MFcGr/mMW8uAlcWp1u/lVirNJ
	LdXPeptqjhoNkgcvxNMqRhFdfvJiHwLlJaHgzRR2xV7X1EMSutockPw9URgAESlo=
X-Gm-Gg: ASbGncsMd74SpNvOJqPMxTJcIzIbggPwjiLbtImfuOnejgLR3ndsYWXRR9ZM+6s+dK2
	Fe+9yePiudX1VrPUDVUE3wU6jTxQR9TeM22y+cNx3kHo4mOvOf6PRgEcFossppHUZzER8d6gNSw
	be2Jg+gtbdu5QuWpvmxV7bKF3Pioc0PaL5hVW/x+zpNaDmoupevC2Hv6PP/qn7QZ+HmuZf1uzjg
	dN60PxrMioRHU8DmknX8etLbDSuJbimLXsF9cFxzJkkxVk3E/loT4GYzyHsH3bahRndJUwNzgFA
	JnaS5TBHL2w08BkunA5VnQsshlV1uH7tNBVCBWFynxUGO/XWNPV8kvWbLC5aEj1P64dFx1XI8Hz
	3Y36owO2NNbnlQ1F8fivGbPTzmgglFoFWmnI4fBxVgvi1HsZ6b2HQ
X-Received: by 2002:ad4:5aae:0:b0:704:f3ef:cbc2 with SMTP id 6a1803df08f44-707006800c0mr78839796d6.33.1753358126567;
        Thu, 24 Jul 2025 04:55:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGd1t3+gJxk8pnw1F60NxFlYtusGeWg+p73JrUwlRncJWEKckPZk4d7/2qrIO4VrYiW8onn3Q==
X-Received: by 2002:ad4:5aae:0:b0:704:f3ef:cbc2 with SMTP id 6a1803df08f44-707006800c0mr78839116d6.33.1753358125983;
        Thu, 24 Jul 2025 04:55:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b53b2286asm327797e87.32.2025.07.24.04.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 04:55:25 -0700 (PDT)
Date: Thu, 24 Jul 2025 14:55:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Danila Tikhonov <danila@jiaxyga.com>,
        cros-qcom-dts-watchers@chromium.org,
        Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH v3 4/5] dt-bindings: display/msm: add stream pixel clock
 bindings for MST
Message-ID: <5nqzjnrivsuuttslzfecdwzigkqhdipy2wbjmgaa5mijr3w5hl@rbz47vnykzzn>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <20250717-dp_mst_bindings-v3-4-72ce08285703@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717-dp_mst_bindings-v3-4-72ce08285703@oss.qualcomm.com>
X-Proofpoint-GUID: 8Tn5dYIwoRfubspdpDqmvwAxauAUQ8m0
X-Authority-Analysis: v=2.4 cv=btxMBFai c=1 sm=1 tr=0 ts=68821f30 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=TLo0AdDBy_HI3n6x0gMA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA4OSBTYWx0ZWRfXzdSE3yAEf/Im
 4RjynYlpjD7rVpRHu+XBWSBlkire7tAO2bD1SlDw61eVUUdsvM5g8BUlO6JkQJKs+Sz4VPzTlal
 MdAUAHbnL/fCHaMp+2FPlv+R+9+vaYVVXuLwFttyIl5MUG+Zbhqcgr6CMQx2wCfq4nleK/9KYEI
 fCU+YZdBeIZ9qEzFu8jgsDDQhg/UkrDnrDWFqgbNIbPMZ0IlfD4JPmZLKlzWmeH5O5x/BS2Rb8I
 /r3Ve67H4av4hRpd97FnHqvvtPp6k51GgQ3jrWdZVoqE4N7h2mH9JdPWCFSt7m+M8sc3KkqV+/M
 LbuVhSdf0OiYWB6lKOC2JcPtasGaI5+tcvwcM9fqLNu/cCO0HlfSZwhX7JtjqRybnab1N0rB82i
 wTYogmF4huWw9LbG0n+2zHFAEa9qF0RVvl2VWR0mcFEIy+ChIH/MKWQIYjRXeavayg57WCVX
X-Proofpoint-ORIG-GUID: 8Tn5dYIwoRfubspdpDqmvwAxauAUQ8m0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=810 impostorscore=0 mlxscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240089

On Thu, Jul 17, 2025 at 04:28:46PM -0700, Jessica Zhang wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> On some chipsets such as qcom,sa8775p-dp, qcom,sm8650-dp and some more,
> the display port controller can support more than one pixel stream
> (multi-stream transport).
> 
> These chipsets can support up to 4 stream pixel clocks for display port
> controller. To support MST on these platforms, add the appropriate
> stream pixel clock bindings
> 
> Since this mode is not supported on all chipsets, add exception
> rules and min/max items to clearly mark which chipsets support
> only SST mode (single stream) and which ones support MST.
> 
> Note: On chipsets that do support MST, the number of streams supported
> can vary between controllers. For example, SA8775P supports 4 MST
> streams on mdss_dp0 but only 2 streams on mdss_dp1.
> 
> In addition, many chipsets depend on the "sm8350-dp" compatibility
> string but not all (ex. SM6350) support MST. Because of these reasons,
> the min/maxItem for MST-supported platforms is a range of 5-8.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dp-controller.yaml        | 36 +++++++++++++++++++++-
>  .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 10 ++++--
>  .../bindings/display/msm/qcom,sar2130p-mdss.yaml   |  6 ++--
>  .../bindings/display/msm/qcom,sc7280-mdss.yaml     |  6 ++--
>  .../bindings/display/msm/qcom,sm8750-mdss.yaml     |  6 ++--
>  .../bindings/display/msm/qcom,x1e80100-mdss.yaml   |  6 ++--
>  6 files changed, 59 insertions(+), 11 deletions(-)

I've cross-checked. We need to stop declaring SM6350 as compatible with
SM8350, it doesn't provide MST support (and so there will be a need for
a driver update too). Other than that, please document DP MST on SDM845.
With those changes in place, I think, all platforms will be covered.

-- 
With best wishes
Dmitry
