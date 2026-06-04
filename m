Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E871F3E5EFD
	for <linux-clk@vger.kernel.org>; Thu,  4 Jun 2026 12:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780576647; cv=none; b=hmT1UqqoGkt/rwseyPRO0PZIV3gUTieEvGFStH4eLgVIbkWxBtxOU6tfcPstwcTslJXThPpTI1Q0X4ymDI8tQkM3ryjBWhBy421OVOMvw18e257bEYHx+CxosadCNxBe8pHLS+YJlNNzYppKAutJOeM65BZ1YZONrSEUpiiC0BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780576647; c=relaxed/simple;
	bh=Vu59IXWoqahv904gjXxamc81lnnIdAi+ZPq7oroe/dE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a7FJyfF1RQ9yxQXApLWozA09PhG77ya40m79hz8Ti3IRgDPGMpDA9AbG5dQ4NPefZ51zpKo8xUqd35pkDcU+Bi4IPgifpRdaRGz3qHreX8WU+swbj3cAHVFKbRacJsG3FjCwSpaPLHJ4ab0mZyeWLTefL71qjFUV3g4dLVAKeU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-59eb501bcf0so209431e0c.0
        for <linux-clk@vger.kernel.org>; Thu, 04 Jun 2026 05:37:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780576644; x=1781181444;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQTWlarxfkJvz4aV2P+qXhfE+LdhATPUYr6EStsDJy0=;
        b=Unc5H9kIbU/kjDcHXrIhJOGJOq9ZJRmF7UrrokfbQAgsFSn0bk/R72+W0oPWwERURR
         9HGGafBSrqtfQxs/NTanR+TftfMs+ZmcAwngRR+1Pb8NimV7T991weprbvjNrWhXMVrZ
         NZTjcG20m4rRdonahMV2uhQMa81KQTYpAGLzEzwXxUWCwSyqrzxS06g3ti3piLE3QoGk
         oqRWhx3SBV3PvYzNol6GNCKRFJ8SNhtVJTp4pgxmMr+Dw3Wdavtx9gW6liAb9gZ6mMvn
         Jx3UEX8mdHb/O7hm5gh5qzogQSb5/kbn4ncFeeg9zMBO/8GNblnovaVV9Mx+H4jnNa25
         eWdg==
X-Forwarded-Encrypted: i=1; AFNElJ8K5i8XksSuqRkhRhoaiLRZis2rsYn8PHQHhmRzwDbT5fX+AM+PT4QYFezcq3rYMz+pj/3kwb0sTWM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFFoTdDEYemlJCFMr2k79r3OV5Y7dByKj7HPzoku0pYF/m4TI9
	gz0TJ0MEmnBpBnVB+US0dBGwxpiHB6UpHY26gqDaZpXlN0KwKqaPQDLXUEeY53uXk5Y=
X-Gm-Gg: Acq92OHKxVnXVCuw0w7K414Uk1GZ1IvgaiQlJCOx31ijyVV/bx9ZZU4ZUygdy3ZrvS+
	0T5Y2VXm8XsvasGJ5r+CYeUY8+C8iOIZXJwJgDIYKas99XlhX9b6TqjUfKqP9QhD6Ibe5T5wK+X
	EqEuEllHMuVL8/DiDt8rjnH/JaJ1zzvo2/hWHV8m+j/XJvWGk0BW+tl172+yiBBOr06vm1TWv/8
	JO5I9GjYIdVGgPWzGsSdCwr94bp4Dgaqs4KxiDbgihPJG/+3CVPI6V9ZUE7Ksao9mM605FbMdEV
	HHqoK+TbxpZ+1YvVuAfL+mryvmt1HmFl8gJdwNoAnLa/4g25soyQaiGtfZ7zTSp9kKVM95x6RHj
	pHvyf1sEE2q16XhhZx4C3EKngi1625/4YxmnZY8om+3BaoBwxmdDLjJ4+0bzjokelEvHjlURgKh
	hCrjVJKPU0jKpuik2SXgTzPiTl051jn6vIuDwl45LYQ9uC3I9Rm1Ze6kKrDd7JMNZyC5wgEOw9N
	JE=
X-Received: by 2002:a05:6102:f9b:b0:612:21f8:5afd with SMTP id ada2fe7eead31-6ec2bdf8354mr4063234137.12.1780576643774;
        Thu, 04 Jun 2026 05:37:23 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96413d48caesm4691541241.0.2026.06.04.05.37.23
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 05:37:23 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-59eb501bcf0so209427e0c.0
        for <linux-clk@vger.kernel.org>; Thu, 04 Jun 2026 05:37:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9ghXI/XzaRBrLHMNdLOz4GDqj7ilBQnyht8VQx/X2zgiJ99fS0AkShqOgj9d45Ndxt55a+YSA82zw=@vger.kernel.org
X-Received: by 2002:a67:e701:0:b0:633:e67f:b7f with SMTP id
 ada2fe7eead31-6ec46679e58mr3392792137.25.1780576643147; Thu, 04 Jun 2026
 05:37:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525110603.4018170-1-john.madieu.xa@bp.renesas.com> <20260525110603.4018170-7-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260525110603.4018170-7-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 14:37:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWEV0iydvRQvR8j934OpbAkMP0eo5KO=0=4coBDPojKHg@mail.gmail.com>
X-Gm-Features: AVVi8CdW_DNBZw_4xjeS4zyp_RzBGilzh1a7HpuO0jzATgzOq6tO3Hu4fHvpTjg
Message-ID: <CAMuHMdWEV0iydvRQvR8j934OpbAkMP0eo5KO=0=4coBDPojKHg@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] arm64: dts: renesas: rzg3e-smarc-som: Add I2C1 support
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	bmasney@redhat.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 May 2026 at 13:07, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Add and enable I2C1 controller support with pin configuration.
> The I2C1 bus is routed to the carrier board and used for peripherals
> such as the audio codec.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
