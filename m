Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AA94A8412
	for <linux-clk@vger.kernel.org>; Thu,  3 Sep 2026 13:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440861; cv=none; b=XPkRU8LPHgd79/hjLlWaG8HJnKRK6V8W4E9PbVhL4Mxwh1vaWlRvapKcWn7pPxA4Z/LANQVMSTY7gBjtSULn7oQMDRBMQjVSAsOZIJc0EbJPo3LZd53O8aDHJYfnk6Mh1D1gSukKbIxHDres+6BurHW71ElC2ZmagbExZJGs+Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440861; c=relaxed/simple;
	bh=/hmoURmIl/bUQbh8UOa2R0+uRCpVJKU0vq8AlikjsbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jFZILbzbWJrxwTYNCWMbo53FviN6lS+4lu9nZSWjwrWYWKJ5OeaMBSHt642uVS1FkSQh/DgkBNTcyd3lMNoovZlfJAPt6UXYfqcTvO+cKghkLo498/ApMzx/g5q2v+mCgYyIfwc8RvoxXp+P7PvSTC8BxSnkdtBbzaHIYfB4hBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-97ca72f2cd9so1161697241.2
        for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 06:07:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440850; x=1789045650;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=neL+IFdaoh4oslsqt6WgBGKpzShvTB78/gz0eSfjqO0=;
        b=IfCHqzCHSGZ7eObtEM0fOQjY7Yzpvoqljv49V6VEO7rlZSWU15Og2tSDn00eC14TGH
         AmLqohsPtgG7kU0LevUYZCV8Vm68bRqxYY3Ilkz8H7FpaC4uUaiXXcsLowyDXEOq6eTn
         Rlx7gS0WpxhTY6YHRvuoPBlCndWYeVbB80lgYsQecI/o7MYGCWX8oe6aNY+OFueItuMz
         kq5pt4jiZjCDUGTJl4qE2xS0Gp4GZeUD8WrC0/3Yth8mk6lrSoxcfiKTRaEW4UyFV6OA
         alk8sFGBijYLvI9mDCcJ7W32L6BzFzHDoqSYhgL14OLMcS6WfJtBpOLlulJdFGrhntas
         WnhA==
X-Forwarded-Encrypted: i=1; AKwUvBxCRjj9PvBF9NXKxLu2z3bJiDQ00JHNrXFxXT5qZJF8WgBWbpaE2x2bbz2LEh66hfI7eHMsVvzz1m4=@vger.kernel.org
X-Gm-Message-State: AFuF++lebX+Rp1QlXf1n1xkrcTN1locsemeEJIwyvXDtDjlVO63SnZnr
	4EQEwHRPanxDkl3Ohs52keAKOuYA+O4YSIsbGxCxfs9JMh/U+slQKFfgYKZ9cZiH+Io=
X-Gm-Gg: AYBFou1SI8gESlopzAdaBd+D/rEdJGNB1Eyv4HQIpvHp67QLjHF8FaXofFf5rQYf8aK
	qBDddVZMX1hR1MhyIRfTTfZFfe4scdNhMUPVeV45pvX7T8W+0Bz4D30B6jzpshcfxb8U/kd/Jwl
	3f2QhXhFUrqCeSK2K3WQyzOtciPng/GLRdv6wAl9Ry1OGdAIAnLABy1VYrg7p7Lv2byZn1qHivi
	eMaaKHy84iS2j/bZ6npEum/8H8yymvhAT2gneKM6yW5WLVjRDaGKUkTFXY6+Jc4Lyu1m8A7kI75
	9UBCsUFbRnAdtPIh5aU7srz2rp0WEFMtpfwXFpGZh9NrAtc9I8YFKAU3dZW3oits/BifB7oTVrf
	9cBdm0lZKgtdhmODVjm2ly5LdKamfTdAVOUN772onYTM0vsMaqfXF7Yq+Ro5NoP0b2+AXPZ5ks7
	l3RQdFVRXqECtzNqEAjnhXTuynO6rrMKJk439Kszn3aVd133qsbesiRI+3NhMOVhJ7zIKwQxOxB
	6MRgZm0NWrobWHmvOlyrzPIng==
X-Received: by 2002:a05:6102:38c6:b0:783:79ac:9db2 with SMTP id ada2fe7eead31-78a1f19f882mr4359826137.3.1788440850044;
        Thu, 03 Sep 2026 06:07:30 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-980673ca1fesm4233201241.10.2026.09.03.06.07.28
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 06:07:28 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-74ab99038afso1784252137.3
        for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 06:07:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxunWGObfEUR5sgE1rHDpNGN9LvGVcwQdiODvAvWfClyTys5XigOYPyCLsPIf6aVw07/mePjUT5MSc=@vger.kernel.org
X-Received: by 2002:a05:6102:3fa8:b0:785:d308:cc2e with SMTP id
 ada2fe7eead31-78a1f363e2cmr4316460137.9.1788440848450; Thu, 03 Sep 2026
 06:07:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902104939.25522-1-ovidiu.panait.rb@renesas.com> <20260902104939.25522-2-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260902104939.25522-2-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Sep 2026 15:07:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUR59_-_HB8JcVi77B-Pa4UxPf64QO-cDn1ogQ8shFR7Q@mail.gmail.com>
X-Gm-Features: AcwNN1U_nOCF9hyFbscO2alVpr_m0LN2_JeCdjkgGXp8PKg9yAEFa13OLTkKydA
Message-ID: <CAMuHMdUR59_-_HB8JcVi77B-Pa4UxPf64QO-cDn1ogQ8shFR7Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: renesas: rzv2h: Drop duplicated parent lookup in fixed_mod_status_clk_register()
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, John Madieu <john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Sept 2026 at 12:50, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> From: John Madieu <john.madieu.xa@bp.renesas.com>
>
> rzv2h_cpg_fixed_mod_status_clk_register() looks up priv->clks[core->parent]
> twice, with an IS_ERR() check after each lookup. The second lookup is a
> leftover from an earlier refactor: the value cannot have changed between
> the two reads, so the second IS_ERR() check is dead code.
>
> Drop the duplicated lookup and check.
>
> No functional change intended.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
