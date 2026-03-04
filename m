Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE62F366550
	for <linux-clk@vger.kernel.org>; Wed,  4 Mar 2026 03:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772595207; cv=none; b=BIncbKrUnS6JRRaD+Zp3v2RK/exgugyG/qxov0H3MQRSTS5eGzREaKIqAj6LIPwMjyZ79oQwvdInD925XtC48/LkUUxGICkL+n8WuHi9VU0/T9EslWB7V0kfW5eT3eSesOY0APmq2S1T0ivneag6ZsOYErlOFSEen5CW8Cne05s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772595207; c=relaxed/simple;
	bh=bQf3n/4vXD2J88Qu3FkZsjYMnc+uJ66dzjrpMzKD1m4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S725tuZ0bePYTpDvspQPMGkbUfJWZjzR8x2goqj5Is5BWuQQ5qgp85cw0+Y7nKhKvSBnJEUAX3/2TfNQMKp+vQ46Kh3KLkMDoZkq0BlbcU022kY1b6W2vgTeMwBa4Qr2oSUknUNyHbLD3F+a0FlRkygbV2ihbs9Sqbz/kY/G0QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BzLuD51l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ty9BL/WR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BzLuD51l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ty9BL/WR"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62422WoM4030568
	for <linux-clk@vger.kernel.org>; Wed, 4 Mar 2026 03:33:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iqphSR8gbO1MF8lISTqHPzSh
	VfwJQqTLFAllpN+xsG8=; b=BzLuD51lTEKD0XYqWIjUVNJoid0+g+UFcuUmHkJv
	iyn7ly9h2zfByOB/Vhe2xzIbPqea/3TX9FuBVuAhtAAgFlGWNNIaS/BG7ZXJK+d9
	HH0lbDtD9kMtMbFrWygQDCAPIWX6xkuh9fOQGMX6v2t062MbQg7aG9z6z/slqs+O
	JyMyiYvWUggX5gp2EGcvkyHFWipSA5e36vK6yyEx/fh5mCxWahWNVHORkv6IxUfW
	+2WrbwqFXJPiRlOFRfAMGGZqp36SXvXYkylLO9BT4XL8Q+IZTAU5LFra+IXdj1dO
	sswVSN1kDOjJW/dQcQVaCGu647P8BBobnKd4D54DeG2ihA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnuqu3pjr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 03:33:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb42f56c4aso4414270385a.3
        for <linux-clk@vger.kernel.org>; Tue, 03 Mar 2026 19:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772595204; x=1773200004; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iqphSR8gbO1MF8lISTqHPzShVfwJQqTLFAllpN+xsG8=;
        b=Ty9BL/WRKo6KiCDuiTAQHesy8uqcfh+XllFYT2wjhRFqCk7laZcykIir/vnL9kstgY
         0QErHJbqkX5UZ8KORqsyE0X4vDwxwUitCN4X8mMaV0r6KB1icObhZBLSYrh+DLzC9nNk
         EIpsDkwa+0LVDBWkseL7enR4EItswp9jaQvF6LcmHnJ0kOK6+DCnnwp7VNGrnsl/Tk4V
         cf5fH5n4sK2Qgw1+ZnTgfhhIxkbpynlvFrTKFEsbPnPCS77FNKT3ByrT/Rt11PrVVas8
         B+CLzldVMayy/ac5z6bld/lEbGAT33cPVdKgsVMLwulVNwaZg8FZvLcFhE1BMgagTm+H
         gqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772595204; x=1773200004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iqphSR8gbO1MF8lISTqHPzShVfwJQqTLFAllpN+xsG8=;
        b=CA0xhzR7ENdtFSbazTUK8BHyeLU8m/86abi3t2zgQI/ct6IzeoJmEQO5h3TarsiVgB
         U40YMdZa/L/Gv5Yq/ogxDrbt4EzUJcDkx1pWJlAwB5xjSC6K/KIZtailxnU4jCZwZOJ+
         qmi/P99wYIOKNrEaB+fP2Q11MI+0aucDC+WxPhAQpeqPK41kOBuwkN4VWGXa1HUz4kGn
         E0A/N1X5Vf8V77sdIN2V63fK7Y17TvPHYD8bddCbAe3KnJCIbflvFvvE0zkiwdQZ9+lX
         ue+KvSGYiTmz9+BIFqPvIF4sxLohli2yd4wW9tv9kCHWOheev++y/GQ9cfJmwY+0RQ3p
         kEEw==
X-Forwarded-Encrypted: i=1; AJvYcCV5mJbxYZLxO6CbBdqgu537Av5g7pl7AF9/Cez1i9YQnNT99gHMTPLhjjWAx5BzpwPAlIgf3j7Vheo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiEA3eZYsaLU2DE4IidvltH9KCxXx+mFOPr+q7JIz28NpQS6fh
	/CsePqm94OPSok668K41x3EyyDbs/yFC5jF0fHVN/t6rKG3nbJO4VT7QYbHSQ/UX3WNu48JPXTz
	nAV2ZSIJ+IOwagl8zKMWDOQEbu+ROqEc6K9/LuD5FlnoqVz00MfvKB9SC91egCaY=
