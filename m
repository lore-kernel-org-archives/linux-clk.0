Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043E14A8A35
	for <linux-clk@vger.kernel.org>; Mon,  5 Oct 2026 14:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210469; cv=none; b=jCGJJPyLQxxcXvO5f0ogybMYEFVJ/BNJAtLJIoMKx304kVCUT7yXmbAQkHaNJIMtBw1nhecboE3EswyPv8TS/YE/POiedMsHmMMEFuiB5C4rshP3T1OWhbC8M+LJ09uP8K0Ft9GY/tdZcFQcbtVcMh6dFG5NS/SpG+Qqt6asTnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210469; c=relaxed/simple;
	bh=NRu7J4NYxclsy403NiQBS3+9SXKidUTOhMwJxWH8fP8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WatANj9aUnLtCvbWKGGlh11y2MK2wF1/QrPd4TtMbsz2iq4ZsAkBL3jCUEZjjPSBgVyTKKqBE3LbLooYfB83JyRxHH3Me+tR9MAKljS/1CEAtyEAqeGBW3qBy/YvRB0ko9juNLF7YTAaTF596tfEcFM5QHd1iTQwbV5kh9OIS6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=VDvAt7da; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="VDvAt7da"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a16bc7ad39so3626965e9.1
        for <linux-clk@vger.kernel.org>; Mon, 05 Oct 2026 07:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791210461; x=1791815261; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6SMh/wrH0eouNlX+QzH0eHRPiSn4jmUrEiB6WQs9PRg=;
        b=VDvAt7daPuTxliM72mxvq2Kzv32VDdtX1AYMKR3cr3EfYL1UcUMqurcs0zzKmpASXD
         /dQBNALQ5c/yLjTmJ6TmCZ4rmy7dWaoeGSbwrb9sYHgHgpysJ+qvttACoJgR7gy4DrMy
         2lk1k+Cvvi2U0TNkz7Xm2Dx4yi54y8dvanqSus2c41OH4P+3ItsZEPny/7NSdyjyjdqn
         FtEtHTgARJvkRvvTzgrT2WK+MAVH8PpKhVNTiISzES3TR8e+es96LQswiqJxsXGcEDFo
         A+tuVYfAw4S3fBH2Mx6hH8eNMqLUHxDt0HS1xBpdon3slkXAeU5HWRmRV00d8RXWnaBt
         M3HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791210461; x=1791815261;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6SMh/wrH0eouNlX+QzH0eHRPiSn4jmUrEiB6WQs9PRg=;
        b=H9+nhs6jof4vwxxotkjsrjvjf62jYHJ9ZRWtb8r1KohIOPJcYDnYABU3qK2Px5AFbe
         mj3ysdXLALM/O0cuiro+3O6GgG2yXVXNNKu+B092AoteF1J27CkfAiXnZpYf/lJF9cBi
         zs3Iij64iv7Da2cMqt9sBdHgAHsn391112V/8/iZN0qOYdJl5WZ7glZHmTBRwFEfYcLW
         cEFXUnGHVhMMzjsgFLNcJ9xJPW4iLbAyGJ0vwg3a2XeknDp2DCY0BPPCT0S/tjHoe0Xv
         7H9r+84vpmHl1fpvtGagQU4Z7L0YqgXKELKsY4EVtmDAoKdthWi3AK8548souoU6PZmF
         K8yg==
X-Forwarded-Encrypted: i=1; AKwUvByS79Q7ZHpZYHyJ4gc3qKu9dDP3iGzGvBrjPLvVcBYCHfw5UuARmxoVu+JCuNIu04Q/Zy6Bve96RJE=@vger.kernel.org
X-Gm-Message-State: AFuF++kEF61q0AKyyDPYapeKJW8jSXMi5Mlp3AJ9ZUHdHgxTcr9I5bIl
	vmGRoBUGh7C9MtLBrhOTVR8fmgHGuooKN4vtUaAnXlNKK71qF3QnYWKcUzJGp1iXnfo=
