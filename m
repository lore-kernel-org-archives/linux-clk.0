Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A173D3B8;
	Wed, 11 Sep 2024 21:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726089645; cv=none; b=TKyOAzed+YlH3/SyQn9V+qg1GskcMxJO//rO58Ldx3msfQNSkAw1RC2js9N+UoCiisMehYaB8BSVix8R3q+nsvU3Y1/4Be8rekdEAJQalfTfzxQDIY2lQHPexKPjHKZ3V65O6AMLI3kbtK+qSLHMb0qUXRBTb8ZmnBvVaW7DKqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726089645; c=relaxed/simple;
	bh=+kEoMhwLvy7MWALjn+C4G/QKDgdBbjTFEzXGfVxeOm8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PdsdfdrqfRc0PPoh38CKIWsPvYvKCZih1QuHVotG0z4dG9ESPxJbwI6GR1b3NkyoJzaRP2NoFYCdwPmbu/FBRbPcb+H7ZTqBuanjAFqssd4LATHN7c2UZSjjWITL0IsPby7FxfpVeI1lhzDHW5wsQmWqgEl+4sccvFDWW3uB3vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Kf261u0k; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Kf261u0k"
Received: from localhost (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 66A1A44D53;
	Wed, 11 Sep 2024 23:20:34 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
	by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nuwmy7mKDAIr; Wed, 11 Sep 2024 23:20:33 +0200 (CEST)
Date: Wed, 11 Sep 2024 21:20:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1726089633; bh=+kEoMhwLvy7MWALjn+C4G/QKDgdBbjTFEzXGfVxeOm8=;
	h=Date:From:To:Cc:Subject;
	b=Kf261u0kqHxvVSi8YnbeR0wlyvc6ZivJ4ejV95VsW0Nv/usGVi1sd8rjElyehWB3T
	 asAs7i/BoEjVfiPzuZ+BMTZoxOGNrMzR0KzCGYp9yOUHidLVxY/7cbWkiP7rBF41Ol
	 R3YDiV56MHUa2IkmBzNPhKbYkfwBui2ilsl0LxA8uYQ9Oi9p70cZs9kmxz4nCAFPlT
	 3zQCNz5XEQfcfyc4k8rcTV8ePmxHofI8p6CM6Z1qFpOuD9qAmdxK9JkoslWWEgHfX1
	 R9BvAp1vRl7DUIC3IddlBjKtWuWqbd6JoAp6hpuET91E74c5ZT5ivLHqIHcLfbg5BH
	 EEL0GNURA1eyQ==
From: Yao Zi <ziyao@disroot.org>
To: Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Possible misleading information in rockchip,rk3588-cru.yaml
Message-ID: <ZuIJgiN2xp6oPrHD@pineapple>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

rockchip,rk3588-cru.yaml, dt-binding for RK3588 clock and reset module,
contains description of customized property "rockchip,grf",

  rockchip,grf:
    $ref: /schemas/types.yaml#/definitions/phandle
    description: >
      phandle to the syscon managing the "general register files". It is
      used for GRF muxes, if missing any muxes present in the GRF will
      not be available.

But after doing some searching, I found that clk-rk3588.c actually
defines no clock hardware with MUXGRF type. This is also true in in the
vendor code[1], it seems there is actually no GRF mux on RK3588
platform.

Best regards,
Yao Zi

[1]: https://github.com/rockchip-linux/kernel/blob/604cec4004abe5a96c734f2fab7b74809d2d742f/drivers/clk/rockchip/clk-rk3588.c
