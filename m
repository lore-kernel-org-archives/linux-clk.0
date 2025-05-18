Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AE81DE2CE;
	Sun, 18 May 2025 16:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747585282; cv=none; b=NxfmPszCEf2FkWM2jpMNdOrla+p7ZEOh6G7qI+Apz+OQ7FXCN6RK5Vi17wQx55Dp8f3D4N2F7uDpPLf/aA7Sz2pq6uNfUInK65rXmGniHQB1FDpC9EA0QWwekWPJtq+PXa6kiJWZUnm8lycNznsINmOeKtpe8jxwJ9mSqaVGLp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747585282; c=relaxed/simple;
	bh=R4350qFjP5pmMxVLhOYIwlVLJLk/mrj5F3+vFg2NAYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BTIiVwnig5JNE8NjLRazeUJB3wxNfDWpneg9h2jI2WZCsABJzi9msNLmNAsZrwFzqPRIisn5MkyiVpxSxnrXg2k/OQu6Pev4mxcTWzTWhVGzAfWkYjispBz3EUceYUqH+w2O3uL3pudtfukGLAB94uPGytVFetSpBiJwSK+m/u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54b166fa41bso5336880e87.0;
        Sun, 18 May 2025 09:21:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747585278; x=1748190078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R4350qFjP5pmMxVLhOYIwlVLJLk/mrj5F3+vFg2NAYI=;
        b=n0+Q+RAaSsUgS2FiaofRbGkn6knOZiqEiw/D9O0wK5K2Y20hTBH6NUDK2z7oW5T15e
         mtXuff01ak+O7j0T3x5VzAZkg6EH5ZfkADh3O93fJ4Wo3OD5AJ8BVCvPK5ykkMy0P/2c
         sBmq+ZLvDqbogH93Gbk68qxuBloXbVhQqB//UfhwcJTAvWX4MLmuGyzViF7chOQpCoQh
         ABC1XFa44ldO3d7TkNwcw5X7n9GimvXa2x9ligP6Iv+kRoWzMzm675GMMD+b2OTaSC5A
         dOo0XVOE5C75gaHk/CGil9IgT4DaQ0Gl2UDxVXd5O8bz3wWQAlhiFKyvvkTYIyEyIzcy
         f3kg==
X-Forwarded-Encrypted: i=1; AJvYcCWQ7Xd1q3jsB1wsi023ksmYwMbjcsCIx0iGF3JE7mgCpUfhAkev9RSRDnaQdaH7Ld2GdqqKEWT35oD6@vger.kernel.org, AJvYcCX4gB3cqGdGVk+AjyDnkFoGn65tqIuutvpFNYpVIrFBg3uaEsEEDDmsiAAkvfpQSGjsgRmO/XGYPPE+@vger.kernel.org
X-Gm-Message-State: AOJu0YzQhlkqJozAi7/nb+flhUeTs6rWWqLydm9DYzloMIAD+D0kcpN6
	sYNMu9APwKn8hPOkw6BM8heF5IvSCtQp/DEFQFc1IMGC7LR1vQaA7bmkZApEWrfa
X-Gm-Gg: ASbGncuB8zuH5WOiA+FR/38GTjcC93mO66uhIOxMkUkjPBvlCtb1Rd1qGfMxhK+oaWL
	mbdPyMhgZvN/+cOrpAGw+qBeovpXEY1lktOTlIWr/Q0AlBybTFfIUrE0EnBR1eEzMLZbsWHnz6o
	7/IHTv2V7Isyza6F1Ts5u03711WKeP5B/ygJ/hJLsuvPsQQIRKH6CfQh/KknD98fW0/0BXOQGu2
	O2lm0hnZ9NPdq59ievCRWFq5gtiKgdIBp/WVEwfhuivlJx4HG3mC3NdNknnnE0FNDudioJz0kQf
	dImcO9+inskf4vADMMxQajwB6SvwJ3d1ZxxhRpetZ/rgA+O8uJoKaNN+tcv+F3oowt0j+3PzDSt
	1UsVrmjvr
X-Google-Smtp-Source: AGHT+IG1mXpBIEYbY9R2p/PrwdxbmxL0fq3KKfbxXUJnDAFME1iRdHTfM9K+ylGRR3CWAEakgs44ag==
X-Received: by 2002:ac2:4e07:0:b0:54d:6a89:8722 with SMTP id 2adb3069b0e04-550e71d9258mr2833597e87.29.1747585277433;
        Sun, 18 May 2025 09:21:17 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e701812esm1471481e87.112.2025.05.18.09.21.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 May 2025 09:21:16 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-329157c9f79so1704101fa.1;
        Sun, 18 May 2025 09:21:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUQJP4PtnSLJPcjueSDuuUAK3ssGVOuNvPoz5K/j7sv4xz46E2lQ7FldeNn5fZcIY2ALYUoIs/O3+/4@vger.kernel.org, AJvYcCV4+ASwUkN3CX9KA9bNt7lQdstzubOFq9EdgNnguWbdS5sf/LZi0FXZcp82xHCYkpwYEQelX/3TOVV7@vger.kernel.org
X-Received: by 2002:a2e:8a9c:0:b0:30d:7c85:14f5 with SMTP id
 38308e7fff4ca-328077a2e48mr31714831fa.25.1747585276327; Sun, 18 May 2025
 09:21:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516105101.11650-1-ryan@testtoast.com> <20250516105101.11650-2-ryan@testtoast.com>
In-Reply-To: <20250516105101.11650-2-ryan@testtoast.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 19 May 2025 00:21:04 +0800
X-Gmail-Original-Message-ID: <CAGb2v67rSp-ap+QkBX=gATfaxDWbBM0aMn_kjNUP10giLKFaHQ@mail.gmail.com>
X-Gm-Features: AX0GCFuJznDa_ICl2sGWtQLsZH04UWSn1aHqHteb8YSDT7ZfJxBtky01EaefvaI
Message-ID: <CAGb2v67rSp-ap+QkBX=gATfaxDWbBM0aMn_kjNUP10giLKFaHQ@mail.gmail.com>
Subject: Re: [PATCH v11 1/8] drm: sun4i: de2/de3: add mixer version enum
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
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 6:51=E2=80=AFPM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> The Allwinner DE2 and DE3 display engine mixers are currently identified
> by a simple boolean flag. This will not scale to support additional DE
> variants.
>
> Convert the boolean flag to an enum.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
