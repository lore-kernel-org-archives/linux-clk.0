Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA623932D0
	for <linux-clk@vger.kernel.org>; Fri,  3 Apr 2026 09:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775209607; cv=none; b=ku+pY+j5tvLZeAU4QrmNvtTdKam5lDIhbwFKWcEttlx03AyfcKAxeG5IdDLi4lC20Aak3ZZx11oDbWrYrLJC86P+SVFstMRIewnxMLCrmnxIg2HnNKZCd4ZEF026FgdpXUn9S8Il6uTwqstg4zVJQpAgJ3kdE2diohkVclaba7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775209607; c=relaxed/simple;
	bh=xIMtkM1AO/+pCb46/YkL1W8hk340AiMC7+qsqj2101A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FYgNBEMpK+ANasxwyC+qR3EEEheQ9sRheKokGUFggQcpoTG3+1g4h08NFfqtGGQ1JiKmAh2WsrXrGUU95d1vF/3WRXfQGCbZyYrK4PsgeaF1+qb+F7sDkChiyn+AndtvDewN/U7yDX9vEGgDIZMrYrGLOQIBKmT2xboc7WElbBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-94b07fddecbso971931241.1
        for <linux-clk@vger.kernel.org>; Fri, 03 Apr 2026 02:46:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775209605; x=1775814405;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mf9z1RidjmeEkLdOPGa/NEhd6I83u2yY4czLjlv7UXo=;
        b=egwR4z5XB7ajsVe0AFBIO5YN3kx9WCYJu91qieHDpodPWQzuPqn+69OMo4NmPsbxYn
         4OS8e+c+Vlj8K2n/n3hIijikvsXVgfjnEigBajBPoo3zB99qDnXi3ZuQO1Rs8CuPs9Mw
         bD4NFJpMN887d1yVG+gKljTqxTEwBUX+1NCWz47EjmXdRnP0NJQCNBBs8lcnj0sRRWx7
         36WitRYd3xcrMWsP4sKHjS9mYIZf7u4ktWw6oASksLfgBUiCebp4Gh5+fuJS8vv0t/jZ
         YeCaH434Fup/u94kDury2u29G74hjtMSrYNC7sthTuh9tfqeQ3cODQu9jU2Njp5lNKhi
         9xzA==
X-Forwarded-Encrypted: i=1; AJvYcCUFV72Pl1Q23tQkSQVrDUzh+4g4WuiQy9iZEkwW6u5HLFhO2rUGWdSZguDHtcMFECy6BX8t3H0xJGA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRhO30mRcHQDYEwAght1k2miNpK0sCVzTR1tzZ6ibQReQSg1bp
	6AgI4unaym+p+xdw0qIsZGdIXng4w/Z+ngu+JF7Y6nFiCftoCy1dgOGG2KhCI87O
X-Gm-Gg: AeBDieuRJc8STEhgdKS8UpngCgD/Z8PCbHmw05b5E9VYe3JY+cCcXzRaXlxi2uDBZNL
	luxgyfirVLjWhpP2XT0eMXG9jO01kHsCDk2WQNrf3FSDyCDwDh+4+QHXChmfWwj/eD0mYj48v9o
	84bll4nY1A3zVGqoNUyzsBR3HRRobV4IgDmY49230BLxcll/cJIEc+nAgyHkxvAzv4AzF+k1Mva
	yJJ7uhTuaLVNfFIavKIqY49pCMxYSJo7Il/twU+hIBnZgF5MmbA139rQIVdqLuKRchZkPLAwfCh
	4BuCTfyOlSONfnrTnL4Ln76bCcFoVnN2Xo41jmhnslLPYelBBkDwtRc0l62JeHbCTgmdScRMpLB
	unhaGn/xAGextUji60BZ6cNh27SsGi0/WBs3FP7kdhhFnPwWCkbTyF/TvXKTnJOlrCmBIzqN4aq
	NT45yZtzPLW5NUD26RVgg/6MJwGDiuAnDT4ikh+DKQMgldVA/PhEu80oNkfebxbaiO
X-Received: by 2002:a05:6102:578f:b0:605:38d2:26c4 with SMTP id ada2fe7eead31-605a4d5bf43mr925648137.1.1775209605323;
        Fri, 03 Apr 2026 02:46:45 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60582e730e9sm6861764137.6.2026.04.03.02.46.45
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 02:46:45 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56cc67e01deso1619806e0c.3
        for <linux-clk@vger.kernel.org>; Fri, 03 Apr 2026 02:46:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUvlO7qrEJfDmTIJtH57Eo5oD2fX2vVb9RfntpG/H52HnObxqY8WqWPCqnAusvsfRSaQtlSQB/7t5U=@vger.kernel.org
X-Received: by 2002:a05:6122:4599:b0:56c:d5cd:1e7c with SMTP id
 71dfb90a1353d-56dab87d8b6mr841968e0c.5.1775209604909; Fri, 03 Apr 2026
 02:46:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330132349.149391-1-biju.das.jz@bp.renesas.com> <20260330132349.149391-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260330132349.149391-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Apr 2026 11:46:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXY09WjDs=6ojnA0FyXSJTCq10Py5tBpOuMPRo1yAv6qg@mail.gmail.com>
X-Gm-Features: AQROBzBmMKipGCj9PSn0MXH_r7ou15tJCBurl67WKLPlkmCeCXsLcjgV8p4hKKM
Message-ID: <CAMuHMdXY09WjDs=6ojnA0FyXSJTCq10Py5tBpOuMPRo1yAv6qg@mail.gmail.com>
Subject: Re: [PATCH 1/5] clk: renesas: r9a08g046: Add GPIO clocks/resets
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 30 Mar 2026 at 15:23, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add GPIO clock and reset entries.
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
