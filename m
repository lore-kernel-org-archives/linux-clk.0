Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B122DC785
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 18:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757616331; cv=none; b=NhjxFmp1ygh9/ByE+B1qYlXQOHCIIUorlFdFCaSXTFd+Rz5Tw0QJVilk8Eb2bSSp8ST1+3m6WN1LSLEFN0TY9nXYlMQV3kjazO1hVVcDXnQr87NYoa+dbIRprdDlcSiB2JB1G5wAZNUqZ6Y9AEUlx5I2VlGCCkOhO2NA3s+HkZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757616331; c=relaxed/simple;
	bh=PU72Key0SVmvWQm9PWpGLknK5t1ThOCAfthGViLodCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D57HAnNhbxzmz1d1OK452DQRssBCd+MzI3pig9t05cNmwTJuNPJHUTO0/TfDtVqQzdZtUhCPtBOzQ6xCzZjXX6uqQMSrhstvUjdaR/moVrTpd7XpqIyNQh1tMN/xzx7zlmj3kiOLBc7mkYx8jKIOrglHx3/05WPgTnn5y6n8kOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1uxIby+; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1uxIby+"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45dd5e24d16so9946905e9.3
        for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 11:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757616328; x=1758221128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgoU6ODnHJHjlxJ7O2reyqhOrHLfmkxgDzAUfsAuBJc=;
        b=F1uxIby+n1jD+eHkASJDtKaDlKcr0uDSdut0D2oEdcPWsLxNf4XiqJdf5V13zl2CsW
         Whs0PIfU93LX4cvBT1dxLgB3ewp87RX0wPjDqwkITf4WsnNC7UhxNHBglyGD/gRLUZIP
         6z9W9OrIuEvZvuFjPkfWqky7FVlbxX7rpQtaXRgFJitnH7BLL2L2gfbCwBgV6y2+KyrV
         O5WmqxEiWBj/1B5EGxgSc5KatPJtNrx+exYcbta7liENKRxdihoGLZfeCVcF6TKhP8qp
         fayCccMwtd0008RDBI64tJmo+Mn1cAP4FojO1Z1MpjY37jZ5IuWMoqRZ4jQa663u8sun
         Rdog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757616328; x=1758221128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qgoU6ODnHJHjlxJ7O2reyqhOrHLfmkxgDzAUfsAuBJc=;
        b=n0ga3gqVsJFvXAz3hfS0vB8EaS34JbQHdP2P5krbsXUec8OgItlalAH8+WGAMsQKKQ
         6lfMIYqNBvXwojr8LPSNF4e51Xz3JB/V7GEaKy39CTRazHt72tX9NsV3eoWSw2VVEXBl
         JfDgQQZ5L1+67Pl5Rvco6FddnWhmvoPmuoGLQ73PZS/c63J1KJtCUNyy1HceY3+1oCdV
         kuZDe9n7jXx+kRa0qUlYdAN+2E7zKSavBOHO5aFx3Yzjf1BW0NxudDaE5sUWhaGTyirg
         WZCAmMDme2Va3xs+chZbfL2PnUz982/dBX3RvBB3lyzYTFfPMiezqpF6i/QwezZssmR2
         QtPA==
X-Forwarded-Encrypted: i=1; AJvYcCXsvdyGolGACBc4HMkACGBPuiOFXXJJeAcAf08vIYM5OznXNb52kToE15KJa2EwfNd/G5wmwzCrN40=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFC86f4Z1msbx3+KVAJIuExqg441Lt6vKpwM+Oyz3D51+iIvzZ
	OAjY5w85fvtUR3AWnbjyWdzoiFu7AyXdvQ7heXXrHbiat9Gm1RL+rAL4
X-Gm-Gg: ASbGncuyz5AZvJM5TlWMydAn/mFLKrs4x+3LidE66M7nZUmPXX9oiMYxXR4IxJGQSiV
	rqVhviyCX9FgkKf+DC/KOnT2LapbObAUAhjtZqiXSAP3NWiVGEeCgY+9J5K4dEe1UGjDO0jYYzc
	7b+ErN/Rgzy9uA4o/AF2Vb0+raA9LQAJVe7VFRYDs7vP0uCBY99YciqNZnm6iimj2f5J7yP9xox
	8ZvBVicYe0qfScO6N2q5wB017+AhByEWFGAkWI8wLtJmbl/yAKJ598iO+KHHdiVrvtLNmQqe8Gs
	+36lrlfu8zeWK8D+l3A1oMRn5Lsq1F6pzMR9k8DeeWX/CSXhfTcVOmaztqwGnZYQa9k00V3JeaD
	hu5SuvdWefqZYC8qBmbANF3Ltrmh4QSPOKHenFiVswypQFoPYEeEmT3QNDcJty/kwFeItba+wiK
	BSOJnE4yPN2EIaSO/n8nA=
X-Google-Smtp-Source: AGHT+IF35WXiz7qtt5E7pbWdiKdOZLXpqRy4oaXj/fJmaGWMagVTnOpk2kyKlLObTat0jClq3/mWxg==
X-Received: by 2002:a05:600c:34d4:b0:453:2066:4a26 with SMTP id 5b1f17b1804b1-45f211d008dmr7116755e9.16.1757616328099;
        Thu, 11 Sep 2025 11:45:28 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e01575fadsm36130825e9.6.2025.09.11.11.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 11:45:27 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 5/7] clk: sunxi-ng: add support for the A523/T527 MCU CCU
Date: Thu, 11 Sep 2025 20:45:26 +0200
Message-ID: <5037780.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20250911174710.3149589-6-wens@kernel.org>
References:
 <20250911174710.3149589-1-wens@kernel.org>
 <20250911174710.3149589-6-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 11. september 2025 ob 19:47:08 Srednjeevropski poletni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> The A523/T527 SoCs have a new MCU PRCM, which has more clocks and reset
> controls for the RISC-V MCU and other peripherals. There is a second
> audio PLL, but no bus clock dividers. The BSP driver uses the 24MHz main
> oscillator as the parent for all the bus clocks. But the diagram
> suggests busses from the other PRCM are used in this block as well.
>=20
> Add a driver to support this part. Unlike the BSP driver, the SoC's main
> MBUS clock is chosen as the parent for the MCU MBUS clock, and the
> latter then serves as the parent of the MCU DMA controller's MBUS clock.
> The bus gate clocks also use their respective bus clocks as parents
> according to the system bus tree diagram. In cases where a block does
> not appear in that diagram, an educated guess is made.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
> Changes since v1:
> - Added comment for "fixed" dividers in audio PLL clock
> - Corrected variable names for audio PLL divider clocks
> - Added comment for the reversed order of some of the DSP clock's
>   parents when compared to the manual
> - Added comments for clocks and resets only found in the BSP driver
> - Corrected register offset for i2s3-asrc and bus-mcu-pwm0 clocks
> - Made "r-ahb" and new "r-apb0" external bus clocks the parents of the
>   bus gate clocks, with comments if guessed which one applies
> - Moved .num_clks to after the list of clocks, making it obvious that
>   the value needs to be added if more clocks are added to the list

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


