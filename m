Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A22F4416
	for <linux-clk@vger.kernel.org>; Mon,  4 Mar 2024 03:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709522690; cv=none; b=WHbEkjv3KJMPkVAg+C3fsxKRnI/TyMNiSRHcR0QjgjS0XsQKYFhxDC/r12w83haiNCHRS+aINqGoxnXhNvo01eBMwLDaMTKox6D+UyHPYtwTmy/KzJnvYNCxvdUJi8GWBpvDzjVvQjDTR5NWiV2PVwJkaPxCXlSMqb17/pTnIK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709522690; c=relaxed/simple;
	bh=BzTSepAuqFk2iwTMwG1megTwsCGBNZgyhxfUaw1EYww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UBMzynMfujVgkRGWzdkyuTrLpwl8qPWTf7me/ucwnWPBDzAte5xK4VLlgkH8SGUrtR0qZC0fnWngIel+lfdJfXbQxVhShKhrhfH0QjYtlwtjFNEd6c6alvfGy2q1TW2eUFiner6IzTbKotwF2NSGNjAAnxCLzU2opaLgDudTh9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KhB8Z4At; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KhB8Z4At"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d208be133bso52450601fa.2
        for <linux-clk@vger.kernel.org>; Sun, 03 Mar 2024 19:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709522687; x=1710127487; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BzTSepAuqFk2iwTMwG1megTwsCGBNZgyhxfUaw1EYww=;
        b=KhB8Z4AthnVazVBZVAEjV1VhR6ABdg/FOZhEbUSSUCto9mw3eNQwZHBiJGRv+JnpiA
         g8LCBQrPhmsMkO9oqSLJrnMzf0kF9Hx8aUwW4PiNGYrVYA3CMPQrQzcsRepHvkUNNZmK
         OwiQigh+IphXWBA6AgCvD1SXR7wVUTh7M/nOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709522687; x=1710127487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BzTSepAuqFk2iwTMwG1megTwsCGBNZgyhxfUaw1EYww=;
        b=bnRH7m2yF/MuJge0zrUgfumaYpAUBO+vjlq3to7PNCrWYlbg1xgaJQEg6C1cSy2o8u
         i8ARdMZXoaxYPuKqk+jNKAgOMszbhc7skGcYmY+Msx8zSY6MKTe+R4t68OklLeBjfhoJ
         +UqSvs0IuBYdKxmeNKivQCbWyOT14UyMlPs/CtUHbSOnM3S8573IQJfOWs7q7E8UuBfN
         Uhy9Js5RypzeW7hhHU3XdVRuHH1wdBYvKyl/zVV3RB98QFQ3HNMFo0okaB3r0P4/CY51
         uvLTGqdD0W5b5HpBtOEk1zTA3PPTHSVmUhQdWyI88wiDN8f2nGGhb7YqjMN2TnPygZns
         6S4A==
X-Gm-Message-State: AOJu0Yw+IVTPkYHZizzk1pkTp5ZPpJoAOU7LHvGtiQxsnpmxDSaR7icR
	GldjhQXko8OEQDbaN2dkUAstRAqw1NFq9SC970VjZXhVDWZQsgflC1ujxujsgC2W/F5ia9jo/cX
	/sRhKvvvMXwhRZHubMLgYfTHQg4XC1oq1s7z+C7/4TiJAQ+8=
X-Google-Smtp-Source: AGHT+IEaehJcwv8Ql2bnEZCwMAwZ5eA5JpRBQx0Zydi4rfkUwXK43iue/SyplevfR5G+84KJ52NkA76SuR5iNQSwni0=
X-Received: by 2002:a2e:720c:0:b0:2d2:f429:3a93 with SMTP id
 n12-20020a2e720c000000b002d2f4293a93mr5725775ljc.42.1709522686619; Sun, 03
 Mar 2024 19:24:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240303120732.240355-1-andy.shevchenko@gmail.com>
In-Reply-To: <20240303120732.240355-1-andy.shevchenko@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 4 Mar 2024 11:24:35 +0800
Message-ID: <CAGXv+5H-xLEO8A2=BbYEOzZyX9x+-0tnkV-s60x6iYTjntGw_g@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] clk: fractional-divider: Use bit operations consistently
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 3, 2024 at 8:07=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> Use BIT() where makes sense. This alings usage of bit operations
> in the same pieces of code. Moreover, strictly speaking by the
> letter of the C standard, left shift of 1 by 31 bits is UB (undefined
> behaviour), switching to BIT() addresses that as well.
>
> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
