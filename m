Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794935;
	b=zqhSxCnjjZyAOW+5D47/wsktTRSFypTxFru5yR/Q5X3c5aitvOmo6A+zsTTjgU1oHmgf
	 RxryIpghQjdENzok4IsD/8MmcBUKJhFusZ3wbXtpE163sfAUeF8aqM71ECYC9AP8CGnai
	 tGDnj69NBwuPNr3/ZYUnyUm16bs5QoJ3NnUtsurYhFJsQH6oMVww8WKTxe6bvzTzu71vj
	 OIi9bIqhRN2iXphI3pyYwielTOZXrjotMTAnUaquHoOBgq3aG4u68pwzyF4izHUcc85Nk
	 S4QKxcjF+zZqwMcc+kOseJyOejqeTMLh2ZPgEP/L1Uf2LJIK/l7HnQ5kvCHIsBknPug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=aamHFFzwS0CuBXIurBQ2i5axgQPtqXRYIqnraY6fuvo=;
	b=n3jaeM58WtE3Js9lDVzWazPdMjluVZFpSBnIoSnGSd6SU3epPo6e5Tfn2rMzkxSZlwWW
	 Jeqhdt9cCYjwRcy5D9gEzAAp5kRO1bsdoRQlf/oE4QHfU7q8/whUvKE7svK6aNX6ZuJDJ
	 VDalFdk3HCGLiTul1xlDHT8S8UoGGL1xGtSC0jDyPO3NSzwkOblSMOA4ulnr4UNs62hX3
	 HNW8S2tkz8nKIkjC8/AKU4S5XQeFk3TuGvvCn8ybStlZszOaXAPo3ThiKRBRPkX6qYrsT
	 zVYzjj/csDLUFAimycgwOlXgUlZXh9KLIU9jX7q8aSbae3Z/F+jsEX5DYvgDOh+Yr4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=STCmbWQ4;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED10C606A33D
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 15:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED10C606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=STCmbWQ4
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so12862144a12.2
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 07:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795794932; x=1796399732; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aamHFFzwS0CuBXIurBQ2i5axgQPtqXRYIqnraY6fuvo=;
        b=STCmbWQ4UewMFNdT1uhAQMvGxDQ+Czwg0A/LpYUQwYPo4acKkvPsx8o7EYjxc3JOXj
         0fqsMScXdhYDWKFXgtqS1udFUxPMdZ88Ga+isgQekxQZYQaxKf65iVCeKDoZF2w/JO/t
         AzETHsvchFXd20ugammQpkBx7ZeiY+QnSGU4VJ0HWFgHzLJsMj7IBRzjhJH1MA+8zE49
         Vi0hb1MAeWBYT9Pfq6AQnJJuu02YlG9k0W+ipeVG9dF6f21mePSC9HNc2hukTN2POCa7
         UNa81yms15zWe/TBVSIe75pi3TYN9NTp9baFvLSGi8iNL8GiPwrQ/CI/UawvYTxTogCB
         eL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794932; x=1796399732;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aamHFFzwS0CuBXIurBQ2i5axgQPtqXRYIqnraY6fuvo=;
        b=02ghLXOaEVp8rq00KxoAJhRgXOLoTbJa2JiXb1zcM2Ab6Jig2y6A5b1FpF41zZcBHC
         mg1MAxoVrJFMW7orqlak4W0C8blY/AGJnLGCzOqwIei5NLCaPCZuAcNkYtJvhQ3kBn5t
         MvvJI7rzlLP07jV8A5mZxTkst9aUg1woAkJXtEtMiLfZ8JZERqO+1Jbt2Vc2C+IcCyqo
         4zDpFfQctwDCDmsu0VPERKQe5eb1fZcprLNZSXy5RPOH9q2pTu8291U9/SEcgrJLswjS
         16TOQcLgFcN9FcgYiPL9GBMTQk+MXy46Ha6UZD0/LOXKxR5gPNXdRbY/LOXBmrroX90g
         cDcA==
X-Forwarded-Encrypted: i=1; AL+hErE1gmFSIBrQZdLIdtUJkNWVOmCsNE9lVPnCFi1Jv4Htd34bQZNntPhlOWqSq+6QdN9G/LKlWtxSH68=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hV2ROLVrciazDV0BiTy2vyFrrkT1QOj1cv2aWD2StQhqKZmSP
	1vghwgRdkvjUmwlSGUgbeU1oi+Nu+hzW83UMlQ4af8V0Q+9qqAWuA/ShLzEHhu/XMa8=
