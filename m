Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836CB21FF33
	for <linux-clk@vger.kernel.org>; Thu, 24 Apr 2025 10:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745491541; cv=none; b=Gj3gJeIR9aAHK2cJl3PFh/7CRyZDvEKZ7HcCs6wp+BOfMNek+cLlt8NdakQRIzxuoessWqRl53e6y9Wag1153S7DBzm3XpoKPTp9vcdUwLTmXpZtLH923h42V1h2eFcTJdtfWhbsla0MTb4K062fFh1U6GsPaQ+k9cLiwKC1wQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745491541; c=relaxed/simple;
	bh=PGXPJri6Cw6siaeSinOaARRSx2I/HYewhIvfzmeUnSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BuF8AVL9wOvi2GrnfG6yXM/2MY9w6Fnfjcy7HqkWEWXB2DIZ/7wYrm9KUkj+n/e3AACq6mWL9yNeEGLOKhGpS69h59WE53yjmu4qhBQQuyNzlIxtZcwjDKUf4U58ceJ24U+Zr3O/C9dYk7emxXc63Ls3RhfHslEOQ33zd/qj40E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pmIPMZhB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pmIPMZhB"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OAWGsY010071
	for <linux-clk@vger.kernel.org>; Thu, 24 Apr 2025 10:45:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YTvMgSnUIIGLk/Fpg/tiBLoR
	7OymWdRd8yJc8ktCLRg=; b=pmIPMZhBX/VI7UiQN2DS72PS85z5qkr8rP6iNalN
	HPEncBXMwLR9N86aNrbsSrZr2OHdWNhWQk/JDFcATDtqSKn28URKTfVM9KhpcfhR
	rWJNwa5C3/WG2IC8UOHxomfZD8TlW3DZjbfaFp4R8exsTRJHHAhNh9Ol9KVL1wJR
	ZDzf2ib8ztXLTB1Fn7IJHYeomWd9vVPXGask/yhk14+Q9i1yH/Q1T8igdSAxVU7H
	GD/8+ktSIUQPM71Vs70tmx0jifeuaLLW06GUGuwOnTlm8DdvKGr8gtRAPkqleWfz
	OHMBI39GNYqtgjfuj37+wlcpj9hzbdKtVVzAT4GOkmNO7Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0dab3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Apr 2025 10:45:38 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e913e1cf4aso23997316d6.2
        for <linux-clk@vger.kernel.org>; Thu, 24 Apr 2025 03:45:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745491537; x=1746096337;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTvMgSnUIIGLk/Fpg/tiBLoR7OymWdRd8yJc8ktCLRg=;
        b=NvZiytPtFfdnztZ6F257iZ5oCZ4oRr0ZWDZlnNEMlHwLq0gdfzfMCjIaP2cqpiA8QG
         2rQhFZHRcQYtcykLwtOjr9ALqmtZIp/LKuTyKbXniErPGk/LzZ7iNcTzQYPwschIF1Rg
         pjdCEy/3AVaa9hmIJP0h2bvOyYdzWWdubHx5RGcKBz1rA/P6nyTn4ZK9dpNWFXCnWCvn
         CeYNnUWQj0D4SvbgLLZuYaVbtmiMBbzgGW+Xi8/KDmn7C/SPA0X5l3N1DCFkBOQV2u+x
         K+WuEUW4tMXuaApbw4F29hHeWitIGOzBb6m/bHhl8cQ6yXEwbe8PLryunetZFzCcoaqH
         SJ3g==
X-Forwarded-Encrypted: i=1; AJvYcCXAtvQuTk3HQpz3/MMG6Iszf0dX5CRuXko3FyWVC5+yXCd22GzVmV7xQ9TIBbou0aFbElVnc+jHujI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpeZYnDLn9+nGshB4kone50/ajuwmxo3LSX6KUkR+w7eHNb2NA
	GDaJECqYtfDWTJOwb96y0dSPF+mE28lQUgFjo01T3o2Rfu9aCgqfuXjhaUu4I/CI8esvui4jrNH
	a1SXlFseTUCJuYWu43JTjBSL+dc6XozX3rhmABPf/v+PRhtarCRgnKuxNHT4=
X-Gm-Gg: ASbGncsciF66u6xhm/4rZ2iMzLORbvMNyRHq3BsfDkttWoyI7vLGv4Ow8jxUw7UuvMq
	VvrXxxZiiAELEHF5/bLG5CWq9YseWqHXmT8YmoAcopA4f7uHzk1SS2cM3f/o+LvCY4LHjOlA8+e
	5/vJWDGqJRExOyBI8pngm/m8SUV66AiwOXTKwRHkMVDzSqE5cyWvW6DJtXylj5guVMCNtnfhRvH
	xyg0bC8ULHTtek2BNEEJiH19LEjLiO9XmkyI+ZeLasinqD1LtryEURhZXk61mb/LEtofZpD2b5F
	alakkc0AxCCB4T/nG/BYqfVxKT3woEIh2+BMtZd49+c7u72A4FYSoV/4TH7UvmdZgyuEniSqdHI
	=
X-Received: by 2002:a05:6214:4103:b0:6d8:99cf:d2e3 with SMTP id 6a1803df08f44-6f4bfbf09c4mr34154206d6.22.1745491537220;
        Thu, 24 Apr 2025 03:45:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEW9ALRiFj0PWw6i0JiIe2IjPxWzjJGDX1PP0wKX7qV2MJPeYhrJs/Xxya61v7OTQE/lz454g==
