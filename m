Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E933F13BAC8
	for <linux-clk@vger.kernel.org>; Mon, 25 Mar 2024 17:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711386971; cv=none; b=UQnIgPydo/m5uHSewevOL3WEhEkCD7m0HP7VB6oxRRSmsIF2eCwUwTmt2RQ5NwOdcaQze4aZI9lXLSJ8JpZjpxnEVJCVwlKyepMiHNRC09Q3WxmkMiJUPnvIooO8jAJ+7ntBSDEZi2IUohbHcHAiQ/4iMvKjbEAc7mIKX+2bQAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711386971; c=relaxed/simple;
	bh=5z7JWgRm+prE8c9r61qKqkGGuVaMbLVUWLsiDunLhpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=imndtSiCWI3ZmfA0LzbZYh7KnEuO1ZDzxGAjiSoaQlx2Xh3AG9ooiPv0yctiPziUKdaVXJAx4qUxQ+s0mMifeA6rtspxxp/J7G+oxY2agOKM5+ihE2u3/rmR8pKPx38kBpgk/OObC0Ufw2qeqq8iYIZWr6I7xmOOSnqm6C29rQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PX/58+xC; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PX/58+xC"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-78a3bccc420so220424085a.1
        for <linux-clk@vger.kernel.org>; Mon, 25 Mar 2024 10:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711386967; x=1711991767; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5z7JWgRm+prE8c9r61qKqkGGuVaMbLVUWLsiDunLhpA=;
        b=PX/58+xC1fNRI6lc5d432WfiXaq3h0SrIUmAt1aLuSIX0ZTRrBKPdx6mM99YRu7etI
         x6K40p2FcwKvIJhXQlKsFEJsXKfXz9tzNWLBjSYjjgHVNTvMcCLfkikVdcczozM/YlAU
         PP8DJdVYH/Tfq3/z8HH5a5hbfrU2+B4REx7Ks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711386967; x=1711991767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5z7JWgRm+prE8c9r61qKqkGGuVaMbLVUWLsiDunLhpA=;
        b=oVH4jadhuFB9yOeEpIUhftZ8wL25RlUNuqB+Yto74xGN9XrEg4dSUwQUqKgxcxASXL
         2p+eePr0ZMNtmBM1lu452gCGvhlJ+vOmrMuOhKGpGDTCugBEa8KjmI9uzEwnanAWaTye
         Hx6TCEjYl4EJfQb2NrPgpZ2fRL3QGxRQtMODsKK7Sp+Wr+gBPGiumebWhsIZKpQBheSG
         Y39SrBooTxOJ8/jooW4paKgaxbTZAJyXjEkiuea/VbbnIOrFFuFmZmNTYkERJf8VUAwa
         Bpx3uG+mf84CEBnvviRXacALKRdsZTlIYhITtfxNIrlyZwkUC9CoOezxmxQ/kEpvjvQW
         SsmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcBLsq1zvGYWT7ayeL1vGDADsctTuCYFwXY8ghXrhB+ZfDlQ9i2nO6CHsKk9kEWrXC6NDZuoB3mEIGprQSB37v5mHZ5WcrK97C
X-Gm-Message-State: AOJu0YyPOvOQRexgoiPUXONmqG5TiJqIvS7xPyMD+92dAzY0s1WrhatJ
	oEfTZg+b0wtvqmcrupiYlmzpcEV2lF1CYrPaM7aALOL8fUUzw41nYT5Iwpv4WngVhyKOccgV/JI
	=
X-Google-Smtp-Source: AGHT+IFoJTTtgFfrpVScZz3n8kwXKm8vX+7aZWNJDNx0oDX7IBZI9jKWvldrPqXrcC+cTkcFQ7eG5w==
X-Received: by 2002:a37:e10e:0:b0:78a:5fd1:f4e7 with SMTP id c14-20020a37e10e000000b0078a5fd1f4e7mr277279qkm.53.1711386967222;
        Mon, 25 Mar 2024 10:16:07 -0700 (PDT)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com. [209.85.160.181])
        by smtp.gmail.com with ESMTPSA id s25-20020a05620a16b900b0078a50b9b09csm1509000qkj.115.2024.03.25.10.16.06
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 10:16:06 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-431347c6c99so14731cf.0
        for <linux-clk@vger.kernel.org>; Mon, 25 Mar 2024 10:16:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWdHvXrN3Jck0Gxk5L+RHDqcYhqqLhh2/TsvYMyswhbvk8ALj5S1HKP1UaudmerrRaEuZFUdaJx8l3Jf/hu7Gr2l7ICvYp5hw/V
X-Received: by 2002:a05:622a:2a06:b0:431:baa:825 with SMTP id
 hc6-20020a05622a2a0600b004310baa0825mr1246888qtb.25.1711386965873; Mon, 25
 Mar 2024 10:16:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325054403.592298-1-sboyd@kernel.org> <20240325054403.592298-5-sboyd@kernel.org>
 <CAD=FV=Ws-LYcpiitibPBPRhqrbS8rTo_7xtPPw2kA+qBzybOxQ@mail.gmail.com> <42ae624ca2289fb82e00f3ac8938d05e.sboyd@kernel.org>
In-Reply-To: <42ae624ca2289fb82e00f3ac8938d05e.sboyd@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 25 Mar 2024 10:15:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XcHdEiMf8Z228sT=ChvjJs8Ujw6q8Hcf4b588ocwJHiQ@mail.gmail.com>
Message-ID: <CAD=FV=XcHdEiMf8Z228sT=ChvjJs8Ujw6q8Hcf4b588ocwJHiQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] clk: Get runtime PM before walking tree during disable_unused
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, patches@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Mar 25, 2024 at 10:06=E2=80=AFAM Stephen Boyd <sboyd@kernel.org> wr=
ote:
>
> > > +/*
> > > + * Call clk_pm_runtime_get() on all runtime PM enabled clks in the c=
lk tree so
> > > + * that disabling unused clks avoids a deadlock where a device is ru=
ntime PM
> > > + * resuming/suspending and the runtime PM callback is trying to grab=
 the
> > > + * prepare_lock for something like clk_prepare_enable() while
> > > + * clk_disable_unused_subtree() holds the prepare_lock and is trying=
 to runtime
> > > + * PM resume/suspend the device as well.
> > > + */
> > > +static int clk_pm_runtime_get_all(void)
> >
> > nit: It'd be nice if this documented that it acquired / held the lock.
> > Could be in comments, or, might as well use the syntax like this (I
> > think):
> >
> > __acquires(&clk_rpm_list_lock);
> >
> > ...similar with the put function.
>
> I had that but removed it because on the error path we drop the lock and
> sparse complains. I don't know how to signal that the lock is held
> unless an error happens, but I'm a little out of date on sparse now.

I'd settle for something in the comments then? Maybe tagged with "Context:"=
 ?

Thanks!

-Doug
