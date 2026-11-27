Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795809787;
	b=J9UM49im/O59g6DUcizsYmxERkuFYgrOfM0boWpq+UREZrGgLrFFyPo7dukwk4PB88v5
	 xRFnTRxcfM2EAOZFN3O/B3ilaGqx0JTiog7+C+d+mwMGc/3YqcAA+PJG2E6zkMBFKtZbc
	 7g5Hl+U79yTSuOzYKnr28R67W6HOTfUHB+xFAqSWiBmbbASuh9oQ5KfELQXreEV3A8ewo
	 L7KB+yEJrgeBZvE9Eopp/CYzB3Byq6atQz7kTZso6Z21O3GHUBW72JU7JJL5ajmxO+w5w
	 +BjIaNF+dfr9r8Rx4creGdjxSecAHIJYSiTEhB4RGrgiEqyZurDc7XoWv/mnk46K0Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795809787;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=L/E3JJyk32BLVSmJPSu88QD4Xx3KecbTtSFMtKZvIaA=;
	b=gu80C+IBZkky9TM3MJ98vn3xtDlG8QS5KAyJgn51RSD+HzsRWNcIKZY5huAi+f9IOpmc
	 b3TSd4b0hvRS9T0uqcCEBuyB2mLWzKTuuTTIe5tUjOTvSdMyvDdPnNijkY7sGb+YlGDMk
	 6qH8gq4XWyGUiiKtay358wPrrFpwsLXho26qM61kl/GyDUzb8uNPGr4JGTjJLBk37Zw37
	 AG6d6zLilGLfc7GjfKjOQXwj9mNsgiq1nrjaau9s+GKlJQGSJDp9r6BkR17fzfBZ/ph5K
	 V7dRaU1z60ewUp8LAkQSU1JKjelf1lZaOSmKtF5dqv682USp3Jm5tyQxU1YHDMxT3Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=USVugUGJ;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67185606A31E
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 20:03:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67185606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=USVugUGJ
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6bab10842f8so9959506a12.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 12:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795809785; x=1796414585; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L/E3JJyk32BLVSmJPSu88QD4Xx3KecbTtSFMtKZvIaA=;
        b=USVugUGJ0OGFei1oWOv3ixK8kXmdxW89ohPqYbYPFavNwb4jr4xK/cCB4y9hnjKBRM
         aMOvkgqxflag6ZhfKgZn6Crc/Q0pKn6tBIJr46jAuxAaLmM6loQMdtPdlzh1ApFcCcIo
         B9aE8+dPxpxuHlLdrD194YCNFEvbZV3F+cl0P53tTPOcbIF6UF8cTL4S14CNVv4DUmuA
         AEgFaEREQj2bq+B/IQqtj2BIkyBdW4uRS3Y7P0eYNo5+b5iJKu53Sp17WIb/C/drqg3q
         +O8oCjm7LKaIgd6H5wW5LXl6/Pd9/2GoHH9kdvrEAwaYwOXV+667Uk+wJ1cWl86UfOSi
         Xo6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795809785; x=1796414585;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L/E3JJyk32BLVSmJPSu88QD4Xx3KecbTtSFMtKZvIaA=;
        b=yJ4ftoJdE7qYrJ+hC+rFXiyJR962viNTpPCs9JB5JGkysioV4j1cAqjnvN9FeM+dcF
         7pvwk9Calshhgpxwkh0UBBoD3jRkmQ3GK1vKPPSgYWVPbaGGNdwQ7ni0Qjv55eScSoZt
         7XxBDU1tjJ8tLkoMqHh+rUr8F36auPDiFxO3hs6GgRZcz7ZwOjPiLU9Eo8t5kDM9H7wr
         Z9h4y94MaQUTR4XMbCxShp72hBKYMXv8gO23GyaGKs76uXRX9uSjYOGAWvyoQr9Rm8/g
         VdzHG6U0TPkanE7Xz25UITgzJB+CL/vhZ8hIPBs/XOBPISPWf9PXV/aU2MAteLguxtTa
         l42A==
