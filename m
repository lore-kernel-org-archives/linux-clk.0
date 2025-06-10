Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93EC29DB8D
	for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 12:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558982; cv=none; b=KE5LiqCT3H8ECRoQVPPgOHHNQRMYVXLBkLueEPW/bYzHo4Qdw+sSlJ20nMzBPQ7CLHXPs4BkZgllksgaAuQq3r5J0PWfWa9FUYtREys8Y9ksAJnd4ufUhgoE2Iv7AgACQQgac3UGWd5JxoJShSoDc7382/N7Nint0v7sy7OKEWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558982; c=relaxed/simple;
	bh=lJ2EibwYrHKuwkGgy7UaDo0dDOz7bGTb8OT6K/FalDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GQvuV1unl8UAmY3yElHJ17dyuNp3BMywQYRSUcpNd/4Q1EnLrd1nWV6dB+WTkD2PbrkFElMzOwgQebmodLDneDrRcmg0MVJlaYj1sqJcqpxiBOryM4zQ76/3CGmn+oo4vV54001HwASzIfqpHHSBJSjIf88/EH45eWGfGfSdARo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gAdQN02a; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gAdQN02a"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5535652f42cso5524195e87.2
        for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 05:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749558977; x=1750163777; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJ2EibwYrHKuwkGgy7UaDo0dDOz7bGTb8OT6K/FalDM=;
        b=gAdQN02as9yrRwz4ViMUJk6Cfco4saDH9Z3YGj694wOeHRvPMk3W2Os4PwT+68vN5m
         t6qOe+BTok0wpf+qdSBxTNOTOndh/TZBrFSopIVDZRUtTY6IqYRgNxpQUUA+y5qCd5Z4
         8VdpWKrluhs+c/ihOfhheiQwLY8e/cBujUErW7Ckl/hff52KfQb6FW9Ejh+qnTEnoJeZ
         QYjHwKLTq1PZ2u+wz8dGbKi02FrGNQD2DKGaRguickLVqIbWFqZVSvV6xFDvfOPXgqO8
         okt8e2xwJ6eU5oiAXZ7g6vLHz9MiQ/UGRjly7RMvJDRp/IsSZPn7zSVlQjEJBDj6V5Pz
         gu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558977; x=1750163777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJ2EibwYrHKuwkGgy7UaDo0dDOz7bGTb8OT6K/FalDM=;
        b=HV2n2LckPQDF8SjZAsAa+RYch7inmwWD7lbv2CzDCKkuRch13savVzGuH5MP4G8jFx
         u9Zuyya7R74uqTZLuTveIHNtY2rPPQWUWsYP+HqMGuod7JWR8F2OnO3ZexyziaybYGhX
         /7xJ16FzhTheEv0XYJFPP04DWEGpYXQq8i2MLeJ58sYGaUmGphjxnv1cbPTjmLOBgsrh
         7UJwoqXf8OGu5PLOZ5cKOX9rtWzeGcy9BfD8CbCeR/hnHMcqcj70aSPXhmI0jl2yO7U1
         faEEi0Zec5l9U39z2qZ8358yBp18ckUZ24RnxytdeNHF8gatczN9C2iNFz+nI1yhEdr2
         2ZlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVycXfP2iEBCLh49GwHhAKsPWfcTj+TBrUQ6gouzjFQCPQdvTTheUiOs2rGOfSbZwehbxdbWvZ2KF8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZIDwmlY70q6LiK7rkLjlciwhLEkzMyTZPA04ZBHQoVaS7T7CM
	KgneCaw2+pTZeIgWFJHUsINf7643V+Cx8uGSNj6c7d/w8tgBGBj/ZEK83AuJalBNihSbLGDuPnB
	ZXAUfDc7G+YYPETdsPnWUhVTl6OarjJvFBVZRAB+WwQ==
X-Gm-Gg: ASbGncuF1oCjUPsBnPVKxZcRDA9/at0p7ez3ahDbLr32z7sNo0M0uO2wtrnSjtA1upd
	0tS4LmMepME2Dur5qM76jCxyRcBCFrkSWc+b309s/oMByJMbUt34Q6xW5wdSTjCQA5AAetDdcQm
	tR5xSKVzzAqtkPzKz3UZ7HHK4HUVwjNBIJaVT88puguXigPas1f3RhpQ==
X-Google-Smtp-Source: AGHT+IELdA+tq9VR5udoo0SjBqgjtXdlCnUFk1ZiTiteFNoU/sAmnTRRf2Lggd+JrBptHGv6llHTchs9v9E5K8zOTw0=
X-Received: by 2002:a05:6512:3091:b0:553:37e7:867a with SMTP id
 2adb3069b0e04-553947dd220mr757785e87.49.1749558976880; Tue, 10 Jun 2025
 05:36:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250607135203.2085226-1-wens@kernel.org>
In-Reply-To: <20250607135203.2085226-1-wens@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Jun 2025 14:36:05 +0200
X-Gm-Features: AX0GCFvyRHimADR81nq1Y9XLD3rNjaMG2YYHVtzY0J60cBE6h0su1u4nLP7Bn_w
Message-ID: <CACRpkdZRROZHK2nr5nx0UzwYZaoTrLLt8CzOtYWOsJg=hKoDwA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: dt: Consider pin base when calculating
 bank number from pin
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 7, 2025 at 3:52=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wrote=
:

> From: Chen-Yu Tsai <wens@csie.org>
>
> In prepare_function_table() when the pinctrl function table IRQ entries
> are generated, the pin bank is calculated from the absolute pin number;
> however the IRQ bank mux array is indexed from the first pin bank of the
> controller. For R_PIO controllers, this means the absolute pin bank is
> way off from the relative pin bank used for array indexing.
>
> Correct this by taking into account the pin base of the controller.
>
> Fixes: f5e2cd34b12f ("pinctrl: sunxi: allow reading mux values from DT")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Patch applied for fixes!

Yours,
Linus Walleij
