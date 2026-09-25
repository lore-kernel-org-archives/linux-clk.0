Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9944A3DDDD9
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 16:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352086; cv=none; b=mz3Ydb85XHEndmCRzcWvyiUPSr61cfou5GCMx2HXn5B6RKnfrRXjdzYVfe86b7pVJc7S56bBP0bUUg5rmJmTq4D/WFZXxtTgw4q4kET6V+VlQHV0V2OCor4Y/YpQeV63u6pmM64lSBrJ6o3Wi6iBytXuFnw4iIMZbalcOooRiUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352086; c=relaxed/simple;
	bh=gvm3W7J3Akld9cS3FZ/cKcHsfdTHgkXOTxcsTRXbuzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QzgaFMZe4McmPsNWWuhS96kbrfwk9klfDDqidIC1JDFAlMFj/iL6jAafV7e9AwFKRiRDx7Z8Pzqi7btNKOp/6C4XQ4zedDTU7ftFDPD2gFgKuRsNCwARCwhE+TUCTQTzko/CD0XIVj64VuyMGq4ypDj+rxNkkQBqV9eGUYFforo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DEeA+MB+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AaQh3Sp1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DEeA+MB+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AaQh3Sp1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PG0iTi792433
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 16:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uHHjqtOTlg6U7m51a3YRL1jQ
	gEeRztIvr0DL8aArJq0=; b=DEeA+MB+psZnAKM23CGE71PCa2YfkGB5gQukVaBZ
	miBSM3WtFCkJ9FS+MwNvxmwNWT53FFw37Htc/R0PcpvrRHctcl8VndAAO5r60Qss
	kILsphe1XsEZzA+2wBZDFUs3KviDHqSfY5iURnu7jPkXhWDJCRfanufOyaW50GQO
	UWNweEJ2UwVjrCrGaJIHoIz6NmE0RLl2G9feBiXOevWp1Soi3xd2urkIIagTmuoO
	iWoM26As7Np87VcVOsI8osq/Tq5iAyVTxVPxsz3WBBk8Pt7uTLfaD3aH6ROziQUD
	CHmpybYGV5FY48Z4vKKoKmgpVe9APFZcKbW9Z9j+uuHbgg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw94kbxu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 16:01:23 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-98531c02dfaso1409558241.0
        for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 09:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790352083; x=1790956883; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uHHjqtOTlg6U7m51a3YRL1jQgEeRztIvr0DL8aArJq0=;
        b=AaQh3Sp1tYqmolfOwqFkn46lCTmOhXFY9c+pwfpYWynpxdiA+34ARCMFXNupj2VHdV
         w2sfqyYBFwM1B6uZK2lgMaUVrToPwn/ZYS0n+EUGyAim3dhZ+Vu8O12FhGv8Mp76Jzlr
         siWG+7cpVTM+yAgwAGVHruZZ8mvfC/LremUMdca3hS5YqGVk9grYCOjO9ZK9zZk+CdYN
         WhGu1uEoActDu+dXP2nZRbr2HSNvAd7yw8Ylp2welGJFdrPcTeSvVG+83sCWnh+d2H2K
         OHs6I654PrrjMPr82kbsZJgOmfGZCIt3syCboybMQWoJBJcqopjLCAEXy0H4hGp1p/b1
         ulUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790352083; x=1790956883;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uHHjqtOTlg6U7m51a3YRL1jQgEeRztIvr0DL8aArJq0=;
        b=VeZm7aWsapsuE7ZHcJu0X12RmagAXlmAXuHLOkWoKtODjmnOGi6SDxJWDFWRCabH5I
         XTinqb/tzgxaXbZaQmzpcWMLA3UiUKasEbyDA8ykryX0N/8HVQXuqGt3WB+kQJvzVLc1
         P+fInalr6p0+Hh0VVxuyh3wtTlYO83b5KuzJUQL73mkk7G3LbDb7amDB8emqiu+nACqX
         hz3iiRzgh1JQcNryZJ+2UVst39vMIsYfxJGQDsu+mF6zpnOWwI5DHJ+hLjBjJMGsNT59
         ByZEWykKVPmkA4+WQYibUC3tOXDwvtrSLNKX+p9qNYpO5bp5rVSU5KaoHIyc5BtPuZUD
         SSIA==
X-Forwarded-Encrypted: i=1; AKwUvBz+S6PmWY67oclpuY6hvPJADevVhBZq83Md55uTLCxU0yL04fcCK6kskRSEFOeiRbrC8FTvDnEIaKA=@vger.kernel.org
X-Gm-Message-State: AFuF++khed+l1+t73ZycYNTqb1NZ6e7OBizdVZI5hv1L4UuYsEJ4xY+H
	KQfdcKOgNCezJBdHISphiKeLgGNna/JOQbq8+fw1jhDhJazSlkaHHGltNFXs4liajj0KmJi9pCO
	maJctQuyaEYJO8fyJyj6vtSJAALQsQiKyWY25H/Bo52Xqp0hVt4srD9smxaVteQ0=
X-Gm-Gg: AYBFou3VEfnoV8TJwHswQp4LJJQE5+Sfvgi73P75lz5YzWtjc9k3vLUyXb8rOIkksWO
	7lvejHv1FsIB9zTmiv1V/F4XwRAFel7xJxuy88nxVQxhtodLjSADVZJP/ocqLQgfQAliytYxipA
	oKtuQFDgCFpA2cM5gZQvICTNQgxsvnUhfyrPEntkjv/pL1nAX44F5sEyhtw3d+7N/IbUAoc6F0c
	e8Bp279fd/YNv4IoJCfNjdhc4IrReR3WoCEH+OTxH4LBwK9wRzSSNqcGSP/67kt4QcBIjSisMWk
	oZeQFQ+SNTVFGQ27ru/RTEdkOC4uJKqAVglxHXxOZx8VaW/yaxHyPYfMenf6VYa6wFDKMcWcawk
	mhtjmR7K60cN3A+8=
