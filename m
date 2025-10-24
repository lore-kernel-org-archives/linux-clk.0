Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DCA303C88
	for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 10:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761300606; cv=none; b=mpuKy1HqVk2Qym2l8xCzQKpGXurtIiZvTQjyKxKgVgEx+N6zHHZ/umHcnMj9m80Z1uLCa4ugxSisxcHIKxXHeCMqYn3UAZArmbzQvOvTrnLDGSeZ+a3ye9WBOyiz9JqVglY1n3uyfd8cF5KkOGaAzSG+E/NeO7tStJ7Sr6zxdw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761300606; c=relaxed/simple;
	bh=6MpM/czxf/6Hh1L0dLLUemfAUkQnQOxKAeYfzG6IdBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kflo97QHP3Hhe7eGq7amsFUMbwKQZoZnq8byCtmheTiDLWnD61KGcALzlrexPoOlF2Bmsjwi6593YDIcmT2obEnlcuSrD01REYBKsMYvx8ECEd0LL0SWFZXzAmOQsifXuhIYBGXKbVDuQfkCiGBJ0tH7byY5GrGzFryppNnxUY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5d5fbfca7e2so2185090137.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 03:10:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761300603; x=1761905403;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UT8Wdcyo2x3pLAZUDoU//zKTO9XrNWcZhxUqd4p60Fk=;
        b=d1ac35bUT9NBmAIdqMoq0N03Tvh3aUW7JmDuH2aD9RO+GNQRBG+LIKGRvYm0k3e32k
         B0Xd438q5tTnd/BBnVBwhtP943v24Lrae5t764ursySWTutJDJ+L1Qc1y+TAP82lt6RY
         l9Tukxs/H0U522ntUOPo5y20r6jNsiUipudxAnHjpZhXQJdik6X7SIszRr+/foP4Vrv5
         RoiseQtb3jxGOCjbym+3nXN4prSY96hJ20RzWmS5d3LiivjmVo8rRdHLx1nhuMoMbBnD
         8Hg4aKbx+erns98l3ZK/b1wAISI/VnaFxpYorzV3np6UBEmoxEvH5erM+vQ4+NC+tJIY
         FG/g==
X-Forwarded-Encrypted: i=1; AJvYcCXkcW3lRBen4sFH8XwLCXJ6PViQkjcrgkcbFKjUOsITYndSXCQpwKPkjtGg1ml3hErAlZUDDe6RhhQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDQODrFWfXwI8RyCNpTxJgjVLnLnri/5tP0sVIhqh1mYoJ0eVv
	lgPj/R7KDKohC0K2p7v5XrOJ6R1FrEI3jf7yJS4nJ+gADK5gkXUgGPxUFpiD4/T6
X-Gm-Gg: ASbGncszQSwtp9fg8d2cOLvsVzYzClk3BX0PMUGRaYt3oMjEchbGSmykLKmTYGSmkIs
	M35WzqUeBNrLsUKdcVs6uijJDgoeXPeMr9rKlGQfncyEWUYqtm13ZVy278ZRKJqfliZFhprZM9C
	Cr5o4tbsM+ibMwmzLCmhSZDAwtj8tgyLuB4vs+Ntu/OBdUkW/HpAsGYmYO4AnQddHpP63IQFiWd
	ndVE9V2t3yhjA5eSfM/Hnnd9e1LbdC+KzJin6Jc3yupvcEcF0r0tKJyJqxFBvnlbnoZa9Uzdgux
	ENlzEeF1PXji/yQBKJW9Rx4qERw6K9CkNJOQ+CVljQlLyHL8ekSY/FMngXK1fQNu1fEHzUFyI/0
	IZTqDswLNGRyUPOrkgI+qYEuw5jZGCRzpPMTUrnBtjqI+Al50vWNSUpLb/n+pX4q/MH6VuOsjBO
	F8QYO6Ha3OCm/WqrzCqsNuPHMdfLjJ9gRIrzhbEQ==
X-Google-Smtp-Source: AGHT+IHMxyz3HqWdytwVzKtpLq6nNWsMAFhsBZM4Y4TDLGG3D5FJ2CR9Fgp11hf8I34jL0I0TVy1bQ==
X-Received: by 2002:a05:6102:688a:b0:5a0:a095:9a2f with SMTP id ada2fe7eead31-5db3e0c8dddmr727310137.3.1761300603402;
        Fri, 24 Oct 2025 03:10:03 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-934abba3746sm1944856241.15.2025.10.24.03.10.03
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 03:10:03 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5d96756a292so3801199137.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 03:10:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXFfvlznbABSj2a2gE6rZ7W5iqlieF/heNoPUPOxV26LmMv/vo1UsuZCMra8yqOyUrhwHEcw8LX1CI=@vger.kernel.org
X-Received: by 2002:a05:6102:54a3:b0:5d4:1499:99a4 with SMTP id
 ada2fe7eead31-5db3e20ccfdmr599456137.13.1761300602852; Fri, 24 Oct 2025
 03:10:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014151325.160062-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251014151325.160062-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251014151325.160062-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Oct 2025 12:09:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV=e3rj77BV0eb++KniTqHSTmDpX-1O5AFBODxOf+s7ZA@mail.gmail.com>
X-Gm-Features: AS18NWBX708mbwXNFoDh6ZLkVdZtZB1QvklxJwBzxdLMFKS22IAaBo88zTThT5I
Message-ID: <CAMuHMdV=e3rj77BV0eb++KniTqHSTmDpX-1O5AFBODxOf+s7ZA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: renesas,r9a09g077/87: Add XSPI0/1 IDs
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Oct 2025 at 17:13, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clock definitions for XSPI0/1 to both R9A09G077 and R9A09G087 SoCs.
> These definitions are required for describing XSPI devices in DT
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in a branch shared by renesas-devel and renesas-clk once
the issues around PATCH 2/2 are resolved.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
