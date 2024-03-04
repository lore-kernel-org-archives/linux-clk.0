Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5F933F6
	for <linux-clk@vger.kernel.org>; Mon,  4 Mar 2024 03:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709522912; cv=none; b=LSEW2Zy7QmD4bMACJ4QiOmen3/zYOCjwda4IN0m/T/1GyFNvBhRAFcDoQrJDvJadKHhsXzVlzlhqkUBt/e3hESeALRsLCZ/vzdLJpkSDan7GPd4G3aDd6La9TEY4Ylt3YpbZXES/u6yS8Iy9x8IWkf2Nj1/8brvnXnroYzSaroY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709522912; c=relaxed/simple;
	bh=zaCqbDv2/XlXGPllAK525n20UKA8SvXsWmlKlBE+yKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EAZuXnI1Z1a/IW4wt9LxJk2Tc725jl/BxGXffocYPWuAm+7s9rMGzCjbUVmbcdhX3jmulBSsDCJRzmwW05BeiTeK5uT2FDU/8ClGZmrc6kcwR0iDLEI0pzK9XwodGt5AT3bgRFyJwusy1qOCdtxO2C5QFzLdgPYsoCL6cXbd8Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hbuelRFg; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hbuelRFg"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d21cdbc85bso46955891fa.2
        for <linux-clk@vger.kernel.org>; Sun, 03 Mar 2024 19:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709522909; x=1710127709; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zaCqbDv2/XlXGPllAK525n20UKA8SvXsWmlKlBE+yKo=;
        b=hbuelRFgOZHnVHd7ezvCqL5nmlDLAbP2+aRSYeEGPIIdIWg20iN1XchCOLNAvROCkn
         0VEkmgLACDfNPoPtmLDLoeSBMEhEKxbP43GrKzhGJCjZmIFNYX9dPLQEodX3Rm6tZ59T
         F1HQCbH5RIJTFwhn8wisfhjp7Rf3PtauKCymI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709522909; x=1710127709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zaCqbDv2/XlXGPllAK525n20UKA8SvXsWmlKlBE+yKo=;
        b=TtA4vfpR+s1+6Xc1Uip6pjB1vMF/FhftK1nvDEIaTNR7+6vGhUBzWy8mok0F0LSV1i
         beRQz/VLRXsIzlHOKMP+VZ3jK+L+Zu035Jo21ZdXzx99pGigUsMXGZ/sBfjpvvThdPoE
         9AN8DYy/s1CorTYjcJdKaoBihe5RWKDJV8QZIMQi0OtiVxSiP9hwKsR3FWOEh6cdnDLj
         Jk0os/NdAXI6TeJB0xtYssnlpteyEiK2KOqyqOQaG+g7mrkLvUQQe7YgGxLRLeVjVA3O
         KjkNjVdgKvSNBLJLgTUTFMGP1YZ0kodLp9T4w6hPhhSrPRMm4xo7AASMxWudH8mK/KAe
         Ytdw==
X-Gm-Message-State: AOJu0YwGIRvr1t1u3oCHdbqSFfkQyKkMUpSYI43pYHB5pSKaagAQhlZF
	AM9trUrqgvo0m9t8zUsY7H6bJhHRFrMwqFzumjGL2YrRn5pictEHWpdJmWTej9pWEnF/Sl1huAy
	bHEDZ8ZIpgOKILu58WfXAktADv7NkbvxV2eDfY5UIRjNmlMmWvQ==
X-Google-Smtp-Source: AGHT+IEX83GLBNJB+QNwcFIXMoTZkODExcCHERXmVIl8aUNac2twIKfR5WnaqYIhJt/pNZJVY/YxZji44acT0blrZBU=
X-Received: by 2002:a2e:81c6:0:b0:2d2:3fac:5fc7 with SMTP id
 s6-20020a2e81c6000000b002d23fac5fc7mr5106312ljg.45.1709522909066; Sun, 03 Mar
 2024 19:28:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240303121410.240761-1-andy.shevchenko@gmail.com>
In-Reply-To: <20240303121410.240761-1-andy.shevchenko@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 4 Mar 2024 11:28:17 +0800
Message-ID: <CAGXv+5HvpUpkXSZ1W+-sCiYaz6dv1d66q-j44hU0VMMwLFnF9A@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] clk: fractional-divider: Move mask calculations
 out of lock
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 3, 2024 at 8:14=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> There is no need to calculate masks under the lock taken.
> Move them out of it.
>
> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
