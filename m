Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794227252;
	b=o2K2kNgojC7h1tJp2riP1SIi2gWhKZ5ecbE0+1uYqJ201VLWAvTln3Ff5NRn6ckkd5Pd
	 BrRnR9zFH6L3OywbIn0j2VSvlMnpEcdGUxp5ajSs1HtuwLKcqnJ4hT5pagpp3fuGDnBqi
	 N27IhV3DnUHugvb/AMcGu1xBvE1F+GxBr0L+f6Y4wOl3wjVrzq38XH9HRNpfIeWNOLd/p
	 uqusQPu/iVuq2MmPKUqB5ZQ6riOD9MNJQJ4wqzPecnkl0a0WmReTxwsOIdRLVe4DMHfpZ
	 nZzzup2Psi+L2vxZWagEu+jRG28IGxQM38poVW7Mw0mFG8CpTJfXPcszXT0OJ7H+YhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KRuHgKKM/Ft7bPONO48ud8NMa7YtAiG1oSVTdvzPD0g=;
	b=oNgtiRv428m4f+1jhqC0mau6y3Sk7eK4uWSGvARTAwMSS17d4bMV3wGmlPRYfF8T2imE
	 v/k3WnXR2KQzlofy32UQYMAsw/tvZ3L/02vAFFrorNPmGdKS7x9YWBItyYrW9ofkKnQsP
	 6xssbFS1T6IReW2OTimhcZvZS783KnOpymB0/MHM3U730lRQCmfbtloXWhz8Pgw/xUH8Z
	 iVTqclxeY52V34k4tI1KJCpItcg9o1P7Ml/pUpo6DrXiEADkDJen3JgZCmwX57MUQIgjg
	 Ced9TVQoSM8E2BzetYX8PpuCI2n4bF3pxfK/Nt9gtx4lyR2NVD/tvrS3g4pITzdp4sA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QOgyhbeq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07E6606D806
	for <linux-clk@vger.kernel.org>; Mon,  9 Nov 2026 12:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A07E6606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QOgyhbeq
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso1079440a12.3
        for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 04:27:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794227250; cv=none;
        d=google.com; s=arc-20260327;
        b=fY58BZdVcLXkrm0qd2h4/OGvXhaYCREu3WGrJaPIjsaz2mFh0S5JVIUzOvuKKf6vPr
         QqTlJKp/s+8ZPd3D+s4vYxTGzJfLQwNUk03oj/ORmL/m5mJllW3NRdfP5O8aUnppR3fv
         p72ix5iCpypbakGK54XLLwKbQWxeyG/TyhZ8Edi7jcQku3vrwQoOnkNB6gAchzNo8Cx9
         06je22lQ0RJemU+0o5JJLs22U0AutImUfHaLJMOWuX60G6rCwPdxlYffLmPbsfGBwMVP
         bCIHthMNJ3wIubKBg4yM7pIquJxDsnIihKZv9eRoYkqsemzuArMNhU3ORTRdOZyDvISG
         ARGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KRuHgKKM/Ft7bPONO48ud8NMa7YtAiG1oSVTdvzPD0g=;
        fh=99M4VzuK3RW9SUlxaxP+DPEGUGn4mTbVDIwVxj7Kv8c=;
        b=NZ8YnF8N9aVoaksq5qVG4UoAOFG3fC9DI0xkhTLUD2c6te9BpgTscsc1YMvD9kx44m
         y+6M8/LvfGPs4KRy27aJuBY/LlZZLIyyf409pjrRz6H1IJz1R+eL+rVake79oOodFm14
         zxB3w9uC4BO0hK3HQ1Bung5nGmW+HPG/4JuqLrWYczQ8tYvy92bujlA3N32LWJozDxyL
         QPYhRfjPxt6IcY52CoeYZ9xyKW6KmYl6+/5W0S9I4iWOnnX7Nc2Q0bSTCFKXMeqC2RlZ
         dVn6l3R8nZO9b7cn6Qkqmv2hkxDsvF6BxGUO2JIM17Ad0u/t78+KURK7VdyhAF7+bnXG
         SRzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794227250; x=1794832050; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KRuHgKKM/Ft7bPONO48ud8NMa7YtAiG1oSVTdvzPD0g=;
        b=QOgyhbeqOwd2Z8XLJx9wuh00POYRhyJMgoyTP2JMbJJZZwVnt12qxlUpcwNXgfG+pp
         JaMwEbHHzfXgzSVYNUUjUGAHM4w5gIiWjKVMo79/N4Kp7/QNLp74fZlfCscaySJbfldb
         xQdArFs3VDfGTOs1UtGkxdrVHUOFJ8um8haAtZ9RIzulS0FS+QUM0zZPsQpT63l+ktjO
         SVICn62kPn36QNCk9ALNSp6FdvD79vNG4ObZxi9TgEboX/0B+2bu/ByYWc9nxsh+fkt6
         CmD2fpaF5ijY1Cz96O8VMTE4HMTAPlOe0mt1ogz/3/yMi9wqTDx+W9cVvmqfelt/BCIs
         /rXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794227250; x=1794832050;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KRuHgKKM/Ft7bPONO48ud8NMa7YtAiG1oSVTdvzPD0g=;
        b=lzBKXbTHQ7sCkkKQwN22rIMge0gG4ltTmZpXNnEm8qIjjpbQ/A+U0cm2/cAWegq3l6
         r1KkcTnHF0QtG2sc7PUqUaptcymt9OIue2eHFmTY4x5KD7AOVuhylY0lT/kVyS9t46yA
         NE0p/RqyGokus2enzIPV2Khzd2RCMR8ZnVAjfrf0qWs0IpLQLt0TxTy5NgeVgh8PElBw
         4feNiWcHL4YXb2X4wHuAOhBI5DOT9C+r1g1UmXbXkBB8EsQzfvB7DNP7b9/B0wcQ9eVw
         LTTRpLS2Wm+SXFgU0KGMt1hp7XaPSsbAwqatryVso4T1qaPVSeum3oHgdMuN7GIP/yAk
         7Ixw==
X-Forwarded-Encrypted: i=1; AL+hErGwNE0KIbVMHzC+dKVu7oLdt4Uo86CxUYTyuDHiB5Qchqqy5xPOgJQ+75k4jhazHfI2Ol+NAk6HvbQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FzXrdpkQxFrNG/GnxnRpbvSJMua/VxtVGEgFJ5HVLfBTqpw7i
	iXxseFx/xa7d9a6ckMEC4ys21ljKuiN5mmKV9u1Zcx3Q59NqM0brTf/BgMVjfbKREkz9amaSN3R
	Zz9M7sA2fr/YuofcjU1/CHFCuWeAQSs4=
X-Gm-Gg: AYBFou2jPW2QHzB6neQE/d4mIKgAMn9pq1lnRMP2FfwR4QjJkPE0WCT9ce9ULXuT9dc
	PQjWD3XFoQY1ABbWlJUxVSeIcyfD0kAPwBp3Ee83HRkdzfRgZD/0I0nzG+c8ypLQUrOMF25aJ6n
	9ZL6imJYRyB344VhrMSiaQDqInpYMaDGCdRswV1X0A325hxgsrIQRmWzpJy/0XTdjhYimZg7CKL
	6C/TZFRasMiL5yJzbzc+9cU9mDgAylFzXzH75G+0S4iwJ+TDlekr0LKscxj9AkkDHADstZcj8FJ
	IbPmCqrd7k9pYxsujs1RgQkver6ooP1GCXyHXDSev4V+hl1z2z+CznbRJEHZI3LeqTeim+lBXFX
	rY+wQtNpB8FE2JjxnhPNfQ/hPt3XK0HqCWmY/lfRzDOkBcduE0VEW1hFDeuIm5LhKvjBmsC/s47
	PRqYjGcD3OPmeWHgUb3sqM9TTsXSin6Lsel1PEPExE3gt/WJWjoWSoFHMqupA=
