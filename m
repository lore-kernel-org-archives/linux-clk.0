Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015018;
	b=ShEk0ArNJBGGizHGqnVPO3lNqB6IIfMZfNnTyEsgA3SmMST1TKD78oKqVs3jUyfuI3Nr
	 DBE45fPFaoZ3m6XbXxhfhpWJNzqrAh4nrZ5CIyJPlfjWzOLATIgEnWkcGKuZAVCJ8+juD
	 41jAZPlc9cWDI84cY210V3HFL1EclHx8isYQvzeSCMNwecQqOsfds1kHQCiuAObtX3SIy
	 D45qzeSKdo3i4G5g4KUDkYq4BPsffVDOCxCLhO+0JmwSB68vP4kTKe+XIQfoMusinf9fZ
	 VVCCt6BzQr5Sr27ccKhk6vTS0GJ9gpDDwBk6p0dWGIlYfxMHv0DvaAkvEi4Nzrka8Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=rOY+wdV3n8VmzgrzAHcUOOBb9IyWYRHS3lQymwFtS30=;
	b=mzYB28xdO0HwQ1hV35gI/T03QkDDUPs9Q0XSD3Wdgv2NVFAyu8qFvRIuce3hgXuQrEzx
	 3Q8unZu5WOPh5URNeQ4KuoqXAx4kUhtfEj3KtDouI8waXGttrUHrdTS+LB3Y4NwnrbnBb
	 HweDrh/NAKUZJ2iB6JGutZkMPgS2XVQlXE/Zf8RMBA2mk9i97PVIDJuaeXTbczMtF/vD3
	 YUxsnH7ecpudK1BadRFk1HB9Lg625E+Ku646uSAJgxbvOuDEEUr6C4Kf1QkMQUL7mAE7o
	 OkwEyPxSahPtZVjr76mBlcsxjy5VjLK+uDfyqKjgGh7kn3lEZujRpXRQrvgH6XWNClg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=iEWjEnyL;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8762C606A31C
	for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 15:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8762C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=iEWjEnyL
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-491971ac844so1091535f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 07:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795015016; x=1795619816; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rOY+wdV3n8VmzgrzAHcUOOBb9IyWYRHS3lQymwFtS30=;
        b=iEWjEnyLaCvEhk5M1AC5NQQlDysiyvVk+m/XObmo5r4yFRVJsV74x/mhSkir4B7qMz
         KtA2S2cd1SPHmCasNEl3YXtyCltDHfHkQAUr4PM2xp4ys0o+luBMLN1PJAT04ec0CfEO
         J1ue4dlADD98xco42qsvWjY8TeUYJ91pJNlpG2HzLaUzHGgigZ7K7BJVsf/iRHcd3/ze
         1p2ldMgEy8WXbZamZrds69/CExGXM4jkrb8GBZFPllc+UCMfN/cuXZkZBwwee6elg9GH
         /8ejWlKpm3hSAazBTMqC5VZicJkOW+eBUWv6KXgh3TTCLik9m+6JsizSQzNiQapg+xCt
         6jsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015016; x=1795619816;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rOY+wdV3n8VmzgrzAHcUOOBb9IyWYRHS3lQymwFtS30=;
        b=auMGzHBIA12myIRBmsV9XYP8SGDy5kJZAc1D3jiRjk+Mf7SF5FBT9yhimkwF2xh4fn
         9aJZF/k45CTCFbJfMxpHYp9kXX6D80ZhFg46ejXcf18pBEGbDaLVjqlcUJccezRAiD2c
         30Q6eebKlFI1Rx89PENEF3aEm1eSUiZ15fkRUJc9KvAUElL1AhVNmBHUUMEBgGCP23QX
         ujAuxlikwjWEtXzyF27QpryW89JsrWZlbo9kh3dAvneuR6oUVRr7EiLerka2hGexoui7
         qytysvcp8v8bMXA1Hx4c5Xq2+h7llEBWk9rulz0i4oOJSLmGNPlAScWa3+gxWoFZ8Epm
         NrOw==
