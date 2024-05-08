Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C693A1AB
	for <linux-clk@vger.kernel.org>; Wed,  8 May 2024 21:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715202491; cv=none; b=ULnhUijHstBitF7o5LaGfZRz9Pr7v7BQ7O6d01yCCEWt3yH2B35BhXW/xeXt/8vJgwTM7UkF9UwExth9BTLlJ6pp2mMlj7oE8Q2S2lVx0mrilKp9VF+kpOwr0/A/Xn4T4Bzqu1B3p9GOd9H8bWRIvd+DsraJ4OyUcyCt9k8cy0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715202491; c=relaxed/simple;
	bh=LKGV7xc5nr9ry+yJYOSLrex6y//3fq+gaLwkrTGdTHw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kEuzYwHFwjPor5COnHEwmsHxKir1RXrys/d20Tr5vJRG/uWHrSM9ZsG6rlCNV/TrjVU3B48npSoeeQeMSMxGOsaUJHdKD+tLg6PMJlBlVpWssrtBBL7XGmdkScl86hcaDKS/mx7uMmZWVqNBKPh/qId6Ylcbk7Eah9XZjGYBdXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KiKw0h67; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KiKw0h67"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-de4665b4969so247188276.2
        for <linux-clk@vger.kernel.org>; Wed, 08 May 2024 14:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715202488; x=1715807288; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uysWUhd+mFP/8DQDYwRCph49GuPMOosAxVLVtOn+vxk=;
        b=KiKw0h67mgg/iES4fpkMXS4Kqd5ZsF9spsrAzS+GRxhjCiWzx1u21mMk4RHGCkOPhL
         tdgPHZ4burejA7Le+BIPYZ8QB62B+eJzWigjo6NueGUOh9BAFBhqp5qIG1hKgchKjPaW
         eLOTbzmoG+SvbPeVjyOLq/EbBH54OF+oRlnAMXhL/BKdTNYFomSWTV87HRIy6rFIIVQB
         JskLBSfUX7chADfyf9DUo9cxG9yg3Bh1sICn7CMG8OHvZDWt4D0A6FpjWPBdmbNv/FLR
         rAv9z/2W5BprkG8+8pr6ih7Z3c1HhrA4OjAmPGywvO8Wy5UpgHOLmsVw09uFs+gG9dEn
         u8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715202488; x=1715807288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uysWUhd+mFP/8DQDYwRCph49GuPMOosAxVLVtOn+vxk=;
        b=RqFzuzSPZbkjW3rW+LxsYGZdVO44R6fRmyJ1aNe/t6JSRWrI7c8ErobmHU28IxD8/s
         Iks3a5deXiTi9gOu9gaydF+/Q++zFx5BmTA1xl/82ClxfArPhaSTCdtOU8I4g4kQAwMR
         ANIYpGdEJhvCUhIUZOP8VShUJVjMrryKrTTGRHZt3QZJbhs8E9P4EBOh5RkZ4Cjrugao
         LD7bdVEU8tpO6ca4Sdxmjd6Aq5K/HSd4pNLO8GIfeI/opccoCH3husVCTcB0bw3XVZ5G
         j7PO0ceRqIxuxfEbAht2wy+Imq2p2z59UbDGQ6f7TVaTQ0tOtro7+B8pk3y4qvQ1NGaa
         7Uiw==
X-Forwarded-Encrypted: i=1; AJvYcCVI1DOrSSflr06lHW8pbR9qUEJ1yJNAwnctkwZ0y0esx4LMwVW2E6zXMCasuU7I3szfidsRpUm5CykNfyBCow3N3npBoy2l5GpM
X-Gm-Message-State: AOJu0YwG4cldNTbPJq5pieZS7zfSOxgNfnC5wTIEsX/Bh4BeARrJXZ8d
	ttFl6mVRzrtdEwK6xJw2xYBN1SMeTlnT1sAitELMUN9Nj30qQ5l2yWyDKCUe8nEnGLNufO3PKwh
	zoQo0YuEaBvtcB8COtdz8z1Jug7SBEWRC7Nbl6g==
