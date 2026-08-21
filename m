Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62843F4DFD
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 05:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787288890; cv=none; b=gLouGKgfiVQHek2Gr8e1Gyy3lunPK+vQZ/IB4w0OYNzyZkjLuWmSU2nqbD+77asMRjhKcu0NKwKKdAvvRYSctU2ZsDLX0lPLUPUUF1b1Ay+A6w2KxpD3M7WzeL5HH16bC2oBzukVOwrM8nTJcaaGTbef09xmaIu8L5lJ0QRnDuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787288890; c=relaxed/simple;
	bh=VFeTyvhO3dmwfO8/6BCC4Nh6lcOqlAhTyVOUCKEi8ko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TO8EAj0llanyho0Dg4mSelPlRlHbDSPa1JHy+i3mJUgu7oww1DW51yjLegX2BTkjza4XdlAxOxDCfMfEisZI8qcK/I29AH7ya7YM9aB+mQGSnAfX5E5Ba+QAeE2rqyma5YFJFN0MJPikJSiyFTz2C41Cu7sl4RZGEqLTUhsF4EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GiswsLLP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z+T17uP1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GiswsLLP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z+T17uP1"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L21lfJ1344305
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 05:08:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vsvEYGqnRFfavhS2P43aITAf
	JtkIa0wv/PeozpVLNhY=; b=GiswsLLPirg0OW4Eb2/RelSxhNsIkWVD/MpY/noi
	R0LFMYaRKTkqGX/rpkOKdWm6ue3a8DW1NoQdP334r1XPNJ2qt7RoVWtny+18Xejj
	35TDfWWxVOpZsdnbeNdidXzpE1EB+TN4wIcixtW4tlE7XQzFVwKC3LTtXniIWagm
	hOqY/UJ6TrSgi9+n/Rs9Br6FsOYQ1rLYfOz1AuQD0hqikWA/PJrBHueq+ovKl62z
	r9i8H5WQuCrlwA/kTA2HVIUVvB0edQXsW3DMpWwDcdYr1Vgj8hz/s5KjreYhdEnJ
	2eIo1DszuBBi0oD1cnZucJJCMfkBZrv2SwlrwZNGYo62nw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg8c99d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 05:08:07 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97bf8de7d8cso510785241.0
        for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 22:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787288887; x=1787893687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vsvEYGqnRFfavhS2P43aITAfJtkIa0wv/PeozpVLNhY=;
        b=Z+T17uP1kVuTcfCr0IehWOyVjJwlwzsypwNVT8G7V2kkZzt2AeKiLAYQm+2t2gJK/a
         fmm1KfwyfPnd0uky5lPkffSlSE0IsvHG3zuTWsyGIE6Ivm/SpkF7504gxV9sSSFx1SPO
         OSyDjariS1Y4jzesG/fSe3yUhHdNcEwuumnA5fmMTPbb6oSlhUECge0zjT5ZnoW9h65x
         mhgq0RfLlcQBShp8mlhrpht9MGDBcWZc2L9uzyWKoA+dmZCAlGSXsawY4HhkBeBtdzjc
         8nZig4i+/Hz+h4djwhbgQ6Tmnf+tJw9m7XqxGLRVvPuk6oniPlH4gOqWsXSJ6O1jVrsp
         1Diw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787288887; x=1787893687;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vsvEYGqnRFfavhS2P43aITAfJtkIa0wv/PeozpVLNhY=;
        b=qTfWPJJd2QNaT8IX9gG/ICEU42Bphxd8tueZsF6fXuoabtrg4lZz/NFlzU9HmgVHAI
         b84BgoPiPsZATbThWepWVxMLk/+zDY1eDG9F7Re3AEGz30Z6qv/S2AXRZxq0jix3qYDs
         YnKAw/nnGdaw08qCiqz3xeU13C3RP6B0m+V9MMHB8xe5ztZ9VRbs6C9NQ/2DQGdsnZIe
         OtqlhAbx8+S2zSgXGGu2AwCtPXoDqmlctgTHjzu8mstD/whDRb4I5qjFhMGbvOt7z+UA
         tAoBIRreN7XRjWDgaJoEkgNUR2oTbKUvVhojEQ4edwfkBsKspj5p2SfggbbSxtuK0WDU
         kPlg==
X-Forwarded-Encrypted: i=1; AHgh+Rrp+PMKGcu0FNSHhflFCOfB5sLmFSsaJSRrJxbWawvY6w7XeF8WQVDT2K6ApEPf7vP+5r8UiyDU/vA=@vger.kernel.org
X-Gm-Message-State: AFuF++miirAShyPKkdhUIQVamA4gAQV8a3lQg3K6XizFEq7foN9SgING
	141YgKLlNocYU8vSE1j0uAITZ7WGq7m2nLIT9D/Pf+vM9UEA7Qq0fMajl1wJOEP8OOSNeYnexwa
	E+Y4Don8ybh1N4lqgFVmBCLFyDjtjl9i77jYE4I7xbbe/mmaZ50W40VIYo36JtwA=
