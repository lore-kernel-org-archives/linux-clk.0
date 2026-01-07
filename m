Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C6D3596E7
	for <linux-clk@vger.kernel.org>; Wed,  7 Jan 2026 15:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767798582; cv=none; b=JcNy20vG64rShq7K4fpRz1hCsPnYpv+vpcjXCSKeb4McHXeh7WjEK1GK2OJXk1jXXfWRABtuH0co9FHi/Hf+NpneoUI3UKo92JstMa7nootmHt5pb2v1UV/Kpir9uPgnbr75YYXE4O0RN8u8t36QPEe63zgZh5hLwK+JeY/3+8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767798582; c=relaxed/simple;
	bh=7e5qMhBj9x3w9tILzgbqJvwRYvlcmzRy5BTflJWO5/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cTUbu2i9Dlfo2OqhseECHsXd2KXNBMEW29f58JLFZzKBOxBAG82Vyvt0KfkV4wb5QrXAvkXala+5eJkfgdhrXNFEhL9y9m60tWhdZ20SSOcABoOjFh1McrhwSvxN+zSULTneAp2bzIm3o9pDAcPvDL31grBOkBVJ1xbIs5nhKNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5ed0a9cbb3fso304699137.3
        for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 07:09:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767798579; x=1768403379;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9dOzhpI14IYVqSU7+juMd2iV4APAFjyTw7MRTrqVLc=;
        b=nPIKsvyL4bLXlQ7uNU+ybLGgYFHjuGupRh+hLdeRY/pY/MY5iQ/05qvsIKMJToft+Q
         Ysic5ZcjMJW+O3bAGv6dyYSZEZdXpqvrCqym8Ra70PLcNW92IgeaHkE1f6EFl1Zyd3et
         7K6iAPujFeLIBPRtgB4XualdkyuP/h0tvXKbou6XIQqVuTUQMplBPLrOewxFUgBw/kvT
         d53fFOx06FaGUo/QqW8Yh8mXPyqlAAqPBGkEWasq/FFcSU0JavzrM5P+Q1UB7oR1PTW0
         VCq3aMOJlQykyGwBk6pI0NZqja6+CSBvAgA4wftMgGLaTk6oCL85J/XZ+r/yo3odIveh
         caNw==
X-Forwarded-Encrypted: i=1; AJvYcCWCkA0KRsPgywN5yb0RuPFBCzTsO9+3l5utqSl2x0ONVYG36207J77BzYYhP/2eotxQGNIpc4eJsxE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxjzlJOBF7RoBs8Zxi/nGt7+fVKKDplQMKhkaF41x+7qvheFc+
	Kbu0dKU+C9yPsgFxvYQT3EnMKUq7/7LuAl5ng0RGHBq5u8GJtDgIhsmgIGC/cW4Z
X-Gm-Gg: AY/fxX7bEjnqRLlU1lZws9EE5iFoc7xXEEu3TQcEWgpnQElNQ8SmP8HHH7ioVcIFBZC
	1IXrnfHpQ6iMJzZt7/fLVoMk+Cm39D8dCq6LnHpKFjDuTdUNwhEu5W5O535TKAHZ+vDrzNbbNhy
	6KHjYFSoAJ+U9nKQQFZlywSrhZBrAa5Y63km9zwGS74uJlnKxPw8B4nbQQrErbnswhXnTzQfqfY
	E8QLxKC1uJI9T6OtmbI07H36qIPXgvyAiO19mwYQVRV8TZM2Yo2U80aw4Moq4DgmUktrShUKirD
	qF3BvbjirtHTwXRbzxHjDz4bobkyP/rnwlxRxpSRkBFwOCVkKvr/XYd1LmiyC4r3pAXaZzjV6w6
	0zy5ZJJT6v4ScdQEHHk/gOWkCwG5qQXx0/vpjaD/r5vaXdHVF9U9b8FE3LBb9mP8YqU1UUamXq3
	pHObrbHh1C9Ufg11jzNCot9SwMNkrNDX68fDHV6PihZy/3k3Ld
X-Google-Smtp-Source: AGHT+IF29+ByyDfg/s4T5x2hCGlQjCqKdxmC3Le28bm49SA/mFNCyzT5LlKTjD88dYVaX1hXYXOA5g==
X-Received: by 2002:a05:6102:3a0b:b0:5e8:1dcb:4e07 with SMTP id ada2fe7eead31-5ecb6937d06mr1028618137.21.1767798578898;
        Wed, 07 Jan 2026 07:09:38 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-944124c452asm3001699241.13.2026.01.07.07.09.38
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 07:09:38 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-93f5905e60eso1255005241.0
        for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 07:09:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWBtQ+kPsHjPNyv7tV+Y67ogg1X3zhoWzern/nqi0OeRkCHf3r5JZW+628wiiS8HH8PsbFiYtVSa/k=@vger.kernel.org
X-Received: by 2002:a05:6102:3e82:b0:5eb:fc32:935c with SMTP id
 ada2fe7eead31-5ecb647f1b2mr1034227137.3.1767798578356; Wed, 07 Jan 2026
 07:09:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251224165049.3384870-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251224165049.3384870-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251224165049.3384870-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 Jan 2026 16:09:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWC_863Fzpo7SstLiFHZYxmomVkbiPWTrhRz6=kzaTPFA@mail.gmail.com>
X-Gm-Features: AQt7F2oYUDXscAVf8azPEwYoK3VQ5BFBsRCCHz5MK4KxGd9dpeXZLz8ZiwfozR0
Message-ID: <CAMuHMdWC_863Fzpo7SstLiFHZYxmomVkbiPWTrhRz6=kzaTPFA@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: clock: renesas,r9a09g077/87: Add PCLKCAN ID
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
> Add PCLKCAN ID for CANFD to both R9A09G077 and R9A09G087 SoCs. This
> definition is required for describing CANFD device in DT.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in a branch shared by renesas-clk and renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
