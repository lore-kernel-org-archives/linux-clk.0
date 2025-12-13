Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFC83B8D41
	for <linux-clk@vger.kernel.org>; Sat, 13 Dec 2025 04:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765598503; cv=none; b=htyd90WVZlrbOZseEve96B2JwyOzC1EPG3xWIzm0y7MHXVZeJOZzScOi/f6CeA6bi397ula7i55ZhJdy15UBGIMPtF3QLG5ootReHWmFObiL/FlJK5Inlp5eo3itsesPWAC35wX1Oj/J/gFshS5ciVCfi6m+e9x9NCqM0fPkl94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765598503; c=relaxed/simple;
	bh=vwiZYPfOQvunfhjxyDYYfW8jvyT3qy1mEalXZqzJyQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XXPqct2V2aR0vzSc9aBy1TdGZhK424KF7ys5c2lp64u7K2F1ZvNX1zjVAtOP+xdM/U7NvgBQYKLJ6t+dh7TksQNJVjZwTdggag6uCgjVbjORLpLXhfS8VJeFnZI7/eqEng+feTP+X9UlbQmwO+A4ncJdjblS0IULzlo1SDtJpRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YzveGwpq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LBRpaKt2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YzveGwpq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LBRpaKt2"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BCLxQEh680780
	for <linux-clk@vger.kernel.org>; Sat, 13 Dec 2025 04:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LcNVAJsLGQf24kG2wRpel78O
	cIah1cBrBEulv8MZ6Y8=; b=YzveGwpqsxyZMxL+MIWY6mbtC40VeRt42mhWiAQK
	Wu3ASXaVCOZC3omld1a4BoNsJpoLKcf5ITq5he34sUjdHCV8z+UMjOA60oLrMayi
	bnDw3cv6Lu6Fjc9j1/hbTRsAvYsIOlRh60eelyqPF79E8scE0puEOXlqRD6WrsEI
	Xwg26V3QxPAsawjRI9VOuL0mz2bCP19fJtGXHwE1yjqz0F+KUqspWNLKzW68Q9+y
	VSIezrJMUXYXMcwkIYfOuWtaIJUZ29xf0kki072Cr5pZHpkbBx3W61XydXQibkJp
	Du8agDyyiaVewnsRAMtMhJluIcjCXEPD7lZPDjRzEVDvyA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b0q3ygx11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 13 Dec 2025 04:01:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1d2aa793fso26899071cf.3
        for <linux-clk@vger.kernel.org>; Fri, 12 Dec 2025 20:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765598500; x=1766203300; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LcNVAJsLGQf24kG2wRpel78OcIah1cBrBEulv8MZ6Y8=;
        b=LBRpaKt2IXx+7cHx+8dZNwNuPr6Vb9wFOSZfav3cCq48YF2x9gImmDly+Tugwem6Rl
         nTy/2JsCbj11nqz4cMqp2jd0jiNVaJ+zNG7rrhPeNHyEL/8Y02cxPE599qcwKE9ULcT1
         G4jFpezTQTiEq+sDew/xIfzesErjRaYnygLlcErZI5nGetV9nYkfDNWFAxdMVPVJue5V
         lznFt/ia8pVsiQTH2xUiIdkaABtxAlGp7OQsrFlz36bnzfKWVmQLrtyu/CKVNvGvQEuE
         mlpyLG8unu5wDCYkSOARkTD2ZC/mj9BGrQBCidf9FusR2mlGTaOmFC3OBpUk3gxgyLxB
         lXcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765598500; x=1766203300;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LcNVAJsLGQf24kG2wRpel78OcIah1cBrBEulv8MZ6Y8=;
        b=HV0cB1FOo7IyuXvGm2QnKGa4i1tp6rUyP3UYK6MKJUA3LHHkF0/8cUlvC+MNN3ZiFx
         sPJVJYt9a5MkEvWdTaa7y/E371nRSA2GcvUlOvrU0U+vVyiW3XjY1xGAOyqSui7WN0eC
         CkwORZaMm3javHHLsRQamQInyTZE6JeztfkkKDazsJvrjgfMNjEgKxM45E7YEZsNBDax
         uKXfAT0Sjt69d/af0LcaoHckeHzW97OJyb1pRuDtdSguRlxc+24FPYpr/3VjVOAloPi9
         HXqb8p3krab0vUwTTccrli7TCj/AlyyhbdoiuSUqWXcC+dPmFuScpvbGgQLMdCXyy2Ez
         V8dg==
