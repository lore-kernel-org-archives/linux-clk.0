Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A086553D0C4
	for <linux-clk@vger.kernel.org>; Wed,  9 Sep 2026 15:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967039; cv=none; b=p/yaBtkSaCNCMjiyebzb2dJ7ajKlhnx7UQxo+1D+usz0E3+sotCiVpJYFeQ4RWpr4qXPgp9roF8pZQCEgo56e8QpdWOe0UvXUljFouG+fLr4akV4CEZ9TLINLlofPKnGqBOs7jckFXzABbhFk5TRNzwonG0Qz6689tkXnAt2FRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967039; c=relaxed/simple;
	bh=50PWHOPz89VAgzShHbqe1+05LKceXOJguW/0waoh4rs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=la2pzCdus9ryVsl1+t4SZgXPBp1GgJ8BoDPgFoT1vJ1ugnKP++cnDnYIwALDagYoDATybSWKRod93JvOSmqETrIZ3FjFhOc01+bjgYKsoZshD0ClVGbyR7gxr7j5+rrz2NAT84l6l1kvk3ubofBhYaikrt/GUq9YWU3ALH/TJ3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-79028ca939aso189574137.3
        for <linux-clk@vger.kernel.org>; Wed, 09 Sep 2026 08:17:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967036; x=1789571836;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xngvRGlem5QBe9w72ZS3ISg4Zt8dZwRC6gUDQpCph0s=;
        b=QG1f3QITBSY8LowfVeg63iRN7U8YGhj3oHpMmKCnnrR2sq5CmLRYzeJmti6tVH9gNC
         Gpkma/yPIJzrs44I0GomTX0g/SFbpXJf8rR+8NYiqcvO8wzT6tUD8w4Pv66E9EFd6V3k
         ejw89pfpRU6YNJj85HZQpbc7jjLVSU3XP1cnNH1Hvwtr8CruWnUd+o+b915YY4sOvpcP
         EzRlI4HSNVPaSjlplLM/B2szH9PmTI81EbXkktVl+1VmgaXGrxNQAr5yXMJ/nZqs/w60
         T3hMEWtqIW1lptDA3sIX1eXU5gho0JIPlml8nYn2aUj77AtnEEnJI+3hj0LKcNfWiYXy
         VfyQ==
X-Forwarded-Encrypted: i=1; AKwUvByKOaWsIbP6f8jzlfvy+kj/Wh3xacWcFmrY1OoV9NiI4pw3hPwERMlBQt2lCCMqpPJVuLq3olluVhA=@vger.kernel.org
X-Gm-Message-State: AFuF++lTaMTT3MY59VwrPgAoVVHSecUKcDzn/IBBGfg0fYs82UME8uzW
	u9YrI/lgQCML722gycZQHa/cA02tCEm47iIGazUjVze/mb6i8l1IUPSBnGfI5wj8DtIfiQ==
X-Gm-Gg: AYBFou3ajFtYiNcwkCEyf+CXhbtPEY3v5UC3XtFOk9rC+ssZYq4DQJNc2aTHKeD62Bq
	d/BPzsAHbDr/Svk0jQ7l9wB3CcXgFHuRWQuvEpjemMuIy8wIz27R1CPaE/xYpqkVM/u7SHfnYxW
	gM9pD01gQAtQfZGQ7XCb02+VZWq3XoZ/eAVw4HOYXPCevg36sJFzt6jNG765RpeGIUU9jeCrNAz
	dkUKYRk6i+re4cnXUCwfcbI7NiN33m18w572D13+J+SCRhdcTW5fsI1r5GRVtrrz3cdTO5tsavM
	L7vcf1lQRhTU+clHLaAoFpTQjsHr6Dbst/Sw/loW64tET6xrjXbQJCkLl2nErxe9SDI2D8f0BDz
	oC6eePSK6mn5nzXFFObf8Nu+reBOeULzXQpYqt0Pw1l/UnBeGPat7H8nNC6X9BJvdNDZVEE2gvM
	Ovzg8gSY0UxLBAFen5b0WtSpCoaKYshMsg5tmwiKhpANKfz1TRwUQI+MbitREOINVVlfg0/kFii
	fwsjhD/ubKYv64rb9RyiHWDLCZxio9Xme1JYw==
X-Received: by 2002:a05:6102:5698:b0:785:a48a:e3b9 with SMTP id ada2fe7eead31-79076abb7a2mr974923137.4.1788967031403;
        Wed, 09 Sep 2026 08:17:11 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47a76487sm11167054137.5.2026.09.09.08.17.10
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:17:10 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-78a7003f9f5so233765137.1
        for <linux-clk@vger.kernel.org>; Wed, 09 Sep 2026 08:17:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz1CPyRkF/lsphj/9R+CqTepvOlsN+NE/yd764g+3uUSpl/enEttiEvDnXY/FcKHeu9SJXJpGrAptA=@vger.kernel.org
X-Received: by 2002:a05:6102:159f:b0:77d:e064:2dc1 with SMTP id
 ada2fe7eead31-79072bd65e5mr1021149137.0.1788967030503; Wed, 09 Sep 2026
 08:17:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com> <20260908-subsys_initcall-v1-2-cbccf4cd4288@redhat.com>
In-Reply-To: <20260908-subsys_initcall-v1-2-cbccf4cd4288@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 17:16:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUYJ-XSe22QnBREpxJH_hDVfV1CwkVjBqPK9AXTGJE1Aw@mail.gmail.com>
X-Gm-Features: AcwNN1VLF1S9VM_rAd4lsusMxTGZ8B-oUTaocc800YUq_Bw4xg9-nPCuVEjF4tk
Message-ID: <CAMuHMdUYJ-XSe22QnBREpxJH_hDVfV1CwkVjBqPK9AXTGJE1Aw@mail.gmail.com>
Subject: Re: [PATCH 2/4] driver: core: platform: add subsys_platform_driver() macro
To: Brian Masney <bmasney@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

On Tue, 8 Sept 2026 at 19:47, Brian Masney <bmasney@redhat.com> wrote:
> Add a new macro subsys_platform_driver() to eliminate some boilerplate
> code in drivers that need to register earlier in the boot at the
> subsys_initcall level.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-8

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/include/linux/platform_device.h
> +++ b/include/linux/platform_device.h
> @@ -376,6 +389,23 @@ static int __init __platform_driver##_init(void) \
>  } \
>  device_initcall(__platform_driver##_init); \
>
> +/*
> + * subsys_platform_driver_probe() - Helper macro for drivers that don't do
> + * anything special in device init and have no exit, but need to register
> + * earlier, at subsys_initcall level.  This eliminates some boilerplate.  Each
> + * driver may only use this macro once, and using it replaces subsys_initcall.
> + * This is meant to be a parallel of builtin_platform_driver_probe above, but
> + * with the init call promoted to subsys_initcall so the provider is available
> + * earlier during boot.
> + */
> +#define subsys_platform_driver_probe(__platform_driver, __platform_probe) \
> +static int __init __platform_driver##_init(void) \
> +{ \
> +       return platform_driver_probe(&(__platform_driver), \
> +                                    __platform_probe);    \
> +} \
> +subsys_initcall(__platform_driver##_init) \

Nit: The backslash is not needed.
Yeah, builtin_platform_driver_probe() has it, too...

> +
>  #define platform_create_bundle(driver, probe, res, n_res, data, size) \
>         __platform_create_bundle(driver, probe, res, n_res, data, size, THIS_MODULE, KBUILD_MODNAME)
>  extern struct platform_device *__platform_create_bundle(

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
