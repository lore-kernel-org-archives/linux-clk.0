Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E74F21A430;
	Thu, 13 Feb 2025 10:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739441806; cv=none; b=ZQZEcYJnwXP8KpTGf5/QlCD9S2amggq6IjSvqXJI5n9yxMa4qK2abhhDu6WlTMEIlxZXnauj4mJZ7MwTVpnggh959Xs2zW/T+tsqX7t9WX/YKUuzOUh96OGA/Dg9IyYZkfiBluriWVOE1MOPLnfQgHd5lB8TpB90jyMIORTv0wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739441806; c=relaxed/simple;
	bh=KNgT4cShslnH6pe2xvhhE3jHWvOo2cG8vDyVX3ktiQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o0xNSWEzjzxTsjEUl1rBJ+9hCYal6KFo965xtZqBQL80ZD/rwCnwrcMcGRFTsNpCoZuJJAJgxRJkH9QsC07G/riNaMMCaUlidLW9Y6jIz3FSorGx+3ioWgDygy2mBy7dmVil2i3O1yuOo3WqLqe/m+NG2K1vwh8ArOP68C+4mzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4bbecb9b6bbso361343137.3;
        Thu, 13 Feb 2025 02:16:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739441803; x=1740046603;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r+4RVqTGAi8P4BI3du7c8N1169rpqNW0ZHsYZ7ijscc=;
        b=imnMp/Ya0Gco3d2ZmrbkE1E71mR2yXyv8bvlhOP1Uy+jbEqd0xFFcy5YNybCsG//qE
         bDebXU7lgJh5rJkN+0gUZPw9ahbA4MfMhiQmjAAJiYzijloosFLPg7BGADQmaZJfyS/I
         /W2dHy2EWFl6T3UpdAMcTFkqwmcgPyLcKRfIwm43234bhLpUiUutywlRHycZgJmwhLfx
         CR/nyayAli6O87wq6nytQ0kX02BTOFTQsWJRvTr4qZ4krWhVRFQsGJ1Oeo+b4IDHPpaM
         ILAU4aQs4bOtMaCQ7Qurk1mZVHfQ/NJriP92Lwa1CNrc9xTTLmwwcFZUCgcgCtQ/P8Ox
         8zgg==
X-Forwarded-Encrypted: i=1; AJvYcCUsIFXJYpYJgTsWQo/1501T4zfiBGGqzMkfcweHuq4YotcbCcokEQwoCbBJIhfstz65pBO9Z2TYre/F@vger.kernel.org, AJvYcCWc4V1pPiUEJxMBk0Qb413tlk5knqb9pYfnoToMP53Iy7m7PEtqlSNqyFhoyFkNaxq9YAoDuJrZbhDf@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3EdfNT0+LM64+VxP39tTSXVRyzOCdShd2I2EkKwAnBDigQkPQ
	geuBu4byHDnp1Ho2VI+NA1yQ4bUV5ZD3u8C/vNdlkies/RExY4nnankl0YnIwNg=
X-Gm-Gg: ASbGncs7RvXj8hwUl1d13/D7U/LIUqMozSuutGgO19kZCic3Sl2ku1RKIpVcA4hLgmn
	MbyIS4a4dxMwd/Sv1phkEWYhnNfNnVk8LsVTRSVHY2+ZliMrjNRkNJvn5uLIYm7lnC3C3ig1vaF
	xJsgwfEEnIZGR7iDyuMjVo8PfQWsgELgKgtkz7I+s/tVnaPzFm0D3KBsemjxfxuVhtdgaayhmuc
	cVFwcRgTqLSMHfPhwPE901Yye2FJGsZTOiYM0GjdsObjgkwsoWuyTD1fOwhSnr3emAXxm2OzEMV
	4YqzZsWi8i6e3ma7TVyFDQ/nVRxgU1vOk6c8gVg5D30lDNNSha0+0g==
