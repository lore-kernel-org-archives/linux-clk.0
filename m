Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EBF37D118;
	Mon, 10 Aug 2026 06:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786345017; cv=none; b=G5t7GeFvRU1e8Fz3OObPcvCfoc75b7UGxwE9ogupARhBWfYGNRtVs/JKnXqZTpHVSMwfwYOTZgZ8+3CoO+PFccgm8lPsCVVymkmW8+UfUXJY2vfyYaEQcYgG8cuR3cLN8SZm0/WSTRGzxp9YNFTdd0CJ7vmoD22CnUOya2StO9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786345017; c=relaxed/simple;
	bh=63xbu0juar/jQGCcX5y2j7HJFcuTONYeRIwCeb6Oh/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GB2TrpwFovAZJx3biKPwlStiRdrFrjVB+IfFLCSeJPxorup5b0bQg2vA3yMe/afNQQeCleawkVcqu3cQQeATxbX5KlPbmrqNQih614lLi1O60J5S31/rCYePbQmFtlnUHoeytbGSMPfmb37YZI2bCmDhrOx6Q7ihwia8FR693MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TcpHIdoI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TcpHIdoI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E8241F000E9;
	Mon, 10 Aug 2026 06:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786345015;
	bh=r7JXU9tgkMwEFNAJYqtTseJogGvTLKehvhnDZMfZs3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TcpHIdoIuR6dCBooXqOoFl9Zuy9vIZy2K4NX4EwktQDzbGNCt+tCIjvPvCNdlRJvU
	 tRxvwJoXF8O2UDeq/QYauS14cB2lc7eHh2JfrBWntYRcJtZ3es/00EaFjJ2fr4tQPx
	 aGuGd5IjDFYebGhJPuHlHQO48d6DacMQVNyX/ZuN6fucEIjEVyJqqlS8rnyFWJASAJ
	 kg0/W4t3VKNDGEWuQhEXsvGd2Go18PMTvrDRhq3hq2sSau7tr6GygGUpQD6+fFrPO/
	 bQAhuoWTMnyPXX7NQPAJkX3zO09MUGQR/D82/P1ZlHurB0jShErx1pFMBXV5kZvAWE
	 sRBucqHZKmsyQ==
Date: Mon, 10 Aug 2026 08:56:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: bmasney@redhat.com, sboyd@kernel.org, mturquette@baylibre.com, 
	robh@kernel.org, krzk+dt@kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v7 1/3] dt-bindings: clock: cs2600: Add support for the
 CS2600
Message-ID: <20260810-hungry-authentic-junglefowl-bfd103@quoll>
References: <20260807155406.752721-1-rf@opensource.cirrus.com>
 <20260807155406.752721-2-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260807155406.752721-2-rf@opensource.cirrus.com>

On Fri, Aug 07, 2026 at 04:54:04PM +0100, Richard Fitzgerald wrote:
> diff --git a/Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml b/Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml
> new file mode 100644
> index 000000000000..630be30c160c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml
> @@ -0,0 +1,170 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/cirrus,cs2600.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cirrus Logic Fractional-N Clock Synthesizer & Clock Multiplier
> +
> +maintainers:
> +  - patches@opensource.cirrus.com

No group mailboxes are accepted. List here people which we can actually
contact.

I did not notice this in v5.


...

> +examples:
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      clock-controller@2c {
> +        compatible = "cirrus,cs2600";
> +        reg = <0x2c>;
> +        #clock-cells = <1>;
> +        clocks = <&xtl_clk>, <&sync_clock>;
> +        clock-names = "ref_clk_in", "clk_in";
> +        vdd-supply = <&vreg>;
> +        cirrus,smart-mode;
> +        cirrus,smart-mode-clkin-only;
> +      };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4a8b0fd665ce..c2328066fede 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6213,6 +6213,13 @@ F:	sound/hda/codecs/side-codecs/cs*
>  F:	sound/hda/codecs/side-codecs/hda_component*
>  F:	sound/soc/codecs/cs*
>  
> +CIRRUS LOGIC CLOCK DRIVERS
> +M:	patches@opensource.cirrus.com

Company drop boxes are not really working for us. I understand it does
work for you, though, but that's not what we want. Please come up with
list of people REALLY responsible for this.

Otherwise why would we want it in the Linux kernel?

> +L:	patches@opensource.cirrus.com
> +S:	Supported
> +F:	Documentation/devicetree/bindings/clock/cirrus,cs2600*
> +F:	include/dt-bindings/clock/cirrus,cs2600*
> +
>  CIRRUS LOGIC HAPTIC DRIVERS
>  M:	James Ogletree <jogletre@opensource.cirrus.com>
>  M:	Fred Treven <fred.treven@cirrus.com>
> diff --git a/include/dt-bindings/clock/cirrus,cs2600-clock.h b/include/dt-bindings/clock/cirrus,cs2600-clock.h
> new file mode 100644
> index 000000000000..bde505e17813
> --- /dev/null
> +++ b/include/dt-bindings/clock/cirrus,cs2600-clock.h

Same filename as the binding.

Best regards,
Krzysztof

