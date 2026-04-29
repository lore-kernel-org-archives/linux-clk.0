Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0C53EDAB6
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 11:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777463584; cv=none; b=H8dHHRjPo5Phv9KbwO5PYACA5Kiza4BYbYIRfC9blaXEQpH60aF+vEm86t9km/sNFAcxz8LfdKWEwlNesblqeqmV3l5Yex0GJiqwSW0dI8k/A/LT5Vx4SifcvQ765cyelFLP6J9dPdkEHuQQHTUWGo1YYlf7JGl+3vW0tdkK6ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777463584; c=relaxed/simple;
	bh=XXFyujGrM3k+GZFKEyqRdilaXBG204QClf2AQk9kJz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bm/zjZMBNEMGyi1Bxa8OoRCWDXhskIV9Sh+XXaNVZKnPkV1rfwc/JeUTWWarP5WX//8mokA9VYe9cyqlWb3hM9jsZjTiyPIW1J3rvolnoyx+1XS6+vzkwSrOi/4YEp0F61lYqVOvAzFBLhi47S1rlMXGnsH/6Qrf0EOmjCGQMNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8a016799d2cso135844896d6.1
        for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 04:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777463582; x=1778068382;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1eQI/JeVJWqMxkzWYnwpYH2rFZzbRa7DUVbDEpXwBWE=;
        b=odIvAJSBHPyGqCmGuPsNLPwEm5zdP23MHQgYZ4cMCtGcWmNowIqZ4crERHte+Qe+G7
         h1kQZ4cWHmaEkfBE6QsA7jWNlnRd4lqQHFdq2AOoSphtyQGl/rCDUAmBp0zi4lKnr7rs
         vYCxixjiCvXjvOYcu0ec0oJcQMgIfyxuJy22Zv1x3dc5yzQ7lQkOp+V3vqAZCItgtiaj
         ES1OjOd4qI6JnmqhEzcMy5ynE5dVHN7ztXHhMbxzTJXXRHgbnE3lAWbgmt4zP6tBJyFG
         aVUUmxgPEqW25LGQnXQ3bbt795MoK3k5a4XxuMl5umkFRiievbjnEdobLrbDF2lmabCO
         0A6Q==
X-Forwarded-Encrypted: i=1; AFNElJ8d12F7dCpQdGOnJtBElM1kxjvAnamahYDF0yOBZNg6gQziOOMF+Y23EE785VyzUDXIm4HcUO9vdxY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCG3IksAp5Q0BJeAM+AWI1Q3AIKEcKKTcz7Xcu2F7cNy6NpVCK
	LxuawL3hT4vAkJPgAH6lmWNp9gKihoCo/pRiUsewWQzVQu9nxGyU3m8btGAzlMRHDEI=
X-Gm-Gg: AeBDievFWC7/Q/oauxFgYcZ1bLze+CJBa42H+mJUK5El8xiUkVMxYCQF50WsM6IlKi+
	Rfq5VPLiDowg4geL2YdNYrTIj++mbDupPQv/AO1j/4BiQtMScXQj2Vti+7aP3TPbxE2nVPEwkFL
	oF/CW5POtxCTe6nmtldXZ68zwc/rUAo4FXI/o5WKBltg8Wb3TVf4L6Hs53e51yWL3AoUCYpbvt7
	GfBMj55aHxPpBwOBQyIgG1tQtUJjyyn2ob/e1UR9qkHGBne1zl+qGKatJfmR/H08fwt+3ndHhv9
	eLsTilYirKunRtrHvWMTxMURKBUMSf8FoGQ+7lAvxHVNUMURvfUEJj2XsUaL/+1sEz9NA3r1fUj
	RCXZyVP+M1fTd82SIKe6lxaApax5hBK6isPxpnjmazgvEPfhmkFQpxo4Z6jFomjUUB5SBPVO9Qc
	T/9nHBsjhbU7js3/vGMvnP3Rytt4gJIWityFyyG5UhC/l9jbp3lkeKKNEu84GnEE7IF1ffRq0=
X-Received: by 2002:a05:6214:4f03:b0:8ac:b542:1063 with SMTP id 6a1803df08f44-8b3e3041c18mr105247456d6.15.1777463582194;
        Wed, 29 Apr 2026 04:53:02 -0700 (PDT)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com. [209.85.219.43])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ef70b10asm16630566d6.13.2026.04.29.04.53.01
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 04:53:01 -0700 (PDT)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8a016799d2cso135844816d6.1
        for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 04:53:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+KNoRFFonjtTokExTcPGcpI+BrSXH/L6UtDWIozxvq83vgdRq3UhRd+8cNqMEY3MegIxNmdIBqFAo=@vger.kernel.org
X-Received: by 2002:a05:6102:8496:20b0:60c:fe65:7dbd with SMTP id
 ada2fe7eead31-62808c547e7mr2534931137.5.1777463176356; Wed, 29 Apr 2026
 04:46:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org> <20260419193718.133174-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260419193718.133174-6-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Apr 2026 13:46:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU7Wv=ff34PGtauGE=pxu-gz60bYckFvC0s_7+NGF2sSQ@mail.gmail.com>
X-Gm-Features: AVHnY4LIrMWzlW7YEacrKVCpl1tXW3XTPU8aR2UA76Yz1rMTuJKkQscGTQj67Yc
Message-ID: <CAMuHMdU7Wv=ff34PGtauGE=pxu-gz60bYckFvC0s_7+NGF2sSQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] soc: renesas: Identify Renesas R-Car R8A779MD M3Le SoC
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 19 Apr 2026 at 21:38, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add support for identifying the R-Car M3Le (R8A779MD) SoC.
>
> The Renesas R-Car R8A779MD M3Le SoC is a variant of the
> already supported R-Car M3-N SoC with reduced peripherals.
> Enable support for the M3Le SoC through already existing
> ARCH_R8A77965 configuration symbol. PRR reads 0x67c05501 .
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
