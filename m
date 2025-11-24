Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0149D3074AA
	for <linux-clk@vger.kernel.org>; Mon, 24 Nov 2025 14:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763994078; cv=none; b=Hj3ZKR683AdLLzcu1GRgsn4ATEC518DBzYAmbR7MfkjEVPe3j/ZpxTS/twfTJEQcaB/922dVkDmbwIQ6WX5tO+d5hmLVqbrh7R0Z2w9my0nixbHzJ/peADPMf8fQ/0FrtXGJvx4bu4hcbY512iCswk9K37zeOnk/3Tb8JAIGTco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763994078; c=relaxed/simple;
	bh=dCfY/5dMEkVPjD6YAtXB+73QblfC2Qoexi2JBaX5Sok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HAiD++FOm/1d8JaYs9Dj8NGedKYI8RDuSALPJxh9DcZMp8Rej9fDdxIlrifa1Bd+d4duMMIN+DnfImmjpVxjPN5oqIr0jhGcg8ltpmzX7k8ajV0Ikkoz+ujnTbUTsCVkJ3whM7njxAHj7jvA4RF6bjykiZvvbckuDtZFmJa3tJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b73545723ebso813828966b.1
        for <linux-clk@vger.kernel.org>; Mon, 24 Nov 2025 06:21:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763994075; x=1764598875;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUFSLiAWL8OVw+Y8TYrXfAUgXhJH/5VJkp3fvGhEutY=;
        b=DXKlP59+IrQNPcUzMgWVlj7rPkn5NdIWoDGvgubHHJtlmbnJY3qUb/rnuWo/rHloyi
         PECLdflxBZ49fUYN0JNt+8aQxMS+RW3nj5Z+tpsOEoRRj65A8Q8pCOVy1F1a4n+k1rY8
         3qrKTBdhjoz5sYgdhbigP8U168vs1AnqRjcYYIFaupvkKrMOcMGZvzLLJBDZcl6gmPqr
         a2Yms+oTN4bKUUfWYAfxDYKkWVL7Tbf78Xc36cKx3Kc5joNCqXHgXewzcG0hTM2D23iI
         1mnX3pwEN5kFNCiSNjWl3ex5rghSBpjuJ1k0dxCND4uCkyX8q43cJmaCy8kCtZdd1Rzx
         Lqbw==
X-Forwarded-Encrypted: i=1; AJvYcCUmkzZTxm7h2qVlHLF6FNm3FupmLGQgYPv8gYslcLnMosmX7rDxDxe/pSTdYtq8y1m+UUd9JwtlQfc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdsTpPkzywlweWbOzQSHFi52va2TqB11ofN3TpeZUAOk7uR/oB
	U5ftmsX6y+jXJJ4zBEX13hX/JcakVp1ZZZ6dvSXOX9kmdlyPYiebqcmi0GQkdB8xLvk=
X-Gm-Gg: ASbGncsHqg6/c/6BWSD8ISBBQmjEUHhSaQL7y/wxQp2xqWyrmXpgb2VDVe/AF70mVE5
	/mYJACBCTmraFgEbSH2bxzPLAcEfJYeC4XvlcUmsSmjCqBIIHrTbtaSvTZMl4GKp6tQHpcc2IaO
	zT/rDzOy3BEjevj7OmI4feBNaiTgetxg6idv12yFzZCfyXXgkoDkqJ/WDDdV6EyGpaIbmhBcT1T
	xpaT59Sfbx9gZ1fis5EMmkr0uvLnnPxE0mUcsBW1WCQ++l0Oz1CRpXdQZiOTd7ixpWPS4s5QfEC
	WOXT4qc1F3qixftlMzflCzMF+FYGUgH4V1OHMaIC00Nhut20kGU3WSSdWQx5ZMTgiywhYIwQAPJ
	j2sNbwm0EsahYrastRvPg1HhWMUFFILUPwJ6+4JyCgjdpSN0l4TwZGU8lFu6ZM8RVyozEHdw7uL
	lpU+wIVGaXM+jfreKQZddyeo9DKs9SnMP0XPUYUjMKMODAnV0M
X-Google-Smtp-Source: AGHT+IEqhgDpLpwoa+KhSrmKQUkZWTzJvhglW4qacxAJ2/x9A3QtcLKk9foOc6pzxh1q5wQXUI+TgA==
X-Received: by 2002:a17:907:7f08:b0:b72:6b3c:1f0d with SMTP id a640c23a62f3a-b7671a469e7mr1032149566b.35.1763994075087;
        Mon, 24 Nov 2025 06:21:15 -0800 (PST)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b765505dac2sm1286259066b.69.2025.11.24.06.21.14
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 06:21:14 -0800 (PST)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b72bf7e703fso714800266b.2
        for <linux-clk@vger.kernel.org>; Mon, 24 Nov 2025 06:21:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWbAYRQPweNlxYOOR+uzpDCv/jVYPoa3E3vfzrYty6qolNsQ6RQearQyFAz5t4KMOAcv/WXGnLWJMg=@vger.kernel.org
X-Received: by 2002:a17:907:7213:b0:b73:2ce9:fa76 with SMTP id
 a640c23a62f3a-b7671a469a1mr1156653166b.33.1763994073952; Mon, 24 Nov 2025
 06:21:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114193711.3277912-1-chris.brandt@renesas.com>
In-Reply-To: <20251114193711.3277912-1-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Nov 2025 15:20:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW98bnhfGMhvX9gUekgjS1fEhebOUvxzv9GXY8v3u5aRA@mail.gmail.com>
X-Gm-Features: AWmQ_bllDnnos8zJ8Mu8saYcqAuJrQ-8hDIk3lfEy3od343oWUHxQ6XMSDK77dQ
Message-ID: <CAMuHMdW98bnhfGMhvX9gUekgjS1fEhebOUvxzv9GXY8v3u5aRA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rzg2l: Fix intin variable size
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Hien Huynh <hien.huynh.px@renesas.com>, 
	Nghia Vo <nghia.vo.zn@renesas.com>, Hugo Villeneuve <hugo@hugovil.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Nov 2025 at 20:37, Chris Brandt <chris.brandt@renesas.com> wrote:
> INTIN is a 12-bit register value, so u8 is too small.
>
> Fixes: 1561380ee72f ("clk: renesas: rzg2l: Add FOUTPOSTDIV clk support")
> Cc: stable@vger.kernel.org
> Reported-by: Hugo Villeneuve <hugo@hugovil.com>

Closes: https://lore.kernel.org/all/20251107113058.f334957151d1a8dd94dd740b@hugovil.com

> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.20.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
