Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C43619939E
	for <linux-clk@vger.kernel.org>; Tue, 16 Jul 2024 11:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721128857; cv=none; b=KBnK3rD2jPMKpw+TZVp34BEHE7IB+vzSKAZJa9Vk8WzZ3HLlmLy0IxXreuWTJzeVsWuluXZl1AJEeDnAaQzNmNLLr1X8oGBSzqWCWRJq1fYYH5SPR4BDiASguuyyJ4GQaEJl7WyHr5FVc3BP4/QFHLQ3ERsvL9GYEa3I0GXULcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721128857; c=relaxed/simple;
	bh=fDsipehTFQ1zqnPAjs6XM+Km5Z6Ld2LCDihrL1BOuaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dcPittL4PX/GMxKPAa/6zf1MtAjIgRdLCH/KEWmswFseo4z4I470XQRGN8Yi4s4eokXOxas/5jXjeb1MBoHSaKgYtIelyfCnHbh7B4g0a55iA2EPvCp69y80PALN2L9mYwQ3NQ+QSRufvWL+xoecZ8me4bv164a63zob5pLXvwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qM2oJ7fj; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qM2oJ7fj"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2eebc76119aso60633031fa.2
        for <linux-clk@vger.kernel.org>; Tue, 16 Jul 2024 04:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721128852; x=1721733652; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8MB8dWskGGog6BZUIVGbqIDdq5qdkeZBw32MBXf2k8U=;
        b=qM2oJ7fjytmbT16YSpv8rM47gCQOSAX/8JzHL05YSFLNrBZcQYiTn9J+QYvLW1nhTZ
         1vjcbFS3lFDvUGgt8j/KUOaB6qbpJHLl6u5og/OLYmjpt+GimT36SrUhxe65UPD6zgo4
         ZlNgMcoAKBXhjLKprNoa7l+iK9cQ/EC7aBsspxdktbge/IFDoSOqe7nwaeqHtQbrjHnp
         gNC6pyPT79KSmWKINa4nBghXmsMVl19rz3TxOVDn55LVJlQDOA06zznVO3bZhzcKbliT
         aXve1MivGXpOaYLk4n0uGcQzAgtPIf4u1JV7SnQEAeNK9IgXLMG4GYEuoRIlc1uxqRwM
         JjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721128852; x=1721733652;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8MB8dWskGGog6BZUIVGbqIDdq5qdkeZBw32MBXf2k8U=;
        b=vX/bYpwTNwEcoOCrg6/DCGjEOmBHN7ZYFGBBpb4u0k7c4WMEbPS+DT9wWprift5BQ8
         D4YLJ1nPC/3BYOwQu5bqPZAtTL5wrYZRkyRzg3ZhTOWumu2wshm2yaQM73W9B0Joz4SM
         V7EsyiQCE25TqhESJxzCmREvaCi/jvwrNEb+EHV2Jmn9OKRAd7G5ZcTj3M4KPwVoZC9N
         nDbREas+NBX5bETIevJjuqeajBu4uHA4jAtLsEECpxj7mbUSS6Ke0IHFPf49dfiRux6X
         6lIrf/Rs3y7C5L0YLXQmFS9NrQf9Xvotqsx+94qcZT1Y9uSdgSa/To5FLbtHwt5Uyv6i
         B0LQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwrT1oRWNC9dsJ2pgw4sYgBqHCmAmZllJRNxEM1DRNsGg7uF2cuffGWiDHGtboU7TttF915SU5DVSu7bIHR1Z+kNRH+NyvyVKW
X-Gm-Message-State: AOJu0Yy3JKH/6KxAkcn/zbRKMjIDDcfca9Sy8tHJmE3kMOidMcJ7d3fP
	OwIWTR1x1vTklf/854fTGV9JyB+sJ9Db0t1G2H3JzDN9aQfAwC/g352QWKZ8k9M=
X-Google-Smtp-Source: AGHT+IHei+Ksc0Jgp1d9PgvEAOF1zzPbcYMBjOQLNyF9dppFt3bYWZTsQzp8tH4DhPGsjVWbMYFMkg==
X-Received: by 2002:a2e:9f48:0:b0:2ec:59d8:a7e6 with SMTP id 38308e7fff4ca-2eef41d7646mr12595601fa.30.1721128852263;
        Tue, 16 Jul 2024 04:20:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2eee1940db3sm11336981fa.128.2024.07.16.04.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 04:20:51 -0700 (PDT)
Date: Tue, 16 Jul 2024 14:20:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Taniya Das <quic_tdas@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] clk: qcom: dispcc-sm8650: add missing
 CLK_SET_RATE_PARENT flag
Message-ID: <dccttz5b44bl3lwmcaqz6wjx3n4sv3eq4yh6276vzwrtkcvqcw@qxhbo7bylnsg>
References: <20240716-topic-sm8650-upstream-fix-dispcc-v3-0-5bfd56c899da@linaro.org>
 <20240716-topic-sm8650-upstream-fix-dispcc-v3-2-5bfd56c899da@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240716-topic-sm8650-upstream-fix-dispcc-v3-2-5bfd56c899da@linaro.org>

On Tue, Jul 16, 2024 at 11:05:22AM GMT, Neil Armstrong wrote:
> Add the missing CLK_SET_RATE_PARENT for the byte0_div_clk_src
> and byte1_div_clk_src, the clock rate should propagate to
> the corresponding _clk_src.
> 
> Fixes: 9e939f008338 ("clk: qcom: add the SM8650 Display Clock Controller driver")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/clk/qcom/dispcc-sm8650.c | 2 ++
>  1 file changed, 2 insertions(+)

This doesn't seem correct, the byte1_div_clk_src is a divisor, so the
rate should not be propagated. Other platforms don't set this flag.

-- 
With best wishes
Dmitry