X-Gm-Gg: AZFdTZeSWWIX9ynSVqxCnA1CXrJTZxNIEDRTvxVU2UAkZJl6VIz6H605v/FzioJcYMT
	6sP4U12ETJn18QF/YdOpc/nSOOhLcGlOzlvGKaYzeGNq5vbmgMQXZNK4v1Xu67g5VyZ+DwXK2O7
	hhmXHpYPDR6ssGEzbU4+D/N9Fa3p9DW67iBvIKXdvJP332Qt9dOaBGya0A4RW/6Td1tE3may6G4
	O0qvNjm2L4vet7z2x29QV6rrBNrUJ4IGHALo8Ss5vfZnk876OsKQ4uoVeJn5JxQW/vLHVrzKulg
	7XzXCIx+YcxT+F2S0fQa3DH2AG9AVabOBG//cda5HwFmeN+cyGcIYAVLk+PxKrAZWWkzNYUK0Zh
	053C33R5+haZXCsOhddNjLt6aX/t0a9oGzVyx4QUIBPiCMtEQYMtf+87JbDQ3N/QfZ3l5TVjjjq
	R5nXAyo1FR2Bzaskogj+NOHxPVX1lepIaDRP6oMJ0PtlVmQVIvaFVEAhfUXyw5oCC8Uu7E21itE
	ksEEL2CxtzIN6U81nMWoD+yaQE1d/E4g5tZ9+Z2NMJgO6N8XnfDzHMfMxqjJv+ooRJk+js4idK0
	BKAjGDFMow6SxxqhPnBZkXciJTb1h5VNht84rpu4lrZ52Qi3
X-Received: by 2002:a05:6402:42d5:b0:6ba:b20f:60ef with SMTP id 4fb4d7f45d1cf-6bab20f6810mr13142715a12.14.1795794931858;
        Fri, 27 Nov 2026 07:55:31 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fbf0esm11127032a12.23.2026.11.27.07.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:55:31 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v11 1/2] dt-bindings: clock: Add gpio-enabled-clock
From: Jerome Brunet <jbrunet@baylibre.com>
To: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Jyri Sarha <jsarha@ti.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Vyacheslav Yurkov <uvv.mail@gmail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261121-feature-clock-guard-v11-1-00c633a667a2@bruker.com>
References: <20261121-feature-clock-guard-v11-0-00c633a667a2@bruker.com>
 <20261121-feature-clock-guard-v11-1-00c633a667a2@bruker.com>
Date: Fri, 27 Nov 2026 16:55:28 +0100
Message-Id: <179579492872.2809466.854994706444744625.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2274; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=EINX0tsXJyuIqPfhhtODzW0RYgk1o8pIb3kiWYxd32o=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcyz9NeeSvuvxluoj/fc+eDxPTeFoyO7wUhVVepi4+E
 iT7z2V1RykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACZiWMTIcEhN6OOtXNeedfw7
 qyo8PxZ6pGjGTGJI0/pyNvvtxZeNrxgZ+u94BJycfCmGgS3E4NYx+V4240lqPgrX/p6K6+0tiE9
 iAAA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Some clocks are switched on and off by hardware outside software
> control, which reports through a GPIO whether the clock is currently
> running. Software cannot enable such a clock, but its consumers must
> not use it before the GPIO indicates that it is running.
> 
> Add a binding for a clock that passes its parent clock through
> unchanged and is considered enabled only while a GPIO signal is
> asserted. The parent clock determines the rate. The status GPIO is
> given by enabled-gpios, and poll-timeout-us bounds how long a consumer
> waits for the clock to become available.
> 
> Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
> ---
> Our use case: peripheral clocks generated by FPGA PLLs, with the
> PLL-lock signals routed to GPIOs of the SoC.
> ---
>  .../bindings/clock/gpio-enabled-clock.yaml         | 55 ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/clock/gpio-enabled-clock.yaml b/Documentation/devicetree/bindings/clock/gpio-enabled-clock.yaml
> new file mode 100644
> index 000000000000..4861c87ae5e0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/gpio-enabled-clock.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/gpio-enabled-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GPIO Enabled Clock
> +
> +maintainers:
> +  - Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
> +
> +properties:
> +  compatible:
> +    const: gpio-enabled-clock
> +
> +  clocks:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 0
> +
> +  clock-output-names:
> +    maxItems: 1
> +
> +  enabled-gpios:
> +    description: GPIO that indicates whether the clock is enabled or disabled.
> +    maxItems: 1
> +
> +  poll-timeout-us:
> +    description: Timeout in microseconds for waiting for a GPIO signal.
> +    default: 10
> +    minimum: 10
> +    maximum: 1000

Those limits are made up. I'm not sure they make sense for a generic device.
It surely need a value, i'd prefer if it was required then.

I'll wait for the DT folks view on this before applying it

-- 
Jerome

