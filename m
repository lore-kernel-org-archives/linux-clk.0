Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40F4165F1A
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 00:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790294629; cv=none; b=IP5CRlZUOmA3lpR80u1Sd2SgdLahZDHFj4F8yimaD3p25poFDQ1G050Vp8d/v1V5/KjoiyKyn3IH4t53iySvwA50TjO+nIhLIEd8GMTFTMzcroz+PbtGzK4p8kSUanG7vDimu0H3PBCJ9wHznNeVAa/2dR2qRFSJL3X+lOikjJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790294629; c=relaxed/simple;
	bh=smEO5ajkUjd/XE0Q0NvHBZW2RfBUnec6o1gpJNIoge0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dX3SrLU95lA1Chw1QEGzlJmmvHdcXPSkF17ZIXJ86FLUMBXkxu0V3LdvVfrbWcqNsoPaitLaP6P6GYZiv1EhCEWt2rkN3sHs6WNY6aF78XTJ7yhcpX11G0pdjzI/OFOrJ/ZMkFyiQ5TbUSaubml7LBmjM+NHo+71XIxHrNO9eGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ntgaicXv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LDYXlgS5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ntgaicXv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LDYXlgS5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OMPRHM2970983
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 00:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H58DggwAYgasWPTqDpc+NXUeOTsA5g+ce6658T2WcyQ=; b=ntgaicXvjPhYL4n6
	qMgOWfjyLEiYTmV3eiqMJUfyDMu1v/ap5+JMIDrvPcsqAMvACUmEk1fPQV7KLR0z
	6liUr6WlTz+lrBgOGoRq7OmWO4BCuaqRysoTUJg2dP59gPytJcs3kx2/jh974v1F
	kShGODI3Xy0JVUAem1WpNVVfJNqhC/R1DcDqOdJIaHJaeNaxQkhAeOqyRCHFSdb3
	CXW/uraeyinRTqFdLFt6qPoRxzfKfJA7IKfMFI041x0J+s0/kfN1oZ6M70CU/Ls1
	HOrYAQ46y7ZI+YjZkCRl2k7EjmwD1uVljR0X1uBIhBHoc2HABrnwogN9pkeedX88
	qqXrEw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw68e1ymj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 00:03:45 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-32b8c2b30c4so509918eec.1
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 17:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790294625; x=1790899425; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H58DggwAYgasWPTqDpc+NXUeOTsA5g+ce6658T2WcyQ=;
        b=LDYXlgS5aSouB3r89rdT3msz/WrB8+EYY8bWF3Rs+g0x5nGlBYX/gMeQyk/3qQtGrp
         Mangv/oHTWqcoFd5nu1SSuuaMLWHQPN+lbPSWvoHJbRO/l0YvRxTl68Jl1YmptGYbFMq
         P94OhMtT7NZLWzHkcwuZQTZK9y16EplTnxoGXJc3RI/g2AtRNAr0rXazvpWV7q1+rbnE
         5Tgy7tcp4ePUqrtMdFjpf80QSQhHnW9hRexGt5wdxDlB99U43DQyyrclxAUnDTjwwiKo
         neU+lXDd76/MhRrwIvBH5f12k3PLcin3Da1f8hai7NAIQfbOYp/J9FO8LIBVrZwHeTuG
         UFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790294625; x=1790899425;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H58DggwAYgasWPTqDpc+NXUeOTsA5g+ce6658T2WcyQ=;
        b=u9BdwTC+JvjcmY735rvnAlLaW1fUkWZvLcYUoSRWYYYGUpbKXShymRJ8AOMnGDfD/j
         jI9psqGsxa3n4rl2Gn7nXirMYQ5i/qfU7jiwjqADubljLUnV0+uiSC0T32T7Fr2BKaFZ
         9h5DipdhIPncxkZj0I7q0O5uQuzJCcMbQcgJuVMELk6LMVVMXVJybRSCdFdUJppNsz7p
         1OrVDawL4rSRPEarLCg6vV2GyY611DxieWRsOAbdMkSL1x6ODM+HMug3XuKABnF/qRcW
         GpSCIx9HmOmlQEahBtHQkyQfIFi6I9KWQDKroXQCfKrMPOoECiGQP3YO5h0ZMCMuNF1M
         UQZQ==
X-Gm-Message-State: AFuF++nvgutb0yrULEU6aGCq7Dftmy2KUACGxZfYmfJKaaE5zS+YLEM4
	Un7czVN7YJuI/OGqKTVC9a+aV/0LvmS3Mi1uIqqGmj6yrYz8m1oUFOn8M8iqJwcSHpdXmGpcHsx
	nDLYu1ESVPQqMR5gyRovZkk4T97MkVxDNNF/pQm0DXvGg6TMGj9wA6OsFyfUnJYZiywgO4EOUQA
	==
X-Gm-Gg: AYBFou20SdphOuPZvQMN592zKm1Ue0JFyTJn3dYLwbP+tW6jmtwJWcnpvG58m9cvKTh
	3lOL0tzdC1lsO8y7cAgPL+SA6a3bl++UiK+lW6nsE2uahlcm2TWEXdoU46zAuuPAu8wn2LAx3ls
	7mkHQnPmk9gzWipD86XgKb5eI/KnUifVigUQrsslgXNi4dMce7l4wVPfLD5nh5cCrg+u9IyVYh7
	MLmYtJkc/lWSvxYunVMMeroD0jLEd/0UQc9P9GmLa/WJgeO7RsgwobwvTRPMU38wsVz7iiT7wVT
	rEAjAT7fL62gK9vE4cGoy3Cf007O7cdJb/Lnb27hugg7SQRrtWZUoTohwijI6ID0Q+n4lpgUH2B
	7hL7TVo+Sw0orF8AIrpBbgF3DOh5B7Ay7IVda7fhhFQ==
