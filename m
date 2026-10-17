Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430C92FFDFC
	for <linux-clk@vger.kernel.org>; Sat, 17 Oct 2026 14:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792248793; cv=none; b=fOdJLat/f/d8ndXb0yqTGF56qIx4nFYR+FL0QtuooLeGrTZ0JvUgjj2hgZUv3MklPqKKDrEOqL9tDqxlCkPOyv2m3uSMKt9sz6O8R6Bn9sO6MuxGTTnBrUOvBE/r/khHCuHuTq9WM8rcsPPgQh0Cjaa2AwKgxNWYfrHiQ+5egu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792248793; c=relaxed/simple;
	bh=Fvka/I8Qk9HOFH62SbLDTdQOv+/n4Lr6xbNErwQYZ88=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=S3/rX6XUIZLNUhddkUI78dis751BiihQvNtkYRI+Uy8YPDDbY+p+WhWPmklzPZ0UoqKiYjaS0xeBoAEHS/jL1RaApakro2UXf25wkTIsYUfaFvmXEviYTMkb0NwhdwIgtvupc1xDZf+9IGxrQQoLhgChcblvAqVU2fbCdh9p8XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=LKTrxCby; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="LKTrxCby"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso6026745e9.3
        for <linux-clk@vger.kernel.org>; Sat, 17 Oct 2026 07:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792248789; x=1792853589; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+66VnjPF/YyVU7Vru1kQeXTRwhm4W1VNOEJvI0QSylg=;
        b=LKTrxCbyQzl6s1iUh6Y5UJVUGypWfe8jSLIOvmCXW+afA76N0Q4LeyuwBoTeh9Crq5
         j3r5Y8EBs1aSOhx+e5EJiyRsOHY1T6Uqm2HLKRZVwuVKZ5szX7d0RhooxYnioqemF63S
         3SBRrnDSIYBA7Acaa5wO0YzdoDHpWPm7JDR+XvSVUbkmwi5GDWi6Zm094ywLp6pohv9d
         15BVnsLlvE7AHXGWZzsaZ1HbjZEqGLZxWN+QRzqddxswQdfkwN7rowpaz6DRiivkkl8L
         n93+jYF7ujqteng/2hIiulMnYjxjN+AvUCB9lpj3WvtfvdSSjPeuCbPFD1qQIK63/7J1
         VxhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792248789; x=1792853589;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+66VnjPF/YyVU7Vru1kQeXTRwhm4W1VNOEJvI0QSylg=;
        b=RPNsMud8FYpwJ1rIWJPVzjMzqkcohhFSQr4R8x0rOH6CPpw17iSaPa5BY0gAc3HMrJ
         XTTUvpbVmdHPSCM5xCVdqmj4u41JkG/04fF30C0neDYrpC8DCCYBnnTah0yFd40dgQFC
         TgAA/kd/cj+MoTQ5G93KBlIPKC2d7Fy6MP3A84bj4m/BQLc/YBa8KqtFMSL38zQ65bOs
         Al0tPNZ29P4V3YIFqur+Ev9U8528gwRM4SSEuHIkDZ6LcKbmZx4K4P2D/T3MBVOe/NF7
         0IFIKHWp11962WPsJi909fI8+mqlhwfa0SHTGEynl2DmfvUagotYBmDDlmEfgIHzpQMi
         xf1g==
X-Forwarded-Encrypted: i=1; AKwUvBx/NHoZxcxbV7paErgASB3IbE0JphOb2Uzwi6QP3sMIYtB1P3UZ83/GNbRkNPTZZBnl9AKuDQI8AN8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuRhMd6okhAzYcqvsYCAf/HBGKQ4igURcVhu8oL2kwdNztr9Tq
	modz4h9D3iClOBI3IYnibPQ1G/ZqVDUhyyU0NeZ7C/nBWaurM5002OgBRJPmsoO/US2MS57/nzC
	td4zNBu8=
X-Gm-Gg: AYBFou0PsouvvaTJIkQ9g3nmYa3UnaeSJphCJ4Qx4SeLTq9v/3bLtGA7n0aPFHPbDou
	mIUWPQjwsiDLpThG7MFtOiu45JpaQGTa80dYGI5KNoWaT9DsMp9AT6h9bK8SpMiKzygdMAcpezv
	fGO57q7iv7O91SrdR8BUnUh3/WLGxbm7KFwbbGqQXHMcvm9UDJPPZh7S4OKNmIIk0jC18USBVI7
	etRg2KtEqyrb/dgxVDExy+5ybGLr74jlbl+TwM1KzcXySbn4lLkI90HbnUysVHWjFxZtvDgXyZ2
	NO1dRRI9rvGg9sZwhlYoXUytXLJpdC1XC73qqbp+MhLXx5cB3jGqLQn8JxSfLQw8hqVRcmzqeQs
	Cnd98B797xvRV3sA6gQs1vxzGm3juFMFQP4wduJhn8hAC2fRaGdHh2Fweau/awAD0Jm9QJ3QZDW
	LM4KZHE5izUtqcw8x35UXJujawY71R+xNSsU80y64xGYIXpRuTleAaoHyec1DSnwhc7BBPNYX93
	z+HYDhgIkfN1yDW4g==
X-Received: by 2002:a05:600c:81c8:b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4a1d7616576mr55179145e9.29.1792248789113;
        Sat, 17 Oct 2026 07:53:09 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cbedb6f7sm148500265e9.2.2026.10.17.07.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 07:53:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v10 04/10] clk: nuvoton: ma35d1: Reparent the gates
 correctly
From: Jerome Brunet <jbrunet@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
 conor+dt@kernel.org
In-Reply-To: <877bjivrf5.fsf@bootlin.com>
References: <20261015-perso-ma35d1-upstream-clk-v10-0-47c97b54a809@bootlin.com>
 <20261015-perso-ma35d1-upstream-clk-v10-4-47c97b54a809@bootlin.com>
 <sashiko-outbox-173157@kernel.org> <877bjivrf5.fsf@bootlin.com>
Date: Sat, 17 Oct 2026 16:53:07 +0200
Message-Id: <179224878757.859276.836775392883899374.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=909; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Fvka/I8Qk9HOFH62SbLDTdQOv+/n4Lr6xbNErwQYZ88=;
 b=kA0DAAoWrRk/eyua5RcByyZiAGrTi9PIr3jXzkL3hPmoR9xxFK/1/LlW3qSqHNJrkRmkyxJ0Q
 4h1BAAWCgAdFiEEfAt7F+4ZKvSalyzbrRk/eyua5RcFAmrTi9MACgkQrRk/eyua5RdugwD/XtK0
 ki15jlcgtzwga2FiiBGlGPxqB3vuFhbG5OxU+zMA/27a5Sk09wWvbJM3JiKm9WZLUwkc6mDyoYu
 dFvDeCKsB
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-10-15 18:50:54+02:00, Miquel Raynal wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Medium] clk: nuvoton: CCAP muxes registered with 1-bit width but 4
> > parents
> 
> This is a pre-existing issue. I will wait for the maintainers to comment
> on the rest of the series. If they ask for other changes, I'll include
> this to the next revision. If not, I will send a dedicated patch for it.

It is too late for cycle for this cycle and I'll wait for rc1.

Best would be sent the next versions without the DT stuff, so we can apply
the series using the cover as merge description . It makes it easier for
us to then provide an immutable branch, should you need it for the DT side.

You can fold pre-existing issue fixups in your series if you want to,
or you can send follow-ups later. Fine with me either way.

-- 
Jerome

