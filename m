Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EAE303A07;
	Sat, 14 Feb 2026 20:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771101411; cv=none; b=g8D7AC913F13nSjEtG9p+wqp5YV5+2g2z2+TRryDbAIfBReoaey9rQ3GzWIoJ7O8smAWrMTWDnGBxVc8TFCFafnu7r12tcmwn6do5PV6FPod6bZGjhxkg03xabxIP5SBynqv3Kv/mgyqC2dSIQGeqxcjgsvFexHOwXnMhAXyR0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771101411; c=relaxed/simple;
	bh=QDdd2+1ycl3mmYqGRk4XVRj+dso5vvrnBiAxu6oBwO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rLL2EdZpddk3gZORI/O60tsvpk8o7ZX2GYDzSQBGXDlRkC7aMDYq66k40OQJn/o9rzowbCyh0fa2VXyS/mzM3kQcTgCNqlDMntd1T0SXl2FDuaRgrNPQls8wDkfzi3wnSanpgyHhzGMpJVL49ums7d0j9V4arkDMSMjDNeO+A+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iVqCYLeM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iVqCYLeM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7E81C16AAE;
	Sat, 14 Feb 2026 20:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771101411;
	bh=QDdd2+1ycl3mmYqGRk4XVRj+dso5vvrnBiAxu6oBwO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iVqCYLeMHW6BQIMgVL0MXYWVe9087z9fJjE7H8JcjAvmD8k+ixowoiHvND+mgBYwM
	 0nGTEhU+zpgTRqlZVutlHgnJEfCv5P4C7uZ+k3xUV7RVovLEi+N7ALdcTFkvAZdPpP
	 bdOuyus1xvB8eXC9Q3it2RbZ3FBm0qeMw0LCuxncUSdoVnhvXL/9F1ec9Ehbre8xF2
	 vadK1qNWtKtoDQzyWFpaTAiEbHq5s/1PIqS5Nm0RMRNO8SLYznbyMCOrXc19JpQnjJ
	 8WJ3HsR4bSZ6Gz4/165ShQQ0RBNyry3uSj83z7czNQ/B3l3fz5mq+jXOcr+40sOujb
	 BhRoQSP3m1j1w==
Date: Sat, 14 Feb 2026 21:36:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xukai Wang <kingxukai@zohomail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Samuel Holland <samuel.holland@sifive.com>, Troy Mitchell <TroyMitchell988@gmail.com>, 
	jiayu.riscv@isrc.iscas.ac.cn
Subject: Re: [PATCH v11 1/3] dt-bindings: clock: Add bindings for Canaan K230
 clock controller
Message-ID: <20260214-lyrical-rabbit-from-camelot-2e1195@quoll>
References: <20260214-b4-k230-clk-v11-0-6de365489b89@zohomail.com>
 <20260214-b4-k230-clk-v11-1-6de365489b89@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260214-b4-k230-clk-v11-1-6de365489b89@zohomail.com>

On Sat, Feb 14, 2026 at 08:54:37PM +0800, Xukai Wang wrote:
> This patch adds the Device Tree binding for the clock controller
> on Canaan k230. The binding defines the clocks and the required
> properties to configure them correctly.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

This review and the patchset has one year already... so I am afraid it
will be resend and resend, thus please also implement below:

A nit, subject: drop second/last, redundant "bindings for". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

Best regards,
Krzysztof