X-Google-Smtp-Source: AGHT+IH9BGzGYtE5X702F7RMWLTOJU5Kq5h2yNUQwnMGaaTuuwguPuWFKzRqGlFiH2cg7+M2COvFpg==
X-Received: by 2002:a05:6102:8005:b0:4bb:db41:3b68 with SMTP id ada2fe7eead31-4bbf209b9famr6584958137.5.1739441803538;
        Thu, 13 Feb 2025 02:16:43 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-868e8583c9dsm137243241.13.2025.02.13.02.16.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 02:16:43 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-868e368ec74so466892241.1;
        Thu, 13 Feb 2025 02:16:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUxTSJxNY8O1V8SES1bqoBpQI/fSis5GK09uOg8mzpBGBYjA2wFQCwbBFoeGZshBWizjLjy5sH9o5DL@vger.kernel.org, AJvYcCXnf6y0xRznWSJgdw9CpGnLRIaLGv/2mBTkT9vcxG0G+fGALsf2WDeYp+FlbvEitoIbKNHN3usl+bMS@vger.kernel.org
X-Received: by 2002:a05:6102:2c06:b0:4ba:7469:78ce with SMTP id
 ada2fe7eead31-4bbf22441dcmr6979494137.21.1739441803048; Thu, 13 Feb 2025
 02:16:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <devicetree-org/dt-schema/pull/154@github.com> <d385e871-f33f-4133-8347-3f108f8a6736@kernel.org>
In-Reply-To: <d385e871-f33f-4133-8347-3f108f8a6736@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Feb 2025 11:16:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWLWDTi1jeSOGKDAmvhGZzxAVTM-NjBJzW__1jfECHFQg@mail.gmail.com>
X-Gm-Features: AWEUYZkfP6xpGlv9Cpj18tTWe4DNj1i_sHyc_JDqEOorEdNEQH6nbJwe_rO5kVM
Message-ID: <CAMuHMdWLWDTi1jeSOGKDAmvhGZzxAVTM-NjBJzW__1jfECHFQg@mail.gmail.com>
Subject: Re: [devicetree-org/dt-schema] schemas: introduce assigned-clock-sscs
 (PR #154)
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"

CC devicetree

On Fri, 24 Jan 2025 at 15:42, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Just FYI, below is a foward of pull request for dtschema for bindings
> adding spread spectrum to clocks. As Clock framework maintainers this
> might be relevant to you.
>
> -------- Forwarded Message --------
> Subject: [devicetree-org/dt-schema] schemas: introduce
> assigned-clock-sscs (PR #154)
> Date: Fri, 24 Jan 2025 04:31:30 -0800
> From: Peng Fan <notifications@github.com>
> Reply-To: devicetree-org/dt-schema
> <reply+ACPRLI5YLXX27TFZX2P7NVOFT5USFEVBNHHKO4ZXHM@reply.github.com>
> To: devicetree-org/dt-schema <dt-schema@noreply.github.com>
> CC: Subscribed <subscribed@noreply.github.com>
>
> To support spread spectrum clock, introduce assigned-clock-sscs, it is
> an uint32-matrix with format multiple elements of below
> &lt;modfreq spreadpercentage modmethod&gt;, &lt;...&gt;
> You can view, comment on, or merge this pull request online at:
>
>   https://github.com/devicetree-org/dt-schema/pull/154
>
> -- Commit Summary --
>
>   * schemas: introduce assigned-clock-sscs

>   assigned-clock-sscs:
>     $ref: /schemas/types.yaml#/definitions/uint32-matrix
>     items:
>       items:
>         - description: The modulation frequency
>         - description: The modulation depth in permyriad
>         - description: The modulation method, down(2), up(1), center(0)

Is there a way to explicitly disable it, if it was enabled by the
firmware? See also my comment in "Re: [PATCH v2 1/4] clk: Introduce
clk_hw_set_spread_spectrum".

>           minimum: 0
>           maximum: 2

What's the meaning of these limits?

[1] https://lore.kernel.or/CAMuHMdWn+sKiC1B4MF1vHwS2ArFYQXGzpYi2EcsyERPSCc9bvQ@mail.gmail.com

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
