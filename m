Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319A12F199A
	for <linux-clk@vger.kernel.org>; Fri, 11 Jul 2025 17:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752255872; cv=none; b=AggfI6/8ZEF4oOMFocyxyPnCjwfliz1AiTp+N95a/fd6uBFVFFocqTVElKacpORx2jjF4Mz3jsbl19k2e63kK6wQNHjakKHtc4bAkFLCYjaVJO8GIWkwA3YOwfsrKjtQR1fmi4EZGw4LHkJSimWYk4phZjTSK8MQnVPb1jP+0+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752255872; c=relaxed/simple;
	bh=u+ZM5SO8L4rZ2xYIS3dtWrMrDyHsyXlquIkrSDaXE+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y87NKmv+/iq+iuHsnrrLfYbD18S3TEHJPShfKAHHNI0nlGZqrWRsk1A12Gft5eanEwx3YsNjkcms5zURrv2n1ooPjssWocnEyqK6J/O2aH1qhpmD7u6nXeFDcL79bbyVLbnqvli0QJzc2AMF8pSUOcHKMCW58EO/R9Qi2EUJuRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RUUd4SId; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RUUd4SId"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-32b78b5aa39so21804591fa.1
        for <linux-clk@vger.kernel.org>; Fri, 11 Jul 2025 10:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752255868; x=1752860668; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+ZM5SO8L4rZ2xYIS3dtWrMrDyHsyXlquIkrSDaXE+w=;
        b=RUUd4SIdJbvakysuyj53v/ouHK9sZMKllZGJ2C8yMk44LRa+g3eH02ZWskxW10QwJ0
         RFfRpIlkxTlPVK4mN11YJWSQEebePr71rOabZTT6uaDoUC9rKzzuMRZp3yA/LbiMfW6l
         FCd4t3Kci1fx43bhYAFtq97wWLQgBBve/BAn6K09JXfcrSgKyttrpyWl9jYpL3nwljAI
         4863pNLzhlBm1lDUIv9W3t+5HiLoWquy4kxLVaGdkoeuNczFNKZbv+VnjkcacoZv9vu5
         /Gi4M7Ei5GBWU3sm/l9bfCmwWY9wnEKVFEAnXP51eGwBY5T5+RRbnCUtDb4GwtWFIr9s
         BDyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752255868; x=1752860668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u+ZM5SO8L4rZ2xYIS3dtWrMrDyHsyXlquIkrSDaXE+w=;
        b=GYlVN/kSY48Zat9DQDK1Xs1ck9W+8mDsw3ef1HBF/K+rlPITEKW0C7iij5lmKYwIH3
         wXnj0vcmtobFqhSjDdfVU+JyOPJBlBM2w9EvjtEG3om1iuGEsTe7PhhQLvWKkcfsGEWn
         xPP0V0ta6T/TKJxjxWWt9mC1PmkJonIIpilOVJZXx4KKdsxc4GFFK5vA4jROriuKOb3z
         cb9aCS0ZWAlIHkAA1oJhQjcd/qkgTTHkwVMjkC2n5pswzRUdOhJPJMpO8DzlYyJ53GkK
         z1mPJ83FTJSljobu6UhPwvWITrHp5Q+mamuJxsdt/8Xv9ooSkNmU+F6G1X7ZPHrGFeqr
         J1tg==
X-Forwarded-Encrypted: i=1; AJvYcCWTPotV0W9Zh5tFRKMPQU99A7LSfz4YqPERYJwVNo55ke+olDoX2yO0aC8Xqg0TjLH25e5AaaFlNFk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8BkTPbyKh55GesgHUKw603adDnj8aWZ969FgwYL2fCmKZovOr
	yQ/Jhnw4D02UkjtXTKvdNoQHXoDvVtZqMNIgyw274xXXW1OygrLE00aDh21XzHZDV+YtrN+rDVa
	IsCOAdCr9+b8u49OuhrhMvmCflCtzTaR4ELMoFUC2HHMxQZ4wwQPn
X-Gm-Gg: ASbGncs8f+mfyxzAO43vVmMh+Wb7Xf8LtI8o5om7vxP9txRAuy6GDH8oQ9KuannyYh4
	Wj02oIy8EqpkhsZmENVU8KFOyc2ELxqjhp4aBbSKJoqIeh4oEFDeDo/0DXVxGSm5IBevLDfLXJF
	iLhOrq1Hw3bXPmqNUtxyVRiXht69ohygH6aDwXSUh/gOjepjvhCb7FGL0iP9yZcWinqS2/bbdzZ
	eDfhcA=
X-Google-Smtp-Source: AGHT+IHCwFbr6hM4SofCoKFNuaGsZexul62ZHJaP09xPkxTc5K3eZJNMRyy9Lqm+DJrLEpWrNm0Dt8rNW5UZHZ3ILnk=
X-Received: by 2002:a05:651c:111b:b0:32a:6b23:d3cc with SMTP id
 38308e7fff4ca-3305341163emr16031911fa.25.1752255868348; Fri, 11 Jul 2025
 10:44:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com> <20250710-drm-clk-round-rate-v1-2-601b9ea384c3@redhat.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-2-601b9ea384c3@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 19:44:17 +0200
X-Gm-Features: Ac12FXy5w5LZfYTJ16GWumg6iWoXPYqfrbZ0euf79O43X2SKG618Bj4k3h1lAGY
Message-ID: <CACRpkdZus86rP1BiSw2j24eaSuMrCEorZU9Rc4ouWmmz8iaqhA@mail.gmail.com>
Subject: Re: [PATCH 2/9] drm/mcde/mcde_clk_div: convert from round_rate() to determine_rate()
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
