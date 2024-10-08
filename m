Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66277DA76
	for <linux-clk@vger.kernel.org>; Tue,  8 Oct 2024 09:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728378734; cv=none; b=NU6GfBWdr0GAf1wNEt0js8jqejJuytBkFgHpc/R9Q+z7z6Jq2/Of79qrQ9eB29IiAPxfCXXKZc/NT+yx/FUT0bKIyxAFjkHOj4EEQURLlZJ/wcyx+8o6altm62ecVyxonGVTSSMZE9pFRs/SgBEzNFqx8op/Ibzq+dd6jkVfxnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728378734; c=relaxed/simple;
	bh=8R5mNUaqgWhw+SjU51bMScNSOuHChqgNVLLs9a/h8UA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BWFBH3V6QfP4VBZD11jKeHUarrpEUum4Z1PN/ixRXRNyLIbdC4p3Q0b24eK3fvXo5v8o2VpqpLnk4rAdqQKTDB+qsGQAY8sTXrSW+IXL9oZWwHMm7JGCFF36yxf8MGv5ii28P9mfcbtm7lD3QZzdxKP1dnc19qfNY5cAceXfcYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hl9pAJpY; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hl9pAJpY"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fac6b3c220so69489811fa.2
        for <linux-clk@vger.kernel.org>; Tue, 08 Oct 2024 02:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728378731; x=1728983531; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8R5mNUaqgWhw+SjU51bMScNSOuHChqgNVLLs9a/h8UA=;
        b=hl9pAJpY0OMPoMPkT7x5fnU2Hc8B6zbOcLs6m5ueHzuUebAtQgCHTXN7vtw7UEVw04
         fwqtRafXO0gImfVeJTFL918TVIgUE65xoMc0LOG/LNbteAM2RgFRObJpozJejnKpOIDv
         bOBrcm+HDcvri/38HG/xIgCt6bZyDQA2Wx1RthPkECVA3crNg5JW2enQpFOY2/ZhhT+i
         xa08LO1PhKbUa4YdV2kez3P3ZFMWsUBwM/p2grz1j+NqQyKNfML90eM8UN16aR0ipjA8
         cprRIdRjfBqwaCDE6rE4iMjzZ4rdRrh/AEzHVAEoddEimYEnv8fksD1JZcSvrTm5biju
         rzdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728378731; x=1728983531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8R5mNUaqgWhw+SjU51bMScNSOuHChqgNVLLs9a/h8UA=;
        b=i+KInqAsjGPF66VFFqcSfYIrNSVbg+8Bcocho19Z6jDjOnaVF/BzKUwSYlGk+8cmvw
         6u/VELH6NQwczP+SOHTK1/L8RI/FmpVYRk6AcPZN/ZMERGIsy570tPhzvGsLvJmLhpQ9
         kAK1ZBs3fbGnD/MOsWIhQZ9yOPojRPIE0oHezouDj00y6NESpMhzsoi39bve6T1OVWtX
         XCogwqCpDrLWTR1V2Zs7/cIvoeOCqN/CSRtoTbK39pimiU+qD9DVnMHZLYUV+zHBL9O0
         oZ+unfEXHaAnoI6Kp+oHh/SaK0SH2hEIZORbh60xLpRDdxz9QFCp5w/hUX/djf98HgxK
         NZMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsNISj0eNIB81KKH03lVmy3U7+xEAperp3uXQzzu6M00Rh+VIpWy0XzzW4gEBptWNlSNxK1199sQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyilmmFVrddU+RMZz97Wj890HilsYcjeGd8XiepukMPQydK1scL
	2WS8Gv/22QCma/Hh5eK4+Oxa9p2EH7kLO11gg8RSlqiaSxt56XBWhJJqS5+mODVJfRWSlnDjhBM
	zDclChBJJL+Kvz+cgrL9aAPhyzVLXJRgxA/IhVg==
X-Google-Smtp-Source: AGHT+IHcBA2jTE1QM6JyuIGCT7tc+Sb9Dr7eXCmaROonw0Ss9mIeMA8MiXWox+luFXYNnTEtJ3oq3bBdjFrsUAeO2LQ=
X-Received: by 2002:a2e:e01:0:b0:2fa:cdac:8732 with SMTP id
 38308e7fff4ca-2faf3d70720mr73174491fa.30.1728378730928; Tue, 08 Oct 2024
 02:12:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ad82005d-729d-4165-afa5-61ca82382bc5@app.fastmail.com> <20241008084744.30819-1-exxxxkc@getgoogleoff.me>
In-Reply-To: <20241008084744.30819-1-exxxxkc@getgoogleoff.me>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 8 Oct 2024 11:11:59 +0200
Message-ID: <CACRpkdaPBH1CE0YXGMKUDQWyJQTZvkYgnW=UTO2uxWmBvecu9g@mail.gmail.com>
Subject: Re: Re: [PATCH v6 0/5] Initial Support for Linksys EA9350 V3 (linksys-jamaica)
To: Karl Chan <exxxxkc@getgoogleoff.me>
Cc: arnd@arndb.de, andersson@kernel.org, catalin.marinas@arm.com, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, konradybcio@kernel.org, 
	krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mturquette@baylibre.com, robh@kernel.org, sboyd@kernel.org, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 10:49=E2=80=AFAM Karl Chan <exxxxkc@getgoogleoff.me>=
 wrote:

> Also Other linksys ipq5018 based rotuer is capable of booting arm64.maybe=
 i could rip the
> uboot from those rotuer and flash it to ea9350 v3 but i dont have another=
 linksys ipq5018
> based rotuer.

It's maybe scary to reflash U-Boot.

But you can boot a "new" U-Boot from U-Boot, so if you can compile a
U-Boot with the proper hardware support and the RMR quirk, you should
be able to boot that, and then use that to boot Linux into 64bit mode.

Yours,
Linus Walleij
