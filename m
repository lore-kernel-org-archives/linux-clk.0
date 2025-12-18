Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535A734DB60
	for <linux-clk@vger.kernel.org>; Thu, 18 Dec 2025 15:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766072868; cv=none; b=C46BIFbogB4A1kA9eoO0Ac+AT28LBKXqiPo6+X6QN3MzY1j5F7ktsMMLXqUPG7WjyqPa7oOLVnhXLcKY2Z9nugOLioKlmTP2arfk2uOsLMZcVY3cQWHcQrUgJo7p75oLksYjrAgWRxnFgkdHFoAP9pM5OpT8Yx9rwF2jYdq5lC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766072868; c=relaxed/simple;
	bh=LzxNzF7MpItYcU3pEGmTXATHal65pD7N5vjHukp5bDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ed3eCqK9icYyHmJrv+ct2Z+91tSwv/i+UzeOlLtt66pmXwOlXzfgiHYt21TUD+D+u7+Uugj++AFgvaA+4YX+DnhGspttFqxHtLR/tubxm8FHyLwk+rzwDizMsGP6nUlqWWc4OXDc4dDJJZk6F+3GgV4+HJ5zo/6B+McUBftzx2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BggJZifg; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BggJZifg"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5957c929a5eso1131547e87.1
        for <linux-clk@vger.kernel.org>; Thu, 18 Dec 2025 07:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766072864; x=1766677664; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LzxNzF7MpItYcU3pEGmTXATHal65pD7N5vjHukp5bDE=;
        b=BggJZifgjvx24PLzSYnjQCRW8lcVGi8OQ3JZYKH1fJf+W1Yphj6PpOXaY/v+7/K3Wq
         svn7fUsuVdAD8JmSROt9ZGzmbTXjYttt2FcrmgoL0MMQc5OGRIf2ubxQfS9ZRLXP1poC
         ljDz/txTjHP5Sg82DWwHJHrkU8aPNTpnkAsintYGBGw1KwwG74ZAxbJ5/21OQAjIrT9g
         Zg4M2Xk8tsIh9wGMDbpVgX6TqPuZb1kmeYVaoYa7NNhxa5eKwL3ZW+KBSNKNbsam59hC
         Tf9/JyaokJRpw5kT9rU1gJaIl4QPPQaWLx56+SBJPNIZl8SkOVFdUvA3EUTrqZkJn6e6
         QQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766072864; x=1766677664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LzxNzF7MpItYcU3pEGmTXATHal65pD7N5vjHukp5bDE=;
        b=srsf8eefqBlhonih28qgzkdmLuV30jB+mLf5wwkNeI9rAttg0x59NOOaGIokzMhLn/
         1GYUmWeQ8MehaURHb6+VgYLrTlZT6pXcP+T+1iJKtdZjFQJjO1DQLCWLSyQ0mGA32WKX
         tft3mgt/HdhLTrpyd/jybfRzQwnAmSgqn3SqxV/2R+6xJ1gsbe0VP57nEW+QlZNko1tO
         OEz2rswwRbBzQT8hCz+C810TE8db4L9yhGPouBJLnj/5ilwVE71Ub2jxQqOMkyx7ju+r
         JSZsRIxxoogSlPBLU59qr+g5UiSAFLh+hQx07Fje7mTaaNuPQQ37zlsRMf17dRfA/adI
         fkCA==
X-Forwarded-Encrypted: i=1; AJvYcCUFwmQWKE5fGqCO8u0JtzKuO+cgVwSVjzRxUpESlMCMSm/6pxnGktGvHevCrtXuNpkRaM6Sd2zeD3w=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywis0Y4QCz3cRVZo0TykNlJhwtVibIHeS7Bl7/tLTeNmUPdKprn
	kgb6NtJC3VqVuZi9J7K667quhFaLBq9oAu9XKK5oNvaEBKUXd/5JqWLeshuAh+gUisX8+CuZ1zk
	YOLdjzQzQsSeoVMveWCBXWR4VwYZpl3U=
X-Gm-Gg: AY/fxX70GlHzpkfDeUYTBEP/k1lCdQ000EdbgPvStfsVptRp/wiL/4lq7u7xbcOhoT1
	DH9tt0PJgoqCPjQwD+z104WKmV/Ly3MHsd4WBrAbkEwMjC6CG53WeVCBByC1CuJ/niEN37kWimw
	NAMCK70FndaaND4/fwku4LbYCmd+Sh957c7PeHnhwcxG4wtdo5W7dIQbPizvE3AL4Hz3FYeIgOs
	BVbkckJSx705c+d1aJtrzo47o1f5wKLcZ0OJnt+1z6mKl+Kd/fU6IlFDrKqJrPD/bWH0q4flz27
	klTZWMPTUUu1cpeuKefincw0zTI=
X-Google-Smtp-Source: AGHT+IGrYbGUckFbA0uI/Uak1RoxWaGizxcWDMRvFWxpw/hL/+bdMgS3hQvghW4USBbg4LCsrOKENWVewsmE9VZ7WWY=
X-Received: by 2002:a05:6512:128c:b0:598:eaf8:8f5a with SMTP id
 2adb3069b0e04-59a17d573afmr14623e87.38.1766072864074; Thu, 18 Dec 2025
 07:47:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com> <20251218154412.1524249-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20251218154412.1524249-1-alexander.stein@ew.tq-group.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 18 Dec 2025 12:47:33 -0300
X-Gm-Features: AQt7F2qc4TJ7gyArwoED7PIRPB0eAsifB8ZnC9eeMqM3yyZByNJJ_XOF-WESW6g
Message-ID: <CAOMZO5CmP_rdFA=PqGSmKDU+ObzifHFDjwYMD3J67bjs0h_sfw@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: Add TQ imx8qm based board
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, 
	Roger Quadros <rogerq@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 18, 2025 at 12:45=E2=80=AFPM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> * TQMa8QM on MBa8x

This commit log should be improved by explaining the SoM and base
board in more detail, providing a URL, etc.
