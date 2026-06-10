Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721CC40B392
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098484; cv=none; b=iUFys8CyUw3RTtPH/7nl+AYPlSV49oEO81EfwHiZqJqO4v/GZqLCmoxrUupu3hLDTgmRAwfbAvE7C0aQZsclb7IPlcWTIgatF1FfDoN2Y+Ab5a89Wz+DQ937UQbW9SNba4hNDO3HLP/mdIB0vGr9dwY+BSR6SmuOIsyieEKlEp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098484; c=relaxed/simple;
	bh=ND4tQ/H1rfG2Q/XT6UBt+j4YQ1shI+hbBcVgUETCydg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uJHZT4LFRSorBbQ6iq0fNZlk/iquyJBQbdo5CPvmotDSuyqldu0+2XKwkVxo1ZUCu4sTBVaolexebHAYYfzTjYuomL71mRjjGqDntjGKE0Ge3RMbtjiQO3yEoGwrmcklKqPFeY534EGYaSCk+Z41HRSBJeqAB/IEd+h9dKlG41Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y/a2JvRz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PzpRFtN7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y/a2JvRz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PzpRFtN7"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBpKx1072900
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6/RLqbZmVOrKAcmQjh+udgmQ
	IrAjIBneaAs5twIBd9E=; b=Y/a2JvRzGDJYJI7R4QbLOwjE+/mwNgH+JqIj1II3
	j/nxWVo19m5Ufr9vV9xFhMmkzJotXWksQBW1TRp/UvHMwi2TwgUY+Xi2gYk1EcR4
	C7nm8tjJ4jLrOrsCeMagwPEcScgCEhHCASkcWSjBYIB4syD+A7+qfCBIhjSYh/Kx
	gnRcUYBy3aOTIwODluFFA0uCGIK2zTk7v6D95PuBO/xEPbDu1yAz6GeGWiPg+8wE
	xf0e9wnjSL94dInb9IeeGtaNQOWWuhHZdGFGUsLSinNOW3RflfovkdCoxMyIuJuF
	C+7p5Y12FSnotl5CnArVNRpUcxy9uF73765RjtJDRi2ubw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epxuvjckv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:34:37 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-96391e58e62so8416911241.0
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 06:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781098476; x=1781703276; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6/RLqbZmVOrKAcmQjh+udgmQIrAjIBneaAs5twIBd9E=;
        b=PzpRFtN7yrR+gEWI4693qUsE9ZT8iFGJNO7RIOg4yXTSm4+NvQAYdigDb2SFYqW4vK
         si+qGO4tYs/cd7Ba/BqsD4sLfIXtLi+ztTEQkkGtFX7sYotFqtrCiJ5syvMJVu6QuVoG
         1hpV7L0KuzoBGm7A5H6C1fuzejbeviueuu2mloFJHU+hQ143yrahsBoPNPnxT2lcUqcl
         xrBpcutaoLW8FeRr4WQAUobKy6fPlCQK4PxsQBDHaWMa87KxtR8qC4XsnNG8lDxzRiia
         NywLW6UtHyULmZ90UxIxbOtXvWHN1MrxtkeTDHD9VcpTBT6Md7XaM37QfkJxQbFdm1SQ
         JQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098476; x=1781703276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/RLqbZmVOrKAcmQjh+udgmQIrAjIBneaAs5twIBd9E=;
        b=AARolZV4jNLDzEzqn6JeXQ7nTUJQgjU08wyJKzeu8w5/EZx92KOeHOhdo41gfhQAIF
         wOeG7yLMDLWIc+YanVthDiUyHU70cuR+eaFk6MbaHJcWwN0qDJS0eFTcvVSJm5+nlpaY
         mx/tBzSMO2PkG9GwmsEK4Hz8pelT7dgcB8YM/3UV/j9Gbop6h+KmGeVT84vNsEFqrvA4
         WLYLF4arQkzqCFsP48OFRC3XxVxv5JLjIzmZRE+o+e/KpuAw79th2WWTTvRIn4+55uzV
         qGEpbaNWAKR2ui0a45Ca46xzzYoPNuQVYELZf1vPUmyN1eg5/06rfpWrodWjtLiWlOKp
         nIjg==
X-Forwarded-Encrypted: i=1; AFNElJ+dXhlvXSekuGsKq96c2UH4nDClUwzzOzpaGhWeVy/SmQCrwUEQ+a0urRieFGd8h96o33DmCWMEspk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKpgVT1tiUY9n++eSzp5XbLAyQUnL5wSNTsqqmYAo3tKpXdgpz
	TZ7MpoyeE2ZfEgDM6URD3WEImR1G97rNITL5EVB7MjeNyLszxqJ1+XEkQSC0EXCMH1ClgFpep9d
	aTmShMKr8EcpC0bS3dLUxd7gv5W/ixZJalcwSb6QwvCDIwHbc+iuCNS92pKzCJao=
