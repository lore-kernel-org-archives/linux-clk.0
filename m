Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA91304975;
	Mon, 17 Nov 2025 17:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763401356; cv=none; b=GC8FJoDTXsVXj7baIB7h/csjiGJMhZjO29WT584Xkv7UVUmqKhmpmAX+KUAIFQ4BfaIxbIqWr31TEGskeFQ9pjQ/LtAlrsaaMr3r1fJ0m7g7ItpMfU1RSQVkyQWYP/IZT+MHSftqwMOxbdrgM/vU5uRYNRz6e5wJCXOzb+kIW1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763401356; c=relaxed/simple;
	bh=R0/0GbLQF+TXdGjuffLHHelbqT8ZA3jUtOrLrXjQjE0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=n2khjcuq1Q6F492uWWztJYT/TCB3y91g9HfuXzv8NHzzJC+WorzbI1McyOcjxhGgj6zusdFEiUTQauu2o1wiqqb3l7SNTlqzgXpbpUxnodlxupPW5NpVtZdsWk8VJK+ogG9pDTWx/vWzvkAQxNJ2ehVtgf+8gbK9mzAGxlMZUcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iPmC29vr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iPmC29vr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C260C2BCB3;
	Mon, 17 Nov 2025 17:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763401355;
	bh=R0/0GbLQF+TXdGjuffLHHelbqT8ZA3jUtOrLrXjQjE0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=iPmC29vrHMSe8PP4KznVu/z28OeeNMFex2mZikL0MIXW46cLMDbamL8N8P7UjZkU8
	 9gSycay76YvC+BI7JqTwhmyJWhp579I/UJdtW0xT86/QjtQKbZD8J4q/wjJzQ0u/ze
	 gDjO+/ljh08wiDct2st6JZKwC+Vizc32WkMaOll/0kDjUjTn6T91jrQtnlb9TUrkAe
	 QtyCLn/UTS8g59QS4SopgMJtepSn7r3Dlq9uUCDFmXOWMo82/a6SQM2oHe4b8pBKHM
	 BadUQlwW7rPXGoT8GkGCtDaa8ojIV6r36XBFpRjfPe9AOY2CzfZVfmA/HDdJUqHaj5
	 VQ/A8J2HzAhRw==
Date: Mon, 17 Nov 2025 11:42:33 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Daire McNamara <daire.mcnamara@microchip.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, devicetree@vger.kernel.org, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
To: Conor Dooley <conor@kernel.org>
In-Reply-To: <20251117-depth-sage-ee0829c71c25@spud>
References: <20251117-shadow-police-56aba5d855a3@spud>
 <20251117-depth-sage-ee0829c71c25@spud>
Message-Id: <176340135320.214025.1792944827677577860.robh@kernel.org>
Subject: Re: [PATCH v1 3/3] dt-bindings: clock: mpfs-clkcfg: Add pic64gx
 compatibility


On Mon, 17 Nov 2025 15:35:20 +0000, Conor Dooley wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> 
> pic64gx has a clock controller compatible with mpfs-clkcfg. Don't permit
> the deprecated configuration that was never supported for this SoC.
> 
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/clock/microchip,mpfs-clkcfg.yaml     | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml: then: 'anyOf' conditional failed, one must be fixed:
	'reg' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251117-depth-sage-ee0829c71c25@spud

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

