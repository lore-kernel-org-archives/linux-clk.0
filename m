Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F58518D656
	for <linux-clk@vger.kernel.org>; Mon, 27 Oct 2025 10:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761559478; cv=none; b=jd7Et+Z02WH91FT1ns7AgxMtjodv0o0SBpNRk6/2FmuoCZppNbYgQoJbdbeYkS7UM0Z6bwSJBExjHzlIE8OpE4bdWj+K14sCHDy2xxWlh0VzG/lWcJlbQ4TcKRyr6wSJ/wGk99wHqa02oOrJhJHCqUzkcpOxLtVhPjR+xUSZNUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761559478; c=relaxed/simple;
	bh=bZ+q597kUNGqIq8Y48TGj7KcH72hkRPIAwT7wzsSsNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SrZAcyQGAhMplor5NU0McRg3ZmVzwXDKEiTmSXHONb510AFrgV1TWPyGJlw5kFM324QjKt6kciCDMtZLufYCXr412XELyP29bdgSqZTr5ZcIUzxj+T5yMTyPNrXLq8DWpRt7X8WMvpcpMh7v7dd+6CBfWtFFSSuREIMbmi1BVbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WD1KCBdt; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WD1KCBdt"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-290aaff555eso40948875ad.2
        for <linux-clk@vger.kernel.org>; Mon, 27 Oct 2025 03:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761559475; x=1762164275; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bZ+q597kUNGqIq8Y48TGj7KcH72hkRPIAwT7wzsSsNE=;
        b=WD1KCBdtVr6Uaf9+9XtB5USN+vvFfrFollNT/kQurwRdF5GgPxZU6Piej6sbf/Nmso
         pS3WSR2v5QqFrKbcDiAWkIf6U5tgqeh2lJ3tNNAsToEv7ldL0UerM22oPjbPXurjPPKy
         Zfh9h48ml1aDyZoqIwPT8djKKyIGTTg8iNowpKfnZ4/qWLgPq72lNYYFbu152iDyUgjO
         zyOq9DUHZUfTg0U/SLqr/LAfqxg8x+pGcheMMrfV7kR6fzZOSGG7vE1GiXHC2IZD+UTG
         MfDj/5pDUVv5aVrizCoakLxOHa8njkfTRA5kk8mTbz1nxtqF5NmyKqIXGd+8TJFPoWtI
         iqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761559475; x=1762164275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bZ+q597kUNGqIq8Y48TGj7KcH72hkRPIAwT7wzsSsNE=;
        b=F1kuPzHyCBAe8hrHkYYdBL8NQrp1v7E17BYb75aqTvOjHV0VewqWm+TOpxHBUV0fpI
         p1BhwBoD0VEB5sC65GJdlNz5OUiUdR/YPMLbKyH5OPiBeWmHryROwlkkBZymVEpPEPAm
         G2R+eIRkEz4wdiZEgjbClRSUm0rAfF4MKXw1peR12BmG8EkqddhmpvgeuX2Tydw8uZru
         bYcUdHjMHkaYu31VrykTgrnrck6ncmwtbg+GmCh/Iw4ul6NxeC65EmpqWmyASMiessEP
         U1720xUo6N2mtBR80CNdfD49ELOgeryItnXhU5WhfMujclG5tbYfdy5qmPY7wfUdhfGT
         X02g==
X-Forwarded-Encrypted: i=1; AJvYcCUEIj19Yww2SIi0A3q0fV38ABxxMxGd7xUiVZmsM5/rHiYC4qDz70qKEV1XL6M0l523lwDcu9g+GH4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFqZgY1Vwf3BiRH2W77/MYx1YmhhSsKd3IX5P/dLHjVwy+Cca8
	d1BhTKCPWS8M26mbYiDaZLtyruD87rLeCkrIYPAWiPoVw6kB499r2phDCxdTX4rTGNPK67Aou3c
	9PYUxPl/6eBM4DCw8QKFqHGWmwPeig+E=
X-Gm-Gg: ASbGnctrCTB/N8w1+12ZgYcYPd0XpBRPGu1M1QCbee29Zt3/hJvfjlnCXOR0A38O3oH
	j5KeoaRs5NUCf9naIgFpH14uNG3GMIrHBeZZe9QlBoJ3yNEfqQuqV3l8C9BdT3OZWAsFTL4WoR9
	mvyQjwyY+fsHBDJQX1XJH7j64ab/AfejWf2+YsC2fi/Makh0BYQs7xEBRSFQH0rZDtVblbbeKgl
	KZwjNzBCJtF6RVlhE50ABgsiiMlE9iE9650xvlejkr1wDKLt/OzpygMqD3CGikyPIvXpmqaFCn/
	IXVEgW/wmIlbLw==
X-Google-Smtp-Source: AGHT+IGw9d1pKeseKB3lkBBW02LMj7kEUpU+h4+fmOwbWm1TH6VnLmuaWiTPpQmTwuE7imUFGIVOUC22U7kWNosjmns=
X-Received: by 2002:a17:902:ec88:b0:293:57e:cd70 with SMTP id
 d9443c01a7336-293057ecfddmr246648875ad.28.1761559475507; Mon, 27 Oct 2025
 03:04:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com> <20251017112025.11997-9-laurentiumihalcea111@gmail.com>
In-Reply-To: <20251017112025.11997-9-laurentiumihalcea111@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 27 Oct 2025 12:07:00 +0200
X-Gm-Features: AWmQ_bkbCiTHPHYYWScVXCVLYPxiC042hgQVGHC_daQ-QvhcSia1ZdA6dYYMWm4
Message-ID: <CAEnQRZAN0Kn=3hnw6dvCDsXXrQc17E87_hRT1R78ueKh+PzKjw@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] arm64: dts: imx8ulp: add sim lpav node
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2025 at 2:24=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Add DT node for the SIM LPAV module.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
