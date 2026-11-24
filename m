Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795532473;
	b=Mc6iN6NOY/3qLJEPhzQH4qzaZO8STCuhMkZimfXTX0UfoEq687+XHr4vsEoNQhJMh8b5
	 YFxnG9AGL/x5rdx+YD/h8c49wA7NXARk44SfBy5CiD/1NMVMEfgIOO540e3CRzO2nJz7j
	 zWbKf+IhOxvdUcBHmk/lyhh2Js4H3aq4cPYZfK9BW17LCz46pAw+egEp41UhJAQJ8uu1H
	 qAQMYndR2/cJfjoyPTmwQZg2ULNA3L+bXu/Q53r9UOaJsPNuVQbvUGnm1ARetk+bJRJnQ
	 WytV3CHVbx3gKCuzmU7cjzNv6Oc6A+IqNJhT6fWYWTzEQaBH2vpgfNnc1iV6bn5F2oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532473;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ALc2DSxAFB+z144gug25dVUdNIFgyfJHT2bWTlh/b4s=;
	b=dsCpmafqUHlNDCZ+vVEwRyw/9MUz0Ii26Va1Is4itzBbeqVWwhb7ZDKJNxUkvNskhT9X
	 +Ecil9VoLVYfJGuSNZxtI8QHRaEoYya3PBuullBwwcYhXpR09+T1wVyUwSrFc4ItRON07
	 OqyJTgL/wG2R6hO0UxahgTjxz6JJxy9gWID4rmI3j4fsFd5RO1ppUsYhRWXa0Ye93Bq20
	 UU7kRm2lD2lb5jiYc0bfpkHME5fY5B02VegoxKfL1vLGq1EjPSYMryb+YhlavfMm3gLmI
	 xooOa7TudUBqTKDaFDOIMKUNRks7LnbBoDlBDuSZcgAWJyUmbgmEchjZHpwGYsGhDBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="WKgC/2zw";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11E7606A323;
	Tue, 24 Nov 2026 15:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WKgC/2zw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C37C1F000C0;
	Tue, 24 Nov 2026 15:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795532472;
	bh=ALc2DSxAFB+z144gug25dVUdNIFgyfJHT2bWTlh/b4s=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=WKgC/2zwvSt19KsvTJXu8aQJUBgDyOIuyGUhlsrxDAuqCGK07+txYoMPSRQU+MYaU
	 Bx2GLzgIaicrMPRK4n4alQd8CPiB6syQHwPET5d51kXC+QesvZhLuGmbE6a6/0xQ+a
	 AMSrC3WJCVHaOIt/Yg3VlVpw8LJSXLirZoivpXKEpioId6vqpXYBoan+bCm/Ah1T6h
	 gV2xoZdBhdgN5Lj38bbsz/nkW4fCmY8EQNR08Jj1M/oPAnvATexR1t4domcGpKyPXT
	 63m+gofKlMf+NCoUr1HQoBTynqy2kqNg4Fo/RclWtC/nID+f0YXsSorMIDLGC/hrQX
	 1JBZROg+MVclQ==
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
Subject: Re: [PATCH v4 8/8] dt-bindings: stm32: use reference manual names
 for ETR and STM bus clocks
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261106-ups_mp25_clk_update-v4-8-9e32b817c38d@foss.st.com>
References: <20261106-ups_mp25_clk_update-v4-0-9e32b817c38d@foss.st.com>
 <20261106-ups_mp25_clk_update-v4-8-9e32b817c38d@foss.st.com>
Date: Tue, 24 Nov 2026 16:01:04 +0100
Message-Id: <179553246414.44164.14668877546162285849.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=879; i=krzk@kernel.org;
 h=from:subject:message-id; bh=Yd2whfFIQx6CU36G85U2V6q320n+Sz6amBmurjhQT/k=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrBaaxP87ZTEqSoh3W7nf0iHw+pu6YaAtHs9Luo
 lq9h05GcICJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawWmsQAKCRDBN2bmhouD
 17ngD/9fzXC1ZLELcRUz7qArItuZfK+8D+sGamj9pWSLmVADrrqB+2I54M6TyFncO9gRmBSwEIQ
 uHEqqEkbcry7oJA/jfNBhc/7hERh/8eoXmmfkcn0Yg3CUGZ3qTM3HlRTGLt7KBTkLLCNpqNfSfU
 5VJzulQZgHHSES5UsIAN+DDEq6GjR/lCdmt2bPBeG7XuUQLc7rXfuH19l76uWzeYfJHY6c887Ox
 AyEJQW1TiDiLjnrZcGVUzzOqHAAN93nDobM8Mn0btIe3gOwDq68tLXUdgliiZtYZoE7B2jje2tA
 nqZ3jDbKG2ZyXiDQeZ02TDp4bB9pTNevNB0pMazrDRN8P79fDMDBN1hDKi0xC8cjDIoQamr0JG3
 txFpPl70oRpC1Hlf+Kr7fBOQGcwExYboTB1LaA8qV6kq3eEPgxkxK0JQLhR8CmPkJJchAZHUKBM
 uBF8zeETSLwyfvLF8uCoDWvpKBUcG27/TqJE3Jq+UjjOob7grPXHGM6uFqrdWMMUvbOb1lmWXw0
 F0Spae5/dbd/2ZEEmwbvL+/NIq4njlX9SK7HkvvrgDREwZZybjJWEvXNyK7XXyocN2HQcwZZgmq
 CgURutamNq3s8MP+xepvmGO9r96L9oiw9sNc7QaRtGulZTOwI6u285s9V7mCznF6rnikX+g4YfJ
 PzX6rrbLDmfNiOw==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

> The bus clocks of the STM and of the ETR are identified by CK_BUS_STM500,
> CK_SCMI_STM500 and CK_SCMI_ETR. Now that their kernel clocks are
> described as CK_KER_STM and CK_KER_ETR, and as the RCC bus clock of the
> ETR is already CK_BUS_ETR, these names are confusing. They also differ
> from the reference manual and from the STM32MP21 binding, which uses
> CK_BUS_STM, CK_SCMI_BUS_ETR and CK_SCMI_BUS_STM for the same clocks.
> 
> Use CK_BUS_STM, CK_SCMI_BUS_ETR and CK_SCMI_BUS_STM, with unchanged
> values, and keep the old names as deprecated aliases so that the
> existing users are not affected.
> 
> No functional change.

That's ABI break, so clearly not true. Users of this ABI - this header -
did compile before, now they don't.

ABI impact must be explicit in commit msg.

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>
