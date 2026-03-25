Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAD018D636
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 12:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774442733; cv=none; b=IGwsNcJ/aorzlv2YDfZrnHdD8yE0mx12ETMTMr4C+ZlCl4cO7urEmq+ZPNlkbGIWrZk5ZUB7lgi2HEr4wpyrl5xxMIQGifHlLXFGfi4AR9bJgA8u3MyRFaaWiA1AAsNPFSmkV2+ARuhduOx89Mvt3mouVbcsXdIEHHKp9upcj2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774442733; c=relaxed/simple;
	bh=XBr/cba/Zlc6n5bcrHvESQz0mtn5yxY2rSA1hEofdBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E521m/nWzsNQ0TMqFgBZFArH2C1fUK4wbQx5PCJaNZOIvpQR2//L7PT1NDQxuwk04iNtZHiYX7bcGZuwYFUp6FMeRzL62a/+bnFAR1bC42/AEmYwBw90Nb1dB0ZDQS3lA1P/y8RoKia/cRh6TwOwnIm3YmFPMhB3j6cX6bBXb+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56cd842b60bso1544016e0c.0
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 05:45:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774442731; x=1775047531;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/1RZxkj8eIoN6WQ6j7coP9y9yKKmcQFtqClsMwvMZgA=;
        b=AQ8MlOsiL8Vl9TNSFxLGvfk6QK9es0mP4HbhJYTaCqCZGLw3yCpnpXuQQLURIw+3uc
         NBEZxdQS4vhBsnpivcdxHIgbTFfyYzULqIm6h3OGVzNZLzzj2YVgXPtojXPGgPBYh6oi
         0+Cih5+xrYCgSqs+9wMLsUTufbIiDc+dGxo6659YbPt3MsYZi+dvAwKwKfpCeT5/hdAH
         o/Uh/FgiFJWLHhbJMxUuQDCSezBx+0Zq9FHESQPmcFfn1ATBMi5Gr6TDigKhu1aJdZDd
         TdOelsIkVPGIg8DWQAjF3W+971B+fnHkJ7YgL+nzMlPQJonqjN+jzi504KGpCInDWxcD
         LLNA==
X-Forwarded-Encrypted: i=1; AJvYcCWNR2XSVenGzbFa9C4mBjaMd9Yd+UloWPq3WA9Ir4x6ZHLy2XyRiCdRKKqa65McRCSddeOA/8HIcHc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5GKHFEKnmBJ16nb+JeWfiCO/C095QcDHapYJRNrITlibvtLE/
	CZwWrZmWStek6++RLtR3haecOhrWnUdZYjrxxn514pFGG2BXViPPwth1OOSbvKFFqSI=
X-Gm-Gg: ATEYQzxg6OuD4iJccVocvqYuwcUVfRy6jv6y3mounCq+va30m2yV0bas30YNlfXGJXL
	gKnfkgieEyWG18HkHT1ZNMWVzK6V5fJ+y37wcasFzw0TRhKwqv5O9Wz793z8LCXjKrH3aEqsTb3
	PnxK9CZdtb2oYRYqAAKuIsfwr5d0hqXWiSoFX6fOxVGm0lIfc8xIrMzcbXqFRu0euhV7byA1aE8
	hpGLv2r61ekSovk1hb8yEhesA35xxzSd0UDBQib/+k71h89xnl5cc0wssqdpAvkN63aLedlCugj
	qf0wxelWzBMGPQLN9r8LfaPyJ9NpcE2JaDi4JXpCWWnOnWGKGvOlOoD0UjL3yRsS9/Z0bLQYWDW
	60UU8ZgVh0cYAMEsJOVQFvLi3eQDLAb6zyTZKEIXwrLvUk1QsembL2o/INoqCgtNica+YwRMV43
	AqKPjwzrPWWhftXtlj3MJ91PBl/O94LySALefkSz6xR0cJhkmtVa1f4qnlgRD8Fk9BgACsch48V
	Dg=
X-Received: by 2002:a05:6122:513:b0:56b:1eb:d396 with SMTP id 71dfb90a1353d-56d220d0d3amr1567608e0c.14.1774442731217;
        Wed, 25 Mar 2026 05:45:31 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56ce54d6b6asm18130718e0c.4.2026.03.25.05.45.30
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 05:45:30 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56ce1384618so1526727e0c.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 05:45:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVj4vAf9EiSDEPoQ8txYWceoHGkY7Y3d+p2ldC+ll21NHsZnTEwqgK/BcG6fgYW0jT+MKpTQ8QS7eI=@vger.kernel.org
X-Received: by 2002:a05:6122:3784:b0:55e:452f:7af0 with SMTP id
 71dfb90a1353d-56d21f36647mr1622399e0c.2.1774442730756; Wed, 25 Mar 2026
 05:45:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324120435.243641-1-herve.codina@bootlin.com> <20260324120435.243641-2-herve.codina@bootlin.com>
In-Reply-To: <20260324120435.243641-2-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 13:45:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQVRH4vt_or2V2V4Ph8RGQ_CSPJtnK7iWiDcK5SxTC0w@mail.gmail.com>
X-Gm-Features: AQROBzDfv2p-HOz70T6PfmXIvlHiKxqYHY4VCUiyQuUAkOP4Br1NI9NmB94eAak
Message-ID: <CAMuHMdXQVRH4vt_or2V2V4Ph8RGQ_CSPJtnK7iWiDcK5SxTC0w@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] clk: renesas: r9a06g032: Enable watchdog reset sources
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Mar 2026 at 13:04, Herve Codina (Schneider Electric)
<herve.codina@bootlin.com> wrote:
> The watchdog timeout is signaled using an interrupt and, on this
> interrupt, a software initiated reset is performed.
>
> This software initiated reset performs, in the end, a hardware system
> reset using SWRST_REQ of RSTCTRL register.
>
> The watchdog itself is able to control directly the hardware system
> reset without any operation done by the interrupt handler. This feature
> allows the watchdog to not depend on the software to reset the system
> when a watchdog timeout occurs.
>
> Indeed, when the watchdog timeout occurs, the watchdog requests a system
> reset using its own hardware dedicated line but this reset source is
> disabled at the reset controller level.
>
> To benefit of this feature and be robust against software issues, enable
> watchdogs reset sources.
>
> Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
