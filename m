Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB202E1C7C
	for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 15:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768404643; cv=none; b=uth3klR9j7e78l+Y1i6kKeTMBWFsLlNJmFphfV3QgpFatmGcC3a2WS3q9pTtPuH0I0mwjZ+yRX99K4JXNn3fpKEyUjfzwDIomaZ/cuuuMMDVJNc9gCAV9gwVd4gVIGW3QdNtB/U6espfB1D7xKuqoONi5gNUuL66T3yQaAM1sdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768404643; c=relaxed/simple;
	bh=FbjFSImaY2k0aKJ3OzRfQKg0m0OC/lVVuYVOsRiP1wQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I4i4VVzAUZV6+aX9GoPXrzVvnPUGesSNwp9TPcAvnr/mTUMB+l54FDDHp99q+imWKYhnXU4O6M5pyp3/vwfEHwlUlF8i+nW3CNPnvxkZku3mZPWv/lF0NYpNTZNs7T3NS0OHasiu8G+mMMz6iZKPEQgmZcBZlTa7GPlTw3HHxzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8c530866cf0so80015785a.1
        for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 07:30:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768404641; x=1769009441;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9PHoycvBsjA0Sy0VbLTIHVLWHYGM3MD8TXsWVqyh2U=;
        b=vbGxdEthYfugVWGpsVbAk5Vj87krhV73vzWt3+D6qjYzBfX+oNZZTnCbtbWpoiXipF
         enf3TkM6/JjnsPKfw3NjuQJP8g4ml2CUR64TZMIe5Ny7H/R2nE8HwJyhZDuJFAu4XUOu
         hHVilXMEFTvpDZBKvNH99TnrwddAsRBbcVkdW1rOmxZ5rsFOZRMJzkxwvZccJ+qGLozT
         7F9IJFAsLAEvlFmVjikFZCov8lvVT3t4q41iZ9ef9+Gw8n4UQRUpNF0o6fC7n1a/6gt0
         8wu2aVv0ZlL+ld8tSkSnCDCESTEncQdblCQSPF8MI7vxeep44rpI7DcKepmAl8dROQjN
         eWPg==
X-Forwarded-Encrypted: i=1; AJvYcCWTrgNKD315L7gka8yobYWvvQLd7vDL4X64gBwKu6qetvKDGQwKqAnOYGxNzKCzW+BkhWBiy0zg4X4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrsYntcdEF3aArEMcaLX9zun+obPuH+foErCDBwVe3LxucP2Z1
	Nh0/0ucMLapx6E2Rzmi6tqzFpQ959mZ+p1TqUWI2bWOx35U9xs/v+mcRA1phtqfn
X-Gm-Gg: AY/fxX5aYOWw7566MJvOHA3GD8up8J4HYjnrytMcFa1kH+3KencTiZHlIVH1wYXR5Nn
	fRe/1OHBYFXojaBtW+lo6EL/C9nAT6DGHkI9Yy1vW2qLvQKHMGwlRuyOt0CDJoTF0O9nTUUG3RC
	sBNqghF5UTTvHRs0yMmL6OuvSSlWHA2FgkkNg1F1Tp+mQABPw63I5LKhGr+Sf1fdOLE9oKF6msZ
	UxxejvqzvHRvjMJzIgJ/c/2aOq/XGm1G7nTyUNUIMD+6sBLfSW8BoKelVvhG2ieQc93zPKY9tRg
	/ehHUFhyTmqUPOPo2JJx8YtcWBqZRWODJ3Vl3G6Tvt82wc1k/qTaX7cYsWPh47u6wLFdtTIQ/Mr
	QyQpjJzyW9Ny8IzZfJzivHgoaQFKCEG03X2XGW2bqb1SbkWt2pJ5fDxnmLWpooNDbt87gUhVVP5
	HLad6vuZ0463ACVjnBidR/AieSZlOo5ksyqm50vpGdx/Jdshr5BgHb
