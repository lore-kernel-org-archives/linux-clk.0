Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFC13C09F5
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 07:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787211650; cv=none; b=G70TY2EnVF0yuklwI+Vt7GVVR1LPPIZk4HI75e5EBtoxmYbRxyIAh+7pGuH4oVqk0LGdkKNB+qm9ownp4BujqVMjJERwVkFrq+ofk674Wa7fJaiAN3T36MhPN+yMCufWOPY49cMJ9Un4i68j1qfi9aiptUzHNM0l2NWMlQAfCR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787211650; c=relaxed/simple;
	bh=MapOTuwbJCCiUZFtCGgs2M9xTj7+mwKoeNjEtUvxTk0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N+Y9pl136TM70e1ghlIDu73bJbOdjp1JJu4iB5xkquGP9uF15F+JotdCqExE8CkEXx9Ah7Q9qZ5ivM2x5nPwiY32LdJXVFhSv0bgz6V7TfERo6+7hMptiQ4H/uYY1AEJ1FADPGJ3lvn/Xh79Kc1HMcTPRpxrZ8+t1tIhIzpIPHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5bf9506704fso886070e0c.2
        for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 00:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787211647; x=1787816447;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FdPpwGypGBUsvrsSvDXIguPPL189yxwSySBc8xM9coA=;
        b=WLFx5EroF1pUHfPpi1ST1L8RDLpYIQsVV8yg1sYfkfgw3GV3MfVef05GBz+9ARHdv6
         A7krITAtc1gqXGfuUooEi/Qs2tE5OVAO/kez+JExHJAhmO+MU7naQd9q2ZRNovRN/yVm
         DakCb5W8Weh0hirXzbVrBpfIpU0mzKP0gpJhQRT8GSdKrMt/Fyahd4AhJLP0EoHRgTqf
         KEOL3sWnXwMT4VNAVXDKjLDWK44lDqPIFSJyJ8PjQQpVFg6Zs2vuuXFNGA1a9zWenkJS
         +iz4Td9etWs+P28OeqU5d8ythEaU35voing6rmE3hukbnhkPxkXfvvGrr7/MNuTxTRyD
         qNkA==
X-Forwarded-Encrypted: i=1; AHgh+RobnYZYcpzFHDHwgsrzloLhSnudgT10rjkvaN9DG8Om3nweoAxwqIoATPohMgtL8a4CzOwVu5hjbZo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2YwXWxZ+F1/ugdfJxZsy8EO/62L5lOo1v1rJ8V0cd1wEMeeOZ
	w4zv5lirC8dsiBnv3RzcVK5AV5B+dNU0zpbfpCta7VbaPnuoe8wFWikwgNj0SWJL
X-Gm-Gg: AR+sD12VaGY9QxVjWA62mweVMbyfwvH8DpGlodLaKSdP90H/t0rWXqUp5ic0FElFIDe
	sWXmbjrc+t+OPpkp44NxKy0kqtwhPp2WbsIiKY5xWmnrsXcjl8fqggJiPuIn/MVgPVJCoINawo/
	DD7IC+ImRXftT1KBAjJ5iM/T4FDe4jdjbOEseHmavZYvtC/s3r0UWy8IFLfxufgd8EiSv0KGlUM
	3GqPC9GGkkpZ2n0ge4pz658s+hOvUSRN7uR0utFfQhSlstZgWSgg1UeTVGXZxpCdJnk1cOp9dDL
	TrsR0WLJ+ugrYobyIaldRNh2mffOK6hZ/YuuWY3lTIdiQGmyUC1ThCt6L/DhrrWrLUWPvDQmNlN
	5j07O7NHX3b3v2gjWmmJP/qL3Gw2+vYT3639KI+yKhdwAVVmkq+yRxHDg908JtyJND3d/On8fxb
	WZzMaVY9GcbeD2dXLoRBNVl5dA0U9RRRbIfjZjrToenagkPsSWKSCN6AMhGyW6y5HXZo7XHkPiO
	xuDLJ1c9PPoDzTH21yWZ8a8eGXzYg==
