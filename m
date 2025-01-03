Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAA91482E1
	for <linux-clk@vger.kernel.org>; Fri,  3 Jan 2025 05:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735883626; cv=none; b=Qvl7OQQXeNEIw3IMqSH8durFidHhS5caGX1UbcoWDwnxVpQkyHtbI1XrjR/0d3VaLe85cTyB8ttbmmIglSkfk28BjZdw1oD5hkmfHUQSLfGLSg/Mmx7vk6sYJ/t15zHaLLhYUdKiVNKyi1zIeNw2CwIkUK5fcB39x2BUg5cJJAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735883626; c=relaxed/simple;
	bh=9t2As+jtUq0IPZelx4vsIQTfC86ba7b6Xn4wrXrpTmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OTdbzwVZP6bkZypRhYGAEIklMFtW1V+5pRvv4Z/qAjm8yAug/OR8BahcJrn7o0rfx7Ne8OCrUlUbrwPmQwZSKZe9OOhW2FMkpWJuYCPWMkHi/YAX0iUE8aJlwJ2tFcnDbKLj5MSoBiKy476fLqcc0OteolT5c72THmV8w3BInKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b7OXM25s; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b7OXM25s"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3002c324e7eso138662441fa.3
        for <linux-clk@vger.kernel.org>; Thu, 02 Jan 2025 21:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735883621; x=1736488421; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qkNJoCoRxwm8ZQeZPnRrEVk8C3xCcSASIfrl093JjTY=;
        b=b7OXM25s53waMPAb85ni1Q5xt14kDxb8qrXbPm9/k3oOfkHE4MOiUH1mjobftWQdJ3
         BwzGbHiBppQrC411ngVZysm2cZH6Djg8dYM+9GhwLGOPcfTpqBIdeCgu1B7vCQSaNgf5
         yTjEQtRb4NtAj9kdIeUVdAWyrR0hJtEQB6ysPs3TumvGdzR04PHD13CJXOMZZ62MR14J
         jwGxSYiYmMB3AsW8JsIYbF/ush02rvIuLT1c+l0WP0qvNdQ63bxufgz8DYBId7btMpG/
         GudBBykGdExp5VxltilE18N3DpBtuHOfzqafmm/KIMZ8I5lz3jci9md2XuwJeEjKfbhc
         wOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735883621; x=1736488421;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qkNJoCoRxwm8ZQeZPnRrEVk8C3xCcSASIfrl093JjTY=;
        b=CM7GOZmL/7Af8QBp1qK86ihEM24NJn0wjVkP+41zy97+Hhzu5kZCDck7WCqGztUJHj
         GYtN65mB8skVQJVQI9DW3FJt25PbS7OXUpx6TF/KPPOA5rmnGUNOJJFp8Is2GszvgmKK
         9lRrs5RRoi1T+GswsFu42Ph0zmgIOyUr+/BUDqwe8WhXa1qcIgQVlxy3CJlJ/UsJB4rk
         xV6n9Cb1e2gPEs9PJ5n0UX3o8b+RgkfZbbWku8K3dwcJTvBcv8a78gZhrdFr8nN47LG5
         3n8BbAg9CtqmQOzbuvKKzNCN5FLkHtSqs8OU6UBuxc7ECybOrW8/wijUGnmI0tWceu9h
         kO/A==
X-Forwarded-Encrypted: i=1; AJvYcCXWrxA/kb2aULp2HK4C/spb1MEzDoaSorLMYkto/w1OzC3B/aDGxMz641ZLCzJMimsCROPZmSvlGco=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAR3J5UapNxxQgAUN4H/AJCbssqEUwn84h52kF8sKWLT6+Zu5b
	ORvRKVcj+FO6cWmnKJeb1cxuzOr0Mhm7XR00g6MBZi2iKR02enRghQVC4wAiuPo=
X-Gm-Gg: ASbGncs/8IRswdNfxp2zwkPvMSchRn9FZ4LYqC8GfXNfzE8pyI4HY6A4IGkxHjkRjUc
	oWQtdabZOQ8i5aFJfFXRet2jAZbunx/Sj7ZCxqLxhvn6wGxdpmAdB6nNpXsq+cz0fgddgsqmKXW
	/8GCtyljfHy98TzMzCwFa4atfDAhkosAamJE2+BI8eySrID18LitH+AbUga9DvxfSdqbvW/P1B4
	aDE9PvLPq0w62SOiCBdQBH3Lhk3IqYCBO4SOxMnGpbY+VYXCE5MYgprM1gfAQPcJtY9LzHcHWFE
	qStGG4u+Sbceyn94o1vHsNx4QZs0QlHS66vW
