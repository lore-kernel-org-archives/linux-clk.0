Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86708450917;
	Tue, 30 Jun 2026 15:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782834449; cv=none; b=b7Vq1J6NUhqeO3x9JOZw0znmDqdZVhmAJBrC8+oAegRei0K89etNRlsccYkWJ7Wtkh82WZ+cUXdV/spqvq5qmW+etHmFvG1rnfQG0ay1Znpp+aI/n0kzvJMVRdqHxiSH+WlWyad+89cZhi2eEwjmj32iUMABYnXCDUk9PPBlm/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782834449; c=relaxed/simple;
	bh=PrZHqnmC3A1Ld1j/CB3cuuUyThllqFq8xKGYKEpXCZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WkiaimPYkDxyRb1Qmgpm0wSnuYfWVtuX+NZYcQwqAnKsq/8Ub/+WVDn35/kt68ybl+PqjVv4OUvCmkEeYviOYz742dXd8CuKMC7r+ZE/OLyBv0Uv2Epfc43VVKusCRatziqdMYGoEhqGKzuMcpZSxZFfHFOroNqwIkOyzF0TMI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jsRfMIcT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jsRfMIcT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF2971F00A3A;
	Tue, 30 Jun 2026 15:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782834444;
	bh=8CL+GC2aWHjn2F0cACsiCPGqiUQQsFs/7D5cQK9Ns+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jsRfMIcTbezPDM8Pv/6T0FAsZy6sPX6dc1ooqpUC31riMPeH9Gy/8LQ5gA0+7R+SH
	 gg85idt7BRgS5wwHOJTBn82qqpdP9KO2M5qUcREFJor4q7IB1mEd/10n1aCx9oyloU
	 C865ThPfOLdi/ZkWzqONWvPh8xpoESHwFfxya+eb9qW3rlVxLZSw7XCwfoDh2rGsKu
	 CW1wbUSZQk9bvdA/F2lWR0LsG3G5PCAxcoJ9wT6aRXUzgJZsjSxoyMtO+UeNHkAs2R
	 LjJnIi1XA6tmHVUAMDaLWG60WfVaBDTw+ObqhlrKKdbLLYRxXIZKmVIeapUDziVZVL
	 K6L+ECMajx6SQ==
Date: Tue, 30 Jun 2026 10:47:23 -0500
From: Rob Herring <robh@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Tero Kristo <kristo@kernel.org>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, goledhruva@gmail.com,
	m-chawdhry@ti.com, daniel.baluta@gmail.com, simona.toaca@nxp.com
Subject: Re: [PATCH v2] dt-bindings: clock: ti,clockdomain: Convert to DT
 schema
Message-ID: <20260630154723.GA3691228-robh@kernel.org>
References: <20260622-ti-clockdomain-v2-1-434dbe0789e2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622-ti-clockdomain-v2-1-434dbe0789e2@gmail.com>

On Mon, Jun 22, 2026 at 11:21:33PM +0530, Bhargav Joshi wrote:
> Convert TI clockdomain to yaml DT schema. Drop '#clock-cells' from the
> required list as this binding doesn't define a new clock binding type,
> it is used to group existing clock nodes under hardware hierarchy. Most
> existing dts omit '#clock-cells'.
> 
> Update the reference to the old legacy text binding in the description
> of bindings/clock/ti/ti,gate-clock.yaml to point to the new YAML file.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
> Changes in v2:
> - updating the stale reference to the legacy .txt file inside
>   bindings/clock/ti/ti,gate-clock.yaml to fix make refcheckdocs error
> - Link to v1: https://lore.kernel.org/r/20260621-ti-clockdomain-v1-1-e99a56af98ea@gmail.com
> ---
>  .../devicetree/bindings/clock/ti/clockdomain.txt   | 25 -------------
>  .../bindings/clock/ti/ti,clockdomain.yaml          | 41 ++++++++++++++++++++++
>  .../bindings/clock/ti/ti,gate-clock.yaml           |  2 +-
>  3 files changed, 42 insertions(+), 26 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/ti/clockdomain.txt b/Documentation/devicetree/bindings/clock/ti/clockdomain.txt
> deleted file mode 100644
> index edf0b5d42768..000000000000
> --- a/Documentation/devicetree/bindings/clock/ti/clockdomain.txt
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -Binding for Texas Instruments clockdomain.
> -
> -This binding uses the common clock binding[1] in consumer role.
> -Every clock on TI SoC belongs to one clockdomain, but software
> -only needs this information for specific clocks which require
> -their parent clockdomain to be controlled when the clock is
> -enabled/disabled. This binding doesn't define a new clock
> -binding type, it is used to group existing clock nodes under
> -hardware hierarchy.
> -
> -[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> -
> -Required properties:
> -- compatible : shall be "ti,clockdomain"
> -- #clock-cells : from common clock binding; shall be set to 0.
> -- clocks : link phandles of clocks within this domain
> -
> -Optional properties:
> -- clock-output-names : from common clock binding.
> -
> -Examples:
> -	dss_clkdm: dss_clkdm {
> -		compatible = "ti,clockdomain";
> -		clocks = <&dss1_alwon_fck_3430es2>, <&dss_ick_3430es2>;
> -	};
> diff --git a/Documentation/devicetree/bindings/clock/ti/ti,clockdomain.yaml b/Documentation/devicetree/bindings/clock/ti/ti,clockdomain.yaml
> new file mode 100644
> index 000000000000..9494cbb1a942
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ti/ti,clockdomain.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/ti/ti,clockdomain.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments clockdomain
> +
> +maintainers:
> +  - Tero Kristo <kristo@kernel.org>
> +
> +description:
> +  This binding uses the common clock binding in consumer role. Every clock on TI
> +  SoC belongs to one clockdomain, but software only needs this information for
> +  specific clocks which require their parent clockdomain to be controlled when
> +  the clock is enabled/disabled. This binding doesn't define a new clock binding
> +  type, it is used to group existing clock nodes under hardware hierarchy.
> +
> +properties:
> +  compatible:
> +    const: ti,clockdomain
> +
> +  "#clock-cells":
> +    const: 0
> +
> +  clocks: true

At least put some range of number of clocks.

> +
> +  clock-output-names: true

If #clock-cells is 0, then this can only have 1 entry (maxItems: 1).

> +
> +required:
> +  - compatible
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dss_clkdm {
> +        compatible = "ti,clockdomain";
> +        clocks = <&dss1_alwon_fck_3430es2>, <&dss_ick_3430es2>;
> +    };
> diff --git a/Documentation/devicetree/bindings/clock/ti/ti,gate-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,gate-clock.yaml
> index eaa727ab0d7f..438e190d1067 100644
> --- a/Documentation/devicetree/bindings/clock/ti/ti,gate-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/ti/ti,gate-clock.yaml
> @@ -19,7 +19,7 @@ description: |
>    that is used.
>  
>    [1] Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml
> -  [2] Documentation/devicetree/bindings/clock/ti/clockdomain.txt
> +  [2] Documentation/devicetree/bindings/clock/ti/ti,clockdomain.yaml
>  
>  properties:
>    compatible:
> 
> ---
> base-commit: acb7500801e98639f6d8c2d796ed9f64cba83d3a
> change-id: 20260610-ti-clockdomain-a27dd0fa1ad5
> 
> Best regards,
> -- 
> Bhargav
> 
> 
