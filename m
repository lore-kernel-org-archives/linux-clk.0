Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795191723;
	b=ax/9zOPxIbnwXM+uwOk+0bhH1iO0hMB0nksnFlXXRyd9r9NqePua71sKXxpQX8lwgm18
	 cq9skIRt4N+GgINK5BtKloMI9MskGX4S1EeOe6vPl5+UT6OthUf01mGdJUgWNOrgRyX1u
	 PXBvhtwQO+mS2QXw5iXggOCUxRM0NmClnLBeNvYzcW2o4OjZUZ6d+seuuHsh2cxFI1sMu
	 sIyBrXob2IEQtXyiPNyLdxwKXuAXAbvx2BDdXnX0oNrA7HBCfxbAwmspo+8VxDCYTGOWx
	 YT0n2V7vZfB1CIgZSexySzu5vVljDbL+Wt2Qcfe2R2n3WwLmirbuV7l0a9vUmFWLsyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=McN17chfwr/LQozF6dFVi78SiwnCLQfwPyBkDcQsbSc=;
	b=qgtv4FH/JX5hSDEG/cU15YKWE99jf0d6xalOx4W/i83/+IQC6bW+nwg2GoZe6g0QavUh
	 BIodbGnJ/JAjDtFIBfJ0kFKGSttwcNJ9neW1kQyF95KA9iqZwd/7RtqTNPkIunKXdsVF8
	 KUMX5Krkf00DhRwtqFQmGj+buhMVWIk01yeGAIz7wm0xZL7/LBm0+ssskS73TMExyctJi
	 h0kWp8kQDoyWpuQXeWw6Jk3qnf1KTky17jPMKdEyYkZiWYKmwoRUnWxpwmjsvZ1L22FV7
	 RFYcmGAXB4fQaUkN0mHiwo/FOF6+cxPwQE+bIAaWVW8LHHmmfU5GyKrma0BkKQZFsQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GSMVwhZH;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7331606A337
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 16:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7331606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GSMVwhZH
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4ac109a8a12so584542f8f.3
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 08:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795191721; x=1795796521; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=McN17chfwr/LQozF6dFVi78SiwnCLQfwPyBkDcQsbSc=;
        b=GSMVwhZH/ueBlJaQiJ5tBFKzOag7BCR5BhXV1vjJ6yXySEI0mT2VMeFtR8YLI3QObp
         l+9xoHrKeIBmt2kbouQcLmWeYtsw1SAQsvk19IVm1GoRn/dd5U/zC3gpB7SsC82DLkMC
         1PxNoFLz19cCa9xeO6jQ1x7QwuiDjsSlO2ve/tZs/untp7QF97TlsVV0fEDCtGEfppcN
         kyTRRyJYJMxJzqyhtxryQTDEnVcltPPWcx/qW5dbw8GLPGUI+zwUL6SyrZNl/H/CXbIh
         DN4P0fC06cQ3rv1oqcphHJY9Or07QdoJ0BJ3bnq6/b+HufHJMelC+YFHl3KH9tbwoTMF
         pdTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795191721; x=1795796521;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=McN17chfwr/LQozF6dFVi78SiwnCLQfwPyBkDcQsbSc=;
        b=mZEuSBmwhF9B5cY5ygjPYfuqbZQDYEOS+2Jk8tL3iRGwC1ijsbds+TpprtkxGZ4jxg
         fN+YlFZEGlt7W8AWyPw+YWH6lJhdVCqezEc82Ldhz1VCmX43rKrA0/fXaqEJu+TgNAXV
         EWfd90sxkF2z6oraoDWlAtjMDMuQL/jZOLSA/uDHyx4osI+NjhUTCITfycgpSJkIiBdJ
         1kzMcWhnJtkFIX7gseW8rWXvvd2maaBYldRkx82bUh0rxqXviaiXZ+ImOZY2Z7tAw3ta
         4N3OU/VgiY+y7+EGryuyH+SVxBYyB2srmTYMfOLAMS1A4Nhi6XD93IbKv9CtUlZk/1VT
         Qplw==
