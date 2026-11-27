Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795790006;
	b=D3D+x/NWcAY2E0djZzXaJANiWrE6mShy/Od31J2SuXTd8VYpobka7pg0yeEZUUKqV8jb
	 2qSuqTPXT33E+z3kkJDJa94dj2AjL646aaW94aO/yqd6zfRGnOrgHNGRwaqtGiJ/3A6d6
	 rl/T6LLNbK1JgQFI2ftM8DJxvBzpbXK1Gu9t66aoBKJK2ztct8DLbw2iBLX3cm3DWSR4F
	 pJsDhDeuI3qyimc/i8rTJWdakyNyqt/bxB0HP2YXnAh5JnMmLH5D+1VvB/bb6Q9X6OrG3
	 9s3A/CKGu8nEyOh/8tdmmQeaz6dR4EoymQvi2oG6zP/gmqr8OR24qFfIhJEBavORMYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=4jk+eMtoNzyBPcbPSMP2jejnX5Q5wRK8gv8j2BTbshs=;
	b=upc6zdziGb8azM/YBoXQ1ZHMSiMp5jM9dQfqBq6JaoMXqhAi4FugSG/l9ERD7/SRnuNe
	 EZpqS2mh2B9fd/ggO/4emrsWBZOYNpMpND77f+xz24xsAlUlxDoHqjlJc3J5HX+dos3Mv
	 RRdqbHVlQCg6j8kv/fqxOHqemUOAngncDxC/Vq4GFqqma1nFLCMqluBxgmvsKHkfVIUUs
	 mZa/GeOk1zY1Bci99VI0mpPPeCMbY27v5ZjffXhwLquKpURRxPk3zN3XTUx9/faGPDBC4
	 arJ7wEJUxd2E4u/+AUmkyUMu4VKxbHNkjX40YqzQgJ/ka++BMZTfNIbUiaymEiLUX7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Kh4yhHoy;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA781606B1B3
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 14:33:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA781606B1B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Kh4yhHoy
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6ba380cd8dbso10998302a12.3
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 06:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795790004; x=1796394804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4jk+eMtoNzyBPcbPSMP2jejnX5Q5wRK8gv8j2BTbshs=;
        b=Kh4yhHoyRLyamHP4c589eGt6mFYKg+T4DCFz2chTTM2iLS+5BJgzihuYm8dycaqj+I
         D+UKNRnLeHIZdIY/Y3uM0He11I7oK8XERH+Dd51NTF/1SOfYnGyaBxSQ2sgAauQrI3JJ
         zkqBx/uP/8Y/D2R735Kbyoa2uVQRT680ZyUSO6O/OoFkfSryNOU8TtTB1iSIeSuqdGsb
         WIw2Z3oRQJS2zsXHiwiQgEC3Dh9gGMUa+P3DS0GD9kfQZu3FTWYp18ijl0xwON/f85LU
         dKCDMPu7PDFm/gm7Xlal8NbeYYPaao0MhoOWVsFcssb0EU5O4EXz46Qp6dJys14hb/mQ
         kbaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795790004; x=1796394804;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4jk+eMtoNzyBPcbPSMP2jejnX5Q5wRK8gv8j2BTbshs=;
        b=Fm3m+1YsCv3sUvlTOOF2p/PzWs72DEQ46iRfgAIxEjI6MNxAOccFpJhMeqGld31FD3
         jaxqL9/5DbweVw4v6oY0Sh6srj77y90HXUhOjKa6ifY1tZyJJUJztBmEt2LUeIAdDDZG
         w7gJfsIzGS223bMEPoyzDSI84tRegg6r2kce5hRPojV4TV1P3ZpQBF4QsakkaaXDwe/k
         xjH7phhpXejeB7YZ0TGaudIOdoE03p7Tv9FzpoHv13+Cer7iqzUU2xsFvIhdUOJ2RFmE
         iel+B0INJgassuhEBk0nmYmGecWEyQqDXfrHP4b70lcI9qPSsGY4IR7hISbF3wIvcK1f
         c/sw==
X-Forwarded-Encrypted: i=1; AL+hErEmjD1Bl610F4iUmiBa9taCQn9BR3evBVzR3sZ8jFjbiAskPgPdIo7UqMCvwLC1fpcGF+O8DaWQCuI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9C8mkzg8C6mq5wle8KFK/Nshw81Rm8SA+KPk7JGwLzRWgN8eHr
	fYDoowZul2cU5310zFRPMKmWGPOmFraH81OaAoAfd3z4nW72edCv4kwOoR0WeUXBXkc=
