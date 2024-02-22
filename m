Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1311AEAE7
	for <linux-clk@vger.kernel.org>; Thu, 22 Feb 2024 00:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708562552; cv=none; b=u9jYTLg9mozLvdGzY7gaWhKHdzxd4Ab1bfl/JimMkpHgzYXFr7MxJKo5aLen776DId1Mob2zrjj6oc+Bcnkon3697NSe1pDtaYqwO4IrzyRSshF0EuHiK8TVllM/2/X+VO9jHAeCYXy2iNxHnpaCZmJVb71ntH8MTQxmkjD9uTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708562552; c=relaxed/simple;
	bh=Bs9vhLKuGEIex6OPxJkFxMFJCT3jUj8PEgVKlk55ND4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Khr/CA+qGpDQtarWDvA7r/Mkjco4DkyEyUTLVhAvx1XDjj3b6VjXXrGRZTtJiqHJ+gjyjUb1/OCXZs7M/oL0XBbbZBY09ZQw+/ghloemUrhTUOk3Rmnhmc8p7hJyPm2N2IIxwruRFt97snkfvVCyX6xUY1Nj4YZfaGxP5upSKaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UYtixNgB; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UYtixNgB"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6087192b092so13455127b3.0
        for <linux-clk@vger.kernel.org>; Wed, 21 Feb 2024 16:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708562550; x=1709167350; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShxvQ8PVoqtGaEPQqhEqEYNCHruhNGrg1u0pTjKfrU0=;
        b=UYtixNgBQFiKAO4w4+Udpn2GKuFPl0ARB5tOU1uUFetljSj8qUmr+Rn5G1gSGUqBg0
         f5tv5Q+P8Z5CSQegkDMu3wuvbSEGxAmkb/2Ur+cUWt9wEHexOAlA4nViBG3VLQK65bz1
         kqY7/KnQfsQRrJ7XeDuSybRY80SMRQLdCFrJHlwRi54sDKGV+oaExp0Gjff7O1orll0M
         8MriWzrdQQYSm2VeBeUzt2DQFs15sn706mvjUXqkhMVppZOC3rlaBUTHTYvSL9qqkWK5
         ayHgYwJIDv3Z1ff+NHd02CwxMpTPxSRp0FJ8d8IIKN7S3d6o+OIENWdKw7/do+acWQxc
         qSkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708562550; x=1709167350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ShxvQ8PVoqtGaEPQqhEqEYNCHruhNGrg1u0pTjKfrU0=;
        b=h1HNYwH0lT3i7lMirGGcZOHhcf9QmettKk+DG6KGsm+a0iojbku55N9wnd8Tzc1juo
         mftfdpQnJtcK73HwteD4soFyY/QPqxLbEwpEXn5ZnF+fg75MvZy192ooFUrm6QK2cIVY
         gqQ4HNlp6mLZxW6vu2Cut8DW/XqQIFe9LD0PL9Np8YqQXRyag09bzVcTmHrCzS2kr64F
         IZtpg01QMIS2ipQ5vBYpqW5AEL9QlgG00kDEyzivWOy1JKvQftknppruodpujoWJkeYr
         hXtQQYp62esfSkKOOpRbuzyQcCC9nNUiGX52s1A5ikeYP/UXlUquvNFR8UKV6NocT0ED
         U7JQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZ41nNbVbqUE/ls5vB0P13y4IYBLRF7NmgAGoXKyHdKXFyV0ZrDTN9bcNO+gokDwlukhrrKnhK8PcaP12kvtbPtB+emVMl7RWh
X-Gm-Message-State: AOJu0YwzJmZkSlmACRwnA3JWk0+Gvjx8fzXZFwm/nOl7jRMqmic10t+D
	eWz5jQAQmHY3baNRnc57gHGDDyXSMzNnCV7VGHXa7mWsAOP4frgJLjd4x7hRBsA6u3kJuL61BR0
	siT1iQ29jno+1IYDWdb/3C57FHkThjpVTTmragw==