X-Gm-Gg: ATEYQzxn67DIEExZXdAW4X3IAEI+8V3IunKS3+0LED8NiZjBYIDLNnqtVErn1dAsFE0
	0XClM6kHviOAMcFVZWFfJ5H93Dk3E+OLBQimbOQQvx5uPtRzv4tupowUSAGWaIrWvC7M1wgV/Oz
	kWVlr+QS/oczTuEAtxjGekWRhOMsZrayAGRC0V8atGdLHNlZMfUQQ+eUMnrR6r46IB0l02KpJXl
	0cgQC4CFTnkoasBTwJmfb6REo14kYaTbVkyaWlmL3m+rXmQ5aYl49aqT0XXyz+I3cyNbWzJg3kZ
	ACp2qRCr3Cq91031NSadCG6nq+lRKxESyk6I2tvbCoF3JRywECVpXtIbYFrKDx4ddKP/uXtby0k
	Gr1VhifxIihAFpZaU0yApbSqtzxeqa0VZDZLCw0itVd0v80YCTcoX3WaBIlbUV/AyfFu4Opvctg
	yb8DObbm6AWLR8r3uq+7cx/6bVSvsxdOAAPBQ=
X-Received: by 2002:a05:620a:d8d:b0:8ca:3175:cc72 with SMTP id af79cd13be357-8cd5aecbd14mr89470085a.15.1772595204173;
        Tue, 03 Mar 2026 19:33:24 -0800 (PST)
X-Received: by 2002:a05:620a:d8d:b0:8ca:3175:cc72 with SMTP id af79cd13be357-8cd5aecbd14mr89468485a.15.1772595203788;
        Tue, 03 Mar 2026 19:33:23 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a123588ffcsm974426e87.5.2026.03.03.19.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 19:33:21 -0800 (PST)
Date: Wed, 4 Mar 2026 05:33:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        White Lewis <liu224806@gmail.com>
Subject: Re: [PATCH] clk: qcom: dispcc-sc8280xp: remove CLK_SET_RATE_PARENT
 from byte_div_clk_src dividers
Message-ID: <xvrggm5uhoocly3souofyql6yhcchrzvfmvko6t4r3nlxsdfhc@qvsjqmrrxxye>
References: <20260303115550.9279-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303115550.9279-1-mitltlatltl@gmail.com>
X-Authority-Analysis: v=2.4 cv=M85A6iws c=1 sm=1 tr=0 ts=69a7a804 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=r64ZnLUNze7Q9b7ZCxUA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ZIALIZuBtF9ma_Ul9TYKinVgaLniIxU7
X-Proofpoint-ORIG-GUID: ZIALIZuBtF9ma_Ul9TYKinVgaLniIxU7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDAyOCBTYWx0ZWRfX2ARPFDm8ac/4
 Xptb0x48OWS6BiqOUMRO2wRlLWviGb7DKKRXHc4vhtzMx26EG9PstMtnVFXr3QHlGkB5Cx4aECg
 cJ5xelS1cPGaY0W9fQEhLkyNo67vNfvlobUapLBIj4B3mBfXENfawbDVtZJ96drqn/1wIzxPrz3
 LsUCH6HORCpGhYxHCBKaOgEWk9qbuWkg0wo6rBbuN40j4ezTdmvSQrABlHwlQ72KFyvEBIAhaRo
 5/iFMiLCf1zQwLAN1P5tzwh27Rv5ViDlf01qoCgQQUCKvFufFhMqbq2cyznHfBbLxSQNy52em0K
 1+Ort5V/1PjgGbN/WWjU/AMijeaHsZHOZHZycAljg9E4ajLyHvOB2EnFcEx6QyHvlSVK7o/VbOF
 s8KxOXcL927Y/ZWV8CXtNIUpNMsauLBhc18bxPzizmx/a/cLokvf+/89jnwqruP2cHvEPL7XO3G
 EbUGN0XPVLZdl+FFxGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_01,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040028

On Tue, Mar 03, 2026 at 07:55:50PM +0800, Pengyu Luo wrote:
> From: White Lewis <liu224806@gmail.com>
> 
> The four byte_div_clk_src dividers (disp{0,1}_cc_mdss_byte{0,1}_div_clk_src)
> had CLK_SET_RATE_PARENT set. When the DSI driver calls clk_set_rate() on
> byte_intf_clk, the rate-change propagates through the divider up to the
> parent PLL (byte_clk_src), halving the byte clock rate.
> 
> A simiar issue had been also encountered on SM8750.
> b8501febdc51 ("clk: qcom: dispcc-sm8750: Drop incorrect CLK_SET_RATE_PARENT on byte intf parent").
> 
> Likewise, remove CLK_SET_RATE_PARENT from all four byte divider clocks
> so that clk_set_rate() on the divider adjusts only the divider ratio,
> leaving the parent PLL untouched.
> 
> Fixes: 4a66e76fdb6d ("clk: qcom: Add SC8280XP display clock controller")
> Signed-off-by: White Lewis <liu224806@gmail.com>
> [pengyu: reword]
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/clk/qcom/dispcc-sc8280xp.c | 4 ----
>  1 file changed, 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
