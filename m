Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B542F36D4E1
	for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 13:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768830970; cv=none; b=rZOqmnkNgad88B+0juC7DW7PVC+vZwJsSHJsytiuXJysL7nssXkWKnLLM2uPDKqTrxPGVYPE7Pn8eY4gjdJQXhK6kXJUg2bby22Iwoy2aJrARR5vDSzGT83ybqWtWfISv8zxgtd2IKTvRnKx1aw7ZEzObUHukQlNco0cIZEp5OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768830970; c=relaxed/simple;
	bh=USU2dfqEi8y03HM3f87V6O1i0tfjkLsCH5ivCaeDP4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BjSNEJG7973I7yqd8z3uj4eAcGwwk/h/YGRgyNE8XAsjTyW8ZxrXTFPEVYm5b0+qTT1y4tJMRkbqh/1Ymaw4BY98Es9XpTE+tFYWooaz3z/n4YBJuJoBJLUFVbWCp+zgaXg7sQsUfYQuo1FPtqkReXvCF1yXYTXj6kTpPnVz/MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56367a388e5so1109964e0c.2
        for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 05:56:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768830968; x=1769435768;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+r64VZF3kohfXXfdlR1Pb964pfqiX29JMKKPRtqCraU=;
        b=kPb0+CQ4Uk+9QX4SYcCeTUPYRhxLflsZOxPw43muDaUYBKe3TgeuZdSuEbT84ZCtYB
         Vooo7zTgjieBSgs5wYcjA5AkH4Owy1LD7vlHl7AjMpM09HCNQ5MN/6sep250fDyAdRuz
         Kf4KrbBCdAh3hgubDxmpJ2t5YQxdYYr9dwRyKe0XDbnOg6/fARKkZIPsZ9y3dF7wk1oQ
         pPvQ3m+Ebt7Q2IRPVO4Zkxh6jXdDmkDvfDvD9qGoy7mDTIvHLY4qv6LUfxtvufsF13O4
         ycUPR4AFLQNVmmz/08XkIanFF1DFf/7RpdtPoEkJmLYX7jvyNAyB7NFAvpT5NEovdSJZ
         z9TQ==
X-Gm-Message-State: AOJu0YyY8ZwT1njg1dp7puncTkfrx4BJ2seSpDwCkUb847hNDbT4pak2
	3FlfuBDZQGit5n7PZoTxFsxxWt3V8M7xfZL9DkrHvF27uFFcB3nb+p2CM2BXg64Y
X-Gm-Gg: AY/fxX6YoYGasayeST3/QFH0wsfPnzZ+Yoew+NoUdaZNjx8yOGQW664Idbns+RrCll6
	8ncpXuqFW64lplWFyD5q40OC77AmSyBW2jZPsxYtYFz8wWOEI9Yh/Xf8m1NhOCHq95r7ML99UBT
	QbSFY4eh2XQR6Bn4WV0S5FsdVHigGOlU+sX7R11sgVlxqIgmVSBu1dfhB0LBkOCx1jvjGpMqj7N
	W8Ialqxz4UxXXr6asSnKiB/EqsslzuuLhTGR6HRbE8h9juAJbPVo3Atkeb7VJfnTEYHDNrwgByw
	ascvXXnwhEdox3nrtsKdS54iUKzEHxmDAsSwJOGEMWzmikYGFCiduFamrwaCFr2JblHTgG0R84c
	Kal01zDRgp7lFdFzi5EZJyXQKL7UUIc9TlFzUQYgFlHysMHLtt6p6zy+ZUHmkyLE9sEXo6PA3xB
	0Ek+qw36aKQdVesUCouw1YiBDgx141rsVw9puRW3ZL7Edrhcuw5bIBs9H8xMM5YiQ=
X-Received: by 2002:a05:6122:3c91:b0:563:746c:a32b with SMTP id 71dfb90a1353d-563b738c3d4mr2579556e0c.15.1768830967651;
        Mon, 19 Jan 2026 05:56:07 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-947d0437f81sm3135782241.11.2026.01.19.05.56.05
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 05:56:06 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5637886c92aso1040016e0c.0
        for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 05:56:05 -0800 (PST)
X-Received: by 2002:a05:6122:3a10:b0:559:65d6:1674 with SMTP id
 71dfb90a1353d-563b738c18emr2498607e0c.14.1768830964978; Mon, 19 Jan 2026
 05:56:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260118025756.96377-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260118025756.96377-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Jan 2026 14:55:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVkYUwYHOCtFb==YJ=1TK9+Tz1X=teaoyoooxe42eBYFw@mail.gmail.com>
X-Gm-Features: AZwV_QibGyBfaw9ULWtL_BEHCROa8nfd8JZ0JnZ6LzEfFQ4IkCqSKKVBJv4Vw8w
Message-ID: <CAMuHMdVkYUwYHOCtFb==YJ=1TK9+Tz1X=teaoyoooxe42eBYFw@mail.gmail.com>
Subject: Re: [PATCH] clk: rs9: Reserve 8 struct clk_hw slots for for 9FGV0841
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-clk@vger.kernel.org, stable@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sun, 18 Jan 2026 at 03:58, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The 9FGV0841 has 8 outputs and registers 8 struct clk_hw, make sure
> there are 8 slots for those newly registered clk_hw pointers, else
> there is going to be out of bounds write when pointers 4..7 are set
> into struct rs9_driver_data .clk_dif[4..7] field.
>
> Since there are other structure members past this struct clk_hw
> pointer array, writing to .clk_dif[4..7] fields only corrupts the
> struct rs9_driver_data content, without crashing the kernel. However,

I am not sure that is true. As the last 3 fields are just bytes, up to 3
pointers may be written outside the structure, which is 32 or 64 bytes large.
So any buffer overflow may corrupt another object from the 32-byte or
64-byte slab.

> the kernel does crash when the driver is unbound or during suspend.
>
> Fix this, increase the struct clk_hw pointer array size to the
> maximum output count of 9FGV0841, which is the biggest chip that
> is supported by this driver.
>
> Cc: stable@vger.kernel.org
> Fixes: f0e5e1800204 ("clk: rs9: Add support for 9FGV0841")
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

The crash I saw is gone, so:
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
