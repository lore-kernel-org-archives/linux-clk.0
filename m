Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B9727B340;
	Sun,  5 Apr 2026 07:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775373585; cv=none; b=c1Wc+r+PL0sBzeh9grJSbdtssj7+rwPOTslohSBZAE9K8mMRgaRH7uiJjkD5mHYtgLP5WsBu+iN/i/2OEEto6EYm5nbMvyaKJrfrqiGqe9pn3K/H6+V/6sb/caXMYuuz2iHbVmLUPifHMUFXA9DPpWHF1I7s4ya7Ujrd5Db8xv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775373585; c=relaxed/simple;
	bh=ckiG+3OZzq8XEXstz3w9cYTewnPogJTO5MvDE7rmOMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K6qgQT5Agf5LmlAH8luFOw8lQ77zGoThGkroa+jiMae+V+2DQJpTyc/hvdMCtg/hu3QuTgOlLy+vGgx5QDu9si7WpmZUorwR3Vd5rXG3cgZUjBpSP6WqCk2SqIFCxUFHJeSaJsn5O9bzKVMKmAOBMSjpCHJQwZ6Hf3gX0JOFFks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JI0Ur9O7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JI0Ur9O7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 170F0C116C6;
	Sun,  5 Apr 2026 07:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775373584;
	bh=ckiG+3OZzq8XEXstz3w9cYTewnPogJTO5MvDE7rmOMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JI0Ur9O7x0p/j1X/zg1bGzYItenxXwTAhhhRe6KJ4gvOpsUe4cizD6ZTdkbnBgrFZ
	 X9MXBgbnaFyyV/GdX9d52DKhdej4JgSHNfoaARyQkZn/gt6hBC3ouHfK5YZL2QpQdY
	 id2oNhGFlq6m4G+x8/fRG6tHWHrqNJ5zpcjGtgu6JBJ7YCyCzK7nf9G2j8dMpWwK8l
	 93AahzdrsuFy/5oTcJkPWxaW2zbsaTU+yf341l5wLD4KFJ9w/aDpn4hANP27G+11cX
	 KKNowE1AaCOw/3U/BXNI9KBcbhahzB9p8oVS0UcaJo/cQ7SRHvTwni0nJAjjiW38uE
	 3FqAHBBOPnqGw==
Date: Sun, 5 Apr 2026 09:19:42 +0200
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
Subject: Re: [PATCH v1 11/13] dt-bindings: hwinfo: Add starfive,jhb100-socinfo
Message-ID: <20260405-strong-watchful-marmot-fdfad6@quoll>
References: <20260403054945.467700-1-changhuang.liang@starfivetech.com>
 <20260403054945.467700-12-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260403054945.467700-12-changhuang.liang@starfivetech.com>

On Thu, Apr 02, 2026 at 10:49:43PM -0700, Changhuang Liang wrote:
> Add starfive,jhb100-socinfo for StarFive JHB100 SoC.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../hwinfo/starfive,jhb100-socinfo.yaml       | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwinfo/starfive,jhb100-socinfo.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwinfo/starfive,jhb100-socinfo.yaml b/Documentation/devicetree/bindings/hwinfo/starfive,jhb100-socinfo.yaml
> new file mode 100644
> index 000000000000..cc6b7d5a4c91
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwinfo/starfive,jhb100-socinfo.yaml
> @@ -0,0 +1,36 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwinfo/starfive,jhb100-socinfo.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JHB100 SoC platform chipid module
> +
> +maintainers:
> +  - Changhuang Liang <changhuang.liang@starfivetech.com>
> +
> +description:
> +  StarFive JHB100 SoC platform chipid module is represented by JHB100_PRODUCT_ID
> +  register which contains information about revision. This register is located
> +  under the syscon.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: starfive,jhb100-socinfo

No, not a separate device.

> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    chipid@38 {
> +        compatible = "starfive,jhb100-socinfo";
> +        reg = <0x38 0x4>;

One register is not a device. NAK.

Best regards,
Krzysztof

