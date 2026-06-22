Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B533ACEF9;
	Mon, 22 Jun 2026 14:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782138912; cv=none; b=FrQqS5K3GS1BVAhCnQTk5mK+oeMDDAiKgpdXoyeNUdfuom7l4jby70bOMKvHP0G2ItA1PjJNzUQsSGPmA2nWg6sYd/1X46OLEAyEX1oYdUrBNA8iIUXHRRuGGAILayh0mYLsyU5OZ1K4+ZisL/A/oUESe0Qi3bV+JrLayxGbRt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782138912; c=relaxed/simple;
	bh=HbTEvtfHJvtJMI1UvzoPnhwDnpcBu5HFaS5iDJxt1i0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=VAD2Usc4XvlRg9V+cG/QWf4ZBgZCM648iODRiyS29V9N9y8TXLv3k1aVt2EA+FcEszui8tWbJUPU9r/siAVDz6hMovU4F7sodK4A00wkCMeWuoOzrt2AZt8MOxLyY/zRRS/QvrIoI8EPbYm3ow9o19ORC8zjVQowdL+cTD/CnoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lojd9c8F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lojd9c8F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 139DA1F000E9;
	Mon, 22 Jun 2026 14:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782138911;
	bh=J3VI6K4Teqzsm2sKMe8rHV7pKAq8W0GA/5k5u98EvI0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=lojd9c8FWt5AS92ts5N/TipcA7rXB2al6ESrLqtsYdS34kdGcyJsgCNYcmYwevK2R
	 5oGCNUhLATdEigGO0hWi4ge2GMvb0CL/bAQF0jxewe1+CVDjVR2ajd9RWcghnih6nu
	 HeB2tkyB6eJfTkQxeG0HslxUCZdWuWufRrEIpw7XeOLC2GfLb+d5Fwf8F6KIyyt0ZM
	 YKBUVgfy/pJVoJU3Yb7BL2j6oMx4EU7a2xlELQ+SoHrbvlN+xmbsBwLjA5W7ZKs9E9
	 m0Y7fxOgP3l/ftUPUo/huFVXj52RJp7cRIjQyCyPpe0WvuTnRua2V3pcjL/pteNrNL
	 /bWFFl6rYgxFw==
Date: Mon, 22 Jun 2026 09:35:10 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: simona.toaca@nxp.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-clk@vger.kernel.org, Brian Masney <bmasney@redhat.com>, 
 devicetree@vger.kernel.org, Tero Kristo <kristo@kernel.org>, 
 daniel.baluta@gmail.com, Michael Turquette <mturquette@baylibre.com>, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com
To: Bhargav Joshi <j.bhargav.u@gmail.com>
In-Reply-To: <20260621-ti-clockdomain-v1-1-e99a56af98ea@gmail.com>
References: <20260621-ti-clockdomain-v1-1-e99a56af98ea@gmail.com>
Message-Id: <178213891030.2584896.380168466122492657.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: ti,clockdomain: Convert to DT
 schema


On Sun, 21 Jun 2026 21:23:35 +0530, Bhargav Joshi wrote:
> Convert TI clockdomain to yaml DT schema. Drop '#clock-cells' from the
> required list as this binding doesn't define a new clock binding type,
> it is used to group existing clock nodes under hardware hierarchy. Most
> existing dts omit '#clock-cells'.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
>  .../devicetree/bindings/clock/ti/clockdomain.txt   | 25 -------------
>  .../bindings/clock/ti/ti,clockdomain.yaml          | 41 ++++++++++++++++++++++
>  2 files changed, 41 insertions(+), 25 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/clock/ti/ti,gate-clock.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/ti/clockdomain.txt
Documentation/devicetree/bindings/clock/ti/ti,gate-clock.yaml: Documentation/devicetree/bindings/clock/ti/clockdomain.txt

See https://patchwork.kernel.org/project/devicetree/patch/20260621-ti-clockdomain-v1-1-e99a56af98ea@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

