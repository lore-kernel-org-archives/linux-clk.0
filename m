Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795191725;
	b=FdqAUpA2OZjtAySuuS8lz6JfVnEoUerJbKh7/uzFV8dHE+I10Gl+eDV3jhXwxfPAcwsv
	 hgAwfQ1mj9aILPsKixlWc+0caCz81cM3+rPAP4cq6BdMZCzRIw8NQiQh2v34WK+wqnR+h
	 VseeCqlojrIJAvrG9HxaEthQnbFEIdiuDf4XdhqwJDmQGgJSb8YqFwEI2x9DOy30Oxd3v
	 /2gf0IQBmWG8a5a+k27U9TI8r20qMtttHqOD8GArJS7BNrNJuAjD76I0UDx2i6DNlFwzn
	 Sd5+N7JshNBlP1zqcqn5BvGQvIW3Moo1jVj4OSGU8LROHPA03QDEi9WU5JW0crsCFSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=5NkzGCohaIVffPUmVbi8o3XwRDdCSTTELA+pml42lCM=;
	b=i63c6g0O8dyNwz2DT5ISsiAu6SmZ3YW9/wlnzO6g1Ndt6S0PcPRHbVIHuA6cFdzb2FHc
	 IQVOM1VZgWb0no62brENhFKAoZdsMKxkDRtwDlgJ5THhjJaZ+OBd3J8ulHeSxQofsvLt9
	 MxUdEhNftxOcf4FjqnxpW5ZNObqmUlzcT3o7ntgqPAijVkG9xmcMp8TEPYFWQ+NIvsRNh
	 Wg30+y3jULtWuW58MWhnZbsP9Gc40VmX5zjg1cZ4ZUigJ7A5MPTXrW39WoLeTW6M4X0Dm
	 69INVunKftFDjQ7ObapurJY9fKvflZcsefbpOJeIZw6AZkiErGyb9uy511XArM/SpqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=OuaOZqg7;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA6F606A33C
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 16:22:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDA6F606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=OuaOZqg7
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so9921865e9.3
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 08:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795191723; x=1795796523; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5NkzGCohaIVffPUmVbi8o3XwRDdCSTTELA+pml42lCM=;
        b=OuaOZqg7afbEd1aFm1dAGau1ntKt7R5Y8qC0j+YM/CILLTi/KNw8xmTK5X2PVsH6kA
         NPpBsyQS8t4uTEaFs1PADVAE9WyvYUCAsZRYpavhYC3pDFL2xW9S/tB8jJ44lr5pmZS3
         coUW8S+YXCXTrk7C52M4DOk8AD6LzNey5X76aH4EH8l22IdfGnRpeFtr6dmAPqXUU9qc
         uvRmRO2CTvqtc8wEVEQjVimdF9JNJ/hMSC3nH/arvV1R6SB9FvYXNSDX8nEU9pXZp7L/
         VoAPQaqAntnJgZIAkyUnPYIb85nLVmakiPPi1G2Z46OLjKF9J9vovakhu+ZbDxKmrEyz
         JyUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795191723; x=1795796523;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5NkzGCohaIVffPUmVbi8o3XwRDdCSTTELA+pml42lCM=;
        b=g/UXnlEYoY7AD6M2dzkM378gCzELSTic3qcAJ4saK/lm9oARvTcd1z2bA8fJseiYeG
         FcVA/qUolXK8cuSjL1x8QjWX0YLhLGW6yQe3svYy4sKmiz7mKwBF3cwXUvvGjKjHE7ay
         DB1SlCHV7EC+JTVJ7RiCzjIf4Pze16rNvq1isGNviynaHqx+5jfMKJPlLKcnwaB2eWWo
         41DiE3irq/mn53l68z65gbZfYJpwO1Thmgywfi3Me0vLVMgVPAGwa4IxitCON+o9nWHK
         a8LM7BDvfSicV9zuzkIIMMuUI8MOehOcBg+KHkaD1wjpmRLJlbVhOKgZrqz9eQ8U9NbR
         AYpA==