X-Received: by 2002:a05:6102:5ed:b0:7ab:e522:de49 with SMTP id ada2fe7eead31-7af1f201846mr1755475137.31.1790352082213;
        Fri, 25 Sep 2026 09:01:22 -0700 (PDT)
X-Received: by 2002:a05:6102:5ed:b0:7ab:e522:de49 with SMTP id ada2fe7eead31-7af1f201846mr1755465137.31.1790352081610;
        Fri, 25 Sep 2026 09:01:21 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff43ad975sm67537835e9.13.2026.09.25.09.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:01:20 -0700 (PDT)
Date: Fri, 25 Sep 2026 19:01:19 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        robh@kernel.org
Subject: Re: [PATCH v5 35/42] arm64: dts: qcom: sm8150: Add GCC CX power
 domain
Message-ID: <4chzlnyycjbh4o7sxlrjyifiw4fhe4oy6juxaxrvu3fbe7xndr@mzhorwtfoxuz>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
 <20260924-qcom-tie-cx-to-gcc-v5-35-38732033e5b5@oss.qualcomm.com>
 <20260924110121.C66B21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924110121.C66B21F000FF@smtp.kernel.org>
X-Authority-Analysis: v=2.4 cv=aaj0Dhot c=1 sm=1 tr=0 ts=6ab69ad3 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5BNVM6Iyd4Sm4qojyzoA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: JJiaSb0YGncOGlW6oxfA3vqjqeaItPdD
X-Proofpoint-ORIG-GUID: JJiaSb0YGncOGlW6oxfA3vqjqeaItPdD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX1qwCnYhd4udm
 yfNJlk82ivm6BpyJby2aaum2bDkEWTLFAbq/gtDT5C7C4DRpMog0lxGKvkDdH3ROuCSGlw0H/Vt
 fIiYUVfkeR02VlDtlUV6wtuzDAaNTkk/I2UnwrWkfAkaunv2Q1b67r+I5Ap1OESW185fV58hx4M
 UMJs/QSakPDrLDpe4XqEQaQTlPBNT3juxja2RAh7PatIozOhrNS35Rdsbry+RpFTOjl/9wpwxDp
 Kl2Z80ow28jnSm6EaoBKRs5hVRx/krlqLR6qVjwSiTHEHjE1rFU/JXNHDGpll+1OsUMYV0kOLcV
 iEtSK9UqKMb/7SYsOKyqOYrTl5zPD6nuzXCwANTe4nDNmAF7DPzXqmMja0RuABpIV4BO/3dJfPE
 k6rpyVLtFHqO6AZ1227gkpUuDrzB1DNMWtjLmdvIeUPTEwRUaMDo5anY6LxZ9+dRL2iNSXvs2Ap
 nyUvOJd6lE5ieSNaVmw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX4Bv771K9MCWy
 P1NGceqklwfx2aw1etk1zmcCS3Udt0NneuQndR/kujObbJ8gEhn7fCkn+2HxgJSrXRQGe3YSVR1
 gpuOriQ17vWhZM9AllE9U3SJkbjaYSY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250063

On 26-09-24 11:01:21, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] clk: qcom: sm8150: missing runtime PM support pins CX power domain ON
> --
> 
> commit acb1efde8c25f0a90d262048322b01fb3721956e
> Author: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> arm64: dts: qcom: sm8150: Add GCC CX power domain
> 
> This commit adds the CX power domain reference to the GCC node in the sm8150
> device tree. This allows GCC GDSC consumers to propagate their votes to the
> RPMh CX domain.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > index 94a3b02cb2897..397c0142ea579 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > @@ -913,6 +913,7 @@ gcc: clock-controller@100000 {
> >  				      "sleep_clk";
> >  			clocks = <&rpmhcc RPMH_CXO_CLK>,
> >  				 <&sleep_clk>;
> > +			power-domains = <&rpmhpd SM8150_CX>;
> 
> [Severity: High]
> Does adding this property pin the CX power domain ON indefinitely?
> 
> Looking at the gcc-sm8150.c driver, it seems .use_rpm is not set to true in
> gcc_sm8150_desc. Because of this, qcom_cc_really_probe() skips calling
> devm_pm_runtime_enable() for this device.
> 
> When platform_probe() attaches the GCC device to the CX domain, it uses
> PD_FLAG_ATTACH_POWER_ON, which powers the domain ON. However, since runtime
> PM is never enabled on the GCC device, its disable_depth remains 1, causing
> pm_runtime_suspended() to always return false.
> 
> Since the genpd core evaluates if all attached devices are suspended before
> powering off the domain, it seems genpd_power_off() will never power off the
> CX domain here. This regression could prevent the SoC from entering deep
> sleep states (power collapse) and cause battery drain.
> 
> Does gcc-sm8150.c need .use_rpm = true added to gcc_sm8150_desc so the
> device can suspend and the domain can be powered off? 
> 
> (Note: this same behavior appears to affect sm8250 as its driver also lacks
> .use_rpm = true).
> 

Since the provider registers some clocks with the CFF critical flag, the
provider isn't allowed to do runtime PM suspend anyway.

There is a discussion about this critical clocks being enabled on probe
and left enabled, rather than using the CCF flag, which will allow
runtime PM suspend to happen. But we still need to decide if that is
safe to do.

Meanwhile, not tying up the CX to the GCC could leave the GCC undervoted
because the GDSCs votes would not tricke up, which could result in an
undervolt.
