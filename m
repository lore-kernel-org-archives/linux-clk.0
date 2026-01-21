Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com [209.85.222.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281B03BC4E2
	for <linux-clk@vger.kernel.org>; Wed, 21 Jan 2026 09:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768988092; cv=none; b=IM0TrMW/LT46ltyHZdEDYA2K9MOv3ybXhS65YNQl+EPIArolCKwbDfB6sINyD3xMmWr7r9cYIkXid5zSwgq2WDIBXNmyDBnfAEmxQQCZYOi4Q+Nr0pi6AhPOYvm66yOEz4RxRw2WE7uNBtbueshtNmGMVG804kKMMTJKckhmAJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768988092; c=relaxed/simple;
	bh=/DNYZvP4E268YQT58SEjVWMsycgcOqpk49+Jf+XgZc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pjgPj0ve8A5IAFX7qIjKQmY5Jz+y9kRiqY0pZRODvP6iIANUc3q5I3k2HRGk4CeaYnhc+4PpDRn09OuUw1FQHRhNaKw52TNN0bKPpDrWE1a0f8Q+2/6JPs8qr979V3W+BqXSyge2tk+pEsWTJGjy+pZu8iyn/1seZkEZB8GzfE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f68.google.com with SMTP id a1e0cc1a2514c-93f5b804d4aso2543313241.3
        for <linux-clk@vger.kernel.org>; Wed, 21 Jan 2026 01:34:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768988088; x=1769592888;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bszhOzJILtErjS2iOIT7irbkOXcUc9F6q/vjpyzjSxg=;
        b=J7eijeAgpKvUdrzoqjxJuOtfdfiUW2xntVkWNpEX2L/btgH378XC8gJAewBYglNPv0
         WT/P/5aedQ0JY9BUfYYOqy0K591zovftVGfIeUKSIUZuUKZtHwM8JUPD+15YaRDT3pai
         k4/VFYhbvjdWWDKEuH5Oo0GX82Y7t9upeitF2s1VvRqcJmHkYo4jjZVzDhR0JhW2cmlB
         ZwGtqQhzoJfqzxCHxwxBW7q3u5bQvnDKyzw7cSZNy7ftx9U4Dlt344cCPOHebfTBD9MU
         DTqaUMyI3c1uBAG8Hq2qaoPIDV0DWeUNrpnSOlxegh1MzBI32ghM+r/AO76H0qBiTpYw
         f2eQ==
X-Forwarded-Encrypted: i=1; AJvYcCWasSU24fGQasYEcyJJkgRXP9uwlcaUejQy55g23j3A/wNQkMvqLyNvOOwyfShNHgFPCKG2uMLIKCs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwNWjnosQ8W0j6ecOdCoHENllSx2dUmyn4XhTVz7f2Sy2TR+88
	sqAOeRaC0sptSCMCm3Sb+6hkZoH/CQDrE/786A3E8BAwnZ4GvwYsWKULW+WVMXmi
X-Gm-Gg: AZuq6aK8cnE7Ef1uCMMJC9En81VpU+kT878a1z0CvUgMBgy96AMPei4pHY/K++iOGgM
	8q3CegfvzI3JUocaX4DAKaw+Qyf/vESwX1NviLUWzAfiHxdurPbF7xRQ5qVxFw1XQ/l91BHFWz0
	3l8+VhbrGbhV3uEkQaUbwFdvwYs2clP2SDwluTrhu37zno6UNfpWY5VNoulob+nCEIxhoXof8G6
	qpWJhdWdD/18DcnywBHAsuRNeT5CZzwNIE5AC06BSh0YJ/Bd0LwyWhpR9PXKz4l4EWci7+P4o2L
	C2ebOJDlC0a9xcW3Jvf5upNnv2a41NOti8FyrZJHHZpCSoK7D4uwL8aG5xibXTasSDrhQXsKlMK
	/yRHNevqX8qdBx8hcCItIkpi2mNQEQt6WycidoLJ/A4uFM6U0RwewW7mgGIU5wWtE1YkoKqZWYb
	ZapT74iKb0RXfOShxvutc5VAgwtYs0Lw0Rb09I1jSIHVy0nuVO
X-Received: by 2002:a05:6102:c94:b0:5db:3cda:cc3b with SMTP id ada2fe7eead31-5f1a55a2fddmr5340913137.34.1768988088463;
        Wed, 21 Jan 2026 01:34:48 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-947d03c2861sm4615377241.3.2026.01.21.01.34.47
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 01:34:48 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5eeaae02888so1784210137.1
        for <linux-clk@vger.kernel.org>; Wed, 21 Jan 2026 01:34:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVPkMnmS0jZo13Yn0sk0wcUo8v0ZiEMdPx6iKb5eUQ+toXSe9gFcVwkaJ1hmdgLmBaA/VS5zWIYvMA=@vger.kernel.org
X-Received: by 2002:a05:6102:512a:b0:5db:f47c:15ff with SMTP id
 ada2fe7eead31-5f1a55e7e72mr5057976137.42.1768988087567; Wed, 21 Jan 2026
 01:34:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4cb63bd8b1e49407831431fbc88b218f720a74fd.1768899891.git.geert+renesas@glider.be>
 <10de432d-b38a-4fe2-959b-d9fa4e08e6c1@mailbox.org>
In-Reply-To: <10de432d-b38a-4fe2-959b-d9fa4e08e6c1@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Jan 2026 10:34:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVqRh5B3o5DA=5GU=HBcz-ZeQkCvRVtqOY4tE9H-FHN=Q@mail.gmail.com>
X-Gm-Features: AZwV_QhPTgfdREEwl-zQjOyzg-nMGiQJMf7pwBBdf77lOvlH6kC8tJLlfws-Kcc
Message-ID: <CAMuHMdVqRh5B3o5DA=5GU=HBcz-ZeQkCvRVtqOY4tE9H-FHN=Q@mail.gmail.com>
Subject: Re: [PATCH v2] clk: rs9: Add clock index range check to rs9_of_clk_get()
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Wed, 21 Jan 2026 at 03:24, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 1/20/26 10:05 AM, Geert Uytterhoeven wrote:
> > rs9_of_clk_get() does not validate the clock index in the passed
> > DT clock specifier.  If DT specifies an incorrect and out-of-range
> > index, this will access memory beyond the end of the clk_dif[] array.
> >
> > Fix by this adding a range check to rs9_of_clk_get().
> >
> > Fixes: 892e0ddea1aa6f70 ("clk: rs9: Add Renesas 9-series PCIe clock generator driver")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > This is v2 of "[PATCH] clk: rs9: Convert to clk_hw_onecell_data and
> > of_clk_hw_onecell_get()"
> > (https://lore.kernel.org/a6dce17b15d29a257d09fe0edc199a14c297f1a8.1768836042.git.geert+renesas@glider.be)
> >
> > v2:
> >    - Just add the missing range check; the conversion to
> >      of_clk_hw_onecell_get() can be done later.
> > ---
> >   drivers/clk/clk-renesas-pcie.c | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
> > index aa108df12e44fb9f..1adc5365ba1a3d59 100644
> > --- a/drivers/clk/clk-renesas-pcie.c
> > +++ b/drivers/clk/clk-renesas-pcie.c
> > @@ -277,6 +277,9 @@ rs9_of_clk_get(struct of_phandle_args *clkspec, void *data)
> >       struct rs9_driver_data *rs9 = data;
> >       unsigned int idx = clkspec->args[0];
> >
> > +     if (idx >= rs9->chip_info->num_clks)
>
> of_clk_src_onecell_get() does a pr_err("%s: invalid clock index %u\n",
> __func__, idx); on error, should this function do the same ?

I can add it if you want. But this function will (hopefully) be
short-lived anyway.
>
> > +             return ERR_PTR(-EINVAL);
> > +

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
