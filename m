Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B1644D03E
	for <linux-clk@vger.kernel.org>; Thu,  4 Jun 2026 12:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780575942; cv=none; b=NQ9X8rx+DN4nKNwGscyVFyoDSq1WVc8iEouKXBzFbhqzSq2a/gqLHBhnG31EVZYuC+8nzH6fCY3KHC63bIEUbmzVSuJO5pZjQAeGOmichkwvuH85TXCVCLc+JKhBiqCK/euFPvIqrqm57PTVUqkofdbHJGB3uO9xIDzpyE7GJAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780575942; c=relaxed/simple;
	bh=ZVR9x8tWd6AFCeFuB4BHv4sPK8zCkEI3GNQIoDCb/Xo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C9aGwNZSvs+G1Hr106AKVKClk4nqu4CjgenGPYvC6BXENFjaI7nBNpdkYyBdRKdQSoT2V4x86UBzwRoyfu3Pr4iI+extJ4DXlJDeiTGxgtXr0S5C45CEriyivx3NyaxrSX9EgC+6sAXL3z1s7nfgWo70ek4l0oGr3ilfBVfDjMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-963a7e48493so510228241.1
        for <linux-clk@vger.kernel.org>; Thu, 04 Jun 2026 05:25:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780575940; x=1781180740;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iyWpTw37mylw5bzav8uUBiWBa2W/YfP061QKPLyDS7o=;
        b=cM2xmxzTebFzlzD/S+c6d3Nl9VHPNbMfOAdxAFOe309fDDGJdnLZCc8VsYckhqgiri
         2oR9wdyQYeSwMGR5ydmbma9a1P0SrNDw3Kl8KimwLfp2/t047fBl6DnRZeZ8FHfZiSJV
         iySHEcTgPEaWv1F9O7o8+p8AXo+r4V5qCeCTfceaQpvmF7GBd4NalBDqqdATIK1rG+GC
         r9zLHGW2udEoCKMeMS8qZk+LiNHu6vyPw5yGHWxaPj24OBYXNQuon1CXNUyjfztqU3Bs
         VTPhPVyoONiOeTpPOgCIxW5I5A1ssfbRH15APmh3E7gkRFREAC4EtAfVAYiYsLbnI7nC
         FlbA==
X-Forwarded-Encrypted: i=1; AFNElJ+gFeFn+ZVpp2tyRkSPC5emBONIbYb0S8TbQU39HJ3FM3Pgh/gwMZKRrfc9ptfT+VP/hAeWeeMwKOQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUsCMj27VTvVcUS8fNf7qe0LZqKveSWvsDi+IEe57EyZcYJxud
	2Tdem8s9fN4lHV0bebvswfJwnPisigFKKKUidi0UMua/NXUBfTk8prFaoPHsb3te05E=
X-Gm-Gg: Acq92OEWFjKaAF+cS8CJ/18ZQvEbyk5wAfDFNLEvN4wV0U3Fc8BXQPsiRsqos8FX71x
	hbBuhlpAAkpp/haHsjLGMfgZ9h9522atw4RNW8uDOXKaZM0/VsrTlIGHEmgOcSZUSEEt4LFX31X
	KoUbvjssbtD1uJCAz7kc6qTmdZJ3ZVydu984lHoxNDLDfIZWNDiTRnddCatZNasDC0Z1PtTknb2
	TYH5BDYVETEWRVj+ElTs/9zdn+F7HeET+MiSbtAYN9+ydoabz0Om8syC9Ps+qnomntqgF3oPxVm
	+htkcyLGMrwixHFJ5my29wA4wBN+J3GKO/VmrXLGdk4bahLMUFmLKrWahsyQbenT9OxrHB4xs5N
	NYTLRNj4ei745P6Zm4V455UJKU75MI46kthQWC/e0RcbV3zrGDwWkLycResDpDYiRnZbWTnTH0r
	2pWniE1jVsC1oyM4l8r/GcBIKbke7OcNXTedmV7NwDek9w8VnSv20+jg8TYjRYYJpma5gv/bLW9
	VY=
X-Received: by 2002:a05:6102:d87:b0:631:4c79:b1d2 with SMTP id ada2fe7eead31-6ec4b271de0mr4459314137.25.1780575938557;
        Thu, 04 Jun 2026 05:25:38 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6eb6668702fsm4688633137.10.2026.06.04.05.25.37
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 05:25:37 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-59bbe027424so503568e0c.3
        for <linux-clk@vger.kernel.org>; Thu, 04 Jun 2026 05:25:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+PcratGZ/rxAN60afj5rup+0cW08/2RfKOrFsCLH8y5e1hG6Et1pZjKXGvTBHRhym/7KjacYBLvqI=@vger.kernel.org
