Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FFC328B7D
	for <linux-clk@vger.kernel.org>; Wed,  7 Jan 2026 15:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767799317; cv=none; b=XNzgpv1TJxIESLo3sCYdibgsBIGeiG9RAm2ZcoBLgZS61RSTOJebWqR3lCiGzFShqSl2ZZUFNXQEaPpPpXdGlXMTikTpbUDUS55yaE2RaLO+9i78cw1Et70Wdq8XYUgYZ1Pj629WKhp9tfAK7p63we5+cKhRRDfxDOqsWi9NsBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767799317; c=relaxed/simple;
	bh=xirnzd+sOTLBfOoqrKyZ5orvmCZslNDx5L/n4t/ve2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H11BfFUg9Fc05nteCCH6/AqzMb70q74RPEKWuodce1dF3KgyumAFC236Nu9t7+jdZIJbJr77H1YZJwPH6mO+MN1Bd4/F2+A97dugXx6WDoqX/hpmMwkKDXJ+fVGA60Y2fD/FLDloCpvVoXbv5s2/CSTJyDa0HaURiF7GAcA67dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-55b22d3b2a6so715653e0c.1
        for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 07:21:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767799307; x=1768404107;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGXfYeh3k2PdpEfY5u5umPkWwmBYjzfyvyHueENf/WA=;
        b=Qk3GMQ2JU2zJSZfhXk2t7KT8yl1TUa+9YjxLzRPXgilIXUzjmOpWR1HsXcbmiZUDma
         cHv7CYMAfBkiCbWOc9+nZ0PecwBurQ/m/30NNUsvMBVp5rfESHghif/DnAkBavgAY2Cy
         +0kmGuXEagII1iqR8lXxgDEbOSXBWDioFxcFgyZOyFNat7voyuLmVTbo3RQRIZCCPz0y
         paGU9CA2jmUYynkOOEqRZyFigbUJB0jKl+WAXnuyRY1nvEm5Ei9Snw9cA54LyHn6m3xz
         DFt0S5kwYSP+QqCA2khRYZCRjrbOTWRR4CGq1yXsAD3OuRpWBv6CKcnkSbsfEfotZagm
         KxNA==
X-Forwarded-Encrypted: i=1; AJvYcCXNoGNck2tvC96CCGGquuRXbaDjbzxK2yJHbVnEaSer4bi9ZZigEeevs3aOGTZpYxle90hxjn5kPg0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4sAieyDpaS1KHL+cZP1NskFw1g8B7vOQReorlfo2ny93bku4t
	21N23lsuIDgGjYf2eJ4Xsd3HuRY/m0Ki73CQgbNQi9ktT9NYTJq0R+uYpriP48aJ
X-Gm-Gg: AY/fxX6CEANwqdY6VaVCT/iT2rBtPiV5WIJ8EWiJ+J/WHYnmfelCUi5qyRMJZT2aHtG
	BZuYSjojigVst9leKWmp/qd5TZl4/8nUS8dgtcujb7Bj41xCy01hAUJv4XlfN/puprlwEL2DQ8Y
	kP0o9dWVntJx8k9GEUNCAxH6bzzb0xxLfSPVEgyOg5rpwHwZHcx3W5VFaPM1AXSVKtAQcRTsdeu
	mvR0DtfRfDU25ulm54crTYhG139uGF1kDqK2OsjWNFtOGWvwJW4RPSUBTCduP2tNSr8b5twr+0b
	5ou9P6IQgzIV5swQ/RdY7lTwri2P3lJWUNwmhNpk8Mm8f1FWZA4rFSQ6/+yqg/NIqW891c4Gbw6
	1xh380vMmqR5OlnUzH99VZqkFaP23uOARu+HmC8oBxi9720APP3bGTa8B30eQEig6HLzCebU368
	AVQp8CqSpWKiGU7P//9XoAQrq+s18R16OB4Ag9ZeA1+QZY9JY9ngTc5yB9bpk=
X-Google-Smtp-Source: AGHT+IE0WpYqyane26HGOL9/6kvD4mAkE+KAsK4qv/ltvrCRtn/H6CFjWjAwtZ2viTRpgphPrPBizQ==
X-Received: by 2002:a05:6122:82a7:b0:54a:a2a3:b16b with SMTP id 71dfb90a1353d-5633ef0e427mr1757113e0c.3.1767799307418;
        Wed, 07 Jan 2026 07:21:47 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a1ea810sm3170763e0c.5.2026.01.07.07.21.47
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 07:21:47 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5ec838c33e6so440886137.0
        for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 07:21:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUtk4n3/nAdOXAzahSomZP02HXCnxQXkntmivKy5WSPp1xK+JEpGoRiYg+wNoSFZBePSAHINQUm5bU=@vger.kernel.org
X-Received: by 2002:a05:6102:f0a:b0:5db:cfff:fd66 with SMTP id
 ada2fe7eead31-5ec75774023mr2670446137.22.1767799305872; Wed, 07 Jan 2026
 07:21:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251224165049.3384870-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251224165049.3384870-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251224165049.3384870-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 Jan 2026 16:21:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWAbdVfTGtAdVCfq31yTNYVgmXoVB5JvPOHde-ZsVMBhw@mail.gmail.com>
X-Gm-Features: AQt7F2o6g6AUCQi8FFgmNntpDHUQy0QJrCdwxLZBZDunb38OI9ggwtqmRVYkm64
Message-ID: <CAMuHMdWAbdVfTGtAdVCfq31yTNYVgmXoVB5JvPOHde-ZsVMBhw@mail.gmail.com>
Subject: Re: [PATCH 3/4] clk: renesas: r9a09g057: Add entries for CANFD
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Dec 2025 at 17:51, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clock and reset entries for the CANFD IP.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
