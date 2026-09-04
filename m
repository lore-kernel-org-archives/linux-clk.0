Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587814EA365
	for <linux-clk@vger.kernel.org>; Fri,  4 Sep 2026 15:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788535780; cv=none; b=K1il199wZ5pMvjOoUMLTPshwObvw2RXofY3hp5pkZrwlGzdJBsbZwlsiR93g2+vcp9kz3yxANYy8y8rTkVGaOIaui8PjMwRdqdgw4cDlgs5VgBLHxbwowlyY1tVSmp1N6W8G/DSLvRUrQqkHvdliNHyx7h7FJpbJDqv23CObg2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788535780; c=relaxed/simple;
	bh=xuRqAUdvHsG4BxcDdfuXSf+SI6WrEN2MF8ZgZw7jyWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RX1KGNdbYrOtE78mpwVKxOiPBNLlm449Lx6Q1OpltEkx6IzuIlN19zkaJwDzwfgXQLyePrIzboWAmU1AO1oHaS1m6QJsRCWPLwbAZkBCISwVy9vk2CQ/1OyQUc6fwTI+IXl1CHXNkNbFz7hP56++GBlQyMTh68x6+6GhpkldszE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5c675e64ffcso2193432e0c.0
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 08:29:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788535778; x=1789140578;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qKx60bz5SuKi9YOnfZ7Xh4JH5NN7Tn78TsaIHZikv3k=;
        b=AiD3RgQQbv6HET0TEZYb6YedBAScg1hUz2fqAXv4nNxwOGWyvXJDsBRG5AI0HuU6ZT
         H2okISvJ/qLsQgwU1Tm/QtUtK/kArBjb4RModEQPFaOXm4vhWlDr4IspOysE8aOOLm/A
         i+UJolOFWs6/qGWPKww8Zxbxqg+qYind5smZmh1kk1c4r0wU5oWChxKCMGMJZPYPIfMg
         oOQS8YkdmP2JfMMEH/ACVctMGIiMle7hBggWfEloYzKU3JZYHuQofbdEhsA9RGZxhchq
         nFHKwxyE0+j8zP+1UdT9EV5ROBiwhGs6avYmLyquNTsMFLPL6DmX3VWck7XEtolO/vtt
         qk8A==
X-Forwarded-Encrypted: i=1; AKwUvBx5o2OgtMo76S9uPFp0D4wcNqmeCCjzYBy4fJI7UC5EmZ8xfosfI+FlAzn39A3BrUk9JUun53BQ8Q0=@vger.kernel.org
X-Gm-Message-State: AFuF++nm6aVhQiSaF3ED9Ow6v38b+pnVW+2fdLjqSyTLWU27/ucttb5N
	9UT5JzzN+fzLTYPecGrjLz7RQlpzwAKntn/MXyBp/xjg56Y1wxa9RKG4kRXjzsOI
X-Gm-Gg: AYBFou2sLmbE/bHU/uJvrzRmT99kQlWzNyX2RZ/r3WVli8RCcN/qShRLMyrWHNoCD1n
	tOhfrBatNL1TM7YdiiSQBOensvn+CSK23cmGuY0y8IT1JgLIho1/z3GUp5gEHh0kBORN+LCyM3b
	IhN6zmzvCc8oQaLjSfoEnp1Qm/03+K3w9rqgNmMPMMn3R0Fec+LWy034WWSDc9nVyi2jCWd62yp
	S+tq5O5t3qA2g/xn+iCKK0Qo4S+cy9ttIsf063opfz3AOlw5K47R1wWpoRP6GGcGtptni1g6vPx
	mDkL0hmuTAzRbY1rNCnkqs0g2nMFtQcsy7fBIm8kkknmajV2iYK41FHqE7xAj0HuJccvQrSmHUm
	L1bD9EGrLpSt56ZZuo+JXjtjphRvd4hZhioRRu3iIdpi7FVr2z1hbpuEIZGuQjJSAMUoLq5Aqe/
	OdU+6vwugwXVvw7/jycc7kfaJ4MzYD1lURpPVFI+Hb+VKhCOykjc00moe7s19BOVHg2x69Iogpz
	4B8ME7vLpCzCo34C/Qfcutq2w==
X-Received: by 2002:a05:6102:a4f:b0:789:ec0f:3a03 with SMTP id ada2fe7eead31-78a4a6b9de5mr1340054137.4.1788535778131;
        Fri, 04 Sep 2026 08:29:38 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a478bb21esm2056043137.1.2026.09.04.08.29.35
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:29:36 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-97cb310ae18so799949241.0
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 08:29:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwRbNUfcDeukbZxO74FgPY0SN//IWaYoFiIJHWQmAsSWXxsuJA0dEe+g5nRtAgOvvYBSslI45sUe2E=@vger.kernel.org
X-Received: by 2002:a67:f906:0:b0:744:d517:b0b0 with SMTP id
 ada2fe7eead31-78a2ef8049fmr2629622137.10.1788535775319; Fri, 04 Sep 2026
 08:29:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com> <20260821150408.73829-9-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260821150408.73829-9-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 17:29:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWn3BaY3EHeThFo34Z=69OaZb0FQ7Z7Ui9MczDGS4nBGg@mail.gmail.com>
X-Gm-Features: AcwNN1ViLT-nOz1SKiDYeBMSJtbLrC_K6YnJyCHi1MudTORPs1tGe-hfANcJPSI
Message-ID: <CAMuHMdWn3BaY3EHeThFo34Z=69OaZb0FQ7Z7Ui9MczDGS4nBGg@mail.gmail.com>
Subject: Re: [PATCH 08/10] arm64: dts: renesas: Add initial SoC DTSI for
 RZ/G2M v3.0
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

On Fri, 21 Aug 2026 at 17:06, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add initial Device Tree Source Include (DTSI) file for the Renesas
> RZ/G2M v3.0 (a.k.a. R8A774A3) SoC with basic support.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a774a3.dtsi
> @@ -0,0 +1,302 @@
> +// SPDX-License-Identifier: GPL-2.0

Any change we can get "GPL-2.0-only OR BSD-2-Clause"?

> +       soc {
> +               compatible = "simple-bus";
> +               bootph-all;
> +
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               ranges;
> +
> +               cpg: clock-controller@e6150000 {
> +                       compatible = "renesas,r8a774a3-cpg-mssr";
> +                       reg = <0 0xe6150000 0 0x0bb0>;

No need for odd sizes: 0x1000.

> +                       clocks = <&extal_clk>, <&extalr_clk>;
> +                       clock-names = "extal", "extalr";
> +                       #clock-cells = <2>;
> +                       #power-domain-cells = <0>;
> +                       #reset-cells = <1>;
> +                       bootph-all;
> +               };
> +
> +               rst: reset-controller@e6160000 {
> +                       compatible = "renesas,r8a774a3-rst";
> +                       reg = <0 0xe6160000 0 0x018c>;

0x200

> +                       bootph-all;
> +               };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
