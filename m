Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF38345CC3
	for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 20:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772223010; cv=none; b=hr+P4bVdnX2SH/OE9ypk9qdKotS5AYd8D+RXd720gJ0VnbK4Uo+aij8+EHD3uE/fL/ouBQ21GyM9FMB9PQprwjGfHkeLOomkkifOKo/TSUjikARk+MbkW1Z9tq9EJTMT6GxIVgAo6Bptq/njAVzSwuQBs5xJkPe+HByL1m1a9aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772223010; c=relaxed/simple;
	bh=o5aHsvJaTFuPji0E5MKJdnk2ycrDX7jf32FdPIrYtQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uvVssgFN7YAQzYwH0nav/0akuunwntvV66waRV7c9FsxQXuwNVTEKpCQCnzkYsnAagXXr+nWTU33K16LqV+vXw6YjBRxCwjRzU3ewVIHQTKkM11MlLLYdW/v3pPUEJ80u050fnf2Q4dShXGgHR7GpF3loKkdT8U46dfBb4uKjJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F3WYDC8Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MQogIwf6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F3WYDC8Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MQogIwf6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RH0cZi065646
	for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 20:10:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aPFcKoIqKpFHQXXPANaemdqA
	aAJwlADq8XtlaqdUVBs=; b=F3WYDC8QuuZimsf+gZPS2WE5l0iNTrYJQ9ZxQUJ+
	thD6wxh9CqKNuYSYs9pVMMgnZWtRKvuwhyxCpBMqDPICCRuHSN1e+w3CUQunFnFy
	L30nP+NkPdV2jjpM65bzd99e7ucR00d4skbw5HugholEtIiVtVoCThZIxOmFeBIH
	jzo00rIJdKBHH4zLVbHSOSLjRSZrvtLpbiBlbJMwQ4n+gFul1OGmNTyl00FD7ujM
	n9ol4S2jo9e5XeNeLBomVt7dlidhhrmCN0FE37jKVFq47bpXh6n72faCj6iIwXzm
	3ikNG1RJvCeBMLtmD5i1SxIfrwc3lC6MwuZSXmp2loVF0g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cka2xhnwc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 20:10:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb42f56c4aso2127600485a.3
        for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 12:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772223007; x=1772827807; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aPFcKoIqKpFHQXXPANaemdqAaAJwlADq8XtlaqdUVBs=;
        b=MQogIwf6lSvYJ8Do6xYib8QicVQD0z22GCziVqHc48n+9Nk9qZhwee5IuLl38asRq1
         l2Vk2KfmjS+Ko3Zd+rqd4c8d4jLXrQJFxJ6+rvyuHYzNyAag1p4XV1mxWIuy1L+eweq7
         +WP8wH34PODudoZc2SGJCCCC8+3mEVhdBBABN8awds+ogifnjmlpEzSuFDpM+b+bHvB6
         9lMxDp4V92eL1LBtGjBy4ZQnivuqLOY5VZ290ztmjvo/pbxWrAkYVowA3kYhwUCBeAWm
         U3FOnEpj0bOKzOjiumYuTmjuTQcZliSDXrD3X3MJj8EkYzNjF3EFhAAlBXUoZyPPHIqM
         nqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772223007; x=1772827807;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aPFcKoIqKpFHQXXPANaemdqAaAJwlADq8XtlaqdUVBs=;
        b=eHEUcgxp1O9Cbr1avjBFgBBzRqCY3aUcvQ3tM0hb7PzKABEXZUVNlgadr1U7S9llk2
         YF7bjkVXPmRTaOg6f95+usKGRuQ2GMZXHSZn6nqgk1KeTY4qe8NqTJThH4WvIO0X0ulE
         1qAFsF5QRW5FAgbkCapmw/e0D64pL73J47+FT3wQmwHj/sRdRRyaBcxOKdnjGgwDu5Kc
         Jhihc4g+hcpug3jKJVjHLETmhq6MBTFKW+P5LEkSD2jqKNZ0Q/+IXNwx7rnn5BRqpRV+
         h4ZttBwrZp4xRno3Gl87Yysd8RG0DsqZpY7bIC2fomwM+vnqDBs3xyXUPwMmR76xGjEL
         07nA==
X-Forwarded-Encrypted: i=1; AJvYcCVOKOYonnvfY+XBlxSRslh4pnEObi7Ybb0eM7u/eMLmqDZnkUTF2NuGPVRwddwAYjRdyo/LZWuhsNo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcHxj16zrKbeYM0iBgP8zWYlefGAhquPI3OXR2knhoGz8OMIhN
	zPuchFYqr7Qn44E9+C4SwA4wqMopcuCO5p9Jm5nbHLvZLbVNYgoFFiBpNmRVTPzanvdxKas/Qor
	+oVZebq+3NbIN9OkShou7dmpmbI6JqU3CItub4B2W4SgMpSrajnlsm0b/lRhIPkM=
