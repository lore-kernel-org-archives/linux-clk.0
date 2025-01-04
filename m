Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01ACF4683;
	Sat,  4 Jan 2025 10:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735985282; cv=none; b=jp5/KrsAa2a4GI/q/e0GiS10WkauJa5bLZDB66KdMankTjjBU2Qdi9gNRV1I8DXhh1MfcNH2rbLjIDeWFAkek7ArtXKmkheqPsUNG4oabk7l6F0na2whJFANal1irXrFwTfQLTuCwisyHUBAQGAbr5OTM2oKtbDZujhxCc0+rKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735985282; c=relaxed/simple;
	bh=bdlCv3xMXychMOB2F4laWYG2SD5KM7Q3azOB1+sT4xs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iCDmrD5kE759lo16rKBuhh+YUR3WhafkVQh8zz8xlaZy/mB5O4PQtH16nYns/nZCp+hoxy6gLDxTgObe+xCvvHKuHb6Y1eXW/ui1V3PJ2zsin6UhtXXEWRKWw0DUTWc6x+R7QNP0OSgjzaLlvlaqjBpMGBPOQb0CY8FocS5VeaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OUOfghYB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OUOfghYB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD11BC4CED1;
	Sat,  4 Jan 2025 10:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735985281;
	bh=bdlCv3xMXychMOB2F4laWYG2SD5KM7Q3azOB1+sT4xs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OUOfghYBu2ue548isEp6fx1XbxNXtMR11lecjaYlQA2g441w6qql6rtIXNgLi+OSM
	 nszu5SU6TgEbd0BMIgOHpCPzoYbuqgjiU/kSnyzSO0uo0Dm8svI0jgvx/oamjgscDw
	 s2uV7M67UBDisEan3IrcV5KE6POpiUcv4Ql2q8DZJz8t12kRMsJss+L2Vm4Ow8mK7B
	 fhDTBwf3zt96FvN+d0P/ZMXh9Y2srQinR3pTat9MhTSjuJUzdshQuVOqwgTgnMqnuY
	 9z6jSycUN3s0vXO7Z1I89qA2HWlpH6+ghhliZRMpHe2Cbh3FJ9OYMXHrCbQo5eTisO
	 B9bL+i6smjUJA==
Date: Sat, 4 Jan 2025 11:07:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haylen Chu <heylenay@4d2.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Haylen Chu <heylenay@outlook.com>, Yixun Lan <dlan@gentoo.org>, linux-riscv@lists.infradead.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicornxdotw@foxmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: soc: spacemit: Add spacemit,k1-syscon
Message-ID: <aw2vqnz5vcccqqvrrhz5tgawj7fnzzg3tds7nnepuorit37a7r@jcj3wrs7d73h>
References: <20250103215636.19967-2-heylenay@4d2.org>
 <20250103215636.19967-4-heylenay@4d2.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250103215636.19967-4-heylenay@4d2.org>

On Fri, Jan 03, 2025 at 09:56:35PM +0000, Haylen Chu wrote:
> Add documentation to describe Spacemit K1 system controller registers.
> 
> Signed-off-by: Haylen Chu <heylenay@4d2.org>
> ---
>  .../soc/spacemit/spacemit,k1-syscon.yaml      | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> new file mode 100644
> index 000000000000..79c4a74ff30e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/spacemit/spacemit,k1-syscon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Spacemit K1 SoC System Controller
> +
> +maintainers:
> +  - Haylen Chu <heylenay@4d2.org>
> +
> +description:
> +  The Spacemit K1 SoC system controller provides access to shared register files
> +  for related SoC modules, such as clock controller and reset controller.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - spacemit,k1-apbc-syscon
> +          - spacemit,k1-apbs-syscon
> +          - spacemit,k1-apmu-syscon
> +          - spacemit,k1-mpmu-syscon
> +      - const: syscon
> +      - const: simple-mfd
> +
> +  reg:
> +    maxItems: 1
> +
> +  clock-controller:
> +    $ref: /schemas/clock/spacemit,k1-ccu.yaml#
> +    type: object

So now we see the full picture and it leads to questions.

1. Why spacemit,k1-apbc-syscon with spacemit,k1-ccu-apmu child is a
correct combination?

2. Why having this split in the first place? Please confirm that clock
controller is really, really a separate device and its child in
datasheet. IOW, fake child for your Linux is a no-go. Fake child while
devices are independent is another no-go.

Actual answer for 1+2 above would be to fold the child into parent,
assuming clock controller split is fake in terms of datasheet.

If it is real device, then allOf:if:then: narrowing the compatibles of
child might not be worth the complexity.

3. Why using different naming, look:

spacemit,k1-XXXX-syscon
spacemit,k1-ccu-XXXX


Best regards,
Krzysztof

