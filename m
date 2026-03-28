Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27E533DEE5
	for <linux-clk@vger.kernel.org>; Sat, 28 Mar 2026 15:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774712578; cv=none; b=K+8lU0fm5t1mYOQvk7/YdPHroabto1jfIwVCWCHGVwJcuytd43fJHh9RtTyFmbDzma7HoBFUg48QufjkR26OJ6kyZ4kwozISN+KfiUPcC9V8suSU9N2tlcFkODwz5jvX3AUlY8zFpUV28/QHvk1X5MlAEi8r9FeWzJeeQpOe4aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774712578; c=relaxed/simple;
	bh=J97nhqd19Owfth49YYD2VgMcKu6wbx/SAYjRjMlEcXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=au32jypAzHJ8Xy1ZDkFsZTGsS9tuSLqh+QSNYQYqNl3b0tMV4OqSk3KcRzmC4kYQtj3pQPY3yhZUm1of4hqhpjNSa90HyxIVTIYLF5YHT5CXEvB74fzLB3VIQvt1qfgmQR9xvcwE+6Sxbm7H/MsUTGZ8VmUkblmzxBD+V5uSxlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T4LSkKpr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T4LSkKpr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 866FDC4CEF7
	for <linux-clk@vger.kernel.org>; Sat, 28 Mar 2026 15:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774712577;
	bh=J97nhqd19Owfth49YYD2VgMcKu6wbx/SAYjRjMlEcXA=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=T4LSkKprTup87R7wYWn4RvqLp3EfMrKQbSG2yfJuq9OhLx6pcuagmfhW978oaPKIm
	 0hnRhwz2ogyPwFoCHEOx9MhvmXqELWo4zhe+FUC7iqf+M6MTLcyR9T09qrNnsASfHP
	 thLuAEn40Iu699Ob5gAXedpfv01Yrx03MXdfKPra1GHRIQMEjj5igIuZfuyfmuAJYb
	 JnvwRt/bcLSpQDCFXB+p3Jri8yUYw4RxmfsYIIfTIXSgZ7pVF02h+Q4KjRdEkM33Az
	 SnygJV1DOiJZO0PK+uUtr5qlfQwgJ1JNZW8h+/2Mvvq4KunY0Z7Rda7KRm17y8gsOr
	 JGtOhtZQsXBIQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a0faa0d15cso3182058e87.0
        for <linux-clk@vger.kernel.org>; Sat, 28 Mar 2026 08:42:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUtYVlIUqACazSv+0KhH+nz8mgDusY1Gma24RiY2MbCp7/V0a4el6uJWg8NuTvoCLZJkdCft3w1Dqc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHw4cgWsGtz3cMRK9NSNkw3tlX9twvaL9hrxGlQOlel0alcon8
	BBDPpMnwK9gpO35iChK99dDPG4u1P8g90x/941OlPZQ6Ms7Te3X7EIJMCPj+v6IDQ0i4s9dpdQI
	/22c6ZSWUmncjgP2rcmnliu79upT1sgM=
X-Received: by 2002:ac2:482b:0:b0:5a2:a1aa:2b8a with SMTP id
 2adb3069b0e04-5a2ab92b48dmr1928277e87.31.1774701460967; Sat, 28 Mar 2026
 05:37:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech> <20260121-a733-rtc-v1-1-d359437f23a7@pigmoral.tech>
In-Reply-To: <20260121-a733-rtc-v1-1-d359437f23a7@pigmoral.tech>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 28 Mar 2026 20:37:26 +0800
X-Gmail-Original-Message-ID: <CAGb2v67844OPwE6VJ0PAs5LsmCa2h0FvXOBUomZ50dM5tZ0Zow@mail.gmail.com>
X-Gm-Features: AQROBzAjNUlKB5AcxIrVhPiEv-8viiXBsmIlq5_4UPHivayPQSg3rbcnxOKBQII
Message-ID: <CAGb2v67844OPwE6VJ0PAs5LsmCa2h0FvXOBUomZ50dM5tZ0Zow@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: rtc: sun6i: Add Allwinner A733 support
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 7:03=E2=80=AFPM Junhui Liu <junhui.liu@pigmoral.tec=
h> wrote:
>
> The RTC module in the Allwinner A733 SoC is functionally compatible with
> the sun6i RTC, but its internal Clock Control Unit (CCU) has significant
> changes.
>
> The A733 supports selecting the oscillator between three frequencies:
> 19.2MHz, 24MHz, and 26MHz. The RTC CCU relies on hardware to detect
> which frequency is actually used on the board. By defining all three
> frequencies as fixed-clocks in the device tree, the driver can identify
> the hardware-detected frequency and expose it to the rest of the system.

