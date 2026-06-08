Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0773E376A0C
	for <linux-clk@vger.kernel.org>; Mon,  8 Jun 2026 06:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780900941; cv=none; b=Vzubo5ucGHMO1i1Tsv74yp3eOml8BaDHN4Rgx/fadJEDRsN4B3wsi4S76wEGUTAiCrv1OKD6p1nazombqxks0yeIR2yhc2L5dXZwDCnAa1sXpmHSHews4Rj9J2nQBfauTYj14WEG0m8bcqpcvDs7bN02LJxfvn0E0bROLbjQS1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780900941; c=relaxed/simple;
	bh=A5Zs1ogizxAhpuZ/trmQcJX9Rh254M96AyDn0jMdDkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j6dKPu7pfKXqc847Pn/cJ6XVUpo26DsCuMuvsQaGlgXonsGV0vQd7alIy1A/AoK3uNtPiREpMFzbJXcfguDNUeh68wo2m8Bu4fokrcqYzsnXoZQ1CMkxbxfs6injz8suIptsrFx5p29ykgB6Yf/BuiAGmEbPudE2scxH6G+lBE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KO6nohuM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FsLKqSkQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KO6nohuM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FsLKqSkQ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OkUg2382838
	for <linux-clk@vger.kernel.org>; Mon, 8 Jun 2026 06:42:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iquniSPNZtWC2hiZCbPcPL4D
	J9n6N2TQEoWmqpuRfiw=; b=KO6nohuMn64MoIRDHrljsFj9mIpg2InS/pI/yYaD
	4V5x4v4vGnBcq5YliGAOR0dqG8L/d7hyxxlb+oOZ3v0SuISDesFCv8PyfyseSB+R
	zpJcIDeZNsyBo5eQkS9pH2PfYeUeO4xMgqHBJ1f8j4SgAB+MBT9nAGlc8buwQMHs
	s+rC/1tOK24iwnRKEdO9lxHziNKHjUBFxG2fQZS+5qSwAQ3+DzvLfBlGQNrp4O8c
	n3PSllOEskWsRkV6WNjGhN3lh9Ql8mp9YESMLpqvYxQe7FOmiZ3ZWgvjHREu4j3N
	wF5ZEiHC0bhs8Yph7LSHb44hCx11TAV9uLkaqEFOdngdfA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em98cxu63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 06:42:18 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-59eba324559so2441969e0c.1
        for <linux-clk@vger.kernel.org>; Sun, 07 Jun 2026 23:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780900937; x=1781505737; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iquniSPNZtWC2hiZCbPcPL4DJ9n6N2TQEoWmqpuRfiw=;
        b=FsLKqSkQtCsoFvdtPZ89NQ95gjjgsFN4pYGqoWlASBFKY+TTKDPZFVH+8j8CrwcA6u
         W1BuwiBxq/NKtuRuEHROsmmfnEzdidVLJQlAP7WKI1CDw+Xlh/Gtd4Uby/XVyhuRVwZX
         3SkrUSp8WWyk9K12+ZjMFmt/q/btv68h0+bN6N+y2M9yHl3c/1VmJCgcNZpSgGuPpSns
         tyPH0temuLM62LrPLtZfh3EQTdNUN0leiGvnFfheUZRgHulgxPqzCGPRANBx6OyN7ltp
         /zRUYZ99+U4LKqDDJ4aYYxuwJke5MkE8qzfFTaFS98SW9b+xlo0Sdf7zZ+yRivNMZ4/V
         e9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780900937; x=1781505737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iquniSPNZtWC2hiZCbPcPL4DJ9n6N2TQEoWmqpuRfiw=;
        b=YRAl4JnY8YpNhf7q8F8/aXR9pjsOPjs7zuaYMM/J32Gt83Atwsza2jEehXjq0BoOcN
         nxXfsvDxjKHHnZeyy1Kq8RaEa7Xz5MHRp4VFAZn85NRGuU4IAJAxKkNcYNeNfxjw1cun
         ntBAT7gni6dBQ3w26HzYWSigGRFUIgoEkKbPAZWu2yyuhLPmBTpzMaPHlSNrTRaqZKWm
         VOaMcjwL6OcOvcpOFbZo+1vksWPiUgEytU/hFI3WZR8arl2PPtusZuXHTBHvjkxVwnLk
         aWvZa/x/bJBGcmqCXtZpZG0Jp3Uv2DiA5Y/SB50vDdUkyd1Lt/WrHgLOM+DyRaAuMy5x
         zTTQ==
