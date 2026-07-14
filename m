Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D44349CC4
	for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 14:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784038494; cv=pass; b=XkI5ztAgPfBADC4H4EP5BIx40pARbMZDs6egwarmNSFUpkU+P3QzGGPbWeJzX2SXFXtLJPyqf6R5EOj6j1zXKUEJCcF/jFCsP0fX+hzMV9VLZq3mKAC8t2O8psrCjLpWzVTZ+9INli13OQ63zFnN000GshEwRVSUBZ2jInL7drg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784038494; c=relaxed/simple;
	bh=ZwonBpzAXy48ag2d1XJdBAdRbfwE5+nc6HaosOT+7aE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K6gByBkJZ3hG8ZeNRGwRpKo+xvgSohxHHPnH9NQ4J9ozdHqtTZo3WbytmLD4m0wTJvgbw70Fu67JFCQUWCjHdMe7lPnkksi1ZsrnpM+9DjxyEuMSknXzKkIPLqI3Gts/HHfVAd1zW2TfCmnYnxoZFjvGGcmQgujQt6jxNrNf980=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n3fmb1WB; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n3fmb1WB"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cc61541f8cso13709265ad.0
        for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 07:14:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784038492; cv=none;
        d=google.com; s=arc-20260327;
        b=ZJLjvTlitDlM1mOLz3jqve5+Kw4HUrwkz4Et9Qhwak+fENMbMcE6M+8g7jzmEFrBiN
         gDiHqLU3Di9xApXRp4NE7tHfIKWiBnea2fr/LFqHR5pJqtiItDnjGYkrUwBCyLkDjhCm
         1oXC5+bpW2DzyzjbEVB17DhXa5exwt03jy51Laj6x/MC+hcUmBKabEp+X2hWBgyMJoFF
         WomafGeCrvkDjacPIEnT5L4JoQ/bmeTLhDZgM5jSkD+E4OG1W+OBBQV4ovj/mLnyDWi2
         MTio6gc73lpeIqt8/a5qw2VD6TcmmDLZcvtnFA0/97fSo4kGRIGCa8t77BO42q2pj2Gc
         LlnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iffoRGhgdfjVMgG8fR7bEUfZMRX8TGqnupkWqKC4uSM=;
        fh=FHNpojTRwkzvlrGGV6wqWLCh7MRfUfW22YTq7LqVE+I=;
        b=HQY9y8ifab9Jz83EqB3uXNLRMnAl/6w68djwubYNORu9TXEf9tRIX+ad9i4fuEjhuq
         c+sRlMRv8r642BJm4g567jsxCAPfyxytCVCxLcfdcc7Rul79yfj4GHWGxlWnAXh6INy5
         4RVfYeXYsrd8mMnjKBQZabzGKFTGk0k1dWYsFsMvBHGHVVF/0tFGAIkVIaxyvENYo8SE
         /WlQhsmeiAOLHp6izb0YacCxJ+c1/fPb+TzqXsgy4HGtCB21eD1oozXUVuxGfTMSHen3
         f51IEVotTdODo/hibPTkSfI9gSmKzWpPKaPKpYFRkmOcZ8cc/0sFoGj9RFUfr+gCAAoJ
         +WXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784038492; x=1784643292; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iffoRGhgdfjVMgG8fR7bEUfZMRX8TGqnupkWqKC4uSM=;
        b=n3fmb1WBAJCg4vV0D5XcPaUu6YHriNnCtoyKEAUqSzbqntD5+2H7HycTAihki87qAq
         A++r/tR2LNn2SRYsZZPtut9Gy/l3dehlmI7H+Yfrsleb1AX4DoQL/5ASWfPUkspQaHJU
         E9XDinFNQ4tpanqZejXcUOWfuxnD5/561GNvOhCJY5wbBV1jsTKmYNnSKBOwVperbkfy
         FNnIoyZgiZzG7j5HITRVJvNPiZYmTCJxZLAxEW937ivAOW0+JdZS25Z5GE9c15ypp8Eh
         Eic1dbqPf+gA1bqdxNp0KMzNAODmHNuHvq+zPO5o9IMcNr1DkM6uicQiPar5KSlx4e/U
         MuZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784038492; x=1784643292;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iffoRGhgdfjVMgG8fR7bEUfZMRX8TGqnupkWqKC4uSM=;
        b=puKwR3y0kO7DqivWS7Nm7Fk9haZRU4LszKny7qQCBBiHbyiWPbMYWHlddQM/42LXcw
         1a2iTAngtAvT/qHhkClLh5+7rF75NvnypWGqrqZjAAGg5MC4hrjxEP11kgngnnE8YzSj
         IgQWeTsSHNRipKto7bICSyu+/Qnq77SyeXsIY3K+W1PVVgsRoNlsdCyumqgw5VbFE7ul
         GhoZ8LPek5aiP/ihjHDSd5MoVZPyFZUMSujrkEAUNqOfxDIiy5PUXbciPlCcoSlfBKt3
         IOiEB2ldrz6aYsJ/e4DLk0TBtmJCzLBZ0Ke6t0zvSMw4s0BbvKpnoXIegwNmTu0il6is
         btVQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro1Q++S/Uym3PomMHQsf8i/K0ilgy2eH1JaMBMazAFo2QblStK39Wq9GIemptOX3nrQx/FoDw8ijX0=@vger.kernel.org
