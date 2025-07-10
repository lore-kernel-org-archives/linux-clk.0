Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB1C290083
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 08:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752137850; cv=none; b=sLwBKt6f39HhMvQE9H0gSOJcyWTdd7MZyuQAt3f/TW4Bf4w7Gc/ZhzF8b9gmgDKF9WJK1SSH0Zq1JnQTnmVlC+3nu1KBDqYlF6pjAxl2j6olFIkPnwV51XqzEh8Yc7vWFUqaz8t4i5QYMXV3tgtibsuT+CMNn1UwuGM0XfGeV5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752137850; c=relaxed/simple;
	bh=x2qnWy/jisF+XYZi200qSmXbNr7ZhNRXkIecCvKhBZ4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EH/L1wUHEQqyZ9jAHQcBdStZGPnnFmSqJnC/9Hn786C/eHKs9fAo9qpsuMk51joJud9SUtRm53DDmPEkjN7MR9k3MoPsj5Q19aGkn1gJsBrcRBXQHsyWoz/UWUdJyiNdF2lQh7MZk6QwWHeHNUW1EEUMQf+eVu4iY5wvQOaNfJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=unmouviC; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="unmouviC"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4538a2fc7ffso13103905e9.0
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 01:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1752137845; x=1752742645; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pEnfT6FkztCf1NEW9XiU9AdGyzA1VPDKN8Lo+OyIA2Q=;
        b=unmouviCrWPBsjVSvaRbua7ABA6tZ2NpL8OP6R+LfShRvFLMYDV/HqDpf4V8JlrZJc
         BmzhBcJz/CPbw4CXs1NH7ZQYFrhRX+8HfIxouKBewRBNcgzce6c+YTM4Gaixss8ODlPX
         SHlBr+y3tnEiFB3lH2T38DaE8f2RTt5Facb7B2ZaADpGPnVqwPqfDAi/m2s/9jy18crm
         6arRFDOGIB6YQ3dHnKnp9SMQuAI9SumyBPoMTaUJiNkiAETtuOaMoFms1tthrEA6FCsY
         uM9yNn/pQilkulDIRMtPRi0uxnIvvV+J/xe/wiETgP7Rm2FhBuyiuN182RdtzrSIO6qM
         TzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752137845; x=1752742645;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pEnfT6FkztCf1NEW9XiU9AdGyzA1VPDKN8Lo+OyIA2Q=;
        b=oLDt0iAm3XQyYEgk70I8gR4bG1TQLsYEkvpWb0AhlFRsY2E+pz9yMPzCv2m3GUkcjE
         cIfR0DPLb4dM34u8sTt/GvEXxnkEnuH19zkrtOKRXJncgdVmRfavFXzCPaRCZ+kmwFXD
         ZYnIP/WJc+MQWb0Mzhtq1ZeJj7THM0a0LjpubhxS0j40r09WajYpdx72H2ehmI68ROQh
         xzF11e1bmTTFBQh/zA5tjE6LDJa+Uo3qBn8144nQS8IB8DPdWkK9qt47MQjAU51azRNG
         OZRXDFAolpDVaNx9ScDPh10rtX6bdbtiYN8MD3iL+kGonPJV+WoOA+pTSmemcldel1OB
         O7aQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjIf3vzOi51hh/dfFelcgE5YXVAqu5NzHNoLmtQfyt2G1O3r7+lnOiOb54VYSmodxHIigzM6LTQwM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZXzLzEE3ORMMO0T/V5qsnkDBk/anj7r/ueluUDPjEGKrxFMJN
	ur9A62n4qCdAJxvCGHGwFPa8gR1mi4r8aUt7iSoyni+2yVdFn5WPDI9ZXFDJJeXMR1w=
X-Gm-Gg: ASbGncsMOeZjoyW8RNe9gSGlKxRDRf+13lG9sdBwH4cojW/RmyYnBDDVAalY3JTksqS
	wdKMxAEVhz5fPDOITIxk5qA89IxOIOYB/uLYbgjIyzMws2DGNxmA1p+fraJruL3oX9DplhTEJqH
	uv+u+CwORqV/aU/1osdrOMtZ1RSr9qzqqvqQ8Ap6uX1RMUFmJ/WR64DvlQLqf1BIqw/+QjWTwwq
	Lc/0za5cnvJ2W+zUO22EqQ5fF4qV7TUqHypd4HpsXVKrsuv7RySmmk3pxl1PcVx1KnUKwrhBjbR
	njS82Rgbsoq2djSPKJ8CtfKy0aQbfcanx771Bxgu0cpQg/AypFINIdbsj2sKMw==