X-Received: by 2002:a05:6402:3895:b0:6b7:8b1:aa79 with SMTP id
 4fb4d7f45d1cf-6b7223c1832mr2314095a12.5.1794227249763; Mon, 09 Nov 2026
 04:27:29 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 9 Nov 2026 12:27:03 +0000
X-Gm-Features: AclHuK_ZRUUlCMH4HvENtZrOvYlrEIYJCdD6Zdsj2qnZgU93aq494AwRB7CTooo
Message-ID: <CA+V-a8u-3NFryZA_8GN=fR09+fcyvNGLMV-09z-mPXTePxkgvg@mail.gmail.com>
Subject: Re: [PATCH v8 0/7] Add syscon support for Renesas WDT driver
To: Geert Uytterhoeven <geert+renesas@glider.be>, Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Brian Masney <bmasney+clk@redhat.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, Oct 1, 2026 at 5:52=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Hi all,
>
> This series adds syscon support for the Renesas RZ/T2H and RZ/N2H SoCs in
> the WDT driver. The WDTDCR register is part of the CPG/MSSR block for
> which the CPG driver registers SYSC regmap. WDT driver now uses this
> syscon to access the WDTDCR register.
>
> These patches were part of two seprate series [0] and [1], out of which
> certain patches have been queued separately, so I have included rest of
> the patches into this single series.
>
> Merge strategy, as the WDT driver now includes renesas.h header file,
> the driver patches can go via renesas-soc.
>
> Note, patches have been rebased on top of next-20260930.
>
> v7->v8:
> - Dropped patch "watchdog: rzv2h: Drop enabling clocks in the
>   restart handler" addressing Sashiko's comments
>
> v6->v7:
> - Added a new patch to introduce rzt2h_cpg_wdtdcr_count_start() function
> - Added new patch to drop pm_runtime_resume_and_get() &
>   pm_runtime_put_sync() calls while accessing the WDTDCR register.
> - Dropped propagating WDTDCR access errors.
> - Dropped converting WDTDCR handling to regmap as this would require
>   resource address comparison to get WDT index to call
>   rzt2h_cpg_wdtdcr_count_start().
> - Made use of rzt2h_cpg_wdtdcr_count_start() in restart handler
> - Added if regmap is available, use it for WDTDCR access
> - Updated commit message
>
> v5->v6:
> - Used pm_runtime_put_sync() in rzv2h_wdt_stop() function.
> - rebased on top of next-20260922
>
> v4->v5:
> - patch #1 is new addressing Sashiko's comments to avoid potential deadlo=
ck
> - patch #4 is new addressing Sashiko's comments
> - Dropped checking rzt2h_wdt_wdtdcr_count_start() return value in
>   restart path.
> - Handled the regmap locking in the driver and introduced nolock
>   version to be used in the restart path.
> - Added review-by tag.
>
> [0] https://lore.kernel.org/all/20260817192540.423994-1-prabhakar.mahadev=
-lad.rj@bp.renesas.com/
> [1] https://lore.kernel.org/all/20260814191415.2110732-1-prabhakar.mahade=
v-lad.rj@bp.renesas.com/
>
> Cheers,
> Prabhakar
>
> Lad Prabhakar (7):
>   clk: renesas: r9a09g077: Add helper to start WDTDCR counter
>   watchdog: rzv2h: Use pm_runtime_put_sync()
>   watchdog: rzv2h: Drop WDTRCR_RSTIRQS define
>   watchdog: rzv2h: Drop runtime PM handling from WDTDCR init
>   watchdog: rzv2h_wdt: Add syscon based WDTDCR access
>   arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
>   arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access
>
Gentle ping.

Cheers,
Prabhakar

>  arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 24 +++---
>  arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 24 +++---
>  drivers/clk/renesas/r9a09g077-cpg.c        | 35 +++++++--
>  drivers/watchdog/rzv2h_wdt.c               | 85 ++++++++++++++++++----
>  include/linux/clk/renesas.h                |  6 ++
>  5 files changed, 129 insertions(+), 45 deletions(-)
>
> --
> 2.55.0
>
