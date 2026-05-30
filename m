Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34CC3546D9;
	Sat, 30 May 2026 09:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780132284; cv=none; b=hTEImY2Qu6kHE0Guy3IM47WGNef/sg8p4cEvaEyTxZz0AwwXa5B2ED/JcHE85NmMJzxtfhl9HWqOAyZxUiHXoCtcahBZhig5M4lDMpSkjnE/gvL3oh+ibLeyzQJuQMVXCu5vYh0OOz5BdsR2tagOUE1FvfJpxsHq+aoyDI/yyYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780132284; c=relaxed/simple;
	bh=W720Aq1nCQWl0Ht2vGuWZd+WQIbt1iq5WLpyoNUpiXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=daf34ksTp/ET7tDNhimu2n3L3TRd+Snr/zNEwdYMrMclN/UTaFacZKVHzMw4qfjVqGtt9+CY+TNwkkjugfcj1Bf791KLpGTow4IfADevP33rUgenTFhDYkenN3SrQtLkbjjOzonDYHY+AVdmO7ncqzuE4GONlxHsufXzvQiLxU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nw7tbJlY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nw7tbJlY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CD961F00893;
	Sat, 30 May 2026 09:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780132282;
	bh=QpO7LSK6Od32eyZvVmC3+QBio9VeS7bWPnEw+gvb6SM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=nw7tbJlYrET2AADeNl89EEeuMlOrhpajpfyF3EOJUXZ6iKhsOSars0KnxAsuPQTIO
	 EnRereKDhXte/BCoKe+s/BEuNz17kl/tXF9fjXKQxUNgOVDC8etKnP9c6hq2xrLmZd
	 eHWVoZZW4INgum9bojrLXvvPccoKlYuIUEkm2EFmI0N/c3RZL64DYFAH/Pm1IAXQMn
	 iQQXIz74BMy97FV8tT/xKPGHca7UVCxF3FYyZl/dmS7uSSL59KeeAHEFcalQJ0E+r8
	 mxTWmT1V2NTp56oHNQhRGTjY+oVfp60Rz2ZSccAYtiZCr1WA5kp/cN5Mdb3HdH2YeV
	 TYlC2yQbyWHGw==
Message-ID: <dba033ec-1939-40b8-8aa0-26750b9bd591@kernel.org>
Date: Sat, 30 May 2026 11:11:18 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/7] dt-bindings: reset: cix,sky1-audss-reset: add
 aduss reset controller
To: joakim.zhang@cixtech.com, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, lgirdwood@gmail.com, broonie@kernel.org
Cc: cix-kernel-upstream@cixtech.com, linux-clk@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <20260530021642.64059-1-joakim.zhang@cixtech.com>
 <20260530021642.64059-5-joakim.zhang@cixtech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <20260530021642.64059-5-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/05/2026 04:16, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> Add schema and reset IDs for the Cix Sky1 audio subsystem (AUDSS)
> reset controller.
> 
> The compatible string is cix,sky1-audss-reset. Reset indices are
> defined in include/dt-bindings/reset/sky1-reset-audss.h.
> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---
>  .../bindings/reset/cix,sky1-audss-reset.yaml  | 50 +++++++++++++++++++
>  include/dt-bindings/reset/sky1-reset-audss.h  | 29 +++++++++++
>  2 files changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/cix,sky1-audss-reset.yaml
>  create mode 100644 include/dt-bindings/reset/sky1-reset-audss.h
> 
> diff --git a/Documentation/devicetree/bindings/reset/cix,sky1-audss-reset.yaml b/Documentation/devicetree/bindings/reset/cix,sky1-audss-reset.yaml
> new file mode 100644
> index 000000000000..8e02ddd2517d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/cix,sky1-audss-reset.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/cix,sky1-audss-reset.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cix Sky1 audio subsystem reset controller
> +
> +maintainers:
> +  - Joakim Zhang <joakim.zhang@cixtech.com>
> +
> +description: |
> +  Reset provider for the Cix Sky1 audio subsystem (AUDSS).
> +
> +  This node is a child of a cix,sky1-audss-cru MFD/syscon node (see
> +  cix,sky1-audss-cru.yaml). It does not have a reg property; software reset
> +  bits are accessed through the parent CRU regmap.
> +
> +  Each #reset-cells index maps to a software reset line for an AUDSS block
> +  (I2S, HDA, DMA, mailbox, watchdog, timer, etc.). Indices are defined in
> +  sky1-reset-audss.h.
> +
> +properties:
> +  compatible:
> +    const: cix,sky1-audss-reset
> +
> +  '#reset-cells':
> +    const: 1
> +    description:
> +      Reset indices are defined in include/dt-bindings/reset/sky1-reset-audss.h.
> +


I am not really reviewing this, since you never tested it and did not
follow the process, but to spare you one review cycle - no resources
here, so this is NOT a separate node. Please read writing bindings or
DTS101 slides.

Best regards,
Krzysztof
