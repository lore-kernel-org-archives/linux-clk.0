Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6904457DE
	for <linux-clk@vger.kernel.org>; Wed,  9 Sep 2026 07:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940165; cv=none; b=boENrltPzVmMnf+HZ9LVIOHR81eywuf3IdD01liOq6hDaN9GfVBETKW2vLkfPKp2w+aGdBpSkWOmu3gmmT0jQ4FtQBv6LqNtjltipPg5hqooVMs30rRO7E+79qUoQ9RVRZ/LSZ+VhCuLt2eLcGfoPd+q3Ki7QIFGGkx4ACHTrJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940165; c=relaxed/simple;
	bh=8vnQd1GurJDqR7xeC2xaNvbnJW63kIcEWuhSCTVmSs0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bD5Q7C/OaHwhM+SlFObCYx9GPWUaOjAVX+qIHd0VAECVnPdFFIsYRGiemL1nYIQd0Y3ZTgP7tWm8r9FmtC1ILMCDvzG2oWuJDw/SBlqHpGJm02wg+95O7vTioNao45cgdPIZOaxTYKzgHEd1nwYwS7LcfMQwfivTfQIFox7ZYEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2544ff970dso809909666b.2
        for <linux-clk@vger.kernel.org>; Wed, 09 Sep 2026 00:49:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788940162; x=1789544962;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TUF8DuryuHuYEzLxZ7UG03vzeBaGcVG9r9nJNBW5Bow=;
        b=BdFYr6K5/G7xEdf5EQazgZK/wc3ChbJZEccEq3cPbhyc3ZWvuvtGjDH4DDXsd4vH6N
         OZjXjNz7DXb1eVA9GMdgr4lEBiacYsfopY8KooaRnoZrbvwBhNHXdeJfUvaSeu30uS1H
         vdea8FRFkH64rwBKKkSX7to6fUcnWocivXWlr57N/xez4hLIp7UC5CELkZY9dBz/B5Ut
         BiTbQeKd8KB8ay3idmiUB+iUSNm6n+ytTdBxyeQDqpi6qbor+bfPuzjHfg6DYKoIaC5X
         EAUAeYPH0cNK7LiHhXOtwRJlqSkv1iBLieqx0xld9V6AdKaffuoL6wjdD8qp20/axkHl
         ECpw==
X-Forwarded-Encrypted: i=1; AKwUvBwhW55xwe1jGI1cv/eKjtQrbyVah9ZdiDjHS1WU02WuLCkrcOmhgYXrq4UkjcigUTQldcVX8eueg58=@vger.kernel.org
X-Gm-Message-State: AFuF++nEdrKX8Vw5W6lPt2djAyvp5XcbC34Qei+ZCm9SnTfpQ90RHeQ1
	N3OEv32akEoVLn7DTco8l8JQ/Gk+cebGupV9AFX+H5XmhcA/kUYRYRKfCC+KSYWQIqE=
X-Gm-Gg: AYBFou2Kv3UWwSpsb79Wi9SAHSWITKiyu/TGHwVD2Kkq0uUYZuPvYUuaFcJSrUXT9na
	r16v+kw5k3xre35N/wN9MhOIw5sImtydSRf//pZRqs6dEzbMS4bebNOIRTL15iZwSZbWhJsrUk0
	TJwR1Afjr1LvSnLqqp7PP9VludlQP7i4aCPx2uWGjrg0V0bG12o2W/mAXMxajtUQhCs/owOqXOw
	CBdYIXQu5c+lSmEF+cuYYy7bvkxyfxWeGiUBr1JnkOizeVDnWEXbnKQl3ohjk82P+H+/QAxOsVj
	MGB/UDhzrzv6DnkQxNCSPaYac3A1ZewqqTsIryTRw/TjUuWD092EG5wJiThQFV5/KdmVbLYvW/a
	gKvgZdhyIvyqP4ZGBPBRIUif5REF+AVNgmU2KW/aWexnRvGcD7vKlqzNt6Ec9PLkhUxpflcf+FS
	pbkY9G38kERdkPqA8ayudg9n+W4aOqEtj1su+/L8qtsL1o31DxFrNTuwJV1CEou8z+pHUBXkVxM
	6lOkus6pTP3TuJvHeYbZErfbNkJljzUncbFfGVCgKAJtJY=