X-Gm-Gg: AZFdTZdaJ4Ay3i7r9qQqv68BhF7S0walYbHxmN1tliog+kedIjMFk4Zl8aQYy5ev3g3
	hcEG4jRvDP8mX3zNPm7Tsc9yyQJbBktT/s3BsN5nIo8jKsig7i8m9dfZPCIGV05L3BOuL3eQiqu
	s00x/Sf0zSv7TIhkkmOGpH+jECFcAa7b5qI1CCMB/yJvf7v3qRDl37pKYbwptDtzASy64uZEvsw
	JoqPDTD8B7LnJmwREZVvsCVBtLMnFJN1elFbqRkWBwfuk9hy27xS4jkTrVZwwAWSh0HVYIUEFRy
	BC3o58X3NdOBteoJg7ZmsI0cyBA6041OZI3/hwsb4DUMvi2hoLp60sdJyKyMaA8zIM1+KelgSXu
	42qTU9Ja6M4jfKjmbHQ08P/KSHMUII4YgDwzeiNiG1KjsuBrlS08WSIQPzv0MTb7VNaubdLGHZ1
	CzkZz1zjqYftfH137aaklfWR2GJLc2KXU0KEUsSDGL7ooIkLtRnU2kNAJqUtubVX/Rbru9+8pzg
	pofnyB/RyE6M347E6woDYtXufWqUkZEGJ1EAFFoZLprF+yCzyJ7Un6AdepW3ug8XPKr1aFnY0fN
	3hrzVsHoCrhLy7fyKil9f2JKdAZosYpFS3CKJwpUMeXtFCVt
X-Received: by 2002:aa7:c4d9:0:b0:6b5:9731:90fa with SMTP id 4fb4d7f45d1cf-6ba37cc0ad9mr13284812a12.6.1795790004077;
        Fri, 27 Nov 2026 06:33:24 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb9f8160ecsm72961a12.15.2026.11.27.06.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:33:23 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
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
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 stable@vger.kernel.org
In-Reply-To: <20261124-perso-ma35d1-upstream-clk-v13-0-c920f4a9f0ce@bootlin.com>
References: <20261124-perso-ma35d1-upstream-clk-v13-0-c920f4a9f0ce@bootlin.com>
Subject: Re: [PATCH v13 00/10] clk: nuvoton: ma35d1: Fix mux parenting and
 peripheral clock rates
Message-Id: <179578999837.3130490.1321256774164046797.b4-ty@b4>
Date: Fri, 27 Nov 2026 15:33:18 +0100
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
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1318; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=/kkh+STkW16bo61fnrALXUXLopXwJUn8icTeFUDyuzM=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcUzaJnLvllxStGv1dWD2t2zaPaXOLj2dHvMC8gu0yX
 moGSbc7SlkYxLgYZMUUWWq4q8XfSWp9mTVd5zbMHFYmkCEMXJwCMBGnfkaG06uzPxgxWazev9T8
 nBznBSb/J5mvX23n5H1avOdw6kn1AEaG219YnyTk+92QXLDoc8rr7wv2Lb6115HvlPH6mBXGqbP
 SmQE=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Applied to clk/linux.git (clk-nuvoton), thanks!

[01/10] dt-bindings: clock: ma35d1: Mark HXT and LXT legacy
        https://git.kernel.org/clk/linux/c/5cb3fcb3a35e
[02/10] clk: nuvoton: ma35d1: Use clk_hw pointers as mux parents
        https://git.kernel.org/clk/linux/c/4df94650b44a
[03/10] clk: nuvoton: ma35d1: Avoid possible error pointer dereferencing
        https://git.kernel.org/clk/linux/c/88997515be60
[04/10] clk: nuvoton: ma35d1: Retrieve HXT/LXT from DT when possible
        https://git.kernel.org/clk/linux/c/4154c8b3d3bc
[05/10] clk: nuvoton: ma35d1: Reparent the gates correctly
        https://git.kernel.org/clk/linux/c/1c2214475dce
[06/10] clk: nuvoton: ma35d1: Use device managed helpers for fixed rate clocks
        https://git.kernel.org/clk/linux/c/c31aa10b3ca6
[07/10] clk: Create devm_clk_hw_register_fixed_rate_parent_hw()
        https://git.kernel.org/clk/linux/c/5093f6f2543f
[08/10] clk: nuvoton: ma35d1: Reparent SYSPLL correctly
        https://git.kernel.org/clk/linux/c/107caca779a5
[09/10] clk: nuvoton: ma35d1: Fix CCAP muxes bus width
        https://git.kernel.org/clk/linux/c/6f6ef44a950a
[10/10] MAINTAINERS: Add myself as Nuvoton MA35D1 clock controller maintainer
        https://git.kernel.org/clk/linux/c/350f54ff5b92

Best regards,
--
Jerome