X-Forwarded-Encrypted: i=1; AL+hErHzH/k1RG4Qmc5OfVe5PpiYU1CbQf+inVzPWlYePVYsHcMTrxuk5niOidsvhk4JphpnTjUqlIMuA+M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+K+NMWvyMD6OEz8Jks03i7cnSmxMTzdnN5hmEp6BBeN+W6EHrk
	GZ1cgV7NdfYYpzZ82LloshR8twTi+aMVrh1oZfz9/nK+mrRYjd8JOYJ/Q4wsFHlckAM=
X-Gm-Gg: AZFdTZdJw5ITrpWpR6O98LwGjWBzRusEdHWpv+LyzlgF52oEa+UeDnLiAtum2uR7qnj
	1qN3hf2j8JH3i/hx7Lxit7Mms+4xDdSw96dU+iIbNXtg0jIpOpTWjx6Rwaqw8NO0M9EmvRNfVRI
	mgzmYf8M3VpH56S62ZEnxtyTKi+fcNhv8ShycmB4R++4EN0C/0RHhzNnw19fOrsJsc+ttD37WWH
	nxqq5CCymj52d2dsxHcfAaxe7TkfqF9iWhZrc1b6dEogKemrjFUy/lGASokM9iHbyQlFGBk8Pi/
	0pv5lgoF7OPWkJ11TGr55utMmb9nCSRYImmme3Hedo5UG3GkfalICrt0YdSf+NojfmUzZDcLdaC
	YMH3oN7y4Xj/i8uglBPaZGZ9UNSrC/fdMQsFySmmmg7dBb+vyZkl4qdzYXTxDb/ivNyuPAh1CDM
	HweV4gH7rfCge39MiOBWSAhHrDAMbvFYSnWXPwoNc4o0LddhP1F8fBh0XqXINrBHhe78llJUXF6
	+5EnjWkR+9gUpY8gZtVsQLzF5e3yO39oisONI9mit5yWyRfrwKjrTaFjMTNiwaUnrYJiexuSFVX
	ILspLe0GohDGdm7YrOH8JI8c36fTOTdBNggTD1zYJxI1YLVW
X-Received: by 2002:a05:6000:22c5:b0:4a6:ed6f:7a6d with SMTP id ffacd0b85a97d-4a6ed6f7c2dmr4688498f8f.28.1795015015881;
        Wed, 18 Nov 2026 07:16:55 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2f682sm5148396f8f.6.2026.11.18.07.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:16:55 -0800 (PST)
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
Subject: Re: [PATCH v11 00/10] clk: nuvoton: ma35d1: Fix mux parenting and
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
In-Reply-To: <20261118-perso-ma35d1-upstream-clk-v11-0-bd1d1e060926@bootlin.com>
References: <20261118-perso-ma35d1-upstream-clk-v11-0-bd1d1e060926@bootlin.com>
Date: Wed, 18 Nov 2026 16:16:50 +0100
Message-Id: <179501501070.639563.9357303541273366380.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1497; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Ze/lWMxenuMFFinRWmaSX0IcexmH1tvXM9t0DvMowcU=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFl/D6bpy/0tV5+lWL51RkjKPQXn58FtMoH+f5SuWOVVn
 Q0z+7iko5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABM5Z8bwP3716cfT9okus2OZ
 8K++LlbF6Pn25IUzVn3Zf0aba1HEyhhGhjdSSyMeLDnMVr/5vvLSWKM/unu682QdT776tVq3cnv
 vJwYA
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

Hi Miquel,

We've had to base clk-next on v7.4-rc2 because it carries a treewide change
around devm_kzalloc. This was triggering a lot of conflict in linux-next.

I did not look at your series yet but it does not apply cleanly on patch 3
(maybe others too) because of the same change. Would you mind rebasing on -rc2
or clk-next please ?

https://sashingci-clk.liltaz.com/builds/555/steps/3

-- 
Jerome