X-Gm-Gg: AR+sD116Pbajum8q5eUeVrPwgIYuiMQar43oFG+cSQjhSs2m9P+trkdfbinSK2vAlaJ
	WxVWXzTaKt0P1WbKsbdoddW8+z2HL5EzjTEHbFhtv0qCykm6QMYt4zUXcBhyYiZ9MpsfvyqbR4z
	pnYu76++ceP7jgkuBamxJ4WOfrdhp69A+XIwO4LduuBfSGQS4Gg7sX4Tyh5PYreI+0zVgfN8Qh4
	arKoHUJNY9xPH4pFzRtpD86OXvl+9lP7PrvLY2UE5cLa/uN0fOvfUD+OK8tt4SVKq4JIHyJBZgt
	S9Rdy84UVeUg8lsB9Ymq3URXHfsMiZGd/74sAobu3VCFpUBP5YGc3k6IDDAnenistX3uUE11OS/
	iJAYImj+Km+8TQlY=
X-Received: by 2002:a05:6102:5689:b0:779:aedc:88c6 with SMTP id ada2fe7eead31-77a5f8ee20cmr1696237137.0.1787288887007;
        Thu, 20 Aug 2026 22:08:07 -0700 (PDT)
X-Received: by 2002:a05:6102:5689:b0:779:aedc:88c6 with SMTP id ada2fe7eead31-77a5f8ee20cmr1696221137.0.1787288886513;
        Thu, 20 Aug 2026 22:08:06 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff1567f8sm4663325a12.18.2026.08.20.22.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 22:08:04 -0700 (PDT)
Date: Fri, 21 Aug 2026 08:08:02 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: Fix CLK_GLYMUR_GPUCC default and
 CLK_GLYMUR_EVACC duplicate
Message-ID: <j4jpmue7fmgm4smiqb4gubj4oeveaeybsgjopavswskec6z27j@uzxxutmfzwbm>
References: <20260821045214.2623299-2-sivansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821045214.2623299-2-sivansh.gupta@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDAzMyBTYWx0ZWRfX0UloT0UH7AiV
 9ga525Mx4RWDJGppdxAgbPvV9NyKs71T0jMCwh3k/rJO3VfbsRb30AnEL13zsI6qbOMmXHULjDO
 DbfeYZRk9PM20LViGqC76D9hOoVqGck=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDAzMyBTYWx0ZWRfX2m2Q1oB8/GZ+
 bWu5XhvxkPgdBrhwcTSWUBPXbOTjkXF+NJMZTqJmkCpquRHp1iSYJ3HBYN4Yh0fsTvCI81edc5J
 b8tbP3AiiCygAMUGlb553SO6UWYGdtgxVOg2/vLTVX3DhwVJY8zVDeLchekdqxAzFRNsDiUL8nc
 cD6S28CHEkTeIm59plxkZ55pn9PowasH0jZduXWxUVYbR23+pAY9dbyFWHfgo59dGX1fAMZlI6v
 qKMtqCL6hYb4LmarF62RexuyiRa/8ABaGgTgxdFsYmPAVfRseZdk+GcXNG3lfQB1lE9mWm4MFOW
 ATi/cWyMk0ZbqLfMCa567e2I2I0qj0lehtWRuNiNMtTMosYc3FOIdp1iThriT03SLmX/dFqMzpt
 rN3BGeXnc3KQtgszcAltmIPnNBlkei+ir4dpDsdJBJN5m540PwAkYBO0Xr5DBly/P0ufE8Dvb3V
 VS1m/BPCJJ97bXwZsbA==
X-Authority-Analysis: v=2.4 cv=Y7/IdBeN c=1 sm=1 tr=0 ts=6a87dd37 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=apnw_9Z6d6vNCn9dD0QA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: d2vL1P-Fmg1H5pihCzRn8ITDnXCkssJL
X-Proofpoint-ORIG-GUID: d2vL1P-Fmg1H5pihCzRn8ITDnXCkssJL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_01,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210033

On 26-08-21 10:22:15, Sivansh Gupta wrote:
> Commit 6b150572bb76 ("clk: qcom: Add defaults for desired arm64 drivers")
> missed adding a defaults for CLK_GLYMUR_GPUCC and created a duplicated
> for CLK_GLYMUR_EVACC instead. The original patch series did't have this
> problem and was introduced during the merge. Fix this by removing the
> duplicate and adding a default for CLK_GLYMUR_GPUCC.
> 
> Fixes: 6b150572bb76 ("clk: qcom: Add defaults for desired arm64 drivers")
> 

Drop this blank line here.

> Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

> ---
>  drivers/clk/qcom/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index e609a7819e07..7cd3ab277d37 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -104,7 +104,6 @@ config CLK_GLYMUR_DISPCC
>  config CLK_GLYMUR_EVACC
>  	tristate "Glymur EVA Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
> -	default m if ARCH_QCOM
>  	select CLK_GLYMUR_GCC
>  	default m if ARCH_QCOM
>  	help
> @@ -127,6 +126,7 @@ config CLK_GLYMUR_GPUCC
>  	tristate "Glymur Graphics Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
>  	select CLK_GLYMUR_GCC
> +	default m if ARCH_QCOM
>  	help
>  	  Support for the graphics clock controller on Glymur devices.
>  	  Say Y if you want to support graphics controller devices and
> -- 
> 2.43.0
> 