X-Forwarded-Encrypted: i=1; AL+hErHvkRmJj8GHxMz+I5tcdjJV9AGUVyoIxD9kRGVIxPOb9v+Nwvrg7H9UGI5Yi8wAi+WglrX27+F1eMY=@vger.kernel.org
X-Gm-Message-State: APuU4Z83qR/Q7VhV8fw7r3JSQ5VnTYrANI4R47lUO8QnC43bHknAPM4J
	1abfK58G0CXbE/+6ajC+jGDnElOzB0GgWoUULePjLapuhDrXLMc0YfOhs8CpF3rEywk=
X-Gm-Gg: AZFdTZeIFm2BHQZkdCK6GsS67W9+iSRXg/Kd33LDYr0+NuolrybiIf9WoiqRccY6eUJ
	lUAEbR8Ff6l62ZJ82vfvxYvTgu1LlSg33mzu5jfF3Vd6cwbCfPxPhPNJ+9VWQyZT14MzDgp185M
	Bp/MY5C47/zav9j2iwCfwCmwkwatAmXuH3NZWObww2BwRt177gItoRuccomSDQVf3ZNcK+aWesp
	2m9UnQTm0F16BsnfMMNdG/9pgItZWDFYhga0gSN1a7dYFIqwjxbRajV/sjieSMdVzjIeEp8uxbV
	KHVK0Ro+hlrKB7/IdPqvzLx+82FFv1g9n2CXJl5Gk2pB3AAeRyoqr3OzCPXMYRmGJbNF9eCYO3+
	Wu3+utWbrYRhThFDlqbfhVyneyOgFayVnxJqe82F1K4BtgSOhg3TbHOpfWdTrgf511RYu+yZzPZ
	zVGd3A1OtinEiBV9Xi0SMOSnYQzc2MWjpcuY5x8uhgi3HQwe3Lx2cFDYrDKCEOfbkKjDGRnEqXV
	qFx25ISIek+IjGGErQE6WsuOubv8jQz+q/kNWsNIpCg2nm8qnykNtEgedwyopLkjTXESOKur6xZ
	uXMeMr3YzOa0qVxGbq0MyPFJ4wYUODAMPVmfTXZKoEbkCCyS
X-Received: by 2002:aa7:d402:0:b0:6a9:8863:ada4 with SMTP id 4fb4d7f45d1cf-6ba1fae103fmr14763271a12.3.1795809784883;
        Fri, 27 Nov 2026 12:03:04 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba6f8fa5b9sm9906969a12.37.2026.11.27.12.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:03:03 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/6] clk: Remove unused clk.dev
From: Jerome Brunet <jbrunet@baylibre.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Paul Walmsley <paul@pwsan.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>, Ulf Hansson <ulfh@kernel.org>, 
 linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux-pm@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <a896e5bdb29c7c6de39df9b28b11d55614f2ec2d.1795094688.git.geert+renesas@glider.be>
References: <cover.1795094688.git.geert+renesas@glider.be>
 <a896e5bdb29c7c6de39df9b28b11d55614f2ec2d.1795094688.git.geert+renesas@glider.be>
Date: Fri, 27 Nov 2026 21:02:59 +0100
Message-Id: <179580977968.3028968.220600254133838233.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=438; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=1x7I9OxtWjxbS+wEVDFGimHZA2zKBIWqfRJtzMCbXkE=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcD7/5dtokM+ZkaTF6K2ZGVttk1rMrH2fK8un5tvb9D
 fstDRc7SlkYxLgYZMUUWWq4q8XfSWp9mTVd5zbMHFYmkCEMXJwCMJH4Q4wMmxfdaay4eymZS6GK
 Z55007ypBev3ur2PCN636eTcxxoMGYwMv2pstwfXV9w7/0GsKypkd/dKC/bAd4cr1ViY1xxhVqj
 nAgA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On Thu, 19 Nov 2026 14:40:34 +0100, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> This basically reverts commit efa850487a6b6742 ("clk: Inform the core
> about consumer devices").
> 
> This commit added a struct device pointer member to struct clk and a
> parameter to clk_hw_create_clk(), but the new member was never used
> beyond setting.
> 
> [...]

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome

