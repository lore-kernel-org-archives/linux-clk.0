Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F380617E8FD
	for <linux-clk@vger.kernel.org>; Wed, 17 Jul 2024 09:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721209801; cv=none; b=F3XAnUcruJcRIrD2TrStm+r7XEw0cyNzO4m6X+895V3xx+UKoPaquOxaO94lqd637T6E16ylg1BoL3tIF7vDdC7vyiYAeKw53hPYyQA+6aENQs7ZuiCjPQrIMOwCSBxyhv2CPpN2vkiyeF/9tfwelG0c0Up5NF58Oxg3RVA6PSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721209801; c=relaxed/simple;
	bh=H5PoAttukPkaOiwXWePhqYK3ZaPP5UucflmTGihpw98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SCVCUWcccqfsB1p810Tt80ygMbplsQcwZdgMpzawquwvmwDe5EXZNIgQsjRfG6toX4kXP++nbmXuWvttN+uDwZXiudYe7X160cg/rYpSdHy+qSDYjSuYCEXFa6USmt9BKbiKmWne1ID+GOEJbKFUa3xzV41hC2RFd/zOn+Ll1yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iyWj77tN; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iyWj77tN"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dff1ccdc17bso6770164276.0
        for <linux-clk@vger.kernel.org>; Wed, 17 Jul 2024 02:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721209799; x=1721814599; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dfAvVWLrB3F7/a07jguYyX27pLY+S5GzkT3MriOJkc0=;
        b=iyWj77tNSpn4+oDU5y3bsCZSrpd3zDl7mTugJlLNZghh4NHMRgHP+seaoDT+X6Zp50
         a9WE2gfNg/fgsmpoChdh44cCB9HZKKllzj287Cg0/bw99mPAX4SmKdOLFEhXGc6DnNNn
         lsqLcRXZgzUimky24JoYcovDd2Kjia/ICstpky8kBPVY/zGhvZzRluC24t3Ic9CfKAD/
         /F3A7qd8dp8VfR/xfCXQ/jDiuntJlYZYpQyg2LLwwvehoWBa90r/fPeZQLbiW0HWGv6k
         oxYc/mwJ9+B7hJNhxsAiZ8fDByyOT3NmizKPUzl7Q0Lpu0p/CKcrWUZPLBCD+JcTyGYo
         /7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721209799; x=1721814599;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dfAvVWLrB3F7/a07jguYyX27pLY+S5GzkT3MriOJkc0=;
        b=EOVa5A2XttdZeFMSvjx82w5ch0THV/+Z9OvqmhGpQuGFe420dFRrvOs7sZQTIusOJF
         yY76AE/2T8j+SOjkkr/3ovAW/gSSaQXNZggDMI7hFDf8egf2U5H9nNEfwMVNqNWq5D83
         ITdaS4PxDfMosvxK5oTqdwgcVA28xaO5Om2NQUx+741HjCiwujhZyXAw6CSqMNbBqYdj
         QLL2mDddx3LLuSizKYa/FRhQFdcMQXbqh74+C0UdX2nT2rqD7MX1hoFj3zFxkzXdbPLX
         YhhCzswwg+fMkVSLDBFRT6p0dkpzxrfKVDC0S7bzrwZoysoJL5K+Jt46uZkalx+jMtlh
         5hMw==
X-Forwarded-Encrypted: i=1; AJvYcCV/K7UbexrByYM8CNth7DrkltHIE4iQxgxOV35cz+vUvWbxQeTftbtxm3gJcs/s9IzciEHl79tTzVWfEpAXkwmLIUYp/kEsgBb/
X-Gm-Message-State: AOJu0YxyHJRyGbWVT28hOh/8VTp3YeKZd8wJ+nGPeiuv8F6ZwhUScQPP
	imLWIFKj5CxdY3pK7XA2ppCduQyTKardPVNv7YU/cmbqAm64bC+7aL96llV2qI+q0WRLJ81oeCS
	wBVGbg+yTUHyFwv4MLcMezwG3lJVhJ/d6hQF9Rw==