X-Received: by 2002:a05:7300:1c94:b0:33b:fae9:fc37 with SMTP id 5a478bee46e88-340043a2f7fmr3392701eec.5.1790294624531;
        Thu, 24 Sep 2026 17:03:44 -0700 (PDT)
X-Received: by 2002:a05:7300:1c94:b0:33b:fae9:fc37 with SMTP id 5a478bee46e88-340043a2f7fmr3392683eec.5.1790294623875;
        Thu, 24 Sep 2026 17:03:43 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3414407c548sm1779043eec.8.2026.09.24.17.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 17:03:43 -0700 (PDT)
Date: Fri, 25 Sep 2026 08:03:39 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-clk@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom,sm8450-videocc: Fix clock
 inputs for Glymur
Message-ID: <arW6W_2Azq0GLF9P@QCOM-aGQu4IUr3Y>
References: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
 <20260924161152.1162301-2-shengchao.guo@oss.qualcomm.com>
 <20260924162500.C92FC1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260924162500.C92FC1F000FF@smtp.kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA5NyBTYWx0ZWRfX9/XzFqpTRRb2
 lDH9Kdxib7IvGpzcNYVGUB+5A2paaWYVlom77ZQxzs0FPZF/hTsloSmHb89Uc5pSNNbDn8tMLDX
 QWHTV/I7pWeQQCC8rE+Ae782j6TZxRQ1uH6x6EoVdji64VF0k+FGUfGwS7M33ITfSQ1fVujfFCa
 +RSoiwKIlEJhzXhYg2y6CfdlTFrm2gZK9x0dqNT7KB9AtXWsRV2IB3AeoL30FAn0hBPZ1pyR/4I
 vgpRAIb54BPvPx8qB1dxgCg57/YdYlbNBD4ALYHYlLFbnIyUfU726MYlZPAAqiWook77v5pjON9
 dDidZ14ghPN6iQXnc/1LXyhO4vkpXT8YI7WehBhKY15pczbqSNPl6pnQCjFhhk4kBJPU6xKxnMo
 5LKN6HXl2RJfO8Fu/my4AAn8+RySTrqmbHMqTRTDmuCpgJrTAQHYz9L4YfnrhFJEz+OIF1WXBIe
 67yROpsn/XuSqdDUeSA==
X-Proofpoint-GUID: -qnbF__JB6JzdpNBstjwpjCGVx91APkt
X-Proofpoint-ORIG-GUID: -qnbF__JB6JzdpNBstjwpjCGVx91APkt
X-Authority-Analysis: v=2.4 cv=XawcX455 c=1 sm=1 tr=0 ts=6ab5ba61 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=8nJEP1OIZ-IA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=zgFx8tfR_8MVfJF-GFEA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA5NyBTYWx0ZWRfX7ZOb7YhIDygz
 YRPA4ZHa6TEyu+gJmpjx4/ZUplwMaDxEAsOWZ1ttRXOK6ilVSvm/lvGFl7a/XaU9M6Pn9qqFKR7
 nWxgGP/S+fXv3AVufzocoyMFvpjo0nk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240097

On Thu, Sep 24, 2026 at 04:25:00PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] dt-bindings: hallucinated qcom,nord-videocc omitted from top-level enum
> --
> 
> commit 0ca2f034154349c48cdd7a693b1d8282d6886964
> Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> dt-bindings: clock: qcom,sm8450-videocc: Fix clock inputs for Glymur
> 
> The commit updates the clock inputs for the Glymur, Nord, and SM8750
> variants in the bindings from exactly two items to up to three items. This
> change allows device trees to supply the sleep clock input required by
> these drivers, resolving an issue where it would register as an orphan
> clock.
> 
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> > index 910c6d5672b86..dc01c37dcd0e3 100644
> > --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> > +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> 
> [ ... ]
> 
> > @@ -77,6 +76,27 @@ allOf:
> >      then:
> >        required:
> >          - required-opps
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - qcom,glymur-videocc
> > +              - qcom,nord-videocc
> 
> [Severity: Medium]
> Is qcom,nord-videocc missing from the top-level properties/compatible enum
> list? When a compatible string is introduced in the allOf/if conditional
> logic but omitted from the top-level enum list (under unevaluatedProperties:
> false), any device tree node using it will unconditionally fail validation.
> 
> Additionally, the commit message mentions that videocc-glymur.c handles
> qcom,nord-videocc, but this identifier does not appear to exist anywhere in
> the kernel tree. Could this compatible string be an LLM hallucination?

The series is based on linux-next, wehre qcom,nord-videocc has landed.

Shawn

> 
> > +              - qcom,sm8750-videocc
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: Board XO source
> > +            - description: Board always-on XO source
> > +            - description: Sleep clock source
> > +    else:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: Board XO source
> > +            - description: Video AHB clock from GCC
> >  
> >  unevaluatedProperties: false
> >
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com?part=1
