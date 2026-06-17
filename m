Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51ED43F4108
	for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 10:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781691634; cv=none; b=ayDgOxapMOQu3ryz4vkJ8B23E/CsFyJbYwFES10yqD/ePuMQdkVSAqiUMCHOTu/Wfec9q46trSVZEcuQe+IHod3sz/yh4Cuh/8YtKLiyCC30PekhlNlr0bt7SvFgY1PClNNtSS6ZSxtVMk/C3gOZ/UJJOLloEOS41YjIhCfmGvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781691634; c=relaxed/simple;
	bh=En+ahhOZBbXCaiFjFAYdFmkGS3nfp+aP8u8ut054atg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SaxNVpVswjUBsn+0IPrnr1MsU8LHmDJiXni5qfs1+jPoxP570XLxLo/D0GHYz9BRsqT0CN8b+upqT5oTJ+2FXmjhnEL0C4pdRqTYBQ+EBVNe8NdzQftybwNiqYrEGLXoxWDj/f2mgit5+hqvIjqmghQAlLku62vc3JzrLJbJ4pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-59ecd51117dso592391e0c.1
        for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 03:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781691626; x=1782296426;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JiX1JmAxtorWhZ6jPKmVMMl1atN7mp+BVTNS7cQc1aU=;
        b=tKkaZkIoyYwysjFxgHIrbREnG3TBzQfbHk/FSgjYCA+3U2tVOWnJpgT0d9imrQC55h
         8ZY3h8swP/Uyp7t4fp1dlbvyryHP5+6TNqSPciDiWIs2r790AwJcSyviFt6Ey5qMOdVF
         98KJo3PTcWcxc0pGDcLZKz3DMnNMpGRg/EW8EMe6Ro3VrCc4fYM0I3A17MHqSNYxgUNT
         FSxnX1Tr40SWmwnq1ocyIeH1vNTBFY0MHrn0Db0uzTSJqfA4wB7v5ohfxYeTS7XenKBK
         A26u65am5HVvqmI2Ybw6uryJi4/mZaFrkr/BRid1xMsIid9+8H2n3CBKv2IHCmSEZyC/
         5iQA==
X-Forwarded-Encrypted: i=1; AFNElJ9IGw7Ioj7iUQv3bN/PQLBU77mFq8vlui7PolVpQFJ7mos4BrVildYgEAYR7ihAu5BrB4JZysYOjhw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaXnOxSwIr13zdUvEd8tegD4n1/akiOs7tapW3+aZeqKHRmoIw
	S/kA/8N6G8JLzMmD+wR440xRCOKIGabV0YmuA66YVhXYTn+OzBMvZbab1RAU7/ZK
X-Gm-Gg: AfdE7ckwdcUL/B4hFFjbxFQ71ezzAkqRBpFJjHSXpldbL4VPXItWbKhHpw/DHpAbwQD
	r8XARwhUXzX4aM4ftOuZ4DXJLgl5Z7MHWaQerCn8EYCCx6w5ZRHwVErT80XgtPXEuqrBb1UoDns
	k9ajKfvuB3lY5LjxPPnJe9w0aj3pNsJ1Gc9LPrKD3uamdEAPjY3SEjCBuK1Zq+t5k+PRkcWaOhZ
	8pa788ElmCragmEIX7m9/03m1BYuPCYJQExyPJy6XEAjMaQN52wdrhOTKl4wyr06bngGLdTfD+z
	k/zNutRb0ME9hZfoAyGHw6tQ0mVXcqwfnQ833EHglk88Tvv/na/JdkQZ5ZAvOl53E4xmCZ+CIRU
	th9FB279UdLqVHdol7d7Gyqd+6yb0f0yP/sqnkREz1FaCAb2romMxML/FEz+Wiccss9ErqQ+jXf
	sUEM9lI1svJtMJXgm5k/OvkfEDTo7IYsirHbr0TqS7xT7meLmnAg==
X-Received: by 2002:a05:6122:a5cf:20b0:595:18cd:6c81 with SMTP id 71dfb90a1353d-5bbc1334e91mr590072e0c.9.1781691625817;
        Wed, 17 Jun 2026 03:20:25 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-966ce8dceccsm2568528241.6.2026.06.17.03.20.25
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:20:25 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-966db0b76daso292283241.0
        for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 03:20:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/DOhWMlC5KNChGSuICYSRALtG0XR4ylm7dNMMzxYIRC5iA+5iVWp99NxI9+eDUaWO5ox/w80iYk9U=@vger.kernel.org
X-Received: by 2002:a05:6102:82ed:b0:6d2:1633:1803 with SMTP id
 ada2fe7eead31-724f14e6aa2mr709969137.19.1781691625320; Wed, 17 Jun 2026
 03:20:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615143943.1610095-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260615143943.1610095-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260615143943.1610095-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 12:20:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU-FWgx0Z750_pVYS1iyH-eXgdf4ht0ZBdQ3itK-qL7Zw@mail.gmail.com>
X-Gm-Features: AVVi8CcyUMxm1Grgjsstg8ysHgy-x4YdUDopNzMau7jtRCWUtgAqkI2pm5pxbag
Message-ID: <CAMuHMdU-FWgx0Z750_pVYS1iyH-eXgdf4ht0ZBdQ3itK-qL7Zw@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r9a09g077: Add RTC clocks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jun 2026 at 16:40, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add the core and module clock definitions for the Real-Time Clock (RTC)
> peripheral on the Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
