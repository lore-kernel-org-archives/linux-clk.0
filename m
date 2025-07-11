Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3102F1FFC
	for <linux-clk@vger.kernel.org>; Fri, 11 Jul 2025 17:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752255893; cv=none; b=Dae8ehYVp0kg4PDlP3GnOt2rH8pDboAPCOC877uLqvY9kCv0KU4rygLGoOkGU1kzivWz0tOqD3TsMmljQH4RCFdEQ8rQYX+4gPAp1YwqqrG/z4mo7jF2N6zUywfwAi87eB7uJ/zQi5cRCdXsaw90xhS8DenWclMOLUgvI5cBoIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752255893; c=relaxed/simple;
	bh=u+ZM5SO8L4rZ2xYIS3dtWrMrDyHsyXlquIkrSDaXE+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m/Nhx8Ze4qjp9vtgZ0xGAQ1UYszeQorhE2L9+MaWjIKevsY6vDJ0wETsufh6+j7gx+DdtsjVGcZH9X6s25OtRxq70Hix7v/BDD9dWv3nsEoK6RC3c7Leq/ocZ0GuOFooLshyfEJtA4pSmjErmBpZT8Ah8zCoe5JkCWF3iKDrGr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hVF4bZbE; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hVF4bZbE"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32b7113ed6bso20235551fa.1
        for <linux-clk@vger.kernel.org>; Fri, 11 Jul 2025 10:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752255889; x=1752860689; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+ZM5SO8L4rZ2xYIS3dtWrMrDyHsyXlquIkrSDaXE+w=;
        b=hVF4bZbEuP4pvsIBFxaWeWBlnqNCB7BB/8a/uCD1T/DUCO2u8PBQaL5NwIZc8VVKqi
         syC4aExadO+FYZh9gUFcvIdzcjJUTQuPBU/8HO/urMdoSB7zWNXrjOCiOeFXG4D/wHHd
         jZGYvL8sLieeQ07O9T+cbLWv/U46cyOTu+nTw/8wZ554+qxc9wE2tamuPmXoJboHT1B3
         v6rxJwF1LS4Nt8F7/jCbbg5AP0BbYriPjz7wFXdPRUnILInVlChIa5JXrCX7wLJnntah
         H+RrgZ1rwnKLeBvMoSqYBoN9vxP5LJc/gSaVvAAxBkvBEY/tL519nSt/Swt65OrL/0qJ
         APsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752255889; x=1752860689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u+ZM5SO8L4rZ2xYIS3dtWrMrDyHsyXlquIkrSDaXE+w=;
        b=h3LM1y3D/FvbCtnr3IRabLvdrhciSznvV1dwO8/GYrTyKt+XsLQbCl9floJu+xro/t
         IPigS0N01JTwyl+Ucc/PkpGz75jrfSEg0/uFOD8myDSH4RcuYctdB27s++F6B5xs7VxA
         Jgf/p97285WrMs6XrwhfFYAsaHKmRmjr5mafXsneZlL+XEhJQilNT01KM3HGSKMyGNjy
         jsvUoNeei1fDVR6pdTjlWdmNsQOssFgaJMB6Oe6A3sJZba/hDlZP78ZRApm1vEpzDH4Z
         7hCqgKmn7EqsPh7yx5D7L6MBjw2hy8dbcRzwCr1zbl+hvwSOXp3j73qYVWWUezHqRrD1
         wkyg==
X-Forwarded-Encrypted: i=1; AJvYcCVpJWcpWt8RzNLgA9jFpykvkxXirrgjKpnRt1FGxkKg2ZmJZrqeuB/9GngRnEwV9bb1LHvX78fc1p4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFZtFU4XR5QY+cFaATcj5zBOg66ZO4X/IO8oH//Y6HciLXgd5Z
	SU4krhzr7u2tXUenmgxmv+EuS6Gaw0yT4FDLYkPcZ+VPkfJArAIGUUAO5isY1+EOq8NQCns4AoI
	uSyWVYW30wN/3CyG8qy00GG5ZqzJ0SByzVHRKps5BQA==
X-Gm-Gg: ASbGnctY5B5RKZgtDamzoMiFsu86Xbor/7McOEurhvPTfs2MVGR8KVcVL4jfkS7s9ew
	vkfLdYsrb2CQAVXmAd2EUhYKJShq4Cqpm4DAXlnsbNXPnlgtti7MTOKRp3DgbFq8uHxiiF6XhH/
	IeeS/9jXawNslQMUObaNxTd9VvaktmnT3Uzc1A5HOIzfG8xNcY0CvjXhPcelMKB9Y1xDSEA//qQ
	XlLxVg=
X-Google-Smtp-Source: AGHT+IH6ZOzBfHIgYUwgOc3NHyt2gji+Em8NzLEp8xFU4pLvltizLDn2SrTtw5BwtYgzrpRFDHd1anYmDStmm3/BYxA=
X-Received: by 2002:a2e:ae05:0:b0:32b:75f0:cfa4 with SMTP id
 38308e7fff4ca-3305343ffbdmr14799021fa.25.1752255889239; Fri, 11 Jul 2025
 10:44:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com> <20250710-drm-clk-round-rate-v1-5-601b9ea384c3@redhat.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-5-601b9ea384c3@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 19:44:38 +0200
X-Gm-Features: Ac12FXxUNTUQvVOGg3MoOkpShRe7WywXW6kbpP4WvN3P-CcJwwv5gR7MoObTWCg
Message-ID: <CACRpkda3R+2hhzvd+snkTGrRb-gZ8OUvzAhFE5Cg6yXfZ+E4nQ@mail.gmail.com>
Subject: Re: [PATCH 5/9] drm/pl111: convert from round_rate() to determine_rate()
To: Brian Masney <bmasney@redhat.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Stephen Boyd <sboyd@kernel.org>, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 10, 2025 at 7:43=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:

> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