X-Google-Smtp-Source: AGHT+IHHuwGqbZaTb+bV+UPau4y6yhAeIrb6TWdnVktV+oEQVFlA8nEB2tKz9vC9H977t8keyZqZPMrkgYtfMJvYxvw=
X-Received: by 2002:a81:9a47:0:b0:607:a75e:9caf with SMTP id
 r68-20020a819a47000000b00607a75e9cafmr18882889ywg.22.1708562549946; Wed, 21
 Feb 2024 16:42:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240216223245.12273-1-semen.protsenko@linaro.org>
 <20240216223245.12273-12-semen.protsenko@linaro.org> <ce515530-428a-4a21-8c56-5a497cc8130a@linaro.org>
In-Reply-To: <ce515530-428a-4a21-8c56-5a497cc8130a@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 21 Feb 2024 18:42:18 -0600
Message-ID: <CAPLW+4=kpk=Vg=nX-hVxcCS0OttC6xmyUcB005tmX+vtUF9TLA@mail.gmail.com>
Subject: Re: [PATCH 11/16] clk: samsung: Keep register offsets in chip
 specific structure
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2024 at 5:04=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 16/02/2024 23:32, Sam Protsenko wrote:
> > Abstract CPU clock registers by keeping their offsets in a dedicated
> > chip specific structure to accommodate for oncoming Exynos850 support,
> > which has different offsets for cluster 0 and cluster 1. This rework
> > also makes it possible to use exynos_set_safe_div() for all chips, so
> > exynos5433_set_safe_div() is removed here to reduce the code
> > duplication.
> >
>
> So that's the answer why you could not use flags anymore - you need an
> enum, not a bitmap. Such short explanation should be in previous commits
> justifying moving reg layout to new property.

Will do, thanks.

>
> > No functional change.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> >  drivers/clk/samsung/clk-cpu.c | 156 +++++++++++++++++++---------------
> >  1 file changed, 86 insertions(+), 70 deletions(-)
> >
> > diff --git a/drivers/clk/samsung/clk-cpu.c b/drivers/clk/samsung/clk-cp=
u.c
> > index 04394d2166c9..744b609c222d 100644
> > --- a/drivers/clk/samsung/clk-cpu.c
> > +++ b/drivers/clk/samsung/clk-cpu.c
> > @@ -44,12 +44,14 @@ typedef int (*exynos_rate_change_fn_t)(struct clk_n=
otifier_data *ndata,
> >
> >  /**
> >   * struct exynos_cpuclk_chip - Chip specific data for CPU clock
> > + * @regs: register offsets for CPU related clocks
> >   * @pre_rate_cb: callback to run before CPU clock rate change
> >   * @post_rate_cb: callback to run after CPU clock rate change
> >   */
> >  struct exynos_cpuclk_chip {
> > -     exynos_rate_change_fn_t pre_rate_cb;
> > -     exynos_rate_change_fn_t post_rate_cb;
> > +     const void                              * const regs;
>
> Why this is void?
>

Different chips can have very different register layout. For example,
older Exynos chips usually keep multiple CPU divider ratios in one
single register, whereas more modern chips have a dedicated register
for each divider clock. Also, old chips usually split divider ratio vs
DIV clock status between different registers, but in modern chips they
both live in one single register. Having (void *) makes it possible to
keep pointers to different structures, and each function for the
particular chip can "know" which exactly structure is stored there,
casting (void *) to a needed type. Another way to do that would be to
have "one-size-fits-all" structure with all possible registers for all
possible chips. I don't know, I just didn't like that for a couple of
reasons, so decided to go with (void *).

I'll add some explanation in the commit message in v2.

> > +     exynos_rate_change_fn_t                 pre_rate_cb;
> > +     exynos_rate_change_fn_t                 post_rate_cb;
> >  };
> >
>
>
>
> Best regards,
> Krzysztof
>
