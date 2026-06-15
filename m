Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9A93B6C16
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 22:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781560902; cv=none; b=Wdxii/JuEInLAR1ZhL6EtFRtPSyzXwIjq0YvCGzqYr6Hz5CWuJ/23FlXRUPXjR4s/nudGO0BUlnEyQmbiLGjxkj3lugi+XKRvL0xPYS0lJhsy69LqnLpWnwsilT1LO5g899y9iqyJSFmUSrgPJWFYipdI+ci+i6OxP2LMXUrjXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781560902; c=relaxed/simple;
	bh=KQya+UdDlavUkX/Dssd0LzS1SHmdLAk2q4vV5a+8SBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YcbRcHPV6fplO06H5O5gMouxc0ToC2KYDZd4DHQzkhdGvy8aV+5qiZfGnpty1WkCMwD19zn8gVZZCUirb0QntiOdZro6qo0iuQf2IPh+PVgMU7TwzSLG1AKFbtOaDLHGDZldUDt4NYcYK4ysyAJ+Fbf8wTHjndHJIpdcyAuyxLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JH5Z5qNN; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LRtkJ9vz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JH5Z5qNN";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LRtkJ9vz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781560900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=baYX1Qtzf/n+O1i7trf2KNQTHTp/T36Knv9xiG+6gR8=;
	b=JH5Z5qNN59p9SJ+eEdx80qhOKxLbU03oMIfTQBJAd5YgY9LNhcEoF0tQXAm8pVj1Gm6MPI
	QHj4dkmFRdJTun34UShFEnZf4oXW2hvdjmswE0F+rRoD8c/0hA1V4ztiFXsTSloZC4xPO1
	QOCmBCq3W3BfY7twIDhtTV4IPp4W7HM=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-fk5kB2DWMwynFim_JJX3rA-1; Mon, 15 Jun 2026 18:01:39 -0400
X-MC-Unique: fk5kB2DWMwynFim_JJX3rA-1
X-Mimecast-MFC-AGG-ID: fk5kB2DWMwynFim_JJX3rA_1781560899
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4867831a9a8so5798370b6e.3
        for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 15:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781560898; x=1782165698; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=baYX1Qtzf/n+O1i7trf2KNQTHTp/T36Knv9xiG+6gR8=;
        b=LRtkJ9vzD7YJ2twTswRUR69q7pcEVA70GOV2CYt57hUYyjT+GqDSQ4uoQvLRI6E4f5
         WpwwY2lFoEGR0WDxBnyiSw22TXzTEGk/YAvjhn+94qwAnglsKPyC9GWUPQowFfo7rqCw
         rYVw27UwfEtO3B9IdoH/XUPKPDZi+d3eCl3He+lDKJRvZmOlZdrA7qEjlyZZjOT/MC7M
         4HMN/yQu56RdPw3YHG5rEpxaebLSV19ZaqBW42njx8ccsKfs4vGpJxE8X6YXRHVYTvYo
         6eMqi4Cv8rwj2AYddf/uIbzaoNFpFhcahaawUalR1xePcUirKgq/l/plWUKohhFa9EpZ
         mABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781560898; x=1782165698;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=baYX1Qtzf/n+O1i7trf2KNQTHTp/T36Knv9xiG+6gR8=;
        b=KnB4r15URPx8Gb1C8BitmDXm5+1abUaVtOwsd/d0Ex3d7TI3OE31qpaUahY0VuDOm8
         ISPRkkXdXN9EXBWB/e0lLVn2LmiqI0p9nOPCFs8TU2DfTF4cc1ySeF9kEsOs5stZVl6A
         5/n5x2dwOCmaxHI2dJWc95eyHP8xvi02iCyR+bW6mewCUduM4KwiXY8X6rPfvLpIr179
         AZi+Fk51mtJUo1eP3PUvmYBZXGAN3QSQHul/FRBo9DxzTAoD6mkPXm4qQC6VCkfmNUMH
         IplyLgODMNW0JgXE0IirhO67jFdKYPHutQkBR2PLxaJWIe5mbzyp25NU1X/SToi+dmJZ
         wVBA==
X-Forwarded-Encrypted: i=1; AFNElJ+E8+FgmCNtrhFVFrfyKIsC88rU0ZvfFqNYSbtynuOmDwPLThHg3Ne52SD9fkt6ChU5RBNll6ZnFI0=@vger.kernel.org
X-Gm-Message-State: AOJu0YybqJN9zDwkNJol7Mlatk8NsZZGgFU7P70YK9m5JymEIkZEyekw
	Bdbh1xzvl8AVUzEk2s8/MLwwn3ygkgVNTfUGN/YrtLV+mduj1N1EbDbV07lALIkvOwFhMrbA6Zo
	6B/Bx+Zuidt1vzF2WH1QhDCwkWgelMgtkzNveIDBXudBynsNKVPO23xYK7LhMuQ==
