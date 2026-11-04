Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793832182;
	b=39YNcDQwuV6IKHiD+mFxQpDdL/n2Slz3EQm7bfBt3STgiOI5xSNBpuzKcKAch2nFa17m
	 arP5Mkm+gi+GjEuaXG2/NWBt5GG7vcBghcEw1uv1FhqGqpNr9LidAAIxD3ZXnELFyeLgj
	 bqnGzkiHAhPgNM0fdiSY8RZOFyDi9aAtajCQcSC6ONyQ9tqOQmCB8HXjr8HFIR/Epbqx4
	 X82i+LH4Vvl0Etm/npHMhRo/bnqFvImZj/5xV5n4+eJrfFUGA6/g6iAECv6/xM9+D+GEI
	 p7EVwovGuertQ1pjFaGzlW+bhjH1mt9cHwiGc6vqpo9nTEJrxp4Q1tQet3/Utkk4U0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793832182;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=xfCUcWF5iTPTTtnt+wRlptQerZfB/hTrl+o+h8x0xIw=;
	b=AuDiFQYwRvVxzHAsTP659k6/cGGmiWO9+2XwV7Yh1JNkB2gcf1n5TF3yQFSGr/1Arjrk
	 IJxY7qT1RGin4Q5j6aBnSk54Kev+XcHJ/ownB6Drw9jFK6o6vz3NZTaDccw9HmCZwYlaM
	 jhCgYTytroBVRWIWgN73USkOVkmjZ9p1UaA3uly2KPWzhSXDjYBdhIkwZ1MF3KtOlRZB5
	 tieJZAMZK74DKDt1kuAFm3iJL4GfZpkkTcC7+l4q4BHuiSBnodJQmtzAdLizA9XqeRJI/
	 2lYEzSzR0QsJVdQ0byHnj7ROYQWFDI4+yPRLTUXxMfriruO1q6e6YVnlRi6UTx53JBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JB5gLwpc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41DB606A31B;
	Wed,  4 Nov 2026 22:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JB5gLwpc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BABA1F000C1;
	Wed,  4 Nov 2026 22:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793832182;
	bh=xfCUcWF5iTPTTtnt+wRlptQerZfB/hTrl+o+h8x0xIw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=JB5gLwpcA3pgkb82ntBESuCnMulwhHa3nhr+vKR8DTw65EDkCuATnnz8DzOJz1DRt
	 JBfggSISEgJMnu/r3PJHzyeDDftzzCTVYvrfzRLxXxenZnUQ+A95F5LelVkNe4/J/S
	 jM/RZfwMDFSZkVZISVs51qFdNHhb+RroAEzr6GYNEDIY7OA3XfMUU9vGe0+0OTnQyE
	 CHqMIoghRj+quG3YzCPCiMvx1j4HlMDOUHUxYcddwtEtPIIMGP7GLpUpbIWfhZRl8n
	 QytCd2kSgVia3wGEsY10TJE/vIoL1wmHjrXRXy/9AR4+oEE2/vnux38cZJKNnIQx5Z
	 mM/+J8SIAyK7g==
From: Brian Masney <masneyb@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Antonio Borneo <antonio.borneo@foss.st.com>, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261020-ups_mp15_clk_update-v1-0-67da20111b08@foss.st.com>
References: <20261020-ups_mp15_clk_update-v1-0-67da20111b08@foss.st.com>
Subject: Re: [PATCH 0/3] Subject: [PATCH 0/3] clk: stm32mp1: add I2S_CKIN
 as PLL4 source and keep boot-enabled clocks running
Message-Id: <179383216216.724795.5427816189505409179.b4-ty@b4>
Date: Wed, 04 Nov 2026 17:42:42 -0500
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
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=820; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=lPLBBMLRBSUJePs+9+cbHKp8v+ePqO1f7Zw5/dLhgrk=;
 b=kA0DAAoWt9LdJ11+wIcByyZiAGrrtPChydHrW6O3SfTo3tMmeplujPzk2w4/aI39D1Rh52Ib8
 4h1BAAWCgAdFiEEpG0ycFhlqj3e3CkEt9LdJ11+wIcFAmrrtPAACgkQt9LdJ11+wIdM0gEAtdso
 FXC0bKFk9Qv2+QrKD+x6t2EGwngkfuDTOuN4A6MBAN3reACYmINUNE+/46n7+ttTDKixFvVIIa9
 wmKI4pvUE
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Tue, 20 Oct 2026 11:48:52 +0200, Gabriel Fernandez wrote:
> Subject: [PATCH 0/3] clk: stm32mp1: add I2S_CKIN as PLL4 source and keep boot-enabled clocks running
> 
> This series contains three small, independent improvements to the
> STM32MP15 clock driver:
> 
>  - Patch 1 adds I2S_CKIN to the possible PLL4 reference clocks
>    (PLL4SRC = 3).
> 
> [...]

Applied, thanks!

[1/3] clk: stm32mp1: add i2s_ckin as a clock source of PLL4
      https://git.kernel.org/clk/linux/c/57f8b36fb36c
[2/3] clk: stm32mp1: don't disable a PLL while its P/Q/R outputs are enabled
      https://git.kernel.org/clk/linux/c/fce4f8da5a6e
[3/3] clk: stm32mp1: don't disable the ck_trace clock when unused
      https://git.kernel.org/clk/linux/c/f9296c2513e8

Best regards,
-- 
Brian Masney <masneyb@kernel.org>

