Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B355633998
	for <linux-clk@vger.kernel.org>; Sat,  4 Jul 2026 00:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783124292; cv=none; b=poaN02hmuAMEg4geZ+P0wMhpZzk4a0zxpIa3ZjAR/K4hFrZ7o8lVVgpQM4lUi9X762/FPKahj9AtUxYo7b+hdw0q9jILG3Yu4ovHUIkOuz+FL6dM6FWWnZWdJpAqF18r+k6yv4KOYq5MRTYuVpj8nFdIjSfs+amP4P6OPMhE5vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783124292; c=relaxed/simple;
	bh=mLwEvp20IXBRwdat+VIdPCH6rg2xY0MI+tGWK4yiKl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o9x3kizUejFKI2htvqAO/FVOBiE+TBkcib9IdWNuqjwyrfYfD7tcRH86aa+iQOdretlaR2Fahv+mBlA0Vz/wmXh2zWm+9DtkMQa1dD2YjUc8fQ1Cc9yEgEQsIJ7Wj5hlT1PhvUmfk1M90m8yLXOV6ygZdhoe4nLG1GlEg5fevHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ijli7j/b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XEYpNvlu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ijli7j/b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XEYpNvlu"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPXOX888402
	for <linux-clk@vger.kernel.org>; Sat, 4 Jul 2026 00:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Qu88vDNn8lT/9pEXwEgjFich
	A/sNekO5eCuOlfgco5Y=; b=Ijli7j/bVDtCFJRkN2n+vG0553UrgpQF3XAzciUf
	03KQxfYmcDpQ4lDfvqn/6s1NFjUboUUVdb2TyVo6IjsJ38v7qsHPqW81rKpjPxhq
	BhVfF896srmufyPFREzTGKWmNX8/j5ugsQtrbg5Rj5b0guPDpBgzSmByxMy3Yyuq
	EcbMY//a5J3nUKAk+u9c+PoCWEPfcks+P6lE3YjIw2UerrsUQyu+Rn1nqowuIHkG
	Y61GO3xRY4/igmjZOdXE1LLLVUAO+ENKwHHKa7Gdx09vNyAAcp+aayflbYoQFEI2
	f+roSM3AJ4Ky5kLh0j4C2IXQPeyRfpg4AXeZ/+nkH1RmKA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682bu9tw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 04 Jul 2026 00:18:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e73fc29bfso147514085a.1
        for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 17:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783124290; x=1783729090; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qu88vDNn8lT/9pEXwEgjFichA/sNekO5eCuOlfgco5Y=;
        b=XEYpNvluVIz4jU7BVjetOgMPkbS1HgUV+VFYQkDFaf0ZFVb6mNbTRSIUIU0HtDsecR
         6fXdVsHIIF7P5bIFNDNg4atHwLbRWYi8SdcbcZ9BziHJ6rFjHWqxVG9DY8F9xWGyPqxx
         u9zB00Ybq8rggniZAkHrLRZpqa1IhGoWcqwidBKS5UluAuXnk83j1vFKixGyjGsK5gax
         z3GaM6QtTsBVFi/QGXviDioFtYX4Zk67BFul/ZRjCTniJqHGWjvNB4Rojg5BqgKTc10r
         EkUgK8lcmrVQHL9TKPrYRKYO+TmojLDtvhn0lhDgmtoOhpM22t2A099TBiR+slL7pCVL
         lqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783124290; x=1783729090;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qu88vDNn8lT/9pEXwEgjFichA/sNekO5eCuOlfgco5Y=;
        b=F09x0JlkauiQTRNmqYJPMup0IY7uJkF9qS4mfzgF43mIaPFb0jlJokXMvdKbFq+9gE
         UqVEcwK7QCZFaM9vZWQD58QBMPWy1JmKzZ+EkSBGo6A0/PnnLeMJ4DKtsbnj2cva5+Eq
         HABgk39WnEfaBcV33bj6oi7mQLFm4gXCQ/oKRx9NHjNXknkf4tedhSw/B8DtYO5INg9/
         aWahs6+fUaSQSvklXQzmFp9/5CXBC7RXP2XajvDp1azv4cGVdDGDXK57axHeeyRHNmfC
         gh+ga9APVkHYntT29GrSVT1N6o5SElEqOAi1+kVKOMDro6F/9Tel5x3vV/hhC8A+utPK
         7F5A==
X-Forwarded-Encrypted: i=1; AFNElJ8gEMycmdz2ftWPlU6FRMPwNrDlOdEppxsPfSs0DKkjhXE5X/g++wrtumTpOufGOD9DwITDjm+bgAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLXNpR+ktJ038wRoBsKVZeYLlA9/7WmG8wtBLY/Bp7hs2sxyxP
	tOQfxrFO+mGaXicLK0sOQr2+YqDoGJ5Q1K9kJnz+JcyBG95PfIwRKKWVWBPvAvdT1OhQpFfe0wo
	0Gow/zJR1wMkHswkYppXJgp+MYoK+7vxF5OhbqMF8pzzsVy0rfzmnHbm/1q4Ako8=
