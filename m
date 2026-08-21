Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F5C47798C
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 11:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312195; cv=none; b=lOyF1f1Vn9GahWohk3V7IpEK02BMasTXMr5Y6onRTV9oth0jG4IBMl5jgxchnN13cVMx27NyVNvluSE/+6j+RB9PdaLJCJnDZXw8WpRTelJuUFtbPOz0vM6eiDcH4g2/IonKqaQTCKD1MIvAQr+apFqFFDJvvaHSe/JfcF0CqBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312195; c=relaxed/simple;
	bh=zTUqexKzRd/ffgVVQLYyFm6wrBTaM5V92oYObJi9TRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CNqeNc4FEnUsmXDY3SX5GdkiFftjjEFSEAmnEBBwIDRiqTRXJHQs5+u/kYZSIx1r48UGrWALSWFsXAL3NOgcXexItAyLHfj2zi6PmJ5ymG6Yz6/BoLLTSbvAHGR76GqEDWdPQEaKTHd/4p9FCePTXc4S3aQQh5TjGx52261Q1fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5c56dbc3a51so323897e0c.0
        for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 04:36:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787312192; x=1787916992;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ec+NopWifWei3xhy94Jsaew2jyivOXpRYVcmATiWbTA=;
        b=Z9yAutyvU2ody79o5vBI0cdfY+IMdOIHneL3SIFKFL0xdmMhsbUXHvSyuuDMuJnIKz
         xXCk4nWX9n3cVGSOdYBduak5WPRdIvZm/BJ8StSCFEIWK9W0pPWfqhjQsHR8llwq0H7R
         u3jTAsQCmHMsYD5E8E1dTYfkhf3nm4iHL3JjfniWYxeUC0avkGIbbz1u3kEM6wn/aGbt
         ecym52okP6EP/a6dBYF73qmtDW7YaxQsVvquaMGJg12vR5gm75Z2UROoJCuIPPH7Buas
         v4GnofZYnHscIu/c+KzyTZtIOQkKS7mjjfq8wZR4iN4HqCxpaDWW8p156Yy1yskCE4MT
         a5fA==
X-Forwarded-Encrypted: i=1; AHgh+RqpSvOb76jfCfl6a8HV9T5woIClItI6zoN8ftpu+KByEC0zTFlUJjh2VV6b77LcganjBH++OtPurpM=@vger.kernel.org
X-Gm-Message-State: AFuF++khw5hCUHekmAydTrYGWUwGufjpgHkquU5hOlz4As1TCkVwvqA3
	GTy0BBlUD9yhoy8jgKUVmKBSgQYgoQzTyypdo9J+kFT1YViOmaFbEWTZ3OTQ2q8F
X-Gm-Gg: AR+sD11ZIjLrjT5wYUFGPKVK1zlLpI9LiNQMMRrheAuot3B34XWXpefOP/RDBRogGil
	4AJ38hjsBq4CI91q7X3imoli4PvN7O9nvW2WnsKFQP+1r2tXjyo6ZdE36v1dIX+blLX8VEIy45s
	hQ6yPKou5lP6BBhqv2hAFn740YJ5vRybMKaCAB/ChU/OTZBnYMGUwQsPvsaYmTsue3nwZqRLhCg
	XMxIwUXBiwk2sTmEqODMeejW2Ogg5ryx1Z4b0vBDod5PgQv/p5fPzcc7pG2ozzgcpESyS8Ye4am
	9KLg3X7DrHBdUm4YrajP4BQ2fEPGFBGmy8iCJfXneXD0Ybo0zInwNbw2o9HX0g38ZQKatbgOqh8
	foQmFi0t8AMaz/S/AX47ssCLdY4C0Sg+gParNuzSaaER1DHqIAKaFvEYO04NsxuV0AHKIACAzNE
	528kT6BpF3bEeztBMB9fPhdU6x0O/blmh37k7F9Lu+Gbt60U63OXiKNsAWJo6XejJw0nwmpxGs2
	G4+Xgw0Rndg3SdToEnOcGzpnxZrrw==
X-Received: by 2002:a05:6122:1798:b0:5c5:732c:f4f5 with SMTP id 71dfb90a1353d-5c5ff866132mr2035932e0c.8.1787312192211;
        Fri, 21 Aug 2026 04:36:32 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c5e276d7ebsm8463687e0c.10.2026.08.21.04.36.30
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 04:36:30 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5bf9466867cso369549e0c.2
        for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 04:36:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RousbPqrlPbLtOZ69rgRHDOlgEe94CD6zqAjvB5zFYDR01ny6tRC2Zqf/L6a+lMOzP6KisN/Qzzsf0=@vger.kernel.org
X-Received: by 2002:a05:6122:1798:b0:5c5:732c:f4f5 with SMTP id
 71dfb90a1353d-5c5ff866132mr2035837e0c.8.1787312190118; Fri, 21 Aug 2026
 04:36:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787240090.git.geert+renesas@glider.be> <5d066598-7aff-4912-89c6-23761fdccc7b@amd.com>
In-Reply-To: <5d066598-7aff-4912-89c6-23761fdccc7b@amd.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Aug 2026 13:36:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXSwx36pDJ0kW=CvQztFx53OvcdfMTpv1h2H6J3z2+Wfg@mail.gmail.com>
X-Gm-Features: AcwNN1Vx5LhEzAerkbLpsNS7FWTQ-s_Hejhf3XNTw2-87OEOYM9RyiJaA3RAFBU
Message-ID: <CAMuHMdXSwx36pDJ0kW=CvQztFx53OvcdfMTpv1h2H6J3z2+Wfg@mail.gmail.com>
Subject: Re: [PATCH 0/2] mmc: Make sure clk_init_data is fully initialized
To: Michal Simek <michal.simek@amd.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Michal,

On Fri, 21 Aug 2026 at 12:56, Michal Simek <michal.simek@amd.com> wrote:
> On 8/21/26 12:06, Geert Uytterhoeven wrote:
> > The clk_init_data structure contains several mutually-exclusive members
> > for different methods to specify the possible parents of a clock,
> > prompting drivers to initialize only the members they need.  However,
> > not initializing all members may cause subtle issues, which are only
> > exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> > enabled.
> >
> > Hence this series aims to make sure all members are fully initialized,
> > to avoid such bugs, and to prevent future breakage when converting
> > drivers to a different method for specifying the parents.
> >
> > Part One[1] fixed all cases that I identified to be real bugs, in
> > response to a crash I saw on BeagleBone Black.
> >
> > This series is the MMC subpart of Part Two, which fixes remaining cases
> > that are currently harmless.  These are still fragile, and may cause
> > future breakage when converting drivers to a different method for
> > specifying the parents.
> >
> > Thanks for your comments!
> >
> > [1] "[PATCH treewide 0/5] clk: Make sure clk_init_data is fully
> >       initialized (part 1)"
> >      https://lore.kernel.org/cover.1787165329.git.geert+renesas@glider.be
> >
> > Geert Uytterhoeven (2):
> >    mmc: meson-gx: FIXME: Make sure clk_init_data is fully initialized
>
> It looks like a broken series to me.

Doh, I made a silly mistake while filling in the correct patch prefix...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
