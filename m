Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B835E1DE4F1;
	Sun, 18 May 2025 16:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747586734; cv=none; b=Z14UEjzBMAQMdlhgggSF6W8Ap69a5weevy+hv0cbe1vwEzzFQcKe1glgAEw9nA+K78YqinckbUB2d6MAnyPTV8hukqa5wFqjPa6MOKDesn65gEIbRAETVZNVED7m5T1B3nMyB4VKT5t/MOkIcq1B3yYBhYPUhbmtuV6WMKC3Urg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747586734; c=relaxed/simple;
	bh=16lKLKeXiKEhT1aqzPTlfh1MfJCWJqXdbVQD33iMWeM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XmVsSc/LDg2jvJLMw7WMUKu6+GYtvN/zDokGrXRJ0tCIUtdzC8Aj27JvCR7EFG+3+zezuKIOGGsCnJR/qOBpP/NwPle+NwYjaUuR8rcgTT81qH4I8wGf3RldWsOjq7CpYgmCZrn5+b+j8R9h3M+FgCzcBNp/XfFYI5eFmmUvRwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3dc6b2a8647so1491495ab.2;
        Sun, 18 May 2025 09:45:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747586728; x=1748191528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=16lKLKeXiKEhT1aqzPTlfh1MfJCWJqXdbVQD33iMWeM=;
        b=EZqJsRStNx19MbqgcLeCZ05gmGzbn/z33IuqNhNk+GK4rBcxVWLA8etRiRrciXlQ9Z
         w+iEjGFlVKY1967zX3J9nR0TcYpzB9f2erCkLven+sPraAIalJFA3s17HssuPNMhGUv+
         l43SJVdm9qV4HxcEtjsHz5UKIPwVuLtKKbD97W1JHVA+2q0KkIOK3uN+HWBtJr/9ugmm
         cwh5NsVGrjOQ0U3bydNyVgYaj9OjghW01ZG5gACA5H1uduzKwJobJKN2+ydoLpjWqdTL
         b0AQmUJd73fKeKCuvAvvi+CBYdz4O+tAglrQ2pPWrzXdoh8uzRKEmCpTdfm7AFJZBlWN
         x9Rg==
X-Forwarded-Encrypted: i=1; AJvYcCUljCJloYiv1UyNYfnyzcDsGmilWhr5yWHkbFGMc2TAVNrDmveh+0RmeF+XE5iGJfErVhU+ULT0RTeQ@vger.kernel.org, AJvYcCVGO4KaP2iiUSlaby7QxHvwkCnzg6F3jQgZGeL1vLzfHvjZNUHNd6uV7+C3DSt+Q4dfNnSl1zOY8iHY@vger.kernel.org
X-Gm-Message-State: AOJu0YyRzMauyuWTqKos4QY7CJFo4xgVXTvyNrbwdCLyUmEOUhzSnZsV
	vosp52dupWkNDKRrAvN8NsCLEkX0ih5Ug5L1QYoVKWgxlyub+tvBHXU9Kpm0iRY1+ss=
X-Gm-Gg: ASbGnctppjO3nbv4m+xIUTyNLKeRkPcVZdj3GMqNPt2pYD9PE1IoRWfM4unzqAk//HU
	qIR21Ny1N6PvWWTBEO9gW2EUPL9AMY51lDDL/LDSmeHdbgbjqcbMUe32y81+Vr/gY5f6Qq/xJro
	x5COfFkbUMud8HpCaEaTAGnKDjVfmy+Qkl7FulMk9yi+Ujw/uWep58kHH1/pM3LClbh+GmtTN9F
	ps1GSphEIpCY6usEly7cl3ApU/Tvsmz7dDfIez8hKclB0edl9kLe0dF9DmY/9te00e4KJtR1NHv
	VDc7LZCRK38HUaGfM11kIIvtpK/OEV0Y1p/BlDXb8/Fo2uiBzT56KGlrWF93kNLaQZvdDak2xIA
	w3DA7FRSLb4k3UOMn1EY=
X-Google-Smtp-Source: AGHT+IEBqPCSVpNjGAut6CrM5hAq7mNOP0/uWo7w/Y6EFAaGy3/571H9Q0e2b8esG6sYM4wHCaF4tg==
X-Received: by 2002:a05:6e02:2199:b0:3d3:eeec:89f3 with SMTP id e9e14a558f8ab-3db85749179mr79601815ab.13.1747586727802;
        Sun, 18 May 2025 09:45:27 -0700 (PDT)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com. [209.85.166.170])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3db8444904asm15078775ab.63.2025.05.18.09.45.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 May 2025 09:45:26 -0700 (PDT)
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3db8356ee37so10496925ab.3;
        Sun, 18 May 2025 09:45:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVbSjORxvDRXG1NvKSUMrIAurjFXZMX00T/3wr11VyuP2cJynVE49sptY7MnSVId8DIN1rD0murmaeI@vger.kernel.org, AJvYcCWGRhDvHH65jxFCTSgj6eFxDFjQyubKnZV1Oo0uB56HCFjo5CxZ16Dq3qYB/WHLeHpH9r9ibyHFpXYG@vger.kernel.org
X-Received: by 2002:a05:6e02:351d:b0:3d0:47cf:869c with SMTP id
 e9e14a558f8ab-3db857b6555mr99202655ab.19.1747586726194; Sun, 18 May 2025
 09:45:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516105101.11650-1-ryan@testtoast.com> <20250516105101.11650-7-ryan@testtoast.com>
In-Reply-To: <20250516105101.11650-7-ryan@testtoast.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 19 May 2025 00:45:12 +0800
X-Gmail-Original-Message-ID: <CAGb2v65S2B2tatzJP3fJKcEYaoX-UGG2MtQX1VbUoTK4xTsyxg@mail.gmail.com>
X-Gm-Features: AX0GCFslyTJW3_SklNq3JULGeTuerD-gifQjm7kfUwjIWTbHbiDIUF58cpuqmoU
Message-ID: <CAGb2v65S2B2tatzJP3fJKcEYaoX-UGG2MtQX1VbUoTK4xTsyxg@mail.gmail.com>
Subject: Re: [PATCH v11 6/8] drm: sun4i: de33: mixer: add Display Engine 3.3
 (DE33) support
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
	Chris Morgan <macromorgan@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 6:52=E2=80=AFPM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> The DE33 is a newer version of the Allwinner Display Engine IP block,
> found in the H616, H618, H700 and T507 SoCs. DE2 and DE3 are already
> supported by the mainline driver.
>
> Notable features (from the H616 datasheet and implemented):
> - 4096 x 2048 (4K) output support
>
> Other features (implemented but not in this patchset):
> - AFBC ARM Frame Buffer Compression support
> - YUV pipeline support
>
> The DE2 and DE3 engines have a blender register range within the
> mixer engine register map, whereas the DE33 separates this out into
> a separate display group, and adds a top register map.
>
> The DE33 also appears to remove the global double buffer control
> register, present in the DE2 and DE3.
>
> Extend the mixer to support the DE33.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

Code looks OK, though I have not tried to check the register offsets.