X-Received: by 2002:a17:907:a08a:b0:c29:3b7e:3a94 with SMTP id a640c23a62f3a-c293b7e3d04mr16756366b.38.1788940162086;
        Wed, 09 Sep 2026 00:49:22 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5bd68esm693097266b.57.2026.09.09.00.49.21
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 00:49:21 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a99776ff70so331603a12.2
        for <linux-clk@vger.kernel.org>; Wed, 09 Sep 2026 00:49:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzVLsm0ioGHofl/wKWegoPivhT5HUiOe4yoHo1TF48zYosyj1NjOtYc0ocfwTF6OpSeIuFYCPVSyKk=@vger.kernel.org
X-Received: by 2002:a05:6402:4341:b0:6a9:9ac6:c3dd with SMTP id
 4fb4d7f45d1cf-6a99ac6c857mr116589a12.14.1788940160982; Wed, 09 Sep 2026
 00:49:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
 <20260908-subsys_initcall-v1-1-cbccf4cd4288@redhat.com> <20260908175845.A6A4D1F00A3A@smtp.kernel.org>
 <aqBRpviTCjwo3weo@redhat.com>
In-Reply-To: <aqBRpviTCjwo3weo@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 09:49:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW0o8xuUd-DWetgek5eO7noteJJcRpuLnz5W3brPVgHVg@mail.gmail.com>
X-Gm-Features: AcwNN1WKttUj2cnJbIK6KhCwT1KolPKy7s8wGC_Mrufwi-OIl1osoywjKGmKypE
Message-ID: <CAMuHMdW0o8xuUd-DWetgek5eO7noteJJcRpuLnz5W3brPVgHVg@mail.gmail.com>
Subject: Re: [PATCH 1/4] driver: core: add subsys_driver() macro
To: Brian Masney <bmasney@redhat.com>
Cc: sashiko-reviews@lists.linux.dev, wsa+renesas@sang-engineering.com, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

On Tue, 8 Sept 2026 at 20:22, Brian Masney <bmasney@redhat.com> wrote:
> On Tue, Sep 08, 2026 at 05:58:45PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Low] Missing semicolons after macro invocations in `subsys_driver`.
> > --
> >
> > commit cdf3179a9f2205efd1b552f70b7522e1db5ee888
> > Author: Brian Masney <bmasney@redhat.com>
> >
> > driver: core: add subsys_driver() macro
> >
> > Add a new macro subsys_driver() to eliminate some boilerplate code in
> > drivers that need to register earlier in the boot at the subsys_initcall
> > level.
> >
> > > diff --git a/include/linux/device/driver.h b/include/linux/device/driver.h
> > > index 768a1334c0a1d..29fbc01ef06fc 100644
> > > --- a/include/linux/device/driver.h
> > > +++ b/include/linux/device/driver.h
> > > @@ -297,4 +297,35 @@ static int __init __driver##_init(void) \
> > >  } \
> > >  device_initcall(__driver##_init);
> > >
> > > +/**
> > > + * subsys_driver() - Helper macro for drivers that don't do anything special
> >
> > [ ... ]
> >
> > > + */
> > > +#define subsys_driver(__driver, __register, __unregister, ...) \
> > > +static int __init __driver##_init(void) \
> > > +{ \
> > > +   return __register(&(__driver), ##__VA_ARGS__); \
> > > +} \
> > > +subsys_initcall(__driver##_init) \
> >
> > [Severity: Low]
> > Are we missing a semicolon at the end of this line? This relies on underlying
> > macros providing a trailing semicolon in their expansions. While it compiles
> > today, it makes the macro brittle. If the initcall infrastructure is ever
> > refactored to not include an internal trailing semicolon, drivers using
> > subsys_driver could fail to compile.
>
> The other code in this file (like module_driver + friends) has a semicolon
> however checkpatch.pl complains if the semicolon is there. I didn't know
> if the semicolon was legacy. I ended up going with the approach to
> satisfy checkpatch.pl.
>
> I have no opinion either way about this.

IMO there should be no semicolon.  AFAIK, the rationale for this is
that if its use looks like a function call, the user should supply
the semicolon, just like for real function calls.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
