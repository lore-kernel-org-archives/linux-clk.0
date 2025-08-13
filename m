Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8BF1E833D
	for <linux-clk@vger.kernel.org>; Wed, 13 Aug 2025 13:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755092710; cv=none; b=c+MJXrJx6aNA80xWlY4b0ULdyx2vBhFPZ4OiLxj11ggmvxSEka0AQPnip/2QDU+yHFSrNOViYyqUmTYbJu5nL93WZY2zaRyBmfzyP1BgUOND1Pntux2r/iQrj1fNEsCGvxBOtzXRBFfi7vmElUzueRP+HWGoS1Mf5v5eWVswjvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755092710; c=relaxed/simple;
	bh=rrnMVCgKWPLf3+i9sUlbk7B07YYSKzjrB6rut30/jHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YKMmXDDV9rGRqcTOVcYuF3bKouptSCFfdGNNC5g/ViSJeWvJa1W988wPJ3iyTpt8ohxkK4gwX4XumKhHQhseD9Feg+E2xYBtCzRA/dvnx71Fy7a3pRL2h0S9Iyfe2cbe5bivi8DQ2ESGNKkKq8WIk/bpacz3d7SyoaOcgBFXKrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BWyDWoEo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BWyDWoEo"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBLfOM020597
	for <linux-clk@vger.kernel.org>; Wed, 13 Aug 2025 13:45:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Tbskgr1FSTKaGM3oXM2qZ3de
	YMZHFeQyPrPKxR6kD+w=; b=BWyDWoEoFq58JRa7SG5IxEESvB+SRK7rvbZs0POW
	sWjRIfqUXIvOJzv1PPyAnuOrxuJaj+K4ayVOhePlzBTJpBHTdM7Oob8H7sRnXAf0
	D6UvXPg8TY9ebo5GZzexsA9gCdZdajJb1519o40GZtzjXBKi+v/1BZTWKpJ9U0+3
	8W9HHulT+EDFFMjpzCjkrgwf5K8C2AP+5XdS4Xz6sMr+S2cRzJ65OxywIaaI+3e3
	xW78x4RcKJ5z1MuOLPkX5XrUuIOzcqrN3K0lDxIMvsK+3VsqTDZS0VJarkgltiea
	NwBRv/2P9qgpSJdJMd5oiDaTv2RgToLKYbNov39aG5tr8Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g5hmbvrm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 13 Aug 2025 13:45:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b0faa8d615so24394751cf.1
        for <linux-clk@vger.kernel.org>; Wed, 13 Aug 2025 06:45:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755092707; x=1755697507;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tbskgr1FSTKaGM3oXM2qZ3deYMZHFeQyPrPKxR6kD+w=;
        b=WRWXbzIh8fMqEG2GDirwvzlCsVo/WvvUYGpn5cmrpC9DAousnhZceOYcMW1x5qGWcm
         9SWUdKOmp6LCChWt2LXQHr7E3LSKzqDVuso60OMxezc3ERNGs/oZv+AOphHkI8cxr2yn
         qLmVo9YV1jtkFw8u2wVJsPcuON+Lf9ZXIvaUJNTaoEra/SRVyS0wB4mKm2kHdoKkYJBy
         7DwEJcUW8qzVi3a6doEjIqvAlxgc+u0bRSG46KL8F401xsTTfX1soHpo82lscPPSQPdj
         HdnebCnJn3QJtWRlCFDdl+ekLOQ6O4sMpCeimzvOPjS8fqBLZ9dwUT1PZCSAFxeNodGb
         KCpg==
X-Forwarded-Encrypted: i=1; AJvYcCUv0phXwiDMCy/uoBlIFw2tWPpHLHPbZsLn3UV5l+4sIOH/yZxwh+IY9ZGG7G+MGzlb3UpsK9wmN40=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9pm52XRTMCCC1wL9b20dZRaRm/VaIP6AtpHWnmsY7T24PkEGV
	1QzWhXaJRbb+HBKkKX4fmkk+HsVKf9B170fVJup+Gz77+el0RxrOqCAygJ6byXRO3I6sEXhM01g
	1iZg2wKo1tQICq9zhmZ44IxFEz8vQ74aOZT4DeJCKTdhtngOnP2WG0rFentIOu5I=
