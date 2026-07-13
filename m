Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5957282F2A
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 16:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783958450; cv=none; b=Aoy1OM3krdBjH/hbwsPs1lS87TMwfGzNeGDy6LLYTdrG4o+1ZEI4Hl5I5dbHrUzWTbkx40kowxDaWExZNGxZ8qDlBwFLqZTtwZjja5C67/yJJDm2YIuPQIroGNtsSW4FJ4ZaLoC2VRy603+0F0JECJk5AOD2GE2S8aTDskSCtVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783958450; c=relaxed/simple;
	bh=SsOh1enJoELJHzfIclkKXerzvf46Ll/w8xxgwM0UOnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jgQGzf2fpcphaxhmB7wYVPmkj9aJmtJIhF+UFtsbnyNHuWkAUX5/JgG0VdJyEX6LYrYNo9Gh6vNMgWizgTIGXZiO5Eyb4kFvIH055OPC4+JXkCOerPC1q8bTYYvbpj7LuT8PrrlMW/Yifx+aDL5fd4Iege864kxPYC4R8RMX9zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5bfc54558d5so34144e0c.0
        for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 09:00:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783958448; x=1784563248;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=674QbDTihSeDJzkwbUpD4t11m/0pIrH8HDq4q33BUPk=;
        b=Ge5uTJoHRjVsC716x3h5j4AHbpZJz4ZBPqsMjCT/DbyMjfVW8GDmprkwyG83EZpoY8
         BPSMRpPFQGl7APGY71upW7rAr+xmcTF8rBofFJTtHUmyIIFlqesFbcTdMxdMteZDisoD
         cuf5/STVFmWDcO+P0qyugSm/6dEJm1ueFRzbPDKJtCUVDQoyHIDYYhvFr3vg+R3/g2w4
         i4MTC4FhfsyGYTchgzGdwKXPIb20J+GNuDA+LbrD1kaoOaWuV9hjP/YK4ETtBhoSqECX
         39+So1QlJBGdH4nLe4K4L1hwowl7N5kVbLurC+GRoallzbDC7WEUSNWtyzyiZDC2v0bS
         eM0A==
X-Forwarded-Encrypted: i=1; AHgh+Rol+0vIA+r6adGrjqDnqdTi74Y4oadcSZoUOsdVo7BjL6GKpoViGyA8d+8pTOJhCm4XLtSnhf0mVYQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1cmkFEGgHNE3xQI73MyiDsKQeyZ3ppqC7yCTRw2c/Si+vNfln
	3CR1RBp2Yp+oSRg4CbKESaSs0nA23rH63ybiiY2yA+d2v0aJZ7Ce0S7tshtwXIX+6UQ=
X-Gm-Gg: AfdE7cks0qMfK+4qtoBC4KFDd8dxtjp08KhV50SEtYlFChURfG1fTK0ypq1S/7Fehyq
	soskT2rZ3OVRXK8bfaJaI+0XCOqLj47jnnJUEGu0x/qYYtgBQchW/GP24XVSHEujT2pRJQF2mWs
	noAP9m8tGlXOIKBEDGLiDrNKZN2A9WP18X4bmUq0fWlThNwaEDdVOk4HBkkNDqc1yu/Rdv5qSin
	hY3ypN90V7YUnksDwRbjSLMeqIIDutSzLNV5/hqUXcWZ0n4ncm3730bMWJN10IZBFMoU5nWuOyr
	FofOvnXrvpnmVrc36CvJ0Lv6RGTwWhKucBsVweSBHguSoj4QCbiUmRMr0f3Ae2BQnVpet2o0YsQ
	4crj/22WD+r26uop9MrvJEaOF9HGhnalGfWaOhibcyxSZz9sdb6wcaJ254rXN8Qm3oDjzgfV3+n
	1nJZgfwFLEF4OTIPlvaebmwJYx5Ugrzh4zuRYm8wpI3cWKS1OLw1V4MfxKjYpcjQy7
X-Received: by 2002:a05:6122:5119:10b0:5bf:8166:edc3 with SMTP id 71dfb90a1353d-5bfa47759d9mr5959034e0c.4.1783958447766;
        Mon, 13 Jul 2026 09:00:47 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bf6f5e2e70sm10283328e0c.3.2026.07.13.09.00.47
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 09:00:47 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5bfc54558d5so34128e0c.0
        for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 09:00:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpraxIdZPsfCUOQvY78E2sVbb5wKXZOAZjNLFm/rBvlGWlvAait+uROwelWZY1wIIjQ9A06+6jbmZM=@vger.kernel.org
X-Received: by 2002:a05:6122:6310:b0:5bd:a2dd:60ee with SMTP id
 71dfb90a1353d-5bfa470c003mr6470720e0c.3.1783958447155; Mon, 13 Jul 2026
 09:00:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Jul 2026 18:00:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUhiBAcJ6P7j0ZxL+0AbVqz88PMo7YX9UiYOK8jM61D1Q@mail.gmail.com>
X-Gm-Features: AUfX_myKEIDnT9gmvoSHxK3o8Be_bh5PlIka-qGq00orZWkHqkcXT9vOA0tXJpw
Message-ID: <CAMuHMdUhiBAcJ6P7j0ZxL+0AbVqz88PMo7YX9UiYOK8jM61D1Q@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/9] Add System Controller support for RZ/T2H and
 RZ/N2H SoCs
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Thu, 2 Jul 2026 at 14:31, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> This series adds support for the System Controller (SYSC) blocks found on
> the Renesas RZ/T2H and RZ/N2H SoCs. These blocks handle critical low-power
> management and access control functions.
>
> Hardware Architecture & Dependency Challenges:
> ----------------------------------------------
> The SYSC in these SoCs is a multi-functional block responsible for:
>     - Clock & Reset Control
>     - Low Power Management
>     - Clock Monitor (CLMA)
>     - Access Control
>
> A key architectural detail is that these SYSC blocks are physically located
> within the CPG/MSSR (Clock Pulse Generator / Module Standby Software Reset)
> address space. While the CPG/MSSR driver is already implemented and
> functional for these SoCs, the integration of SYSC adds a layer of
> complexity due to a cyclic dependency:
>     - SYSC requires CPG: The system controller needs a clock to operate.
>     - CPG requires SYSC: Access control registers within the SYSC contain
>       bits necessary to control the PLLs managed by the CPG.
>
> If implemented as a completely separate top-level system controller node, we
> would face a cyclic dependency between the CPG and SYSC drivers during the
> boot process.
>
> Proposed Implementation
> ----------------------------
> To resolve this, the SYSC blocks are represented as child nodes of the
> CPG/MSSR controller in the device tree. The SYSC regmap is registered
> directly against the CPG device node. This hierarchy correctly models the
> hardware address space while allowing the drivers to share resources
> without deadlock.
>
> I am sending this as an RFC specifically to get feedback on the
> implementation of the SYSC as child nodes of the CPG to resolve the
> dependency cycle.

Personally, I am not a big fan of subnodes.  I assume you are using
subnodes because you can register only a single regmap per syscon node?
Would it be possible to just extend the existing clock-controller
node with two more reg entries, and expose them through a single
combined regmap?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
