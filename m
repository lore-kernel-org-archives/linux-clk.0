Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0075D2FE041
	for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 10:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761302326; cv=none; b=JdaPcNsBC4F6SXkk4Qh4bhRQcU3dLkcI1SnZbkoKxdWId0Bb84X4anOE0sjDIkibjP5U9/sJfhoiLb2M6PhFgsTfwMLYJI39BwqH2dBNjC+dCpUKHVFMZ/5rMGXkonCuI6cmB8dzTqLkhFG3dL31qNhZf0kAvLTeTWKxXaS9Nnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761302326; c=relaxed/simple;
	bh=4aqMM2V2h8+Ukj51rclziCzvwPpszThxOiAHjq+32ts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=caf/093E5QxMYqIH5gTHndegTKp5LAKb9ir1vSFJhRdDMKQoj/XozPelJbIbQGe283HRhD2KpaJ0BjqmiPieF0TIG8FRmoMTynd10dwUnpkRFI6yS7OU6Bzxl0BwYpkLIagHnEZO07dsMwOOc4oceGF0IbM6U4novN9sHqg+JLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-580144a31b0so1168049137.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 03:38:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761302324; x=1761907124;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ORay2JAYaT3uXyXxpnw7CEar8/xMIWtpecxnO8T0h9I=;
        b=tB0jVKlqSlRyW5pAUevA5Reu/3KMPqCb+VymQ0/Y8oYRVQG8YSqlE4HlZemtJWQysj
         8Z2aqc/qgLsJ+5lxso1RfgYiZmfdODKhQpuk1sWeIrn1kxgLrOtRSkZwmonNgVnlf1el
         g4wUR929aI+1xhwV8txcx/TXiXrTj52qVthiX8Mf9SFopeDatMEvWYh2e+Lj8HMarjes
         Y0HQF75vJamQeIWkDLJfta46So70kmbMPRlGJF0sJKor8zdGuNY6YGGxNVOBKMmm3Lr1
         3Lc35F3WaCAc624dSdAx7ItMpuF4he7m5717ebjFPRQUz5sENMKXaWa5rawOmZOqHTj2
         SGtw==
X-Forwarded-Encrypted: i=1; AJvYcCUfnUYHbGRLH4O+xoEcGh0bVgW0rppW3zOKKXa145EETlWDYwtvsxD27Nxk2dqi2MjFxuZaKKzc5gE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZC4sIqaL516YTadZ7vApUDpKbqMmziuZTPpJtkVvYcEBZS7KK
	uaA2tBI5tds/z2JiusLSEYp1CmP1XFMDTOl/bffCA0V1CFrMyj/JlNrCe72x3EWw
X-Gm-Gg: ASbGnctMC6BRnvvFNmb/FrchuY9bNXreH+E+F7mygxoDZBLYNJyYNTakvotGmkaUvaq
	1yF+/cKGlX5hrpZjBwyJh+cs6o3xEW0AWeY2n3so2oUxZynFLwu4SNroYLW0DwlF1U9j5UOtnLQ
	V818jsS3gdz4f9aw5F4+qaSYv+orrGbRDZv8HiIIjr+1lnzyiq6nvUTsaUqauB/C2mVUxc7Auac
	Oy7eEU5sxUaVvVPpWEsHs2A2v+e7nSStiQ7gGdTh13ANECU58d2ot8P5i3wKNMZWYPyzB6Yhk26
	4k9ih+/sWxjBz49v4FR5GjIQsoTkPWzFDJBezClM8GAbw3y/bfEpBsrBOaAm8r+VxyDqYlp47es
	71zYq3YiBF9WTT9T8Ebk8lb8VoH+O+H6eW2IzV+8+HFJcOq8oVJ64R0tNExFzaMBaZgnvvbS0Gg
	HsbQDPJFkx7PpOcWkkxWBCXAQYbRbw7dSwbOR6oQ==
X-Google-Smtp-Source: AGHT+IEr9OsUFY2zoHEjc8J6zKTFSlaUFN1MAWVMzfYOcRPuTzvgQPEmtupFH1fGE6/Cx11goadt5w==
X-Received: by 2002:a05:6102:3a0a:b0:5be:57a1:3eda with SMTP id ada2fe7eead31-5d7dd555917mr10271742137.2.1761302323677;
        Fri, 24 Oct 2025 03:38:43 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5db2c77bc89sm1941568137.3.2025.10.24.03.38.43
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 03:38:43 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5db308cddf0so1902067137.3
        for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 03:38:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUpiT4tJ7ZblqTkz9CESvpI2NJ+44wzvXWWHCYwOhgVdyD2OzmblTfnLie6FsLi5X7BlyLKW6nnMUk=@vger.kernel.org
X-Received: by 2002:a05:6102:dcb:b0:5d5:ff4a:87fa with SMTP id
 ada2fe7eead31-5d7dd6f5c1fmr8926294137.43.1761302323213; Fri, 24 Oct 2025
 03:38:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023210724.666476-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251023210724.666476-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251023210724.666476-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Oct 2025 12:38:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV+XsMz42cmSK5tu6DhZV-5ZqJCa1c9u0-YxgMe3V_5=w@mail.gmail.com>
X-Gm-Features: AS18NWDY2yKje__-I7uH-MFrHGUKvE7lNUPe_6x8wQC7kjvQj6AdehD9vn5JPrs
Message-ID: <CAMuHMdV+XsMz42cmSK5tu6DhZV-5ZqJCa1c9u0-YxgMe3V_5=w@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: renesas: r9a09g056: Add support for PLLVDO, CRU
 clocks, and resets
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Oct 2025 at 23:07, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support for the PLLVDO clock and its related CRU clocks and reset
> entries in the R9A09G056 CPG driver. Introduce `CLK_PLLVDO` and associated
> clocks like `CLK_PLLVDO_CRU0` and `CLK_PLLVDO_CRU1`, along with their
> corresponding dividers.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
