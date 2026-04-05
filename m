Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94EE70818;
	Sun,  5 Apr 2026 07:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775373497; cv=none; b=ucQ5CA0qkR/Ca3RudWVooRfkw2WLHll6QlwxH2nlON9KIQyuXIgZ3ZqLTCUHS+qICO5lovVGO0LuU9QT87PpSUQaqYaEDvJ1+JTmnKBoxq5yGwq1anBWJehhGTLulLoGG2VeMUDS6M9fD3BHi80Kaayu6Li192DK/A2Uvg1qREA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775373497; c=relaxed/simple;
	bh=anSaiWX7cVtfquctI4JqwVS84SkW1qwqzSFgSaqpjC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nORyyGlTs+Bd+bGen7JMpT7Z7AdqrU3VYt2hE7caXZlxC+DsNTGU054euyGvEKExD5037qvmEFlvFG2GyxmXI+lH5Ip8diAvF/+1iwBwXQ/irwCHMZPgpTZyzFIRkje3JM2V4N0GyXCuSLC4jpmtFf/64k6qEMzE7I3rVMFWtMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qZXIXPVo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qZXIXPVo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C23BFC116C6;
	Sun,  5 Apr 2026 07:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775373497;
	bh=anSaiWX7cVtfquctI4JqwVS84SkW1qwqzSFgSaqpjC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qZXIXPVoZG+PM3PJKipM749jxpJeAdGu235QSI1Ag1J0T7Z9QRA5EwL4oAD0PSPdc
	 kqHJA6OrPt5bVPmLHfUsOhGOFXdXUU3kHLtqN5jFkcpu+POmxP31C6Uy512FWP6mZD
	 4I+2835O0C8o+SmuN/TBGyogWP4YdPc+CtyJKke8n98ozWMZ/IzmZkBj8P0Ds2goOo
	 F2PxV7eqXNrdQk3lFjj0+GOdPCi8xXGFYn1CprRLH7p1HMAHhP4/ZbuEp2if4b0xir
	 vK2BfAngEIEnf7JavI3KyUo9Th2HYFrp64xy2f+FewZxQYo+jzO6AnaZ7Zk6mAMJkQ
	 orhhpwtRDNMJQ==
Date: Sun, 5 Apr 2026 09:18:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Emil Renner Berthing <kernel@esmil.dk>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Alexey Charkov <alchark@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Keguang Zhang <keguang.zhang@gmail.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Ley Foon Tan <leyfoon.tan@starfivetech.com>
Subject: Re: [PATCH v1 02/13] dt-bindings: clock: Add system-0 domain PLL
 clock
Message-ID: <20260405-godlike-pistachio-mackerel-7ab494@quoll>
References: <20260403054945.467700-1-changhuang.liang@starfivetech.com>
 <20260403054945.467700-3-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260403054945.467700-3-changhuang.liang@starfivetech.com>

On Thu, Apr 02, 2026 at 10:49:34PM -0700, Changhuang Liang wrote:
> Add system-0 domain PLL clock for StarFive JHB100 SoC.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../bindings/clock/starfive,jhb100-pll.yaml   | 44 +++++++++++++++++++
>  .../dt-bindings/clock/starfive,jhb100-crg.h   |  6 +++

You did not test your code. Apply patch #1 and test it. Do you see
build-level errors?

Best regards,
Krzysztof

