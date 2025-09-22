Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425CB224D6
	for <linux-clk@vger.kernel.org>; Mon, 22 Sep 2025 11:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758538952; cv=none; b=MEea77WWe2182/mhY3lA753VhtpEZY210thN8xIYuegj5+VOlUxgkpliotS8yWqSw9T+S/TQe19p883xHFtqeWg8bzXPee2nnhNTCntfdvFoClRwM+Pek5Abtwze7cpBNWkl34u+IqWjxvd9i+v0FWCX1q71xrpWOMj45+z8Xxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758538952; c=relaxed/simple;
	bh=+li5jZLjno+mrEq1vnQPMSZK9xNs3cFzE65Gz2fSCdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c26A+/3zrqdeTmI88TxRBn4Su3LJs6qKSdcB59fgRyLChpnkJ0K4iBRnzro/WoePhcbY4iCmk0AXSairlkNVzXcmE62EJWevnKc17ekv7Gk+Hyxp2sZDOdrZlG2gvMw+WyQrBEARz+OoNJXpO1Hhniuz3PQ3L2lQ5e8/2lj7K+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=JIxMuHoM; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="JIxMuHoM"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-279e2554b6fso4499915ad.2
        for <linux-clk@vger.kernel.org>; Mon, 22 Sep 2025 04:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1758538950; x=1759143750; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+li5jZLjno+mrEq1vnQPMSZK9xNs3cFzE65Gz2fSCdQ=;
        b=JIxMuHoMddsnkA1HGxLhdLba+mklvPNgYLRC+BBFSA8TyBjRpqQ0WONpGo6lwPVDWW
         hrwz/ALcbiuObkFbu65rtkB1ivDfSRA7TOvBdhaVHnPHQt4AMqus0ihUGncP7epLjnYl
         4PVvvgSfRFYcpiF8ApwmcTLPiLHcOeYFlObL97B9zn5xYUagOgBPuONQSgn3NrGO8a0m
         wDZACKNByxr7g61kT2ILtcFKBrH/mqO5qCAKEZXaDfCH2RQX1mO60GuQItahtyr8U8wy
         OMbrltcLjguCUXX1kOfamT4wA0neEr66R6PqYE5+e0ZpnrcdAe+uXS7fMZPHHGzwMjrP
         0TYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758538950; x=1759143750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+li5jZLjno+mrEq1vnQPMSZK9xNs3cFzE65Gz2fSCdQ=;
        b=i0+FwUmNdr/V89Xu9j7imODEn16PYjFjJ/VlHS4obzuItNoPTkdV8PoN97K1Nb9ViS
         PaO539Lz7fa9BWByPkDO2qFZGmGZUyj5DUSL5Ias/wY6667UrVOR7sZGVMScdPRZ82za
         nkTinVpo0AItYjPOUEab5acWstyQk1jgJlV36y4dGdbcwOwcEnvypdAw2InNknIFNJnD
         y61ZDXQX+ifR22DtCLzMZHkCPVHFeaXFoeMSJ6wIS4fos6VvxkPjq4q3GCEBvf250Bes
         lfuRhLahyGF7ex9KYOwLn/wqb4Gok1YTrfv2+Hnl1i93yJmdjKwPUt/o32ufHm/dd45K
         vcnw==
X-Forwarded-Encrypted: i=1; AJvYcCVUBnnuvTqwSc4ArdvQePK+2hOt2AU2pilr2/IHcGkw0l5C3U9uvUldUG9PhpfYMbSbP3nqOVNFT6M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeNK3wZlhZTV6od7WUr6m22TPst6OuaBR7V3xI1eEhXByJBgnF
	pwnTe98U/lHVeWMTb0uho4bJA9B4wegq4kpGAt/qY4ayJa6kaqSsxC/uWoktKbRxTHD9KGE3VJP
	g1TgR5znHCEXG96WU9gqgDanTS9/KflE=
X-Gm-Gg: ASbGncvokftNO09Pq66eBgHg7vORvpQ2IIEFyyZDb4ViRGVZZ8Pg2gy5QnhS8991fNB
	8JKXaVtc/WLvbsb+yOYwCXod6XBdQOd0dU5htpKqawPEPFAPA6LoZEWLQaynzRzvKlSk92yCFiG
	Hjw6tEZuWzLtQG3pJHDg1PNt8ZPgjq6DntYajOS3ruFgIbA+fV5gqf1MV1YSt9hMTnQDaLfIZyP
	CrDfRt4hryNyHYLE71O1yNqVuydkTuL0WrFvCbB
X-Google-Smtp-Source: AGHT+IGmUtMYlpRUtriAGyHEqqhD7tsNW/oErA13JErbQr7Uwk/4xc/l1EjiIRO/SRnBAHwmetXhu5CvO/UV+bZ8Paw=
X-Received: by 2002:a17:903:1c3:b0:275:c2f:1b41 with SMTP id
 d9443c01a7336-2750c3e5feamr49668395ad.53.1758538950329; Mon, 22 Sep 2025
 04:02:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
 <b88a947c-7074-4fed-8283-c278b573a7ca@sirena.org.uk> <CAFBinCBe3LhN+3beovFVuWPpe3pDF5P1wSt7nPjm=ykRAx4zzQ@mail.gmail.com>
 <1jldm855cd.fsf@starbuckisacylon.baylibre.com> <aNEZcNbSfJlkP7Ra@finisterre.sirena.org.uk>
In-Reply-To: <aNEZcNbSfJlkP7Ra@finisterre.sirena.org.uk>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 22 Sep 2025 13:02:18 +0200
X-Gm-Features: AS18NWBF_8d672goWt-c8mlWPO6qTZjdU-iJtORQkODp_RuBXGukLUDReQvFfGA
Message-ID: <CAFBinCCn-rBNoCiTkgn9__NyujAbPOeEdhLskbWwg_onRh=44w@mail.gmail.com>
Subject: Re: [PATCH 00/26] clk: amlogic: clock controllers clean-up and factorisation
To: Mark Brown <broonie@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 22, 2025 at 11:40=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Sun, Sep 21, 2025 at 02:59:30PM +0200, Jerome Brunet wrote:
> > On Sun 21 Sep 2025 at 14:21, Martin Blumenstingl <martin.blumenstingl@g=
ooglemail.com> wrote:
>
> > > A few days ago Marek reported problems on an Odroid-N2 and provided a=
 fix: [0]
> > > It's not queued up for -next yet.
> > >
> > > Please give Marek's patch a try
>
> > Being on the A311D as well, it is likely to be the same issue.
> > I suspect you would not see the crash it without earlycon indeed.
>
> > The fix is in clk-next already so linux-next should get it soon.
> > Sorry for the inconvenience and thanks for the report.
>
> If it's supposed to turn up in -next it's probably easier for me to pick
> it up from there given the firmware issues with the board, though there
> may not be one until Thursday.
The mentioned patch just landed in linux-next
