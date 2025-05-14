Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5B717C98
	for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 21:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747257339; cv=none; b=YJwzIwameiQUL+UXgGfeyQtQ95QtQgvs5VXAAVxhkYawgSiIPMNSYBKTSwb1mxm6nfinko4lYIAmzXVs77u+Qs41mwzscZyUy03c9DsSCSvamzzgYkK7FT3LfZ0+Lh3rzlqXMjbDNO8cagUOZMsSYQBz3fcLaz1E5uR7XbrwJy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747257339; c=relaxed/simple;
	bh=qvjR2XXCGE2xNkWvFLZrOlDwVcZxNCldkgRm3IdHpgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GEq2uLdcJ+dWR07/8ygFB5QjxnM+OiRpqWr78nLAeFq55EzmmCQoYCi9TUKzCvYA9AmaUFfcMn1Yn6ucVACgNFh77FK29oYx5wLteMquNirta/vOM3TuYoQzDel4MkZ8iF95h7EwDrXWxnwkhBwNoYRPLGsTYcBj1XTS+wO2PXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K9fObCbc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K9fObCbc"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EKWunx020194
	for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 21:15:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CSgSL5tsy6KVjdqsenP3jEhW
	60sG6ohO+Dj54gdxcXA=; b=K9fObCbc9SloZ7AxXu1IgLDoCgJ2LSlgmEZ4PNhK
	+16XHDBk3w/Q8RZu9PCyDfqnYfR2enNvfsmLZzjhzW/W6f7HhMlJvz174jxDpB/f
	pWlFI5HeAwXQrRLjg7mDTn6OPbaMHQXad4agK1kAYAZTmYhGobiYSBEKXlqLH4On
	ANRQAHux1yfL5fL0VsMr1CUVc1Y05gtyITlefh9ITwFput7Grj5F/Xy6IG/8k3zv
	3QzfUGDOr8NE9zdmJY56cgpbYq9/nrRqPWHlY0ygEvOl9XUPQqWRP+NUu+uJNlSm
	iENpWPD4cXg9wZnuIASVIQyXju0TuU9Pb8o/DhrBAfX+yA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnm3ef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 21:15:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c790dc38b4so61009185a.0
        for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 14:15:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747257336; x=1747862136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSgSL5tsy6KVjdqsenP3jEhW60sG6ohO+Dj54gdxcXA=;
        b=QaRf4ggKCBQm7iPLwDY3KY51QGvVqBWYXpPfhVNe/lgCFqpS8KjBEUmKsXLsw3OItM
         5SuIjm5DoPdIJ3cFAdjvPs4WbCGVTLo0B1YaiyhBjxO6nqIOzu539t//d5HZxGye1sel
         tSU6jd2uGpVYRfZf0IvyY2wYEmKzTHlumE9pLrbAVFJ7iQYkE9WJDTBAiTTqXBAjTwTs
         x9vKRZ9RRgvXi7CIFKKBGvQqhrUHxbSjvH+ipjcVoLr5KFD4wvN2DmiECAeO2WzgoIq+
         QLz0OSd4Dn5xxC5XN9sr7rmn98Lls1exA2XGXN0DDdzsRGSS3QShCd5DDSaCnRwQPEpr
         bCuA==
X-Forwarded-Encrypted: i=1; AJvYcCWJ/aLAyQl5LDZN3yZ9fUsHrbEMPB2HY64yCadEXmsCtpmJ6A0RUyGXtQ6f8RGY4dSQrb6ppo6u0SU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY4bMSdcgzj9EN7jbLj+IqWpYSZdLdKVjVJiWF7qTEVWUu6HgC
	mhE60HPII+xrPvq73afFpQa6QC6YJlYVWM/uA6qoKlEoPUPb/tDPgChpLBdyg1JES8g9fYpN1jI
	apPp9SyDvGWwjpvyy+thV5H/cDcKZwMQcpyv6+L7x/5cektLUsFytmoTnnAOuiOs=