X-Google-Smtp-Source: AGHT+IG9b0alQREkaEiHqtBXd0kh8iROWWQMPrCvlmWxXFXPKbF6MPDMv5RJZi4ZRl74MddqmbgBpA==
X-Received: by 2002:a05:6512:159d:b0:540:3594:aa3a with SMTP id 2adb3069b0e04-5422952553dmr12674147e87.5.1735883621351;
        Thu, 02 Jan 2025 21:53:41 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223832a45sm4131895e87.255.2025.01.02.21.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 21:53:40 -0800 (PST)
Date: Fri, 3 Jan 2025 07:53:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2 2/2] venus: pm_helpers: Use dev_pm_genpd_set_hwmode to
 switch GDSC mode on V4
Message-ID: <y62rarxwakcyd7vhrjvr4ufcp2idq6yec7ot3s3o2nbjflzlji@w7u5lvlcv2qh>
References: <20241223-switch_gdsc_mode-v2-0-eb5c96aee662@quicinc.com>
 <20241223-switch_gdsc_mode-v2-2-eb5c96aee662@quicinc.com>
 <5dexy2uc34b3kv532r45p6oaqn7v6bjohfdpwy42folvsdv6nd@skj7o35dflj2>
 <4d3a2d5a-3791-4bc8-a43d-6087e8c35619@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d3a2d5a-3791-4bc8-a43d-6087e8c35619@quicinc.com>

On Thu, Jan 02, 2025 at 11:47:22AM +0800, Renjiang Han wrote:
> 
> On 12/23/2024 7:41 PM, Dmitry Baryshkov wrote:
> > > diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> > > index 33a5a659c0ada0ca97eebb5522c5f349f95c49c7..a2062b366d4aedba3eb5e4be456a005847eaec0b 100644
> > > --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> > > +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> > > @@ -412,7 +412,7 @@ static int vcodec_control_v4(struct venus_core *core, u32 coreid, bool enable)
> > >   	u32 val;
> > >   	int ret;
> > > -	if (IS_V6(core))
> > > +	if (IS_V6(core) || IS_V4(core))
> > >   		return dev_pm_genpd_set_hwmode(core->pmdomains->pd_devs[coreid], !enable);
> > It is being called only for v4 and v6 targets. Drop the rest of the
> > function and inline the result. I'd suggest keeping it as two patches
> > though: this one which adds IS_V4() all over the place and the next one
> > which performs cleanup of the dead code.
>  Thanks for your comment. poweron_coreid(), poweroff_coreid() and
>  vcodec_control_v4() are called only for v4 and v6. I will clean up
>  the dead code with another patch.
> > 
> > >   	else if (coreid == VIDC_CORE_ID_1) {
> > >   		ctrl = core->wrapper_base + WRAPPER_VCODEC0_MMCC_POWER_CONTROL;
> > > @@ -450,7 +450,7 @@ static int poweroff_coreid(struct venus_core *core, unsigned int coreid_mask)
> > >   		vcodec_clks_disable(core, core->vcodec0_clks);
> > > -		if (!IS_V6(core)) {
> > > +		if (!IS_V6(core) && !IS_V4(core)) {
> > >   			ret = vcodec_control_v4(core, VIDC_CORE_ID_1, false);
> > >   			if (ret)
> > >   				return ret;
> > > @@ -468,7 +468,7 @@ static int poweroff_coreid(struct venus_core *core, unsigned int coreid_mask)
> > >   		vcodec_clks_disable(core, core->vcodec1_clks);
> > > -		if (!IS_V6(core)) {
> > > +		if (!IS_V6(core) && !IS_V4(core)) {
> > >   			ret = vcodec_control_v4(core, VIDC_CORE_ID_2, false);
> > The poweron_coreid() and poweroff_coreid() functions are called only for
> > v4 and v6. The v6 case was masked out earlier. Now you've removed the v4
> > case too. Can we drop such vcodec_control_v4() calls completely?
> 
>  I cleaned up the code, and finally vcodec_control_v4() looks like this.
> 
> static int vcodec_control_v4(struct venus_core *core, u32 coreid, bool
> enable)
> {
>     return dev_pm_genpd_set_hwmode(core->pmdomains->pd_devs[coreid],
> !enable);
> 
> }
> 
>  Functionally, we can drop vcodec_control_v4(), but architecturally, I
>  don’t recommend removing this function, because I think it’s easier to
>  read the code with this function.

One-line wrappers don't make the code easier to read. Please inline it.

-- 
With best wishes
Dmitry
