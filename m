Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5208739F16D
	for <linux-clk@vger.kernel.org>; Fri, 20 Mar 2026 11:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774005298; cv=none; b=FLQq7b76fNt4/eEter+4GkqRBByyN8+pNv/Z2yt9vg21GcxfgdMQCAiQNB03zFyk/0YHtLQ0RQK3eQSNLAl0KrNjGMA79zvJXpPYmvt4H5MTMfzTzauPqtsiB0O66L5K+NHqqvyN25JhGJlZgqHfmJf4yQiyL1uNFKwaz6deTCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774005298; c=relaxed/simple;
	bh=9ieM0PKneLc9XAFn1kgI0QbNwUio1Qq6fWkxlV5z1Fc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=icPJhCezoMV7JS+73bTq5I9BwGrJwDhjpS5iIyve6SuaOhL6vyGOgAJaUhjQ5r8uqwshQDzH40cTxKGfy/2BS5N3YwswQaucjQdc8bvERyLRhbrnqACaWO/rUyrZ/Ab3HC+fwNma8BUWdTFsQudAxzorchJuGh17TXppRGmsBTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56b6c7c8d00so979426e0c.3
        for <linux-clk@vger.kernel.org>; Fri, 20 Mar 2026 04:14:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774005296; x=1774610096;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QM2QQuood2CIqMt6ghdF4q02+bVScicBaTi5mQcy40E=;
        b=YKWQcjYgVGyZRIFpMZpEgyvSv/nFNalY8h3PoY+UcqrNdZODoTmiDLiolOj6+hSA3K
         PLEdEL77g3hZSgqbbXoTgdQQNxRotFwLlHJ4jurU10tuAQGLVxMMg2QCNcbheRXQXF1K
         5jHOn3i8kn78XRRFfW8LrIAIu3RK0rwVO5kPniTfHHoKTmPZkovsJtwrkhpG5h8NY1wb
         bGUczT1MMMKNhrGCMiiq/d8+dlMkMDjuWavG/IJy9weDn01MXyu+YKAqBY2jCFuUtdmt
         uaL+4ypdBfx0tji/VkAj60QNm02qM9TR7QOO0vhWQKlGKMmWKYuJJQRD99Ike2JvSut2
         7bHw==
X-Forwarded-Encrypted: i=1; AJvYcCW1HTWz3x1GPoxcyKR2F008ygMGUutqSEopeM8DYtPo9Kq6OEz8wOaFuW0IxK4OiHnhSzNCOy7teOg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQM4hM3v0j8c9OaO1+eosJxP8TCkbB3RUG/6k5EzOB4OC3KMVl
	MXN2Obz7kxlgsKPNmukxfOOOrcBnGcnAi+2cEE0XgVTK+l9uFy47CqBx2aHMWPq/kkE=
X-Gm-Gg: ATEYQzyH2x/FD55AYQKnSLx/61pAdiJ1D/8i90eM/QzeoHI6iuv9Z9ZFRdBMNAiIKxN
	efOZGrXZ2kzL2IaXBG6VJjFHFLXWgLzjp/Y44KzcUagBv1XRhv/FZL/JwgM7EQ3YbLpta/sB/IY
	qHVLFGfU10/XQmWuN+K5s5BJ4k32fdHAwPRm6qWFuhk5qenzA3mGbWcW7Farxb8dYzbUSRZLo97
	fpFKTGwCSm6JLQoGQUvR/2AB8fBXzYcAfiUP8bvalZFv1kHzCoV1QEgkARpM2Yzvtsk+f61bLKY
	82jIAUAoGYXN2KCqWh2GMVIwxdOx/5LmsWP+lyfR+FLB2omvWcLPvrOKVHYW/j//fkBljgU43yr
	09JmvshHCxAbAaufQribAZHvUy+KeAa4o98KbeFAQocRPXarlwzUP7lN6kpmdNP14Z+Ybsr7Y+P
	KVzVY5vI/Ubal8pJ7g7ddygkruwGiMeBDxprSU9NI+Pcr2BZ4m6sqTCrx6svx6
X-Received: by 2002:a05:6122:318a:b0:566:354d:9f4a with SMTP id 71dfb90a1353d-56cde32a8e2mr1278852e0c.1.1774005296140;
        Fri, 20 Mar 2026 04:14:56 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56ce54d6b6asm214368e0c.4.2026.03.20.04.14.54
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 04:14:55 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5ffc879c1aeso915262137.2
        for <linux-clk@vger.kernel.org>; Fri, 20 Mar 2026 04:14:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVPkvXAx3CTySwswk/yxHzHv1Zh+cET0rEA29wIrN94+CGsgvue4M4vqoSuIRgjj3NPdgAOfoVFhvc=@vger.kernel.org
X-Received: by 2002:a05:6102:3713:b0:602:9228:34a3 with SMTP id
 ada2fe7eead31-602ae79cdfamr1587306137.0.1774005294541; Fri, 20 Mar 2026
 04:14:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1771344527.git.tommaso.merciai.xr@bp.renesas.com> <c8df5202caf4e36ee5beafe78ad0940643edcbb6.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <c8df5202caf4e36ee5beafe78ad0940643edcbb6.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Mar 2026 12:14:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWTOPYxC7r0ztuPc72T5xeDgcfo6CUi8sRcupjiJbRLGg@mail.gmail.com>
X-Gm-Features: AaiRm506QxR9HoC6NaRd9ZijJZ6-iF5Bj8kjApAjQvVWwUbRpOpkLxT5Tya6COA
Message-ID: <CAMuHMdWTOPYxC7r0ztuPc72T5xeDgcfo6CUi8sRcupjiJbRLGg@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: r9a09g047: Add RSPI nodes
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Feb 2026 at 17:25, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add nodes for the RSPI IPs found in the Renesas RZ/G3E SoC.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
