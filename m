Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E46F46EF87
	for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 13:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787666334; cv=none; b=RIDcS3AVNTor5y1q5+kJjt7odD3rkKgJVIbDmIY+x104CCC4xG1VaXGE3YYNLYMo/rrSACbHPVRwwNJttehWoSpkiwx2eFpM6WPZKpAX2ULM9/TAQA2AM4ag2beDNITgdEQ1QAjIFtVrB3gjN4B+M5/kNmNrxxP7n2KR7KgGFE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787666334; c=relaxed/simple;
	bh=4Nhf7wYr5y5kOmehF2+mwwOUzZfIYgBl4L8KXVm9JcY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mcZXZfYRNxOwzh779Y1T5rWbe7qPKfhMCUTJU2IwwFUh7L0t5V5eEZ/SxgMTSTyS79zKv9oT3zyupd6x6x9MkWrjb7ciagtounuf8U/bw58vJW9TpCV7VjZJ8Scaa9qzJ7VTdPcpeEcFQS9pHf5WUQttTlKsJWkktSAu+ZXFqI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-66d1082054fso2139945d50.3
        for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 06:58:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787666332; x=1788271132;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r3HqpL4LRyR8Q1Zvn+1cvkTShpZ++E7BIg5onQopH7Y=;
        b=JGESXHxG8fRybMK8kbZnDz4k99osnriwhN9KJpxBFoNrW3LLPB6/iVk/mAbmEDsFIA
         mErebj0d0YLBNokmd07lmtVyw75Pb6SMrQWFu9pOR1VjunfaGIpUoWQhJJAJ1B8cNkUv
         aDxiEkGm8TGd6E2l9Y36kwNv7lCSRyHjejcOBDyGF4d1ZWGJ+Nc9RUAbHT3FI/U3F9aE
         3qgmVl3VfVVk/HF5DVAm+xmEUXWN4vVvOCB4bmcK35y8THYe6ajstKNAJdg6TKx5EaRU
         RSjJys3jJVVN55Z134zuMbi0uxPy2dy8DP8KLNalcP4rvnaPfycWyq18ougg8xndJ0B4
         Abjg==
X-Forwarded-Encrypted: i=1; AHgh+Rrl3ACCvxdawgLPfPjUj5p15BOGPEVUS+6eudERC0ctlKmNXGIpNry4x2TXvI692CQuKJMivyfS9Fc=@vger.kernel.org
X-Gm-Message-State: AFuF++ncs3pvDuCHbXFNXpJMjKKY0AVPoVyF5DgVx32e+H+A/iiDzplH
	bineUb85N9Na6Rmg7e/l348TkLn8nrJvDTm+I886w/Jne/r2rTDos3TEdwFKj/NjolI=
X-Gm-Gg: AR+sD12mnXbXsiz58UvlJV5CXlQJg+ZlAPB2SWzL7JTGNU/h6GA5V39K3vItaFb33r7
	aL+R+A6/fJ+7KeMmNIpwfRK424D053eDQnXdQZGx9P7j7s2xsJyZ6b8zBCz5QwGVroTwWmaR2NW
	mylW/qBfF5y1hJeJMtu+mb2dMgfiRANEiOhWZJOF7/iHSCGimMflRnkmTPeb+Wx/H7PhlIk8KXS
	yzWLG+ab5WHrJWFUS5mxOcjT4sm+946x3LLF02qIQmVEAI+oG75WAKOBw9A3t3A2lULVyZvOI+s
	n7Bw/F00jCsZsEzRo4kUzdc6l8qyX7atmXzWII3Qil/Jg1Q5YZYIkl5E+9fBgGWrORborpvNhFI
	yYFs+ZwIXUIdITASd57jXIZas7Nc0SFTm1b0Gbu0e0IEoOQxJOXyJ9H2yJ93bVjsmWlOTvHJ14C
	+E5FaN/D7xZ5TYPPI1J56pLrr13FzHokWG/LQVa6RphYLLE9PPbghsbPV2kKaCfa5TbD8/bmkwa
	K4xfTr0HP8iSV90OB5L1Z6uJBwU9VbYdVRb
X-Received: by 2002:a53:c203:0:b0:66c:b8ff:fa9d with SMTP id 956f58d0204a3-66ce4b343fdmr10240312d50.43.1787666328739;
        Tue, 25 Aug 2026 06:58:48 -0700 (PDT)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com. [74.125.224.42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66cf4a2c3c2sm5595763d50.17.2026.08.25.06.58.48
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 06:58:48 -0700 (PDT)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-66d1082054fso2139758d50.3
        for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 06:58:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoettUCvGA613iS3XgkF7/9I0mncJQHUd5d3SXBuyGcKLUbG+K5GMfQtW+2L61/P6dccqiCpvlNQAc=@vger.kernel.org
X-Received: by 2002:a05:6102:3ecd:b0:74a:b1ee:e034 with SMTP id
 ada2fe7eead31-77a63f3f870mr10636886137.8.1787665871110; Tue, 25 Aug 2026
 06:51:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714173315.1981708-1-claudiu.beznea+renesas@tuxon.dev> <20260714173315.1981708-4-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260714173315.1981708-4-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 15:50:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVBL30LN-+9e5LAVFCaK1y2BEr+VBs=sDgjLCgpc=kgyg@mail.gmail.com>
X-Gm-Features: AcwNN1VGPHnBk0TXWTegWV3RPljNeX5vHxO1DRox-RPTqr-v1ZX5lP4j3I-XFNY
Message-ID: <CAMuHMdVBL30LN-+9e5LAVFCaK1y2BEr+VBs=sDgjLCgpc=kgyg@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] can: rcar_canfd: Fix typos in macro names
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: mkl@pengutronix.de, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com, 
	biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com, 
	claudiu.beznea@tuxon.dev, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jul 2026 at 19:33, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The bits 1..0 of the Channel n Control Register are named CHMDC (Channel
> Mode select). Fix typos in macro names by replacing DMC with MDC.
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
