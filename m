Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tjM/+7QH"
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F272D54
	for <linux-clk@vger.kernel.org>; Thu, 23 Nov 2023 07:02:10 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3b2e330033fso609631b6e.3
        for <linux-clk@vger.kernel.org>; Thu, 23 Nov 2023 07:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700751729; x=1701356529; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mEar30uGhaLDv42Tg2oK/HJ39S4ZlMcOxp8lB7y+TU4=;
        b=tjM/+7QHkQHxSS+7QWM/SyS2UD2UsZfYMW2+MTTG8vAPqHctw0kcurybYJLVN4rB8q
         Af2TK8hIJDtSgZPv6WQ6khWKlFTWqg5R59800A9cSGrG2nwd8RdAXKiC3pv2CEKIJyj1
         4CFDO+sCVpjM6os7WQeKUUVRX2JYQl+9k7c9REygCByUasup8JYd0MeUmOIzMobT7bBw
         kAQK+CRNdgArNAlM71DrFyF0ceKx/tBzrWA0v83NVDxIeL2ki2KLLeuRuZG8hdz8+OE8
         wrYafSgYDOw226nuVtzFnaT0Ywf7RX1p4tDLdUDey21JGzY2AeF+ufwDl7ct3yV/CLKE
         Tk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700751729; x=1701356529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mEar30uGhaLDv42Tg2oK/HJ39S4ZlMcOxp8lB7y+TU4=;
        b=a0ELu+jO1pUQUYVuREiMZahOYwka0hK/Hzmjf7IMfxNGHmJ0nfFA324R5VAZddErB8
         X+J3+n4JeEfnwycoGxkQUtz2DNAT67XvllusjFcDwTM5xa0HkLBUd0c00kJ0qxS5OG/+
         PbY+fKluTCAlEAxKMyAjSwG0k+X6TF2mFNWYeJgdtn0v/tPAEHK0PhJbXkVghzJIyUse
         pu7IBc8IqHqeoF5X4iy5vp/LszpPErfAQHfiEiXw5XTXn4tluD2/8/kwt3dWzx+ClrkW
         IIZTL7O0R703yARASC0azIzNoTR+RRl+JrlrP8gkUgOJxEBlKQ6NaQtZc0fCCCfeRV44
         6HZQ==
X-Gm-Message-State: AOJu0Yy4HQXDuSUvjATrQJgpPRlctPJwNkz/fXoRq/EEOtKGm2bHaKiG
	O5Hxevy6L4qJM1WVJDcAcAcse9VgoU5HKpdkY6hjsw==
X-Google-Smtp-Source: AGHT+IEPs85TdkXFOx395LjHkoWLEotqTEDJgWg3E9vX18ND53JbjdHMu/2FDtEoR/uEbkEfShXDjs81ygSKZRO/XFs=
X-Received: by 2002:a05:6808:d48:b0:3b8:43b6:1e34 with SMTP id
 w8-20020a0568080d4800b003b843b61e34mr5319331oik.30.1700751729501; Thu, 23 Nov
 2023 07:02:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120070024.4079344-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20231120070024.4079344-1-claudiu.beznea.uj@bp.renesas.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Nov 2023 16:01:58 +0100
Message-ID: <CACRpkdYr6+1hYnGUStTjG6BjEXXbtAAZMSkcOeuBZ3hF6Fn81w@mail.gmail.com>
Subject: Re: [PATCH 00/14] renesas: rzg3s: Add support for Ethernet
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, linux@armlinux.org.uk, 
	geert+renesas@glider.be, magnus.damm@gmail.com, mturquette@baylibre.com, 
	sboyd@kernel.org, p.zabel@pengutronix.de, arnd@arndb.de, 
	m.szyprowski@samsung.com, alexandre.torgue@foss.st.com, afd@ti.com, 
	broonie@kernel.org, alexander.stein@ew.tq-group.com, 
	eugen.hristev@collabora.com, sergei.shtylyov@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, biju.das.jz@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 20, 2023 at 8:00=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:

> Patches 5-8 are pinctrl specific.

I expect Geert to pick these once he's happy with them and merge them
into his tree for pull request to my pinctrl tree.

If you want some other merging approach then inform us!

Yours,
Linus Walleij
