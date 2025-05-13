Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1706E2BF3FD
	for <linux-clk@vger.kernel.org>; Tue, 13 May 2025 16:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747153209; cv=none; b=Vb/9wWp8XcwyQxXGiEKzFhWfNWu/d9+VkZjoUG7AwGAedB0SOJASeWfRayY3SSSyOeFNZp+q9oUx8rVsvTpKvI/xAgYYKKcvep4Evnpvh3CMR6EwJiUGPHcIZmDy8jjwDKh+bbpSqY/xlxvTuoEwy9zQcIMtoS5olFo8jrkFxHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747153209; c=relaxed/simple;
	bh=cWhfEEAw+tV/nQS2PrbAq7o6mdRDmYJ67CQa4j3Vk2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fxPgCBSZkUGBeFUU4Q6YPkexnxYwdo3Pjxq6TP7JUYBeeAlFG/Z/vFOeByhMXnpD8vlE/p2XI+icGGfo7PXzAEOxPgDFFZnJh0sEKfIeGDFTVnvIhsWAz1N4TW9qcbi8306Hd9oTpJSS/cE5jiM2gGv5zc0Sl4s7YjKpJBYcq6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lessconfused.com; spf=pass smtp.mailfrom=lessconfused.com; dkim=pass (1024-bit key) header.d=lessconfused.com header.i=@lessconfused.com header.b=PFI7ywq9; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lessconfused.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lessconfused.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lessconfused.com header.i=@lessconfused.com header.b="PFI7ywq9"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22e6344326dso58974765ad.1
        for <linux-clk@vger.kernel.org>; Tue, 13 May 2025 09:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lessconfused.com; s=lessconfused; t=1747153207; x=1747758007; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Okg4wdYw4WB8DO+V7q9yh5s+wPKhLzpza5jWmCmNzLM=;
        b=PFI7ywq9Nxu7618sDhq/hrQh7AHQ/+myKdLHbqzke1KJi5dH3LKQhujwt64wR5Qb63
         PpSPoLYxtskCwVB02+GPWh3zkMnhKfDv9XPAQASlWO9zzhr6GyXJXLZA4ZaVQpYG5sQs
         6UetmO7zcnd2Sd2ZUsZj/mtd2112cOEM35PiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747153207; x=1747758007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Okg4wdYw4WB8DO+V7q9yh5s+wPKhLzpza5jWmCmNzLM=;
        b=GznZSrUm/x3XvLlvJttGOnKWs31w745MX5wI+fi98SiLWC3ySx2+EkkctA4ol/5osi
         HtfxDa/QBxOgFp2jhsIqM+bOyNbxUbf6RMYpC6ImHyBaNn9UiKziiPLC5dhg+eRMqPuB
         nX4yNRe2xIhmADDZru5bZ5QzwYbZgMuiklZCz32xkBz0AsCe3rIhp9wo9VlYmK6SqeBF
         lLaKmG6kvXO4Ug1/anWVbEGWoN95RApFEQRL1fKuXey3e50/GxhCXKhYZN3yzpqyQzje
         dQZPt55V+5BHRoZN97jxI+HcdBgioWBcz3i26YZ6naVD0B5FBtb6mDgxPb0BlQV+27jR
         z3uw==
X-Forwarded-Encrypted: i=1; AJvYcCUs40TXsRnb5qiShhYQVO2uhhEquB6ipc9EyJlWQiZ53qAyFzD0PcnjQKTiUWcp7NKbioycIu4rbk4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yywx0mcqH4l2A+tSaEWc1tBpUFMqM1rm1KC18iAtjKe/DW7Rcir
	jcBmhYf4XynZCtk/6zrsYOlEvhhtziiQ8xjtlFHK8IKu+6Ufg0lxoFobR1mxAAjJtpPBWVC7HCb
	wFVpmDGfzCuystCJvGIhYQz1AJ8ztsLyIDD1UvQ==
X-Gm-Gg: ASbGncv6KnoK/EfH+9a+6RS8ztHajSvHpOxMz2Hd9yif87DIFSHnakq8oT+/TaGfSuv
	a62KE9/B/n1MtKNO2zJSwTxT8Rfylji/4QrMRN9swv4z14Y+Lx6MMMpkb8lNHHz41g/S4FuTerQ
	x0xSVW0p5QgZOcOSMFXYCEELERTtHuSRpdZYmEGDRrPGCp65cZhVUSwDro8+i04c7nQcQ=
X-Google-Smtp-Source: AGHT+IEFiZZLEVm8p4exZqTgRnoEBDvu1NNpn5CecmgOUa1lbzow7S7xDOQ9y/PS6u/6mPTPI55hbsmTlWowpXVMs6Q=
X-Received: by 2002:a17:902:d492:b0:224:2a6d:55ae with SMTP id
 d9443c01a7336-231981d284emr53485ad.48.1747153207290; Tue, 13 May 2025
 09:20:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512142617.2175291-1-da@libre.computer> <1jecwtymsj.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jecwtymsj.fsf@starbuckisacylon.baylibre.com>
From: Da Xue <da@lessconfused.com>
Date: Tue, 13 May 2025 12:19:55 -0400
X-Gm-Features: AX0GCFvX20FlZeuRo40HJUU0H1dNyPENU2uA3HGGuO4tfwuq5uvg2W8hOH9cVak
Message-ID: <CACdvmAgNVf8jtRj-jONwunGXhheaizUEEyB4rz5tpqzXb6hKqg@mail.gmail.com>
Subject: Re: [PATCH v3] clk: meson-g12a: add missing fclk_div2 to spicc
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Da Xue <da@libre.computer>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, stable@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 3:52=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
>
> On Mon 12 May 2025 at 10:26, Da Xue <da@libre.computer> wrote:
>
> > SPICC is missing fclk_div2 which causes the spicc module to output sclk=
 at
> > 2.5x the expected rate. Adding the missing fclk_div2 resolves this.
>
> I had to re-read that a few times to get the what the actual problem is.
> If you don't mind, I'll amend the commit message with
>
> '''
> SPICC is missing fclk_div2, which means fclk_div5 and fclk_div7 indexes
> are wrong on this clock. This causes the spicc module to output sclk at
> 2.5x the expected rate when clock index 3 is picked.
>
> Adding the missing fclk_div2 resolves this.
> '''
>
> Is that OK with you Da ?

Feel free. Your description is better.

>
> >
> > Fixes: a18c8e0b7697 ("clk: meson: g12a: add support for the SPICC SCLK =
Source clocks")
> > Cc: <stable@vger.kernel.org> # 6.1
> > Signed-off-by: Da Xue <da@libre.computer>
> > ---
> > Changelog:
> >
> > v2 -> v3: remove gp0
> > v1 -> v2: add Fixes as an older version of the patch was sent as v1
> > ---
> >  drivers/clk/meson/g12a.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> > index 4f92b83965d5a..b72eebd0fa474 100644
> > --- a/drivers/clk/meson/g12a.c
> > +++ b/drivers/clk/meson/g12a.c
> > @@ -4099,6 +4099,7 @@ static const struct clk_parent_data spicc_sclk_pa=
rent_data[] =3D {
> >       { .hw =3D &g12a_clk81.hw },
> >       { .hw =3D &g12a_fclk_div4.hw },
> >       { .hw =3D &g12a_fclk_div3.hw },
> > +     { .hw =3D &g12a_fclk_div2.hw },
> >       { .hw =3D &g12a_fclk_div5.hw },
> >       { .hw =3D &g12a_fclk_div7.hw },
> >  };
>
> --
> Jerome
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