X-Gm-Gg: Acq92OET6XWSc2YYlv8B6VFfi55pecWjQkPmZKskoIpDxpLjniq8Ue+XX6SvP1N/YQX
	Ra0nZVlIXJ9oOhGOXoSWOHKxRkIiCreYo1LczZ/TAAHzpxfnAEj17Rjip8X/3LU9OYzbWJTWmhX
	OHTFwmSdjaYu31tnwbsCbMwi/FfPuzKg7n7tc71Kziy51IfecC1WmueP/MExoJOxUd3yKvvHVch
	52XQggYeymyPwPvCpuEgWoLyu35B49PhJ+KAOyG4Wspk47S7MvaN95Xu/Qww/TeL1P0ET/uc5UC
	BPsipQtWKSBB0BbO5A9BHjQ4IYrT91fU549tf8C1kExuHbHiYxihjoCVtMTIMmxKR64E+kxq8vp
	MbMXU3A7Sv0QNSXfbzE5EaJXJms+9qHRa7o2yr+9zcUsPvToM3LQtTtEUWkelDlYVO9FMsxL5rL
	3ZDp3LVfYd3pnnTuKG0kE3g3XnXcInWpMas0FGqH/kRSvqnw==
X-Received: by 2002:a05:6102:6204:10b0:6cb:b3db:c31c with SMTP id ada2fe7eead31-7001b3c61d6mr6100193137.0.1781098476564;
        Wed, 10 Jun 2026 06:34:36 -0700 (PDT)
X-Received: by 2002:a05:6102:6204:10b0:6cb:b3db:c31c with SMTP id ada2fe7eead31-7001b3c61d6mr6100179137.0.1781098476165;
        Wed, 10 Jun 2026 06:34:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed2adsm5386728e87.1.2026.06.10.06.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:34:34 -0700 (PDT)
Date: Wed, 10 Jun 2026 16:34:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: sm8250: sort out Iris power
 domains
Message-ID: <cacfl4livqlkuk2c223hgapl45ojd6hsqg5sqqd7g5g2q57kk6@codcnqhfz3e6>
References: <20260604-iris-venus-fix-sm8250-v7-0-7bd2f0e5bae8@oss.qualcomm.com>
 <20260604-iris-venus-fix-sm8250-v7-1-7bd2f0e5bae8@oss.qualcomm.com>
 <5eaea87f-5fed-4869-93e5-55c9da5ced84@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5eaea87f-5fed-4869-93e5-55c9da5ced84@oss.qualcomm.com>
X-Proofpoint-GUID: y7RaUMDry-2rUDX3gxeFghv8vhOUkL-K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMCBTYWx0ZWRfX9MmAdgregjxP
 Jnx1+yX23kbe8T2N1k5GjT3OINaB6Wbw5MWKd2i/L12aC7l/qLPc+FeQjw/gMwxqiL5O5TZmrPc
 84rCtN/tdWNkohXOZ1P+oD1VcJespVK2maLBgSfMPcVwlT371GNzQkco/Qkqf3aYVf+NUFjCtAT
 oEzs3MIWwhS6iZH5TvGys3M4MfAAL9NO+fAclU9P8HIFR8Rs339EBDGZqck7oRtmdTwnoyqFsv5
 2I82ZdZP89UMCMPVRZTWAYkd+VXfQ4H/L/8c5AusY35Xc77pzsz4BzsMUS2xm9FUQUhcySFxO8i
 r5pyTHIQyDcRnjT3bXLw7s5+7LqTZe0umntgalMsD7ADW8m3DJ3Qvt7uQbcyzQ/LOdA3HS3bwUl
 iFKTP7GrhxnXAIZaj7UUAJv5viYjqtj0hWLlSrCknPcTEQY0YJo+vI2tvpRW9qUZi6T84PLECIo
 RklfBYwYttgDHLSYppQ==
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a2967ed cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=t_nprInajcUdtdUToWcA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: y7RaUMDry-2rUDX3gxeFghv8vhOUkL-K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100130

On Wed, Jun 10, 2026 at 02:24:24PM +0200, Konrad Dybcio wrote:
> On 6/4/26 6:22 PM, Dmitry Baryshkov wrote:
> > On SM8250 Iris core requires two power rails to function, MX (for PLLs)
> > and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
> > qcom: sm8250: Add venus DT node") added only MX power rail, but omitted
> > MMCX voltage levels.
> > 
> > Add MMCX domain to the Iris device node.
> > 
> > Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
> > Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> >  				opp-720000000 {
> >  					opp-hz = /bits/ 64 <720000000>;
> > -					required-opps = <&rpmhpd_opp_low_svs>;
> > +					required-opps = <&rpmhpd_opp_svs>,
> > +							<&rpmhpd_opp_low_svs>;
> 
> So the computer tells me low_svs would be enough for PLL0 to generate 720MHz
> 
> Is there some transient dependency that bumps this to svs?
> 
> Your changelog mentions you altered this in v6, but I don't see any related
> discussion

There are two sources of information. The "clocks plan" and the "pll
info". For some reason, the clock plan doesn't reflect actual PLL
requirements. See the info on the corresponding PLL type.

-- 
With best wishes
Dmitry
