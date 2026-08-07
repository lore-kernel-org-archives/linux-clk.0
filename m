Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F5B37F313;
	Fri,  7 Aug 2026 23:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786143847; cv=none; b=IPFj167a6ZFGE1KxXn9TyoxfWqjKJaBrDQKV00ZUd6IsO7ICXzhM+ZDq6rp/rXBfNZQMvTHGkd9CNk2dyPRYCSHSuTxcoOg7BSbybckKxMHSfYad00yNtZPJm5ymToafRCZ5kqDQXTo6qaobzeXtCtNhZK8JqW0R6O8llZpj7WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786143847; c=relaxed/simple;
	bh=JSmYH8NUq9hzUQWk9dCp1q6Q2pn3+VvnBw14ktHgi/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ryQdosO1/coSUWBRZSr3Pxf/Q/ZdG4iusIW+DaLe91W1uDzLUQpdLZGYqd5ph5smRKEjSp5pCIb0ZC6XGCtVttyT08mtUQNt+8mxuTK1B1tV8eikbX7LoSMoks9s2gUQbUUDBiW2dP0EJpleReXLTrT4ay4+vfOMRkywjKlv1ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VV/XUYcM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VV/XUYcM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FBB81F000E9;
	Fri,  7 Aug 2026 23:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786143845;
	bh=kx1UpXBKBEnflfmlkyqXJx2dZdKyL+1i3Yt8CewuoiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VV/XUYcMh8D0sqYrzb6w4ag/Zg3apwKvX86mZCbG+yJ4BrEBzd6D/uVp6XAcfGVu9
	 xK0K3U1X6w18XuHNER8n2eiovHx2ki/yt8i7e4rVnNMVLrSy45/NhT9manywxGtTq+
	 OZpQGjBAa3EQOa05D0effL3x/zpXVwtZua2RfujaYDYnlAUiPoewfrtjKTwjxGbwhN
	 /QeJxfZT28juQPDOxN1mkQjQ4ccmqdX5aYPAPzJfb53i6n9RqrBwGrOEp3VB8xm3XH
	 80ccLuP5Q0vc1dAUkxDhwNkCnOjAuuInRU6AqpF9LSU3hKFCSwFnDBfzNJPOqrLHuZ
	 HHSyV1z1pS3cw==
Date: Fri, 7 Aug 2026 18:04:04 -0500
From: Rob Herring <robh@kernel.org>
To: Cody Kang <codykang.hk@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Haylen Chu <heylenay@4d2.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH RESEND 03/17] dt-bindings: display: spacemit: add K3
 Innosilicon DP/eDP controller
Message-ID: <20260807230404.GA2211679-robh@kernel.org>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
 <20260725-k3-display-v1-3-6de34d80e86c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260725-k3-display-v1-3-6de34d80e86c@gmail.com>

On Sat, Jul 25, 2026 at 12:51:12AM -0400, Cody Kang wrote:
> Both K3 instances are the same IP and share one compatible; which one
> behaves as eDP is decided by what its downstream port is wired to, not by
> which register window it sits in, so the binding does not distinguish them.
> 
> Signed-off-by: Cody Kang <codykang.hk@gmail.com>
> ---
>  .../display/spacemit/spacemit,k3-inno-dp.yaml      | 140 +++++++++++++++++++++
>  1 file changed, 140 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/spacemit/spacemit,k3-inno-dp.yaml b/Documentation/devicetree/bindings/display/spacemit/spacemit,k3-inno-dp.yaml
> new file mode 100644
> index 000000000000..865ea310daaf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/spacemit/spacemit,k3-inno-dp.yaml
> @@ -0,0 +1,140 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/spacemit/spacemit,k3-inno-dp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SpacemiT K3 Innosilicon DisplayPort / embedded DisplayPort Controller
> +
> +maintainers:
> +  - Cody Kang <codykang.hk@gmail.com>
> +
> +description:
> +  Innosilicon DisplayPort transmit controller integrated in the SpacemiT K3
> +  SoC. The K3 has two instances of the same block sharing one compatible;
> +  each acts as embedded or external DisplayPort depending on whether its
> +  output port drives a panel or a connector.
> +
> +properties:
> +  compatible:
> +    const: spacemit,k3-inno-dp
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +    description: Link and hot-plug events.
> +
> +  clocks:
> +    items:
> +      - description: Pixel clock for the controller.
> +      - description:
> +          Pixel clock generated by the DP PHY PLL; the pixel clock above is
> +          parented onto it in use.
> +
> +  clock-names:
> +    items:
> +      - const: pxclk
> +      - const: pll
> +
> +  resets:
> +    maxItems: 1
> +    description: Controller-wide reset signal.
> +
> +  phys:
> +    maxItems: 1
> +    description: Phandle to the K3 Innosilicon DP PHY.
> +
> +  phy-names:
> +    items:
> +      - const: dp
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Video input from the DPU.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Output to the panel or to the DisplayPort connector.
> +
> +    required:
> +      - port@0

Shouldn't port@1 be required too?

Otherwise,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Rob
