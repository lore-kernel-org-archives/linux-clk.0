Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794572865;
	b=JyOncnmFM5uE93KY6J1KuWY9lYs7sjkhxJWp4fGrI1TJafCjJ7mtgc6HQLcM1ZMmd8ST
	 gE83L0MCtDATOD78j2i/HgO6GrVvJrchUa0iXy8fqbw7r5ushaWepBM3hn76H4110M75p
	 CSYtNBh7lQMJ5b3EUGPEwWBxCTy8lL0iXzcAwrRJbFZOQcdJNFv0egJwOaolJnDhQtrW7
	 xQN0r3wYLiMt+Ef5yniKdIR6NwBb/XaA9nrq9lU7/ITZeAvasbKZ1PpuR4HYs3Hd1NySm
	 B77772Yo3ML5e8eVrh/7Ef8RnYcfmfZ39qGhqBVQhKEeS5E92SGd5tvX0xwb8QT13tw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Dn1URtd87rhGjVipjwsiO0ogDiCqEYx79Gj1SyGl1js=;
	b=EUWUZPVx/nTSblzvBBonRQHVmO/0QB7bYiYzTRIICo4rgOyu0H1SYm5OzFzGJng2a1Lb
	 JKvb6STzW80zGpapNUOo9HBpdOqze9nbTRiLVT2a7Z0Opzz+LMqWBMnxPrhzCPOIHlCwb
	 F3maF3dd5R6oZPNCR1g+6Ae+ICX9w87HF+u11v9IMJ85e6+JMVl2e0raHLsy/9SOPpuVp
	 1rTGMHElB4cREestsNrW5xCk9MkOaoqXXBrEnYrcq610As+UszBTZTg3dPqNzA53A0yNI
	 cXc3AXK4U6oIkWs6qq8kQuXeewUsuRc0jhEU0A/dEYE40Y7WUpdXvPzeFK3bUXpRZNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fpPSGCQh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28567606A32E
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 12:27:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28567606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fpPSGCQh
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c169ae1cb26so215262766b.1
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 04:27:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794572862; cv=none;
        d=google.com; s=arc-20260327;
        b=Kb5Fv6QqCL9ui7LdfZkJnVQav+DGnUcvPlISk5qY+Vk+xOkFV5wA0MAsPaI7loZeNZ
         eXCKIJc5obnTwJlr2ck2xMsqo5jHK4YXqoFDZunX8k8720zGQPGS6Zlghe2MGD6bof8a
         kPbjf1xbsn78ENyX7kbxIHjdoeho5dXgWPf6Bl5Jq5WXL5vaHG0b0RLEmMvAIxch+XJZ
         4NsQ7miO/KtgGh7QwQu6aj10b+ovrvJGxNDRXb+p6vpReXHWUt0rSzX8enzzGml1RuQb
         6qEVW5uGpfughYSgFteqO9tjrBzKKnJHRfYiOd4fFZpSTfLlDmDHy4DJkTId9TfmsaGX
         QjfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Dn1URtd87rhGjVipjwsiO0ogDiCqEYx79Gj1SyGl1js=;
        fh=dr33Khd+3KvlISI3fADx+KcTvEW4VfKayKPsB+rQyeY=;
        b=fCANcnMyGPJ+bUeD8KxVv13yueeioYLKr6fenilY3zWbYbosotZcNtXZUD4gaz0qyA
         K9DpLgOPlc1rsQ3QN3PHmlCRXjPvTdUuBNSZvz/lzu8u3D54Dw8PQf1UF30sTkr9fIjU
         94G0Kg071/Rf8B67k6xQy7WQWl0S1xMeiAk743Dw4gucEXvdmq6ETeie6IFX6+Do5dro
         rVxHKL50I6dIwYYuidVx+GgZDG23esbITgszyq6Ew9Invfp0PIyW8JFbC1jvYZ4kgHs8
         WWzacB6cDamdXdmBhTXnsgKsGw29K/xkVXuhJ/fd354w89UMxWrg1QFuTjC8RxV3VPcH
         sMkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794572862; x=1795177662; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dn1URtd87rhGjVipjwsiO0ogDiCqEYx79Gj1SyGl1js=;
        b=fpPSGCQh019xgnP4jNvjti8I/0AyxGyalkypQFm2kRkMTu7+kWMkCSqT3vZEEI+z2e
         U+eSA00vDHTlcZgqCYQn+e5R7A9Cru19JflQDbfR8SUD1CQPtQ4e54v1VUTgSYsXnVF1
         YQyfHaPezpOgrJhYnKhv2Jp/IULw+bNkPw8Uqnz8g+ucj5EgaXhanvyRmGLI+QfgQNn2
         XdwYa0+NVc770n44qHjYIhgH6QidViDyNfITPg7ELnVGfQJaP+k8TkWoln0Xu3dJEW/E
         VFzbwfAG8pdVpleuiQIzGZ1XdmSpiCQv0Qg+qUHvsBNtBIK5ZwWpvkItqUdiPXv+8A1h
         d9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572862; x=1795177662;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Dn1URtd87rhGjVipjwsiO0ogDiCqEYx79Gj1SyGl1js=;
        b=B2zGT59b7D9aOQdB+sfOiJ1nrOmnACP5ehKo6Sr2anHm4d3dkl9ZuG0CYoEKV1PE9C
         D1cBgn18+/gJJXvq/7F0pnTjwl2BFYcY7GjuXDS7btq4I1y1BgIPBJBh+7L0g3l48ZNc
         W/rj2YpSmkd+gKKcJTHiUfl9LGAnG9HB9N6N006/5D9WvYdyaceTGiNDZnC/57ugOCHN
         fgFLY839tuzmDnrp3AxE6JA3GFE1D2bStQ+6or+94bEOhSLIgZlH1zp74bxJvtvEUIdv
         5gzN0GnTualqXo28HgdlwAffMIItvlgccvmSBzuh4FPbera/jOAXT9tITSDzvd9MhCaV
         IIDQ==
