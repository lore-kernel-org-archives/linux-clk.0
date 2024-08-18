Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8533E79CC;
	Sun, 18 Aug 2024 13:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723988839; cv=none; b=oE2DNu5Q6nDeGhYp3/rPYneJSI9/QZJxs1ZJeG0JbsTSKUGYLmYUz8nYlGBlh0pnhKOcwWgE5YTz5t/OrRzxF5MJhlvzeoVmTYrkVAnOr2XU9e86jMBM2pG0dYVNJ54+9MFj8sKZC0lLZ7P8gdw40hA80oswgMS9xpF/1RiC334=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723988839; c=relaxed/simple;
	bh=jgt3v6Wp5x1kqvAC6kVKpKb1Tq0WHo9OEiRTHTbkMr0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o1h2mJQ4aeztGpHX08kVnbvWy81xv0Z7nrPS1wVnlr3oSws29c1Qco5FbdH9DwqIzG7TcBTE+Ri1adwS03oyPHtZOKrb9ScIU5O+PVb0SSm6RYyNzEP9YyrJ/hpC0lxo3d8OzV6ehntlx74ziRJm/ilVIohmZDpLuDdD8kB8I68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f3ce5bc7d2so9368891fa.0;
        Sun, 18 Aug 2024 06:47:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723988831; x=1724593631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+uvtxgs6kWiB9/v6Xs7WCMNnd37h4d8Ese9LrJ+mZCI=;
        b=ED3W4fh26flfDXUh5ivdDlNso2vWPwNBe33xEihgscg2OUhU2y0G3+wQ5cgVmvK7Fr
         P/DrqSTZnfZ8wfzTuSYHocZ8Wm7gLZaficii+eRGxtVUjbt5yIeORk92RIGZmO3kwgIk
         TM5MYPRehj7BrolxLg7biGxsjeeOL0q4W9qB+A+Ve1Iyl6+GJ1cIcfbbfaocTHSUBsj/
         6GGciUzov7HPqN0rKDeOAgjZdXVS+pCJd23iB1qGnPZj9DI7vskKKXJ0oyRFBQGJmX8+
         OzLmiJ3FLScJPGrZV2DPpoFYDdFlKYLszmCK0gzAdYoxHziI1tRyWR4ScKZprAyDmMzf
         RSoA==
X-Forwarded-Encrypted: i=1; AJvYcCWDedQZlKe4XJ0AOlddeCzRk6tVEmI1C0EZBIzZHxBN0uC34+CcEV1KPuaLzKtTnqYegLZyL16dsBBaXHVcfa5ioIy3JJrw5S042tzF+CwUavh0o3FJIXibu8pq7+K6F9JFtPqGiQ==
X-Gm-Message-State: AOJu0YxUaBL6hTFqvd+sHif4HT1wOzdlHnrqvifAtHt2XJSc4Yg1A+W/
	rBCOPdvLgR6eo7Uwj6JLNUe19hr/ZabYx1Gala0grxBGZ5nflI6XeAdE3T/xxYA=
X-Google-Smtp-Source: AGHT+IEYg89WcUCm+pmTTTQ7XDwSOyS+fTQ7KqLJBqB5kNsw1QqYqoMwRJXS9iAqK1JV6Cf9EgB4eg==
X-Received: by 2002:a2e:b887:0:b0:2ef:22a5:9472 with SMTP id 38308e7fff4ca-2f3be5de27cmr61512581fa.38.1723988830844;
        Sun, 18 Aug 2024 06:47:10 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f3b771eef7sm12182251fa.111.2024.08.18.06.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Aug 2024 06:47:10 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f3ce5bc7d2so9368421fa.0;
        Sun, 18 Aug 2024 06:47:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUAVqF+o8tXVMMXFZGR2O+wphSbbf1CfTVoGKxOnPN6Vli2Oz3MVQjiwoysBZ9MS1LtXldudlyjA2z9pMEp0k5LMQ0+EcllM0i5f62OFVy2lFRc2R+hAZ10lr/2oawCaFB+CaIcDw==
X-Received: by 2002:a2e:9a83:0:b0:2ef:1c0a:9b94 with SMTP id
 38308e7fff4ca-2f3be5864d9mr51081381fa.16.1723988830128; Sun, 18 Aug 2024
 06:47:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240817230503.158889-1-ryan@testtoast.com> <20240817230503.158889-20-ryan@testtoast.com>
In-Reply-To: <20240817230503.158889-20-ryan@testtoast.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 18 Aug 2024 21:46:56 +0800
X-Gmail-Original-Message-ID: <CAGb2v65_UGEJaqoUs8j9-wfsKKez_UPXTHnL3sj0ZA6NYt2vTQ@mail.gmail.com>
Message-ID: <CAGb2v65_UGEJaqoUs8j9-wfsKKez_UPXTHnL3sj0ZA6NYt2vTQ@mail.gmail.com>
Subject: Re: [PATCH v3 19/26] dt-bindings: allwinner: add H616 DE33 bus binding
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andre Przywara <andre.przywara@arm.com>, Chris Morgan <macroalpha82@gmail.com>, 
	John Watts <contact@jookia.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 18, 2024 at 7:08=E2=80=AFAM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> The Allwinner H616 and variants have a new display engine revision
> (DE33).
>
> Add a display engine bus binding for the DE33.
>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

>
> --
> Changelog v1..v2:
> - Correct DE2 bus enum to reflect fallback devices accurately.
>
> Changelog v2..v3:
> - Separate content into three patches for three separate subsystems
> ---
>  .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml     | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-d=
e2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.ya=
ml
> index 9845a187bdf65..ea7ee89158c61 100644
> --- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> +++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> @@ -24,7 +24,9 @@ properties:
>      oneOf:
>        - const: allwinner,sun50i-a64-de2
>        - items:
> -          - const: allwinner,sun50i-h6-de3
> +          - enum:
> +              - allwinner,sun50i-h6-de3
> +              - allwinner,sun50i-h616-de33
>            - const: allwinner,sun50i-a64-de2
>
>    reg:
> --
> 2.46.0
>
