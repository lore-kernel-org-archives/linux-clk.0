Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2866C2E736A
	for <linux-clk@vger.kernel.org>; Sun,  6 Sep 2026 06:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788676297; cv=pass; b=e6KcjWdMdKesZ/9jyf41mrzWkxgqb8X6sDXB87ADTEoURtvm4CjE6ymJd3niPpslh9Mi35WPbhdNXX2edd2jr7fxOOzF06ESNDTJKOfMEEgBnOZB1lYkffLjp1HOMCUaFkjTc3P8+x4p21Hvi/JhG4jDiLtjvSmI89IeignsjyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788676297; c=relaxed/simple;
	bh=CowhusBJtkVgTxM1sMewOhXaozR9ys1uAKwcRp0eiRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZA5M65ce/UknD3Cb7En1vOxOhMoSgyndhfwwgxZXO3qm++Xfv9WphWCSwffJFI5A/oajCUalSlwHmtsRlAOQCyebiKYewcblY9fP8QvkdDVyUdxyn6Zfb6u7uk4/KH1Qz07OHgXmnB7O/g7P4B7wBYTtEPLJkBgVhqUKp2x9NRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=smCYzSvR; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="smCYzSvR"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c169ae1cb26so623922266b.1
        for <linux-clk@vger.kernel.org>; Sat, 05 Sep 2026 23:31:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788676294; cv=none;
        d=google.com; s=arc-20260327;
        b=PXq+CcW1dqceHvhjZ0GcFOvK3xCUchn/Bxm+ex6iK8RI8Mh+JGizH0/yJ2IJwVHpYq
         m2ZoyT0gCysFOynz4b8BmI+2g4trRrtDa9G1n7XIcDRpSyLYlo6jbULEAkmp7f561ERO
         vseJuGNP4xLTpD+xNHmXNTDUT3jDjxG0J1k+wKMsICYJGK7w1zP3pie4weQZuUOPqJYs
         1DKcdSsOPSTyfctsqaInRN44f4hn+LXZY1aCTRKi1l0LhZrpJxEO1nNuPS31nQJJbdq5
         Ju6ZZrJoibfa7n9Vo7sGPGNNGxshvdS6sTG2AbfP9gxnLvNLSjCfnTqwpIG+4V7Bo2b9
         Sigw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CowhusBJtkVgTxM1sMewOhXaozR9ys1uAKwcRp0eiRc=;
        fh=DVqI3NE+K50iJnZ9XRQJaSZyqvbYuiu1dttglAlyh0o=;
        b=Qw/HgQAVAMpN8N7jTJLbmSFsqWztEgSMyHqVPRJrowCPS3IQTp672TR7AxxzcjW8ul
         3ov80iECp60y6jgbGgnueW6KkNOtXh/Hck/2EUsfCI5Fi6WZG7m8R2vnhQ/A8UdEtGkh
         yreR+Adm8t+CbRAbPwvhD2xHrcBte3CMP031zreFXuGS0LXuXQHGvA0W/Tz5uXyVrBae
         i4/EqITduNM5I3kKwIHiImZuzKLufqwGrj603BSU6su9E+XUihVoItJ4Wf/dT5UrXCAp
         bTHczHTp5SWUQ+M4jd7WvbnJUchF/dnGZGoA+N3xdMITBiMnZGEUAuBHKhiO4hkK77ws
         jIJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1788676294; x=1789281094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CowhusBJtkVgTxM1sMewOhXaozR9ys1uAKwcRp0eiRc=;
        b=smCYzSvRIWBfyOm060hA8P2nxO1cPXn+tMrQedLXK3pL8t92rpxHQu/YLDg+w3Y6c4
         3i6r62mr9qDr8g/60eLyE2RlC1oTjYmUF4A5+FYyTf4TuleX2XC/Uwf4epuFjSC1kTVq
         wR8tj6tscVKV13tL72Fl9mSbL11TyMokifpsxkO5/pY89TCaKqHwyEUr6gtGNavWd8zv
         2VNp5cdWqc9WSFvSZ+djcg/xO7trwZwwcxSkdMXOFW7iCJgXlJ8A+8aadCUe+pt4gKxE
         XZm11gcUV+fOWYvE4AbzTw+LwLFEKvHwAcLd9ktHCyUHbBja1FkwxOBgtbgrExFCuo9o
         WtFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788676294; x=1789281094;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CowhusBJtkVgTxM1sMewOhXaozR9ys1uAKwcRp0eiRc=;
        b=Wewst+wcpSCuM+SS+uc1o+EiwhwbimgpOkOzefDFB8SKRyhNJolasWVEbgIzULTtm3
         ALj0y+2iwrm50/hJXTNKmDUQ/DlJzQ0lKNU+riyNG1oLrSGVogF0nMiv/c/6HShrG7HP
         Zyx4vjHt/9hzCK39OQtLlzySyu5Fl0Zk/LJHYr1k9YwLk0tvGa4f4O0usiKz/kal0ofE
         roK1Mawgp9bFYAmDlBA5WmzHK1X6dPLYesC0aMK5aEXpMIqcbZcgjeag5F/JYp/Fbvyj
         ZdqeILxwRZ4RNTJ1xzvwYEPI4WLcG2/M41RWmIvTBH4rCt4v0HC4UlZzX19RvIkaMWOc
         jkvg==