X-Gm-Gg: ATEYQzx7F8+kXTS83S8R9zEiGr2T2JiW4EjtrGBrAkoaSBmvusJIyzWF74dnExLRS5o
	13djtNufuLNujw7gc1BlwoOlmX0PrTH5FRPi1GN1jNZEEV2X5Cfkp3eZqDr6N1aa84WNL+cAWIY
	mKeEtyyTBfa1vGb6x+A2hKsICGQaTGVY++0rotr6hNLo+Dci99YkIH2Av2z9QPJwbH7cWAhpSYt
	0qKyeN7BmQtXpxaBVecpnrOmtmnsaJUI7FA/FcocAi/dTT//x0qccP3DMfofK+OYTCFGd/OZrLP
	2DBzO4/J1Yp3Wll6hGdzvJdEU5fhBC6fXkJ5B602pznYiShSjE3xCh1j6VIQ0RDj3L1kg2Iz5gf
	Uhc+r+SYJKFTMiDifE6DWrdJ7lECq8dkOwlXTkUpOSNnP4va7p1eXIOPsoZLvzVEvCtlQCJ4w7K
	GcP98Eds+AgF2U6uTXY8YzNVGbYVpxbIjDLFE=
X-Received: by 2002:a05:620a:459f:b0:8c6:e2a5:9715 with SMTP id af79cd13be357-8cbc8f1b6edmr587672485a.55.1772223007189;
        Fri, 27 Feb 2026 12:10:07 -0800 (PST)
X-Received: by 2002:a05:620a:459f:b0:8c6:e2a5:9715 with SMTP id af79cd13be357-8cbc8f1b6edmr587665685a.55.1772223006750;
        Fri, 27 Feb 2026 12:10:06 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115c33c37sm147621e87.82.2026.02.27.12.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 12:10:05 -0800 (PST)
Date: Fri, 27 Feb 2026 22:10:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v8 02/18] dt-bindings: media: qcom,x1e80100-camss:
 Convert from inline PHY definitions to PHY handles
Message-ID: <woncxvvebqt2iyoozkjnpjf3k5w4ibwzf2yhk3zbtck4fz2lgo@ai6rrd5iqpvp>
References: <CuJMpimPBtwHGAd5-YHUArL6FkU2HQeY4SjbxeMwf0ToQ7LKO3zWSTn86L-HKxC1KfarWc4rRbZqnCMQsv0pcw==@protonmail.internalid>
 <20260226-fluffy-complex-malamute-7ecec6@quoll>
 <35b1ba2a-e156-4542-b33a-d4e53f6a62cb@kernel.org>
 <tVxcOw7tqTRGXAoW06WPM_voMVBY3SO7Mm_MTMWp6OuotVmgmyi0DOgVHdDavO2V6o3iRH7ax0NosgHuzGkHgw==@protonmail.internalid>
 <4ebe2f26-29fa-4104-bc90-3f5aa7009ec3@kernel.org>
 <c2d9742c-3d82-4340-a11b-16370bcad5ea@kernel.org>
 <72f0ed74-ac86-4571-8a72-d41282349718@kernel.org>
 <d1ddaa7f-cfba-4e71-8a9f-70014c57de74@linaro.org>
 <934812b1-a853-471f-beb7-3988eff0856d@kernel.org>
 <71fcb165-7fda-4714-b56b-40d6537b8ccd@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71fcb165-7fda-4714-b56b-40d6537b8ccd@linaro.org>
X-Authority-Analysis: v=2.4 cv=BOC+bVQG c=1 sm=1 tr=0 ts=69a1fa1f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=IO7rWolNlSVxHX4F2dwA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: vyhWGpbP5AVkH8Y-IElJyX2dpVyLUczR
X-Proofpoint-ORIG-GUID: vyhWGpbP5AVkH8Y-IElJyX2dpVyLUczR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE3NyBTYWx0ZWRfXyIQDVS4S8pTN
 YLoveQrRJdDbUts0SkgkZEa+Tq4mm5S5FShhWBUM4VTh9hoGbuSDxHfDY+UGi4GBrJtJ5YFnJLk
 hat4gpW1YHaURnvP4k/Xeln23d85QQojPgGhG59mabRv678K0Ki0fU2MiazdRrSJtU1hOGE9JM+
 QWFFgalpqb616eN4D69C45GAw2yU/BNtoFSq2azgnMhZ0e+MReLmUlxUn5lN2EYapVfy3+oXnC1
 jJMT1SRndaCPd8Zoet53103ty2acx1bqAP3DZiX/Y7jPV/EtUwH451CMr6bnCPH487Z20MpGQwr
 jWAhQ+2Vkobq3jb/+8096QuvJ2TnvFKmRy/77pMhzUh+PsYuY+H9/nf+5Q77gXee/+93GFm6+6m
 4ka4YCbRzcwswaDtnFv6npb3hICVrseH8tyLA4UIB4cX0KB9A7IRCCWmHoqjsVl85aWU3law0e5
 sepmy3QaZUuxLTb09Lw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270177

On Fri, Feb 27, 2026 at 08:48:45AM +0000, Bryan O'Donoghue wrote:
> On 27/02/2026 07:24, Krzysztof Kozlowski wrote:
> > > Well, is there a way to support both then ?
> > I would just not touch x1e80100, but if you want then probably binding
> > should stay backwards compatible, where you keep all properties intact
> > and only add csiphy nodes.
> > 
> 
> I really want to stop adding new stuff with the legacy way that has broken
> power-rails, even if that means x1e has a bit Frankenstein binding.

X1 is fine. Please thing of a migration path for the older platforms
too.

> 
> > > Right now I have csiphy and their registers listed in the camss block.
> > > 
> > > I could add phys = <> as optional in the schema. Is there any reason to
> > > stop adding adjacent csiphy nodes ?
> > I think no.
> 
> Great so, that's what I'll do.
> 
> ---
> bod

-- 
With best wishes
Dmitry
