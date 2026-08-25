Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E0048382F
	for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 14:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787668569; cv=none; b=YhmkACtyfLCPQfkyf59t3nyBpKfID5LJHnhmfJrVPFSCEUd8YOcX3/x1Ynfxn6+r0p9ug0qEcLHmHyh/Z9lJYUOAVuEsFk5WWvHeMxP5LwVGt7NKhq9k9DcehvNRG10Co62uYCcjnT/5qLYjMzN3uXF90BcZuQbdfBxFGqFHwHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787668569; c=relaxed/simple;
	bh=SCzinYuXLvjSrigmXaPRDipldJ+Qb902vZtP+PB/9Ko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pWX5xJLhqc4kPFTDyZxhf51fen8rIVbbQgOKHG1YPgRO/zKjtxpzmDz+cr1EfTmmMqCxVCeU8gVQ0S/W6t5CEP03vqRBY5SwYKei3byly7LfCHZD0jq1uhN/D7y56IRxt8NleBccrVXKhc2HDFcIE22S9/yix02xTbTwc1mJPGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5c2c0df0b45so1968844e0c.1
        for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 07:36:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787668563; x=1788273363;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S/BSqxIsytWuTzQX94wx9xNgvPdt0/g546s6RHG6Obs=;
        b=MNt4v1FTO3zxjZ4TIxrHFbYLWGV/mr9O/DSm93ufjgLHNOIyAqjjpV6iOFNQxZws12
         wHntGdOtomtL/hkPCd+PPxdfM5/AROwU2MJlSv/GycvIDUNaPAKawiUbuy1UDav/DHC6
         Jibfrxley2tegCjbNGuNAa5MTJbwsTDwbi4s8ZrosFiP6uekFr0dCxua8CEHuDFEfSRp
         em6Bk1ARvRXxbM/I/tKRumsQtiNuriVHApA0JubdaNjTWj4KKnwu+Gk0X51DDveeAXBn
         iwgaJZsYsbZVC/aa/0VbQVUp9pJJnl7qWqE4hgpDFbFusdjIpk1E29PVm+jUDQWvnCdh
         oraA==
X-Forwarded-Encrypted: i=1; AHgh+RqCR7YuM54QgNWZefzs9smYqwWTEhX++sB6bU5WQZZ3LP3S5ad0KfSn6PDtj+i4gnHlfEJFD/Fa7RA=@vger.kernel.org
X-Gm-Message-State: AFuF++m8Te/b0bxx8n2PZYB8Pl/Mt02A+IVEfw1owgG2J2C6/lcbkJ5Z
	lb/OtGZ94dRuymSFf7/hGiJPjJf2AOUfp/+V2LNkIfYj1lHvFyVg/N+NfpKQHqMseNM=
X-Gm-Gg: AR+sD10rZ04Sur20QiZvVLwJyrvOxFiq8FcCK+Ycbt9hMfah8sItJ/WnOXpGSI0g/jg
	HSIDEgoglhSVfv+5PaBIuO9E4fZ29OTwkGlI0/Z2TSAUmjZbnHhLnt7ciB9TAcdvcQ/Fd3LzFvo
	yTbHdpNnlBxhqFbTLtplQ4MGSlkzcwpOFwsBtaqvjZJwOMmWtHhhmXThwCAQ/tsdOT9SG1zlZN9
	jIpz3wEdJCbN5ODjaGgcysTw00ObdMGv7kSEPT59N2vbKBZOnbQD4GtDgCgvB8Y/GUgJxlvmxkP
	8h9+oDWotgNP1kaDO7QLwR8tlA7CKAqwPDmPi89xmJR5Vr6TJCer8GkqVgcMJg2CqQeWh2jJcsT
	CvzHut4qM4YCEhGyFDQWJ5o6t0VVEiR5rxiCDZS0pthgRbChG1A5MrwyqlHeWqwlrOWJr7/XVQS
	SVAN4i7Km3yWgkuYa5czulILuQd+/8iz3rz6z3VNFXf0qiUS6RrMV140jNOs+ZLAgqamfYjUMWE
	4uT7IcKPoIPEqHe5Tw2uLqPcA==
X-Received: by 2002:a05:6122:46a0:b0:5c5:d531:2f4e with SMTP id 71dfb90a1353d-5c5ff7f198amr13217724e0c.5.1787668563045;
        Tue, 25 Aug 2026 07:36:03 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c623cf46ccsm6114323e0c.4.2026.08.25.07.36.00
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 07:36:01 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9696319e14dso1607472241.3
        for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 07:36:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpHI2AhKFXdYhT/OBVzrK/2sfKOXxHxzGQU2NvD8cU3Eao9Za5xQe8o8u1xUR98z6+GvXX3LMgTn6w=@vger.kernel.org
X-Received: by 2002:a05:6102:2b88:b0:77a:3431:669f with SMTP id
 ada2fe7eead31-77a63f32c5dmr11778556137.7.1787668560584; Tue, 25 Aug 2026
 07:36:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714173315.1981708-1-claudiu.beznea+renesas@tuxon.dev> <20260714173315.1981708-3-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260714173315.1981708-3-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 16:35:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXc_0Gc0-m1RytTSv9w_B4uMjPe87WQHg0QFP8LamD0yA@mail.gmail.com>
X-Gm-Features: AcwNN1Ukmh5UKBc2zk9wzu2Sw0eK218Xlo9LtqimuxAbEuTVVRxy77cCcK4Llmw
Message-ID: <CAMuHMdXc_0Gc0-m1RytTSv9w_B4uMjPe87WQHg0QFP8LamD0yA@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] dt-bindings: can: renesas,rcar-canfd: Document
 RZ/G3S SoC
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: mkl@pengutronix.de, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	bmasney@redhat.com, biju.das.jz@bp.renesas.com, 
	fabrizio.castro.jz@renesas.com, claudiu.beznea@tuxon.dev, 
	linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jul 2026 at 19:33, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The CAN FD controller found on the Renesas RZ/G3S SoC is largely compatible
> with the variant present on the RZ/G3E SoC. The main differences are:
> - the RZ/G3S provides only two CAN FD channels
> - the RZ/G3S supports only CAN FD operation; the Channel n CAN FD
>   Configuration Register does not implement the bits used to select
>   classical CAN-only mode (bit 30) or CAN FD-only mode (bit 28);
>   consequently, bit 31 (CAN FD Frame Distinction Enable) of the same
>   register is also not implemented
> - some bits in several registers (mainly reserved or status bits) are
>   read-write on the RZ/G3S but read-only on the RZ/G3E; their behavior is
>   otherwise identical: the bits read back as 0 on both SoCs and software
>   is allowed to write only 0 to them on the RZ/G3S
> - the RZ/G3S provides 256 acceptance filters, compared to 768 on the
>   RZ/G3E
> - the RZ/G3S can use PCLK clock as the CAN FD clock source through an
>   internal clock divider, while also supporting an external CAN FD clock
>   source
>
> Since:
> - the SoC clock generator provides to the CAN IP only the peripheral and
>   the RAM clocks
> - when sourced from the peripheral clock, the CAN-FD clock is obtained
>   inside the IP itself by dividing the peripheral clock
> - the assigned-clocks and assigned-clock-rates properties are specific to
>   the CAN-FD clock
> the assigned-clocks and assigned-clock-rates properties were dropped from
> the required properties list of the Renesas RZ/G3S SoC.
>
> Add documentation for the Renesas RZ/G3S SoC.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