X-Forwarded-Encrypted: i=1; AKwUvBypW2AfKK+//UiRSOTZE7MBieG3GSQTrSLRFiUA1Gl9p1vsrSK8jneIYnx4bsuiigvGHp8hT1SOXTk=@vger.kernel.org
X-Gm-Message-State: AFuF++mfdUS1vlq4XoYtUFuMHELQxJrOJ8D5PTAvLAk9qAvMXzk6H1p8
	Uao8g8HGOOn1x6BYHd42xCIkW9sEMj1dbsu3dtYPP+fL9YJuVuOLd6tsKu5nEHl+6qmqawhJy79
	1pWg0tMIz57u6WeMlIryXJssOdgZoJxmKwQ41jQrstA==
X-Gm-Gg: AYBFou0apTYmKHA6FpzTyGqnfcijPbQtTToDLxxlfS21r+ou5oKA4rZBdE+xcxhktB/
	ChlfGXd2fzNqJUa5sRS5BhKYB6/+9ARglmxUGhoeqrwvNj/l5JA+zICDWh/iW12p6on9EWLgyat
	v1y13ONdbcwKQid23abn7uotwCmUuz+BHjPSnjrzDV1rgJG+94Sit9S9pQ2s3TjrkRm7wuqu2Wq
	DwKPWHfKweEFkcSbfxQwTg9DK8jU/zlKsYpq1gP/ufp9r00n/l4+/1QJJx/7+Pw4v+h5uVeBF7V
	xgDTYi81BdBkTPtuLQegfBa3WOPQLf/7wAPNqqDpcMj9OMiMvFEUIP9aYXOZRo+CK6lL32S/1Bm
	LG/0=
X-Received: by 2002:a17:907:c80d:b0:c25:f7dc:2d5 with SMTP id
 a640c23a62f3a-c25f7dc0956mr720225966b.22.1788676294144; Sat, 05 Sep 2026
 23:31:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901234351.190506-1-anarsoul@gmail.com> <CAKTNdwFqSBt4QVCuYJxTyEDsxkW96JbUirFNAgJYWVLHzGpk4A@mail.gmail.com>
 <CA+E=qVcizyQZytw8M6DA72YGrRDDNx_cCvYj565zf9wjMWh8tg@mail.gmail.com>
 <CAKTNdwFQvKtHQA0JD-GAq3bgr5Brq2NyLfccenkHcrKcjeptwg@mail.gmail.com> <CA+E=qVcwtnU_Gg6_oFmWqMpCEF8vOvB_G+H-ihfbiAr0PpFUJw@mail.gmail.com>
In-Reply-To: <CA+E=qVcwtnU_Gg6_oFmWqMpCEF8vOvB_G+H-ihfbiAr0PpFUJw@mail.gmail.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Sun, 6 Sep 2026 10:31:23 +0400
X-Gm-Features: AcwNN1WMMbAQ2CuZOa8tZDe3nBXerl1P7S6WAcKAg4su3ebkGU8XnfBv_73Boic
Message-ID: <CAKTNdwGTacFvn5BEN+iu0OBG2BUas7Vfj=YYF8OhAhNq-9kmyg@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: rockchip: rk3399: add 85.5 MHz rate to PLL rate table
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Heiko Stuebner <heiko@sntech.de>, 
	Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 10:09=E2=80=AFAM Vasily Khoruzhick <anarsoul@gmail.c=
om> wrote:
>
> On Fri, Sep 4, 2026 at 2:36=E2=80=AFAM Alexey Charkov <alchark@flipper.ne=
t> wrote:
>
> > > See arch/arm64/boot/dts/rockchip/rk3399-base.dtsi, hdmi ref clock is
> > > wired directly to VPLL, and dw_hdmi-rockchip calls clk_set_rate() wit=
h
> > > pixel clock for ref clock, see
> > > dw_hdmi_rockchip_encoder_atomic_mode_set(). So at least in the rk3399
> > > case VPLL is supposed to support the required pixel clock. Without th=
e
> > > first patch 1366x768 mode with 85.5MHz pixel clock is just rejected.
> >
> > I strongly suspect that the dtsi doesn't describe the real clock usage
> > here. The TRM for RK3399 doesn't show any "ref" clock for HDMI, and no
> > TRM-documented VPLL users look like anything that could connect
> > directly to the HDMI controller.
>
> See "1.1.11 HDMI Interface", it explicitly mentions 13.5=E2=80=93600MHz i=
nput
> reference clock

Which matches the pixel clock (dclk) range for HDMI 2.0, so nothing is
disproven yet

> > I believe something is hardcoding the divisor (or leaving it at the
> > power-on default) in the actual DCLK of a VOP which the HDMI
> > controller uses, instead of modelling it properly as a mux (frac/div)
> > feeding off VPLL via another mux - both perfectly representable in the
> > clock framework and already envisaged in the clock driver, making the
> > PLL table patching unnecessary.
> >
> > Can you please try re-pointing the "ref" clock at DCLK_VOP0 (or 1,
> > depending on which one your HDMI controller uses)? Your clock summary
> > already shows that something is assigning its parent to DCLK_VOPx_DIV
> > and the latter's parent to PLL_VPLL, so rate changes the current
> > driver code does on VPLL propagate to the muxed and divided downstream
> > consumer as a side-effect rather than as an actual rate request.
>
> I don't think it is a reasonable ask. Wrong clock for the HDMI encoder
> would just result in non-working HDMI output and no feasible way for
> me to debug what is wrong.

Hope you have a serial console or ssh connection to the board. If it
doesn't work you'll know soon enough.

What I'm pointing out is that the clock setup implied by the current
dtsi doesn't make much sense: VOP's dclk is driven off VPLL via a mux
and divisor. If the encoder's pixel clock is truly driven directly off
VPLL then Rockchip designed the muxes and dividers for nothing, as
they will always be no-ops. This doesn't square, so something must be
wrong, and I believe it's the dtsi.

I'll be happy to be proven wrong here.

Best regards,
Alexey