No. The board device tree shall have the exact and correct frequency
defined in the external crystal device node. The operating system can
use the hardware-detected frequency to "fix" the in-system representation
if it is off.

> Additionally, the A733 RTC CCU provides several new DCXO gate clocks for
> specific modules, including SerDes, HDMI, and UFS.
>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml      | 38 ++++++++++++++++=
++++--
>  include/dt-bindings/clock/sun60i-a733-rtc.h        | 16 +++++++++
>  2 files changed, 52 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rt=
c.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> index 9df5cdb6f63f..b18431955783 100644
> --- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> @@ -26,6 +26,7 @@ properties:
>            - allwinner,sun50i-h6-rtc
>            - allwinner,sun50i-h616-rtc
>            - allwinner,sun50i-r329-rtc
> +          - allwinner,sun60i-a733-rtc
>        - items:
>            - const: allwinner,sun50i-a64-rtc
>            - const: allwinner,sun8i-h3-rtc
> @@ -46,11 +47,11 @@ properties:
>
>    clocks:
>      minItems: 1
> -    maxItems: 4
> +    maxItems: 6
>
>    clock-names:
>      minItems: 1
> -    maxItems: 4
> +    maxItems: 6
>
>    clock-output-names:
>      minItems: 1
> @@ -156,6 +157,38 @@ allOf:
>          - clocks
>          - clock-names
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: allwinner,sun60i-a733-rtc
> +
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 5
> +          items:
> +            - description: Bus clock for register access

> +            - description: 19.2 MHz oscillator
> +            - description: 24 MHz oscillator
> +            - description: 26 MHz oscillator

No. There is only one input. As in there is only one set of pins for the
DCXO. The inputs are the same as on R329 / A523. Just use that list.

> +            - description: AHB parent for internal SPI clock
> +            - description: External 32768 Hz oscillator
> +
> +        clock-names:
> +          minItems: 5
> +          items:
> +            - const: bus
> +            - const: osc19M
> +            - const: osc24M
> +            - const: osc26M
> +            - const: ahb
> +            - const: ext-osc32k
> +
> +      required:
> +        - clocks
> +        - clock-names
> +
>    - if:
>        properties:
>          compatible:
> @@ -164,6 +197,7 @@ allOf:
>                - allwinner,sun8i-r40-rtc
>                - allwinner,sun50i-h616-rtc
>                - allwinner,sun50i-r329-rtc
> +              - allwinner,sun60i-a733-rtc
>
>      then:
>        properties:
> diff --git a/include/dt-bindings/clock/sun60i-a733-rtc.h b/include/dt-bin=
dings/clock/sun60i-a733-rtc.h
> new file mode 100644
> index 000000000000..8a2b5facad73
> --- /dev/null
> +++ b/include/dt-bindings/clock/sun60i-a733-rtc.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
> +
> +#ifndef _DT_BINDINGS_CLK_SUN60I_A733_RTC_H_
> +#define _DT_BINDINGS_CLK_SUN60I_A733_RTC_H_
> +
> +#define CLK_IOSC               0
> +#define CLK_OSC32K             1
> +#define CLK_HOSC               2

The DCXO enable control has been present since at least the H6. We just
never added it, as we would never disable it anyway.

If you compare the RTC clock trees of the A733 and A523, the only addition
besides the new gates seems to be the LOSC auto selection. But even that
is just an illusion, as the A523 has the same registers for that.

One could say the A733 RTC is almost backward compatible to the A523, if
not for the two fastboot registers the A523 has at 0x120 and 0x124.

So I ask that you try to integrate the differences into the existing
driver and bindings. You can tweak and export internal clks if you
need.

> +#define CLK_RTC_32K            3

AFAICT besides being an internal clock, this is also fed to GPIO for
debounce? We probably need to expose this on the A523 as well.


Thanks
ChenYu


> +#define CLK_OSC32K_FANOUT      4
> +#define CLK_HOSC_SERDES1       5
> +#define CLK_HOSC_SERDES0       6
> +#define CLK_HOSC_HDMI          7
> +#define CLK_HOSC_UFS           8
> +
> +#endif /* _DT_BINDINGS_CLK_SUN60I_A733_RTC_H_ */
>
> --
> 2.52.0
>
>