X-Gm-Message-State: AOJu0YySr9M1eLrga/qVrl6qOBlGgzW99QnWiVkCElQ40B8on5SCL1Qa
	v3OGfWaGEyFpY3l2NJTaG7jdj+TY3WTYD29788ReFpb1XkncspaRzn+JYj2jIGAwGkbjB/jx+ge
	Jh+oiyWLE6wvOZIv9PAf96Qk37qTiCIw=
X-Gm-Gg: AfdE7clO2zZ9w/a13jtX2BYjFMtvVlVGLQ2NXBgZC6qzF106nCXUhwHFSVybRHxLgL8
	tXC0/u9zvNqc/edKV8+bz+abEjiBLZdJrIqe4GgMA7+I1idYSqH/l64ekb++aS8tLY5IYGiJVFX
	TNgsBpmKs/CxXsO+nOsAbhhIkvX1gQVJlnWPsdWkOBnz2kxA3x+LFHQcqOUX8qU1pTwVKr8VLIY
	ymaRNkghqq6WvZWVsAB5DCvclGR6LoUJreZQITVpeNIwCfE1oEjM8ZiEtDXBIOZIHqEzWgAUMRM
	RkDJH3d4cfmLmDgvKUMzKq67BPcQaDbGpm1wRADdMg==
X-Received: by 2002:a17:902:cf0b:b0:2c0:d94f:50c7 with SMTP id
 d9443c01a7336-2ce82879e0cmr178464175ad.7.1784038492000; Tue, 14 Jul 2026
 07:14:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1782909323.git.mazziesaccount@gmail.com>
 <27fb93d0e61704d495e3adf4ed614edac1642267.1782909323.git.mazziesaccount@gmail.com>
 <CAMRc=MccLRKb8ZjChcR7WK3TqV3=waSnKX=UX9LR=5hOT=_tsg@mail.gmail.com>
 <CANhJrGM9ciyBfgGWBwOM3kNmcXGSq4QVM6a6Js+wtbr9ANtSJA@mail.gmail.com> <CAMRc=MedLP3XBqoUv_zUr5gxBVc+gqwY3ozAyXagBhc_70Kykw@mail.gmail.com>
In-Reply-To: <CAMRc=MedLP3XBqoUv_zUr5gxBVc+gqwY3ozAyXagBhc_70Kykw@mail.gmail.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
Date: Tue, 14 Jul 2026 17:14:37 +0300
X-Gm-Features: AUfX_mwsVtiEKTfAVEpGQxTiufDOYn-DdkejDZRKfFW-BwMpqRjZhGNLCiRQJ_8
Message-ID: <CANhJrGOZQTG6j9AFse3+p_Yp=BweAUD3SQc5QV394hO-PQegvQ@mail.gmail.com>
Subject: Re: [PATCH 7/8] gpio: bd73800: Support ROHM BD73800 PMIC GPIOs
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@linux.dev>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Linus Walleij <linusw@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, 
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Content-Type: text/plain; charset="UTF-8"

ma 13.7.2026 klo 11.16 Bartosz Golaszewski (brgl@kernel.org) kirjoitti:
>
> On Sun, 12 Jul 2026 17:42:17 +0200, Matti Vaittinen
> <mazziesaccount@gmail.com> said:
> > pe 3.7.2026 klo 16.11 Bartosz Golaszewski (brgl@kernel.org) kirjoitti:
> >> > +
> >> > +     if (!g->num_pins) {
> >> > +             /*
> >> > +              * The BD73800 may or may not have pins allocated for GPIO
> >> > +              * depending on the OTP used at manufacturing. Free the memory
> >> > +              * and go out if there is no pins as then we have nothing to do
> >> > +              */
> >> > +             dev_dbg(dev, "no GPIO pins\n");
> >> > +             devm_kfree(dev, g);
> >>
> >> No need for that, because...
> >>
> >> > +             return 0;
> >>
> >> ... this will still leave a bound device in the system, I'm not sure we want
> >> it? The correct error code in this case is -ENODEV.
> >
> > I am a bit uncertain. This isn't really an error. It should be very
> > much Ok to configure the support for PMICs with GPIOs to be compiled -
> > and also very much Ok to have a PMIC with no GPIOs. Returning an error
> > doesn't feel right. Furthermore, I am afraid that returning an error
> > might hurt the system start-up? Do you see some really problematic
> > consequences if we return Ok without registering the GPIOs. I'd assume
> > that wastes some bytes but I don't see other really severe
> > consequences.
>
> But -ENODEV/-ENXIO error codes are meant to do exactly that - tell the driver
> core to assume this device legitimately cannot be enabled on this system. There
> will be no error splat in the kernel log and the probe will not be deferred.

Oh, thanks for the explanation. I didn't know this. The -ENODEV not
causing error splat makes sense. The fact that -ENXIO does that too is
quite surptizing to me. I thought the -ENXIO is used to indicate
unexpected failure in bus communication.

I'll go with -ENODEV in the next version.

Yours,
    -- Matti

-- 

Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

Discuss - Estimate - Plan - Report and finally accomplish this:
void do_work(int time) __attribute__ ((const));
