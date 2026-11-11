Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387796;
	b=VTZobKmoE5JRZdrHS3CURaeF4U4rUNOf2hJswfzESxPyBLbWAD23SFYzUBXJaQlj2a4r
	 gk6+nzzdrpxXTJOf6BkNNgQQAIQnRTFFmDa4gE9Vw/zs0AN6Ic+FqMp+EA3noGsJZj0JW
	 5pr9NtO1bWnKY5HpcLekY84yF4ALlUis5ONTEuBz42W8rkfdeBSTkrNVROXzdeTSQQ51c
	 l9nVL9PVRb/i2EH31ozkyq7zMF0b1lGT/gkEukMrlI56PZ5tg+OZu+SxVRXOyDKgGjUae
	 CEBYyxqqaj+9vaL1aV1HlC5Pisa15IAKon0OWy3OkWb+KjmLrbELoBZJmL3f67H7uLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387796;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=EtyAcrhFz6TUat0s1qOYaaQhKwzvg1Rh8rGqLh3fPHs=;
	b=eFNccl1YCxIx6IN+dMpQOPKi+AQZQFfwmbNflavulgRPTpI1lwVhrB5393c6FL9W9vbk
	 ayPJVxYVq4Z6BgRWbTNlxOCVEv8ZBDN6mZnudEsIsHykdRYG0QuPdU3TQ+hRBkk1Ixm8v
	 FfRnzC5NXShS0CEclnUp/egHa7FzgrxeohiDV9j3DkOmruvtoNEFb/P+7g97l4AxeUNRT
	 kKxae7Mfl29Ad0CYi7q8y501Qk4w1SmxJGiVtNEwmEweip8IlgROmESLXuBoprv8zd5Sl
	 6L3bqIUEtrwDRYC/SDhfo0d+npZ4//5xIW421JBNAlIRVp73ocUqIvmzl6SPANLPQzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bTRrewzx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8CC60A263F
	for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 09:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bTRrewzx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D817A1F00A05;
	Wed, 11 Nov 2026 09:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794387796;
	bh=EtyAcrhFz6TUat0s1qOYaaQhKwzvg1Rh8rGqLh3fPHs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bTRrewzxhyaCzp7sC4jVneZ/BJK0LUgjPKLZDedMIu9AbnSXcUBaTT9ClPDjSYnZp
	 pEuEWGV0QHeJYpHV9p9ydoxDT9z5hejO2r8sHmkKaD/JdsxWF3Ig/fEzL5OaTrrWxb
	 rRjOnM4MD+p4IrvsCDVZq/BPnQalO5QCsGMkalaL6DnWZ95SwM891GsUeTEiorYWIN
	 elV2o05SI3jnEl8a9+adz7f+s4q5fBJ4Y3apEizcwju7/pFh1Z3tjSSi7Wk5K1rLKS
	 BFtEZZtiKUpAZnAWURIKKwvUIrh+A57Ke3RQLle8sHEL6m2/37QTQf7gcXfHvVUXN8
	 deDCFWxtv9wTQ==
Message-ID: <sashiko-outbox-208651@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] clk: en7523: do not sleep in the EN7581 PCIe clock
 disable
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Crispin" <john@phrozen.org>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20261111085650.632025-2-john@phrozen.org>
References: <20261111085650.632025-1-john@phrozen.org>
 <20261111085650.632025-2-john@phrozen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 09:03:15 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [High] clk: en7523: data race in en7523_reset_update() [1]
--

commit 1564f332e9a1734f7c62abce0ffb9fd4c355e412
Author: John Crispin <john@phrozen.org>

clk: en7523: do not sleep in the EN7581 PCIe clock disable

This commit removes the usleep_range() call from en7581_pci_disable() to
avoid sleeping in atomic context when the clock core disables the PCIe
clock under the enable spinlock.

> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 24fdec2e6198c..8f63482cbb7ba 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
> @@ -689,7 +689,6 @@ static void en7581_pci_disable(struct clk_hw *hw)
>  	mask =3D REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
>  	val =3D readl(np_base + REG_PCI_CONTROL);
>  	writel(val & ~mask, np_base + REG_PCI_CONTROL);
> -	usleep_range(1000, 2000);
>  }

[Severity: High]
This problem wasn't introduced by this patch, but can concurrent accesses
to REG_PCI_CONTROL and the reset bank registers race [1] and lose bit
updates?

en7581_pci_disable(), en7581_pci_enable(), and en7523_reset_update() perform
read-modify-write sequences on shared NP SCU registers (including
REG_PCI_CONTROL on EN7581) without a driver-level spinlock.  Because the
reset controller framework does not serialize .assert and .deassert
callbacks, two callers updating bits in the same register bank, or a PCIe
clock toggle running alongside a reset update on REG_PCI_CONTROL, can
interleave:

CPU0                              CPU1
en7523_reset_update()             en7523_reset_update()
  val =3D readl(addr);
                                    val =3D readl(addr);
  val |=3D BIT(id1);
  writel(val, addr);
                                    val &=3D ~BIT(id2);
                                    writel(val, addr);  <-- id1 update lost

This overwrites hardware state and can leave peripherals stuck in reset or
corrupt PCIe clock/reset bits.

[1] https://sashiko.dev/#/bug/linux-ef84cdb6-0114-41fc-b76f-33e8bdd47a6f

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111085650.6320=
25-1-john@phrozen.org?part=3D1
