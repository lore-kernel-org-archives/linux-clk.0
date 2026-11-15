Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794743666;
	b=S3R8rJ/b5VMv72y+KOhAZAt6lCMzYs2YSggQB1XNBZGspQHOEvn4xsPBw2B0zRo45dCN
	 mFVRv7puJ0OQpet6nP0B+oM1Tuc7Qx3B4D+8ZB2M83RSzLpOmzkIpEVTPlQDcww7OxwEh
	 lVSdOLdvsnBzUjf0bEDZYKpWUChhzE1XKiv/KBv/4fUhWA6FpP7j4fpkuFSbNld0J4QhP
	 6Suri2o00BwqXuCMU4WwfKETHkJrN/BHJQ/2guQYY2FvC+gjlIYSPsD0dFeq4XsKfIK/y
	 VZqSIQ0kcyKg+oegdxqVbT9140nkKZzq6FgCHcqMQd/4YTMP34UYroIkhU8NzF0L7/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794743666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oqFc1dkJ0uhI3kAkP/ntcsru7jDDN6wYlX8lnvW2kQA=;
	b=G27iQ0zeA5jORPJC7qw4cZsk4qFsvYMpC2QjNLIS02giRAxzGkxcdqRHVKMzZ6ZEWd+P
	 NlzEga84x871S3dFmjgACXMwuCKfKA4lFen5PEFt/NX8Vds2qd19OdbANGWbplFM8+0gG
	 EJEsMw3xljkHhCYVTFp66swhWguwx9BBdx6VaUkZS7qdsgBPsG0I6cD//mbAugqDZz7b1
	 8grBA6Xkrm15NLCzGcW3DGDx2JYLvx0XNZ/L4kGS71QjDlnZx9igHwCsmkp1yDbF6nja4
	 wlKtx8tQrSJ4eeaNLyiMHGk1FhKJaiDaUuF+8fZGwayikmjmzFxPBWHErkCByx1ooSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tTrBdHJA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807EC606A334
	for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 11:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 807EC606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tTrBdHJA
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3282db206d3so7559187eec.0
        for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 03:54:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794743666; cv=none;
        d=google.com; s=arc-20260327;
        b=auTpHrL70CxvtJwHM1xRxdI08yhNhkhHpz2cNbg2/66NewWkkoB5ujIVXrjfsBpjPr
         wc7ijx/UvFkbFQEpBIg1wiKuSBkbreqaDvqxTPjysxGimQdgln2sB+mvTuZhsss1L/n+
         l1ZZHJ7ev4UqcndX/Ni8MpENiupBMqJSb+kfucemZEOLXcMbnSmugljHWJufb4eLYU15
         JLOTec6g9J0E4TpxOxjQpN2GvpRJX5SlzHMRTBBLlkOMzzNIulrqtMPBeij8cBsji5e8
         775pRGPL+GBtsiWjOk1YqPDFKHRTOVtMgICoKoLN6j6WSVnKwXCPVTCdKxvI5p33F2gp
         5Qrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oqFc1dkJ0uhI3kAkP/ntcsru7jDDN6wYlX8lnvW2kQA=;
        fh=3OW6o7ZFqrGm5nGqlbt4t29vRsN02hLhnnch+vQTG9o=;
        b=Sdq15GZWj0oPputdeI4KFAAa9nmWbYVPUqmtdrt2XjNbxi6nZjpUjsktrcoT+wXuBw
         V3pGkvKQdtPyQ6v0H3S7HNCuRcsN0ZpkWHnUaJvhJ8x/CRWrIW6JlWWu90i9kP+XYPIN
         Ag8ag6FG0vDGFyS4VzrZqp4GLyPTMbutjkFifX1NCOcK0mk1CxwM1g02QmMuUvljFavz
         +Rppd7WWa62Xxf7oH1KromiFAinKd1UNC6Ip5HiXmVPzZEQev9tQ2XvTSPEoP5C0Vaam
         vum/OBd0HPhX5Q9k/V7J8HFt8GB6wYbHugYAFXEyOeiby47NzluZInloLqdb3T05Wgc6
         SJiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794743666; x=1795348466; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oqFc1dkJ0uhI3kAkP/ntcsru7jDDN6wYlX8lnvW2kQA=;
        b=tTrBdHJA3EGwmoZUxQrkbZUVwQBHP3AVn2M7YykEYWfQzkdbVbo06Dt08bxI7pef9n
         2s5g3e6ZjDuUdLINOz/16cOa2/67Qga+pbtgDTbQFxvCV7/wYiN2HvnbTM9v2KHTKMDn
         lXhXKg70kdruDYacOcw3OrnPpwE9x3GVwE1cjyM4WQkTet3p2ruaVtk4iuD0Vg5W+40t
         KP2+dPxFKTHI5qnPljVlljIzh7r9ZubPmJpP/c23PhesDSTedONJirXt706HnDYtn2+I
         UuhxxKVd9i/wMgFDGMAuCSok9bEAJUAMXM1t5xxd2EobaTIgnXd0jaE5l5G9qIC9Zxxb
         fIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794743666; x=1795348466;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oqFc1dkJ0uhI3kAkP/ntcsru7jDDN6wYlX8lnvW2kQA=;
        b=BsOvWKZtOYSbaMAjp+Qa7lOjwPN6MIBWWy787XGIi37S5rXeOIz4kJqyX0ykZ/ZneD
         0L8ERTUtMGYTI3tThnNS6zdaX/nKQcS04D6l+Cjc7ds8V4EulRUzITLsCw5KfbgyDNQW
         AcTF6xwuv5KJTPuRDmc5SFEgoTT+uY5ej8Ryp12LjoSMqztax+x00hze5LHA0l7GAimM
         o5OzJwQKozHYZDU0OqxXcg/m2eAiWE5Smsyh4+jR1edgePe6PnjdOd08DvfrPHBwxS1c
         y+QzEYhkwEr48jJxFMr5neUtQntydp8siFjMxFBqiikQuWvs2v9BabGZNJt05CTS2BaI
         T37A==
