Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EFE3AA4ED
	for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 09:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788167189; cv=none; b=OKnbZAIcbWouSW5mKGSe5WJTdQ4aJGlE+Z9gJ2k4m2XHNMo58qbsDU7FtMV3LJBldl+e5VTLn2NPblZsYmui2miN8z05TZgVM0sugKOjSSOKmUZe8y/krwMAM8W1bxuNczyyiE9BCqWILLuAIYDsCgzUt2DvKOJ2K/QeIMD2gqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788167189; c=relaxed/simple;
	bh=tKqWAnX/XUlT7Y31NfwqWk6fb2LHwCqlwTIBGzmaINU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sKxTZ2ecAsHIbURbnWLyAUmVEP3Hc7iKVC1NPLCX6f89O3KCk1reX6PBLIa1xlN8/4ss2OGBEKER3pj2eD5srTi5zEuYcJF4crWxCHxqayJ5q4/4nGFw3ijmSmIHTx4ZH+7OlfRlk/auzwcHhTK9giHo5RMJHZMcuRv2T+cHWr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Tdr+evG3; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Tdr+evG3"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38511175ad3so3291032a91.2
        for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 02:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788167187; x=1788771987; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0QBclJz4ZjOwafIIGP9vesiqXcHQH7lAQx5p2rWrCkA=;
        b=Tdr+evG3EnpD9SB8JLKhhApV6u+kS7TQFbcW+Umg2tE9JMtvzfBJTy8DcAPHf4kdiM
         pSqf9kENBdj3GLSYeKmJXrBDXr2X0/oD1SzSPUy8tGbLKSGYHMoKTRxeTNmX3pNIyDoc
         NtCVDlBIv1faOBloHbIgQdwoNFqzcxgkkdID8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788167187; x=1788771987;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0QBclJz4ZjOwafIIGP9vesiqXcHQH7lAQx5p2rWrCkA=;
        b=Zxof6DSq8eDzJXqVsZUhUDmKPU1tO3ZpZQ/E80SRXfZP3Ki/Z27E3pUbPd6kciWXH8
         dVN9NhnEB3rwHP0BcYO3ZwdLXdCKkKLTmn7ckO2ChFGIbz1CUO4cKcUV202l1Eettp3l
         tOmjekAZTr9IgM4v3gpTc2m/Kdj5nuCUu63eew2kZmgwUF+02Yo5dsHpxhnof3Sfnq98
         +KTU2T/TUx+V7VAq694nSFVEDHdMXq+j7wvXTqOdnwRRe+zNGNql5YpBQ/42EZG8KbgP
         BbQvM6K9dZ/9QeGkTGJWKXjn/bFMfu1FksDkBrDjmSY9k3O2nZnnhsIFgtB7a96ZJ2TE
         I9xg==
X-Forwarded-Encrypted: i=1; AKwUvBxfl1ehqghEH97pbGqV6jLFeWtA3Mkt7pIHT0+klhN3dlFaO/lTGL01W+g+I5wQbdBz8hUdO7qQan8=@vger.kernel.org
X-Gm-Message-State: AFuF++n7aTzadfloicZYXEAvvKNC6dz+rtF14PZtbmm7c2/Cuabju7KD
	L0jthB1Rn+zxUW7bmMsSrvef6FtkP/xxXJFJ/T98EjPUuJ1DtKDSvrpslkx5YES1oqXs8+EqWas
	c5tc=
X-Gm-Gg: AYBFou0tvou+6Jd7ABtUk35asSEIkl5Ak2W+ig0F/sV9/fevCl8EPL1oXswc86RKJPC
	SE2dWQqMnTiIWBUi3TMW0yJ8kYq1p/qIoBL53DBHc35fGqZorFJywgZQftGalMiueRwgu7ZECT2
	jC85+qasLQonVhUMXipaUL8muciX0mX4KEySzoxvJ7c0X1+NgN8ycITrgsrwCHb2ODVTMCbFGWf
	MtVCIph4nHCXoVF8T6+No9kB1+wcdwYuwsUCB8jNIQLvpGXBuMMVYw522p7HT7eTz99EsRS1sIq
	3cHOsFhZgvT/ZbXnZOIXh7cnKh8he18strcKwh8Zxp45jrbmRr/+EtOjqb0VmzDcoybMiP5Mhvq
	FPoho0VP6eo5536gwZXoDGRmGnzVcKCXMon2cPx/3MMEXWbGWAJsm695wDUItINW0qUgnMdRW2Z
	NSDWe1WfFJfGyVitCKNun6Qw1qm16bfby/GCky4xo5l7FPJOZXJQFc/l01F6jDb8GU5Ib/qxiRf
	LkbwQdSOArD++0I+wfZpqyVhg==
