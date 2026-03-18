Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4BD3FFAD4
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 16:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773851104; cv=none; b=hqFjDldiZcZ50bUK7DpEexCI2aKsQddFc2lm6G0tY/1Q8l5E8wW0shDP4FIOR/FDzcuNY1KuV6Sm1Wvw+v2aE6f1sc06MQ2+OYNfFriwiFW7+6Mqk492+FY86W0L685rGnrOc4xN9NX/m5Xkg7UbqdsA8A8y1C6MOPhbnEweEM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773851104; c=relaxed/simple;
	bh=J9AoQJqhss2LsfIv36b73QdQdOLW9HvVXjRl/JvP07g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kg3zSB5L8LRkHaQzwkj5nKvLTsSUo1l4wgA5H+HRm71lm8vp3isl24Ht1ZDl21NhocEzNwJ5LlP701ruGQpxetZe/MGcZpEHekK2Iv3hCuFLnGdw7LtjrlxAPLeucOnIDNzTx2tROsw9/Wici9saCHHcrXo8Y77E5yHj+rTEQ1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56b8804f37cso1342877e0c.3
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 09:25:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773851100; x=1774455900;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oyAgld3HIOm1wYub494sLGOg4YlSEABoZlx1Bb+ypLQ=;
        b=b67iPU4NNB/zP5A1Bzs5vyc5KfXTis8YNo7HDpIw3N/gEE4rPP+xHwEOUOVsYooPQ4
         r2e/rr9J4oosG1R+u0HB+4mj8hse9tYAxOUVm89cigQNW0QaCWQk1WFbzuhSXatmijVW
         XCVIh+jDzyHdmxb20JnD7nKrxEo++Cc18fHBfmHsnxv+bPMVbD1bm8M/xeI0O3Q9oc3t
         u0ZRxY1RWhSEf7FcJ3ELD+POv1/q3QyyO8NVBNox6KIibTn9XiA1SvKmuIpn0+MBHHWN
         FiK5ZVCymLhp3irIzZ349yANPluTrb9Nb8iZzR4pH8q3GSQXw9NVrIMxFWVBobEIPKub
         cOXw==
X-Forwarded-Encrypted: i=1; AJvYcCXW3s9VvfgStvfVvqRp20pIcIQ9b/WXGppAAxJVme9yOSjSZeMqchfJkqPHlGA7Ga6r00pU/7GyxUY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZeEqtH1FALgjorf2w2Sb6pFBv7ElxjPWbhiuAITIhoOs6n5Gn
	0CBlAu1FIBZzGZARfjaBv+/TkXzU3Qq5WDGQWeAzE1IWxhUy6rBveTljqS++6mWe1t8=
X-Gm-Gg: ATEYQzx7JAkHPRNpnHhQv+BMWQ1wS946lkM/YhTh+THALOHNKRz/1HQnDF2z0zJxIEp
	g+5WLVVV2tUEWMLRlVRpEsggoBt+JQo2tehiALK3HYH258BHWPDXyBiKFaH33IuHFQTgX1UwD0Y
	z/tcRI+8VnpJbDpcj+ktvCevFad5IOH+l5g8m/Apxe3MOYb+IeeDjVF3NCGGekUrHeUIsxKHCU3
	BI1x+ipbXU6IwgCv4YPakMN5fpYpCQAtE3aWaqn/J4lPFc0kivRqxAuppT4bpXqhyD4mN9tjiW9
	6G7L+bvN2w6JG7U51IbweyMDQFz85wvzvRRXCm5t24T3jrGtl1Sx1hjUIqmNaR0xa3DlY43+PcO
	/CYnLLb90AFbtNwQWb6LHToFjuxv/2iCsCR9GNUpJqtLUimfes6bbcPXF3EmeAN2B72K9BLNqCU
	7/lPcPGeTVT+27Ac8kL3duPuA42sWiFc5e+kb3IKSUK13bNdaOSYM9TH7TBx2RDvsBGU+vM8xuQ
	ZM=
X-Received: by 2002:a05:6122:7c6:b0:56b:9784:8a2a with SMTP id 71dfb90a1353d-56ba7138b0dmr2182810e0c.10.1773851099937;
        Wed, 18 Mar 2026 09:24:59 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56ba6e2f265sm1848927e0c.2.2026.03.18.09.24.58
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 09:24:59 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-56b8804f37cso1342861e0c.3
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 09:24:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXOy+ckJgZn5RkKW+uqBulpUDMqLRP40u3n4YZsD7Qp0e4KboQVL/WjNdsYIBVCFjwoaKZ0OoWuLHI=@vger.kernel.org
X-Received: by 2002:a05:6102:374a:b0:5f5:4055:4558 with SMTP id
 ada2fe7eead31-6027d0b9ec5mr1976763137.2.1773851098056; Wed, 18 Mar 2026
 09:24:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1771344527.git.tommaso.merciai.xr@bp.renesas.com> <f6b43f0dc64e13b1c9942c164dea30002d4c4466.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <f6b43f0dc64e13b1c9942c164dea30002d4c4466.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Mar 2026 17:24:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW+d8_SCBtRH3St2SBWKND1Q=vtcK48C6i9PyQZbjs9Zg@mail.gmail.com>
X-Gm-Features: AaiRm50_PfHsI_l0RjZzNnYxExZrNf0xwI7nlPt_QmbbgWorEasSrObC0tCBcTk
Message-ID: <CAMuHMdW+d8_SCBtRH3St2SBWKND1Q=vtcK48C6i9PyQZbjs9Zg@mail.gmail.com>
Subject: Re: [PATCH 3/5] spi: dt-bindings: renesas,rzv2h-rspi: Document RZ/G3E
 SoC support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Feb 2026 at 17:25, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Document the RSPI controller on the Renesas RZ/G3E SoC. The block is
> compatible with the RSPI implementation found on the RZ/V2H(P) family.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  - This patch depend up on [0]
>  - [0] https://lore.kernel.org/all/20260128215132.1353381-2-cosmin-gabriel.tanislav.xa@renesas.com/

The dependency is now in spi/for-next.
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
