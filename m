Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E18B405C4A
	for <linux-clk@vger.kernel.org>; Thu,  9 Jul 2026 10:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783592966; cv=none; b=qhAzd+syTOgVIgAa4wcQCdQ05Qhr1GmJ88rBPn8QDaKcyGGRpVJQscRLv/GUJVe5Pchvb/nvTBnmGoyknscy8+h93bMZSRG15YZgo92oxDsTGnxYEEPfOfRPbE3ofP/eiukiMacCo1DHV0ffYyNdShmskC18Zy5v9J5TnjWsRvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783592966; c=relaxed/simple;
	bh=SGuHeYTcGstwO5n9DDhvCGTcKVnams+042+BkbBAGTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mtUcyuvzL4B84n1PB/ZwBT7Bys3DuKy7CsuJJJcJvSvUEJG3q8i6i3yxAugnUtUYZD+9qD4EBc2dsy+SXzSsL03h1ji49ovd106Uis3bBCjZZ4YA/nAapsUayglZBByCA05KTMio6wVupMqai4NliiC1L1mh32+qlChNl9uGluY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5bdb162ee53so1192041e0c.2
        for <linux-clk@vger.kernel.org>; Thu, 09 Jul 2026 03:29:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783592964; x=1784197764;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZamOEqvf20g5QpO72EPkaDRuNkZPExK+6Unu2WZF2DI=;
        b=jh90XTBX6vKInjVO0z+r6c05iSzjEg28KhTs4np/ZlK74g5+3DI3cU2RhwvYSd2aSm
         rKDTrSx+0It84oGRQWttrN/ZvwtEQWxR7zweN7dP+LYPbsm+gBdz9vV8O5BOlJNPryeu
         CmJSnZdVKuANLejp/XhPk5njvYTVk1e1z42yJsqfbfAbghDEYBfhylCbb02KiDLfwRFl
         FhqHPf4j32cvvZh2LO3126aP+GSZANqeyGAisGw2unIcBvtSU763wb62dBKFRDBif1Df
         BEsKSbKtbtytGX/70XOV84pYM5SA6lmXvUT3ahZty+0CjzD7kcuEkbNYYVIF+Bd+Zs9Q
         +e8Q==
X-Forwarded-Encrypted: i=1; AHgh+RrNeecMjqIsZaa+PmVkzxi3+V/9T99DQLOOl7uudjGbYYTgPExEoJxlc56ST33FHJ9fAu+Q/SUNdx4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWsOa6n0n8Yi8An5Xh6zHy9Zl5StA1OYOhGC8fqrevRAvBv8VY
	nxotJU8cNIeWkM3912ZSPhcKTIY0ypYEyqP7247nehZbdBYFbY1SNfk6o52I5GJiyYc=
X-Gm-Gg: AfdE7cnEQ783nuDAh/2vbra1AA5J/SKvLEQD3tUB5uBbkAdB5OyGgX7u0V/ghyyBPeh
	PohO/Zo13ThppDHnvBsjEtAGTcTc3XYdaR561HZAQ3jsyODhDsHjWJ5whD5O8i6JNkDOwD+LexL
	HHJi2jiGyl5wgErv8PbJHaLGp4VlzowKi5R6ZZW7un9n5IJL8pX1PedFivtR3RS1UjMCzZufCWg
	ef7grBW77U3gjPiaZRr4/cNZAOddh8ZA24NgGWWPdCZjA7H1E2zCghM6VBMl7Ym5FBSBr8HFIA/
	8ckwE/pXw6CCb097Tfr0SbcxaRj5cs8AZrmRJz3krn2f86phXt1gcxekj02QN3DdVqvzoTkQFys
	84IXjXMOcErKF1KMNFRMI4QyDbGvVi8kdnDMk9sPPCuLdK+N0cpcH2popvqJjl2uqHZAgXqOMSU
	Z93LRTcd6stPcVlh32RbgnAbzgamghVHLeqBv3fy9eE1n1DKM/l5NvxQ==
X-Received: by 2002:a05:6122:c96:b0:56b:9b7b:83e7 with SMTP id 71dfb90a1353d-5bf75d97259mr3611151e0c.7.1783592964252;
        Thu, 09 Jul 2026 03:29:24 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bf6f66eb74sm3200078e0c.7.2026.07.09.03.29.21
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 03:29:21 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5bf8e1edc3aso298958e0c.0
        for <linux-clk@vger.kernel.org>; Thu, 09 Jul 2026 03:29:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrMxGxNP/ZGxzeVvJQdfRAFl7OK1uRyjcR1hLDhS98mUwp6BVmfOOYv4wXrzEDTcVXD6mtW7IWlyW0=@vger.kernel.org
X-Received: by 2002:a05:6122:16a2:b0:5bd:9d27:1ded with SMTP id
 71dfb90a1353d-5bf75d09a7dmr3522535e0c.3.1783592960849; Thu, 09 Jul 2026
 03:29:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783505142.git.geert+renesas@glider.be> <23f979b0903ca11513ac339ab8b6dd40435603c5.1783505142.git.geert+renesas@glider.be>
 <a069d50d-030d-4189-ae9d-37f989829da4@mailbox.org>
In-Reply-To: <a069d50d-030d-4189-ae9d-37f989829da4@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Jul 2026 12:29:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWCXVYtN+jykp3Uz4tBHpWwW488=NguxSpWkYkO63BB3w@mail.gmail.com>
X-Gm-Features: AUfX_mxryCBg0UJms9GxmXbM4sVe50wH12jLcYc8l3gBc8Xa9jNslCUWm3ZIyfc
Message-ID: <CAMuHMdWCXVYtN+jykp3Uz4tBHpWwW488=NguxSpWkYkO63BB3w@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] pmdomain: renesas: Add R-Car X5H MDLC driver
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Wed, 8 Jul 2026 at 23:55, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 7/8/26 12:15 PM, Geert Uytterhoeven wrote:
> > --- a/drivers/soc/renesas/Kconfig
> > +++ b/drivers/soc/renesas/Kconfig
> > @@ -358,6 +358,7 @@ config ARCH_R8A78000
> >       default y if ARCH_RENESAS
> >       default ARCH_RENESAS
>
> I know this ^ is not related to this patch, but is the "default y" and
> "default ARCH_RENESAS" above valid ? I can find exactly one such use of
> Kconfig in the tree.

Thanks, both are valid, but sort of duplicates.
I will send a patch to drop the latter, and restore consistency.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
