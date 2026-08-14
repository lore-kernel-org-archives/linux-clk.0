Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF09C3D649A;
	Fri, 14 Aug 2026 19:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786737283; cv=none; b=FDF0OdBUcUpwU4KF2znYY4NQ17fxuykT/b8+OzoDxsSgK77W8v4V6ljwryrd0TixFfRdAT25NpEarrA+k6vM20nLV736a4TKCVbta/FING3cHSnA/U0+ylNLaBS/1t6ourQ7jGN1gvwGfioUebrhjQbZMc8SnPAdrcFBpRJg0g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786737283; c=relaxed/simple;
	bh=uZYdKvU2PBk8Wi84O8Yoa7337PmiUHsvhV5PVHgVduo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hCSolxX9uy2u/wLCC2muYHnwSYhsfXSkKAtUp0J1knZsDimuzcidX0283EKuZi2JeMlZGmHXHWZcJ5Y8LMUutkXezWpdnWBvrIU/+ZAalqDKux0/6jjtG7x5PRLDby2eGO1g2FdN2rULlh4CZXrvP1ZWelOJfS8VEQaCu58EvPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NyXGEAjF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NyXGEAjF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D87EF1F000E9;
	Fri, 14 Aug 2026 19:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786737281;
	bh=vkPUPM0F5Jzrrf4BI8V2ZoWXPFNKEQfTqfAHiwsqbVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NyXGEAjF29CEeK5NK+7nWRO5bTkyJtrwr+e4FZUXwdVDfBtMnmwL/vWGi42E1t1ne
	 3I6PSETUk5OWCVCA+h4T45OupyAUwDlw5iQnniMEQ44D9Jnbleissk22Jm/Sw0ROtP
	 mxKOLadA6LGLGOCGGeNx0YF8a8OeE0J4JJQ8y6fIPcO/QIj9fmoTttj18wuWxJ4Lv7
	 McakDFzMuHMOK0fF3aVV9PNUIvWaCb6Lu8Gw9xMVROUFH77G49CKZ6z2s2crrzPXQV
	 rqLRwzGJ+7t+tJNuHArgHhCO4IDibJmfsrw2VEJeLMCJxURS+kT3fomUBrDnyadMlI
	 8thDPTfZInvzw==
Date: Fri, 14 Aug 2026 14:54:40 -0500
From: Rob Herring <robh@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@ti.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com,
	simona.toaca@nxp.com
Subject: Re: [PATCH 2/2] dt-bindings: clock: ti,dra7-atl: convert to dt-schema
Message-ID: <20260814195440.GA2792097-robh@kernel.org>
References: <20260813-ti-dra7-atl-v1-0-27b691f4cdcf@gmail.com>
 <20260813-ti-dra7-atl-v1-2-27b691f4cdcf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813-ti-dra7-atl-v1-2-27b691f4cdcf@gmail.com>

On Thu, Aug 13, 2026 at 12:41:18AM +0530, Bhargav Joshi wrote:
> Convert the IP driver portion of the DRA7 ATL (Audio Tracking Logic)
> binding from the freeform text binding to dt-schema. Together with
> ti,dra7-atl-clock.yaml this fully replaces dra7-atl.txt.
> 
> ti,hwmods is marked deprecated as modern DTS uses ti,sysc target-module
> wrappers and the property is absent from current dra7-l4.dtsi.
> 
> bws/aws maximum set to 15 per the 16 mux sources in
> dt-bindings/clock/ti-dra7-atl.h.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
>  .../devicetree/bindings/clock/ti/dra7-atl.txt      | 56 -------------
>  .../devicetree/bindings/clock/ti/ti,dra7-atl.yaml  | 98 ++++++++++++++++++++++
>  2 files changed, 98 insertions(+), 56 deletions(-)


> diff --git a/Documentation/devicetree/bindings/clock/ti/ti,dra7-atl.yaml b/Documentation/devicetree/bindings/clock/ti/ti,dra7-atl.yaml
> new file mode 100644
> index 000000000000..5460432219a5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ti/ti,dra7-atl.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/ti/ti,dra7-atl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI DRA7 ATL (Audio Tracking Logic) Clock Controller
> +
> +maintainers:
> +  - Peter Ujfalusi <peter.ujfalusi@ti.com>
> +
> +description:
> +  The ATL IP is used to generate clock to be used to synchronize baseband and
> +  audio codec. A single ATL IP provides four ATL clock instances sharing the
> +  same functional clock but can be configured to provide different clocks.
> +  ATL can maintain a clock averages to some desired frequency based on the
> +  bws/aws signals - can compensate the drift between the two ws signal.
> +
> +  See also Documentation/devicetree/bindings/clock/ti/ti,dra7-atl-clock.yaml
> +
> +properties:
> +  compatible:
> +    const: ti,dra7-atl
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: fck
> +
> +  ti,provided-clocks:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    minItems: 4
> +    maxItems: 4

As the phandles have no arg cells:

       items:
         maxItems: 1

With that,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