X-Gm-Gg: ASbGncscnjUZWaGA1pBl9iYM05QtHRE93FznA0yRTBYdh3qI4+kPIlRCK1XoZGmnXA0
	T92+SZf/Ab55L7aooCwUaQ3l2eL6O9ZJcnLn4ztEXnZP1RTUDwysyNGFHcFLQq6JGPK8ocTCx2K
	2OhR6y5J8cxfms8ZtwdUSXncXlL/A9+5+StlYBniPgdZIdG1gqG4uB+TdS3ATPawXR/a7CT5wC6
	fKM3ougmuCdinVxdzDktJ5OVY8JHG5rE9RWzIxXNJn2PIVHA9Rkwct9d7L2am/67Iu5FTekGpG8
	j2Gp9VW5VGWdKeSo4EFXVmEa2+LUXjCzzwIlcHYI9UWySU3YtCckOn9tFg2FATbSrNHYCI/iFqo
	=
X-Received: by 2002:a05:620a:1d0d:b0:7c9:230f:904a with SMTP id af79cd13be357-7cd39de2503mr208509185a.14.1747257335557;
        Wed, 14 May 2025 14:15:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEF3yZJxhZiWN3ImsNfTVfdXkr/LJlPTcnXcAxIaHup0XQAdoj0fTfNGu52Ukiv4fTDl8MQUg==
X-Received: by 2002:a05:620a:1d0d:b0:7c9:230f:904a with SMTP id af79cd13be357-7cd39de2503mr208505085a.14.1747257335213;
        Wed, 14 May 2025 14:15:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64cd303sm2398927e87.245.2025.05.14.14.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 14:15:32 -0700 (PDT)
Date: Thu, 15 May 2025 00:15:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 02/18] dt-bindings: clock: qcom: Update sc8280xp camcc
 bindings
Message-ID: <oogbxu2uphyhknr4fjbc4ato6q7r2iermvxbqezyqd2xwamqtr@cddhw4kh6zzx>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-2-571c63297d01@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-2-571c63297d01@quicinc.com>
X-Proofpoint-ORIG-GUID: CrWoDeJ3PUkKP3zykVWYcOp1EYBNPJvB
X-Authority-Analysis: v=2.4 cv=aIbwqa9m c=1 sm=1 tr=0 ts=682507f8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=SIHCAja6ksQgKCh-pUUA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: CrWoDeJ3PUkKP3zykVWYcOp1EYBNPJvB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE5NiBTYWx0ZWRfXxloOX8UgRfFX
 CbmFYc5/Ildc+z1iCUldnzmi3W32EC381eHDEVNxKW2XYvgu2cMoxGUhM9IYCjdyQkmvfUVhPwD
 YW5ftk+9VVyv9OOFoFHXoWOI8i6xdt0lNnYmK4nlE/6ffW47N6vVBVkRwY3V2S5uj8r/yGwmlvJ
 hwGEhYxFv/eTvh5Igrp+7TKoskOxjjWI30brGDSvHp4xjvj5T/1a8FAgmr6AN1sRg0R3NZUPbuf
 X01+A/lmjUeToA6mqtc+Fxhm2Gf8ZN7deYgej1mAKcniLzlQ5mvdVmghbLoCMDBudqUAgOtwO3u
 RgAfCDxaoTeVPjxPpZgXiuKYBmGWrRQ/71a+fkuAGjHrxTOQIhbst3QMtleUmUzhQruIOEAnsZ/
 A+KVrSq9H3xeKsobK9Au3LvVpKWIxtUJlCd1b4KkvQfo4LdOsx9m3xWCyMcriXy9pdx9efKN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140196

On Thu, May 15, 2025 at 12:38:47AM +0530, Jagadeesh Kona wrote:
> SC8280XP camcc only requires the MMCX power domain, unlike
> SM8450 camcc which will now support both MMCX and MXC power
> domains. Hence move SC8280XP camcc bindings from SM8450 to
> SA8775P camcc.

It requires MX for PLLs. I know that we were not modelling that
relationship beforehand, but maybe we should start doing that?

> SA8775P camcc doesn't support required-opps property currently
> but SC8280XP camcc need that property,  so add required-opps
> based on SC8280XP camcc conditional check in SA8775P camcc
> bindings.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  .../devicetree/bindings/clock/qcom,sa8775p-camcc.yaml     | 15 +++++++++++++++
>  .../devicetree/bindings/clock/qcom,sm8450-camcc.yaml      |  2 --
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 

-- 
With best wishes
Dmitry
