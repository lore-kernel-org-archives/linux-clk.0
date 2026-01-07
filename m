Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5805F3451A6
	for <linux-clk@vger.kernel.org>; Wed,  7 Jan 2026 15:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767799333; cv=none; b=Ezn3A9uIpUya3XTb8TNujcyhZ3Od/8jTsOE/iKo4uXiT0vQRN4h21/4gq3QZEK5V+IZccgSPc119oPtwbrFTBXo6b6mA/cOW0EFbCXJpRCqTop4NPkmunbCJNY8xBDenhhTFtKM+Gs95vnt5SZJAoYn/mHd2WiBWpRvTc4aR6x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767799333; c=relaxed/simple;
	bh=xirnzd+sOTLBfOoqrKyZ5orvmCZslNDx5L/n4t/ve2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FnkK27rIWwZawJssR8YdNrBHDOD+/wJ5zws+zqgh8TDRBkHzO0+JmPI3PANr5f3a5ClDIp4j2KEmYtUWqk626WOkpZ+LVNsyZs7PQJ549sxPGcpvRbb5hRMkY+byjxtOpFjttgRApsJkuUiBsN5DdkU2QjHTWlY8nbhIVx7Y+pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5dfa9e34adbso1434894137.0
        for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 07:22:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767799331; x=1768404131;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGXfYeh3k2PdpEfY5u5umPkWwmBYjzfyvyHueENf/WA=;
        b=t+TaEDBdEE/3JIjfjGxBsNjDkoiqLxXtndABGgEJxylRy1dT6hw3vzEqwHlxsEkNBf
         zIQbHbsPQ2RRWo6+8yzFcOWTh4bty5YhoQn8qNOjAVbZtqm61466qtMoyuAcCxVKGjXH
         g20jAHIhnr44GdBvR928asrGTMYY9RmS/z5obYsNCOwNGPC5+dMXj5c6ZSW2JdhCHClT
         CJPJ/a7hcq6XEB45BxRpsJStGFPRKvfYfSGlGoTIY0OkVaJr8+L7ryQVc1DHxjVBECtt
         4N5GkB/t6XLUyr+4uV1tHW49WFDuG8rSsC1XAqe+6PpyjceeiMZ04NGLdCmdbVw6qUgK
         MCWg==
X-Forwarded-Encrypted: i=1; AJvYcCUKtYL5oOEel9claD5RmMPBSN0GwJTXZa7jMEqzu4V1J77vAso//6e/HiEZK3ZazDnpNprGhulCF8M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb7UAX4zg6fzI9qcpQJp8VjzqAqPftv7Cy2j+kikVvyR4aggNd
	IG5WJA1ou8/d/Y5T8sHE6Z5I8oaC2uVfKGNC5c/bYPvFRfr+ctqr84VPbFUjvC5Y
X-Gm-Gg: AY/fxX4gA3Dvu3JadplECfM9ivfkZAKW/hrmTIMiIZdCGjzEH2vp1zco6XDmvfkC1Yw
	2e5o7EENf4aGm+K9OXeBQIzZPUxxrw9QZVrj3isicmn/l7YaFO3C7VeCeau2Mt9isKWXaB0IRRe
	msDvdYehUYJH/u0SAKVRyJHpqK/6jfQeeO1H9SeWwnvxd2/rZfafUgE3fYMfF+/cDSjop9lMyUy
	QIDd5nUyI/A3YEBI+xK07MyoX2VRDULgbs5PNCCvx+aJXV9P+dqsv8QDv8a8Ekx/Cnje/d7RDEh
	PHnrPv3fG4EMI8MD7jrxCazIpt52aCGzaKHBUzEz3O18T1xhnf9i/SjQUlHqWwG/yFvlamTFL6X
	iXElH6dMG0QPlKqdfmj4lBYXNof3/OGPJwdfsJ7CN2/Ig8pgkJOhUbkfFXondVWAPM0Ao/T9502
	Wnf9wMIgtevCHYpIGEU9NYE1m/GsQuLEmBmnC8VABmKmQlnrjQ
X-Google-Smtp-Source: AGHT+IERuDszFPyGAbJhwUmBvU9hncxlHnMy2atP8vR8kKyFlcjAeQA90+haNM9eKLRBWJh8smYV6A==
X-Received: by 2002:a05:6102:38c6:b0:5db:d487:2ef8 with SMTP id ada2fe7eead31-5ecb69382e9mr1151303137.20.1767799329742;
        Wed, 07 Jan 2026 07:22:09 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ecc521d7b1sm2278240137.0.2026.01.07.07.22.09
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 07:22:09 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5ed0a9cbb3fso313138137.3
        for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 07:22:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV17pB24XOzgraJJnKM0mXmW8JEyHQ2fNH9deWrTVPZ/wYTKFRxhhBzFhRpzJs+rUkodVZXiPjtmwk=@vger.kernel.org
X-Received: by 2002:a05:6102:3e82:b0:5db:d60a:6b1a with SMTP id
 ada2fe7eead31-5ecb69624bemr1245498137.30.1767799328042; Wed, 07 Jan 2026
 07:22:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251224165049.3384870-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251224165049.3384870-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251224165049.3384870-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 Jan 2026 16:21:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW3S8BhE9yXsWCedQZnipBR4O5=OBDfubLE68A2OtqMAg@mail.gmail.com>
X-Gm-Features: AQt7F2pLWgnnzOwA_7Wfo0rR6d8bVAPIEUWOruo736mHbFyZALGJfwT7zcffoA0
Message-ID: <CAMuHMdW3S8BhE9yXsWCedQZnipBR4O5=OBDfubLE68A2OtqMAg@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: renesas: r9a09g056: Add entries for CANFD
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