X-Forwarded-Encrypted: i=1; AL+hErGv26u+hI0KKd/VQ2+TWzl7LbSTLnf7o2KA3cjbbTCe3MiVbIMK72b2y8tTwkDiq0vTsNxF/vSxCTc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dz1jTFQ94+VP5z6UxBtHJayvN9DGqWD1XEYONUKIt3NBEtL+P
	5OkpYK/U14Ed+uPitWNOwcAHjJ54NPR99NrXWyMsCpRFEWtw5UqMGBvUZes4m5v/6Rv2czd0xv4
	GZ+KqO+NaRrXq4fXikDCcdS6n956tLjE=
X-Gm-Gg: AYBFou34tRDTCiYcho+Mzin9tRvVr+pZ2BO2cxmjMyCG9CM5PYR7l5tB0ReZWdvyFYf
	gzdkd6G0Dbjb09hNOifdVLMDwiGOIaflMPcfTt6n9e20DavUHMUrjrMnGZZOu8lgelBN9HFkX6T
	wB0OOJ3HJf0LW2X+aV6t4RdpyniaMWgKw/5UEI5LYMzJOCqSAPJUDtf5bsNNIcx8BOGdpou19Zd
	BkhM/sQHl8vYJR4M0iMdtJ1TpSGOm8jaYYEPh4zANnXEpB2CPuM/MTsPpqH9q/2KNC1EDGORNbV
	m0JLQmMEXrQ7ItITBaHkl2Bq8FM/YgjhyW9l1ymSviCBmq1/pv5ypAE6Vojj+OFnlLc/sNR1TwK
	ADstz7XXAMMx8nwy4o8iLXTrHcQG8D9csFIiILDHmaNlh0u+B3JzGX8uYEOSbt82MeAqk9+2mX4
	9+DpX1CsLgt4T1RvwCTOyviv0mXg8FtA==
X-Received: by 2002:a05:7301:52c5:b0:36c:a281:1bc with SMTP id
 5a478bee46e88-37966a5ba74mr7873015eec.16.1794743665605; Sun, 15 Nov 2026
 03:54:25 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113145708.261530-1-clamor95@gmail.com> <20261113145708.261530-3-clamor95@gmail.com>
 <179474058020.3790083.7531788945003507652.b4-review@b4>
In-Reply-To: <179474058020.3790083.7531788945003507652.b4-review@b4>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 15 Nov 2026 13:54:13 +0200
X-Gm-Features: AclHuK-EzmuYPh1U1Wrw3n2IgQZOy9QQQk19QQZyaFRGFCYZ5HQfcbePna83mwQ
Message-ID: <CAPVz0n154OuYUG2RObrdh4TmASjRhKF9svF0Z=4iCrPyyNt0pA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] clk: tegra114: Add CSI pad clock gates
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, linux-clk@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 15 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 13:0=
3 Jerome Brunet <jbrunet@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> > Tegra114 has CSI pad bits in both PLLD and PLLD2 clocks that are requir=
ed
> > for the correct work of the CSI block. Add CSI pad A and pad B clock ga=
tes
> > with PLLD/PLLD2 parents, respectively.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/clk/tegra/clk-tegra114.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-t=
egra114.c
> > index ec537efac692..08e425365469 100644
> > --- a/drivers/clk/tegra/clk-tegra114.c
> > +++ b/drivers/clk/tegra/clk-tegra114.c
> > @@ -1041,6 +1041,16 @@ static __init void tegra114_periph_clk_init(void=
 __iomem *clk_base,
> >                                            0, 82, periph_clk_enb_refcnt=
);
> >       clks[TEGRA114_CLK_DSIB] =3D clk;
> >
> > +     /* csia_pad */
> > +     clk =3D clk_register_gate(NULL, "csia_pad", "pll_d", CLK_SET_RATE=
_PARENT,
> > +                             clk_base + PLLD_BASE, 26, 0, &pll_d_lock)=
;
> > +     clks[TEGRA114_CLK_CSIA_PAD] =3D clk;
> > +
> > +     /* csib_pad */
> > +     clk =3D clk_register_gate(NULL, "csib_pad", "pll_d2", CLK_SET_RAT=
E_PARENT,
> > +                             clk_base + PLLD2_BASE, 26, 0, &pll_d2_loc=
k);
> > +     clks[TEGRA114_CLK_CSIB_PAD] =3D clk;
> > +
>
> Change seems ok in itself, just a couple of things I'd like to check with=
 you.
>
> Seems both the CSI and DSI can use the PLL D and D2. Can they be used con=
currently ?
> If yes, are you sure you want to add CLK_SET_RATE_PARENT which the
> DSI counter part does not have ?
>

CSI pad clocks are used only by CSI and CSI does not change rate of
pad clocks. Saying "DSI counter part" would not be correct, DSI mux
switched DSI clock parent while csi pad clocks do not touch clock
layout of CSI nor DSI.

Same layout is used in Tegra30 and Tegra114 inherits it.

> Also the DSI get the PLL through a fixed factor 'out0' but not the CSI ? =
is it something
> you have checked ? it just seems a little odd.
>

Yes, out0 is a fixed div2 of DSI clocks and that is code reflection of
hardware. CSI pad clocks do not have this setup in the hardware.

> --
> Jerome
>
