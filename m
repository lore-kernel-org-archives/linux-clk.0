Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F3A33BBB9;
	Tue, 20 Jan 2026 16:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768926629; cv=none; b=VNvAIlGPNWIZidLVnoa3274DQeVB31o+ynDQAXURzrZlfd54yZsEtcdtrDnNzX7iIa1c0sUt3yFQ9p5wru+u3KXMwKbggA5crcPMabSG1bVp/OAbx+NbhCiDlt6cCbHHKPpPdt+pxx4ScsRASuogpRsCZtYLIzpEYjbibxjYWlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768926629; c=relaxed/simple;
	bh=vIjUCN1/aJjjc1ZkXHXSm+HKwMh8UJJEGjwRNhvFFBk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=cE3AQu06hzF+XWmnHk4mpynxOm41JXC5bwHHp/IQUIjOiZ7+g/yhbdyyR3gjSek00MVFji59F3zoIrN1n+XsTEWOVQikY2UaTPxAAQ5yr11QNMPFMfK4cRSrsJKfLEGK4MGpJd99/C1u/HFFqcom+JC7CPi82kSzSV/BRB4+lcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CjH6fBTc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CjH6fBTc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56429C16AAE;
	Tue, 20 Jan 2026 16:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768926628;
	bh=vIjUCN1/aJjjc1ZkXHXSm+HKwMh8UJJEGjwRNhvFFBk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=CjH6fBTc42FQxOY9HdoBNAdfN8NKDkc1H93MOW7f5bsWRIHYYjgXXZo21KP3gSxYO
	 kzoU/c5kNAbfkRiCjw+lfuiKzQtUa6of84HZ2qMWOSktnTg5SRR7bmQtN4LLB4wCvP
	 s21jscC1TTHkzJRjtuIXOgRHlJlJH7y0dAnTQxsP8u4oMTiQYeZUFwi1VpotL0SR5g
	 WFwZHdSGKwHUcJ8uirHGHI3o7L63YyFNwCU/X9YHBiAuB1xj4FonMNAPSnUJMN21/4
	 9Az2m6ouu58iTf14pINtHyLCyUpsb8t4nIvp/X9wC+5jAfFoDB9aDP8GTWdx2JYHfm
	 73Z9y5Ua/PwHw==
Date: Tue, 20 Jan 2026 10:30:27 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 linux-kernel@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Ryan Wanner <ryan.wanner@microchip.com>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Alexander Dahl <ada@thorsis.com>
In-Reply-To: <20260120154502.1280938-3-ada@thorsis.com>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120154502.1280938-1-ada@thorsis.com>
 <20260120154502.1280938-3-ada@thorsis.com>
Message-Id: <176892662758.41946.5094529075263781406.robh@kernel.org>
Subject: Re: [PATCH v3 09/19] dt-bindings: nvmem: microchip-otpc: Add
 required clocks


On Tue, 20 Jan 2026 16:44:43 +0100, Alexander Dahl wrote:
> The OTPC requires both the peripheral clock through PMC and the main RC
> oscillator.  Seemed to work without explicitly enabling those clocks on
> sama7g5 before, but did not on sam9x60.
> 
> Older datasheets were not clear and explicit about this, but recent are,
> e.g. SAMA7G5 series datasheet (DS60001765B),
> section 30.4.1 Power Management:
> 
> > The OTPC is clocked through the Power Management Controller (PMC).
> > The user must power on the main RC oscillator and enable the
> > peripheral clock of the OTPC prior to reading or writing the OTP
> > memory.
> 
> Link: https://lore.kernel.org/linux-clk/ec34efc2-2051-4b8a-b5d8-6e2fd5e08c28@microchip.com/T/#u
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---
> 
> Notes:
>     v3:
>     - Removed clock-names (led to confusion, and not used by the driver anyways)
>     - Removed redundant example
> 
>     v2:
>     - new patch, not present in v1
> 
>  .../devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.example.dts:19:18: fatal error: dt-bindings/clock/microchip,sama7g5-pmc.h: No such file or directory
   19 |         #include <dt-bindings/clock/microchip,sama7g5-pmc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:141: Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1559: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260120154502.1280938-3-ada@thorsis.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