X-Google-Smtp-Source: AGHT+IF6nCzOpXaRWt9Ib3jOdlVzNTPk85lJ7twhcXVYMp8Nqyhe17ix7FKx2TyF92rD+HSwMWfOHwxPHQk1Q1iI7IA=
X-Received: by 2002:a05:6902:1692:b0:e02:b9ac:1486 with SMTP id
 3f1490d57ef6-e05ed82f82emr1265122276.57.1721209798862; Wed, 17 Jul 2024
 02:49:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240716-topic-sm8650-upstream-fix-dispcc-v3-0-5bfd56c899da@linaro.org>
 <20240716-topic-sm8650-upstream-fix-dispcc-v3-2-5bfd56c899da@linaro.org>
 <dccttz5b44bl3lwmcaqz6wjx3n4sv3eq4yh6276vzwrtkcvqcw@qxhbo7bylnsg>
 <9ad10d92-d755-4fae-b206-6e8648be6d48@linaro.org> <CAA8EJpr9L+AKDhuHfQa=Nco7fvG9vLH3a+gxVhENrhz12b3n=Q@mail.gmail.com>
 <278354ec-532b-48de-8ee1-5477ddb4a285@linaro.org> <kxrhhb3vdojbnqfbwks2qmob55fwm3onleood73qfk6esl7g2c@q66kw5am4emc>
 <94e48e19-781e-4de3-a4e6-da8e923a1294@linaro.org>
In-Reply-To: <94e48e19-781e-4de3-a4e6-da8e923a1294@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Jul 2024 12:49:48 +0300
Message-ID: <CAA8EJpomVKiVrRxSEJmjvNXLGGKVvcr2wGWtE129eUoUfgYC4g@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] clk: qcom: dispcc-sm8650: add missing
 CLK_SET_RATE_PARENT flag
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: neil.armstrong@linaro.org, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Jul 2024 at 12:47, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 16.07.2024 6:46 PM, Dmitry Baryshkov wrote:
> > On Tue, Jul 16, 2024 at 03:46:24PM GMT, neil.armstrong@linaro.org wrote:
> >> On 16/07/2024 15:44, Dmitry Baryshkov wrote:
> >>> On Tue, 16 Jul 2024 at 15:32, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> >>>>
> >>>> On 16/07/2024 13:20, Dmitry Baryshkov wrote:
> >>>>> On Tue, Jul 16, 2024 at 11:05:22AM GMT, Neil Armstrong wrote:
> >>>>>> Add the missing CLK_SET_RATE_PARENT for the byte0_div_clk_src
> >>>>>> and byte1_div_clk_src, the clock rate should propagate to
> >>>>>> the corresponding _clk_src.
> >>>>>>
> >>>>>> Fixes: 9e939f008338 ("clk: qcom: add the SM8650 Display Clock Controller driver")
> >>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> >>>>>> ---
> >>>>>>    drivers/clk/qcom/dispcc-sm8650.c | 2 ++
> >>>>>>    1 file changed, 2 insertions(+)
> >>>>>
> >>>>> This doesn't seem correct, the byte1_div_clk_src is a divisor, so the
> >>>>> rate should not be propagated. Other platforms don't set this flag.
> >>>>>
> >>>>
> >>>> Why not ? the disp_cc_mdss_byte1_clk_src has CLK_SET_RATE_PARENT and a div_table,
> >>>> and we only pass DISP_CC_MDSS_BYTE1_CLK to the dsi controller.
> >>>
> >>> Yes, the driver sets byte_clk with the proper rate, then it sets
> >>> byte_intf_clk, which results in a proper divisor.
> >>> If we have CLK_SET_RATE_PARENT for byte1_div_clk_src, then setting
> >>> byte_intf_clk rate will also result in a rate change for the byte_clk
> >>> rate.
> >>>
> >>> Note, all other platforms don't set that flag for this reason (I think
> >>> I had to remove it during sm8450 development for this reason).
> >>>
> >>
> >> Ack, I think this deserves a comment explaining this, I'll add it.
> >
> > But where to place it? This applies to _all_ dispcc controllers.
>
> Commit message

It is already committed.

-- 
With best wishes
Dmitry
