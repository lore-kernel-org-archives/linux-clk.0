Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E393F9268
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 11:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779104943; cv=none; b=DnrIBcVoPOtKn7aKjzPTHlvgYnIpJspmm98EGLadgKrzPsAdRBtmRmwCs02mJeAufL/HTqToKdRCyTmHJL3T/kbUs/IZ4QVwmrCpFgFy16EABCktGimrEcSLzAcbmMTQsMpYhRNVrpc5UuC32YHckRXxHMSdd/lcs6uH5KboZ58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779104943; c=relaxed/simple;
	bh=Ax2y7pmSuZrEkSP0ce0Fej26Z6ct7xdJQdPYertuzbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YA/mxvQPZ7OGxkGO+qX2dF7OreigQbxNgY8fIy/wZbQRU8+o2H/RaGy3Pw7iN2JGkQySX33nxsSw0xVwjkwasIwZnha9pJagp3WX6cDUyobJzRn3zvn6gjKZts4yjLp+fTK28tsDZKYgbVYhmbJ3nE5zHsGdcZv1HGyZnbf1Im0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8bb09239328so20023806d6.3
        for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 04:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779104941; x=1779709741;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M3bmWUZgjAYZamnd3Aw3Zf+CdNP9jYAgiNz9GJP8Rro=;
        b=cPi7DPsmzjL27rBpRg2z2QNUMCyG52Uz9J5Hq15SiOaoIhD35e/BWAJhFb4yynW4Jb
         XrjU02/S5ykBHTrRHt622SCWZJmJAuvadftFRs5aYtX6+4Ccq80vFlieRKlbtIl0EGxh
         O7ySTxOoV9dJwTI34lbjpGEUVSra6M2LGy6hMNgqb214YFicIJMDCRZ/kcwNtUDZkU1u
         7h/7r8yO3ewt/fesymPro2RM32Vm/LEV2d5grkXCeT90VlzXPAKkr4jv+dc2GgYs/Xd8
         nKWZ3G/CcSfeiLsFEroKDgFXg7hE5CYM7bOr3luJdS7wNW7srvt/suKe4MZxCFC3Dr76
         bgOA==
X-Forwarded-Encrypted: i=1; AFNElJ9TtYZSdqYYCA94Jr5c4WQrf6NlV2Qbf9tW6fH1Nm1hrPCYjat21uKI6Ze75G+9WY7O+sM/7KbDCpk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHrdmG7oh6jsebwm32w47jbFq7rfCSetSq+TqjuaiiU4mI4r9G
	Fez3dOuqkoT3qw4j3Jtz/yzIUjhn2FYo6sIAJkI1Am5+sJYYEiz9pTRw5+55IbnA
X-Gm-Gg: Acq92OGyFNgPYuPTHIgmIZa80lCgTgyfrbS6HJ03WcQAjReUyDTfwGWtlHmM+026evy
	3Eik9ubozFtOPolrsXgxVXeaCfdAMuDTUIx2wYZ9nt3kWR82UnjLnFE7/UZlx1WjAhJq8N4tj84
	HO7lCTRQ9gqtbcd1tc32IstnZiy9onDFJTwvTKJrDK9f+nCK5epm7FWKksTvSeIVubvss01U4hZ
	gbgZ4BjSgtRFfSCe9K9I6jE21RTAIO0Z8uCaIB4Hs0ymDDXUMsR8ztkO3TUD9uvMORFn7SaeTue
	ofk6cPlO8/QdrQMJORFafRSdIXg3kF9tgrrgDMtEJxuOzkFTCYxc41/x4zpuZYLstqy5i3D+i50
	SL3aWNYUMEL9qD1rIw5pifsLmEDxEe6rp/BIVlRsJ0eC4fnMSSWynHZonrgAFJpDj8l9zg/E/0L
	bNW/yfreTh5Hshej6Uv1w/xO5hJJY5fbgJpc6vV3dqnrUnbXMSoqvDO0KRNBu28wWE
X-Received: by 2002:a05:6214:242b:b0:8bf:87c5:fa21 with SMTP id 6a1803df08f44-8ca0f706530mr271382386d6.49.1779104941149;
        Mon, 18 May 2026 04:49:01 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com. [209.85.160.169])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ca36086ac6sm54332936d6.7.2026.05.18.04.49.00
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 04:49:00 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-50e5bea4045so16846131cf.3
        for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 04:49:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/ja2ukVhWluccwuGMkuST4bsQhVOdmETHaW1BCDAmdREZnMr1iAp9xOvNG7PAqElLBN9gwn22o5u4=@vger.kernel.org
X-Received: by 2002:a05:6122:4690:b0:573:a779:62cf with SMTP id
 71dfb90a1353d-5760beaed3bmr5626640e0c.7.1779104463611; Mon, 18 May 2026
 04:41:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515-rcar-du-dsc-v3-0-164157820498@ideasonboard.com> <20260515-rcar-du-dsc-v3-3-164157820498@ideasonboard.com>
In-Reply-To: <20260515-rcar-du-dsc-v3-3-164157820498@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 May 2026 13:40:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUf4dGnK4ooTyw_31Ueanr-Ym3nhML4a12exU+5nFYh2g@mail.gmail.com>
X-Gm-Features: AVHnY4Lo5h0gdtI7uD_PcBRMzgonT5rakDO4TjP7cpU7h0ngOw5-dH_yEpIVciE
Message-ID: <CAMuHMdUf4dGnK4ooTyw_31Ueanr-Ym3nhML4a12exU+5nFYh2g@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] drm/rcar-du: dsc: Add rudimentary Renesas R-Car
 V4H DSC driver
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
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

Hi Tomi,

On Fri, 15 May 2026 at 11:10, Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
>
> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> The Renesas DSC Display Stream Compression is a bridge embedded in the
> Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
> 8k or 400 Mpixel/s . Add rudimentary driver, which currently acts as a
> pass-through bridge and allows DSI1 to be operational on R-Car V4H.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> [tomi.valkeinen: use bridge->next_bridge, minor changes]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

> --- /dev/null
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_dsc.c

> +static void rcar_dsc_atomic_enable(struct drm_bridge *bridge,
> +                                  struct drm_atomic_state *state)

drm_atomic_state is no more since commit 5164f7e7ff8ec7d4
("drm: Rename struct drm_atomic_state to drm_atomic_commit") in
drm-misc/for-linux-next (next-20260506 and later).

> +{
> +       struct rcar_dsc *dsc = bridge_to_rcar_dsc(bridge);
> +
> +       WARN_ON(pm_runtime_resume_and_get(dsc->dev));
> +}
> +
> +static void rcar_dsc_atomic_disable(struct drm_bridge *bridge,
> +                                   struct drm_atomic_state *state)

s/drm_atomic_state/drm_atomic_commit/g

> +{
> +       struct rcar_dsc *dsc = bridge_to_rcar_dsc(bridge);
> +
> +       pm_runtime_put(dsc->dev);
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
