Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6EF3DB62E
	for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 08:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784105935; cv=none; b=iJ+Q2OxBKjBRN8HpxDCx+Ua9tomSu/OiqhjjIx+q0KIm109tCxIyCzeiO8ejhK+LYIvMtZq/gd9Y8/HmPUxNQsNNUXlh68Rjz1MHsa7bXrvIblPEcFWlTkkb1NiVXn49LFClG3ZPQFmJMTbn1VzHNRKvNh54RPRRczBUhVREoxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784105935; c=relaxed/simple;
	bh=cd7DBG096VF7/MN3QhC9fHqLP5wSJXhCQl8cwkt8dzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gOxSg07XE54CgT5Q3UKBydOZjD9tqKcMD7/Q917as51oHw6HHU0ZrvChRCE3eS1BuFmA5ATvOViUIcQ8jsQnzYBg8NUx6dhl3FFmfsZtdZsVtVPA6pKFggh1zUyjV/adw7+0CiqgXFas7cuiSqIFMfuby8/BIMfgNMDpDeygGmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5bfd4795097so865927e0c.0
        for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 01:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105930; x=1784710730;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Em+8fgb0ygi1i2LhSV0Cm1ShdIUU1QDIn9O8w7QaQ/k=;
        b=D6ujNJHnUGoB+QW5vDg0RwO8aVpuvGosZkwM3PyBVwRGmCvUggLflwUOo1XCr/dpB+
         B+PKylchIiRG3EdqWzn73UWlcg+kdmbqoC4b5jglCq24gQ+VR9pfZnJ9yydE0fzyEhHN
         3skmret5AeFd8ZhSPi+fOE8q4GPar7ItwlsSFP6fj4HtTpPDkpdgv2NUQ7JFMOXuO4Md
         hmDhHYhuig0NSYefduCmvMC97BZhC7TSWBHfspndAEl5/DOnhgvsIKp6b7ukZsgdrjjt
         LLsgEk6872AOq4PV60b2WNqZjuMBMhEUDnHXiLDF9fhWwGq6mJJuR5/bQtPs3TZV1i3m
         ZT2w==
X-Forwarded-Encrypted: i=1; AHgh+Rpoz55b+Gl51/WLn7Up9BBJiO4qAWMGhcsWkJ9ki1azJFe5oQ5ytxu5dI5N6VFnKv+Aw2jweUlzc6c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzA6dWD8j1ksUPkkPS7KOiHt67GLiJGAnMu/e/9q3KigMUI2qqa
	J1GqERrRsPhQvaMl47oMS5PrWtK03GMA7j/6YaoIj3Hk0qBPYeUINW/TCGZ/OWA3vuQ=
X-Gm-Gg: AfdE7cmu1mHNJ2lMToLMgYaslr8cRE4K3SSLbi5oWZ7zt25kwPDQ2VBS0buLMhHhXIC
	k8r79iU7eFtpwJhSq2rC0K8X4MXDNDzj9RBi0jAdcVKw6MqrLx0tNyrhSb0zvWALBeWDQOjrZ6A
	LYl9V6Grq6u0Q0FVIJEUBwSDwReehoUrTlVKnt8uCqtu7VBLrt71OggCC3k2nRPHjgbZEwKBPHd
	xKFf1K8QEtZp3g9Ba8U4CKqZD4gg4WP312W1s5LDJKCTjf/zwA7V1nnqnG7VlzQlZkCJ1mT50hI
	2u8wDlP56HD+cZqnaEL4+lFq+EbH2rp9GKadUoG3Tq2+L9nxQ2J8xBNoea/pZNJA57O1wV/bT9D
	S3kbH59pkTox9/opM1qfbzLn4E1u59Z1MNOnuVD3lIZo6TUXbMlXkyWyKC2xXvgI45fR7iejctG
	QybQshd8WTyHlTMxsoLp/RLFso3jh7usnBdeq69/wwJetKZHxxfw==
X-Received: by 2002:a05:6122:130f:b0:573:a779:62cf with SMTP id 71dfb90a1353d-5c10ed08a84mr3158395e0c.7.1784105930455;
        Wed, 15 Jul 2026 01:58:50 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bfcd6cb807sm6324079e0c.13.2026.07.15.01.58.50
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 01:58:50 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-9696369925aso1714098241.0
        for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 01:58:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoYH4KwIaUEiOLbJH3GexeQo5NC1oh/F/AbyrY+mz8j8wlp4Oz91Uq9vs8VizjathLWSTAsdDo+F0M=@vger.kernel.org
X-Received: by 2002:a05:6122:82a9:b0:576:c4b:460a with SMTP id
 71dfb90a1353d-5c10ed0389fmr3961224e0c.8.1784105930097; Wed, 15 Jul 2026
 01:58:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714173315.1981708-1-claudiu.beznea+renesas@tuxon.dev> <20260714173315.1981708-2-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260714173315.1981708-2-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jul 2026 10:58:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUgvwjb7zNnsRXX9AzaUVAhVmks4yU5P+pJ0in6NyA+ww@mail.gmail.com>
X-Gm-Features: AUfX_myYPtAhsLzqsMqdAVX_MCR49rN5A1iR-oDlp3d9aq2XNRWC9ufPlL95oJQ
Message-ID: <CAMuHMdUgvwjb7zNnsRXX9AzaUVAhVmks4yU5P+pJ0in6NyA+ww@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] clk: r9a08g045-cpg: Add clocks and resets for CAN-FD
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

Hi Claudiu,

On Tue, 14 Jul 2026 at 19:33, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Renesas RZ/G3S SoC has a CAN-FD IP. Add clocks and resets for it.
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v3:
> - none

No need to resend applied patches.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
