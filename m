Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8638730C368
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 15:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783958364; cv=none; b=MnDBoYhOAxYloItWFgyUJsHLPEDP3I5IP7U4eUg3/na05aLD/YgXrHOaTwJqUDJpZzJM3PDfDQFi6DfcVi9MB/Ozj9d138TDCrr56Cegaq9y7BgvA63Yo83UpV2LlWelj6XAdGW3AjEwKGVzbNcJsRsDa/twdadJAcfvnsPFD8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783958364; c=relaxed/simple;
	bh=m2bCXYj8AWrMF/1laWCVCT5bKqmKjFJ215Tf8K6H5u0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=anFnreYBdWrg7+XLN97J/se8G+9ZIE/69fj+HPF8nFjHwaIS5B8+1ZPbloM97V3VFQ8LTpdQNZNYLSDv9jPMUfFnBBr7Z08L7mKc+UR9HAcgbHv8V0tpYy3aM9uNLt5dIdegF7vLfTIKGuRdnHdh1NmNc9KtBVpmr+gtafaeg20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-664d22d7337so55476d50.1
        for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 08:59:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783958361; x=1784563161;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qzEerLqOaw9Z3GkpXKkc+Ohu/zTEKX/5jHpFuADj7Ho=;
        b=me+FkrdVfWhF/66UqMiDuTjBlIpmeFwFQkDOjj+P/K+xEmgmDajA4NpzvXfGGJK+xF
         T2o2UBq6eXktx4KnrTl+SxwF67WcFHyXw1lfoIamEjCWRr6xuAgq5x/jW8uuFbu5VVFH
         2Ki/VLuXWYHqAw3gL2Ep2rDv3DaetWDet1lzghQRXWQW0wTjOK7k/AR+HlXZwGNM9KvM
         LYaeLgWhsSDfM+GiiNtyzRYYMpT/4QfLnNaMjsC/GhfEfyzFeVhA/6mWx9Twkk9mFFzx
         rM+c2Wbu/1/zPNcdlqbCotb09EDpDptVMAnTRRmzTbl2vhsGJEN3+0RIejK05i2dTt5L
         uN6w==
X-Forwarded-Encrypted: i=1; AHgh+RreXytySKk3bj75KVFTvI+l0cECGR+QOu/PSYONDRS5Eci4ftPQkOsUa9nQ2zlwD5/W8usBs4cdBTA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPG5u6oiwvk78RP2ZbyOKUwhKisKJvfzlQnEvN5xjIie+68FE7
	g3Aq5Foepgqd7AChN8rv2paP8FlkqXeuZ54dTBukCKuY5SKVbSAoarRyMGcLm4CRkus=
X-Gm-Gg: AfdE7clMQu9Ocv4cF7wgbpxTNWDMxJYsAsE/gzst1wCb2D43TTQwaOpXnOroJditcBp
	JPpAPDf+Xl3CQqPi4m7pSOpOsPWFi+N0NZut8O9LMNsMwjtYAyhA9OcRrhy8Tu7eR9NViP3ShI+
	wRwU/cUVTh9Xbl7MnRzReU42GyFX6jHhIV/jmZYv4lu+mHMhY+Mn8k4Fsm/LWL+7zuQfhAgNzr7
	JVnBKQKGY60Cy2VRH7XQyfvWHabRPeIlr3DPF2qcUzFm6dE+HM/TWMKeTR2UgoNGvnLxXGWmDR5
	qwzilB7iusNafTBLt1q1oQAZ0iDzE0c4iUBlJSsls9knvlX2N0+w35yx+2Tv3OSdxmZmpzE5kx+
	80mE9o7No7BL09lZaq/F/rpzyOFhGEqVh8DUz7SCk0hblCYBgqd9NLN7X0cinTHzL5vYnezDZq2
	99+EpT2A2ukzPdy0NNDo1c8UAaChgECOLIwDQxIRg06YTOpvCoow==
X-Received: by 2002:a05:690e:80a:10b0:667:8b93:4fe0 with SMTP id 956f58d0204a3-667c5ce4073mr6787512d50.50.1783958361232;
        Mon, 13 Jul 2026 08:59:21 -0700 (PDT)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com. [74.125.224.53])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6678775de35sm13952118d50.3.2026.07.13.08.59.20
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 08:59:20 -0700 (PDT)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6626b5ace23so55489d50.0
        for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 08:59:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RopBN0w6eTcdMAc2lJk7Hwb+4/0J1JobIMdfHNmjhhQjwtXFZczmHBnMu+Wo3dnCbM/T1BpwIUjLbo=@vger.kernel.org
