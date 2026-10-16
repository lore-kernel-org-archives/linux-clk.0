Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1893812D2
	for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 16:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792167483; cv=none; b=ShhC4NWxJ1exxGXAJN6vzel/kK3zUKz2X/YFFtH6Id0SbGFf92pPQfeCJQZsiWOqDgbPQBgcv3hEUVvaRRopPlBSjd2/Vp0cigybxCyYfuPhm4WRmDFAsfojSc5NFiDE40biK7pz8krGtM7ZY/fObkPNCUliHw4xsZeZUdNnXso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792167483; c=relaxed/simple;
	bh=xSr2ExXRN9R0UBBPp938gkkIvwZwXGmsDTqtVSQe06o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DHwv5DJdl93B2804ihD1O1tuxKz3v7x7XhmpACwjpyPhXw6TWRfBFwpUL/WgiDqgXFzJkFbweYZQZrBqGe20y0rEZfHhnXqRFTgigSJEVHKzyzelKmQt4AW4lD9+Irim+4FIZmqo3SkF3C/xd9lz6J56sTLQ+gkOjuru2dwqCvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5ea969fafeeso44868e0c.0
        for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 09:17:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792167477; x=1792772277;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AunDP67smfuPeJ58K112HEYEzg+svez7qfjrmc8SNz4=;
        b=tVaHLyvTFazzgKTYAc54zB+mDap6mZP+e5CocObwLm0Fbkr293qkRDvpD+YPMOLGnX
         MnsrDE3TplaW1jWweY6n0XQdL/QIDYB7LMYSPLVCjCPiB+qNt5YnGj33eBlSPVEFGcFc
         sefBDNN2gZLTY3O0h2gHg3LDuGEhlmu64oKZTmU5xQeXAWffXAf02AxKxeaaRKvdjEJN
         CzDu1eJN43yHwPtiMhEj6D2xZAbUM0xFRKBCVEPkpLE3L+Oz5g3RgURXlyeobavuIOyD
         XV3W2FxT7tBTsYFExRy78Ds9iJjTapeJINM+q4JZT3IW5YA+mBCc78jHxulK1UJEOD0G
         RWqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVzI6D7mL+kFCnyU3KDc1cMILiUUgXcgiWdHJnS47jMRA9qvtxqbYdqUGHnbeKTVNXX/ZfYIeGeqw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJRSSn83l0FoXVwrPcaCCK8MUOQ/roRz8dfb22pcDCf/phn7FE
	FjRIcrZWByDRV6T+6NfQYVVkf9IcfJFHhAFKXUjLhgjDk7QJVmVClrk3aoShouic
X-Gm-Gg: AYBFou10xSHic3j+eOuv69yOBmVZ+yMBitsYTRcSmNx9+i7p2URB6V1me4Fqs/O+wQs
	SS2yQMpTwTMCggskHkD0ddt0ePVxEAFgkHxFnui4UolUWNvL+AN3t265Z0HYtnkVtN2z35JV/P7
	jJW0frI8aYlO9nnd13URtxWAxBe0/NM3i+2E0sCUzsVnsRhoiHsfEzv5hfD69sZosYXLrSQf7RR
	bFVAKPMoRH8pcqnWzAbu3+NOrpjNzorsTKL0cDlIhr61bNNSgTI24xxYRfeHscsmFf9EZhQ/kL1
	2bGaj0I43Nw++O2PfonlzjlaHkPG1FTaiiz2qu4f0B+LnQYRTg99a2sCmerSBrt2Nv4H0CuG+Ns
	lbd3WCPS5jaeDK1meh9g41isb04j3iUvPlgA/fHD3/o92+kMt//upyCfswDxcMkAS2X5tkS803Y
	nn08KbVcVHVXvehbI5vNy86FTLTkw3Rh7BIgfIQ82pELzvlS04x4EZQ6fZRaVrwTL0zVQ6laHn0
	ZGkOxMsY5URIIg7u/uzAkClHA0nKQBIKiFS
X-Received: by 2002:a05:6123:67:b0:5d6:7f46:b8dc with SMTP id 71dfb90a1353d-5eaaa8b25fcmr263129e0c.21.1792167477366;
        Fri, 16 Oct 2026 09:17:57 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b4ae2e2sm1931724e0c.7.2026.10.16.09.17.57
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 09:17:57 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7907f01e487so5677137.2
        for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 09:17:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwpW16OipfkTDxqxzVMQgJBmeoJhZ/oDU1snVNNXNb9BjCA8bkGdBTA4C+WMjC8WSTZ56JOI9KXRh4=@vger.kernel.org
