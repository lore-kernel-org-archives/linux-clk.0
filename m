Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D40E3F4DE6
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 07:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371504; cv=none; b=bhrw5c2I/5zdX3bXbCBAdtTCZwKtC7GGaaT5uqiU85NDLQcwY+VY+bjc4JO4Qf4Nup1QucqfKEKz3/3znyGCqExW3wTlSpsj9/s6yoUHwkWKaqfn5MQ+bThpv9Fn2ARuUIi47CEYmMYURJOzukCGVA/klMPGpe6Z2CvxQFTOiZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371504; c=relaxed/simple;
	bh=am3YRQdfDAT3nmaBqC7y5nue7c7B51qzUVM5Eheco6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=amLcjO4m7W93WXCljMwhxVrLVkjgdap5DIzLNm/vESHpq0zxP19TQG7ygmUHhIItVKqBK+8OBJu27r6iqIdTcBuOy5EtUMrRDyzPYg4nT8pD5rrapcaGTvYSrB9HW+RL+p247XOTF6gTvQWsFKgUqR9vaTdpfiHSRCgfRVT8eTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-797a7df7184so512397137.1
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 00:38:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371502; x=1789976302;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ig0KNWBSwSP4iz1PoFYIig3Kn8oJ6i+WfrIPn0M81M0=;
        b=nZqVx2mqGICahkBRBJkTOGxLk9psWlQtwozC4nnuecuvHWsRhGYonEJVrwPcQQj8R2
         3TBxRJxkdiOi3gzV1yS2GfGi4HuuHJtYlil5zwjlIJKO7csk1QqIsw6fxF3Cez8EXR/S
         2AmSkL/Jcy9SV13syqDLp/sDiYwHQREACIePNd8ZPn/HR/GaI9x5UI5fG86wRA1bFChG
         Lo780NWOOXcbckMEKLutpahTVrL9oXm81j7CdT5yNlV7U7v0A6NwmMSlh/1eP8wwb+V4
         ROfI9h+YB7lCXSBE+CZagxMh6yQIT6EF0NnzaMZmExuMS5nRtfvzup9uVJ9J7KYDGQR+
         3Xlw==
X-Forwarded-Encrypted: i=1; AKwUvBzGVM7XHj2KYGRNk0NTCZUeykNeNufRcEEOtAFaqH6S8M2mRX2WFNrm763xJYo5rjCeUAVYvElATi4=@vger.kernel.org
X-Gm-Message-State: AFuF++kFJ7eKNCzZUNxhex5keKyRI0dck18oebhq5vhul1COwLG2vTNb
	s7lBM/dTCPApQ1mC+8bobr4bB0thERfTnY8Elp3h+mRK6ybZrkIwExdJT2LMO1rJ
X-Gm-Gg: AYBFou2yRBj0Vm4PBdA67DLZkmdFu2K++mCA5tP7cicqsCtuDax/QTq2aw7CU6pcmcY
	QTqpV2y2IesPCiBBzPeW6cLsUi7qtR90HWWDT2R8UtoHzvK7OTcZP4ZCtN8jJDtdNO9HrJuoxdx
	jjmisNSKdBiWX0tbdVCF0bi8cWJ5NrBpjCbLvyesdxtM7UrQ6sGt0s/5EtvcfNz+uKwgOXCx3Y6
	+nC5a39UyYyRwKuWah9MT/pMj8AHS0MZnX0w21t1+mTx+2g9Wpd9BYXteyb6I+grmDkUinLBXGO
	DMdCx5o+A3Pd1MyTs9rA7U2gXs1JG5aS2/9JoOSUHmys+DHC6BZS//QThzVQUY33temDXWm+cpL
	4ZXmyECIuf9l050cZA0+DV+TIoLYUqv3BlT5xXi50XFCV5+Lf4KJVTsVxaAmQzhoXtNISWkrkHH
	5ktuMUc2qHE6j8Ng/qozBDCuhMCPgd/UaIIny4xn27NBT6He9Bj2bcE4ayMUFaTeBmmw/P3HQBi
	VdiyGwjPUX4alyERYkeZU6HBUEtYrq4NHcLkY75bA==
X-Received: by 2002:a05:6102:50ab:b0:79b:1b6c:4f66 with SMTP id ada2fe7eead31-79b57ea2220mr636856137.1.1789371497200;
        Mon, 14 Sep 2026 00:38:17 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-982b9f4239esm10884895241.7.2026.09.14.00.38.16
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 00:38:17 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5c7d1512dbfso3012606e0c.1
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 00:38:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBySSvEN7KdN0lribtP9/7d22Oqk1NgIU9BPm1H0jZX7iVgRZMlVeWorKWMZDG6970GlqFHS+eMQYJY=@vger.kernel.org
X-Received: by 2002:a05:6102:2b89:b0:785:e444:15de with SMTP id
 ada2fe7eead31-79b588868b0mr615690137.6.1789371496720; Mon, 14 Sep 2026
 00:38:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913173009.1164899-1-sashal@kernel.org>
In-Reply-To: <20260913173009.1164899-1-sashal@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Sep 2026 09:38:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXvDrscWWod8HAqpTRH-VZfyVC+pKJuQy9enD8tbyhsng@mail.gmail.com>
X-Gm-Features: AcwNN1X-8Qz82mGtefbPfDrQ5FfGVFMErWxdtZEnRaKLFMPVj7qmjR9TiGuLaw8
Message-ID: <CAMuHMdXvDrscWWod8HAqpTRH-VZfyVC+pKJuQy9enD8tbyhsng@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a09g077: Add missing slab.h and cleanup.h includes
To: Sasha Levin <sashal@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, kernel test robot <lkp@intel.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sasha,

On Sun, 13 Sept 2026 at 19:30, Sasha Levin <sashal@kernel.org> wrote:
> r9a09g077_post_init() uses kzalloc_obj() and __free(kfree), but the file
> includes neither <linux/slab.h> nor <linux/cleanup.h>. It only builds
> where those happen to be pulled in transitively; on arm allmodconfig
> they are not, and the build fails:
>
>   drivers/clk/renesas/r9a09g077-cpg.c:966:35: error: use of undeclared
>   identifier '__free_kfree'; did you mean '__free_pages'?
>   drivers/clk/renesas/r9a09g077-cpg.c:966:35: error: 'cleanup' function
>   '__free_pages' must take 1 parameter
>   drivers/clk/renesas/r9a09g077-cpg.c:966:51: error: call to undeclared
>   function 'kzalloc_obj'; ISO C99 and later do not support implicit
>   function declarations [-Wimplicit-function-declaration]
>   drivers/clk/renesas/r9a09g077-cpg.c:966:24: error: incompatible integer
>   to pointer conversion initializing 'struct regmap_config *' with an
>   expression of type 'int' [-Wint-conversion]
>
> gcc reports the same thing as "cleanup argument not a function" plus an
> implicit declaration of kzalloc_obj().
>
> Include both headers explicitly rather than relying on an incidental
> include chain.
>
> Fixes: 810b8b6c4e02 ("clk: renesas: r9a09g077: Register SYSC regmap")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202609101334.xgbNoC4e-lkp@intel.com/

See my reply to that message:
https://lore.kernel.org/oe-kbuild-all/CAMuHMdVBFCKA5gjQeXuTrOYbaY_sZg-Gnz-fgOCSKhF3cV8jhg@mail.gmail.com/

> Assisted-by: LLM

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
