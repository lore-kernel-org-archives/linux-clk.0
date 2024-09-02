Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90622AE99
	for <linux-clk@vger.kernel.org>; Mon,  2 Sep 2024 08:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725266035; cv=none; b=NYX7uR6j1q71C4zeWQF+g0VLf/HkfwEa4pgFmJJbW5FsUu/ZyO+1tRAjGcDtcLSa8VEyvv0rdPEIhKPrWLPhwRY7a3sRpTxkNNwOj8a/FzOVTbYOGblbyli5fG80e7wNiagSmqu9bpJr0No4zmC5ilDZbWzkRt8NG+s9OMH+XQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725266035; c=relaxed/simple;
	bh=zrv086Fdv9w35daxdi6hHW2giaN+qyNFa21Z0q4DoZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GHd0YCwQorrfdubnUJknwcus3wQelsK4hgbKXR9dGj8hzfWjMkijZ4MrrizI8K0TbDzphxq0rlMRvRHUYwdlHhjg3oakCQDIq/3acRJTNbfc1rmPF0GknJ0nvW2kvGnzlsyjf312xBkkVm+2lweP24pwoLmmNISK2xuwKh5tVKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jYOjl+0A; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jYOjl+0A"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5334b0e1a8eso5182948e87.0
        for <linux-clk@vger.kernel.org>; Mon, 02 Sep 2024 01:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725266031; x=1725870831; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=goZxaS9ZQb5+JNlLUTZNbTEFCx+Y5sRzY+bt3xQbfq8=;
        b=jYOjl+0AcPqri4YkwLEYNf6WxPMylAw/SUhWSkk6jJEiaXeBGDzs8bT3wtRAjLsGaZ
         2DksmifeiG9dfc/fRRuMMgZ1D6u/Qsc6En2AtUw+onzkMdNGJ4I2sDNfRS5wF2xqFHW2
         A+/84UdxjHj3DtNEcBHM84l+rp+5ZlNGt9OItWsMtzV2PtS96VRjjeOgLJVrflccPXdf
         JbsieIwJHbZ7Oyihgk/TGrvwfgJG2DyVniqomFXrtGrk12kHtXaPG46xee9OIxCJqWe7
         8iFv2crS5cN4P22OCftYdiTxqwKl0Df3RSJYhFj513qvQdWsNjI5Gn95JSk1NuRcgxiF
         It8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725266031; x=1725870831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=goZxaS9ZQb5+JNlLUTZNbTEFCx+Y5sRzY+bt3xQbfq8=;
        b=dtz9r2WOeC/Smm7bLX4aU+lPuK+vu8taSx+C0WBvLlOl/jb00hzjHaxBlRdAfb3gvd
         NPAzXVIAEKaWCcwAksoXAWK1peBogVMfHa/vp68DG5JrJ5yLNCYX1CqEZ7An6oWkntoU
         bslN6O7ah7deqCMK+D1d2oLX2cAjKKXinAb+IknlyYS3CKQ9eaQowGrrscWXEsvJk6Pi
         ORbGm/xpOWvGxnxHIWU07oRNo32lS2C/uUuK6Dv7h0mux1uQsQ6VZPmXXTDSFNeMe5yf
         7fumlxsDfye3B8nl1NPplyo5B5Pi2PDhjIfGXJYvNm3UdyVNbm6c5bZybRu0d0GxyIrP
         S4sg==
X-Gm-Message-State: AOJu0YyyV64ElxJqe14jMXl2bFgoPf60PxmmqbNZ86hnPTshalbHH9HR
	Q8qUr8jh40a4TPb9+t4b+IbNr8yyWnX60OW2y2UQqCVTjPSJ1fuxdLXUcsaDvaQAxaHqwoVVN2/
	yv8d9yulgb7fJMu+QXOZRvrV6u+LGUNL8y6lbpQ==
X-Google-Smtp-Source: AGHT+IFKRDHwzB9Quu4PF58ILc2a/dguARhk2kJwxG3I8e6vD/m0GzTIkGdk+QIAGoeC6Hg1Qc9gjF6NjrTW5KKvYuM=
X-Received: by 2002:a05:6512:3f26:b0:52c:df3d:4e9d with SMTP id
 2adb3069b0e04-53546b8d6bfmr6080640e87.37.1725266030043; Mon, 02 Sep 2024
 01:33:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240805-clk-new-helper-v2-0-e5fdd1e1d729@linaro.org>
In-Reply-To: <20240805-clk-new-helper-v2-0-e5fdd1e1d729@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 2 Sep 2024 10:33:38 +0200
Message-ID: <CAMRc=MdVRdy7tBcx0RiQG8uGf9gDzGTRL7XrXDtOkDxss4et4A@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] clk: implement a new managed helper and add first user
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 10:57=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> I'm posting this as RFC to see if there's any interest. I noticed that
> some drivers do: clk_get() -> clk_set_rate() -> clk_prepare_enable(). I
> was wondering if it's worth factoring this out into dedicated helpers.
>
> This series adds a new such helper for the "optional-enabled" use-case
> and the first user. Let me know if this makes sense.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Changes in v2:
> - s/EXPORT_SYMBOL/EXPORT_SYMBOL_GPL/
> - add a stub for !COMMON_CLK
> - Link to v1: https://lore.kernel.org/r/20240801-clk-new-helper-v1-0-81e9=
338b7b17@linaro.org
>
> ---
> Bartosz Golaszewski (2):
>       clk: provide devm_clk_get_optional_enabled_with_rate()
>       Bluetooth: hci_qca: use devm_clk_get_optional_enabled_with_rate()
>
>  drivers/bluetooth/hci_qca.c | 24 ++----------------------
>  drivers/clk/clk-devres.c    | 28 ++++++++++++++++++++++++++++
>  include/linux/clk.h         | 33 +++++++++++++++++++++++++++++++++
>  3 files changed, 63 insertions(+), 22 deletions(-)
> ---
> base-commit: d6dbc9f56c3a70e915625b6f1887882c23dc5c91
> change-id: 20240801-clk-new-helper-7853f662cda1
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>

It's been a month. Any comments on this?

Bart