X-Received: by 2002:a05:6122:e14e:b0:5a0:3d17:f939 with SMTP id
 71dfb90a1353d-5a6e7e57815mr4955258e0c.9.1780575936747; Thu, 04 Jun 2026
 05:25:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525110603.4018170-1-john.madieu.xa@bp.renesas.com> <20260525110603.4018170-5-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260525110603.4018170-5-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 14:25:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX5ivj=WdCH=kQUwaAwqiS-pDaTgq3tyf_CF5SRT+qzQA@mail.gmail.com>
X-Gm-Features: AVVi8Cf4Ujm0MLmye5A9UxakzZtSS845oRUcwVlQZvUP1y9AtjAcdgWbu9vD6MY
Message-ID: <CAMuHMdX5ivj=WdCH=kQUwaAwqiS-pDaTgq3tyf_CF5SRT+qzQA@mail.gmail.com>
Subject: Re: [PATCH v4 4/8] arm64: dts: renesas: r9a09g047: Add RZ/G3E Sound support
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
> Add the snd_rzg3e node for the RZ/G3E SoC with all sub-components:
>
> - SSI (Serial Sound Interface) units 0-9
> - SSIU (Serial Sound Interface Unit) units 0-27
> - SRC (Sample Rate Converter) units 0-9
> - CTU (Channel Transfer Unit) units 0-7
> - DVC (Digital Volume Control) units 0-1
> - MIX (Mixer) units 0-1
>
> Sub-node names follow the new RZ/G3E sound binding: unprefixed
> 'ssi', 'ssiu', 'src', 'dvc', 'mix', 'ctu' wrapper nodes instead of
> the legacy 'rcar_sound,xxx' R-Car prefix.
>
> Wire up all 5 DMA controllers (dmac0-dmac4) for each audio sub-node
> with repeated channel names, so that the DMA core can pick the first
> available controller.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>
> Changes:
>
> v4:
>  - Rename the indexed clock-names and reset-names from the dotted
>    form (ssi.N, src.N, adg.ssi.N, clk_a, clk_b, clk_c, clk_i) to the
>    hyphenated form (ssi-N, src-N, adg-ssi-N, audio-clka, audio-clkb,
>    audio-clkc, audio-clki), matching the new RZ/G3E sound binding.
>  - Rename the sub-nodes from the legacy rcar_sound,{ctu,dvc,mix,src,
>    ssi,ssiu} prefix to the unprefixed ctu/dvc/mix/src/ssi/ssiu names
>    used by the new RZ/G3E sound binding.
>  - Reorder the clocks and resets phandle lists into ascending index
>    order and annotate each entry with a per-line comment naming the
>    clock / reset.
>  - Drop the #sound-dai-cells and #clock-cells explanatory comment
>    blocks from the node.
>  - Align the continuation lines of the dmas property.
>  - Fix the commit message: the node label is snd_rzg3e (v3 referred
>    to it as rzg3e_sound), and add a paragraph noting the unprefixed
>    sub-node names.

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -912,6 +912,482 @@ rsci9: serial@12803000 {
>                         status = "disabled";
>                 };
>
> +               snd_rzg3e: sound@13c00000 {
> +                       compatible = "renesas,r9a09g047-sound";
> +                       reg = <0 0x13c00000 0 0x10000>, /* SCU */

size 0x20000. to include the SCU DMAC?

> +                             <0 0x13c20000 0 0x10000>, /* ADG */
> +                             <0 0x13c30000 0 0x1000>,  /* SSIU */
> +                             <0 0x13c31000 0 0x1F000>, /* SSI */

0x1f000 (lower case)

> +                             <0 0x13c50000 0 0x10000>; /* Audio DMAC peri peri */
> +                       reg-names = "scu", "adg", "ssiu", "ssi", "audmapp";
> +                       clocks = <&cpg CPG_MOD 245>,    /* ssi-all */
> +                                <&cpg CPG_MOD 385>,    /* ssi-0 */

Please use hexadecimal module clock numbers, for easier matching with
the documentation.

[...]

> +                       power-domains = <&cpg>;
> +                       resets = <&cpg 225>,    /* ssi-all */
> +                                <&cpg 226>, <&cpg 227>, <&cpg 228>,

Please use hexadecimal module reset numbers.

> +                                <&cpg 229>, <&cpg 230>, <&cpg 231>,
> +                                <&cpg 232>, <&cpg 233>, <&cpg 234>,
> +                                <&cpg 235>,
> +                                <&cpg 236>,    /* scu */
> +                                <&cpg 238>,    /* adg */
> +                                <&cpg 237>;    /* audmapp */

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