X-Forwarded-Encrypted: i=1; AJvYcCWb381EPzjEdOsdXPRGPCmIhXWT0/KjUkNOSBJ4jW5ndQ2rU7YM7XPR8a3TTsBPViDAP0WCu9EWqyI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCp35USYaU/JPmuDxxQvNRB7kun2MoPmh5fPei2IKqhePEBuji
	8ZH0h9ddDH6wu290t+atQ66dEJ5/KPJGW+7DwKfxTP6AUIuggW/x1R4bZr0+FiUt1b9wdTtTzs5
	TS67URvEaPKFN8CFoWhrAJMzFl+iLhwG3m1mOXIhFYVg1/Rf4/pRIWAlCY7Z3mE4=
X-Gm-Gg: AY/fxX7jWi56oH/Mtm5k4Azur+6FCih0EncW9u8JGBfmVGnfR+eRySetfCd3c6x/jmz
	l2RT6/tZZMefI5aFt7iv1TMqoA5cuqC9uJqqlA+CsyWnJ2+cGaWJ00aJg8Cb4bxYfaPQQq3iBO8
	OnkM3Cep+skyV8cgbk1fFvkfK7Xh2suetzzfanGW5DzRW7MMqqGBjXn62I0kT3kfh3zlq/6iS3I
	re6Ssn4H+VUKaHFkkxR0qwt4FAph/UNHHlfsZPUoGMxNdm1kdSKYZgrKhLv9Iw1zO+Xk/4/x2cS
	QZT4fKgpIifPPdyYgiJ2OFMttHEIcMB1ogk3E0IF3y5hVi6zeCfsn5jzPKuxXslYXw2+kasGsSv
	euzjCcQnRz8UT1p4iFk6okDzCGyy5BwW1gLJag05IzuoIAsBig5Ijy9s/xsWs3gH3Du++ph8IEz
	kvyD5SdfV+zMspJ1+XB2wzPVg=
X-Received: by 2002:a05:622a:41c5:b0:4f1:e2a4:db39 with SMTP id d75a77b69052e-4f1e2a4e0ecmr999791cf.4.1765598500316;
        Fri, 12 Dec 2025 20:01:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEB6fsoDzbxK5AIYGHnnqvCIiJWXQuSf+BANSN6Bb11p3TUXgUWgwzIVGKz2HvArPjz2uurUQ==
X-Received: by 2002:a05:622a:41c5:b0:4f1:e2a4:db39 with SMTP id d75a77b69052e-4f1e2a4e0ecmr999371cf.4.1765598499798;
        Fri, 12 Dec 2025 20:01:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f2f3eeecsm2643794e87.30.2025.12.12.20.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 20:01:39 -0800 (PST)
Date: Sat, 13 Dec 2025 06:01:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Petr Hodina <petr.hodina@protonmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: rcg2, msm/dsi: Fix hangs caused by
 register writes while clocks are off
Message-ID: <aeefcr2yynlgnkiocv5eeqs4heaym6bts55z5iziqkysdzzqnt@oz2yau4nqwq7>
References: <20251213-stability-discussion-v1-0-b25df8453526@ixit.cz>
 <20251213-stability-discussion-v1-2-b25df8453526@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251213-stability-discussion-v1-2-b25df8453526@ixit.cz>
