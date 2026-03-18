Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2F43019AA;
	Wed, 18 Mar 2026 22:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773874511; cv=none; b=rZqk/P7jlfp58vjckRBfnampcMIcdOgIxpj6eJIQobP7DwrWvpaWMnVFMsUvM1Gkp6Lb7wyBvIOKjXDvwLsxmJbYnOfYneVs97tz2TCHKUIwMQYj1cYZ9z0N0cMJWj8bKH9fjNgCbpWQ2j3kwKQtv4RlzyU66V64MfBsvpB7/b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773874511; c=relaxed/simple;
	bh=7kzndOAkzNwSabKuNJD2+iud539bSd2lvwAqo64cNM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQkeuAqzlgnngeVwsyMDL/7CAVhmM7fggr/HN2ESmhx+MV4Yi3llOxyWD1y5n824jIEdUc874xMY+KO5JWOyVxHhop52orABq/wo1pXCCtwgNN9ZPahc0eWG/UjlwvllfTfm81HLobYec/EqwDYLp1bKC68SK1SOQSLpplKuNqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tiYc4gMi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tiYc4gMi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7591AC19421;
	Wed, 18 Mar 2026 22:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773874511;
	bh=7kzndOAkzNwSabKuNJD2+iud539bSd2lvwAqo64cNM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tiYc4gMiC6ZsfHL+tdSxZrH8VEofgrTGh0QkUXATKWsmdyQm4hSn1fKY99FwenMPn
	 SE7x8AuvXggAthBPrEnNuSOi1Lx1fDbEptK7Hj4jkGGh3h8vLUBUPB7u4q5teU+I8y
	 mVJP/LUdDR3TRVPuyW+qzfAXKYLfG8P8Exf5n47dj5zzOMj10aRbDxjahSazwMCNqt
	 /WyczKBzgO6oMixBZDK+mXbrdKi6BWw28+P0lB8VnXBimrrVdZkmmC8C8iTr5FZciM
	 RTirlHYH9odxiu5trU4RqOzmc2wP8i4728uyr5SWNEoQ7DHaQ0f7yftrH2uIU/M/n+
	 0vdrHH2SfO/eg==
Date: Wed, 18 Mar 2026 17:55:10 -0500
From: Rob Herring <robh@kernel.org>
To: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: Add clock guard DT description
Message-ID: <20260318225510.GA639444-robh@kernel.org>
References: <20260318-feature-clock-guard-v1-0-6137cb4084b7@bruker.com>
 <20260318-feature-clock-guard-v1-2-6137cb4084b7@bruker.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-feature-clock-guard-v1-2-6137cb4084b7@bruker.com>

On Wed, Mar 18, 2026 at 05:43:40PM +0000, Vyacheslav Yurkov wrote:
> Describe device tree binding for virtual clock controller guard.

No idea what this means. Please explain how I would identify this h/w.

We generally don't do bindings for virtual devices and we don't do 
single clock bindings (other than some we are stuck with).

> 
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
> ---
>  .../bindings/clock/clock-controller-guard.yaml     | 79 ++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/clock-controller-guard.yaml b/Documentation/devicetree/bindings/clock/clock-controller-guard.yaml
> new file mode 100644
> index 000000000000..71c2d80de1f0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/clock-controller-guard.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/clock/clock-controller-guard.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Clock Controller Guard
> +
> +maintainers:
> +  - Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
> +
> +description: |
> +  Clock controller that guards upstream clocks and/or GPIO
> +  signals and exposes them as a single clock output.
> +
> +properties:
> +  compatible:
> +    const: clock-controller-guard
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  clocks:
> +    description: Input clocks that will be guarded.
> +    minItems: 0
> +
> +  clock-names: Input clock names.
> +    minItems: 0
> +
> +  clock-output-names:
> +    description: Names of the clock provided by this controller.
> +    minItems: 1
> +    items:
> +      type: string
> +
> +  gpios:
> +    description: |
> +      GPIOs used to control or guard the clocks.
> +    minItems: 0
> +    maxItems: 32
> +
> +  gpio-names:
> +    description: Names corresponding to each GPIO.
> +    minItems: 0
> +    maxItems: 32
> +
> +    items:
> +      type: string
> +
> +required:
> +  - compatible
> +  - "#clock-cells"
> +anyOf:
> +  - required:
> +      - clocks
> +  - required:
> +      - gpios
> +dependencies:
> +  gpio-names: [gpios]
> +  clock-names: [clocks]
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clkctrl: clock-controller {
> +        compatible = "clock-controller-guard";
> +        #clock-cells = <1>;
> +
> +        clocks = <&clk0 0>, <&pll 0>;
> +
> +        gpios = <&gpio0 4 GPIO_ACTIVE_HIGH>,
> +                <&gpio0 5 GPIO_ACTIVE_HIGH>,
> +                <&gpio1 2 GPIO_ACTIVE_LOW>;
> +
> +        gpio-names = "gpio0", "gpio1", "gpio2";
> +
> +        clock-output-names = "clkout0";
> +    };
> 
> -- 
> 2.34.1
> 