X-Received: by 2002:a05:6214:4103:b0:6d8:99cf:d2e3 with SMTP id 6a1803df08f44-6f4bfbf09c4mr34153766d6.22.1745491536843;
        Thu, 24 Apr 2025 03:45:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3bc48sm189292e87.88.2025.04.24.03.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:45:36 -0700 (PDT)
Date: Thu, 24 Apr 2025 13:45:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v6 2/5] dt-bindings: media: Add qcom,x1e80100-camss
Message-ID: <krofzevprczeuptn6yfj4n656qsw52s52c7cgiwotidxmi2xo6@d3q5bb5zbccc>
References: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org>
 <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-2-edcb2cfc3122@linaro.org>
 <3ec3fd62-bf21-47e7-873c-ce151589d743@linaro.org>
 <54eeb470-cd90-4bc2-b415-6dea1ce2321d@linaro.org>
 <0ab31397-580f-4e5a-b9ad-d9bf79d29106@linaro.org>
 <36feffed-4558-4e59-97db-2f0e916dbfc7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36feffed-4558-4e59-97db-2f0e916dbfc7@linaro.org>
X-Proofpoint-GUID: VffX3WAbmQlMQyC4E7t6z_BWukjALJtY
X-Proofpoint-ORIG-GUID: VffX3WAbmQlMQyC4E7t6z_BWukjALJtY
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680a1652 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=w3QZEHyxT3hpLgro1OoA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA3MSBTYWx0ZWRfX15T+sSZOWvHQ IowbeexOLYR7IaLyxZiNzbjgjRtqRxUkrN7OLL0HaX+Mu7uojNthtvgS7vp0W0ijTNzUK/atjnm byYvpSRU4KNAvwneAoTdhG3CAHifM2JkNtqe/fufwUSzjRZac5fz/oaPaHQ1YB0mhqS4eI9QQX3
 TW/rc2DvNu1DdQuv3c37tDPG+smI8jAFCZxHX19g51OFqt+THzL/HIBkbBlXEBNCP+ruIqJ6Mc+ bmCGgeailKcBX8DRlDc0BGVl+20b0mtAm7QPtCrB6J22ZnK/OgkHJgxFuHdWZIJ3xNE45eXc+m3 BfOReBp0UzR4hrtwnV9KS9tDnyOFmMTAQsdm4JDn33sbzzIqYedHF7473CqBd2K5H/CeD9gkPWM
 WsGAKk/4zF9O2kJ2WYAfwTVaeQxqsI48dyEtFy6YohKF4dTSuqwU3L5v53ak+0Yn7m2omjiw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240071

On Thu, Apr 24, 2025 at 11:17:13AM +0100, Bryan O'Donoghue wrote:
> On 24/04/2025 11:07, Krzysztof Kozlowski wrote:
> > On 24/04/2025 11:34, Bryan O'Donoghue wrote:
> > > On 24/04/2025 07:40, Krzysztof Kozlowski wrote:
> > > > > +  vdd-csiphy-0p8-supply:
> > > > Same comment as other series on the lists - this is wrong name. There
> > > > are no pins named like this and all existing bindings use different name.
> > > 
> > > The existing bindings are unfortunately not granular enough.
> > > 
> > > I'll post s series to capture pin-names per the SoC pinout shortly.
> > How are the pins/supplies actually called?
> > 
> > Best regards,
> > Krzysztof
> 
> I don't think strictly algning to pin-names is what we want.
> 
> Here are the input pins
> 
> VDD_A_CSI_0_1_1P2
> VDD_A_CSI_2_4_1P2
> VDD_A_CSI_0_1_0P9
> VDD_A_CSI_2_4_0P9
> 
> I think the right way to represent this
> 
> yaml:
> csiphy0-1p2-supply
> csiphy1-1p2-supply
> csiphy2-1p2-supply
> csiphy3-1p2-supply
> 
> dts:
> 
> vdd-csiphy0-0p9-supply = <&vreg_l2c_0p8>;
> vdd-csiphy1-0p9-supply = <&vreg_l2c_0p8>;
> 
> etc
> 
> vdda-csiphy0-1p2-supply = <&vreg_l1c_1p2>;
> 
> because that captures the fact we could have separate lines for each phy,
> names it generically and then leaves it up to the dts implementation to
> represent what actually happened on the PCB.
> 
> That would also work for qcm2290 and sm8650.
> 
> https://lore.kernel.org/linux-arm-msm/20250423221954.1926453-2-vladimir.zapolskiy@linaro.org/
> 
> So for sm8650 instead of
> 
> +  vdda-csi01-0p9-supply:
> +
> +  vdda-csi24-0p9-supply:
> +
> +  vdda-csi35-0p9-supply:
> +
> +  vdda-csi01-1p2-supply:
> +
> +  vdda-csi24-1p2-supply:
> +
> +  vdda-csi35-1p2-supply:
> 
> you would have
> 
> +  vdda-csiphy0-0p9-supply:
> +
> +  vdda-csiphy1-0p9-supply:
> 
> +  vdda-csiphy0-1p2-supply:
> +
> +  vdda-csiphy1-1p2-supply:
> 
> Which would then be consistent across SoCs for as long as 0p9 and 1p2 are
> the power-domains used by these PHYs.

This won't be consistent with other cases where we have a shared power
pin. For example, for PMICs we provide supply names which match pin
names rather than one-supply-per-LDO.

-- 
With best wishes
Dmitry