X-Received: by 2002:a05:620a:414c:b0:8c5:2dbc:623c with SMTP id af79cd13be357-8c52fb90abcmr454201985a.42.1768404641147;
        Wed, 14 Jan 2026 07:30:41 -0800 (PST)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com. [209.85.160.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c530b72ca5sm179939785a.27.2026.01.14.07.30.40
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 07:30:40 -0800 (PST)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-501502318b1so2708971cf.3
        for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 07:30:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXaLcjRdCOk9gn/eGpKKpJlWZ4ZKtK54g81GLp+Iog04WuCsL4zBIssM1nohDqvRVU58GWzWV2Pe3s=@vger.kernel.org
X-Received: by 2002:a05:6102:c05:b0:5f1:5c43:936a with SMTP id
 ada2fe7eead31-5f17f5b855bmr1345435137.25.1768404199242; Wed, 14 Jan 2026
 07:23:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com> <9188e9aca69fb0076941bd1cd62693b381cf6f00.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <9188e9aca69fb0076941bd1cd62693b381cf6f00.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 16:23:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW+ZvuJg0ivCM2CHJkRBdx8sgiku1jGgrD_mcO4yV9vHg@mail.gmail.com>
X-Gm-Features: AZwV_QheoOAURJQgELAszsWwxDhSryviUTqnKNYp1N8Uc4IoJlBrWL72cLThIqU
Message-ID: <CAMuHMdW+ZvuJg0ivCM2CHJkRBdx8sgiku1jGgrD_mcO4yV9vHg@mail.gmail.com>
Subject: Re: [PATCH 21/22] arm64: dts: renesas: r9a09g047: Add DU{0,1} and DSI nodes
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Wed, 26 Nov 2025 at 15:11, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add DU0, DU1, DSI nodes to RZ/RZG3E SoC DTSI.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi

> +
> +               du0: du0@16460000 {

display@

> +                       compatible = "renesas,r9a09g047-du0";

I doubt this compatible value will survive review...

> +                       reg = <0 0x16460000 0 0x10000>;
> +                       interrupts = <GIC_SPI 882 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 0xed>,
> +                                <&cpg CPG_MOD 0xee>,
> +                                <&cpg CPG_MOD 0xef>;
> +                       clock-names = "aclk", "pclk", "vclk";
> +                       power-domains = <&cpg>;
> +                       resets = <&cpg 0xdc>;
> +                       renesas,vsps = <&vspd0 0>;
> +                       status = "disabled";
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               port@0 {
> +                                       reg = <0>;
> +                                       du0_out_dsi0: endpoint {
> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg = <1>;
> +                                       du0_out_lvds0: endpoint {
> +                                       };
> +                               };
> +
> +                               port@2 {
> +                                       reg = <2>;
> +                                       du0_out_lvds1: endpoint {
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               du1: du1@16490000 {

display@

> +                       compatible = "renesas,r9a09g047-du1";

I doubt this compatible value will survive review...

> +                       reg = <0 0x16490000 0 0x10000>;
> +                       interrupts = <GIC_SPI 922 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 0x1a8>,
> +                                <&cpg CPG_MOD 0x1a9>,
> +                                <&cpg CPG_MOD 0x1aa>;
> +                       clock-names = "aclk", "pclk", "vclk";
> +                       power-domains = <&cpg>;
> +                       resets = <&cpg 0x11e>;
> +                       renesas,vsps = <&vspd1 0>;
> +                       status = "disabled";
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               port@0 {
> +                                       reg = <0>;
> +                                       du1_out_dsi0: endpoint {
> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg = <1>;
> +                                       du1_out_lvds0: endpoint {
> +                                       };
> +                               };
> +
> +                               port@2 {
> +                                       reg = <2>;

I expect this will become "port@3" and "reg = <3>" with a unified compatible
value?

> +                                       du1_out_rgb0: endpoint {
> +                                       };
> +                               };
> +
> +                       };
> +               };
> +
>                 fcpvd0: fcp@16470000 {
>                         compatible = "renesas,r9a09g047-fcpvd",
>                                      "renesas,fcpv";

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
