Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com [209.85.217.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990952D7DD7
	for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 15:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768403475; cv=none; b=XWq9tQ4vegpPAFWNHXJ+hfe94JOtbSo/h6jBhlgiTtryhVxd/NfEkrUoaBCRCrEAK62tXAtRScMi5m/dXYhhQI6h4FMVpWStpwuh98Ga1RuZkOYGm3ElPi/ltQz8XCWgvKlf2usJtXJNEeYz3PZkUuqvnZsscNm6aIzemjHquCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768403475; c=relaxed/simple;
	bh=INLiR/9sKC5Ezv7y9MjS952KSFl9npMrRQs9Q37l+jo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mbhTq7TB9QxxX42a/kNRCdIxsrTsnrWi2bdaZJ8aeX/qMIyrpzt+R0YdQknhuWrfSh2Q9GJ3pa7nXvuEbcEnCuBUmKS8Vuv6cHMA9S4h4JyL+OOeaSlijUcbapObOf0AFmIuxf29wylcVXuj+1f3BL/3sN/4F0TQRTEgisxR50k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f65.google.com with SMTP id ada2fe7eead31-5eb8f9be588so8086470137.3
        for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 07:11:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768403472; x=1769008272;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fL62Bf3LdEer05zL+X5t7sIPwEJerT2IEVhS6PXvpSg=;
        b=d0R4oGX9yLmJBB0shTh95bjzZpruKV68SiT9wv5NlHqHE2Z668wYTpkDeXsFjvOLGx
         inNayb0CyTBOE47pGjRMZlMH6c7q00RPLP5KeTRWAsjW0xH3NZyU4VpPffBn19FcPHKP
         tyXYeNBCAn7YG+dfrR+maufIKpEHA73AINp7emghRKfsUS8pFXPTjM6aVl7vQTJA1mbY
         BYLsf/tLAPlhPACaD2czFAaLW5ZiB0rrpUsvMlsW9sPWt9FxDaRV/NYGs6JXCWS+0YXa
         9k+fBxWBUg/qkMENnldpWkNRAFFPq1yav01t8bq95RZYrhoBmoS/WKrBqxr1/mFR/w/M
         Kggw==
X-Forwarded-Encrypted: i=1; AJvYcCUCBmPh56q1r8CAEH6n3xSjHHT93o7KICRB6wjPZOLBE/cZPNVRaFRDjghc/Tw62Rwcu3C0TvKEETg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPPdazb65zfVvIh8LxhT9ox4krm6mvwWdb4d1sx7zNyOMYII7g
	E8ce9ttm/hWLaL3+XNuB5O67zh35Mm8GniXaavNi9EycpyUP8SxNJnS4JljBVrjMvWQ=
X-Gm-Gg: AY/fxX5krdAbmS3Xjr9wxZt5Vyf9j98ad8vKyA+yww4rJQv4nANOM2oFhqmTI52AGf+
	SfdQMBGhqT047rbqXMlr7RYgEJ5pwUKNmagyisV4Jsa94pl7SYAwnFOWV9xIl+i11sCMWtXHn5v
	AVEZbIhb1C7ETv5JkRM+Ey7URLkeHnlylOQsDNv3TK0Sl7yX0VTERCKKRnGNZ2MWpH2p5y9Bh8j
	LV8EkIGNBis9lm4qm2ZOUx8+XIa+klK4Sd5S4bVvlyGQMBKT2Jp0KmXq9ZEvXyyzOs4ElkB/zwQ
	siJcRfLIR2YeNeO0q054qOZul6jGchCBPsaZc50WR/MXAJ1F6If940RQpr68y4SUguPQ+zCmReT
	2f7tRWjCjApecawaUrCWkvlpVVauyvVbR1H6K2H/vJtHRcCfy9tiJItzKTE/BYBWBqG/Z7cY4Tn
	R+FogT9555RzZTSCWS11k79aTJKZpmkQLFf+YwAbAPTLIzNfFrk4f0
X-Received: by 2002:a05:6102:3f52:b0:5ee:9f7e:b3c7 with SMTP id ada2fe7eead31-5f17f48039fmr1394035137.13.1768403471068;
        Wed, 14 Jan 2026 07:11:11 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm24050174137.7.2026.01.14.07.11.05
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 07:11:07 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5636784883bso4327742e0c.3
        for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 07:11:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXV1FxZE6ad9z2IiO76fHff0cvsKiDkVjUEIknDTzoRH+9NVDkfwYWDEvHjWgYupT+nsOLWHDlU+h8=@vger.kernel.org
X-Received: by 2002:a05:6122:3113:b0:55a:ba0d:d84d with SMTP id
 71dfb90a1353d-563a093abc8mr1234630e0c.7.1768403465377; Wed, 14 Jan 2026
 07:11:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com> <2483415f35dabe42ba3c35a0c50a3e9b28dd724a.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <2483415f35dabe42ba3c35a0c50a3e9b28dd724a.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 16:10:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVrr11wufh569kSyCo72bEknos7UiuyxadThRQmt2_5rQ@mail.gmail.com>
X-Gm-Features: AZwV_QhVNfKomHEkvFsmWk2qp5dVEkSvsae2sIrEVsngj9ZQvyn6LkRdKtdcLBk
Message-ID: <CAMuHMdVrr11wufh569kSyCo72bEknos7UiuyxadThRQmt2_5rQ@mail.gmail.com>
Subject: Re: [PATCH 15/22] media: dt-bindings: media: renesas,vsp1: Document RZ/G3E
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Nov 2025 at 15:10, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> The VSPD block on the RZ/G3E SoC is identical to the one found on the
> RZ/G2L SoC.
>
> No driver changes are required, as `renesas,r9a07g044-vsp2` will be used
> as a fallback compatible string on the RZ/G3E SoC.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
