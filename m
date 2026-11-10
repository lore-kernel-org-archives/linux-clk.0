Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794273809;
	b=z+SKaByLiUg3ogMWy4nQoUgxHozVwP3uGxzA8L40hGCY7Qqx7bb27se9WuY2w8mKaw4X
	 lYokgtafPSpFhOsgrtjbktilQ9TRvgySSCcXCtkOB0JTARPb7wmxvckTZDiWhYUNHMuyE
	 ZOOF3ANtAh4cjY1wfDhcjnlr6Zx21//oiYKzKbKX0o2dqf/bT3ZDRo+ruoheUVea6i7jt
	 4ULTfh4WDp4t+D0gzalEEj+EQ90735BAMkCDiJtwQ+qwYGv9pkH/uHh4R4sAv/9nRA5+h
	 6RhAR6913Uj/xR9+BoT/rRBBMaRqBQzRzTxphIl9Uhrf2QmqHBHwBLTDCMR4aZa2yHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794273809;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=IcmCqdPzfkDKDyDOv3jXDc9d2Rwsm8SiT4j+4/kZJpw=;
	b=yDM1POo6k3/aBRtqcIU4rl4kLbjyZiYkXtB1hZi1z6DRBh8SHCNNtJQEJ95OWaSdiFZv
	 46RzJuifNeO6Iv8c2neyAvGU8uOLgSLHFHSXPtTOlTssXwU39lFQGj8nWjrNsmrx0lpAU
	 mnuOKan4HsqGoEfDIWJsvLjcCU8L/XxSPVwH3ajqFochANFTKMxI2EgQ3UMSV1kz2+/pR
	 eYWelV34L0Qc1WEoWTQK93/d6B4+ADHkpHyHJyn+ebmvp/5ffAexGErJroBfaevGLePcx
	 ztTq2gAH3IN08ldhWQQHxUbrMbswr/yGlDlOj5FtDCGOBlAFCDvMenqMpJVbp4aN5rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="k/4sfRah";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E12B606A336;
	Tue, 10 Nov 2026 01:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k/4sfRah
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6438A1F008A1;
	Tue, 10 Nov 2026 01:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794273809;
	bh=IcmCqdPzfkDKDyDOv3jXDc9d2Rwsm8SiT4j+4/kZJpw=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=k/4sfRah4slqwg9PyE+rrZFvxP8AS8xGz+cl0J5zgFxyLJXmPzJNs9nsMQjXoFzB0
	 59q9By+NzkoZ8cLlfRC85AlX28BhLnk5e02lWccqizdabnaUx0lXM+bC3YLgGdMUwG
	 a9LmSZ3zYqRVQlrGkBHbRixy5Vz/AEf/TcE32t6+7YlGY8sAaTMadcOs8VqsL5O7y+
	 9KiCoEsMJdQqdjRzkw8UPbDgPQPVQ1nJthtoFNxdQRN3og83xXofEtMDColNaq6Kud
	 arSYet9M9uhjZaUt7hLFwxn46Ki5+b8a/l/ovYMKccCaB1zIHP166zx2K8h+QSX1xZ
	 SkMliHZf6Rgaw==
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
Subject: Re: [PATCH v11 0/5] arm64: add Ambarella CV75 SoC support
From: Brian Masney <masneyb@kernel.org>
To: Long Zhao <longzhao@ambarella.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 linux-clk@vger.kernel.org, Brian Masney <masneyb@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 devicetree@vger.kernel.org, Long Zhao <zl020895@163.com>, 
 linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
In-Reply-To: <20261105-cv75-soc-v11-0-aa6ee0b2380d@ambarella.com>
References: <20261105-cv75-soc-v11-0-aa6ee0b2380d@ambarella.com>
Date: Mon, 09 Nov 2026 20:22:33 -0500
Message-Id: <179427375370.1061670.4050288038934218487.b4-review@b4>
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=3130; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=VO28hMGn0XbhaEDUCmUhwgoDndN/oi8a3kYXHsXkPDA=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLI+Fd6JOKT3/FzBqulnLtaEV5erNb53u/7Q8OZ6HWUOh
 paECObdHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAExE/ArDX7HFT1NuHUoMutUf
 zRe2wfHPWXMfq9AHPw8YbGuPVXtwz4OR4ezrv96fu/s5e+/HfP54c+e7zvY3QavXXzC1Skz9pbj
 VlQcA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Long / Krzysztof / Conor / Rob,

> Add the Ambarella CV75 SoC and EVK support: the board binding, the
> RCT clock binding and driver, ARCH_AMBARELLA, the devicetree and
> MAINTAINERS.
> 
> The clock ID header is added before the devicetree that includes it,
> so patch 2 (the clock binding) has to be applied before patch 4 (the
> devicetree).
> 
> The ambarella vendor prefix and the CV75 secure scratchpad syscon
> binding are already in linux-next. This series does not repeat
> either of them.
> 
> GPIO, UART and pinctrl bindings and drivers are separate series.
> This devicetree references those compatibles.
> 
> Tested on the CV75 EVK. The board boots. That boot used a local tree
> that also includes the GPIO, UART and pinctrl patches.
> 
> To: Arnd Bergmann <arnd@arndb.de>
> To: Krzysztof Kozlowski <krzk@kernel.org>
> To: Alexandre Belloni <alexandre.belloni@bootlin.com>
> To: soc@lists.linux.dev
> To: linux-arm-kernel@lists.infradead.org
> To: Michael Turquette <mturquette@baylibre.com>
> To: Stephen Boyd <sboyd@kernel.org>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: linux-clk@vger.kernel.org
> Cc: Brian Masney <masneyb@kernel.org>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: Long Zhao <longzhao@ambarella.com>
> Cc: Long Zhao <zl020895@163.com>
> Cc: linux-kernel@vger.kernel.org
> 
> Signed-off-by: Long Zhao <longzhao@ambarella.com>
> ---
> Changes in v11:
> - clk: use builtin_platform_driver(). The Kconfig symbol is bool. (Brian)
> - clk: drop CLK_IS_CRITICAL from the core PLL. It has no enable op. (Brian)
> - clk: drop the misleading (u64) cast in the div_u64() call. (Brian)
> - clk: add .suppress_bind_attrs = true to block sysfs unbind. (Brian)
> - clk: drop MODULE_AUTHOR. (Brian)
> - Link to v10:
>   https://patch.msgid.link/20261019-cv75-soc-v10-0-d386065e2dd5@ambarella.com
> 
> ---
> Long Zhao (5):
>       dt-bindings: arm: add Ambarella CV75 platforms
>       dt-bindings: clock: add Ambarella CV75 RCT
>       clk: ambarella: add CV75 RCT clock controller
>       arm64: ambarella: add ARCH_AMBARELLA and CV75 EVK DT
>       MAINTAINERS: add ARM/AMBARELLA SoC support

The clk changes look good to me.

Before I start to merge things, and since I'm a new maintainer here, I
just want to make sure that I am doing this correctly, and have the
expected merge strategy for everyone involved.

- I create a new shared immutable branch based on v7.4-rc1 and I can put
  the first two dt-bindings patches in that. I merge this into clk-pile
  (feeds clk-next) with --no-ff. The DTS folks will merge this immutable
  branch as well.

- I can then merge patches 3 and 5 into clk-pile.

- The DTS folks will take patch 4.

Sound good?

Brian

-- 
Brian Masney <masneyb@kernel.org>
