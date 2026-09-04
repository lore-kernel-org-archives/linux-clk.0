Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD7B36F434
	for <linux-clk@vger.kernel.org>; Fri,  4 Sep 2026 15:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534748; cv=none; b=ufLLVaAT0K0H1aDtUfV8kNtJWQj9A6NqPomZKyhWcrGrPWzTeTTG96Bw0XA0zsaIMdVZ/6a8PFpgUHHQr6VINyuYQEiVp72/S5ambz2K/isYLV6hqnrW8sEg/bJf4IZJX/pnQ0tRVXf+qXtis7xZpOBKfOf0LSV7khFAjq17TsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534748; c=relaxed/simple;
	bh=d1r8YLCgRIdy4KEcRiU5xhMZDzm5Ir3G6LE/EtLImp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YI/aNz5nIH9ROnOcErWhPfaK5hSwj9jF0UhwkF0RPlJcnt0QrMsed9h2kMSiIU27a0bOW76kJT6g1GA545OYTVQL5IFyGfSkmYsArCcXBjawSireVk81aMn3UPc7r65XGBr7LmUICj+4I+99k587SqHvmmCEwy68dDwah6WFILI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-66fb8a78ad2so1001875d50.2
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 08:12:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788534746; x=1789139546;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DBpBma5dCQR0Szv2MO2Socgh1RkSDenfZa0jgmlXBh4=;
        b=JbL+Fkx4FTnJsB52c1bFz2U7NXWgD45c8RezJQ1rMe2/C/3slLUOohSI1dKytFGP7U
         8RcttZPmxhimvDwWGfo+rSc0164mu1GQ47jz5o8W8tDbxP7baBbNFjis5TzXiRJSXVml
         Vm94b3tBVyjtf9OsQL+touTTXZNoasvYSc9ubdXs30ROOqtdh7p06HO3Q/j+YB1bBOsa
         Z032wwyHZGnLaTGNkRHgN5pORWs2U83vtpPlg/85Ghk8vlvym/EZ0SCDsv86wIWCNRFI
         AUwrkEoWB8UE5gHWI0OMnQATL5NYZcEpk0XRkjfej/rGu61oU9v9fxbCiKNHvl43Vfio
         Uesg==
X-Forwarded-Encrypted: i=1; AKwUvBxtDA4RqhzlKgkPGd1lRG0kT9blj1ClPiQVXIL5BsEpc3sMDbtNDFtqkMdPvc8sXR4cFR8vdVL78UY=@vger.kernel.org
X-Gm-Message-State: AFuF++lnYSr0Q2TKOckECedSMqVIeBjX7z3tRfNw38LAoZp38aG2WxLZ
	A2IEX0QxdaYoDqya1R4wRgz/AB30qza3sZKSq0qMYLdcruArvFITRiD5phGZwvBB
X-Gm-Gg: AYBFou3Xsh+GlkvPBBYunyVKlr+m+kl8KYVWBUCy3ExQM1K99kZrzq9/3OzLmuahiBN
	KvenoEbRk5PX4WD0kn39ypByKkmOyd73n/Gn/IARxKPf0P3nms3QmFY1VhVt+F+wDzOapjTLCt5
	Z4lV3GoBEIBfx8HuUobN/TW49MF9s6Zr1j90HW8HzcjCV6JPb1BB8dWj2eVkhr5iP5hVAuBWi9K
	miwyD2kjNljzOl3mhYtGjZ0zC/2L2VIHsfQbbdcTzPV02kGquewN14aDd0THkJgYPuGyi3Z2dqK
	tQmoNsTj1AL+ZaEZi4DY38X3lyb7r/WxhLnHQ3SURm3e8tVPJbn6Y5nCuzrzCCKmlwzD3aZE/U6
	Q27h3czrnD8uf5GuCOsbychl1GbrXfv5HPAV6D1CCgwxAUzLfdYnmkIaD1uV7EIuWXVHYzyrGF2
	LelJEv9jtIdWAjzZqLdxPSmh5D0R7kVdMpTptBWOlxXItBuzGSg8OQ+uqwL3fjLR/eWWhogqTGW
	tT+vxVPzYCxi6iWYQO2+qhRSTN+Su38CUfzGwxShd51I+Gb
X-Received: by 2002:a05:690e:4010:b0:66f:a8e8:7140 with SMTP id 956f58d0204a3-66fb58e9544mr2552691d50.5.1788534745778;
        Fri, 04 Sep 2026 08:12:25 -0700 (PDT)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com. [74.125.224.41])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb4914af4sm2434547d50.13.2026.09.04.08.12.25
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:12:25 -0700 (PDT)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-66fb8a78ad2so1001819d50.2
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 08:12:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByty1aFJRBEyOAapAW2bueiHsY6+7AmkGT63ZDRBB1fRkf1cc/xSojacaxmM6t0rHJ566jvfhSmqvE=@vger.kernel.org
X-Received: by 2002:a05:6102:f06:b0:785:eb33:8794 with SMTP id
 ada2fe7eead31-78a4a91756dmr2264959137.10.1788534332492; Fri, 04 Sep 2026
 08:05:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com> <20260821150408.73829-6-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260821150408.73829-6-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 17:05:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVch5xkg3p0+9mvEk9393ZuV2TO-kcyVci+VBAMCG4RPg@mail.gmail.com>
X-Gm-Features: AcwNN1XC5gp_Xk8OzyKjoKwIynG-nLTbzWvj7aLGFiNz0LjJGn_EivdUH3_smAk
Message-ID: <CAMuHMdVch5xkg3p0+9mvEk9393ZuV2TO-kcyVci+VBAMCG4RPg@mail.gmail.com>
Subject: Re: [PATCH 05/10] soc: renesas: rcar-rst: Add support for RZ/G2M v3.0
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Aug 2026 at 17:05, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add support for Renesas RZ/G2M v3.0 (a.k.a. R8A774A3) SoC to the R-Car
> RST driver.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