X-Received: by 2002:a05:6102:91d:b0:7cc:25bc:3b20 with SMTP id
 ada2fe7eead31-7cc3697a80cmr4964137.7.1792167476872; Fri, 16 Oct 2026 09:17:56
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1792163045.git.geert+renesas@glider.be> <c38d744c09dffff550a9b882051c211b572b8daf.1792163045.git.geert+renesas@glider.be>
 <sashiko-outbox-174611@kernel.org>
In-Reply-To: <sashiko-outbox-174611@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Oct 2026 18:17:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWG50U8V9wXBK_5-74o2bseEUbQMy1ZNn-E3aDukwXPKQ@mail.gmail.com>
X-Gm-Features: AclHuK9fqn3MalAwQj8tdGTinUXqmFBnbO7uqU1e8oT10jns_G1thPssa7yAsT4
Message-ID: <CAMuHMdWG50U8V9wXBK_5-74o2bseEUbQMy1ZNn-E3aDukwXPKQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] clk: renesas: r8a78000: Add SCMI remapping support
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 Oct 2026 at 18:13, <sashiko-bot@kernel.org> wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] clk: memory leak of struct clk and module refcount on success and probe deferral
> - [High] clk: renesas: UAF on provider unbind and struct clk memory leak
> - [Medium] clk: memory and module refcount leak in fill_clk_map()
> --
>
> commit a959fac1d9976d318a861219d6e13c9fef99da15
> Author: Geert Uytterhoeven <geert+renesas@glider.be>
>
> clk: renesas: r8a78000: Add SCMI remapping support
>
> This commit extends the Clock Pulse Generator driver for R-Car X5H with SCMI
> support. It maps DT clock IDs to abstractions offered by the SCMI firmware,
> falling back to fixed-rate clocks if unavailable.
>
> > diff --git a/drivers/clk/renesas/r8a78000-cpg.c b/drivers/clk/renesas/r8a78000-cpg.c
> > index 5ffd7b89cb48e..758cfe78ae58e 100644
> > --- a/drivers/clk/renesas/r8a78000-cpg.c
> > +++ b/drivers/clk/renesas/r8a78000-cpg.c
> [ ... ]
> > @@ -145,7 +184,46 @@ static const struct clk_map *fill_clk_map(struct r8a78000_cpg_priv *priv,
> >                       break;
> >
> >               map[i].fw_id = map_in[i].fw_id;
> > -             map[i].hw = fixed_hws[map[i].fw_id];
> > +             if (map[i].fw_id >= FIXED_CLK_OFFSET) {
> > +                     enum fixed_clk idx = map[i].fw_id - FIXED_CLK_OFFSET;
> > +
> > +                     map[i].hw = fixed_hws[idx];
> > +                     continue;
> > +             }
> > +
> > +             scmi_spec.np = scmi_clk_np;
> > +             scmi_spec.args_count = 1;
> > +             scmi_spec.args[0] = map[i].fw_id;
> > +
> > +             clk = of_clk_get_from_provider(&scmi_spec);
> > +             if (IS_ERR(clk))
> > +                     return dev_err_cast_probe(dev, clk,
> > +                             "Failed to get SCMI clock %u\n", map[i].fw_id);
> > +
> > +             hw = __clk_get_hw(clk);
>
> [Severity: High]
> Does this code leak the dynamically allocated struct clk and its module
> reference?
>
> of_clk_get_from_provider() returns a new struct clk and increments the
> provider's module refcount. The clk pointer is discarded after extracting
> the raw clk_hw pointer, so it is never passed to clk_put(). This causes a
> memory leak of struct clk objects and a module refcount leak for the SCMI
> provider.
>
> If a subsequent clock lookup in the loop fails and returns -EPROBE_DEFER,
> the function immediately aborts, and the previously allocated clk handles
> from earlier loop iterations are not cleaned up.

This cannot happen, as all of_clk_get_from_provider() calls use the
same clock provider: either the first call returns -EPROBE_DEFER,
or all calls do not return -EPROBE_DEFER.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
