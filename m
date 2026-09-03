Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCA7490BE6
	for <linux-clk@vger.kernel.org>; Thu,  3 Sep 2026 13:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440650; cv=none; b=IpDa7kvIzs8Ii1+qg5p2iVTxSNfD9bos3dGHGTIDv9Y6iGqEa1G4XCpj/PSbKktOYqqR1KNDb+2MJv5f6l97rIhhRGwQyJkVaslJ2fitRauFDMVDQvJ+fdxnfK3RpgiBqcLskpyfYltWaN2QzAfKB4CAPGxUdkzzD6kfl7xXg3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440650; c=relaxed/simple;
	bh=uKlKDCO6lte9oquheVtNrXZEi++5BjURmRRXHWT7JWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l9rL18hU7OXryCPBeZ0rtT5Xf6BGMuye+CzpaZaVgQkd+FshiqfhOhMsFnFNLowoNwIaRXaPFzpgt4J78AD9WrQp1G2cXzlL/4KyfvzuguhTxDwfLIafbVIJSqHr3GlpsuoF+m3tV8SrUaJ5hYF06UFBgPMR8lGtW4GrfD6Llz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KE3SSoes; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BDjb2HY0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KE3SSoes";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BDjb2HY0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AH9mR3203931
	for <linux-clk@vger.kernel.org>; Thu, 3 Sep 2026 13:04:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n9o9tfc6MP2cm/LhJj6iD6n2
	2+6eraXxnRkI1mIVuDE=; b=KE3SSoesEq1RzZ1pOwC1wqNPDoVtj8xjf4xMQ5JX
	X0oTrmpNrQbbB8EQMzrbok2QLWOh4IemCFx2EE9c2GxumFPPjFDWSZBCMNVCsGP8
	QXGEBNW5//RzDkg1wPyzOyVedlsz8o6iNBItzsWGVl6119FmOAoF0W5EixxElqpM
	Ow0If3sMF/u1h6kN2VpHW/fkyehJUHQMp8RvErVy9ZoOHAs9p37Qk4vg580tALID
	lP2e5U95WZQtzEqHl4xiQZs/oRFQdg5SuD+BLlPUFGluLW/5HbWK/kckUqaZKrPe
	Qys5ifjjWZEcWEKC7lQ6DfUObrenE7vwe00AQvV/uyW3iA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5d111b4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 13:04:01 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-98055f91346so1756478241.2
        for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 06:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788440641; x=1789045441; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n9o9tfc6MP2cm/LhJj6iD6n22+6eraXxnRkI1mIVuDE=;
        b=BDjb2HY0j7hb8dV+QzCCQnMbSFXOaUpBeEI5wgt9qGog9iutTwyB9nBcHOmL84fCaU
         whhrsYh/HyFx5uucO7J+EbLiGRSJhnnBAZpQl6j8mtlI5MktwzsVG6gGm7FoOKh4ImfS
         lFbIlzVMjnKcA3Yqho3btzVURIaBUjY7mg/VGLD4dcSmtuRvda7KHF2I56qzUYQX8it4
         xC9l7c5wlzXnS9QnnhRKJXZBIReHUn8lz2RIlSdxFTsE/8AqhPA82WWdcT5Nfz2blp7A
         neO4Ku7n02CwnRUosyWwVjHf68uzySj2f1slWQbW0G4mI0pKE5sSJERIAihxpnMy0SSX
         qIwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440641; x=1789045441;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n9o9tfc6MP2cm/LhJj6iD6n22+6eraXxnRkI1mIVuDE=;
        b=e95k4hymVawQDUwMzDrE4n6I/9Y0e87W/wmcihupZ8KHEL4Jb27W4vPdI3YieSeWpO
         KloV//unxF7BgEglEvUJ8sB5RbdpyoiiMkIi9oYB6OxalY5uw0+lDTUXENOMrcGHxFDi
         Rft7vi9caodmMf3Qc9g3h7mDx5B+LV53s1ZCSALAJx4kCPCRAExORpucPl7JknvEdU2S
         ZppssI1m9gFNqx4f/JHXisUkUQfa4Xk8ZkjRPdxy7a7ifhPRxsKCm3ehQ2r0x3He9zkz
         9cc5ZUKdpTGKFrDK30UHe3/pHFRfrI8nt2wUABiCji3vvxOk1dHPqAnfVmoOOLilK24m
         gZ9A==
X-Forwarded-Encrypted: i=1; AKwUvBxaeW83EdsLOhFWsJSG8roKWUUAdz6eBSRAKe+HchsZBNAGBiiGbkJo7Crd6Lsm7CEQeLfh87nx/mQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nx96MrTFN7Z5sNlTu0Rv3hunKZxCHea/1jIXUTlmLXMw+Tb0Yy
	DMIvhgmpUTsnt3CvUQLpJyhSbYQURTSLXwILZ8ppb5OjWqv9VbWibr2l7CpSToxm1wQTy2hNVbf
	s3KJ20cTfJta0Io9TBe7sfV6kWxlvm9HUp/gP/40qPklMVO90Jwl57fb207g1pPo=
