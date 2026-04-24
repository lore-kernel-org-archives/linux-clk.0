Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92C83D090B
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 12:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777035259; cv=none; b=C6KC9js+vbpqbsBhW5LmFdBcMU1sPLQT2PyXCLG0sPJELXvLZVJyz5enzuwH010kzXOl7HubEUUOu3ESsLxvdIstAyeAIlgXMopYJQhhQnA9iXe0NeEqF1378TROvGN04XjhpICXM7znZJskL2WhOJRcbqjEFCdwoho4uDpvxWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777035259; c=relaxed/simple;
	bh=RIGWcrqPm/W7/TCD7jMYjV/Dl+YYoApLyN7IZgzlGCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XqNzUQP/0lrtpeJfDaCjQ1+yGpK1YsKq86cMna1PNGlV7eQrxQYjjAk8B/0DfFBnAkm9ulH6cUqRf3RKJG7/pS3ORvfhZm4wXsFoSc++RmV5ER2+8miFxTXv8SlYZwxukqzATOXZHqcJ0DtEd8MhSps5YU4tEjqw3U3y98Ik+V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-672645dbfeaso8464156a12.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 05:54:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777035255; x=1777640055;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32ZCY0PEtQ809Zlj8YsVKi9yHfij3rjDtV/CfeIbwxQ=;
        b=e28/KVLmYQuQ/p/t/l77B9Ah+57aU1ONtEcJTi+P9Wdzp+EUEUzj3riaSFKcOCDEdZ
         97m3ekbgObIRhZfyo6eeAFT4r7yMtDEIDyOzLSst7w1a4galFZfcVQbgXhB9HZ7aKGdK
         LdzqbwihgmIwJYLwNVGbzjwCure8yhwpQrDpxmPygTNxKb7R8mMyv1qlS3GRA3qhf2Xj
         ZiDnFuQd/YkzGVt032JnAFiOlTz5ofVE5IJWkLXH0iHJf8zgEujRm9B/aKaQiEXBG9h8
         N1bAr0w9wIarVUWBsQKvmZJaKjHl7w751C4LtXQbXa6ngajqKsK0QvruKFGUJZ4imPGK
         RVUg==
X-Forwarded-Encrypted: i=1; AFNElJ8XIQHuzBf5xpasEYJJv8gsAVoUw6vRU/B0zDhUQer5+FNcANxmnWTh580OjD6sx2Hi+IvfVEZQPi4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEqJQT1hE54swHXtplE4V35rpDzx9V1zq1UTzZ4Qy9PWYD8kea
	kcNEjHVBqek3zC4qwesnXQ/dnP1HE9wKYhry40p+ikIHV1kddzovx0RMokAqdUgQOHw=
X-Gm-Gg: AeBDievc8vzrseRtFFJDZ9+dptBkCGYeiCnE0hslNfQUE5Qellp4gqyQgs1OIGhMIso
	ow6Z6GNTrJEK8YAX+Xm5nvDpwzfPWo5jTjS4E/D+24mzKSe3wm27dekuUePYgIx+thX2POuCMSM
	3FCkQOG1I2A1XTHxj1za5P+WDCw7IOEx+/x3E24RMzIFoecv55iI7LSpcDMcUvurpPkFkKJf7sj
	uEQGDlEgUsWej/brqr/Umg0MmiqtDbD678ghhoM74vNCs1Yd4o0TVbwZCzp+XhVBUp+NbawC3Yf
	wTkF1e3vDn0lysaVyH9aR+snHQLoO5wpTikX5yKOMa3AK2VgxgZlfXz2ikwH6M4fZ/uQXM4a7rr
	NkUooKoRCesVPL9HUyRjdpXIWxNUjYW+Hjm1fmRCOpDy3O9wxpmUD1k/eiRWFlWvKfM6ouhroLF
	yiaDJLZnHAtWZ+8/XKetVBtI73NVQFTvxLrdBooQwq/64JkwoHlBug7DHrI0vKCekzbOGOSR4=
X-Received: by 2002:a05:6402:380d:b0:678:aa4b:e60 with SMTP id 4fb4d7f45d1cf-678aa4b165cmr1617213a12.28.1777035254755;
        Fri, 24 Apr 2026 05:54:14 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-673032b9e83sm4750724a12.4.2026.04.24.05.54.12
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 05:54:13 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b9e00649769so1117613366b.3
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 05:54:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+1jeeb5MJ3IkWLdkO4B+M8lJssVpcgBcVIVYqwwf8woAytSTO9K1QlKp72YUuax9Cei+leIdwmEiw=@vger.kernel.org
X-Received: by 2002:a17:907:6e89:b0:bad:6f1e:f473 with SMTP id
 a640c23a62f3a-bad6f1ef8c9mr215345166b.31.1777035252749; Fri, 24 Apr 2026
 05:54:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330132349.149391-1-biju.das.jz@bp.renesas.com> <20260330132349.149391-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260330132349.149391-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 14:53:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWm6zEdnCPNejw4T2ojw5AQP13=Cw0BFOGk17WCaDWBnw@mail.gmail.com>
X-Gm-Features: AQROBzAYqa6zLLKihIs2yATB0Vd0SBTD0nqRpkIooGDUMXGBCVDkM-NMFLi-EYU
Message-ID: <CAMuHMdWm6zEdnCPNejw4T2ojw5AQP13=Cw0BFOGk17WCaDWBnw@mail.gmail.com>
Subject: Re: [PATCH 3/5] clk: renesas: r9a08g046: Add WDT clocks/reset
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 30 Mar 2026 at 15:23, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add WDT clock and reset entries.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
