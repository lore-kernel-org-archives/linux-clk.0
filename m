Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D46218C0C
	for <linux-clk@vger.kernel.org>; Fri, 18 Oct 2024 12:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729253324; cv=none; b=kNlzWifbs86QS2y6AVC58qIbBJShQs8e93/Q/IcEFYab7m6o+FnDh58dVbq7fFUw+NiGlMKnS+irrTczitQYmgFX0YIbPqf2F1TZtYNaAhTRsqSCSufeQgpEwpXXNXx0tJTS2kUD6AZrNtwN7YfW9JwxR7J5rgJCwx0fUMZ2b+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729253324; c=relaxed/simple;
	bh=YbqulcNrKaoe+EnMEt2XGpFtZJZT2rx1KICvibHOoq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e18GeKA27J2nfp5cnbKFfWeK8vUkwAsnlbDMHzD/OoME45WMITuSrFV61XGpD0kx6A3jP+r274gxt/iJnMmJa71t5MZklAyR3KD8fZRvVXdNGuxdcI9oGsIRnMSRL8sxqm8G48jp2eTmoPDfyueprstWJOf1AlC6hSOKtZp3Vd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YdNaA7ZC; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YdNaA7ZC"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso33891981fa.3
        for <linux-clk@vger.kernel.org>; Fri, 18 Oct 2024 05:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729253321; x=1729858121; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w9CEyOXycZo0GAH066lZHL9x0GBdHQ/RJtrNNbuW8wM=;
        b=YdNaA7ZCIEZR3ou61LZ977hIvA4kyqmvPiSfRQdP4O7HaX7NpAb/w71/cxW5h9aXqS
         BlRmYaetMo4kZAMxEIjXAMqako16dweZGSP3bwKQRSUeJQgsRBZDSGL/pAl3BU+vKjzl
         M1nfDnehd4c/dovJoVJZ9L8DnbWsLP9Ai5X3inKJVHTLa0hqb2bTF2c9H8B7y1G6faWS
         o3P1bste1DUfNH7yafDPKswBifMZC3ZaiFrsjQebHfEVGVeLw9nYjaUjMW0UeAwe3MHM
         GrNcxNBHjrV0i15sxi445WEY3Bi5PULruBPuqkh2SmAQ5yr148Tu+TrJu9n6e20aw937
         7MvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729253321; x=1729858121;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w9CEyOXycZo0GAH066lZHL9x0GBdHQ/RJtrNNbuW8wM=;
        b=V35mkC5Dbi8DRrSVI3wQ6k7tzelbwijydyJT24smQ0Cvz2D/SPJEg3eKYyjJHXf75I
         kWEaZkmdjFkmPZqW8SJOXjTBJENSGb75lLv0R47s9paW66+bRYjk1JsCb+wh4fJucThk
         +dpSDdn/Io92v5+NOgt902cXEOEg/yf/eNN7dM+6FlbUXH8C9jjhNPucVc/xh2abGc4w
         4RsgxtdzNwrmUJZnGjNdoBfsvO/aBc6QW6UILMwIuZcFifM9da4/zBq8JdEgzEtYVqtL
         6GPT+XOhD8JmCDQDgRnGanQ0xlA0nEIrgDnVkPPWSJKYsi0t73A3cYs6UDGEQIM+asRc
         dssg==
X-Forwarded-Encrypted: i=1; AJvYcCVbKggdIRC3khcaOBDeHXQGeihAk1Lz8z4XTbZxZoBxoAHsp6NVb+tux9hfOOzcZFEkZkj1HO9uom8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx890QHs0baCP2kcg6LSTo0RSX9A45kA1Htr+4mxrGi8MQQzGhu
	kegVQhdTT7Fi38X8e30OwAwFiLAel5mcBrPUQmM3BSryfsWhZaE2ON2yj/liwwE=
X-Google-Smtp-Source: AGHT+IET87521GR+Ncypj8kYlpZXAqXop//a42wje36HMmpSaJ1UQJi3Vj3+Hvduz4mk5BgZRtxPyg==
X-Received: by 2002:a05:651c:1547:b0:2fa:d84a:bda5 with SMTP id 38308e7fff4ca-2fb82e90e03mr16854441fa.7.1729253321351;
        Fri, 18 Oct 2024 05:08:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb809a6a88sm1997451fa.7.2024.10.18.05.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 05:08:40 -0700 (PDT)
Date: Fri, 18 Oct 2024 15:08:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Imran Shaik <quic_imrashai@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] clk: qcom: Add support for Video Clock Controller on
 QCS8300
Message-ID: <2wahtcgpz7juse325f6vp5od75pwrwyl5v3c2ln2xa64qzpvid@f43c7uxx34r6>
References: <20241018-qcs8300-mm-patches-v1-0-859095e0776c@quicinc.com>
 <20241018-qcs8300-mm-patches-v1-6-859095e0776c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018-qcs8300-mm-patches-v1-6-859095e0776c@quicinc.com>

On Fri, Oct 18, 2024 at 04:42:34PM +0530, Imran Shaik wrote:
> Add support to the QCS8300 Video clock controller by extending
> the SA8775P Video clock controller, which is mostly identical
> but QCS8300 has minor difference.
> 
> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
> ---
>  drivers/clk/qcom/videocc-sa8775p.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/clk/qcom/videocc-sa8775p.c b/drivers/clk/qcom/videocc-sa8775p.c
> index bf5de411fd5d..d0494ba81f5f 100644
> --- a/drivers/clk/qcom/videocc-sa8775p.c
> +++ b/drivers/clk/qcom/videocc-sa8775p.c
> @@ -524,6 +524,7 @@ static struct qcom_cc_desc video_cc_sa8775p_desc = {
>  
>  static const struct of_device_id video_cc_sa8775p_match_table[] = {
>  	{ .compatible = "qcom,sa8775p-videocc" },
> +	{ .compatible = "qcom,qcs8300-videocc" },

Sorted, please.

>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, video_cc_sa8775p_match_table);
> @@ -550,6 +551,9 @@ static int video_cc_sa8775p_probe(struct platform_device *pdev)
>  	clk_lucid_evo_pll_configure(&video_pll0, regmap, &video_pll0_config);
>  	clk_lucid_evo_pll_configure(&video_pll1, regmap, &video_pll1_config);
>  

Comment?

> +	if (of_device_is_compatible(pdev->dev.of_node, "qcom,qcs8300-videocc"))
> +		regmap_write(regmap, video_cc_mvs0c_div2_div_clk_src.reg, 2);
> +
>  	/* Keep some clocks always enabled */
>  	qcom_branch_set_clk_en(regmap, 0x80ec); /* VIDEO_CC_AHB_CLK */
>  	qcom_branch_set_clk_en(regmap, 0x8144); /* VIDEO_CC_SLEEP_CLK */
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