X-Forwarded-Encrypted: i=1; AL+hErGgEaGI+/YV58J5oz7e5a7lx+YeZ93Nv0ZTKZ5EetVWFDWF096X24Bt3CMsD+7XzpZKknUlJjpTEHQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VITrqD1K9hS7GeGYs4NyVMAil0uHtQNWbmGWdlz14aAOzI6xr
	x5bFGfe9jNo65zb7GFqEQxrMCr34cloo41lkiGd7BuMHe0CUhE8H/G/HZdLX3C8q0Z4=
X-Gm-Gg: AYBFou1a3ouDHbufPxbLA/mub01Zxpepl4pEBm53tXYLHQNJV9dngyV8fdYmOu1jel9
	/SR8BnW3CHaq8J/45DXoeGUICiTkLyZ9LDSGSGyjTPoSIss/grgKy0dKNT9QW2mQx8c94sWVfeC
	e67AzZ8si8oEmuumScYn4JGP2Y+nrScYZpchYfM+oHmKh5xNtznAL3D5mwkAGA/WPSEBSFnsrt8
	RBz0h1vNQxztlECSoobmAttdighfkxaK61KhPch/CDnWvR9k8SReDLEvPyiRv0jmYJ/kLKJvM9e
	mS2DxXPyFqART6DLqfZooB1QtfDTngO2S0oK6cp6sIQrBGqgO2cXYbUrctbxk3mzcDLG0ngYlxV
	gkOGmQy/CjhXQdQPhiazOFKygwdG9Ly2M0bxYvQhhBA6TYtgOYjddTmvTzHjTaEkGc4Wrj/MExn
	VvjULd6yKOYbHvwMVWYhrarWu4F3+nphEI32P7Q8Ulj+R6sgrcDBAC2/lVRPab3rgOPPvvYlE+N
	0mKD+GpB2VnuOiVmE+iUD4825zwCNgRLU+nHiSNwgQCp8sKoI75cBdh1EOoYyyt7r5WnDrScF6c
	ZGBtVl51qxd4H0t1ScEMCnVCcForDOs7D45rbWUHtFryr59E
X-Received: by 2002:a05:600c:a08e:b0:4bb:647d:dabe with SMTP id 5b1f17b1804b1-4bb887c3afamr92312295e9.3.1795191723347;
        Fri, 20 Nov 2026 08:22:03 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm137854885e9.11.2026.11.20.08.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:22:02 -0800 (PST)
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
Subject: Re: [PATCH v12 10/10] MAINTAINERS: Add myself as Nuvoton MA35D1
 clock controller
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
 openbmc@lists.ozlabs.org, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261118-perso-ma35d1-upstream-clk-v12-10-bee2c8dad4e1@bootlin.com>
References: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
 <20261118-perso-ma35d1-upstream-clk-v12-10-bee2c8dad4e1@bootlin.com>
Date: Fri, 20 Nov 2026 17:21:57 +0100
Message-Id: <179519171774.3795820.3121589367853881174.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=654; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=UYAuJv9SVgURGKW/pKO2M7vMHBgjYbXz0H2zRl5sLMI=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNkMxcufFn3NUD4mbSymcPHS9iXCz8sUe2X4GLL0RHsYf
 By1gyM6SlkYxLgYZMUUWWq4q8XfSWp9mTVd5zbMHFYmkCEMXJwCMJF5pYwMj9eqR/3X/nTu9Pwp
 X8wmLIr1uLFhAkNJevMtlgmutw10XRn+V89UVdsW7afy87rS+tO36nYKuB5ZLxh/zPbCkR+ztzL
 oMwEA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> I have the platform, I currently use it for my developpements and
> therefore I care about the clock controller driver and the SPI
> controller driver not being constantly broken. I would like to step up
> to help the Nuvoton team (not visible in the diff since they created
> an MA35D1 catch-all entry) in the maintaince of this driver.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

Commit log nits:
- The subject is missing a word: "Add myself as Nuvoton MA35D1 clock
  controller maintainer".
- developpements -> developments
- maintaince -> maintenance

-- 
Jerome