X-Gm-Gg: AfdE7clkaJ5L9QPqaG1UedX7ZMb27R92xdDmqgFQDw5pJIDiPWsaw7phpY/T7R1UTq9
	0LlWU+xd31kA6eaHJ3aMobVn6vw+UXBBeO4+nbGt8PoEgMN4dgmxkTqBVa7t1Hhp/K/vLCeAR/M
	1vuG+DVespYPZDd2hf5k++PRq1iOFFiOdf4zXbCm/zr62jvRC7+FxjlqEZnW2avfyS7sY7ER8ll
	ZDh+hV2j4sFwFNzCcxSXow0PuMFfsd7Jge3NFYCqdn5W52LbwNELmpm+FTHeV4Yw8VEXJtcxbgt
	amOv44BdFOIiPKnel4j4N6VstkzaEGxWzs5OPmUk2XLT77HyZZGqLPyThBqRJRJG8GHyIR595wM
	cdUeuGmASHE7IpB4XWr67Va2O1jzgqwmm1mq0Y/6R4dsOIBW0QJ+hY07rSsfpE7TMDZ6JL9xsUx
	PKLgfkdUkA1RXA8GQ2iEOxm1bt
X-Received: by 2002:a05:620a:370e:b0:92b:6805:9191 with SMTP id af79cd13be357-92e9a53c040mr220536285a.73.1783124290058;
        Fri, 03 Jul 2026 17:18:10 -0700 (PDT)
X-Received: by 2002:a05:620a:370e:b0:92b:6805:9191 with SMTP id af79cd13be357-92e9a53c040mr220533485a.73.1783124289565;
        Fri, 03 Jul 2026 17:18:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c1c4dsm850468e87.66.2026.07.03.17.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:18:07 -0700 (PDT)
Date: Sat, 4 Jul 2026 03:18:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 09/19] clk: qcom: qcm2290: Set POLL_CFG_GDSCR flag for
 DISPCC and GPUCC GDSCs
Message-ID: <e3s42sg5lxb6e54dbd5wyvdgtcakolt5assoa4ukqtgkgus366@4uzp27sftrkm>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-9-cc13826d4d5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-9-cc13826d4d5a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfXyYR0sP3/cS5o
 vDLZAad/K4GdSmJfTySjT93GzhuUfpiEztJORsvYO0dmBc3XFQWDGnRJ7iAvxUkJQW4CEPpX/5z
 LtCPHIXzBSwlQerIG9HpcFp9UYxh+R2VwZ97EhVOuk7Wf+MtCTzggyA8zRf97TujK6YC3cNayfE
 q4QHVT5BofZZ0wc+CFYPYA1tzkxFX9QMXvZZwIE+oQ4rKx7hibZRT7i3LAHiekeHgbou6cPyCAq
 3a32EC/t5jMjW0cXV7D6uvsQ4AdEWOboM0MnY9fU7EmxZOC/3h+3D9LbKIOspNvE3Zs6lQ8Ro2Z
 iuJa0lrXpqPGlaQs4i8bGKktMeoa4kx4pY977nbz6krPuhg3mW9dOmwB97xWCWXuPhkLA0X/Qp1
 wQPrP8eBpJ7agYPo+/xm2NU6dlrgmwpKla9KHP7EOqyqxsOfbPVy+DF20O4n1ueKnCyoY3Refa3
 afjJ9+Xv++hhP5QRUgQ==
X-Proofpoint-ORIG-GUID: IewT8NwTT-yUwX-l4yKo86QWKiidmRw4
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a485143 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=oFJMpgkmR7-raAe1-hgA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfXwiSYdyoJmcDN
 luSDvevyeqzp0U4brzHQaa4xDKX/HaxSvMmhMCipOps9XHqxjOOUw9gCQ21ceAZTztCil+0iIBH
 j5EIrRTF4oMEh0BTx7rXTnUFsqlH0RM=
X-Proofpoint-GUID: IewT8NwTT-yUwX-l4yKo86QWKiidmRw4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040001

On Fri, Jul 03, 2026 at 12:01:31AM +0530, Imran Shaik wrote:
> On some targets, the GDSCR status bit may not reflect the actual state of

Which targets? This is all about Agatti.

> the GDSC, instead the power on/off bits in CFG_GDSCR must be polled to
> determine the GDSC state correctly. Set POLL_CFG_GDSCR flag for the QCM2290
> MDSS GDSC and GPUCC GX GDSC to ensure the correct GDSC status. This is not
> applicable for GPUCC CX GDSC, which relies on gds_hw_ctrl status.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc-qcm2290.c | 2 +-
>  drivers/clk/qcom/gpucc-qcm2290.c  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
> index 89a6cdd26217381cd44a515766363cf94d0aaeeb..6ee074555099ab72106cfae7c21adbd1b4a0fdac 100644
> --- a/drivers/clk/qcom/dispcc-qcm2290.c
> +++ b/drivers/clk/qcom/dispcc-qcm2290.c
> @@ -467,7 +467,7 @@ static struct gdsc mdss_gdsc = {
>  		.name = "mdss_gdsc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = HW_CTRL_TRIGGER,
> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
>  };
>  
>  static struct gdsc *disp_cc_qcm2290_gdscs[] = {
> diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
> index 66dea9d2a0e519dfc64d977ef107b5c875da3869..3b130f69bb93898ce49654f2366851a7c1c94524 100644
> --- a/drivers/clk/qcom/gpucc-qcm2290.c
> +++ b/drivers/clk/qcom/gpucc-qcm2290.c
> @@ -313,7 +313,7 @@ static struct gdsc gpu_gx_gdsc = {
>  	},
>  	.parent = &gpu_cx_gdsc.pd,
>  	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = CLAMP_IO | AON_RESET | SW_RESET,
> +	.flags = POLL_CFG_GDSCR | CLAMP_IO | AON_RESET | SW_RESET,
>  };
>  
>  static struct clk_regmap *gpu_cc_qcm2290_clocks[] = {
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