X-Forwarded-Encrypted: i=1; AFNElJ/2w0FIBtugDwt1qRlWl3qt9G3hTaff+WAcd3ZMO4XMEKo96rTgvUW4CSfLTf7KjAi4OeAx4j69t3w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzraaOLuTvi583sq4P5SpkSyt7b229cOr9KdpFDLXscuBvYIOnI
	yJ07PH/QIrRvIpBbshATQab9T5hRHFKgrEjlQ4hhGL2Eg2pv5++iiDVKNL0vV22imJzns0XKv74
	p/f8rl9PSW1Ax+YgRTkLgfnrjnX51b/X1G3blhRp8VNv+E2V1hWXDg8V8kBReU40=
X-Gm-Gg: Acq92OG8RioUPHjYy4t8Jj1qKXDPZHwfodAqwVsufAcIsgRZkybhwQnRidabxWZVIUI
	qyKCxxAawBAMZvWtRtsu6cfnrQB6ruxUOXEH5XJUH/Ry+Espd10HU5xsWqw7cz7liNgACOmSxZM
	81F0zk5qOblV9e8aWZN7pEIG19Xw9GCNbpNqEhRzB8mMVB5xouXU6rSZHEpYvhtA20S5udYmjZN
	uYJwKTjLyFn/so2T9IvCghBdSx/jHmc6qWh8tz1ZWueE4/0umZeIYQy6RD9iR8FZTCX9hcnXj8d
	juIbs1tEl7RRFZCjs0Y2Qp/iL0h0UM1XwypIWNYN1JQgZ51RaeTBXG38KA9vEFz3ObTgH1Y5u3s
	BPQXhY3vYGfYajYm9kRTTBCjgkzI68lpuq6BhtmdIgkZF9cp2abBmqlWmhGN6bTanFOBpi/rUlN
	frE8uSOwQfzjPy8ippDIko7iaSr8d6ReX8855KZKq2pRrR+g==
X-Received: by 2002:a05:6102:442c:b0:631:81d6:e15c with SMTP id ada2fe7eead31-6feeeea7c1cmr5713302137.4.1780900937225;
        Sun, 07 Jun 2026 23:42:17 -0700 (PDT)
X-Received: by 2002:a05:6102:442c:b0:631:81d6:e15c with SMTP id ada2fe7eead31-6feeeea7c1cmr5713293137.4.1780900936750;
        Sun, 07 Jun 2026 23:42:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b99ca90sm3663965e87.84.2026.06.07.23.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:42:14 -0700 (PDT)
Date: Mon, 8 Jun 2026 09:42:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] clk: qcom: gdsc: propagate gdsc_check_status()
 errors from gdsc_poll_status
