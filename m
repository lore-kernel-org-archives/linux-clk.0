Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E3F215F56
	for <linux-clk@vger.kernel.org>; Thu, 27 Mar 2025 13:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743083932; cv=none; b=HnsZ1xJcSP5u481IIcgZymo791Z/QZvOtIJmpsWWpjuEy9l/5AUaLKt34teu4sgVA84JSvtv42cPXdn4Vf+gMc6aI22Q30ixNdYnaxuDuV+vP/EaOQrgSKZPwyjmvoIUB/xmJdv+IfQxPDQC0qiR5NPXrzpKShP2nMKwQq03CJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743083932; c=relaxed/simple;
	bh=zZiGOhVsgo/Y8EMEI2gwr4ISypxZ3iuXl19VhRr6+uY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJ/cbFxCbOXODmuv5Oe9TkxsYrJtl6OXrugcuVYkN/ZLpX8GPnyjQHkeSMtR73yjLG1FLgOYR5npX8Ng287JaGqHSEs3DtzYbGwPLWEwTRsaiFP8VDARvtfM6cNKS1+sXn9xZjIsfBnnbDtCuBF40SmqiCFhv6ksMCdHxRxdOhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jyrjzt/x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jyrjzt/x"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5kOY2004923
	for <linux-clk@vger.kernel.org>; Thu, 27 Mar 2025 13:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jUsS+APZl4HXQqjDNLYfXk2b
	oc7MlLDwBMJMBiQ/pEk=; b=jyrjzt/x242mAzHdQTIPnNwuYd6S4Kbnrju6P8/S
	/MszTp803hDu+T8HYikCMl1uVxxtadF5pdl/GUze/J6Cf774d7cNlKSlUMLSNrUR
	4wfb1QkoWvJKK8ss4xtc52aajfhufePWdLrYfJr2XoqZZU2VRpcoM3d0VhMHxgJc
	28kghsnKw0bqgJ9vxmg7gz+piwdmmbb11l1y8y12x42daEY3wuQu3MFNTLA4Zs+f
	Smj/wCjswdRnv6pWX76fYn0udATGS1IVCAUIX0p8UaEPqqAgzEFV3anFZsW7AZfc
	hUtBaTrKCwjkY7uir4eeJNKtS9PZFWCZTKTBe0DaE4DqUQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45m0xdxcq4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 27 Mar 2025 13:58:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5c77aff55so217559685a.3
        for <linux-clk@vger.kernel.org>; Thu, 27 Mar 2025 06:58:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743083929; x=1743688729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUsS+APZl4HXQqjDNLYfXk2boc7MlLDwBMJMBiQ/pEk=;
        b=OlsxDfAXXpUuZ5NcSh70WPJDUnJd/2vBGQ1Y7DkUtZMACbKSF3/9Mih+YkRJm0v8Nl
         f+JjMCGIXO2X2tC09dvuNPK8pZ+nkjR+21yZol4GC4SqcJS3G+wZh1DP1bp9y9fLXV4P
         JiPXiUq7ODvbykDvekk4/6VYqZ+N2v13vQNHoxBZ8kzWKzSPukx7oY/J8TT5+NaeXQW/
         dGi+ufnglN8rGLn3IQ6rnsA5w84LptG9Ugkzb9WPfPAuETocuUc86uNLSRrFdDbY87Vz
         nhY9AHvcvZcQFA4mxTNhOvPow5oO2IOKAmEXuX2iGriDS/ldTdhnYrgv+JVh+KtpBks5
         +Xmw==
X-Forwarded-Encrypted: i=1; AJvYcCWDoh7iPGE6LydPMHmxryo9q4f7nZg92haw3Uc3SRAkiuw9eBfpyWUwnJ0nENOlNACQOyQFGhNTPrg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7zCGI5z1aEVLv2nYbGcsUD+DKIfnTJSwPnnTLR4QOJhWnTLIf
	nPSGa8m0/cY4WRoSQ2gwB9bTUv/ViHqH5Nu92iSeYS+5DWjbTpWkHSmjFjhR+NR/Y65LZVJkbI3
	/fqyOjPRCjuFBDbFnDhF3cKrvnsh3bxAscC0QTKIfjTPHfsK4QJIJvQHGH2Y=
X-Gm-Gg: ASbGnctrF5hYIdaVX+Q9Z8FW7/zWliv7ks92AlDeh4Nl4FnKnzRgPvSLABQvTZJ/tpv
	8u6Dz95P9hsWmNb+736pn/2PkF4G+3gJpQM4vtZm50TE6Hprvw6AAGFZguJ639DIaw+YZVaXkAN
	lOt0mqOvh3IhN5sutNZxzCnmgS3xGd+Vu9AF1fI7qBiQxMYhC7KnZ6ZwYMnMf7EoQe/h9kGmoJK
	gAGpCrvfPic5Iy9tbAgf1H62EebbQgs7B2uocjJ+ly3GnyZy/HWjzxvCg9det3TiJplHOEBL+7P
	MSurYHyGmgRTyPdCV8gCQ3DyrIUW6fzfnh7auQ+e1qtaHcrFamkcQe4o3hPzjMy6N5kaHRu5vtO
	C71s=
X-Received: by 2002:a05:620a:4442:b0:7c5:50dd:5079 with SMTP id af79cd13be357-7c5ed9dccedmr582328785a.1.1743083928609;
        Thu, 27 Mar 2025 06:58:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHT8vttqg2dbrcKW3Ur6j7+NLaTuSX/cQ8WiySVBMXjPbeM0ZUMslCQHR9/CmfciW4/NDZtSA==
X-Received: by 2002:a05:620a:4442:b0:7c5:50dd:5079 with SMTP id af79cd13be357-7c5ed9dccedmr582322685a.1.1743083928119;
        Thu, 27 Mar 2025 06:58:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d910e86sm24755411fa.102.2025.03.27.06.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 06:58:47 -0700 (PDT)
Date: Thu, 27 Mar 2025 15:58:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 09/18] clk: qcom: camcc-sm8450: Move PLL & clk
 configuration to really probe
Message-ID: <txyqymfjfgo2gcuzkmamoi4vppg6e4zp3vxozeeehw3uw7d2fc@27t3ymulyndl>
References: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
 <20250327-videocc-pll-multi-pd-voting-v3-9-895fafd62627@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327-videocc-pll-multi-pd-voting-v3-9-895fafd62627@quicinc.com>
X-Proofpoint-ORIG-GUID: WsenQ5UY9kLOHQobisu1i0xZEpcjmWhX
X-Proofpoint-GUID: WsenQ5UY9kLOHQobisu1i0xZEpcjmWhX
X-Authority-Analysis: v=2.4 cv=Q43S452a c=1 sm=1 tr=0 ts=67e55999 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=WExNFyCIVdiA-8HnxWkA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270096

On Thu, Mar 27, 2025 at 03:22:29PM +0530, Jagadeesh Kona wrote:
> Camera PLLs on SM8450/SM8475 require both MMCX and MXC rails to be
> kept ON to configure the PLLs properly. Hence move runtime power
> management, PLL configuration and enable critical clocks to
> qcom_cc_really_probe() which ensures all required power domains are in
> enabled state before configuring the PLLs or enabling the clocks.
> 
> This change also removes the modelling for cam_cc_gdsc_clk and keeps it
> always ON from probe since using CLK_IS_CRITICAL will prevent the clock
> controller associated power domains from collapsing due to clock framework
> invoking clk_pm_runtime_get() during prepare.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  drivers/clk/qcom/camcc-sm8450.c | 85 +++++++++++++++++++----------------------
>  1 file changed, 40 insertions(+), 45 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
