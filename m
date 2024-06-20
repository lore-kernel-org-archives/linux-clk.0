Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79EF1991DC;
	Thu, 20 Jun 2024 12:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718886301; cv=none; b=LNAtbtVqYeokZp3IavqkEr3zHCw7dBTff/x1GETfnRaJCUZx1/Cvp6s+SpVL70L8f2E84h9O7dqqcaE8ObIXuMWoEQIxQP9+gglDv2TLVKGzJ17qlXAydm+gUaj9P0FIeH9XEJXWKrks0ytGn2QaTQ3zx4tcgI6bkFZd52LNQ8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718886301; c=relaxed/simple;
	bh=u0IxrPEYcajYQ4EI1J1Jc2UprPH+WcAt3a1Y9ua5dp8=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=HiLJK7KFhLlYlnkSZkr0A7yz/UQ92BUHPh/TSJE+g32VIboQQCcC4+OEikELlxzvPOkR89Bs+t3oAFYTKyIRTwj0b5Zy/EOFmU9+2Oa7E7iubSv1Cr1g7uPRg0OTrMdkxImUTBmZs2r6NVDbwLuEvAaO3pUZEOR6LphDLg2TyVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I2bLUI9g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I2bLUI9g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 154DFC2BD10;
	Thu, 20 Jun 2024 12:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718886301;
	bh=u0IxrPEYcajYQ4EI1J1Jc2UprPH+WcAt3a1Y9ua5dp8=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=I2bLUI9gvnbc/rB0DbBcfYycaG+F958VXJMvlqwwjksQEuBykPXfnVk6mnVUZpnah
	 H4atNR+9PYQRuSTGpqdM3yMY68s+Mf5sHmJP9RMeJvyN7KJWQdu5/Bd0IlpjEjnuqf
	 JGROnRYNJOxbL4cquiWwHk9rq69loiBjZnD0irec0hL91pecG5ho2+IlsbXUQzNZPr
	 OtUzrbm60xxgDo3UHECDgYvXyZILyllYgE2dh7Z6UEnFTtwWvBBrv7wDwgBB/WMePY
	 G48sEmt5gs04zvX6sOxYCpPVhF/R6q4k/tdUZbn4aqAJZxG53wHLVaDdPx4iNcSekN
	 lo3qZ08S5qv+A==
Date: Thu, 20 Jun 2024 06:25:00 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Andre Przywara <andre.przywara@arm.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Chris Morgan <macroalpha82@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Thomas Zimmermann <tzimmermann@suse.de>, John Watts <contact@jookia.org>, 
 Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, dri-devel@lists.freedesktop.org, 
 Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20240620113150.83466-19-ryan@testtoast.com>
References: <20240620113150.83466-1-ryan@testtoast.com>
 <20240620113150.83466-19-ryan@testtoast.com>
Message-Id: <171888630004.1426859.15945368564600967257.robh@kernel.org>
Subject: Re: [PATCH 18/23] dt-bindings: allwinner: add H616 DE33 bus, clock
 and display bindings


On Thu, 20 Jun 2024 23:29:56 +1200, Ryan Walklin wrote:
> The Allwinner H616 and variants have a new display engine revision
> (DE33).
> 
> Add display engine bus, clock and mixer bindings for the DE33.
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>  .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml  | 7 ++++---
>  .../bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml       | 1 +
>  .../bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml   | 1 +
>  3 files changed, 6 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml:27:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.example.dtb: bus@1000000: compatible: ['allwinner,sun50i-a64-de2'] is valid under each of {'items': [{'const': 'allwinner,sun50i-a64-de2'}], 'type': 'array', 'minItems': 1, 'maxItems': 1}, {'items': [{'const': 'allwinner,sun50i-a64-de2'}], 'type': 'array', 'minItems': 1, 'maxItems': 1}
	from schema $id: http://devicetree.org/schemas/bus/allwinner,sun50i-a64-de2.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240620113150.83466-19-ryan@testtoast.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