X-Received: by 2002:a05:6102:610f:20b0:738:8b5c:a41a with SMTP id
 ada2fe7eead31-7450cb34f7dmr6282037137.18.1783958048566; Mon, 13 Jul 2026
 08:54:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260702123112.161160-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260702123112.161160-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Jul 2026 17:53:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdViSFTZZMe0SsC_aYmyZqTHCFNN0NxPVoNx5OBfwi4MLw@mail.gmail.com>
X-Gm-Features: AUfX_mxFOjb_ZRaEJnQ5ujkHKlta3EMpWEatCZQZcSke1bOSWzSUjDpkmkvLviw
Message-ID: <CAMuHMdViSFTZZMe0SsC_aYmyZqTHCFNN0NxPVoNx5OBfwi4MLw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 2/9] clk: renesas: r9a09g077: Add SYSC regmap support
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
>
> Add System Controller (SYSC) regmap support for the RZ/T2H SoC.
>
> The RZ/T2H SoC features two System Controller (SYSC) blocks that handle
> low-power management and access control. These blocks are defined as child
> nodes within the Clock Pulse Generator (CPG) address space in the device
> tree. Implement support for creating regmaps for these SYSC blocks.
>
> Register the regmap using of_syscon_register_regmap() against the CPG
> device node so that consumers can access SYSC registers via the existing
> syscon phandle.
>
> Add a sysc_init() callback to the CPG/MSSR core to allow SoC-specific
> initialization of the SYSC regmap.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Made use of for_each_child_of_node_scoped
> - Moved sysc_init() to the end of the probe function

Thanks for the update!

> --- a/drivers/clk/renesas/r9a09g077-cpg.c
> +++ b/drivers/clk/renesas/r9a09g077-cpg.c

> +static bool rzt2h_writeable_readable_sysc0(struct device *dev, unsigned int reg)
> +{
> +       switch (reg) {
> +       case 0x0000 ... 0x0008:
> +       case 0x1000 ... 0x1164:
> +       case 0x2000 ... 0x2024:
> +       case 0x2030 ... 0x2054:
> +       case 0x2060:
> +       case 0x3000 ... 0x300C:
> +       case 0x3100 ... 0x310C:
> +       case 0x4100:
> +       case 0x4200:
> +               return true;
> +
> +       default:
> +               return false;
> +       }
> +}
> +
> +static bool rzt2h_writeable_readable_sysc1(struct device *dev, unsigned int reg)
> +{
> +       switch (reg) {
> +       case 0x000C:
> +       case 0x0034 ... 0x0038:
> +       case 0x0048 ... 0x007C:
> +       case 0x0100 ... 0x017C:
> +       case 0x0200 ... 0x027C:
> +       case 0x0308 ... 0x030C:
> +       case 0x0320 ... 0x037C:
> +       case 0x0480 ... 0x0484:
> +       case 0x0580 ... 0x0584:
> +       case 0x0680 ... 0x0684:
> +       case 0x0780 ... 0x0784:
> +       case 0x0880:
> +       case 0x0980 ... 0x098C:
> +       case 0x1100 ... 0x1118:
> +       case 0x1200 ... 0x1204:
> +       case 0x1400 ... 0x1484:
> +       case 0x1500 ... 0x1584:
> +       case 0x1600 ... 0x1680:
> +       case 0x1700 ... 0x1780:
> +       case 0x1800 ... 0x1884:
> +       case 0x1900 ... 0x1984:
> +       case 0x1A00 ... 0x1A84:
> +       case 0x1B00 ... 0x1B8C:
> +       case 0x1C00 ... 0x1C8C:
> +       case 0x1D00 ... 0x1D8C:
> +       case 0x3000:
> +       case 0x3010:
> +       case 0x3020:
> +       case 0x3030:
> +       case 0x4000:
> +       case 0x5008 ... 0x500C:
> +       case 0x5020 ... 0x503C:
> +       case 0x5100 ... 0x5114:
> +       case 0x6000:
> +               return true;
> +
> +       default:
> +               return false;
> +       }
> +}

This exposes a lot of dangerous registers.  Aren't they also exported
to userspace through drivers/base/regmap/regmap-debugfs.c?

> --- a/drivers/clk/renesas/renesas-cpg-mssr.h
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.h
> @@ -178,6 +178,7 @@ struct cpg_mssr_info {
>
>         /* Callbacks */
>         int (*init)(struct device *dev);
> +       int (*sysc_init)(struct device *dev);

I would rather call it "late_init" or "post_init", as it might become
useful for other purposes, too.

>         struct clk *(*cpg_clk_register)(struct device *dev,
>                                         const struct cpg_core_clk *core,
>                                         const struct cpg_mssr_info *info,
Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
