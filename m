Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B3531F9B4
	for <linux-clk@vger.kernel.org>; Mon,  8 Jun 2026 07:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780903811; cv=none; b=LfMkvOK+74af9X0EDAX+yI6Seb8ZqAqLwcjBj1zkMv6Kw23I5Cd7baPThraEGaCxfUNJE+REY3rboBmqe1Uiqx7FlbvDtsaPqMwWSulVtXtyH1T6BM+vnQTsPpWrcIHyJJnSt5+2SfkKb1o7KfdQGT04f7fUZx74OPWFyDdI3jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780903811; c=relaxed/simple;
	bh=z3qvRnmiSf2bBBWwHjqp/VcnNYtlWuj3TaFh23cMoVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KDL8+hbZmDD65ey24ZiVC7srkKyHiB0mw9W81V9BlZx/+7ET5WK6Si1TKGaVmz26YNVlqhGD1f6OdJ1XpshY8Odw//ESnNNCLCgQf/jsQqpPlF0i8dwOh6f9dJCB4QdyFTDw13MXB09XsyJfP1jokNMzH9iYFQubPTKaPy5/vmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DWzxvGnS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ejy+kNBF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DWzxvGnS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ejy+kNBF"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Ovfd2833011
	for <linux-clk@vger.kernel.org>; Mon, 8 Jun 2026 07:30:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n96Tx26lpUtliljHkLBGB6tR
	wRaJZHoDUKuN3OfDGFg=; b=DWzxvGnSCdqTy4IT9/YfBbmB9j8XX6RaajltFT7T
	Wn3tv+Mgm1CKtlCqr/ESV0htPIMOZ/QM4Av43Dk97Gs9gDYmfanfNFA8ELNKBiDq
	emQsP6Lx4I6qqzmOWV0OorGq+6GqGYCfx+yiJY2kgIboBZ7JXuJKVR6Hwf6OTDfz
	yCpAPhtPRRa82jmWCNCCOm53Z3Wbg6LF3BWkutzXkS2Pp8g3MalvEMnJ4VN1Z263
	0sslV8mMfCPn6Symt8Z7XmgOsHBSngU9yH+NgYi7XFimOnLqs2VIqeoEIIUcefhI
	0xry257QiohKBGBz8H8huDk4R2gTYHmIJHoeWxRsJAoksg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmrejxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 07:30:08 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ccf62978bfso116555636d6.1
        for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 00:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780903808; x=1781508608; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n96Tx26lpUtliljHkLBGB6tRwRaJZHoDUKuN3OfDGFg=;
        b=ejy+kNBFc1u3qS4sUG1LDuH0p1BFuFIYhis/dZzDX7Jp4ml9PWM0B05nLimnPVwsCS
         e7kjeOZTQhPLsxMANk3j91AUScTeF6tqdxEr9XUL1pTd9yE8dvXCXx51K5gAo1YYy0G/
         abrq+bvTLvvViulBhztOIRa6BDKNMkDvkRhxxh3ReVpUveuXSn4aWHHOUKpMl0GTuqjc
         48fUqHhtJXeUEuthnUaJY+CpsvSCO48y/DJMBLjDd00x6S62U3NAHBg2gM77aYkUsEJf
         8F72bL2T3W6fFlgLW+6iPk6ACAPtlz1Kw0dYzoPTIuGDIuqZ2hjEQ7LlIo4aveYdkfQS
         OxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780903808; x=1781508608;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n96Tx26lpUtliljHkLBGB6tRwRaJZHoDUKuN3OfDGFg=;
        b=bqRDI2dlrr0iMEmGwNzyQri5DBUqV+Nl0mMEEx8qfh6qvdd+nUC6Mz17NpOsMZFNxN
         47/vKE/YHe6YrSTHr6IRxs9KURMNWe2oeqM8YUYRtYspie0W/7VZllmqgIt40qGwuJAJ
         GI96Vdw2VYlZYpGIECG6FaOoWJlZgmlxzPfNxIYvWkTZl4kIvLHJLF9EKLR1uH6OipiH
         4fbEp25MGnDic9C5BHOoZ++sDvT19dG8vf1W/QdPhAexTNtxYplfo9LJQEoaV/Nl+DLY
         e9CWQn8BSeNT46Bp4DMYIrLTBJFu+VVG9isMGpBeS5aE7mgvqrzp24U0hnH0RhqIOr0W
         UoJA==
