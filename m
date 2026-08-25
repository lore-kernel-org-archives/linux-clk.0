Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9D9415B76
	for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 12:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787660852; cv=none; b=baJKN8tuqVBevAdwAaDdankkJv32db2WcQ7iMB1s437hLJH7sD3xXpSKRNOuUqDF/WgtZIGHpMZiNHPDv1+9qKTBI0byOvOU8b6oWHcZkvRWnHKffFI1J5IGFYljZG5RiQi29I67Ug88R7fUxLQy7aWQ6be1hvP4u6JbGQhU3KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787660852; c=relaxed/simple;
	bh=4nRcMnRQV+AnDLfqURNbts14rQ+nBGEFB4Rm66x9S30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cFG3TwJU3xwHxogYcRHVa94G3CivNiAdwkr8lQYGfr79aoZYip//Sz6b5/jIBHI85DjQTwOUBDCZvOfDey3UQbFq8hgCbpC5DPqwBbPtK0tUPLijFiJNF6m+WB4gwQZEGTySxQKWsOHcwlcRR00VYNmThsio7Tluw5Q3vXBmEbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5bf959b820cso3633572e0c.3
        for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 05:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787660850; x=1788265650;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9/HktJJBeHHkHA6w8idbfeQ0ukYM1XFsMvOe4prisg8=;
        b=EkphYhf1Jx3WFnNS9H6T0jg6+eq+E6AyRTGRvS3noO5J1IB0K1TieQk1Ia9BmoPDwW
         j2+ryJxzv3vOUQSIaDm0Gy4ZHrLJIIyhprRAhwT2YU9UZmdV2o1DfTJozvdxvwUWF0sr
         Rx0dkNRPT8z3saM4m8cWlIKJ4/panJwJ5WIzXz4o2U5ZFcnlw47tRrLUboFtf80w6SC+
         AXSlA4C3rZXRCXks4inWCmAgz1HQUedGXDrQSuanXkcUO/Pu6ebP8kwWyPw3chYUZi85
         C9awlqRQxfjQqpDiL51XyvtTPwmy/fyaY23DRxo25BZHAzo5kjeVQPH0A17t992NZwnt
         rwFA==
X-Forwarded-Encrypted: i=1; AHgh+RrrASReUKEKjcuCQ7Q9R3M1bh7Imct+wUzMvk3fsJKKAEJFx9ddjky5RgJrYeJ0Xl234laobKMI5HE=@vger.kernel.org
X-Gm-Message-State: AFuF++ktG4e7dmqU0xW0KcC7SRnlQsIxmunXV0ixTE/L02C1Q4IjxZEd
	YNaHNEWvYaM6gZ5j4IQbBFTwCpH87Wu1IRwq3vPK3ORy1CHdKmSTnqWrZhP9RRUDPBI=
X-Gm-Gg: AR+sD13jXNyAQRwRWoB7TEVVk3xKDWUTJkDJMPpz5Kkv6AwljVJVP1cR6KllWU/4D/0
	BKSi5ttpKFLIqYArOuKRXMLczACofep6VXWVfsJcSpxZ6fpvKY7TiQUD7/MKnNb38srnCsHpWKM
	kZ8WJdbdrlK8qrGl5kogI+2UQuALc1XHovtFyaDu/8vixtYHAQ8PmhVDwvHiRLEnUBXQNvdANro
	VKVviRp9UMbAx2UUBsNT0K5RF4cA/XJoziF1kNu7cf1fpUntJxrRDlqijrtHpt/0HXFH7AtC+jT
	fj4pzb8IxK6iIGyI+LnvkmsUn0cE3aVW++bqj5IMV+23P/+s+2Dacs3tMtlj+VTBHO8mqgk22bH
	doG44SVkSyNCVMVFSns6vGQQYwIcKXcwgcOOEQ4s0qxhEN8S9ek3wP308DDSPIRFUyHgK5oJxZQ
	1/Hk2xlSe8tOFp3Lpeqb6COkAHjthKjAR1boWWvkyMxfqnLrhMi6hXRU0Q8XkQ9jlm++lKpLeKt
	kqcVNPrbeJ9ek5gY1/A8RAxWg==
X-Received: by 2002:a05:6122:4d88:b0:5bf:8c77:e89a with SMTP id 71dfb90a1353d-5c642bd7d7amr2488360e0c.2.1787660850237;
        Tue, 25 Aug 2026 05:27:30 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c623d310f8sm5843315e0c.8.2026.08.25.05.27.26
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:27:29 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-746d77537f8so2608064137.0
        for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 05:27:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoS7Fy1eJMxYmhjAQQIEj2cydwk3LDdzN2NrPu+Z+g75k0d4fWDfmhIxah23T8KP7sJlcYcWBO7LMc=@vger.kernel.org
X-Received: by 2002:a05:6102:f0a:b0:779:aedc:88c6 with SMTP id
 ada2fe7eead31-77fe357cf7dmr2091702137.0.1787660845781; Tue, 25 Aug 2026
 05:27:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260817192540.423994-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260817192540.423994-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 14:27:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUxeZ7gQiqE6VzDEF6NqgQyqO9bSnGkyyOxmT8zg62QqA@mail.gmail.com>
X-Gm-Features: AcwNN1WRL_UGP8kr-vdoVNnxkPPKW_sCIe6xHhiuRgRsERD9dSDy4YtRIX0EpTw
Message-ID: <CAMuHMdUxeZ7gQiqE6VzDEF6NqgQyqO9bSnGkyyOxmT8zg62QqA@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] arm64: dts: renesas: r9a09g077: Adjust CPG
 register region sizes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Aug 2026 at 21:26, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Increase the size of both CPG register regions from 64 KiB to 128 KiB.
>
> On the RZ/T2H SoC, the CPG/MSSR block is a multi-function block where,
> apart from clock and reset handling, it supports other features including
> clock monitoring, write protection, and peripheral configuration registers.
> Expand the mapped register regions to cover the entire register space of
> this block so these additional features can be utilized.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
