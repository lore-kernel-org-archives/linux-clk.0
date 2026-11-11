Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794422494;
	b=DFBC39fr8MSxgJqFg3ZdFnuV1Gctx2N0/fAOshJu9yAa8bMi92ZCGuSofdgqP/NNga4g
	 +Q1x2jIzNC/542nSKu1IBmp1Xtf7/m9JDSevz6viSf/QlfQefWBFrAv81K7lAn2N+R4bD
	 sZrscc53k7bCCq4V/JGmoAuh5SoJGMkwpdciwEb1wMvsxmuUqlsjlYzoMM2BZR2AceMF9
	 zo5GdlUWd7zbhukbYUIMuSlN9/DsD3etOnK5ybKUeKLhypUJKBiJkUuFy1H5XI42cw0bM
	 tFmx7+yzgiAk8vJeLiWwExmQzG1Dk7A+joKUA5QNSnuhNI2SCNWjSOWUSwOfAxJM1rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794422494;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=xTXQ+K6bKfHcSVu5f9pbBenxXH0GmdKJ76xc2gthZ80=;
	b=P3EWph3bVHwSTok9fN9EkbKo2x9DeYYAkFMaRZEGhnIL349MDS6brAcTsSABxcojLH66
	 +wmuNEq78w62ow5W098ZDO/Xbz/HnYGMlWJRP+ruj/NC9+s9ZOYLfb3llR11tbpthFg0W
	 aT6a9epxDk8YFpIrKfbdKxfPhlLiANj6tGZs5jVhEdMcVyULrckNFMJGkxC6OqXj2GZ5h
	 Uq2+PNXHnkOEczYWSDgBhFiKsPiAovkec+lyOxTHEaBUHfio4yRDIYfcsU76ZvbdLWWKF
	 L5+/wrMjhRRaLuvEO386fBE+efNwuZZqiTUB+OZ+dAmXlWsnsqhY0q3F9vJ2GTNkiUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S+98xZrr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC1E606A327;
	Wed, 11 Nov 2026 18:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S+98xZrr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BC311F00A05;
	Wed, 11 Nov 2026 18:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794422493;
	bh=xTXQ+K6bKfHcSVu5f9pbBenxXH0GmdKJ76xc2gthZ80=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=S+98xZrrUo8W+M/7EKL3I35qoCxTQxd4KSQFz65mf902WUvgn7/OH4nqJuFKwj5B0
	 WnOONZA1drSZ06lmSP34VQD38SN3IkHZ90fAkVHe23OvhvT+DGpHb39de2Mxvdj665
	 5AmVCE1oPD2Jkm+KypJrzKYdjF0A5yYf5GzbmCuGMLnmAJozm2u9K4fjEfMV+K3oD9
	 xSamhzlYhLb6cnf854uNMYHPc1lmXYi3dsc2OC6uJPr/8OT/UolnPK35J+obPmu3ew
	 pPhrPCneE4Pf7jQGrNE755AoJZz8skWX7e/ANLkhC7iuP1U4/pYwpA314vQowZkbN1
	 7iy+aajxWrDXw==
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
Subject: Re: [PATCH v2 1/3] clk: ingenic: Poll JZ4780 CPU1 power status
 atomically
From: Brian Masney <masneyb@kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Paul Burton <paulburton@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 =?utf-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0_=28Zhou_Yanjie=29?= <zhouyanjie@wanyeetech.com>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, hns@goldelico.com, paul@boddie.org.uk, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261110043131.1985993-2-f.fainelli@gmail.com>
References: <20261110043131.1985993-1-f.fainelli@gmail.com>
 <20261110043131.1985993-2-f.fainelli@gmail.com>
Date: Wed, 11 Nov 2026 13:41:18 -0500
Message-Id: <179442247882.1131744.13316822371180932611.b4-review@b4>
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=1700; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=gJ6MhXcQ2yLDb5+SwqVCshSlFvqYQJmFrKVhusOTjsU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLK+bDvv8PIlz/KHjGlXzMz/2aottnuux/u9bfeOOXnSV
 kdEAtNmdZSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCRVVkM/1OnhXhHTLzae7Fw
 SYrHHTH5jl1i7xaEax68l/lhwc8lN3wYGd7ZfP17V6s7QeyWnVn3jqW7qy8ah5z3dP58ZKvCzfi
 TFTwA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Florian,

> The CPU1 clock enable callback runs under the clock framework's spinlock
> with interrupts disabled. Its readl_poll_timeout() can sleep between
> reads, which is invalid in this context when SMP powers up CPU1.
> 
> Use readl_poll_timeout_atomic() with the existing interval and timeout.
> This is a prerequisite for the JZ4780 SMP bring-up path. The original
> CPU1 clock implementation by Zhou Yanjie is already upstream.
> 
> Cross-built for CI20; the subsequent SMP-enabled image brought up both
> CPU cores. Development and validation used Codex assistance.
> 
> Fixes: 6673db4f3f26 ("clk: JZ4780: Add function for enable the second core.")
> Link: https://lkml.kernel.org/r/1582215889-113034-3-git-send-email-zhouyanjie@wanyeetech.com

Cc: stable

> Reviewed-by: Paul Cercueil <paul@crapouillou.net>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  drivers/clk/ingenic/jz4780-cgu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/ingenic/jz4780-cgu.c b/drivers/clk/ingenic/jz4780-cgu.c
> index 1e88aef7ac0f..f5983033583a 100644
> --- a/drivers/clk/ingenic/jz4780-cgu.c
> +++ b/drivers/clk/ingenic/jz4780-cgu.c
> @@ -242,7 +242,7 @@ static int jz4780_core1_enable(struct clk_hw *hw)
>  	spin_unlock_irqrestore(&cgu->lock, flags);
>  
>  	/* wait for the CPU to be powered up */
> -	retval = readl_poll_timeout(cgu->base + CGU_REG_LCR, lcr,
> +	retval = readl_poll_timeout_atomic(cgu->base + CGU_REG_LCR, lcr,
>  				 !(lcr & LCR_SCPUS), 10, timeout);

Since you are making changes here, please fix the alignment of the
next line with (.

Brian

-- 
Brian Masney <masneyb@kernel.org>