X-Forwarded-Encrypted: i=1; AFNElJ8dRmntFdu4iqNkNgJuH+1NMJQqYYyuyfisyJ4xt9IPuM+NSlZj+mqTptfEv+r9Uv4OcEIAvzSBn7w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZw6MrLyA+W4ClWbD4Pzwza8kNAqPQLgbmXBN3+LjIcvEox/+c
	sxh6BF0M0CmPR62icUOFORo7grbNke+VvcAjyurh2ZlxdoyEjKMfaDJvH9Cdv+Mx+HHDuz/XAlj
	KWj0EcsZQU81LhQSzXQLmhpOLG/ch1p9BFGCnLoFV2XmIJpO1+iQk+u6rx4DRwmedr82AHTI=
X-Gm-Gg: Acq92OExwt7Hogmpx1V6uC0X22okl+Q5Enrl5lijBQInJ8EjxLHxgY79WGRRmrjrilK
	lJqROvBVXKkboWJ1a+y6FCjAnjJGSOTnIUcTbG9W6dz4NxAto6JP8LR7EdjnzGHCweFTQn3nEt0
	pwh9Dx8/jEVswqx2l6JEvq2PvlIfScaqpQ4TkNXKr0EQX79L7zY793Cf6rkV05ncmzWJ9B5IoSA
	UZMaE14kcDfwyhdgTUNgZDAF5k3qjxmb2TTLS/8TtdHZvT8yphwWlNjnG8QAUMmmW13vMtg1KXP
	qrYypZIogToaB1KuVr0EGbjL1CK19nA2yF0I1KEma8rSYvJB4Ulz6iAwzBk1RKDMx0tEE6odjRk
	y54cluivxrZ0DUqQOA35EVT7b12O+5j6AzjrXF/FWYJH5UWWg4T6DyWJrQ7QB1m/kypp5sKCFFH
	7KDj1Uz/XTckR3/XPN03wLyhaHIPtANSvCnwqdmA/EeAF1fw==
X-Received: by 2002:a05:622a:2515:b0:517:859b:b584 with SMTP id d75a77b69052e-51795a0909dmr196942051cf.1.1780903807688;
        Mon, 08 Jun 2026 00:30:07 -0700 (PDT)
X-Received: by 2002:a05:622a:2515:b0:517:859b:b584 with SMTP id d75a77b69052e-51795a0909dmr196941261cf.1.1780903807070;
        Mon, 08 Jun 2026 00:30:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5ea9sm43380831fa.32.2026.06.08.00.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 00:30:05 -0700 (PDT)
Date: Mon, 8 Jun 2026 10:30:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: sboyd@kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: clk-pll: reject vote enable on orphan parent
Message-ID: <m4o436r34wiqjlgl6vc7aekel4prahjfspnzn5bu663uliqosq@6iogoaznv3tf>
References: <20260602062927.467249-1-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602062927.467249-1-github.com@herrie.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA2NyBTYWx0ZWRfX1JGZ+T3/EmPY
 uEA9No3HFqxIW1LeKQA16MH8Ac9QvJWKd8yvjpbvL2MEAITI2fjcqi96FZD/w6LkE8vLWtGYNPT
 je7vdZxOneTnFdHZmmR4Cczl7neB600GWGwheAkbPICukm9IMFAvJP9UI9eQkC3MxxxsqKO9ufu
 wYKlBhoZdbb3g6QKaJ/iy+YBzBpXyNTOf+4TbE9q90SM+2YjWDbKvrZLnqPkY4Rft8S/OfbdI+5
 h8HpGc4tuvEblqgFhT9Tt/Kc3i+LK+LEBx+ZC91o+3d7yvz01OprGuT/3hXbvRR28Yqz2AVh8Ga
 sHf2KQ/vfChOoP+8AGJH0BNGTM1VhL+7VEAvpfWqEPleiQA6KBSyscPQw401UxE0f2VpAgDnUJp
 aHUiYBfHW81UuH8cdKuWLx+6V25iLmvKXfJ4r34py9JvOk/pT9naGOjsT26OmmUbsrAb8FPNLFg
 y30WN4RqadU+S8TM0Kg==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a266f80 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=cTwmTnRGAAAA:8
 a=NErERKXRas0pqSP_P6MA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-GUID: HXsVkRtzAnMQ9VTrdpdRp4JIlgUy7pXN
