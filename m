Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28346304BBC
	for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 11:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769425589; cv=none; b=YjtqS1gKx0GZwHTJhkm6N/BURa0V/AAfQ/15CtOEMdHcZ2BOsZKk4frW36Udjj4eFd4sHCuC7H5/T+XcyGAQBoVoTYzm9VowypWhnJvq3huxjKSTQsnj/nW+O2r9Aa4bXUkMO31AtxfPS88GrpbOHvKRubjQgIGpVB0YXnzjvNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769425589; c=relaxed/simple;
	bh=2H0McNSW14YeB8QNJBi9kKZne48lu2V8yMUat775eL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z3RPdo06FhxL6TSDHf5PBy6BlkLh0rpZ7SqS5RbkJBbOD03Vzac9guHMpokpSxNxavF/j/KWNBjnrjQDaOfyWCz622Vp2bpE5OkZUNmgOr+UVMkZXmbrhk3rUId0XSG8mo829N4sZxRYw9Dp09FTvLMVMwQ2Pcw1TZpiLsrHAJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5f1b9fe06b8so3871838137.0
        for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 03:06:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769425587; x=1770030387;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6aS98Qbf9sAOaU61dqPi/K2l5V6UxS+EUsC0EMiIZcM=;
        b=WbDRAVgolMEnqNzSPukCLqLk+Hme5ymMUWZ9FY+ITe2+3Z/eZqHHkPhk16JKbd21Jl
         K5s6bmkGlT3yHGXdvB3+0NLHCgsydsgpGaytiFaImqQxJBng5IRKvCx0O0vJBf6PwTd2
         y2XiZw2JKE6CGPhj0DZ8ytm4JwIf56HsnTzQxbLea9GKdmSm2ZabUuhR+MXBq0B5YEYF
         M3nft+tkiaTWAYdAzoMMMXOAf3Q1WF8OJlppQbP+xtPBMzpxpM1IF8f3BA8UZpIeYNdz
         cI4D/77Dknincn55Wweg84FzpXIR2i+Ncm4uqqzlOy0Pb48iMqigxcvsNXhFqorNeb3R
         H9uQ==
X-Gm-Message-State: AOJu0Yydtd8KKv7aMhvr4aAb2Cei39AjNQq7lL/ncLMDX9yOzvQal3La
	+HGyj6OjGMVvM3pzqtp6AALwRK2cfxoj7+QSVFieZ+FLI+qQ6wC48nQwRb6SDxw4
X-Gm-Gg: AZuq6aLOSoTuZ1damAG6rLKnbrzJPstG59ap7LmJShALwSanMr2SWiAhAtOvVcwmLIV
	dL13nvVPSLkTK59zPSc/4e9CNR1UjfIKanJnP64JNoRLzW7dQm5BiG3438AYC/MKS5wO9RyClzX
	ugRqFRq1DlhYsGIg/XcpKEGe021PzNQHwoxSLTDb/BR+u56Xxs/TCO3I/2gY0P/hQqa7iefJf2I
	IQ2Amq5e4WT8lV+xW8CvmWTJUvhhfX0/pV2vTjnFP71sAitV2paYmPO0MimbBp0LSzUVIctQPdA
	t+heyuvjR+9uGs4E/qi5fYwI3TwcU6gSmFSbOfSLYuu0EXF7jgrlh+ZsK5CeB5p8qe6sgGYZ9Zs
	lXxOUgRd44SCVEs/utEvo5pytN+rMCt1hPIBTzclc/x1rGiJCkum2nJsjjVZJTtQ/17HajgXeEJ
	LVNniwLBddhaARXsRg7X4Ya3MY6iIIZuOYqu25NSv8VCFuEpyt
X-Received: by 2002:a05:6102:dce:b0:5df:bd66:7b76 with SMTP id ada2fe7eead31-5f57635667amr1141220137.17.1769425587092;
        Mon, 26 Jan 2026 03:06:27 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-948369daf5esm1400432241.14.2026.01.26.03.06.26
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 03:06:26 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5f53505f012so4700483137.3
        for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 03:06:26 -0800 (PST)
X-Received: by 2002:a05:6102:953:b0:5ef:a8da:8b26 with SMTP id
 ada2fe7eead31-5f576492b87mr1267237137.27.1769425586050; Mon, 26 Jan 2026
 03:06:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121232657.155281-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260121232657.155281-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Jan 2026 12:06:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVa5_Ad9fssBqQkM2MYevwebowmNZbFJ64AXirn0KfrRA@mail.gmail.com>
X-Gm-Features: AZwV_Qj5vhAcK_cpdHEhBGKru4FfHXAD4S81A5Q270vbDRN7RD5_nDM_1mnBenA
Message-ID: <CAMuHMdVa5_Ad9fssBqQkM2MYevwebowmNZbFJ64AXirn0KfrRA@mail.gmail.com>
Subject: Re: [PATCH v3] clk: rs9: Reserve 8 struct clk_hw slots for for 9FGV0841
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-clk@vger.kernel.org, stable@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Jan 2026 at 00:27, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The 9FGV0841 has 8 outputs and registers 8 struct clk_hw, make sure
> there are 8 slots for those newly registered clk_hw pointers, else
> there is going to be out of bounds write when pointers 4..7 are set
> into struct rs9_driver_data .clk_dif[4..7] field.
>
> Since there are other structure members past this struct clk_hw
> pointer array, writing to .clk_dif[4..7] fields corrupts both
> the struct rs9_driver_data content and data around it, sometimes
> without crashing the kernel. However, the kernel does surely
> crash when the driver is unbound or during suspend.
>
> Fix this, increase the struct clk_hw pointer array size to the
> maximum output count of 9FGV0841, which is the biggest chip that
> is supported by this driver.
>
> Cc: stable@vger.kernel.org
> Fixes: f0e5e1800204 ("clk: rs9: Add support for 9FGV0841")
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Closes: https://lore.kernel.org/CAMuHMdVyQpOBT+Ho+mXY07fndFN9bKJdaaWGn91WOFnnYErLyg@mail.gmail.com
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: - Update the commit message crash paragraph
>     - Add RB/TB from Geert
> V3: Add Closes:

It would be good if this would make v6.19 or v6.20-rc1, as it is a
hard dependency for adding 9FGV0841 device nodes to DT in v6.21.

Thank you!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
