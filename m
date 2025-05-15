Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2840A163;
	Thu, 15 May 2025 08:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747296036; cv=none; b=L9RAdaBg7QMLrA8ZN37vZMTP6u6QqSHI1M2EYrwzs0kl4OFEhZ7MHX73ky+orohSehITKVJa+pzA0TYSb1hMiSY7WkzpqTGJ0hSflpBdDkKuOv3V3cYLq6S75Zds5DJ21pDVEkGwgTPjF1BuJXWdnmlELnf16KaA5SaAxCCIvVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747296036; c=relaxed/simple;
	bh=tk/XDQLggBW/cCd7GmHTdtwt/QcoAPS1/He9RNjMpkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NRKIyJ4MAYnacCC7KK8tYLgdGsKE7b4Sfy/yl9cP1VbKoSlGXlwIXZaFAwKfeWveSte6s1uz3EZ2X/Vz18FxeTBxCyOr3tagV30AFsoW0YnoJ+GkTKkzAboRiwMA2GpdGEwVZclihJ4hlqns3rI16Lp5kCJttLHNyKjyxOr/DH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54b0d638e86so724059e87.1;
        Thu, 15 May 2025 01:00:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747296030; x=1747900830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=83/6bruci8d3XeppjMMQIod4VG9vV6e31bosgCEHfPA=;
        b=ap8YsQ9xMO6eIMoO3OZKIpXHPS4wKuYBs9sJ47E/BMY4+Fz2e08R+zOSPvUJlee/2d
         Z28UaKYTHN9ihfTGLAZO2y0pPdSF+nZbTXAI2bG0lVFpr1JQ/22zM6DxxBrqaZRE6pRq
         eoSfAPBaumPThlH0zg6TKCs0sJs+XAZEIEdcK9vuCmSz5wXg8Zbhjrd8oWEMxjj4RdPe
         fZoVhU5w6/jXKNKslqUTW2fk9QcsU+1bn1vPB+7Cyql0v03L0u4+DMlbT28qcM9n7Wh7
         qniJM9LnraO7UjmCOyJVv18svlX5eNavoIY5AOOp/CYKtfdYbeEcy8C9TYfx5TKDPm1D
         uvOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUl8DDtT15STpSKTiMJ4bTx1ymkyOohSX8kT7Wt8d6GMaPT8SFG5X6iR3IRoovqD5wJIIUra+N3BQ8y@vger.kernel.org, AJvYcCWp7KocdeaKfx4K8gQe9OKAAezPjaQ5QhuTplCOJ09g/j295ZvY3O2OooeT3xN5IQbURjQ4/3BRQHEC@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7zI8wwGND7MCyBERAFS4YWaatqf08+GCgMbVYdnf7TSfdpvr3
	WTcgUVb8RtdJc5huWSiWPTP2mfMjXbb3CCmCRDA9bUloeC8GblZxJaLM2aqh
X-Gm-Gg: ASbGncv9VL2jSmTk9Tv9bsd5EVyguhw++6jTi8gzC2PEOvB6ptr6kCoYyyHbKH1Pnvg
	ayylVz6o1tkTpLsPWxjSXjDqdocG5zx/RArosGjmg7QHXtcPZTUJJcRQH9NS3lW8//LE2JLQaUU
	i6yy46NmqWgJoOoKQKvY51ifk7h3eGUX7yZLbI3WIQ4owsMb2uk1U+aM3R3aMtGI8YelM4lUAyi
	iP5Tk4UnGTex3HCDQOIvtIC5BeRYQ0RkwOp4PE7gY64ZLKigV6hZYb6zD4CAvhXwZ3I92jUs0Pe
	aBYmlwdxSmlNQpBh7k2aMcjiW7EvCTNCoE7Sf4A5+5dILH/KhLdGGtDAf1K9mv0oWs6loDJa2Ak
	I+uUcOgDl
X-Google-Smtp-Source: AGHT+IFrgMyHuGUNc7pWg2b8Kysy6ExLNDEgUINC92Q6+tz5XzyLLM2XoKzMQCYEdBzGiCMSbCY2XQ==
X-Received: by 2002:a05:6512:31cd:b0:54d:6e19:ba9b with SMTP id 2adb3069b0e04-550dd11db61mr486080e87.34.1747296029901;
        Thu, 15 May 2025 01:00:29 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc645cdb5sm2549371e87.57.2025.05.15.01.00.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 01:00:29 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-326cf24aa35so7054181fa.2;
        Thu, 15 May 2025 01:00:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV4yrdIZNTabDvp1VSymbNms8X3MXizY+SNhBw/9YJ/EjUYaMnWpf4fhqO7wkE6ogGLyTgEsH2F3Yc1@vger.kernel.org, AJvYcCVPnLW8EgD43MnWwTU9vCqxwqVAn7qOQlN4C9IvkxqJRGcn/OwVTv3UIac1SWg11+KuzfcJU4/9uNtz@vger.kernel.org
X-Received: by 2002:a05:651c:1477:b0:30b:f2d6:8aab with SMTP id
 38308e7fff4ca-327fac55a0amr5702491fa.32.1747296029090; Thu, 15 May 2025
 01:00:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250511104042.24249-1-ryan@testtoast.com> <20250511104042.24249-6-ryan@testtoast.com>
In-Reply-To: <20250511104042.24249-6-ryan@testtoast.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 15 May 2025 16:00:16 +0800
X-Gmail-Original-Message-ID: <CAGb2v64BY+8ZkoxG82MCP+-5BZAFiYMRcm4LXeke9uVfpZX2bA@mail.gmail.com>
X-Gm-Features: AX0GCFtQJojOkTJDrh1Srsp9NZ6Emv-AQGyH6XtcUh5xrCVbMWvLF3It26XNdqM
Message-ID: <CAGb2v64BY+8ZkoxG82MCP+-5BZAFiYMRcm4LXeke9uVfpZX2bA@mail.gmail.com>
Subject: Re: [PATCH v10 05/11] dt-bindings: allwinner: add H616 DE33 bus binding
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andre Przywara <andre.przywara@arm.com>, Chris Morgan <macroalpha82@gmail.com>, 
	Hironori KIKUCHI <kikuchan98@gmail.com>, Philippe Simons <simons.philippe@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Chris Morgan <macromorgan@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 11, 2025 at 6:42=E2=80=AFPM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> The Allwinner H616 and variants have a new display engine revision
> (DE33).
>
> Add a display engine bus binding for the DE33.
>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
>
> ---

Since this just falls back to the A64 compatible, there's no matching
driver change. Can you send this together with the DT changes instead?

Otherwise it goes unused.

ChenYu

> Changelog v1..v2:
> - Correct DE2 bus enum to reflect fallback devices accurately.
>
> Changelog v2..v3:
> - Separate content into three patches for three separate subsystems
>
> Changelog v5..v6:
> - Increase reg maxItems to 3.
>
> Changelog v9..v10:
> - Remove maxItems, this was added in error to the bus binding (rather tha=
n the mixer binding) when it was split from the other bindings in an earlie=
r revision.
> ---
>  .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml     | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-d=
e2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.ya=
ml
> index 9845a187bdf6..ea7ee89158c6 100644
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
> 2.49.0
>