X-Gm-Gg: Acq92OGrc4tlGrYlhmC5S31Oto6fGOemtRXXISoBD+k94IGM5amhM8SqzCZ3kM593DX
	QPkz6XCs7L2Z7QNmbhDOHSY91TPY/gbiNytfEMvY464kPHUBu29Gnd1A22RfwI/Ax9so+kgR/AU
	JKcDDhVt/VLtOmzbJiu2Vz2Y/k5uaPRFzUrbcMtNGFFvttryEC2JP+gS71A33NkcmhLiLRUy/ol
	ReO7LGQm4k336B2V1jJATg9hJEZl/mQXB2rVEse1kfcCP3KYD34lzvg2SiyVCtGhk3Yk4MUbv3x
	2YyFgmYuG95pTZGMXNIf+601G6k0m8bCEsYiJ0IDOVEQFzuthEowd7M+ih2agp8w0GuZUVTH3Rp
	9mawnGcNRpeQOBZBpnIB/+NOz27NO3234oYL3Fs+kyEMr8e3nSBX1v5q7
X-Received: by 2002:a05:6808:159b:b0:487:5b1f:2bce with SMTP id 5614622812f47-4875b1ffd23mr5600458b6e.36.1781560897995;
        Mon, 15 Jun 2026 15:01:37 -0700 (PDT)
X-Received: by 2002:a05:6808:159b:b0:487:5b1f:2bce with SMTP id 5614622812f47-4875b1ffd23mr5600362b6e.36.1781560897194;
        Mon, 15 Jun 2026 15:01:37 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb61eaf4sm120318231cf.4.2026.06.15.15.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 15:01:36 -0700 (PDT)
Date: Mon, 15 Jun 2026 18:01:34 -0400
From: Brian Masney <bmasney@redhat.com>
To: V.Yurkov.EXT@bruker.com
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: Add GPIO-locked fixed clock
Message-ID: <ajB2PhmxvdtsXNnm@redhat.com>
References: <20260603-feature-clock-guard-v3-0-01cca0aa04a5@bruker.com>
 <20260603-feature-clock-guard-v3-1-01cca0aa04a5@bruker.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-feature-clock-guard-v3-1-01cca0aa04a5@bruker.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Vyacheslav,

On Wed, Jun 03, 2026 at 11:16:42AM +0000, Vyacheslav Yurkov via B4 Relay wrote:
> From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
> 
> Some hardware designs provide fixed-frequency clocks generated outside
> software control, such as by FPGA-resident PLLs. While the clock rate is
> fixed, a separate GPIO signal indicates whether the clock source is
> locked and producing a valid output.
> 
> Describe a GPIO-locked fixed clock provider that exposes a fixed-rate
> clock whose availability depends on one or more GPIO lock-status
> signals.
> 
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
> ---
>  .../bindings/clock/gpio-locked-fixed-clock.yaml    | 70 ++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/gpio-locked-fixed-clock.yaml b/Documentation/devicetree/bindings/clock/gpio-locked-fixed-clock.yaml
> new file mode 100644
> index 000000000000..9106b800b673
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/gpio-locked-fixed-clock.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/gpio-locked-fixed-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GPIO Locked Fixed Clock
> +
> +maintainers:
> +  - Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
> +
> +description: |
> +  Provides a clock output whose availability depends on a set of
> +  prerequisite conditions. These conditions include the presence of
> +  one or more parent clocks and the asserted state of one or more
> +  GPIO lock indicators. An example of such clocks is FPGA clock that
> +  are outside CPU control, with the lock status exposed through GPIO
> +  signal.
> +
> +  The output clock is considered available only when all configured
> +  prerequisites are satisfied.

I'm stepping outside my usual review of just the clk drivers. Krzysztof
in v1 and v2 asked for more detailed hardware explanation. This feels to
me like this is a policy that says to not use these clocks until the
GPIO says they are ready. My gut feeling is that details like this
should live in a clk driver instead of a dt-binding.

Alternatively, if this is generic enough, then could
Documentation/devicetree/bindings/clock/gated-fixed-clock.yaml be
extended?

Brian


> +
> +properties:
> +  compatible:
> +    const: gpio-locked-fixed-clock
> +
> +  "#clock-cells":
> +    const: 0
> +
> +  clocks:
> +    description: Input clocks whose validity is monitored by this provider.
> +
> +  clock-output-names:
> +    description: Names of the clock provided by this controller.
> +    maxItems: 1
> +
> +  locked-gpios:
> +    description: |
> +      GPIOs to check the lock state.
> +    minItems: 1
> +    maxItems: 32
> +
> +required:
> +  - compatible
> +  - "#clock-cells"
> +
> +anyOf:
> +  - required:
> +      - clocks
> +  - required:
> +      - locked-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    clk_gpio_locked: gpio-locked-fixed-clock {
> +        compatible = "gpio-locked-fixed-clock";
> +        #clock-cells = <0>;
> +
> +        clocks = <&clk0 0>, <&pll 0>;
> +
> +        locked-gpios = <&gpio0 4 GPIO_ACTIVE_HIGH>,
> +                <&gpio0 5 GPIO_ACTIVE_HIGH>,
> +                <&gpio1 2 GPIO_ACTIVE_LOW>;
> +
> +        clock-output-names = "clkout0";
> +    };
> 
> -- 
> 2.34.1
> 
> 