X-Gm-Gg: ASbGnct5B62nuZzoc2b8ttF5q8VvAVP/VS2ImP5H3F2Zk9QRzj1+dmGADgQOMsKk556
	kGVZAgyIBt2Dj8ARX3583l1bxCLcDB9sk8cly4fRrXQnQJJ7QeShyKjebefIKLNMYnvRcIqoxXh
	VE8lWIXL1guirfvuoNGP/qFFT/zctH6FH49kWbPxzG4Ofv+4XReiXS3GaNQfJJQvaao70DmeyKo
	hJF368ug9H6svIXoUcVNEG8YwBA7JH+9L5wyx4b58GlOdHkFkwNxFBIhu0QZ/W0EbPJaPgurITN
	OaX7vXxw34mruWqbW35kuJlgHPzrmSW/gK25wAt1A4a6i2WJCMI8twvC1Tximwp9izogkPfMrWj
	C1tCsWBdSP5hR8XDYsTAkAnP7ZmOWTVH1wGbAh/PTqgvUhUkECCef
X-Received: by 2002:ac8:7d05:0:b0:4ab:640d:414e with SMTP id d75a77b69052e-4b0fdfdcf13mr30019781cf.3.1755092706616;
        Wed, 13 Aug 2025 06:45:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwat25ikRoIeKUsZVQAp4uJJPxvfxNq7VavVdhY+SbjXOk0RTjYbCeFGW8hIPVRdi8aHXzsw==
X-Received: by 2002:ac8:7d05:0:b0:4ab:640d:414e with SMTP id d75a77b69052e-4b0fdfdcf13mr30018941cf.3.1755092705862;
        Wed, 13 Aug 2025 06:45:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88ca2978sm5281543e87.116.2025.08.13.06.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 06:45:04 -0700 (PDT)
Date: Wed, 13 Aug 2025 16:45:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 7/7] clk: qcom: gcc: Add support for Global Clock
 Controller
Message-ID: <rv7puyb6wj4jf5yfnml3sjwjes2qnxwwfmkvhlbgbxescy7zjg@nh7xym4qgjg6>
References: <20250813-glymur-clock-controller-v4-v4-0-a408b390b22c@oss.qualcomm.com>
 <20250813-glymur-clock-controller-v4-v4-7-a408b390b22c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813-glymur-clock-controller-v4-v4-7-a408b390b22c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDExOSBTYWx0ZWRfX7ZDlyPEHC46X
 KKrCXYwcEYcbAOTP9AlC0r/1tjUpi9Pxbpc4hWwDXXRLHQizbVZQGtkLTMkJhWyVvflYcWwBvZI
 9ha/N+x2B3ku1lSL7C26Y0Ck74ROG+j72M4qWLxi/c5bFcYOICK4ae2OJK8KEZznxcRvrvoxAD/
 zEDm8lS9cJZvT0kSqZmXQNWGVmb4fN3U0COcMHafus3feMJe6dF4JuASxA3AuGmX7bWxLS3NeyG
 EZrFj8pK8Ou3JnxfvucYP6vk/6a3Nsa5O5KjNNWWPBrYLykjJPgr4A6aN7qEAP921MZtB7WfPq4
 a9bxhcEZ+di9dwSFzgNs8sqp0aUoK3rlmTTZaexs2bVNT5bN2R/62U9mK+W2KC5vxXLAaXH6L2Q
 eeXs0WyM
X-Proofpoint-GUID: ubQosH8gJ1iic_Xx-VV6uC4Zip9yeWMs
X-Proofpoint-ORIG-GUID: ubQosH8gJ1iic_Xx-VV6uC4Zip9yeWMs
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=689c96e4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=wc6weylmL2S_uF29i7wA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120119

On Wed, Aug 13, 2025 at 01:25:23PM +0530, Taniya Das wrote:
> Add support for Global clock controller for Glymur SoC which would
> enable the consumers to enable/disable the required clocks.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig      |    9 +
>  drivers/clk/qcom/Makefile     |    1 +
>  drivers/clk/qcom/gcc-glymur.c | 8616 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 8626 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
