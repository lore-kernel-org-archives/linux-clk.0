Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539923;
	b=HU06Mk2kRSl4MRTcMvu0v/NeWS8UNFXdq8g9W+0w3OCyw5DRk9iOUQ3fMltqXyoq6hCs
	 6WSUmG2O5DufrQ1eux0cqyRokjm2p7f3M2U85QCAye2bJfIrNfu0N/2TaQuhpdwzWm5p8
	 v5XU4yhEUjga8/9WSQ3kL1Z/A1z54P+mnTUxaA1R8b8G6mlpM8PY3HFmUkUVLYR2ypB1k
	 7zy6hyRBWhvcmz0a8nJz0PfYURl3+sTH3JoM0Rmqn4WKulIO3kwvKYDRq7mnE867bRtNq
	 14BZ5MVm+siROYSdsVngduGOMpb+QLqyA67gZ8pOtgWg5vLRQ/iR3dfLc92KgJBZh+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539923;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=f55T/kSrDNSJkxy+qhEwPTiybH8m19I0GJ1bu1KYWII=;
	b=gEAsIOezVuae8QoseeOb5Zi0dgkmCPUjZEmNDPaCtu1CgUjK0QqsT2jmImxa46KK/hOB
	 eUddXhcbrjj51wxrZXTx3pXOfyQcYtWRx9QvWzFaXRHgT36GFdrCYWmAmuwvFMG7NfuqP
	 wbB+0MEPuePiFHFV3wBKXuN0hGhQtDObP60fNtvXhOb1HEceN81D+uVZ1bvI3P6fh0y8q
	 lmw/lr8Gw4OchuLE8/LIZ2wD/kYA9oZm2YPGBmr24YZOxmP+wEn81Uyijv4aEx2rQXEFV
	 CiNvtM4eW6F8ZKN4mFQjj74ImSW76bfMubOh8swb8PAO5YdfmyjbTjdYXpusd/Vw8Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PrywwkvI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0188D606A31E;
	Tue, 24 Nov 2026 17:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PrywwkvI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5913F1F000C6;
	Tue, 24 Nov 2026 17:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795539922;
	bh=f55T/kSrDNSJkxy+qhEwPTiybH8m19I0GJ1bu1KYWII=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=PrywwkvIpITuAreH8ygZnvkGEsjQ7GOqvt81KWLw7redTIGsMgYIRfkKKPRGv64qc
	 kt0jVizZ5ZIqs29K3pgvXMK924RLSIHXmJpXTcyR1TZsMHdlQj8euytWmTA8hTGPsI
	 +2YHIgawafwdY1uqQGFwP28je3usaDVCOdqykG/t/dPA3g1GVXJLF0Te5D2GhoaYFZ
	 q5oTOjmidpISfy1PFDdy8S/M4z1mXQczY0qg0GdRqVxnSCldRKFfEtjmyTR8LtJlIl
	 ie3xf+3gU5DEGgw7xCPJWQ4HVVTdqyC0MNuDynX+9B938P9H2ajylLioeyN37XJE71
	 Akv6Icl5FvPZw==
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
Subject: Re: [PATCH v5 1/6] MIPS: Add support for Siflower MIPS SoCs
From: Brian Masney <masneyb@kernel.org>
To: Joseph Telaak <joseph@telaak.dev>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Paul Burton <paulburton@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261123-sf19a2890-sysm-v5-1-4ba44a0db17d@telaak.dev>
References: <20261123-sf19a2890-sysm-v5-0-4ba44a0db17d@telaak.dev>
 <20261123-sf19a2890-sysm-v5-1-4ba44a0db17d@telaak.dev>
Date: Tue, 24 Nov 2026 12:05:08 -0500
Message-Id: <179553990882.338124.2700514698048622727.b4-review@b4>
X-Mailer: b4 0.17-dev-8145e
X-Developer-Signature: v=1; a=openpgp-sha256; l=649; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=Lzsl3O/CyZSXSD5OOxgz4HOpmwsFS5hLkGYMaG366uE=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJZDx/7xTldcIv/uaDmx3pVKUEGU3fmKYjUv5A4Ua7m+
 /7aGw23jlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACZyu4rhD/8UnsjX7Bcttt/V
 zll/6vyGQDfhL9ol8pGqYRWpHRtmdjMy9G5Lj8209NzZf7c5OrBZ4pb1ifj+4FXnF7d1NZxL2Hy
 WGQA=
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Joseph,

> Siflower MIPS SoCs like SF19A2890 use a dual-core MIPS InterAptiv
> processor, built-in GMAC, USB, dual-band WiFi and various other
> peripherals.
> 
> Notably, they use some ARM PLxxx peripherals, and ARM_AMBA is
> selected for the drivers.
> 
> Most devices on the market with this chip come with 64M or less
> DRAM. A kmalloc.h with malloc alignment override is added to
> conserve memory, and a MACH_SIFLOWER_MIPS is created with reduced
> features instead of using the generic kernel.

The MACH_SIFLOWER_MIPS Kconfig and the kmalloc.h should be separate
commits.

Brian

-- 
Brian Masney <masneyb@kernel.org>
