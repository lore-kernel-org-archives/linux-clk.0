Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F2738E8AB;
	Wed,  8 Jul 2026 10:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783507724; cv=none; b=myteRj7A/De9KHKZxeNPJnWCMUILZ4Ru56TMSU/GZY7PBZIbTVK0AvqcrtjDV2Nzr/MBU4iJrEhJkhTKaVJXhOv9vRunrSZ8fwe/57QsGW8bPTWzWA8OP2Pde5lFbPciHYrWB2jMgdQ5yqS2NJbhHMdV5w6ipzJmBvUfeGdFEyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783507724; c=relaxed/simple;
	bh=sSxrXHIiol6K68Kynd8VbnDP+DqRF2ZOla/iSySA6Fs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G/erYM+FabPAElD0oOJz7qnAt4vXnKXGSDNrlP7BiKrb1hnIL5XiKXS75PSpqqPCOXQGjB7VEHWHcpwSxEfYPPzMHzQ/vzya1ne8crX7wSJJmWNXLgtt5OZCJYyIXzMWstF4vXHNKKg8gCTkuWHl1/07IhbkSYpQP4KXXpDJCV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cl3NmNog; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cl3NmNog"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1C6C1F000E9;
	Wed,  8 Jul 2026 10:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783507717;
	bh=f2CSTVwFVH+AbaV85YH+CkKOMTVwojvRW+8+KKtv958=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cl3NmNogNa6gT/AcDhyziTmEC3tg5A7FkXgcZ5JcMXdrrJyQNEpK8R3LCGEKn4fQZ
	 QZLiLkV28fWQ1Eklmpdnia+dsD4Fmx+JGIlMFo1KbZsk7S6QjTLgXhdn2SWv59rVRC
	 O/eVHIVdWzMYhUytFW3DSt/Zu/c/vd6mfXyt1KG/qOeXZM8MgfcAMvh8ry6Wzc/Oaw
	 OwEMifL64Pf6NtGgjZQwcPQco87jycaqhNGAfNhkkRD6QNl2VV7RebXwcyl/IjkRUv
	 i5eC2WoTOVID+cJCImRveQcBgJzGGfbvfQzwVh6R1DlzrxYWPubR5p8sACWA2SHg/B
	 +7PiWS+OUK5hQ==
Date: Wed, 8 Jul 2026 12:48:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: Add IPQ9650 REFGEN clock
 IDs
Message-ID: <20260708-private-sensible-oxpecker-faa31c@quoll>
References: <20260707-b4-ipq9650_refgen_clocks-v1-0-e070624d03d2@oss.qualcomm.com>
 <20260707-b4-ipq9650_refgen_clocks-v1-1-e070624d03d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260707-b4-ipq9650_refgen_clocks-v1-1-e070624d03d2@oss.qualcomm.com>

On Tue, Jul 07, 2026 at 12:25:23PM +0530, Kathiravan Thirumoorthy wrote:
> Add the REFGEN clock IDs for the IPQ9650 SoC. These clocks are used
> to enable the REFGEN block, which provides the reference current to
> the PHYs in the SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  include/dt-bindings/clock/qcom,ipq9650-gcc.h | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

