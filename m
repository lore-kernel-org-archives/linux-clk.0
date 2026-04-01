Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12AB3C7DE5
	for <linux-clk@vger.kernel.org>; Wed,  1 Apr 2026 11:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775043724; cv=pass; b=YhhaRB7F2WesYpacyXnByQw66vrITCy9AQY3p6ecx71Wz5Q9YdBgryphL7FmhhlqgR9g51fa2M3Ych9TD0pySCkfnrDDnwWpdghOTwDPosqnTo3X6KVW/DwvkbEQkiTohorpuUt4meh6JbnDsqWx4+YHYNZKpKyVJHegAEKjvNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775043724; c=relaxed/simple;
	bh=JYZ67gNA0pDvTW5bg1nbkHWatH4Q1qHBC4hwtpn+QI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TiZC+ZPt8ld/4UOOlwp46pevfs+VYxwr6nvqtVvJh8WXRKUjfd53dTIZPLJIUEX3DbEONLoqCxIAgiU2wS1K2s3MXS/QroO78xRumDSV4NLf2iedoQ08Rv/pS/dz6c1Pk8dQBPcpGJLENu3lSPqo8nRRlZsBaU51UkKR/9e2cpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BR2R1v0e; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BR2R1v0e"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a279ce9475so916937e87.1
        for <linux-clk@vger.kernel.org>; Wed, 01 Apr 2026 04:42:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775043721; cv=none;
        d=google.com; s=arc-20240605;
        b=f+y3jczI4FUM6J7JXssLzhy/v9tKHX5+REa3UDfYUEHsB5EQjgQVK02V89zoJJgr1r
         mYDMXJssPbUIk1Uo00q+bSslvknIysP1bxSJwsYnp4DCzevmrANfR1v05T0lUa1uFgsN
         GSovrVRWRvgC8LH2PY4ZhUGqTMVQV3AyBEdBBDhjszNbm1Wpk+kxTESGoBEv+S2NRnti
         s/NGBrJdg4UjArahnrsQ0vKysTzfoepkwsiX/iUE2WRMXE+5snB22wfU/z/3Lxl/NHdb
         v9INIrGNl3+dVgjOoz7MYDjibcWmEg5N30QsngEI+Wg6r0ujzdAmExIEwEK29kV052sa
         FtAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JYZ67gNA0pDvTW5bg1nbkHWatH4Q1qHBC4hwtpn+QI4=;
        fh=oIUl0EZPqNiaPXKIvPL6Op/VrByMga2PfBV5V1+sS4g=;
        b=YOYArqROtd2sgWfn1Bqd3bHLvZUrs6WOt5XCPBfURUb68v1gT9L2n3qbluakePKWJR
         jEFK/HlgIQhPvpK933b93/SmAbuna/AghZUpaSekUNeCkWF185syMJI+6QhnYQ2nvdfA
         pFcBhcoN1LCjCLz3l3eRgjCOXj2uJnk0IvdItHJm9veiIYwRvF5iag9rj+htUhN5s498
         QHrLSiOjpTGg7dGn1zjnL7aefRwGEnQibuOkwbQjv3R74CQxAWYOydc9FwK+5f5iD9v2
         dqV3E7FdFs5O8LyWfw39Nb3yIsoNhTq3+3GusQ8Gj1ENhC2Gw+Y5adO+JYI5SKHOMqPy
         JHXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775043721; x=1775648521; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JYZ67gNA0pDvTW5bg1nbkHWatH4Q1qHBC4hwtpn+QI4=;
        b=BR2R1v0e0PaGNJeS1VJkA2AzBVblBa7e+P4LYXlp/xUbfOh4B4zcznrJuYV6FlyDGM
         +DoPIdY25DO9uBhPM0tCiaxh4WS3ohjSsBt1i3/0yeIpcOHMXBPNG6qWNLriK7fOUS/w
         U+YFVGRqPoDicGKLXANVVHkrxU85qIZxxJapMlU0Ezlc5lI6UKzkiREo4r+PXTHdy9im
         WwWI5rYjnVTb6YOmGEVGu5l4slMQAgAne8qAk1p4BXhanDYgzp4xBH8XArkzR3UGs8Hu
         YwJoDivTehJGoyn/pPPF6BeObx8Bau9C6fbVhMWWIsvSlZcW2VUWtRX2RzEWGPUU/lpl
         mPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775043721; x=1775648521;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JYZ67gNA0pDvTW5bg1nbkHWatH4Q1qHBC4hwtpn+QI4=;
        b=U5eJOnTF8qmJRZvn2YySLFU/dW0rjF30tx3tVQU05PDwlmqoUqNH2qIug2XmR+6wkq
         hAlyun6+Pe8C69LiDHQLB+UbIUTAlbM3O9YfUTjzrA8sl4/8b3bMYARJ5qpnFQo9xlSU
         WpH0vamcVnuHQawSIDE5m/S8gtYW7BSpaoLd94CLUDaR+JM1yq11AO1e8gXgxmCFL4rT
         24WiRCXmUes7DfCpRAnjotKV7H/XtUZ0PJN9uarsnR69T7909+JoERjUnvmguGUqaGH9
         m6YIfspw6RXaItBM4G1/gO86QmIv9OY103FnT1hUg8sTH1ZkLNB60Xw6TGiAOU6pwzpz
         Dy9w==