X-Proofpoint-ORIG-GUID: HXsVkRtzAnMQ9VTrdpdRp4JIlgUy7pXN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080067

On Tue, Jun 02, 2026 at 08:29:27AM +0200, Herman van Hazendonk wrote:
> clk_pll_vote_enable() unconditionally feeds the result of
> clk_hw_get_parent(hw) through to_clk_pll() and on to wait_for_pll().
> The common clock framework permits clk_enable() on an orphan clock
> (supplier not bound yet), in which case clk_hw_get_parent() returns
> NULL. to_clk_pll(NULL) then yields container_of(NULL, struct clk_pll,
> clkr) -- a non-NULL bogus pointer pointing into the negative offset
> of struct clk_pll.
> 
> wait_for_pll() reaches for the parent's name via
> clk_hw_get_name(&pll->clkr.hw). Because clkr sits at a fixed offset
> inside struct clk_pll, &pll->clkr.hw cancels the to_clk_pll offset
> exactly back to NULL and clk_hw_get_name() then dereferences
> core->name on a NULL clk_hw, panicking the kernel.
> 
> This is reachable today: gcc-msm8960.c and gcc-apq8064.c register a
> pll4_vote whose parent (pll4) lives in lcc-msm8960.c, and the future
> gcc-msm8660 pll4_vote does the same. If anything calls clk_enable()
> on pll4_vote between gcc probe and the LCC clock controller binding,
> the system panics. The exposure widens as more SoCs adopt the same
> cross-controller voter pattern.
> 
> Resolve the parent with clk_hw_get_parent() once, return -ENODEV when
> it is NULL, and only call into wait_for_pll() with a real
> struct clk_pll. The enable-regmap write is also gated behind the
> parent check so a failed enable cannot leave the vote bit asserted
> against a clock the framework has not finished wiring up.
> 
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---
>  drivers/clk/qcom/clk-pll.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-pll.c b/drivers/clk/qcom/clk-pll.c
> index 26ba709f43c8..7b26129565fe 100644
> --- a/drivers/clk/qcom/clk-pll.c
> +++ b/drivers/clk/qcom/clk-pll.c
> @@ -199,14 +199,31 @@ static int wait_for_pll(struct clk_pll *pll)
>  
>  static int clk_pll_vote_enable(struct clk_hw *hw)
>  {
> +	struct clk_hw *parent;
>  	int ret;
> -	struct clk_pll *p = to_clk_pll(clk_hw_get_parent(hw));
> +
> +	/*
> +	 * Vote clocks can be registered on one clock controller and have
> +	 * the underlying PLL live on a different one (e.g. PLL4_VOTE in
> +	 * GCC for the LPASS PLL4 owned by LCC on the MSM8x60 / MSM8960 /
> +	 * APQ8064 families). The common clock framework permits enable
> +	 * on an orphan, so clk_hw_get_parent() can legitimately return
> +	 * NULL here while the supplier controller has not finished
> +	 * probing yet. Reject the enable rather than handing a bogus
> +	 * container_of(NULL, struct clk_pll, clkr) pointer to
> +	 * wait_for_pll() - inside wait_for_pll(), clk_hw_get_name()
> +	 * would reverse the offset back to NULL and dereference
> +	 * core->name.
> +	 */

This is a commit message, not a comment. SHorten it or drop completely.

> +	parent = clk_hw_get_parent(hw);
> +	if (!parent)
> +		return -ENODEV;
>  
>  	ret = clk_enable_regmap(hw);
>  	if (ret)
>  		return ret;
>  
> -	return wait_for_pll(p);
> +	return wait_for_pll(to_clk_pll(parent));
>  }
>  
>  const struct clk_ops clk_pll_vote_ops = {
> 
> base-commit: 944125b4c454b58d2fe6e35f1087a932b2050dff
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
