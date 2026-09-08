Received: from mail-vs2-f0.google.com (mail-vs2-f0.google.com [74.125.227.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4978752ED25
	for <linux-clk@vger.kernel.org>; Tue,  8 Sep 2026 12:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788869829; cv=none; b=ZsPQHJXYNxaOxmh+9hDJjznR7Xpmqt8qJJJ9V4tyGLNVV1T3hmupQ2AiONGaDTbb3zCSbDoVZqY2q1Gb4tv2B4gJIBOSmP7k+sFPjR1tI0AvwkQ0BiUTiHypc+QsM1ZL5Qyu4raKZRl8vTZG6yq7hOrtLzplIZSaj1i/rG9nvNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788869829; c=relaxed/simple;
	bh=4qfVZ/5nw4amR7KDjxEudFePppzurkPQMXOHgtElbeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cnU30+UrvmbHjpeFw2b+TPaGTGxDCpOaETUs1Dv1D7LZ6XjRBdftOvYrSxcSYFjncXAQDgAtoa9JrlGRwdGnFmcmDxzi7ViXkiTZwg8qaSuRxsJG33xeNQzaw/MFbim/z+smo59lipoFkbTV+c8VUu4hLUp/jjbwwOqg1xwuqzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f0.google.com with SMTP id ada2fe7eead31-738e2ba31ddso755974137.1
        for <linux-clk@vger.kernel.org>; Tue, 08 Sep 2026 05:17:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788869823; x=1789474623;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1ITJx792r+ituep1jxzGor7V94Ftkp9w2SLxSuD0zdE=;
        b=HakS4JH7/X5msPC/vNMjuEV7jX+EgXK58/+9PZ6kPYFMPKV6B7/92ROkc/60osR6Fb
         WhWdQGU7EjS3QQZlH+rvqNeUmuMVY154r03he65HkzMfjrbEmOD4Z/VTrATP0GoByItP
         xdA/wqEqD7A3gRM1Rjb51qZoG54q7i+JARFgjjkbeXo3f3+gOyhp+zvyKKTmFUIIDzWl
         yvTp3PAHaiFAOXv3Yzq4g/MqWhcm/3p+Xz/RWCnPiw0/GlFiWMuqLi5LDQCBdmb+8RgB
         C7u5gna9iqICsvKjinSwvp/Z7awkiJiBcK7of8ft8I/3YLCLml2y8xAfhg5Ge4dfdxo6
         A6Pw==
X-Forwarded-Encrypted: i=1; AKwUvBxGRik+p7qoIeb6+1Cuelv0vA2BObIfKvS0gAxkxl7FQgYqjELhzacrgM+TfsSsUcksOEOPF+32RIg=@vger.kernel.org
X-Gm-Message-State: AFuF++nw5fCDVTzS6UT8IbzGAsx0FuvP9JcKCLffU8y6IiPYnsZSoRZ8
	myykuNVn3AKm2CRUOsJvp7nFycObGjBTMyBVn9YmpgXmiTzRZgq/x8T6kC2G8Xs/rnY=
X-Gm-Gg: AYBFou2alVgo7yUy9Pk56H4CXCkmtxcVOTX3zgfs9HIZsu8MwjVUCaJgK2GQQiMBQ0C
	jPBrLmUPkl5s/GEJxc7fqHtfckl91gGLIcztaVVmZor3r4YyUfG4WnJmudfaGpDmxcbe+qZifRJ
	rI5/KY4FjZQ04TIbjgHlQB84XceAPSX0orjRRPEkCRz0i0l6VYhrg8CQaUWkEwEjusXZPQXL8D1
	+ns4E0dtMNhStD43Z6/qQaICWwrC9fpl9nv59mAa/nRexki0H0f2l619C9lMaFCskbM8rqJbeY6
	w7RbwxG/QSUMFopnC+MSwK+YQXNTy/OA0qhEv0l1QQpjULnllYHyxhxUA5l5u+CcixEJw8tiaER
	A6g8iY44rQjY/zixMEKnZkpxEaFGYFXJIw9IXwm7KdOGAsVx7ZNYZoAkV6T5WOCs0JFJ3GVyrc7
	3OW27f4XIzyKLDiVowNP7fti1Q3uHXBCXUUTcLPvlw47sumC5J5qIpPer+rcbjZlqMG9DmCvEX8
	BOVMuxmdOYzMjyK6ZAZ6bD6Xt3BIA==
X-Received: by 2002:a05:6122:e189:b0:5c7:a9ee:dcfb with SMTP id 71dfb90a1353d-5c7ed3d6e40mr13159541e0c.5.1788869822903;
        Tue, 08 Sep 2026 05:17:02 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec3b2cb1sm9548770e0c.16.2026.09.08.05.17.02
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 05:17:02 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5c681c2a6a7so1723663e0c.0
        for <linux-clk@vger.kernel.org>; Tue, 08 Sep 2026 05:17:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByCqwUCwYH1B8GFCbb/sGbpSKd+8CAw7YNlHLf8hFuGX1v/uPFGjNzpV6UkAYc97xP/TsIxYq7i3RI=@vger.kernel.org
X-Received: by 2002:a05:6122:4698:b0:5bf:4522:fca7 with SMTP id
 71dfb90a1353d-5c7ed3b2275mr10642726e0c.4.1788869822558; Tue, 08 Sep 2026
 05:17:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-rcar-du-dsc-v6-0-f8ef711a7494@ideasonboard.com> <20260907-rcar-du-dsc-v6-5-f8ef711a7494@ideasonboard.com>
In-Reply-To: <20260907-rcar-du-dsc-v6-5-f8ef711a7494@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 14:16:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUpLrjtUh5pGP9ys_PSFt10vKdQCyo3UGaedcwaf8UEww@mail.gmail.com>
X-Gm-Features: AcwNN1XnePIl5mdE7u2itKH3ZKW58ZQZ46L6E5RD6lZgFL-MnDqW0nO0uTjSR8c
Message-ID: <CAMuHMdUpLrjtUh5pGP9ys_PSFt10vKdQCyo3UGaedcwaf8UEww@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] arm64: dts: renesas: sparrow-hawk: Enable
 DisplayPort by adding DSC
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Sept 2026 at 11:30, Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> DisplayPort on the Sparrow Hawk board uses sn65dsi86 bridge, which in
> turn gets the video stream from the SoC's DSI1 port. DSI1 pipeline has a
> DSC block in between the DU and the DSI1. However, there was no DSC
> driver in Linux and also the DSC was not defined in the dts files, and
> thus the DisplayPort output did not work.
>
> Now that we have DSC defined in the SoC dts file (r8a779g0.dtsi), we can
> enable DSC for sparrowhawk.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> [tomi.valkeinen: separated the sparrow hawk changes from the soc changes]
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4, pending acceptance of the
DSC DT bindings.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
