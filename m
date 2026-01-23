Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0811F184
	for <linux-clk@vger.kernel.org>; Fri, 23 Jan 2026 14:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769179035; cv=none; b=okgqcN4nvWhz+Y5O/00K3lcdi0CuO8pp0HJXYfyWalV9v1oTS7Qh5B8+IVtEuz6u+SXIGugvXD3ExKpUXLzusGvuR4u8ArKeZtAEpV+7U5uuwTJ8Ny5Sb5j03lhA4kwZPrCt5RyvNsfiWWe1yQax7CZhOOT7DupahKBHufQpyN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769179035; c=relaxed/simple;
	bh=nCsWChx6yxZSKjZAa2GMQpNOMLhhdbKSzY6rM8oSSlw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QNKl2xfivv6ZipMD5jqClMI1qr57M4gI2imIyJXh2KaqPWTnHAVrKfMNHIiWsQV4z82k/6I2MoGWhkXyOPgqdiMFcOyhSm04QYY6fieUk5nlcDmtFI2o6TvN+whH1wYbobP+UHr78pcYUrEsBzUe/BM3tiOa/uHG0nXLW4n0jeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5662c2937fdso2134577e0c.0
        for <linux-clk@vger.kernel.org>; Fri, 23 Jan 2026 06:37:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769179033; x=1769783833;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OeOBI8yfyx4Jru6wCPGb60ftZsgppeSY8TcHOVeV6Js=;
        b=ieg30V7EhZbb7g4q3rcjV3xri3ZAi1/4IrG4ARI85nxw0UJYL66tJPkXoDR5OEsrL5
         ovotj+O9hh9KzHTcM5MzXISnd+ZnPCne48xzZlkZ6YyIUu00akQL9xOF/R7gl4Ur9suH
         zvkMdlv2dj5nKRAzccEoA5YliS8Y/0BXXRuW42veRNYFXCa8be219Y5SsYw7HLFLxTRk
         OTJDtUTTIXSySvpmXF/imd6f9ICc+HsDj7Z+4QQ3qTGtEwu/1UedhieKrxdpEnLsVZnh
         IHoShjCylXcEnKMV6Vq7HcJNXNu9tt7MfVFv2XOlY5HBz8dFvrWqxCgbd/NLhtfdBYqs
         YH4A==
X-Forwarded-Encrypted: i=1; AJvYcCXxEPcLe8Lv+hOOot2mcZ9rz5e1NU6zzsj4t8nDzuXXem7sHafxHDJRpzJVimf4c+y8y5S2f4oZhzA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQineRcNoXThp4OD685ZNAvmBWnbTvlQFVRaicP+vIrNptjCYx
	YzOPIYgiBEUM1R3LGVZ/bdacccSh/5M/a4yLYGqeQvnmo9edqGm9LbZdxPILJkgV
X-Gm-Gg: AZuq6aL6SguHd386HNxHMG9GTynAccJSZwOF5a1+LDlR9zQz12PBiwegdDqDXeJ5snL
	TdsFf8SKmTDS1M9eWCelI4SwK0u0ElI9uwH3aRUP+bRJUveNVqYi6KB3j4JTcKSxKA7JtHlw2Zm
	WZuSW75IvZdsDoUDbGw6CWDd8YgaAE509pOFgQGkhJMbfFcabf1gsfz5KW20otLI8Jvm5hYhNuC
	s1ovc6EpCYIRs6MIZRsdjcmRBDtKjlkuJNCt+Ghv/EEIkiBk4k/heQPp/uYBn5DfmshhUlfUEHX
	TDj2VwHUHNBXB7qLgeG3VZ9EznkuRCunY9LVd6lEn8adWvH4xiqf4BPNn/q76bX5C4bpagoqmiV
	ZR7RtkQh3VLPBX0cG6tgC8aldWoQGbVYORfWPy2iciNlyJCtNelM7CpypEmPZhIW8+B6QtgiE4y
	ZSODOKntX7Mm/ZfC/QCeeiDDsiCXFXpYV21cx217Tix9lkh9YN
X-Received: by 2002:a05:6122:e213:b0:563:743f:337c with SMTP id 71dfb90a1353d-5663f9fcb57mr913238e0c.7.1769179032842;
        Fri, 23 Jan 2026 06:37:12 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5664689a101sm181575e0c.2.2026.01.23.06.37.07
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 06:37:07 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5f52aa95279so1953263137.0
        for <linux-clk@vger.kernel.org>; Fri, 23 Jan 2026 06:37:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXyyy6tVdnMADNKeXwE1tmO+kUKeU5LUxvshS9Lh5TITo82PP/KlekfMTKkvMWAHNh5WmtQrhFqgiU=@vger.kernel.org
X-Received: by 2002:a05:6102:f13:b0:5f5:259b:66e1 with SMTP id
 ada2fe7eead31-5f532daa612mr2326635137.3.1769179027220; Fri, 23 Jan 2026
 06:37:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123140031.94752-1-john.madieu.xa@bp.renesas.com> <20260123140031.94752-5-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260123140031.94752-5-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Jan 2026 15:36:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWyFMWth7x0+ZVysLeZkxNNFPQibdSJMVfqymtAE=PwbQ@mail.gmail.com>
X-Gm-Features: AZwV_QipW_DLhbWh9heQ9wnTY0UPaLJrYO-wTDJgNVv9-6b_lsLVLgBLRKHfS18
Message-ID: <CAMuHMdWyFMWth7x0+ZVysLeZkxNNFPQibdSJMVfqymtAE=PwbQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/15] clk: renesas: r9a09g047: Add PCIe clocks and reset
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, conor+dt@kernel.org, magnus.damm@gmail.com, 
	biju.das.jz@bp.renesas.com, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Fri, 23 Jan 2026 at 15:01, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Add necessary clocks and reset entries for the PCIe controller
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>
> Changes:
> v2:
>  - Fixed clock names
>  - Used assert-variant for reset

Thanks for the update!

> --- a/drivers/clk/renesas/r9a09g047-cpg.c
> +++ b/drivers/clk/renesas/r9a09g047-cpg.c
> @@ -438,6 +438,10 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
>                                                 BUS_MSTOP(3, BIT(4))),
>         DEF_MOD("tsu_1_pclk",                   CLK_QEXTAL, 16, 10, 8, 10,
>                                                 BUS_MSTOP(2, BIT(15))),
> +       DEF_MOD_INIT_OFF("pcie_0_aclk",         CLK_PLLDTY_ACPU_DIV2, 12, 4, 6, 4,

Please preserve sort order (by _onindex, _onbit);

> +                                               BUS_MSTOP(1, BIT(15))),
> +       DEF_MOD_INIT_OFF("pcie_0_clk_pmu",      CLK_PLLDTY_ACPU_DIV2, 12, 5, 6, 5,
> +                                               BUS_MSTOP(1, BIT(15))),
>  };
>
>  static const struct rzv2h_reset r9a09g047_resets[] __initconst = {

The rest LGTM, so with the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
