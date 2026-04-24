Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAA2353EEB
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 13:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777038480; cv=none; b=kEYPvDugmhtM62VVzHQ5/YiyMvnWahj5ew7QsgOuTK+0es2npOWHcIiuPPCMe5ArR6jLEnkvbiuTfjsgdkp/wdB9s5aqV4YjSz2ACf9VTjtIVNGzfSXCDz+NSjh6KleavORM635HvWtDa2aUAY6IQ0ekNt6ZMk4zP0Npc8igdbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777038480; c=relaxed/simple;
	bh=09Sh707RFRsbA4Cpc6VOVQ7w630BPN+H1W5SBQ8X4i4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RhcBn6C8lFo68P01TG3dNVAp5jnyBuhw/c+7oL/zI2WtthL0T0eVf7tDIOQfvnHCMGi2/M6K7okMSOJAXgt5HlPLszeM3armqW/knmGYnrkIvzQwBdNSc5N3JNfw7e8Zj2N/LFP+syyGje5c8tPoIJe7+Kw1Ov+ggAO1NDW2mPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b9d9971d059so1153434566b.2
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 06:47:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777038477; x=1777643277;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MxbBEAEmkzXg8sufmQelLSZfpgBcx3HXgkzS292cULs=;
        b=LMvlO+lmIWyR2qQpIcW89BcEs+X20+1IvM2NG3x22JyV4XQm1u0MWyb+imqDV3l2Wp
         kHf3eID8AVahtFB7h/j8gy5aKDs5VyfpEs8CDCuRCcIBDMzG2X0yAO28Qii/e6W5lrIb
         D3ZZD1/5QGawaF02kddWPpzl6wZKBxbkkYpzskVL3RDc/h2kuiIVN4PHrXycnvFNFFQi
         lQ1R4E+KZicfclkCGX0itAMdk2y7L+CLE/NBUYCiIlE7J50qC3dW3UNnByF7+p+gSjK4
         OkJ2QTaAW7Oqel6s1RB9WCnDadLnmYToDQmKoVet7AM0i9t1dfNRqSdkXaalGB1dxXoI
         UoBA==
X-Forwarded-Encrypted: i=1; AFNElJ/OItAQ0rPeGOGOGqFBGfchfXvEFVpLBIQTeRPb3Wx8S8t0SitxdtUVTPvjFZemovddE8HwQlMHnbc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHEy3AIy2tldPbhiAC/F135fQniCz7uEoLqYKFw4BXcQgdnRob
	MZTSpGjqR5ODMHMlH4Z+vnkKidff3+JWz+mB0t5Gx+P05EbH6ebdeQABpBvhUTzegnY=
X-Gm-Gg: AeBDietpeLVmAmwLevbliPRI/xzB0uQqsm+tSQrwSzSa+tDSHzx2oOPVIxel2mpK0j3
	5oDGpUD/bGB/YU+iMHnvAPF6UAW0w39Yw0pHUssY/4fH27zEkNK1V7b8gGZrlmp4T+nwv00x78U
	UbAFYpu6icSFUIs7YzbRI/0IbDypN2/m2jZLDoapcE8YpTYfgbFH+cO8iBFlHLi+mCg2cxXGWVb
	r8M5An/7KWgtTRACEeUzfLuDDs8XR2YLyhTt3vl1pkKuaRFc4ywSCRxCmsQQnr2uxX9wu+T8tzn
	QU8CE+txlWaQySjD1ThrOc8m5U84rayG0tbSiGKyQ3IxGeQ+ewav14BHqODwlese6mhlZoN1f5/
	AK6YipH5ulM5/OttOkosMcBMI6n5jfh9wCnC1I5IYUC4WOjyP7/0PHNI9aGs9v6U2iaWh/GHi29
	z6+5ACsvYPgkMD1ZnuhSzRM4thQM9/nhu9kJAswq+agAGE89x5G25D98Dpt3WLTpR0hjq6x64=
X-Received: by 2002:a17:907:a0d6:b0:b98:595c:a76f with SMTP id a640c23a62f3a-ba418888cfdmr1557205866b.16.1777038477029;
        Fri, 24 Apr 2026 06:47:57 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d50922sm4660097a12.21.2026.04.24.06.47.55
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 06:47:55 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b9d9971d059so1153428866b.2
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 06:47:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8HAO2ueeiAlbtoK/a49xrPn7jh/vgVqwC/uasels5Gq2gSwx1WsBkX8+b2OrzwdGlGFHvNypUILlY=@vger.kernel.org
X-Received: by 2002:a17:906:f593:b0:ba5:234:13cb with SMTP id
 a640c23a62f3a-ba502347802mr1522477166b.4.1777038475099; Fri, 24 Apr 2026
 06:47:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422233744.149872-1-marek.vasut+renesas@mailbox.org> <20260422233744.149872-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260422233744.149872-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 15:47:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtAcB1SoYz4jZo4s7shMi3+=Ovt2pw6YgRedvSiDT=3A@mail.gmail.com>
X-Gm-Features: AQROBzCeSX9qxN5yqtzC3-PAZZnXar2rEL_AsOuEwJq4ANARfzjj6L8MVrx53_Q
Message-ID: <CAMuHMdXtAcB1SoYz4jZo4s7shMi3+=Ovt2pw6YgRedvSiDT=3A@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] ARM: dts: renesas: r8a7740: Describe coresight on
 R-Mobile A1
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Apr 2026 at 01:38, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Describe coresight topology on R-Mobile A1. Extend the current PTM node
> with connection funnel, TPIU, ETB and replicator. The coresight on this
> hardware is clocked from the ZT/ZTR trace clock.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