X-Google-Smtp-Source: AGHT+IGWtPkM7wNN2WAZ9ZBqWQxhQQPFiCu8f4+86eF186o2AjTuMIqbAyWP77bRc2dyw5l64yP3Qg==
X-Received: by 2002:a05:6000:2087:b0:3a4:f70e:bc25 with SMTP id ffacd0b85a97d-3b5e7f29674mr2434317f8f.27.1752137844837;
        Thu, 10 Jul 2025 01:57:24 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9fcc:5953:3d1a:6b41])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8e14cfcsm1284032f8f.67.2025.07.10.01.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 01:57:24 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  jiebing.chen@amlogic.com,  linux-sound@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  jian.xu@amlogic.com,  shuai.li@amlogic.com,
  zhe.wang@amlogic.com
Subject: Re: [PATCH v5 1/6] dt-bindings: clock: meson: Add audio power
 domain for s4 soc
In-Reply-To: <20250710-audio_drvier-v5-1-d4155f1e7464@amlogic.com> (jiebing
	chen via's message of "Thu, 10 Jul 2025 11:35:37 +0800")
References: <20250710-audio_drvier-v5-0-d4155f1e7464@amlogic.com>
	<20250710-audio_drvier-v5-1-d4155f1e7464@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 10 Jul 2025 10:57:23 +0200
Message-ID: <1jbjpsqv7w.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 10 Jul 2025 at 11:35, jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org> wrote:

> From: jiebing chen <jiebing.chen@amlogic.com>
>
> The audio power domain has been detected on S4 device.

detected ?

> It must be enabled prior to audio operations.
>
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
>  .../bindings/clock/amlogic,axg-audio-clkc.yaml     | 55 +++++++++++++++++++++-
>  1 file changed, 54 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> index fd7982dd4ceab82389167079c2258a9acff51a76..c3f0bb9b2ff050394828ba339a7be0c9c48e9a76 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> +++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> @@ -21,6 +21,8 @@ properties:
>        - amlogic,axg-audio-clkc
>        - amlogic,g12a-audio-clkc
>        - amlogic,sm1-audio-clkc
> +      - amlogic,s4-audio-clkc
> +      - amlogic,clock-pads-clkc
>  
>    '#clock-cells':
>      const: 1
> @@ -100,13 +102,15 @@ properties:
>    resets:
>      description: internal reset line
>  
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - '#clock-cells'
>    - reg
>    - clocks
>    - clock-names
> -  - resets

Not related to the decription ... and fishy ...

>  
>  allOf:
>    - if:
> @@ -116,12 +120,37 @@ allOf:
>              enum:
>                - amlogic,g12a-audio-clkc
>                - amlogic,sm1-audio-clkc
> +              - amlogic,s4-audio-clkc
>      then:
>        required:
>          - '#reset-cells'
>      else:
>        properties:
>          '#reset-cells': false
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,s4-audio-clkc
> +    then:
> +      required:
> +        - power-domains
> +    else:
> +      properties:
> +        power-domains: false
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,clock-pads-clkc
> +    then:
> +      properties:
> +        resets: false
> +    else:
> +      required:
> +        - resets
>  
>  additionalProperties: false
>  
> @@ -129,6 +158,7 @@ examples:
>    - |
>      #include <dt-bindings/clock/axg-clkc.h>
>      #include <dt-bindings/reset/amlogic,meson-axg-reset.h>
> +    #include <dt-bindings/power/meson-s4-power.h>
>      apb {
>          #address-cells = <2>;
>          #size-cells = <2>;
> @@ -198,4 +228,27 @@ examples:
>                            "slv_lrclk9";
>              resets = <&reset RESET_AUDIO>;
>          };
> +      clk_pad: clock-controller@330e80 {
> +        compatible = "amlogic,clock-pads-clkc";
> +        reg = <0x0 0x330e80 0x0 0x10>;
> +        #clock-cells = <1>;
> +        clocks = <&clkc_periphs CLKID_AUDIO>,
> +                 <&clkc_pll CLKID_MPLL0>,
> +                 <&clkc_pll CLKID_MPLL1>,
> +                 <&clkc_pll CLKID_MPLL2>,
> +                 <&clkc_pll CLKID_MPLL3>,
> +                 <&clkc_pll CLKID_HIFI_PLL>,
> +                 <&clkc_pll CLKID_FCLK_DIV3>,
> +                 <&clkc_pll CLKID_FCLK_DIV4>,
> +                 <&clkc_pll CLKID_FCLK_DIV5>;
> +        clock-names = "pclk",
> +                      "mst_in0",
> +                      "mst_in1",
> +                      "mst_in2",
> +                      "mst_in3",
> +                      "mst_in4",
> +                      "mst_in5",
> +                      "mst_in6",
> +                      "mst_in7";
> +      };
>      };

-- 
Jerome
