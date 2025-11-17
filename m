Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B97728FA91;
	Mon, 17 Nov 2025 15:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763394473; cv=none; b=PdsbHLTkip67ZlqlA3wsjyIV0uOsS59kRCEiZT1nRli5n/LfifCjr03zeiat8FFAJHD4U/u89WmLU/UFGIP27NM5yDRs3Ml9oYGeB/kER5wDoNuKcdII3y7imliZRwaRmYjNOe53uG5EzAbo0oWo1Oe4qzBnBD7q4hH4Tm1POmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763394473; c=relaxed/simple;
	bh=srMzZ9zZ5j8aRKUeiPt6hC/KIPQNg1B7h2t1KNbGbcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jCf8IHPnuW17vQlgvwiqWu9rOd5etidb8aa+ep2LKHBgq1zgsTYFLGV8XB8Ql1VaxNOOiGreN6P31ASD/WvdXKFyAE8A7lREbokAE5LLq/ya3sl4q3LFZV9bp/unvw0N6yBQdLh9b7inLDr/BhNCsQ1QVRX3riOzJr4ejJ2T00w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KStYFiRE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KStYFiRE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3170C116B1;
	Mon, 17 Nov 2025 15:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763394473;
	bh=srMzZ9zZ5j8aRKUeiPt6hC/KIPQNg1B7h2t1KNbGbcY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KStYFiRE5RWPG5qpQ+QbW8ibeSLHKNGV85p3VTlT9Pxhst1gsFHiQjHlZpu88ez16
	 +v7uqlvYkcqujE8T24ekuHKytGacZK7Y4A9jSvc4cCfQrSEJrSH5BzmjZ+5iL6vtmy
	 FKGE1hgb3fRjW5neZxVhvep7YJR0TLhgPBRgNoWtZeHOfexcyrMhBm6H4oE9/Itp1b
	 8znLopYK9ZfsIaTVWlpx6zQClseP/KrzA1WT2KpdCb+UNJ+0CJfRuaelwtjmb0aMGO
	 8uM3CH1Q2SXJWEsKid2NVXk9nyJmY48TSbYgcxEFcKuW+wwgLaIqt1eoycd+MTMUXe
	 y9akAGGe1RAQQ==
Date: Mon, 17 Nov 2025 09:47:51 -0600
From: Rob Herring <robh@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: sprd,sc9860-clk: Allow "reg" for
 gate clocks
Message-ID: <20251117154751.GA2238642-robh@kernel.org>
References: <20251029155615.1167903-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029155615.1167903-1-robh@kernel.org>

On Wed, Oct 29, 2025 at 10:56:13AM -0500, Rob Herring (Arm) wrote:
> The gate bindings have an artificial split between a "syscon" and clock
> provider node. Allow "reg" properties so this split can be removed.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/clock/sprd,sc9860-clk.yaml       | 26 -------------------
>  1 file changed, 26 deletions(-)

Ping!

> 
> diff --git a/Documentation/devicetree/bindings/clock/sprd,sc9860-clk.yaml b/Documentation/devicetree/bindings/clock/sprd,sc9860-clk.yaml
> index 502cd723511f..b131390207d6 100644
> --- a/Documentation/devicetree/bindings/clock/sprd,sc9860-clk.yaml
> +++ b/Documentation/devicetree/bindings/clock/sprd,sc9860-clk.yaml
> @@ -114,25 +114,6 @@ allOf:
>          - reg
>        properties:
>          sprd,syscon: false
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - sprd,sc9860-agcp-gate
> -              - sprd,sc9860-aon-gate
> -              - sprd,sc9860-apahb-gate
> -              - sprd,sc9860-apapb-gate
> -              - sprd,sc9860-cam-gate
> -              - sprd,sc9860-disp-gate
> -              - sprd,sc9860-pll
> -              - sprd,sc9860-pmu-gate
> -              - sprd,sc9860-vsp-gate
> -    then:
> -      required:
> -        - sprd,syscon
> -      properties:
> -        reg: false
>  
>  additionalProperties: false
>  
> @@ -142,13 +123,6 @@ examples:
>        #address-cells = <2>;
>        #size-cells = <2>;
>  
> -      pmu-gate {
> -        compatible = "sprd,sc9860-pmu-gate";
> -        clocks = <&ext_26m>;
> -        #clock-cells = <1>;
> -        sprd,syscon = <&pmu_regs>;
> -      };
> -
>        clock-controller@20000000 {
>          compatible = "sprd,sc9860-ap-clk";
>          reg = <0 0x20000000 0 0x400>;
> -- 
> 2.51.0
> 
