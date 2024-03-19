Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171463D6A
	for <linux-clk@vger.kernel.org>; Tue, 19 Mar 2024 00:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710806990; cv=none; b=o+gqiZPbey0x2/EhNhSt0MQs7xFYopxGv5F8IEfqUlwzUY/hpYIOVOgsUOdwkl99xecta2p2WGpniHjb2iAjZ8/cjTK+51x4SNlXzFhqM53WGGcvg66rsNEJuI0IBrYlPZ/WXI56+IdREpM8TUBexOswpy07Xqbis2UtCmOp/ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710806990; c=relaxed/simple;
	bh=ZkryvYHfhOSYdw2tF4GlFSpiTUyA8Rs2/YBQ7EUbLn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y0Dzij1/khoLAsVZtNw+rYgonGRPz2i+ldg47HNtnGG/4D7bPKYwir/AOghDNVsG6yY/LOVmx6erO4LY0n3Hb4IZDn2GJfnX3lDQYLFBQeI3YSkpmidqG/RJoF8O3aWKmcqIMzOjy8S4+3atwvI0FXqnneUwaVdJ4hZP1PZ5mZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NhJ45GCc; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NhJ45GCc"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-609f24f447cso55403247b3.2
        for <linux-clk@vger.kernel.org>; Mon, 18 Mar 2024 17:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710806988; x=1711411788; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fys+S9pk0Mj+NPz2xMHtozxNN5zajv+q8g6ODVq+MHY=;
        b=NhJ45GCcjPZ+Y3/GEqpvClbS62XxzfUNAIbW506fVaGdSJnGtnizOJsz3tMqJ2SaTu
         EjN/YJToRebs3GWpEsxX1vwuNsTC6VZ+o5H1WWO6HqSQPpLF0QqihUbIkwueT9tTCc/2
         6puFWX8tCRqFaK3VjgFvyNRt9YGrxi9YpObtQjQd8iK63EhVwK2moKHXz5wJ2IbsyKKS
         fmWdfrAngpmpJluiDlt0OHolwllk5kGM+CtipzSdbDhOswYMX1/buVdefBnoVT7MLqK/
         Nm87ilgJWW6JDu2F8ntKi9SU3ogyqtzRCfKx0hiEtrxvmssX7TzejdUEw0FO+m3d/JZX
         H5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710806988; x=1711411788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fys+S9pk0Mj+NPz2xMHtozxNN5zajv+q8g6ODVq+MHY=;
        b=ciV/3c/Db0Zi78ztVFdgcQx87npUKkD7LWA9433+Z16oxq4r5rFHougm0GYICs6UOW
         MR6BPYuXtWuAPg+ZuXE+/WZR1iWS02zUFx5hAMjQhl+1WEeLItuPAobYEiXJ21z0WSDn
         XP0YrwD4DRajUmvQU5Na+yHxcKlvM3EektLWJr17PyuuN241ThLHj87CKr+0N/mQ+e4N
         WJmgIFf+QcNfuA+P6YwJ/deIEydBaj4z2ohaVosuhAsRKLwSCPmOrPZodtkgItBPBdos
         fefPtj7vY08GQAN89Y90nI8oY4nUscKUYCfv8kv3TPjLH68grtbUHabM2TZ7sazuPBGa
         mYuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDz1S6xOzB/5EWcEFPHLByJeGT+aph/rZ06EW/pc9x8LmjRmWmTvPWJIuWDlJUNgnAa+n2W8+uVMzCFIwENS7huobdAqliEytY
X-Gm-Message-State: AOJu0Ywhi2dTDs6XYO05HvTpxLKkgn0qMzUeDsp7nCLEjeXj25BQZ2Wp
	j/PiSjLlT4zsO9jtTPg94XMwcwV3iOs2snv9bivkEuw3l/5g/nA++w76Q2in/UA4xt0pkWRXQ2Z
	X9hDNJQkZr1jbioltKTAJqX80uprvZItvYFjmDjysodVZ9c4S
X-Google-Smtp-Source: AGHT+IFUYNy3nqPWMFhyeAEEOgz59hN/rjXpDhVqxQJfYXeOZMQXyBfEq4Imb4IL7qF0eBO8bT0npSGQAdC6hzcbEjA=
X-Received: by 2002:a81:8147:0:b0:610:caab:bf50 with SMTP id
 r68-20020a818147000000b00610caabbf50mr5157049ywf.37.1710806988056; Mon, 18
 Mar 2024 17:09:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240318-apss-ipq-pll-cleanup-v1-0-52f795429d5d@gmail.com>
 <20240318-apss-ipq-pll-cleanup-v1-2-52f795429d5d@gmail.com>
 <CAA8EJpo2Vo-XqstNk69dWW8pqNkGi0tz3UmHY7j6LLKd-yH22w@mail.gmail.com> <09c91419-8bce-49dc-86d1-3ed1b9f28ee6@gmail.com>
In-Reply-To: <09c91419-8bce-49dc-86d1-3ed1b9f28ee6@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Mar 2024 02:09:36 +0200
Message-ID: <CAA8EJpq+PUavezxAwpStm98_3uW7HQraFyUdr6uwZCNHJ4yU5w@mail.gmail.com>
Subject: Re: [PATCH 2/5] clk: qcom: apss-ipq-pll: use an 1-D array for Huayra
 pll register offsets
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 18 Mar 2024 at 23:23, Gabor Juhos <j4g8y7@gmail.com> wrote:
>
> 2024. 03. 18. 15:16 keltez=C3=A9ssel, Dmitry Baryshkov =C3=ADrta:
>
> ...
>
> >> +static const u8 ipq_pll_huayra_regs[PLL_OFF_MAX_REGS] =3D {
> >> +       [PLL_OFF_L_VAL] =3D 0x08,
> >> +       [PLL_OFF_ALPHA_VAL] =3D 0x10,
> >> +       [PLL_OFF_USER_CTL] =3D 0x18,
> >> +       [PLL_OFF_CONFIG_CTL] =3D 0x20,
> >> +       [PLL_OFF_CONFIG_CTL_U] =3D 0x24,
> >> +       [PLL_OFF_STATUS] =3D 0x28,
> >> +       [PLL_OFF_TEST_CTL] =3D 0x30,
> >> +       [PLL_OFF_TEST_CTL_U] =3D 0x34,
> >>  };
> >
> > Can you please move this to clk_alpha_pll? We can then drop it from
> > clk-cbf-8996.c too.
>
> Sure, I can do that. By any chance, do you have a suggestion for the name=
 of the
> new enum value to be used in the clk_alpha_pll_regs array?
>
> CLK_ALPHA_PLL_TYPE_HUAYRA_IPQ seems too generic, and it would be a bit
> misleading using that for MSM8996 CBF.
>
> CLK_ALPHA_PLL_TYPE_HUAYRA_IPQ6018_A53 is quite long and it is also mislea=
ding.
>
> Maybe we could use CLK_ALPHA_PLL_TYPE_IPQ6018_A53 which is short and uniq=
ue
> enough and we could add an alias for that like CLK_ALPHA_PLL_TYPE_MSM8996=
_CBF or
> something similar.

HUAYRA_APSS ?

>
> Regards,
> Gabor
>


--=20
With best wishes
Dmitry