X-Google-Smtp-Source: AGHT+IFDV9vpign+J+3aFpHjnKGm0GBvz+bXhGRnYqw8oJbUWijE1ChetzcaM/anIQ6KxPCGeplsDlczILq+pqIYhcI=
X-Received: by 2002:a5b:811:0:b0:de5:4bb4:25b9 with SMTP id
 3f1490d57ef6-debb9ce095dmr4532379276.12.1715202488456; Wed, 08 May 2024
 14:08:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYuZd_ur56H8fwDSvUywopvn_b7ogprGkjEatQ7EPTLwYQ@mail.gmail.com>
 <11be44d3-0f32-49c6-b4ae-ba97a9f97763@app.fastmail.com> <820ddc2ec70780ae1ecd3af864dc8bd6.sboyd@kernel.org>
In-Reply-To: <820ddc2ec70780ae1ecd3af864dc8bd6.sboyd@kernel.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 8 May 2024 16:07:57 -0500
Message-ID: <CAPLW+4=D_31Fy_W_7+_ko22y9_-8rZ9Logh6KyW8UPM3q58J0A@mail.gmail.com>
Subject: Re: clkdev: report over-sized strings when creating clkdev entries
To: Stephen Boyd <sboyd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Naresh Kamboju <naresh.kamboju@linaro.org>, linux-clk <linux-clk@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, open list <linux-kernel@vger.kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Anders Roxell <anders.roxell@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 7, 2024 at 3:26=E2=80=AFPM Stephen Boyd <sboyd@kernel.org> wrot=
e:
>
> Quoting Arnd Bergmann (2024-05-07 00:44:15)
> > On Tue, May 7, 2024, at 09:20, Naresh Kamboju wrote:
> > > The WinLink E850-96 board boot failed with Linux next-20240506 but th=
ere
> > > is no kernel crash log on the serial [1].
> > >
> > > Anders bisection results pointing to this commit,
> > > # first bad commit:
> > >   [4d11c62ca8d77cb1f79054844b598e0f4e92dabe]
> > >   clkdev: report over-sized strings when creating clkdev entrie
> > >
> > > After reverting the above patch the boot test passed [2].
> > >
> > > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > >
>
> There are two fixes on the list: [1] and [2]. Perhaps one of those
> resolves this?
>
> [1] https://lore.kernel.org/r/20240507065317.3214186-1-m.szyprowski@samsu=
ng.com
> [2] https://lore.kernel.org/r/20240507064434.3213933-1-m.szyprowski@samsu=
ng.com
>

Late to the party, but FWIW here is my two cents. E850-96 board
crashes on boot when running next-20240508. Enabling earlycon reveals
the details. Here is the relevant excerpt from the backtrace:

8<-------------------------------------------------------------------->8
    Unable to handle kernel NULL pointer dereference
    at virtual address 0000000000000000

    Call trace:
     vsnprintf+0x64/0x724
     ...
     _printk+0x60/0x84
     vclkdev_alloc+0x118/0x13c
     clkdev_hw_create+0x64/0x9c
     do_clk_register_clkdev+0x58/0x7c
     clk_hw_register_clkdev+0x30/0x54
     samsung_clk_register_fixed_rate+0xac/0x104
     samsung_cmu_register_clocks+0x78/0xb0
     samsung_cmu_register_one+0x48/0xa4
     exynos_arm64_register_cmu+0x3c/0x70
     exynos850_cmu_probe+0x2c/0x40
     ...
8<-------------------------------------------------------------------->8

'addr2line' points at the end of vclkdev_alloc():

    pr_err("%pV:%s: %s ID is greater than %zu\n",
           &fmt, con_id, failure, max_size);

Applying the forementioned patch [2] ("clkdev: fix potential NULL
pointer dereference") fixes the boot for me.

I can also observe a couple of warnings like these in the kernel log:

    samsung_clk_register_fixed_rate: failed to register clock lookup
for clk_rco_i3c_pmic
    samsung_clk_register_fixed_rate: failed to register clock lookup
for clk_rco_apm__alv
    ...

The patch [1] ("clk: samsung: Don't register clkdev lookup for the
fixed rate clocks") fixes those. I think both have to be applied ASAP.
In case of E850-96, I guess [1] is more critical.

Thanks!
