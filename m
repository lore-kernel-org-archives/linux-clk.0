Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80ECC3168E1;
	Fri, 16 Jan 2026 09:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768554271; cv=none; b=YVWN1aaBf2I/OGDv348jepDOdYKghUKm9CNVuH3ylr2jodcQSIOSKrTr6YkjNU/STNpIsDZqxQJ2mUfhISz/IdHj00sMkqP2Rx/412oAyt/WYtK7ECwOq9o32mW1AQOboWLLtFKxaoFvIygEnZVVCq2f4UOW3TZoY8+dIVNPGug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768554271; c=relaxed/simple;
	bh=GIje/pFENTe+tBZRGJcbMQHRfCT1ZHhm+UonxExDiXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b4FLSHUp4uUdZ3HW0hmXATL1sJ/zH/v00SPcEuvbcMjt9lAnaaB0GN5UvXznFq6Pti4iH+wu/6PaErCZgf4Sos93irICOWXUG6D4d9Ig6P2F28hkikvm3YUYrsFuIAR6tOX0HzX/O5YdB2AZs/YvaOkucI6TE7ErtcbQZPYC+sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZTmukUg0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZTmukUg0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE274C116C6;
	Fri, 16 Jan 2026 09:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768554271;
	bh=GIje/pFENTe+tBZRGJcbMQHRfCT1ZHhm+UonxExDiXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZTmukUg0ArB8JdfjD8xytrvKK46uJbur2TChbJ3/7xL7YySIdIn8enAR332dInyX1
	 fNmeNrzhN269fGZfh8OHA2yIlW3Tjnf1KPrDX7BiDf+m7nYyPfyD0dzk8TJLMJpcPJ
	 GRRC2FXzP45fGtXxqGZ1RuyjdxuAGSVFLbCjSdoonitF1jIfBcRGAVcyJH8DDWVos1
	 u376uVUp62JVeC0QHAZ2tt6mMjU4Da1ZXDayiduQcdmqPLsa/C0GgYMwxLrmWbLS6P
	 n19dKWdYr3QCyhcK3CMBt9Vdhwv9sxkiavKl1FTr2wqzBpyLqv87vQH5Ob25di23Rk
	 8vPCechDHB/9w==
Date: Fri, 16 Jan 2026 10:04:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, 
	Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, 
	mpe@kernel.org, mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, 
	agross@kernel.org, agross@oss.tenstorrent.com
Subject: Re: [PATCH 1/8] dt-bindings: soc: tenstorrent: Add
 tenstorrent,atlantis-syscon
Message-ID: <20260116-sloppy-daffodil-ferret-b5cebb@quoll>
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
 <20260115-atlantis-clocks-v1-1-7356e671f28b@oss.tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260115-atlantis-clocks-v1-1-7356e671f28b@oss.tenstorrent.com>

On Thu, Jan 15, 2026 at 05:42:00PM -0600, Anirudh Srinivasan wrote:
> Document bindings for Tenstorrent Atlantis syscon that manages clocks
> and resets. This syscon block is instantiated 4 times in the SoC.
> This commit documents the clocks from the RCPU syscon block.
> 
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> ---
>  .../tenstorrent/tenstorrent,atlantis-syscon.yaml   | 58 +++++++++++++++++++
>  MAINTAINERS                                        |  2 +
>  .../clock/tenstorrent,atlantis-syscon.h            | 67 ++++++++++++++++++++++
>  3 files changed, 127 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml b/Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml
> new file mode 100644
> index 000000000000..3915d78dfeda
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Tenstorrent Atlantis SoC System Controller
> +
> +maintainers:
> +  - Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> +
> +description:
> +  System controller found in Tenstorrent Atlantis SoC, which is capable of
> +  clock and reset functions.
> +
> +  RCPU syscon controls clocks and resets for low speed IO interfaces on chip

So not really a system controller, but maybe a clock controller - place
it there. Otherwise HERE you explain the rest of the functions of this.

You should post complete bindings, complete description of your
hardware.

Best regards,
Krzysztof