X-Received: by 2002:a05:6122:46aa:b0:5bf:a179:b2be with SMTP id 71dfb90a1353d-5c5e3e09666mr4214514e0c.7.1787211646626;
        Thu, 20 Aug 2026 00:40:46 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c5e2857954sm5118435e0c.18.2026.08.20.00.40.46
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 00:40:46 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5c2c0e261aeso759705e0c.0
        for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 00:40:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqOiQukff10kCX2QuI8dSwRrVn4f7ScGVxJTaW5xjIFkk12qCmTn768TcrTNfEul0w0p98RsWTZ8uc=@vger.kernel.org
X-Received: by 2002:a05:6122:882:b0:5bd:86ac:a847 with SMTP id
 71dfb90a1353d-5c5e3df88c4mr4331225e0c.6.1787211646157; Thu, 20 Aug 2026
 00:40:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787165329.git.geert+renesas@glider.be> <302584628c4c0699239a0218376fe1c11cdc8944.1787165329.git.geert+renesas@glider.be>
 <20260819191316.8F2F21F000E9@smtp.kernel.org>
In-Reply-To: <20260819191316.8F2F21F000E9@smtp.kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Aug 2026 09:40:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWpHicDvj7tvKJB7SCnVJ2gRmidUeTwA+hHxnhsXs7h=w@mail.gmail.com>
X-Gm-Features: AcwNN1Xf-k2z34g_6wcrswrRilyDIcooOAsIPdAyo4-A___PZ7FNnn6TGkqYEkE
Message-ID: <CAMuHMdWpHicDvj7tvKJB7SCnVJ2gRmidUeTwA+hHxnhsXs7h=w@mail.gmail.com>
Subject: Re: [PATCH treewide 4/5] iio: frequency: adf4377: Make sure
 clk_init_data is fully initialized
To: sashiko-reviews@lists.linux.dev
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	neil.armstrong@linaro.org, linux-hwmon@vger.kernel.org, 
	Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sashiko,

On Wed, 19 Aug 2026 at 21:13, <sashiko-bot@kernel.org> wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Incomplete fix for uninitialized stack variables: `struct clk_pa=
rent_data parent_data` remains uninitialized on the stack, leading to a ker=
nel crash during clock registration.
> --
>
> --- Patch [4]: [PATCH treewide 4/5] iio: frequency: adf4377: Make sure cl=
k_init_data is fully initialized ---
> commit 99e024a77f5bce5921d3c6b46054263aa450610d
> Author: Geert Uytterhoeven <geert+renesas@glider.be>
>
> iio: frequency: adf4377: Make sure clk_init_data is fully initialized
>
> This commit initializes the clk_init_data structure in
> adf4377_clk_register() to zero. This prevents crashes caused by
> uninitialized fields like parent_names when CONFIG_INIT_STACK_ALL_PATTERN
> or CONFIG_INIT_STACK_NONE is enabled.
>
> > diff --git a/drivers/iio/frequency/adf4377.c b/drivers/iio/frequency/ad=
f4377.c
> > --- a/drivers/iio/frequency/adf4377.c
> > +++ b/drivers/iio/frequency/adf4377.c
> > @@ -999,7 +999,7 @@ static int adf4377_clk_register(struct adf4377_stat=
e *st)
> >  {
> >       struct spi_device *spi =3D st->spi;
> >       struct device *dev =3D &spi->dev;
> > -     struct clk_init_data init;
> > +     struct clk_init_data init =3D {};
> >       struct clk_parent_data parent_data;
>
> [Severity: High]
> This is a pre-existing issue, but does this struct clk_parent_data also
> need to be zero-initialized?
>
> Only fw_name is explicitly assigned below, leaving name, hw, and index
> populated with stack garbage. When adf4377_clk_register() passes this to
> the clock framework, clk_core_populate_parent_map() will read
> parent_data.name and pass it to clk_cpy_name(), which ultimately calls
> strlen() and can cause a page fault during probe.

Yes, parent_data has the same issue.
As Jonathan will rebase against rc1 anyway, I will send a v2.
Thanks!

>
> [ ... ]
>
> >       parent_data.fw_name =3D "ref_in";
> >
> >       init.ops =3D &adf4377_clk_ops;
> >       init.parent_data =3D &parent_data;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787165329.=
git.geert+renesas@glider.be?part=3D4

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