X-Gm-Gg: AYBFou28OkbIvIQS3KEz8NgmPeIe7W9COh8YpcJMdP2Mogwa4Xw5X2BXYF1vYcOmO9W
	roc6rSDezr7gREjKPrl1sdP5JLkmB1AQmRxbBQeuF9nU2uZ0Z4B92CwTMTkePGlQkkp8/QkSj6T
	CbPMBrLaHNhW6MtIPJbJa7z80D9jFj8JpH9cp3t7NmT1ETnYQWzzEvBSgN/RAyrD+NIioua8X5P
	o9VKfFVyW7mMGZBbMoxjkv7fgMC9LgTLAF4w1P+mOZiwObGZBWs9na5Zi81NsD6YrrEGkHsou+f
	CkGkEkUzLN1UnmHk/161MXYSzg4eXWCi4LqsTHBw7AwJcWM0tBAbQBwJGGPqdtJhyYHKWqZn2IF
	P+w8wsPu/6/ZWQw==
X-Received: by 2002:a05:6102:3fa8:b0:785:d308:cc2e with SMTP id ada2fe7eead31-78a1f363e2cmr4307738137.9.1788440640435;
        Thu, 03 Sep 2026 06:04:00 -0700 (PDT)
X-Received: by 2002:a05:6102:3fa8:b0:785:d308:cc2e with SMTP id ada2fe7eead31-78a1f363e2cmr4307694137.9.1788440639785;
        Thu, 03 Sep 2026 06:03:59 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eea961sm13755345f8f.28.2026.09.03.06.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:03:58 -0700 (PDT)
Date: Thu, 3 Sep 2026 16:03:57 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luo Jie <jie.luo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com
Subject: Re: [PATCH v3 06/12] clk: qcom: ipq-cmn-pll: Add PPE clock support
Message-ID: <kx7vvg73j64dujbmbhblwr6wkoxdkimvw64uew4llzvleo74sd@wywugwoqv5ks>
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-6-21c3db378611@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-6-21c3db378611@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfX/jYIkEv1DhCM
 PDkJmvgGrylobZrzmx55VTBE28O07JYOtqQ5YZa3+SL9T5jOTzJdC8ZP3jkUDXEJkNtlxGoWDTQ
 RPEeZLHJS7pgOVzFpy45YquhqSbrBnDBzQKKbKCtoJbVKoKQgMaBDKm2bxtJgQKl2AQZOIx01Kw
 Q3DgbUtoUpTyIGoc5s/pyvLf9MBlQDpdHnyxKJOOQHQGYtp1YuAYwKvb7NytjRFB0b/BNiVSIsW
 /r9CiD1asuURVCgBbc46l/e/vnX40TZg26RPlbkY5faM/dBuwA9GyC0lkakRgE30yskzi1p+rmS
 i7Zu3a+KQSG4eoC2lr7vbWfGs0qNN3Z9iqsIz7fPgkXLlyUYLL9nIWElcUMty8b3RQMO6QRsa4W
 ymYubtNRlpVVTSGRKtwwFP/ckGFluigsYkvgBMfAqj+0zAIe+rEF0OpP9RCFjPUbpAEzHs10UbF
 1f7qZwzV415Jk2UfvlA==
X-Proofpoint-ORIG-GUID: pzauTxfugbhd04ugHVydow79m-z8I6cU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfX4mwJKaszIykU
 VLYzxqI5IYuyVNYjtn0OVulBabfOR8PsW21Lgfddj4Bv5KFUgkXrupqWwogfpSqaWa5smoa1OFZ
 c7BP5z1BVriliyjuG0Zvb3AKgvTFN+c=
X-Proofpoint-GUID: pzauTxfugbhd04ugHVydow79m-z8I6cU
X-Authority-Analysis: v=2.4 cv=J4GaKgnS c=1 sm=1 tr=0 ts=6a997041 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=1qdZy_LgBuSf-aNzAIkA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030113

On 26-08-14 05:48:16, Luo Jie wrote:
> The PPE (packet process engine) clock is derived from the CMN PLL
> output divided by 2 and then further divided by a configurable 6-bit
> divider. It shares the CMN_PLL_NSS_PPE_FREQ_CTRL register with the
> NSS clock but uses a different field (bits [5:0]).
> 
> Register the PPE clock through the ipq_cmn_pll_regmap_div_register()
> helper introduced for the NSS clock, passing the PPE-specific field
> mask and reusing the same cmn_pll_div2 parent selection as NSS.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
