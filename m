Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B9012F39C
	for <linux-clk@vger.kernel.org>; Mon, 25 Mar 2024 16:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711383599; cv=none; b=fpiP9SzcTKp30j2mrmooxPRX8b2TTdYtib3jpqplW5ODRdvhLDNYE3Cc29GaWPJ1NJRi5pcm7GFuYDXn3llBCkpO/St8JOZ9JIq5QHBl7DvvzYQPKfylc2+YRNoBUpomL4y3WdGsc4Akj5WQiQoA9AEnvJWNAm+n0IYWkuTMbDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711383599; c=relaxed/simple;
	bh=uOV5MCWT9pDoDGzplATxiEhOJo8GdM18dNDgTj0skJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p+x7CDb/qNQJDjPNqss4DB8pzliHTOnwelnmNndbbGMKh6NQJNt05apnsp2JSJlOVxC4LPe2gHYtHl7HAN77uFOLFSAJUMYQ+0xcvpTG2ivTvdPkEXcyVO126Wu82td24cZk+kFROljzdR771/wP/wxyZtgHh08WtcFqvk5sEFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Grt+7jrK; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Grt+7jrK"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-78a5234377eso83974385a.2
        for <linux-clk@vger.kernel.org>; Mon, 25 Mar 2024 09:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711383595; x=1711988395; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/M+RNRaHQeXuCFayOM1dYEtW20x69QDnHCFDaOPJPF0=;
        b=Grt+7jrK3HlzN2+0um0h4Ab0fbyCWhM6vYXhyThG9kOM4CB4r44ibZfeaVayrYjGp5
         Cz+ZVpmoPG9TBD/UbE57VPZ2KNOHkmWYKn1IHErD8e1TpWUsfteCRPzj79erzcZZJqx3
         YrgrJdvWe/5ZaxLneClFNqXPTmB+tqqfgillo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711383595; x=1711988395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/M+RNRaHQeXuCFayOM1dYEtW20x69QDnHCFDaOPJPF0=;
        b=madwRm2+Pwa2LTOyfGVYgCXNcRuWPWfsajZUNbmEsokF2TJZDXr4ylfNyPxamT4ucy
         AW0bDLIkRa7z/isA31kf0/3l+CniHsCDjaLL3KWE1vos8R/JYIGyWbHMEHA2YenYK596
         AzyWqda0OU5QGHTdLWkUPmLSADyA+vsDZ+PIZDMgItswdegGr7rtqWa4ZxGOAWyvJ+zA
         ZIBbp/OCowpYAaaX76VwkdflpAyVOUDqjGkrawe0ELFA/X/ge5jtlzZzKtz9AjMqYC2Z
         caXHGmTCm+7mKsnOC0Cw2EwC+4gVm7ZbM8qaLFA2vNHgezLMkai7VzsuLoYRwMPW4VFg
         RlIA==
X-Forwarded-Encrypted: i=1; AJvYcCUkea7X4OTPRHm+xjv97rVCFOjOwPVttYS3+NGW+sL0x7RqlVyWvDWb2QXOCKAseteFkvLKJz8sw1dcCeZdUxX6nJq2Qca4Z716
X-Gm-Message-State: AOJu0YzzfWmheOrPMnakCui9H+t2c/dD8k+5t57NFMOsjXZAmNmJri8o
	cEBG9L2I9QxEhdp3qG+M/FhkXUXPI4W3wa8q61kAw5Sl8Ptb0d6+3+kVe0dAtl4Qr9UrDftcDDY
	=
X-Google-Smtp-Source: AGHT+IGgva8YNlMm8Y6knAcXoN8oi0OcgZsbnOOLcf6uk2A6YgYVkeM70pmSUHh9n0ABlC3PdXyJfw==
X-Received: by 2002:a05:620a:134b:b0:789:e832:b843 with SMTP id c11-20020a05620a134b00b00789e832b843mr7517211qkl.31.1711383595465;
        Mon, 25 Mar 2024 09:19:55 -0700 (PDT)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com. [209.85.160.178])
        by smtp.gmail.com with ESMTPSA id k1-20020a05620a0b8100b0078a4fe9bf69sm1525745qkh.57.2024.03.25.09.19.54
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 09:19:54 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-430d3fcc511so467931cf.1
        for <linux-clk@vger.kernel.org>; Mon, 25 Mar 2024 09:19:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVccbrwgdWC7j4UAUsSYctehkyxSIpeJBCKVTnEBwSfiI9AAK9GA6FcQagCIu8UKLqTHciWWpQ89VQVKObS+cBNE6qD4hYEDnWd