X-Received: by 2002:a17:90b:3850:b0:398:9bd4:d15 with SMTP id 98e67ed59e1d1-3989bd40daemr21758788a91.20.1788167187224;
        Mon, 31 Aug 2026 02:06:27 -0700 (PDT)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com. [209.85.216.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39902dadd82sm358387a91.14.2026.08.31.02.06.26
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 02:06:26 -0700 (PDT)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3966791a6eeso3870593a91.3
        for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 02:06:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzlyggwzRR/supucBM3/f94uNQZc/ydEpaY3PRLH/nuzKJwGerFcQDvESDClIp0RfJCyvmGwVhPyvA=@vger.kernel.org
X-Received: by 2002:a17:90b:5905:b0:381:a766:efcb with SMTP id
 98e67ed59e1d1-396d0d7b94bmr39842739a91.4.1788167185477; Mon, 31 Aug 2026
 02:06:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-common_clk_mt8173-v1-1-2d7241f70379@chromium.org> <CAGXv+5HaxFCfe4FkPih4z_kPKc_k9=uighfoxjpD1r+KJ=PZ6A@mail.gmail.com>
In-Reply-To: <CAGXv+5HaxFCfe4FkPih4z_kPKc_k9=uighfoxjpD1r+KJ=PZ6A@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 31 Aug 2026 11:06:12 +0200
X-Gmail-Original-Message-ID: <CANiDSCsaQGe9cHCF=oYpWDHm8yP-S5qBnxP43k9YkWmW-iSH7g@mail.gmail.com>
X-Gm-Features: AcwNN1XQTqww76phd4AsllCU6mg1cRdglEfcZzeuamdPB_miugwlSSd3Y9nMY_k
Message-ID: <CANiDSCsaQGe9cHCF=oYpWDHm8yP-S5qBnxP43k9YkWmW-iSH7g@mail.gmail.com>
Subject: Re: [PATCH] clk: mediatek: Add missing depend for COMMON_CLK_MT8173
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Brian Masney <bmasney@redhat.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu

On Mon, 31 Aug 2026 at 11:03, Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> On Mon, Aug 31, 2026 at 4:50=E2=80=AFPM Ricardo Ribalda <ribalda@chromium=
.org> wrote:
> >
> > PM_GENERIC_DOMAINS_OF depends on OF, by adding a select to it without
> > adding a depend on OF, the following warning is triggered:
> >
> > WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS_OF
> >   Depends on [n]: PM_GENERIC_DOMAINS [=3Dy] && OF [=3Dn]
> >   Selected by [y]:
> >   - COMMON_CLK_MT8173_MFGTOP [=3Dy] && COMMON_CLK [=3Dy] && (ARCH_MEDIA=
TEK || COMPILE_TEST [=3Dy]) && COMMON_CLK_MT8173 [=3Dy] && PM [=3Dy]
>
> I guess this happens on COMPILE_TEST=3Dy with !OF architectures.

It was triggered by media-ci.
https://gitlab.freedesktop.org/linux-media/users/hverkuil/-/pipelines/17368=
35/test_report?job_name=3Dconfigs

A way to repro is:
make allyesconfig
scripts/config -d OF
make olddefconfig

>
> > This patch explicitly adds a dependency on OF to solve this issue.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: ebd0b73d2137 ("clk: mediatek: Add mt8173-mfgtop driver")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
>
> Thanks!



--=20
Ricardo Ribalda