X-Gm-Gg: AYBFou0rbTvp/1jYbN0gng3DbKlThNlJK4QBJzdZuEC9lFuCs651BMoWwV/6golvq0K
	iBuHUbaEYy6EwK7sXeWkA5wggCnS9zegrYCTEUgMG0/HSDdZvygI1kT1cWqo1Xt/n5toShyi2G0
	jj3HPA6oEEprRyE5ByvpQWA2gYq0KR2v9zhQPjxwNJQk3ueY63IcL/MfGq5uHSs1QJug//m3YJE
	NZmVAIfFpP8qAjX9zsBIBloaWMdY8Aod1VoWYpbER52IZDwenfr94V9O4l9Zys+50ipdkgqvDFF
	QuvC+WIaN7MziGyyBIAs9O/RRENjok4q5z6Nyp6VUtaYQN+xVWHYWbo7MW4tVSXTm2uX9Rmj7FT
	GZSJvj48dN8QrqH+vqB6YjS3pEUp48Mk5o414f+dkuXQtAEUq6+NQccjnLrL67I64tbTQYj+uwP
	vonSuSTcBv6bJKtbIXCOvTL7Y4sXUZY9Nf2XcM3Lid+JlUKGcqcHSyWpVlLTPKytLRKDePXND1b
	lQHd2ivaG+yAec=
X-Received: by 2002:a05:600c:190d:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4a02753fc8emr188561755e9.8.1791210460694;
        Mon, 05 Oct 2026 07:27:40 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a162e867e8sm325870355e9.15.2026.10.05.07.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 07:27:39 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Vyacheslav Yurkov via B4 Relay
 <devnull+V.Yurkov.EXT.bruker.com@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Brian Masney <bmasney@redhat.com>, Brian Masney
 <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Jyri
 Sarha <jsarha@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, Vyacheslav Yurkov <uvv.mail@gmail.com>,
 Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Subject: Re: [PATCH v8 1/2] dt-bindings: clock: gpio-gate-clock: Add a new
 compatible string
In-Reply-To: <20260927-feature-clock-guard-v8-1-630938e302a1@bruker.com>
References: <20260927-feature-clock-guard-v8-0-630938e302a1@bruker.com>
 <20260927-feature-clock-guard-v8-1-630938e302a1@bruker.com>
Date: Mon, 05 Oct 2026 16:27:37 +0200
Message-ID: <1jbj986x46.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun 27 Sep 2026 at 14:59, Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org> wrote:

> From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
>
> Extend the binding to be used also for gpio-locked-fixed-clock.
> A GPIO-locked fixed clock provider exposes a fixed-rate clock whose
> availability depends on one or more GPIO lock-status signals.
>
> Some hardware designs provide fixed-frequency clocks generated outside
> software control, such as by FPGA-resident PLLs. While the clock rate is
> fixed, a separate GPIO signal indicates whether the clock source is
> locked and producing a valid output.
>
> Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
> ---
>  .../devicetree/bindings/clock/gpio-gate-clock.yaml | 32 ++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml b/Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml
> index d09d0e3f0c6e..1ad87c8b36b9 100644
> --- a/Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml
> @@ -11,7 +11,9 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: gpio-gate-clock
> +    enum:
> +      - gpio-gate-clock
> +      - gpio-locked-clock

I think this name does not illustrate well what your driver does
anymore. As I noted before, locked if very much PLL centric. enabled ?

While the driver sits in the same C file (clk-gpio), I don't the binding doc
should. I'll defer to the DT folks on this but I think it would more
approriate with a different yaml. clk-gpio-gate and clk-gpio-mux have
their own binding doc

>  
>    clocks:
>      maxItems: 1
> @@ -23,10 +25,29 @@ properties:
>      description: GPIO reference for enabling and disabling the clock.
>      maxItems: 1
>  
> +  enabled-gpios:
> +    description: GPIO that indicates whether the clock is enabled or disabled.
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - '#clock-cells'
> -  - enable-gpios
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          const: gpio-gate-clock
> +    then:
> +      required:
> +        - enable-gpios
> +  - if:
> +      properties:
> +        compatible:
> +          const: gpio-locked-clock

I think there should be a property in here to express how long you are
willing to wait for the clock to be enabled. IOW the lock timeout.

> +    then:
> +      required:
> +        - enabled-gpios
>  
>  additionalProperties: false
>  
> @@ -40,3 +61,10 @@ examples:
>          #clock-cells = <0>;
>          enable-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
>      };
> +
> +    clk_gpio_locked {
> +        compatible = "gpio-locked-clock";
> +        #clock-cells = <0>;
> +        clocks = <&pll>;
> +        enabled-gpios = <&gpio0 4 GPIO_ACTIVE_HIGH>;
> +    };
>
> -- 
> 2.34.1
>
>

-- 
Jerome
