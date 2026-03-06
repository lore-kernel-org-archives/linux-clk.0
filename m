Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6899D27FD44
	for <linux-clk@vger.kernel.org>; Fri,  6 Mar 2026 12:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772800565; cv=none; b=QtBEtLN5HgBiQsvSY5t5NU7AfvA9vTAgvjoRIBN0NMnJj3X+FhWvLFfqcyUEGRclvpl2zn8PCI048UUEhOLOtQqN/TRf/7i2/wMDYdVV/0Z9sKuMiUYdhZMCxHhA0SIEEwGendX8JBpYpB3/gSBQD9Zflq03WJD0MMoMGYXt5YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772800565; c=relaxed/simple;
	bh=n2/SovO2hXUZ4vwoDsMjq5yl8OUXVJvop1qoGL191Og=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ORaALaX0u6MtTtSk7xbVy521dCE8VeZhOvsFSOpJJqkvkC2cldj+5Km0AjranUYBpT56SVtrDDEE8+ggIBTJxPS0IHENi4fk5V9T72n7t1dEh6C9Uszl76ibvcc4/lboPzrybK5GOPNR1yFUd/6Gc+VezUSDFMjUweyRR4VCZ98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5673804da95so3769520e0c.0
        for <linux-clk@vger.kernel.org>; Fri, 06 Mar 2026 04:36:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772800563; x=1773405363;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LuKpTyRyDds90U323Zaw/KGEswVAeRJ7S19meSiB1CQ=;
        b=DRicA+VyR8zZIuwewu94iBk/8+DAdW9dAFSkfI6fYJ/KaVxEFr/F9RLjbmxHI3yUBO
         Z1+qrG1eFzlD63ZaqihNXgkSGOoESWFpHUs3e8pmZeut9tahBOmeG1TySWsSBQtBusca
         iilvmZ3WzDKdfIJTAwiEr+OmfH0O4nfzY5skTGVQBRT4rggR5AQx8lV+oEzkhRR9s86S
         3n4oBg3qAmdGbZlvWQkLpqfhFohEKd0gVGZiUNMuaNt/8DZn68WsmEqeeb6RbQjzhUEI
         vv7z4tq9zeh3W6AECZhW8VT5auu9mW1Y+unx5xEfFdW1e3RtxjaaKCyZ3OhoT/0bjnRR
         Q2wQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXPU1FW6ck8WeKxcHMc9Gi3UaeuWo6DFbtHZLIW6mA1li2knqQ9/RALxKxDgVBZCndqeQTTnhtpVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyywrKUbO984vsP4UiIXaF4m9Ktwa5+MEFUiWBSUzu4gAKjfiH8
	Gu87j9CMSjcgf1DI27xzkN+b9Fe4f3JPB4HC3CpoTQxmPiim6q5LO1YHWtfo3xypnM8=
X-Gm-Gg: ATEYQzwjByaFnw5tAoo4ih0ZWElR3TwyC4ngCIse/H01PKhr/2SLYmswzRy2aXpT4xK
	o7qrv7FV5c0RL68uttvdLv/LP34mp0v/Y06g0y15BXs8NIiwbJgk3QTu/r0kQ6yik9kCCDremV1
	BRZXMQoa0cQvXjoWn8S/c8IQXJLcHq0wie8BQqpUqEieJDcCsUD5BLrpEMna0AJGLZOZOFqIKur
	6WVutfdyA0KpXRJpon5gb0pV4UFypJObtnZEYsr85Vq1gqxd81p73ZFBUgCIrcPHyFNKvGwKfCU
	GrVR8y9QAJkTHOuOAFOTivwCMkJcxLiWbKUMLhGtabr/5rRAbWz74iHdEcfJPza0Y4uWdHmUDq0
	ixOjx6fAYCE2om7k4AB/dNYpaCH1vyOPy7NdPmkrcTsX2zdsrL3c7jLfrmPCy2Ywfhs0zcXpuXS
	piq7HJmNEqPCeKDdr2VBnLZ9Y48i0pnbOWo9NhkYm5/5PmS+VMRvZrByEdO8eXj/DJfQbW2/E=
X-Received: by 2002:a05:6122:1699:b0:56a:ff57:3a8a with SMTP id 71dfb90a1353d-56b07e81392mr574636e0c.9.1772800563379;
        Fri, 06 Mar 2026 04:36:03 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b09a40cbdsm1272022e0c.9.2026.03.06.04.36.01
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 04:36:02 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5ffe6887e21so154197137.2
        for <linux-clk@vger.kernel.org>; Fri, 06 Mar 2026 04:36:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW4zure6IsvHbdoOPfp0JX+60cnRzVmQojNoV4dthUew4fwLu8siAB1CHbqO6hoYHPMdY72PzS+8m4=@vger.kernel.org
X-Received: by 2002:a05:6102:5086:b0:5fd:eea2:ded6 with SMTP id
 ada2fe7eead31-5ffe5fcfca1mr594823137.18.1772800561486; Fri, 06 Mar 2026
 04:36:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125190314.26729-1-ovidiu.panait.rb@renesas.com> <CAMuHMdUtZqu6xTEena3VXB1_5vdFM1Pu+n9aS_bXXw3cekgY3g@mail.gmail.com>
In-Reply-To: <CAMuHMdUtZqu6xTEena3VXB1_5vdFM1Pu+n9aS_bXXw3cekgY3g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Mar 2026 13:35:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUE34_eAh520j7xudoBWgeoPZr8ggc5LQGZHY74Ka3fYg@mail.gmail.com>
X-Gm-Features: AaiRm50UsQ0_G8RtZRr9PvUmLvM6ZOddcq3QNPHABwMCoAn8E2y8IhMT-rwBY0w
Message-ID: <CAMuHMdUE34_eAh520j7xudoBWgeoPZr8ggc5LQGZHY74Ka3fYg@mail.gmail.com>
Subject: Re: [PATCH 1/1] clk: renesas: r9a09g057: Fix ordering of module
 clocks array
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Jan 2026 at 16:25, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Sun, 25 Jan 2026 at 20:03, Ovidiu Panait
> <ovidiu.panait.rb@renesas.com> wrote:
> > The r9a09g057_mod_clks array is sorted by CPG_CLKON register number and
> > bit position. Move the RTC and RSPI module clock entries to their correct
> > position to restore the array sort order.
> >
> > Fixes: 2efea3b35cc9 ("clk: renesas: r9a09g057: Add entries for RSCIs")
> > Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-clk for v6.21.

Promoting to renesas-clk-fixes for v7.0, as I have other fixes.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