Message-ID: <tdjlnmk75xxv5wy7o26737q3hsebgsqcnpgcb5xh6etetnjj6t@5l5tx7uuhvkc>
References: <20260602140934.796697-1-github.com@herrie.org>
 <20260602140934.796697-2-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602140934.796697-2-github.com@herrie.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA1OSBTYWx0ZWRfX8w7LkPsxVeQ4
 iCCKR3vgcsv0eDOYQTNyFrtPidNe59ErCwS++OZkUTU03R5VtRiQeiYRMP8RJHzu8Fa7wHd9gFU
 eC+HbTbEb7ONbdvRNX9/fY7vMoa/4u0gRrvis0WxzFNaXgNU/o1XUyt9zzuRNmm+kmO3RmqGsiZ
 dEEXggBpSnqeOAnRE4dYjXMJ8cJ4Cjj2rSA/qv7eyYMN3QCrqTXEzXNIOxBGADney5DFEzyRIFP
 pei3LqTN0+SqXxCJ/1gDahF1DiIkwXDVA/U8TyzdQQ5OhTZPFMkQhEnwaIoQg6OYAEBuIppeiOn
 JUU0HBK9TI2syQRGJvqJrYGhdGtf8TJFOobTySOaysDmvlROXHTATj+vRKFghu9BgebaUqJKqbH
 EcvfVlE+KlQ1EIdOtmWUWNsxMunW/HfaZCsHYPkdZ/+S5d9H+OwCavLYhXUtVF7vjH3j+aBfh0A
 x3588Gc/3QRu4aUqNfw==
X-Proofpoint-ORIG-GUID: 7y8ht6PJEpu51USLzNKdG6b6JFQhLYdo
X-Proofpoint-GUID: 7y8ht6PJEpu51USLzNKdG6b6JFQhLYdo
X-Authority-Analysis: v=2.4 cv=A/pc+aWG c=1 sm=1 tr=0 ts=6a26644a cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=cTwmTnRGAAAA:8
 a=EUspDBNiAAAA:8 a=xGn8PRncGggd5_oAslMA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080059

On Tue, Jun 02, 2026 at 04:09:32PM +0200, Herman van Hazendonk wrote:
> gdsc_check_status() returns negative errno when the underlying
> regmap_read() fails -- e.g. when a parent regmap dies during system
> suspend, a CSR is removed by an HW debug tool, or the bus controller
> goes into protection.

Well... For MMIO bus this is mostly theoretical...

> gdsc_poll_status() treats the result as a plain
> boolean ("is the GDSC in the requested state?"), so any negative error
> return is truncated to "true" and the poll exits with success even
> though the rail's real state is unknown:
> 
> 	do {
> 		if (gdsc_check_status(sc, status))
> 			return 0;
> 	} while (ktime_us_delta(ktime_get(), start) < STATUS_POLL_TIMEOUT_US);
> 
> 	if (gdsc_check_status(sc, status))
> 		return 0;
> 
> 	return -ETIMEDOUT;
> 
> This silently misleads gdsc_toggle_logic() (which writes/un-writes
> SW_COLLAPSE on the strength of the poll succeeding) and the gdsc_init()
> sync path (which assumes the readback represents real silicon state).
> 
> Latch the return value, propagate negative errno immediately, and only
> treat a strictly-positive value as "reached the target state". Make the
> same change in the post-timeout final check so a regmap that comes back
> after the deadline does not silently degrade to -ETIMEDOUT.
> 
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>

Fixes: 77b1067a19b4 ("clk: qcom: gdsc: Add support for gdscs with gds hw controller")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> ---
>  drivers/clk/qcom/gdsc.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index 95aa07120245..b9b47f584f6d 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -103,14 +103,21 @@ static int gdsc_hwctrl(struct gdsc *sc, bool en)
>  static int gdsc_poll_status(struct gdsc *sc, enum gdsc_status status)
>  {
>  	ktime_t start;
> +	int ret;
>  
>  	start = ktime_get();
>  	do {
> -		if (gdsc_check_status(sc, status))
> +		ret = gdsc_check_status(sc, status);
> +		if (ret < 0)
> +			return ret;
> +		if (ret)
>  			return 0;
>  	} while (ktime_us_delta(ktime_get(), start) < STATUS_POLL_TIMEOUT_US);
>  
> -	if (gdsc_check_status(sc, status))
> +	ret = gdsc_check_status(sc, status);
> +	if (ret < 0)
> +		return ret;
> +	if (ret)
>  		return 0;
>  
>  	return -ETIMEDOUT;
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