X-Proofpoint-GUID: wV-1gLSQ0gUPLVjqpmM3ltdfxFY48AXt
X-Proofpoint-ORIG-GUID: wV-1gLSQ0gUPLVjqpmM3ltdfxFY48AXt
X-Authority-Analysis: v=2.4 cv=YOmSCBGx c=1 sm=1 tr=0 ts=693ce525 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=sfOm8-O8AAAA:8 a=P0BQ7NvINjiI-4SoFKYA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAzMCBTYWx0ZWRfXxu0aH4FgvMjX
 Ssy9be9E8LInXed6th0p2XbpNBsQLPxyGBBh5789EbIy2jlQzlcKd5NKMKUQpUJATylq8JR0QUZ
 LjaLDKU8TnjnhmwI1XegROiOPGfDVgNkegeZXX5NVMQdntZFWgmFPNr186y5C82w6exUIsMANvn
 h4Xq92dTONEBr2TTiID6EVtfHJJMtNvIhWwO6OAEUS4UPxRcDW8gwOpdG237BtGZpAeCPWcEl9e
 UUADznr1aLEuQEApteZsHVq98HF9yEttmF/YwJUbSl4jpNg293jCsvrtpWeNXniyn0Nj4k0nRE3
 PND0EssVj8zCs2j+QQEEDF/IOZhRr7oU3+9TSnaGvWbBHQcyifN06hgBPYIKUvWezgy6b/l/CPZ
 dfhQWm92QmP+EH4C9XMbRy8w3/dr/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_07,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512130030

On Sat, Dec 13, 2025 at 12:08:17AM +0100, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> This patch fixes system hangs that occur when RCG2 and DSI code paths
> perform register accesses while the associated clocks or power domains
> are disabled.

In general this should not be happening. Do you have a description of
the corresponding code path?

> 
> For the Qualcomm RCG2 clock driver, updating M/N/D registers while the
> clock is gated can cause the hardware to lock up. Avoid toggling the
> update bit when the clock is disabled and instead write the configuration
> directly.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/clk/qcom/clk-rcg2.c        | 18 ++++++++++++++++++
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 13 +++++++++++++
>  2 files changed, 31 insertions(+)

This needs to be split into two patches.

> 
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index e18cb8807d735..a18d2b9319670 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -1182,6 +1182,24 @@ static int clk_pixel_set_rate(struct clk_hw *hw, unsigned long rate,
>  		f.m = frac->num;
>  		f.n = frac->den;
>  
> +		/*
> +		 * If clock is disabled, update the M, N and D registers and
> +		 * don't hit the update bit.
> +		 */
> +		if (!clk_hw_is_enabled(hw)) {
> +			int ret;
> +
> +			ret = regmap_read(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg), &cfg);
> +			if (ret)
> +				return ret;
> +
> +			ret = __clk_rcg2_configure(rcg, &f, &cfg);
> +			if (ret)
> +				return ret;
> +
> +			return regmap_write(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg), cfg);
> +		}
> +
>  		return clk_rcg2_configure(rcg, &f);
>  	}
>  	return -EINVAL;
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index e0de545d40775..374ed966e960b 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -762,6 +762,12 @@ dsi_get_cmd_fmt(const enum mipi_dsi_pixel_format mipi_fmt)
>  
>  static void dsi_ctrl_disable(struct msm_dsi_host *msm_host)
>  {
> +	/* Check if we're already powered off before writing registers */
> +	if (!msm_host->power_on) {
> +		pr_info("DSI CTRL: Skipping register write - host already powered off\n");

It definitely should be dev_something. Probably dev_warn().

> +		return;
> +	}
> +
>  	dsi_write(msm_host, REG_DSI_CTRL, 0);
>  }
>  
> @@ -2489,6 +2495,8 @@ int msm_dsi_host_power_off(struct mipi_dsi_host *host)
>  {
>  	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>  	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
> +	int ret;
> +

Extra empty line

>  
>  	mutex_lock(&msm_host->dev_mutex);
>  	if (!msm_host->power_on) {
> @@ -2496,6 +2504,11 @@ int msm_dsi_host_power_off(struct mipi_dsi_host *host)
>  		goto unlock_ret;
>  	}
>  
> +	/* Ensure clocks are enabled before register access */

And this looks like yet another fix, prompting for a separate commmit.

> +	ret = pm_runtime_get_sync(&msm_host->pdev->dev);
> +	if (ret < 0)
> +		pm_runtime_put_noidle(&msm_host->pdev->dev);

pm_runtime_resume_and_get()

Also, where is a corresponding put() ? We are leaking the runtime PM
counter otherwise.

> +
>  	dsi_ctrl_disable(msm_host);
>  
>  	pinctrl_pm_select_sleep_state(&msm_host->pdev->dev);
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry
