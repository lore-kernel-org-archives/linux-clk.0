Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71816189906;
	Sun, 18 May 2025 16:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747587255; cv=none; b=tuXAaz/Ts0EuMpkJiEHGe6RTo5HMth9pDsFFBXUK93nMC/nT5mPE8APQiTZPYR/aA+WLWkuJGSKDB3Q7Wzyi+pcZCWGEbLYgz2z4jkgpWGdAP2DzRwfKyisrZonB1b/ff4Hv2JP+jzGwO/1QawaEMdbSefXKCa1Mndp0y/dRqNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747587255; c=relaxed/simple;
	bh=STMuo8/qd05GfAY8QU0fDaRLs2uLrskCqPaVJINbTME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qtsRuSNkFFCgRyJAxP8uGKIfm+GuTSnQiGdhvb0o2ntdmNmMoD831fBm2RrkDGiqpn8z7DpQ9x6rcEGKLu+2Nr46NfD8xTPBxD/DBsV3lyNKZC2l9iJkn1EYluheK5b0y3hfvqcX3dvUwmTCQKWwathjl6YvUljtBjEOFKZqWEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-551f007a2b3so313807e87.3;
        Sun, 18 May 2025 09:54:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747587248; x=1748192048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=STMuo8/qd05GfAY8QU0fDaRLs2uLrskCqPaVJINbTME=;
        b=vMUfhsKhOWv4B7hqNPEPsuCBHUkrlYc/UOqbIM24FJiK/QwJvrb0FLmqB/XOP1X1JG
         BNn8ovvm0Y3pVyQcZkzqfOH7Of0X/BHbssnucRYUqhYXAHqjtXesEdandoyV4Zgme0mp
         SPgLZUtoti0aoGDH/tXrmatSKQcJkssZ9DXy4JXyzLqH4pTBdxgrf6KN2ELYKO2Lg94w
         007U47a9scc6Qxsd4+cPJPch8HyNjtHgkfXL1P4ceEj+N3ujlRjbqlJHWghEfmmcf5My
         4r9iGSFJ43Bt+PA3X8qLdUQl8U/poIF6reoyQ64kg+iu7ghvRszTGNTp4Q7rIhVUE6eq
         bELA==
X-Forwarded-Encrypted: i=1; AJvYcCUvWih6rjUSCDEbBuOw0vewCYvfYjEctuq5/X4L+DryUxyU2WHI4M6Ma9MPC32QJdPXzEZNt6t7ZbZ+@vger.kernel.org, AJvYcCXnLR11igO0euhlubV/B9mhdma+gqYUT8bTxmeSqHLpa+tSYbf5cvA97WVoGuKVAqPqM7H59f1lhc+3@vger.kernel.org
X-Gm-Message-State: AOJu0YwZHWlo7J/0ylFBBJvLCb4urLaUg+pFdBaeP4E6GnEVCDPfffZT
	Qqb3DLEsaPwV7d1b8tUmyr00zx7+gSB9y3NtW/DwZZ+T6b+Rfd7saV92Agul116V7R8=
X-Gm-Gg: ASbGncs6Ij3ntc9sRNYCRv6Tke3vJdBNVw8vlksVTe9kD/8i5i2iQzU0H04ZfzIl1ID
	Fnz+HX3Tho45iSimC7DNsX1iIiH62Q0qP/dVbrcn7Pru8iLdS+XQfYSJ4gxn58cRH/l3acJ2Mtz
	OJc4F1E4DmNfBk8svRCRtm4Or5GKlRk2fO4NtiAb2JYdFMrSra6VKdtv2CaJdx1qBWLJqSRhhBo
	O9B1i5vzfZqpMirnL234y00HdP20T/MWqAaRjmxLHahpOQvyMqodH1rZCvw39/7QYBVnoQnEH2a
	/yv+z2xtZphKZ9gC8K3vr7i9nBn68QYotcFE7riq0k/bGTSh6Bajxc8x3khPi0yzi3sjIbJ4I3m
	YDDXiRTi5
X-Google-Smtp-Source: AGHT+IECw1LOS+AihqP8c2yX5UDJ9+IOHPXtC9J9CSAEX2kSGyeePFNo4SzbZIRvMoMlcXOZGqtYyA==
X-Received: by 2002:a05:6512:3d05:b0:549:4bf7:6463 with SMTP id 2adb3069b0e04-550e98ff25dmr3059015e87.44.1747587247474;
        Sun, 18 May 2025 09:54:07 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f34d4bsm1485517e87.83.2025.05.18.09.54.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 May 2025 09:54:06 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-329107e3f90so4766981fa.3;
        Sun, 18 May 2025 09:54:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV1eR13XTAgpPoh55OeHI+o/4nyB6ocDgJZjmD9SUYDLegsdn4yyvHKgHWqpulcjr/cyYL9AdgT19t5@vger.kernel.org, AJvYcCXN3n4TlI4/Pe8pf6+4z62HQ9VzOv/DMnk+g7OUyGZrKKeNAoZt88v5cvtDHfawUhpIc0b3BEwmFcL5@vger.kernel.org
X-Received: by 2002:a2e:a546:0:b0:30b:fe19:b07a with SMTP id
 38308e7fff4ca-3280974cd4bmr28754701fa.25.1747587246119; Sun, 18 May 2025
 09:54:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516105101.11650-1-ryan@testtoast.com> <20250516105101.11650-9-ryan@testtoast.com>
In-Reply-To: <20250516105101.11650-9-ryan@testtoast.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 19 May 2025 00:53:53 +0800
X-Gmail-Original-Message-ID: <CAGb2v64v_uDKVs0QZkC43fH9aiBbyBnVwJVYNWAHPe2GMtwo6Q@mail.gmail.com>
X-Gm-Features: AX0GCFvgY9QrpGrKT96c6LVa08NAsANlz2uVfwNxjbxYFVM6-idz9sCykjNFd2E
Message-ID: <CAGb2v64v_uDKVs0QZkC43fH9aiBbyBnVwJVYNWAHPe2GMtwo6Q@mail.gmail.com>
Subject: Re: [PATCH v11 8/8] drm: sun4i: de33: mixer: add mixer configuration
 for the H616
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

On Fri, May 16, 2025 at 6:52=E2=80=AFPM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> The H616 (and related SoC packages sharing the same die) carry the new
> DE33 display engine.
>
> Add the mixer configuration and a compatible string for the H616 to the
> mixer.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