X-Forwarded-Encrypted: i=1; AJvYcCUiRuO/QuInidiuHYNcAuTnH+XpDJDJk4G/+To9nat4MbkEUaLYeKq+5zl9KzrvT3bGN5f2H/coU1w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLdMPvSAB/J2isQuQr5TpCSCL5fSyGBQPDYwaLhJ2xe4G27JbP
	ZrTbigu4BPhV4nWJSryy2yc9ew2w2g9O6yUi//RbWaWY9v5s5nNoRCRZpWIjubF8DqL9KBg7pTh
	9sYO572NlUGw7f0POlYiz+dR7vsHekWJWPdv9Kz4/Cw==
X-Gm-Gg: ATEYQzwi6ZD1isV5ua4VN2TJB+geC552UcLo2Xz4N3KUgvP988XiP9hklERRk4+jz/c
	pMt/yA+rsPSIo0xqHyBwO5rnyuXoETrxbHeYF69IO+SGA+GWT7hEfl1eSEZamMl6DYoPib88Vsf
	tdeXqkVqATOIUSIfbkxTVw9bM8VhY5SCv4opx5KB1i6WaFvukaMKNVeE/XYWR+jrYZIsLRB1vpC
	T4IjMlool2nO2hKSG7dZS56QT4k1qzcJ14cZz3eEQU1kM86uJo4vl52X30+TN6NXKcbEWS+tMxY
	PK5u4LCJRXFqKSIuIbg=
X-Received: by 2002:a05:6512:1048:b0:5a1:1de6:bc66 with SMTP id
 2adb3069b0e04-5a2c2204c2bmr963346e87.18.1775043719389; Wed, 01 Apr 2026
 04:41:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
 <20260209-iris-venus-fix-sm8250-v5-2-0a22365d3585@oss.qualcomm.com>
 <5e2635ac-35de-645b-b5e7-235923f844ce@oss.qualcomm.com> <x5gv6dxdum5klzfjyo7xjqull6o43okkmkn7avssg26epbvrz6@z2brpssbk7iv>
 <0b41ee7c-83fe-d604-b750-8a5a0bd62bf8@oss.qualcomm.com> <CAPDyKFrO3DzfG0aW4z4w87j_iWM=3dpvp=2Wgr4MX1Bin5-6ZA@mail.gmail.com>
 <6yfn6ux3gbin2dtopdxxv4okinspueryuey5vfdq633gsewc6r@ttp56brnpgvr>
 <gX7v5Lyaw6K_7HLFrWAPRIukMU5BJ9bGDg4RNePhYxZ4A9KcMe1HWULG-XqG1czNCzN3e2BMPQV85a2184NwPQ==@protonmail.internalid>
 <CAPDyKFpm7ujNw51dVpPaHCwssjgYe1JVBEyrQ_1CsPbDJuW0Ww@mail.gmail.com> <39b31606-b4e1-48bb-b9cc-911c1ac350fc@kernel.org>
In-Reply-To: <39b31606-b4e1-48bb-b9cc-911c1ac350fc@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 1 Apr 2026 13:41:23 +0200
X-Gm-Features: AQROBzC6yQBtymEM8RF6AwP2-8_VypiX8OajhW6JswzQtD6SYu97waxO7DoNljg
Message-ID: <CAPDyKFrkVbvZcnbhxbLqFySn4V+USCKAjooT3yXN56jq+D9XGw@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] media: iris: scale MMCX power domain on SM8250
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Hans Verkuil <hverkuil@kernel.org>, 
	Stefan Schmidt <stefan.schmidt@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Dikshita Agarwal <dikshita@qti.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-media@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 Apr 2026 at 12:58, Bryan O'Donoghue <bod@kernel.org> wrote:
>
> On 01/04/2026 11:46, Ulf Hansson wrote:
> >>> The intent was for this patch to be part of v7.0-rc1, but I failed
> >>> with my pull-request to Linus.
> >>>
> >>> Instead this will be part of v7.1-rc1, assuming everything goes as expected.
> >>>
> >>> Is it possible to drop/defer these changes until v7.2?
> >> It would be very sad.
> > Right.
> >
> > Since it's my mistake, let me reconsider. If I rebase my branch and
> > share the necessary commit through an immutable branch that you can
> > pull in. Would that work for you?
> >
> > Kind regards
> > Uffe
>
> Yes. Please go ahead.

The patch is available for you to pull from the immutable branch:

git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git pmdomain

Kind regards
Uffe
