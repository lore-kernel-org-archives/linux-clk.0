Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F8B30E849
	for <linux-clk@vger.kernel.org>; Tue, 14 Oct 2025 12:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760443430; cv=none; b=e2Z/UhjCrJyFN13oThHwfgx2ZH1watH8WBjMD1xL3G4o7jLaNlpH95yF/xbUZp2jMR7jHG2I3KPZdlZHdR1PVXerH2jjar6vJar2Rn52YQA3f6qeWVuutOFDnrxLci/LkZGhff8kVWrqvJOoL8C/jfodWhqVbYmxa5aZ5NtObbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760443430; c=relaxed/simple;
	bh=0NzeDm4YRr+qmfFJMboOlJS287Q0PmtLlAQtT9HyscU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V/ClT6UojbaAF4+wxxVYlcbXDI7wYz4KKgeT0LHfd0xJJVOYIzyPxHotcDsFSytC2vcDOGEk7Cw/MvFl8Y3WpYHfV1ytBiVecqfcEubfwvN3xDseQV4tHUiVoOc7wr35CMlEhSeg+9O+2ZFGW0Clri9J5iQqgEDW370hR01oRqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KeRbIqUR; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KeRbIqUR"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-57a604fecb4so6899585e87.1
        for <linux-clk@vger.kernel.org>; Tue, 14 Oct 2025 05:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760443425; x=1761048225; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0NzeDm4YRr+qmfFJMboOlJS287Q0PmtLlAQtT9HyscU=;
        b=KeRbIqURvSmDKHLD9BjfyIl86pAK4C1iZUq/tjbs9bCMuphFQdxqW/bAwAcKUAv6Lm
         t2wwL6yXnVXaxgrF0sLYb737SQ8RdSXjPkeXO5507NRFOtJA4msOXarJBHf2TSkPrEfZ
         pxFqUgNRQ7AKGBqXyiDY7KwpgVVKEutHHW2tS7ahbfy4iBGKMRlFQyzT/5jYpbWmfRXe
         lf/ysQHLr3QRASu7pWgUnhdiN1VaT6ddwnnzRTyJY8hWJDGJTH7ftYZHxcgmQyuu+m1+
         +N+7s27oeoUcsRHx5dygwN8+RN/TogsDtRbxTubRDheKks491Bi1l0+2JQtjj6ZQrTq6
         7KhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760443425; x=1761048225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0NzeDm4YRr+qmfFJMboOlJS287Q0PmtLlAQtT9HyscU=;
        b=LGmWUkksrFwYG6W5tJBqnBZx6xR96Zlm7Xi+apsACuNMtyt3vetreBCfNHhJeU9qMD
         ogiroek6I8INaX73r1VPL5I108cHlaeDmQFVAUFOj+qpWfjOEmDhin4FC+nwnIR9Rt1j
         dq8+g34w8LqKvn6ek1FaBSN4VSomnlfiiYl1EiPvuobbP9gCeOtkZNo8CL/0psdnHO9b
         0Dcd1WsIj2CSYl4QdX8pMEmcKMKAAxJbFJ2pX0DXCnacVhR9b9MSk5cv44WW0MK6dgBW
         5J8QjSJ5sZa4RVge0sthMHFYsFd+NUbPAJPydM/SRMUEBHeQWi/dVryJduPIDmNrUk1t
         JDvw==
X-Forwarded-Encrypted: i=1; AJvYcCXh32oqYJH3i9Y6g47y6Ar8qo64wtI5FBFS9aF/tvbb7LU6w0znEuVuoaaY8RKjEyvsCV3nXQSBvyA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ4vJ6eAqH3F8jmHxIfXFKfKhnK3xEL23H4VD0NIBhq86Mvf5Q
	tcOBHQHM7LVtP6p3cyUxRxS5SriffDOBHp3aeACJdnVcft5ZI47vbLiPvzcmYyzRKqnC+EBH8Ak
	liSGYRd7ycSs7n5pO2g4DsxLkgh/6g08n+DFDDHYXlg==
X-Gm-Gg: ASbGncv37IEaP8K0ZXwNxtOZspKL/y5QzvrshSct8p7XougkBVivxvrOZEb9ThtDhUk
	D0OKWC1XQwH5W9qhD7PHhNilaEyOjVHbPVpcsOCbN0mpoOMBEDNGyrSzQkybo+O+w9Yo039wHvG
	koIO2m5VXNqshsox8pky9y5gYm7vASC/uMdXUXrzF1VekM6XttSx+Nx/yQF1UQ4DIrZZ/Vc+5AU
	lk3LBImgc+mjshTKILYB7mOj7enq4QgmWk1Fpnf
X-Google-Smtp-Source: AGHT+IFD0BB7RH2Ep9aDetjvf52TraFr1nZFUAFZVtaRLq2brbGFG6VPJ0RQdb2vqcIUZBE6o0FGikD6X+TXoiS5UhI=
X-Received: by 2002:a05:6512:3d10:b0:58b:26:11da with SMTP id
 2adb3069b0e04-5906d8ef684mr6189769e87.29.1760443425099; Tue, 14 Oct 2025
 05:03:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008073046.23231-1-clamor95@gmail.com> <20251008073046.23231-2-clamor95@gmail.com>
In-Reply-To: <20251008073046.23231-2-clamor95@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Oct 2025 14:03:32 +0200
X-Gm-Features: AS18NWCj_bKF0VIZCo40xgE2nZcym7DwrLVXQ08YjlTg5hV9lzx6rx-fa2x4Vss
Message-ID: <CACRpkdb74fh_eFCd0MM4RK1_KtNRugLPp2yMA20FrpHq+-o6YA@mail.gmail.com>
Subject: Re: [PATCH v4 01/24] pinctrl: tegra20: register csus_mux clock
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, 
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling <webgeek1234@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 8, 2025 at 9:31=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail.com=
> wrote:

> Add csus_mux for further use as the csus clock parent, similar to how the
> cdev1 and cdev2 muxes are utilized. Additionally, constify the cdev paren=
t
> name lists to resolve checkpatch warnings.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

This patch 1/24 applied to the pinctrl tree!

Yours,
Linus Walleij
