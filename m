Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BA75A5132
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 15:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573212; cv=none; b=qg4xElCU8qDykK+KXNSP1JjU7LT+4+RvRFZ3YLNJ2qijnWzjJ0qNlleqq9AVtk3Oh6UnX8s9y7a5zAUjunzRZmdrm8lkJ0IlbmcdgAY44EQIxilsr+mCAxJ+BQJNwumBwCyl7NCXBC0ziTUl5XvAr7S+w4Cbwswc9W77Zeo0kkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573212; c=relaxed/simple;
	bh=nsD3d3D+5c7/Om+L8FPkT4+USyqxePFCkhItvrjajDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CsBmPpGWN4updZf/D6j0unGEnBptCGyAkruvuAWP0B1nedwFKXNlSjeekGWOqszW8qfyTleVfpR6VcsHv9Z6ic4XbRwnOsPjklzjC5sCFfpm4/OEqmOdWicM9+6RLTkxGqssstPJh/Q5KZetrocuTsn4IH0LiWYtMkj/ENFmZ1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-78a4c5c582eso351649137.3
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 08:40:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789573209; x=1790178009;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8P+cjQzFKZxfl0S843XHvfKqcg28uU12LMzUav/YWFI=;
        b=v8IpfzU0VdjXIOz9XJVv7Auxuv9CGCeHjoTAO0gMwIyjFdN5Kr8StSxGIO1XQp0PY7
         CVVdAnd8yt9didinQrKgar3gDNsSL5pfSDHEmKNITTVFBDZNOS0q+1wbrlN1hpgMgqOm
         ZAUwmX/PMNIFZSXu93doCLOKuBtK246+cShB5u+jpTQ9Ee8EsntDfL7RorxMELBYHTgr
         z2xBYsgoUHyqE8Tj+m9Qeh/TD+Q9bPYgXIvaGXJolXJAxwwkPCSpr3kO7SiA4vYsL2qh
         lh3zfyMlWDKyLjOhhduFNGCF9RjIBZJrad0kz/n2p/52Pk1eo5k8bDP/AsPN7urvQpIa
         DZ/g==
X-Forwarded-Encrypted: i=1; AKwUvBwYUoG+JU8ksY87KCrq8MiMnULVg2ca4O/3b0zbmt8X9D9gV+ZjR2BzL0HHaZ1PP6MC9k3wIziZw/Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mtc1n5qWFTzzNhJ7Gd/up2jiAjAgL7VFf7nsjKPJXp7NY/eqHW
	FHKf4pW305UixNMADkBesaMkXW2TTLKTj/IzzfCxM2DdmeOWhPTSIyljn9iez9ZYwL8=
X-Gm-Gg: AYBFou2yyDO6m0yJS3zt4XBekkvtNwN5ZVucskBcsIL+Vu/kOK1jAe+tKrhMtQolSYS
	cWaqxqkgQiPT0jx8vB2CTsHbl/Ys47ag7qFneC+A4Y42j0Zeg59zay7hkKduTm3ve8424WjJwHE
	GFVJQC2PVbkFUxoNtzQgx0DUKpVmfkwOAyq0NWZfi+YwvxUAAB8v2x4HKJhuAiAqH42neds0uHB
	28JcoPXKEeShHVmu1/PUgeSRlYckFwoaOwMHW0hQoSNRjjhkptYOuBjBG6Viqyjj4yigJJISLRH
	9o1ms+fyL7AJq8q+66ze1cLCjAV24WfMHwEjwMwlihpnW+JTY0g6k4+Y9txwmGiZ9GKTVaWNaBk
	QuyWH49ehzyfRmNTgcSuHOglizkaXGFv/mH59+JzOCINtC1H5FiS3BocRRy8zpByh5j86Ehi8oW
	k18NRnTGTPT2GUbxX7heomxH+bsbxKjmjzWsxMVGMinSzVqaD5pTunjvEhC0HJzYEQgRJGGICuL
	9uEVHv4WtgppDS6gKhkQ252qDuOlYkrAhx1
X-Received: by 2002:a05:6102:3f06:b0:79a:21f6:20fc with SMTP id ada2fe7eead31-7a029055d87mr1643144137.10.1789573208556;
        Wed, 16 Sep 2026 08:40:08 -0700 (PDT)
Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com. [74.125.227.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98323407ec4sm136483241.2.2026.09.16.08.40.07
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 08:40:07 -0700 (PDT)
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-78a4c5c582eso351639137.3
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 08:40:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByi0ul5nrZTKyogb4W85E0qzIxapyihMogt6Ro5ij6T2zHAS2KPT6v+6PSjsAQ3cb4KGqQyyS0A0vU=@vger.kernel.org
X-Received: by 2002:a05:6102:510d:b0:799:e1cb:d690 with SMTP id
 ada2fe7eead31-7a024dcd2f1mr1607011137.1.1789573207075; Wed, 16 Sep 2026
 08:40:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87bj9yvu5a.wl-kuninori.morimoto.gx@renesas.com> <87a4pivu4v.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87a4pivu4v.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Sep 2026 17:39:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU8M140zTk5pnJJsMHabPJJH79rnDPejOsrA8dFTwCkmQ@mail.gmail.com>
X-Gm-Features: AcwNN1WSIcDa7jrqBhnNKIhdkDurAFwSACvv2xsCElsJCeZ9W-7yrLs0MaT2Zus
Message-ID: <CAMuHMdU8M140zTk5pnJJsMHabPJJH79rnDPejOsrA8dFTwCkmQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: renesas: tidyup DEF_GEN4_Z()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Anh Nguyen <anh.nguyen.pv@renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Sept 2026 at 03:54, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> Current DEF_GEN4_Z() is using .offset to get "reg" and "pos", but the
> offset positions and calculations differ from intuition (the register
> is located in the order B -> C0 -> C1, but it is using C0 -> C1 -> B).
> Tidyup them.
>
> And let's include CLK_TYPE_GEN4_Z in DEF_GEN4_Z(), it is duplicated.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
