Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE4937CD24
	for <linux-clk@vger.kernel.org>; Wed,  8 Apr 2026 08:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775635894; cv=none; b=n+Y7KahxLqFbWtoqu+KHNa64zyHSHPHUk3LZDjyIgPdpOSiHHR5FCv/umnMOaXcMOaCH4ptsoHnoqz4fu9iK/nI6t5qpZl1XfhjgVRcQF9HBP5mvgA55D++8MT+NJeBL2d12FFnhRT4agDX1YHYs/xQrxMTLVfVB9a1yzIoSxVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775635894; c=relaxed/simple;
	bh=OO8/V/ieRVIAY7OerP7B4Q+EVWmrnJ0uFfqR67sUp4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jqJ2WI7KGjTFq1KvY+pGIWetZB8Oqo/EynEt2LJTXzTT7yp9X6sN6c4UPk2sPbW98pzUbODpN1qUIGZJ76F6fj/dhODeBeO98hsfNOZ6RiO/VdfUP/G2iUsDnQ90jAUwLIjO3hC5GkVs+hk9sWMNaFc6DqWZc4DvbXZLXnsOvAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8cfc5941028so980332485a.1
        for <linux-clk@vger.kernel.org>; Wed, 08 Apr 2026 01:11:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775635893; x=1776240693;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9UVrHD1kGj3aaIesoTisHRRJzYnLIrQ82+sB6XN35Xo=;
        b=Y5FJM/zgeE6N7kDD9YD8czQMpjGL9N8yi7v6LKb1hbFScOT/ru5ufZ20+knwYtJI+E
         NsZFLxDnFvp0t6kXPijS026TNgJdiKgr60xacyZ7Eac4l0vg+NeLrLHQuzcH8LQCqV3J
         OCGbLZTt06hz1TF37/Y+9NaIcqVWCakDiJ6Ty+FKYCPH4D5rKVLupLXjY4wzeL2kjYJ7
         THqPZ2n+8tib879y5GBCQkx9NXna6Zh2/r0YxfJ/P5o+NRb4g4BUl26Rio54WfJUxHG1
         3q/jE8SS6qrhau0RVSyU88YP2PtNJI8ly+ka+4A53SrYxxBPHT6OkOAJ6AwSn+9jisoM
         IARQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBPAuZP9R/4YuaQWllmrnio+J2VU6o3FxNXywzA3ctTUakw5RoyJWqNuuFupSZxONJmzXhwH4u/aY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYDDS3PdSPRYYYrJDv0qmB44nAKyWBen0Nbr1CdzyQOLsFpZb8
	pLWgBlEdRes44X1+VhgkY+kkG0uCDc2qCnUd26rDiaGWeMQuLrc/90iSd0QcCyAp
X-Gm-Gg: AeBDieuIBT5GzBTMy7qdqEq+X4f4ZstIHNL4aUK1bE2rv4KkvIBZKJlMqDrjWhhsHwB
	3S3lUjwyq4EwOz4r+Y1wm6zg8UkfWxqLgLxCprPxp0rtygabqw0dzstXub1QTsk4OHbh+zN0lXo
	gGQbKumvnGqCIgfQ1nfdLsy0fjYHYgQTw0vRAyHdFo1Dl0yxl7L1N/fiTRFcGACW6SEUJw3pK3Y
	ytE0xhYZPXTOu3BcKerXu1ckUVMdeo6bf9mubE3nuC3eP2Dn+6zTt7pX7+j8Lplc4U4FCtYrqa+
	c+ZgcJe7uyWkOkvL+3IYO3y2W+tMhzzI24X/2vhi5hlhFk9pgGi6BoM7jbFQW42gxm++HghKQa/
	aOCxr4vYioBzH8Blc6lLCy73vFuUL5s/vl1IC77SBjov+a9mFoLYL5gki23+3UlejqJFyvmCYgS
	ktVh/RDKn1ajdtlIHO0iNf8QjKzsa2aY2VxSFo9mOOMLTuXSQssDjlVxVXMREDXnlH
X-Received: by 2002:a05:620a:40d6:b0:8da:d152:b7c9 with SMTP id af79cd13be357-8dad1620daemr432430585a.30.1775635892629;
        Wed, 08 Apr 2026 01:11:32 -0700 (PDT)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com. [209.85.222.170])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d43e17d30esm1241989485a.6.2026.04.08.01.11.32
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 01:11:32 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8d583bfc415so597667185a.2
        for <linux-clk@vger.kernel.org>; Wed, 08 Apr 2026 01:11:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWvctQPNBzkTfv0yTIU0WUtgXYWDHkLt/WRzHHr3AjBQ7T2TSw73mzCBgFqhs+JgXEPgGx68Ogo8nw=@vger.kernel.org
X-Received: by 2002:a05:6102:5486:b0:602:ac40:969d with SMTP id
 ada2fe7eead31-605a5125dbemr8047885137.30.1775635529642; Wed, 08 Apr 2026
 01:05:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com> <20260327-schneider-v7-0-rc1-crypto-v1-12-5e6ff7853994@bootlin.com>
In-Reply-To: <20260327-schneider-v7-0-rc1-crypto-v1-12-5e6ff7853994@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 10:05:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWr5OT0iAbZMgDAizO9KnhmyUN3hsqFnp+JYRao4aKu_A@mail.gmail.com>
X-Gm-Features: AQROBzB7FKSpqL9vAEkvQ3NeO0nTGrKiA5rUbk_QvEvIe1vD5_FZ5lwMa_3wMnk
Message-ID: <CAMuHMdWr5OT0iAbZMgDAizO9KnhmyUN3hsqFnp+JYRao4aKu_A@mail.gmail.com>
Subject: Re: [PATCH 12/16] irqchip/eip201-aic: Add support for Safexcel
 EIP-201 AIC
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Jayesh Choudhary <j-choudhary@ti.com>, 
	"David S. Miller" <davem@davemloft.net>, Christian Marangi <ansuelsmth@gmail.com>, 
	Antoine Tenart <atenart@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Pascal EBERHARD <pascal.eberhard@se.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Miquel,

On Fri, 27 Mar 2026 at 21:11, Miquel Raynal (Schneider Electric)
<miquel.raynal@bootlin.com> wrote:
> Describe the EIP-201 Advanced Interrupt Controller from Inside Secure,
> typically found in a bigger block named EIP-150. This controller is
> rather simple and is driven using the generic irqchip model. Its
> own interrupt domain is limited to just a few interrupts connected to
> other inner blocks, such as a Random Number Generator and a Public Key
> Accelerator.
>
> The one I used receives only rising edge interrupts and uses its own
> logic to track them. It is theoretically possible to wire devices with
> level interrupts, but not in the context of the EIP-150.
>
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>

Thanks for your patch!

> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -826,4 +826,12 @@ config SUNPLUS_SP7021_INTC
>           chained controller, routing all interrupt source in P-Chip to
>           the primary controller on C-Chip.
>
> +config SAFEXCEL_EIP201_AIC
> +        tristate "Safexcel EIP201 AIC"

Is there any platform dependency that could be added here?

> +       select IRQ_DOMAIN
> +       help
> +         Support for the Advanced Interrupt Controller (AIC) typically
> +         inside Safexcel EIP150 IPs, gathering Public Key Accelerator
> +         and True Random Number Generator interrupts.
> +
>  endmenu

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
