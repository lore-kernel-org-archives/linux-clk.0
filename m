Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21B020D4E3
	for <linux-clk@vger.kernel.org>; Tue, 12 Nov 2024 09:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731403519; cv=none; b=AsWB6Fu0f8FOU4Np6JaL5lU6Gvm4HAqIakslaE1PUBCCMoewEo+7q9ikhjX/vlQjcRd001zSiXpk79ALbuqcJbB36+ni74TQk2puQLwBrS/UspB1+TpUF2gvBFoTX3zqjZEaYzRHT3kukP5FDVgUDyrmOFkv98hnJ9FrRoRzyUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731403519; c=relaxed/simple;
	bh=SMgE+3sWs28SzC4Pv9fVGSgdUWm8ipB2zOE2VBvQZOM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=aUOWIakXZ7aeytigcjY/+MglG+V7sdfGuKx5fMLQJnLFlp3b32ehAvQ5NXwMwhJdsn/m8EDZwMZsUmlGratpquhiBH0yHUcI9zkSqxdsuoWAnv787cGA3p0xeL7CxSVIBkJYHUGqMrCNo1JoLrv9MEY5jZcLa+OMf8gmcQdpaXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ambXO1xz; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ambXO1xz"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37d70df0b1aso3449635f8f.3
        for <linux-clk@vger.kernel.org>; Tue, 12 Nov 2024 01:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731403514; x=1732008314; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XblwL0PzEtz1p+RH+PZoSXPcYHiVL6RcENPZ9d+EWkY=;
        b=ambXO1xzoFmaTj+pPwjaHDhSxDCqahaf21SRjcHwH+6lKNaNZ9pZ7+QLxmMEvQ/fZe
         WFLhE6Oqhofm25ovJ1AzhcYtiJ1zoxPdiXJlvpiU9u8w2ZH1bG4tLzLJnlBdIKz05j4l
         iZg/GqSSpxEzRWpkhEmZyto+CJvPbvA8TF/VraLZbI2tPhs3oFoaNIEUHR1Q6ySrk8r0
         /Tf14KEiJmIgiSuHPPlkhfooDLdcxF3ol52b2P4rxKT5PynsY+qC39qezt7PWOmymrW9
         vh0e9g2cCME659oJEuppB3HY0euMLGuGoYDc+bL/PjX+eArJhb/6Z4KwGiO1pKKK8BdN
         z8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731403514; x=1732008314;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XblwL0PzEtz1p+RH+PZoSXPcYHiVL6RcENPZ9d+EWkY=;
        b=khOQinb16Ewi3mfxLTuWYtxThd4nf88Qdw5TgIjtqO4rwc1ZPuwQlAd1uy5mdIp2gU
         7JfguMUzNftl0NAf9pWWql6GX4UHLGIIbxjvIBSXKJ3USJQNWl8XA5teozsguZqXKsaa
         Ey4y8WW9y3nR71JK1xJTY9sEtxTAaVhewWJFNi7U2O9dVc579XIEfCKNKXPkMQsdqLuB
         UGdiJ/kaG014643+WFWpMlukjIVE9zA7takmBiJ5qk/dcGORPkeanS7+Mpd0qSD5AmNK
         9n+TKrvF+HAhYiWot6JIMpuWG0zfbpUuG7IkCYrzmQNxSL6pSuMB0XMd7MylFEY++fkX
         dAuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqB1m/0edTGnvM4XDhqkAxygAOkDErak/iA0YcEn7E0FtUQcU0B31mJiI8ZEZ5cJm5F+EcBYFA9Lg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHAyJNByNRFfguvxJCA5w5C2uWb6LMR9VOdJ1YTENFkMNAN+0i
	ye4OKFZanpfxAgdQxKYOzf24nOeaW9QxpWBZqZmG5tyZ/UYV2rBaGhZERWf6L4Y=
X-Google-Smtp-Source: AGHT+IH4AWBMa8vfF0S/UtOUsgif9MEpVgNttYKPWrjNvh9pZpYY29xpo1rijWgHwhFk0PqGiPd7fw==
X-Received: by 2002:a5d:5f45:0:b0:37d:3f81:153e with SMTP id ffacd0b85a97d-381f186cbd5mr12768518f8f.14.1731403514167;
        Tue, 12 Nov 2024 01:25:14 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:50f9:1df6:c2b9:a468])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381eda04b52sm14728353f8f.101.2024.11.12.01.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 01:25:13 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Arnd Bergmann <arnd@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Kevin Hilman <khilman@baylibre.com>,  Arnd
 Bergmann <arnd@arndb.de>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Chuan Liu <chuan.liu@amlogic.com>,
  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: amlogic: axg-audio: fix Kconfig dependency on
 RESET_MESON_AUX
In-Reply-To: <20241111102932.3209861-1-arnd@kernel.org> (Arnd Bergmann's
	message of "Mon, 11 Nov 2024 11:29:21 +0100")
References: <20241111102932.3209861-1-arnd@kernel.org>
Date: Tue, 12 Nov 2024 10:25:13 +0100
Message-ID: <1jmsi42492.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon 11 Nov 2024 at 11:29, Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> As in most cases, using 'imply' is wrong here and does not prevent
> build failures since that code may not be visible to a built-in
> clk driver:
>
> axg-audio.c:(.text+0x15c): undefined reference to `devm_meson_rst_aux_register'

The function registering the aux driver was in clock in some old version
(imply was ok at that point) and I forgot to change that when it moved to
reset.

Thanks for catching this
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

Stephen, This fixes the PR you applied. I guess how to pick this up
depends on how you want to deal with the Fixes tag problem reported by
Stephen Rothwell.

>
> Replace the incorrt 'imply' with the necessary 'depends on'.
>
> Fixes: 664988eb47dd ("clk: amlogic: axg-audio: use the auxiliary reset driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/clk/meson/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index 7cb21fc223b0..febb5d7348ff 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -106,7 +106,7 @@ config COMMON_CLK_AXG_AUDIO
>  	select COMMON_CLK_MESON_SCLK_DIV
>  	select COMMON_CLK_MESON_CLKC_UTILS
>  	select REGMAP_MMIO
> -	imply RESET_MESON_AUX
> +	depends on RESET_MESON_AUX
>  	help
>  	  Support for the audio clock controller on AmLogic A113D devices,
>  	  aka axg, Say Y if you want audio subsystem to work.

-- 
Jerome
