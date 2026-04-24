Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024D23D6CCE
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 13:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777038280; cv=none; b=JBlmFeHNhMpqF+hEiN56zIgwTHVGi06hvad7k2TRx8UJypBQmWr3C+UIyCbUp/RuD9KgBOdStcR2yW+UQOjhELSvZg5gkoEMjx0fMjdKtuotzzk7EF4dK362gw4cl8hkkfRuZedBJJIuAd8bb0nRiebDB9XKbmGC3n70gLWPoPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777038280; c=relaxed/simple;
	bh=1EsaHT8Lnwn6OB/XIdccrHAPqaw20A7gRtQ2nTSrx3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lnwXwLxIYLvVbJNj1yXNwebYzOzbEAQYKHOkBIqYS6IxLdUASgTd96ZcTsjuWZ0Wr++4vnKZ9teCF0KKJgxciJmeiB2qj8pI7EL3v2rcOpqOZ0vUameyBdCbuk6aTMMqpY34hQ9OkXl0otH+hrfTtn8aEKBGoC8xmYFuz7pMhxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b9358bc9c50so1062177266b.1
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 06:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777038277; x=1777643077;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qVITAiWvrW92i7MAbP6rXRmEbOpDAiwmF+Jd0SOVBOs=;
        b=WNVmks/LgJ+oQMMZoleV2fpUJPrzSHsl+TIYjDDMeuFv/BZE2+u7++X2qgUnNY4ojl
         ktWOnpF62pK5ewQAL5596Q41MWqLcg7wlU/pw6QNMBm39spSNUdbxPnpVIszgbOwPUtc
         4SGIvc8KQIOFOR2ORBP+Ope/z+wC3FHWDRlVNnEv4WPTKYvpaSk7lx1Vad8uecxmHhyP
         /HPWsjkrpC+78QeHLBQE5hqX6H9+BJru8LBBzW5Rdi7U2eG4ih4UygDgG8p/vFG3IEON
         N/yHlHVoOSr0WQN6JanaXjaxlvhJTpnY65AjMrXQJWkJzJCKhAfbyYZQGwxqblEnPH0V
         bITA==
X-Forwarded-Encrypted: i=1; AFNElJ/dCuSlsT0fvofIuL4T/W7Z+amQh1Hh8Lb+HqzAu+9fMl6Mq07okkE719G7WzDTbF6+Qq9VS+W7ykk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcbigg1Qo8qABu3eKDvqdJJ+KP4pdaVXDBown10AKxg1sXwIXd
	/e/5I/N3+QgKAA2PZC6Rx03bRQwnfZm3epEyyf31r916a/z/idK94JUEtID6TGtpvYU=
X-Gm-Gg: AeBDietRi5R8ojAHPXQs6oM1QoJdDiH4hiNkaaVzECdyZG81JMKyEBE58+QgDtcnvgz
	r4z2T+dKCFpKEQbdjsoVvYLFEZkuSlgn8xx3uDjqZFDPrf08B2v1o+n+EV3xNRfy5P5jKhwCQe0
	y9hspXaCyNareIcZFnK/6RKXaCNodG53D9jqQcNpDbkyiklCnAGisbVL9SzYgqFRkvBikpRc7hT
	Cwkt2JEjbGebyxAAEN2gWeKC5fjIC4od0B3rRscI0nHdiQf0Jdv7w5sVo0iejhEz+LVpvgcWi0o
	FDGlGoxlGHJecb6gi/T/ULNzWY6irvjQO88lVATabxkCVg9NZBhjp2lTQDDyh6QzklLOU3bb2tA
	u8qInXmNkrWpNoDxA3Eu0G8s2GDCGFonBHajbv2csGppCCYaQkxZ9sP28JnhurkW8EXfPVfN/cC
	2e+4TUMpzQr29q0/jip0tyK+9Bfhid4od4k+6XcMcNN0qOP1dYoORY3m5C8JJJjoi3i9HSoJQ=
X-Received: by 2002:a17:907:da7:b0:ba7:62f:9fa4 with SMTP id a640c23a62f3a-ba7062fa21cmr1130867366b.6.1777038277156;
        Fri, 24 Apr 2026 06:44:37 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451210e54sm786487966b.9.2026.04.24.06.44.34
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 06:44:34 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ba67b332bbaso887209566b.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 06:44:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/GkKN9P5dACw0FP+z2wFnfiWiSKYXIV9BkQ6X/egm/nkUQIQJde/QWTZ4BfwzT4IqFug0839kbJrw=@vger.kernel.org
X-Received: by 2002:a17:907:9308:b0:ba7:34cb:388b with SMTP id
 a640c23a62f3a-ba734cb3cd2mr1213880966b.42.1777038273933; Fri, 24 Apr 2026
 06:44:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422233744.149872-1-marek.vasut+renesas@mailbox.org> <20260422233744.149872-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260422233744.149872-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 15:44:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUoiAagA16Cg08vTzOzC2Lx_PAZd0K7rggEsxBgZ0NMdw@mail.gmail.com>
X-Gm-Features: AQROBzBA7dqZ2ppfvOSrUp0QRX1PbdziYnEq3L5TnWuwS1i-ktuGiob_NjXbKkQ
Message-ID: <CAMuHMdUoiAagA16Cg08vTzOzC2Lx_PAZd0K7rggEsxBgZ0NMdw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: renesas,cpg-clocks: Document
 ZT/ZTR trace clock on R-Mobile A1
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Apr 2026 at 01:38, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document ZT trace bus and ZTR trace clock on the R-Mobile A1.
> These clock supply the coresight tracing modules, PTM, TPIU,
> ETB and replicator. Without these clock, the coresight tracing
> can not be operated. While this does change the ABI, it does so
> by extending the existing clock-output-names, therefore if an
> old software is used with new DT, the coresight tracing parts
> will likely fail to probe, otherwise if new software is used
> with an old DT, there is no impact.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue for v7.2 in a branch shared by clock and DTS.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
