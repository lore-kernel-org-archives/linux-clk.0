Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988A83E024B
	for <linux-clk@vger.kernel.org>; Thu,  4 Jun 2026 12:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780576490; cv=none; b=e6TKEQxG6p/jxLzZgJ8FXMOEk7HWEXiHraYz/HLYzPJabnOgAoCxc54TmZF3coZIO6cn+y8/slcXfWLfVShhipoFjhH8SXRyF0xsaIPBUhEB+C/oe4DxLjQYzDT1zWyBqV4KUThhe99qBi51/xTwlp4dcgKtspPo0wkPj/E4SJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780576490; c=relaxed/simple;
	bh=yW03jyIaXvDzqIO05bz6BGBjkIGqHU8ZE+ZN1NOsK4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A5X8NNX/WrSRxbgZrVFCc6Rs9hCjjhBt1wQnoqFr3H28h4sFF1XQrVtX6L7IBCkXzWqSMvVLA93aAPP3CUxOKYFf2a+Adc4aB22KOBg974QrQvOBw44zuRzrmYmQ0CDx2jgl9znhCotp5EwAmCaDuJT3jJu/HRuYUgT24TABkeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5a1490272bfso454640e0c.0
        for <linux-clk@vger.kernel.org>; Thu, 04 Jun 2026 05:34:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780576488; x=1781181288;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ocjXr/qWGa2IO/F+fdPQn1MjiaT2nZR31qV/kAYxrTI=;
        b=aK6yl+4nbcEBD6/mmczLJ1X/oxfMVdXuTYcHng0Jd3nv3gm+1F624fpYDRMOUEVsVj
         hAZA+t5Y0ciXsjwBzlm2ugLvbL5aV+T7lDzhOyhICw8LOkoVf40jGSaFObdLHZeHcNHE
         +qGiq+DaW9JXStX8CZhoXCgIrQ7gH5SDBDuTQfgfxEkg8xtm/Z9PKqZ+thXiKe6+Y17+
         TmzPqiKE5Hxvc5AWrBRCUAVtUK+G9g4iD1mlcr6BH2tDbrFtCA5tSGPhKzJnqXtFrFeV
         6N712fZ5flLrhQFRcBocWIcy2p80X8IRuQVrHsz17gZEVbajsRnQxJsy37kd018j7VJZ
         x7ig==
X-Forwarded-Encrypted: i=1; AFNElJ9IZ3EvRByAnHs3vztl3OVt287fGwYm2ymqiuJgCyMW/EUerU0dLMmRSQtCjxABwx2mdsASjYLFy0M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx47xyceBdCzzcdJpU1J2MxtEtjzZIviFgZJEPyhRBjEaun6eUo
	LTUZHJdJNYzE/TRKI+ATiwiJaHlD6n5M5c94UDA1dHbM9KrlQ0DtvznMYrkb/dZ6mlQ=
X-Gm-Gg: Acq92OG5osDqPWwRo/+BxgxKyzRtqGYqCWhu418ukNH+IYQELClje4htQpdrNRSY0/d
	NhaONt4bi1rCuhcyHcWhBxOIcUeveBPLZnlr43GsIwKsaYvxYa5mE4OtMRB7vhg6vumUDTDNV/J
	hwuLXPYN2hHvTstO2oWPhJigKVIz+sCTHEtfFwOcERSEUCey3RFjk95utYjizzmBU+713OAQZC5
	7BgTcYy6jpHBhBzPo8ovcbyk5BoVq8CKzqIZyFzgBB1tlvMiijC1vf2gY+PuLui9JGF14123MPE
	db4Lb5XTMY7yK4PenLKlXejCCf/f7VIMOssl/eltae43y6mUqk1hMVjI5HLohjc7h4IHjwLi9ox
	/0fPL5iS95ZaPnWrjPKZt+OEg2KQtlun39Lvs+K3IBbiEfPYuhOGJcBbbSkkTet3bI2nOaIGqZA
	kMLGpkL3XoqJWTS+6ptcG/C2ynsNsPnBJNBophDpmeio9AFPJW58UScDBeq1LARRttDiixJA8=
X-Received: by 2002:a05:6122:1699:b0:56b:8ba0:fd58 with SMTP id 71dfb90a1353d-5a96d9925acmr1513380e0c.6.1780576488520;
        Thu, 04 Jun 2026 05:34:48 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5a6dd501a90sm5103334e0c.17.2026.06.04.05.34.47
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 05:34:47 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-9638f7e9896so1184779241.1
        for <linux-clk@vger.kernel.org>; Thu, 04 Jun 2026 05:34:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+p1Rog0Se2Kvqubn/0fwC/Chx4KXi+Sl42MSf/pmJCZpwGfLaB1Q6sniCDQ53ZZuHgEfOS8tTHQoM=@vger.kernel.org
X-Received: by 2002:a67:fdcf:0:b0:6c5:94a0:37cf with SMTP id
 ada2fe7eead31-6f544240339mr1047511137.8.1780576487197; Thu, 04 Jun 2026
 05:34:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525110603.4018170-1-john.madieu.xa@bp.renesas.com> <20260525110603.4018170-6-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260525110603.4018170-6-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 14:34:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVSgVe4ufTEvrD0ATwApF1xwiVa8t=P9O3rxh=sBegV_A@mail.gmail.com>
X-Gm-Features: AVVi8CcBcbjPZ-LGjktNLR06D20t6UAro7xtsfCHuzIIFQf2Ba_2cx9aOlEskTc
Message-ID: <CAMuHMdVSgVe4ufTEvrD0ATwApF1xwiVa8t=P9O3rxh=sBegV_A@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] arm64: dts: renesas: rzg3e-smarc-som: Add Versa3
 clock generator
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	bmasney@redhat.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Mon, 25 May 2026 at 13:07, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Add the Renesas 5P35023 (Versa3) programmable clock generator on the
> I2C2 bus along with its 24MHz input clock (x2 oscillator) to feed the
> audio subsystem.
>
> The Versa3 provides the following audio-related clock outputs:
> - Output 0: 24MHz (reference)
> - Output 1: 12.288MHz (audio, 48kHz family)
> - Output 2: 11.2896MHz (audio, 44.1kHz family)
> - Output 3: 12.288MHz (audio)
>
> These clocks are required for the audio codec found on the RZ/G3E SMARC
> EVK.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi

> @@ -130,6 +136,20 @@ raa215300: pmic@12 {
>
>                 interrupts-extended = <&pinctrl RZG3E_GPIO(S, 1) IRQ_TYPE_EDGE_FALLING>;
>         };
> +
> +       versa3: clock-generator@68 {
> +               compatible = "renesas,5p35023";
> +               reg = <0x68>;
> +               #clock-cells = <1>;
> +               clocks = <&x2>;
> +
> +               assigned-clocks = <&versa3 0>, <&versa3 1>,
> +                                 <&versa3 2>, <&versa3 3>,
> +                                 <&versa3 4>, <&versa3 5>;
> +               assigned-clock-rates = <24000000>, <12288000>,
> +                                      <11289600>, <12288000>,
> +                                      <25000000>, <25000000>;

Please add output 4 (DIFF1) in the patch description; it is needed
for Ethernet.

Please drop output 5 (DIFF2), as it is not connected.

> +       };
>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