X-Forwarded-Encrypted: i=1; AL+hErFUCdVgVKm4VeK3qEGeBF2A2/23Y1YpUu9oSHkCwceHmXYeBrRtm1YQ5HhWFxnIC6x9Hdtv8M0+bPA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZbGS1mJaXdL9HUTKJVFZ5/2PTtR7axv/Fn/3PWWaMOzl4p9kI
	56OW9opV3MaBUYR39w01s+x3lyhBmUp2Stl4kmQn1gqZzq5uyq94f7fCtRJh1B35V9Q=
X-Gm-Gg: AYBFou1SLAn0pSqnCDyABSEYYTd0S/TJAYhF17PWk2BVdEpZm5eWzxeM19RBnoznmnT
	utmki4Tqz/WyMk4SUY3LU8HNEuIS4/qGJn7b1ZjCjreqNa/fpwtjx5YeoQj3gAbcB05vGygiY+6
	HhuVonz4ZRAO70Fu4+LYrI0I5TR8patGVdw/2lN0hW1l/+XzO5R6PGLEDvRnRqc1qU2nTCazK2c
	DD8aMcZXTEoRFM4b2aT6mK/9NZ00nJ3PH1HiBFSWCrqzuw5WwVnn7MP097JgVXJB3K2EztVlSCc
	04oEVJxHppaOedtAypvAL40aHehRURlNc8CpVD5n9m+dvALHsO8ybwHoozQpobc6Dp3WUr2Fyc8
	avfVQ3bBnSGCfhlKypzJizbT7bTISKM/pkd0vqKeCp45zVa5MoDGyPG/ZmaIZNcJbOslY0jXpse
	+WhCBW5nu/tZgVqJCoz2HhNP0FSl9oyCIxfazG8F2MHB2AzwC6tZCErjJGc3wa/Km2BZRlszgGp
	K8NgVjTDL9V1/kpgDD/dCxesWjxc8G19I7dTiIL65QFR+u+V6K1ZQtTzadeyPAhqtkfwsLe/aj7
	wWEq0vGHLRYGIQLgDmqsyrLq7iCowjaDklpiF6sdgdjZEE5f
X-Received: by 2002:a05:600c:3e1a:b0:4bb:6814:7391 with SMTP id 5b1f17b1804b1-4bb8881921cmr77585875e9.25.1795191721065;
        Fri, 20 Nov 2026 08:22:01 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm129338075e9.15.2026.11.20.08.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:22:00 -0800 (PST)
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
Subject: Re: [PATCH v12 00/10] clk: nuvoton: ma35d1: Fix mux parenting and
 peripheral clock rates
From: Jerome Brunet <jbrunet@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, stable@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
References: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
Date: Fri, 20 Nov 2026 17:21:57 +0100
Message-Id: <179519171774.3795820.6006858658982158181.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1505; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=da1CAgmUNSJ5Vw/XW6Lz4OSgqJ+yn+Z+QoMk5bui0gM=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNkMxctdWw95f775+kf6Kd3uhXaOSe5//1wwaWVeY9QYX
 yM9mbu/o5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABOxMGf4nyRy6+VEnRlFq7fI
 GagKJv1//7Hkw7/YmsPPe/Y99eOVz2NkuJ8445EhV1vDy2cFLl7ntuvVZT55xxi3U6SLM/uNTEA
 fBwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> I am in possession of an MA35D1 NuMaker board. The SPI controller has
> been contributed, but at this stage it does not work with the current
> clock driver.
> 
> The clock controller registers its muxes with .fw_name parent data,
> which requires every internal clock name to be declared in the DT. As
> the DT does not declare them, all parent lookups fail: muxes end up
> registered as root clocks and most peripherals read a zero rate.
> 
> This conversion exposed a first issue with the WDT/WWDT parents which
> were actually missing in the clock driver. I am not using these clocks
> myself but it is worth fixing.
> 
> The second round of reviews raised another problem with the
> crystals. HXT and LXT are external crystal oscillators wired on the
> board, while HIRC and LIRC are on-chip RC oscillators. HXT was described
> whereas LXT was not. The series now also takes the two crystal inputs
> from the DT: they get documented in the bindings, described in the
> boards and looked up by the driver (with a fallback for backward
> compatibility).
> 
> Finally, I was still unsatisfied by the clock tree because there were
> too many root clocks. Many "gates" were wrongly set aside from the
> downstream clocks they would gate, and SYSPLL was simply not parented at
> all (?).
> 
> The clock tree now looks much more accurate.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Looks good overall. just 2 tiny nitpick and we are good.

-- 
Jerome