X-Forwarded-Encrypted: i=1; AL+hErHjlg4kiCTsord7Aigau1/Jnnh38LYT/NZxW1lsHJr9PDzhx9Z/8UTYNSPg+d4l8lZJHiPJ5MKlH5E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CtpNlJsUUmI8BsP8tgLEj7vrwuyujSaTOBXDGi2FQUFB2Ru15
	jYv+DiwtnBqW5UTALXmwG+kAwvc20YY3AkqnFq7UHJ50d3QF8vvCWRe5mgdBVfM72PoqryzjC5h
	ZjSJW/76bIszVR18QasT1qS1GLbZEg30AvJvT3vqGtw==
X-Gm-Gg: AYBFou2er3A35iQlf10gwrpyCoPnBe8AKGeNnVhkfLTfHeG38CMEnEYhex3lIz3ElLC
	cCJGJaQFgyzgmFgFo5KxaFB9Dtmubckgnwdav5JgMDUfFOqNktpTeF1pl7hwQlXgxHu85RqKAF3
	m/omSLK1gs473+LLmKEyFxpxasdoD3Edvbe8eyvBKMgjr+6r99dTfLmcVz+aD/frbH/2VsnxwtF
	kjfW1BJ6+6UAnow0q7vEuVgUFYyTp+jUtYaAsH3cTh+Nb2tg5Ve8CLzJnK7h7iHnOKp6CeoFfXw
	/rECYvABxOl/uh11sraX+h4TFLYhrJF7qH4LSjMFmeUNFkayoB4SRQ0MZ73qHuE4HANo9jSxett
	NSM2HCZrAsJHpimkjmRCBVnAz6PWearJqe9juLx4vwojewxfYJL8iMbPsiAhiW28suyZCRQ==
X-Received: by 2002:a17:907:3d8d:b0:c36:777f:824c with SMTP id
 a640c23a62f3a-c507b3944a2mr522415966b.4.1794572862414; Fri, 13 Nov 2026
 04:27:42 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104847epcas5p1d970255218f1ca78b19690bfd097f303@epcas5p1.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-7-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-7-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 12:27:30 +0000
X-Gm-Features: AclHuK-p51p0Vx5xI8MvGi-0HN81TalHpuLQqDi6SVVgi93XmBwCD0wdDg3iAr0
Message-ID: <CADrjBPoR7_LDZmxC_bOFigvqDaagVihmybfX5AdvSPr9-FVb8w@mail.gmail.com>
Subject: Re: [PATCH v3 06/14 RESEND] clk: samsung: clk-pll: Add support for pll_4313
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"

Hi Raghav,

On Fri, 13 Nov 2026 at 10:53, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> From: Alim Akhtar <alim.akhtar@samsung.com>
>
> PLLs 4313 are found in the Exynos8855 SoC and it is similar
> to pll_531x except for CON8 offset, so re-using code for
> pll_4313
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---
>  drivers/clk/samsung/clk-pll.c | 11 ++++++++++-
>  drivers/clk/samsung/clk-pll.h |  1 +
>  2 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
> index 3d837bd74355..7b0756127306 100644
> --- a/drivers/clk/samsung/clk-pll.c
> +++ b/drivers/clk/samsung/clk-pll.c
> @@ -1306,7 +1306,15 @@ static unsigned long samsung_pll531x_recalc_rate(struct clk_hw *hw,
>         u64 mdiv, fout = parent_rate;
>
>         pll_con0 = readl_relaxed(pll->con_reg);
> -       pll_con8 = readl_relaxed(pll->con_reg + 20);
> +       if (pll->type == pll_4313) {
> +               /* Offset for PLL_CON8 which hold FDIV different for PLL_4313
> +                * which is PLL_LOCKTIME_OFFSET - 0x4
> +                */
> +               pll_con8 = readl_relaxed(pll->lock_reg - 4);
> +       } else {
> +               pll_con8 = readl_relaxed(pll->con_reg + 20);
> +       }
> +

This starts to feel a bit hacky (pll_con8 register being referenced as
an offset from lock_reg). Is the register really called pll_con8 on
8855? Or is it called something else, but happens to contain fdiv?

I think something like this would look cleaner:

u32 fdiv_reg;

       if (pll->type == pll_4313) {
               /* fdiv in <insert name> register
               fdiv_reg = readl_relaxed(pll->lock_reg - 4);
       } else {
               /* fdiv in pll_con8 register */
               fdiv_reg = readl_relaxed(pll->con_reg + 20);
       }

regards,

Peter