X-Received: by 2002:a05:622a:1909:b0:431:c35:150f with SMTP id
 w9-20020a05622a190900b004310c35150fmr1202359qtc.14.1711383594159; Mon, 25 Mar
 2024 09:19:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325054403.592298-1-sboyd@kernel.org> <20240325054403.592298-5-sboyd@kernel.org>
In-Reply-To: <20240325054403.592298-5-sboyd@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 25 Mar 2024 09:19:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Ws-LYcpiitibPBPRhqrbS8rTo_7xtPPw2kA+qBzybOxQ@mail.gmail.com>
Message-ID: <CAD=FV=Ws-LYcpiitibPBPRhqrbS8rTo_7xtPPw2kA+qBzybOxQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] clk: Get runtime PM before walking tree during disable_unused
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, patches@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Mar 24, 2024 at 10:44=E2=80=AFPM Stephen Boyd <sboyd@kernel.org> wr=
ote:
>
> Introduce a list of clk_core structures that have been registered, or
> are in the process of being registered, that require runtime PM to
> operate. Iterate this list and call clk_pm_runtime_get() on each of them
> without holding the prepare_lock during clk_disable_unused(). This way
> we can be certain that the runtime PM state of the devices will be
> active and resumed so we can't schedule away while walking the clk tree
> with the prepare_lock held. Similarly, call clk_pm_runtime_put() without
> the prepare_lock held to properly drop the runtime PM reference.

There's a part of me that worries about the fact that we'll now be
doing a pm_runtime get() on _all clocks_ (even those that are used) at
bootup now. I worry that some device out there will be unhappy about
it. ...but I guess the device passed in here is already documented to
be one that the clock framework can get/put whenever it needs to
prepare the clock, so that makes me feel like it should be fine.

Anyway, no action item, just documenting my thoughts...

Oh, funny. After reading the next patch, I guess I'm even less
concerned. I guess we were already grabbing the pm_runtime state for
all clocks while printing the clock summary. While that's a debugfs
function, it's still something that many people have likely exercised
and it's likely not going to introduce random/long tail problems.


> +/*
> + * Call clk_pm_runtime_get() on all runtime PM enabled clks in the clk t=
ree so
> + * that disabling unused clks avoids a deadlock where a device is runtim=
e PM
> + * resuming/suspending and the runtime PM callback is trying to grab the
> + * prepare_lock for something like clk_prepare_enable() while
> + * clk_disable_unused_subtree() holds the prepare_lock and is trying to =
runtime
> + * PM resume/suspend the device as well.
> + */
> +static int clk_pm_runtime_get_all(void)

nit: It'd be nice if this documented that it acquired / held the lock.
Could be in comments, or, might as well use the syntax like this (I
think):

__acquires(&clk_rpm_list_lock);

...similar with the put function.


> +       /*
> +        * Runtime PM "get" all the devices that are needed for the clks
> +        * currently registered. Do this without holding the prepare_lock=
, to
> +        * avoid the deadlock.
> +        */
> +       hlist_for_each_entry(core, &clk_rpm_list, rpm_node) {
> +               ret =3D clk_pm_runtime_get(core);
> +               if (ret) {
> +                       failed =3D core;
> +                       pr_err("clk: Failed to runtime PM get '%s' for cl=
k '%s'\n",
> +                              failed->name, dev_name(failed->dev));

If I'm reading this correctly, the strings are backward in your error
print. Right now you're printing:

clk: Failed to runtime PM get '<clk_name>' for clk '<dev_name>'


With the printout fixed and some type of documentation that
clk_pm_runtime_get_all() and clk_pm_runtime_put_all() grab/release the
mutex:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
