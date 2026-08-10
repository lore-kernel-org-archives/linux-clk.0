Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E8A42980B;
	Mon, 10 Aug 2026 16:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786380003; cv=none; b=PKllhC6oP1tb+1wuRvHRKaenXlcFlBudmEgTNkad7tZ154CSlboh2FMtcCTIFjw0uQ7YfrRk6YvVGKIR+CZQn5mHGfr0uBBMAW0KWrbkBZnqPuByMJUoqX5S+M0mO1ykctG6NUkUpW2S+osSc7WBAUZ/eXtQSleFIspkyAOd6/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786380003; c=relaxed/simple;
	bh=J2EKFbV5uPIeRjVB49gScK0JmOQ6riQ8asVv4Qn72lk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sdnUfKsigyZeVmnK5V5f6N3a3ub4cs0bovA/kM6wxt7Tgg7a1PHWUcNzr2kMaMSrtSo98lX3BObK6Avhx/ioPQqv9oEuVx16F5JzdSQ2o7fWIE8TekuRPB8qOL0yyxA4Lw+76hIjm+GxFPDOrC/bIjQHoL6fumT5TEPvs40A/m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X/+UQYtC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X/+UQYtC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42A4B1F00A3D;
	Mon, 10 Aug 2026 16:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786380001;
	bh=GIrix2w80bnR4i2Fv3Ik405K/J95zlZuy0rTalvQ8DA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X/+UQYtC/GxZTIiXOzhRVZrH0H336Ofs7uJXfWjbhJ1nzecpb8Zv3/LLV3wj9jqOZ
	 lVRQ3J9OdYE+laDsszVaKAlQttCrMSs6amc75jqf/1KtCROaY736c+grFFmi42QGHu
	 bokjKJgenfti19rTQpzUgAO0uvFsIpdHyevDfLnRZfqgzsUmIhtZPKEtSGmVpU83L7
	 A9gqLiTVLgPtdLg7cyklv8YFPzirIfXdEGqvf+ws6LoMNQMmZOAMeryKZxlLS5Kk+G
	 1GjzkEzaO4evfDWk6gOfGWKMWWfHzrA07tbjYJYT4rtILwAb+NW/hYxAIIZyPqPLwf
	 3++dTmmonpiFg==
Date: Mon, 10 Aug 2026 11:40:00 -0500
From: Rob Herring <robh@kernel.org>
To: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Brian Masney <bmasney@redhat.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: Add GPIO-locked fixed clock
Message-ID: <20260810164000.GA1846263-robh@kernel.org>
References: <20260726-feature-clock-guard-v4-0-e9c8b372b71c@bruker.com>
 <20260726-feature-clock-guard-v4-1-e9c8b372b71c@bruker.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260726-feature-clock-guard-v4-1-e9c8b372b71c@bruker.com>

On Sun, Jul 26, 2026 at 05:40:24PM +0000, Vyacheslav Yurkov wrote:
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

I think you can drop this. Just update your author email.

> Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
> ---
>  .../bindings/clock/gpio-locked-fixed-clock.yaml    | 59 ++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/gpio-locked-fixed-clock.yaml b/Documentation/devicetree/bindings/clock/gpio-locked-fixed-clock.yaml
> new file mode 100644
> index 000000000000..4d17889c51ad
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/gpio-locked-fixed-clock.yaml
> @@ -0,0 +1,59 @@
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

Don't need '|' if no formatting.

> +      GPIOs to check the lock state.
> +    minItems: 1
> +    maxItems: 32

Please explain better how multiple GPIOs work? Why would you ever have 
more than 1 lock signal per clock? And you can only have 1 clock given 
#clock-cells==0.

Do you have an immediate need for more than 1? If not, I'd drop 
support for it for now.

Rob
