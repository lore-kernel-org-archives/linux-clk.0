Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2590518627
	for <linux-clk@vger.kernel.org>; Fri, 15 Mar 2024 10:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710498058; cv=none; b=FRweE9d7TDji99MkRKcqJe9xRKmZlSxZccOuUF0cvJsJImTfuAS6v8CIO+XTbEofb1BCu/Nqrjsx9NLl/P5tru1+zj3rThzS2SYB5sldAMxWo+1mfZEChjwLxIcssGqgQPtLaTpcPGaAXfpPW9gi7XWCu1zaL0B4vUcOJu07n6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710498058; c=relaxed/simple;
	bh=JSCNMW8qWshcPVnF89xrbpx4/BHY0kCqY+YQoPryMmE=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=iQux5FcK6oEc8pHtxA+x4W6q5BDGYYfbyOypfV6jS0/zqNcvlWMVZgyr4NFb9nd0mP4LMUly218kWYLqEHThKPd0pA8wY5ZFCTAHS8DRqpQoEPIkU1DXViCE5CLDLUN/pOWEpA9Ysww/TfApw0h6USks0HMkkfWVNOBmbWnfSik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=sVk2tWd8; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="sVk2tWd8"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-513dc9d6938so141785e87.2
        for <linux-clk@vger.kernel.org>; Fri, 15 Mar 2024 03:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710498054; x=1711102854; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=6gMhyQcCq8fucjInJ87jHa5Zs8QHwH2ZIASN5Qcn1XU=;
        b=sVk2tWd8CFKPdshbb9eXUUET6ZxocEIboqiLXoiqK3hg721u/2gNRYRSMVLaAGcwJX
         Oo6qm5UrSecL0sM5Xm9FwSsum2PVin70I8X2N/GMT4dGYvdHTaA69jv5n6dD99DacA7W
         EFL8UNGrHt2wcgjlR4vp/M6Goki5GzwwxGoeEXf3sFZdhF/Bv3gVaIfco4vOYFEb6kxc
         VKXpBa1w2q4oYRFCOpmcRXzJIcSXs6Ptz/+usei3On4qFEQwz5glSw9RDuguoqoei4GD
         o4CoCeTiM2q9tfz+CKEBK9WMpNQPMasWCBBAF0+085Z/m0GiOpUam0MPZ7VLHf+qPd9b
         Xuaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710498054; x=1711102854;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gMhyQcCq8fucjInJ87jHa5Zs8QHwH2ZIASN5Qcn1XU=;
        b=UoXA2nJ0cdOdraKmZcT7KPgzb8worjaaVK1Y/7hi3EqFmztHrQquc/Cn8yrCAVfbZV
         RUSi6nj0qmX9O9VU3hN6gxEjnRAUWTg0bt8PxG0v1lHWLpJwKpdDISry0tXvAqVm3dhx
         Nw01BcJVmw0d6EE372MkEQK9HlK5qZJhkAlZBEF/o8DyrcZSAqeN41c+0L1GVcYIyR+B
         +KR6+8X0gFa1VRa0f1DASrQD7iR0OjL9i2i48kamHcgaEZ+Rnwyaek8F3SQDHzLAQnpQ
         ha/oWKu3qjdIyaU6MdxqppMyXtrkGoi/Y541yKNCEWPGbHs5Cu++JOvCni2LvOK8g+0E
         U63Q==
X-Forwarded-Encrypted: i=1; AJvYcCWAArqn/GYaEZannueQXRSF8MjrFsbhndFZ56bjeiri1ccE08bU8bnZi5B0AoDGgvBWVvrw0fc0DpgkLJAdnzpwIIPS/Uc8jMIL
X-Gm-Message-State: AOJu0YzDv0WcEfIseVi0SyJOohgkQ0vzMKbLNguxaXgOYQjeLBIG3cF/
	c9Ir2teHpQQUxLwUnCLa9uvolLf28JZWaztp7gmebbvGlnqvTARVMRJiYyWRRno=
X-Google-Smtp-Source: AGHT+IE93RWjsQIaXcrXP7QebJrBXb65k9rloMkqM4nhLZfNJA/HvogTh3saXyVEmcMBtfGaiLq/Mg==
X-Received: by 2002:ac2:4348:0:b0:513:42e:ddf0 with SMTP id o8-20020ac24348000000b00513042eddf0mr2648632lfl.36.1710498054118;
        Fri, 15 Mar 2024 03:20:54 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8151:4d0a:14d8:1124])
        by smtp.gmail.com with ESMTPSA id n7-20020a05600c3b8700b00413ea3db648sm8058358wms.26.2024.03.15.03.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 03:20:53 -0700 (PDT)
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-22-jan.dakinevich@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet
 <jbrunet@baylibre.com>, Michael  Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob  Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
 kernel@salutedevices.com
Subject: Re: [PATCH 21/25] ASoC: dt-bindings: meson: axg-tdm-iface: claim
 support of A1 SoC family
Date: Fri, 15 Mar 2024 11:13:48 +0100
In-reply-to: <20240314232201.2102178-22-jan.dakinevich@salutedevices.com>
Message-ID: <1jmsqzhk3e.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


On Fri 15 Mar 2024 at 02:21, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> Add "amlogic,a1-tdm-iface" compatible string alias to
> "amlogic,axg-tdm-iface".
>
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
>  .../devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml    | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml
> index 45955d8a26d1..7c1af85b52b4 100644
> --- a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml
> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml
> @@ -14,7 +14,11 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: amlogic,axg-tdm-iface
> +    oneOf:
> +      - const: amlogic,axg-tdm-iface
> +      - items:
> +          - const: amlogic,a1-tdm-iface
> +          - const: amlogic,axg-tdm-iface

Same as the card driver. I could have named it "amlogic,tdm-iface"

This is purely a SW component, which help agregate clocks and
tdm-formatters. It is analog to a "gpio-leds" or a "pwm-clock"
driver. We would add a compatible for every SoC for these, would we ?

I don't think it makes a lot of sense to add this. It is not going to
hurt but this is just adding useless compatible to the doc that will
never be used

>  
>    "#sound-dai-cells":
>      const: 0


-- 
Jerome
