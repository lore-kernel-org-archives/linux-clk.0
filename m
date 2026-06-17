Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E343B3CE4A3;
	Wed, 17 Jun 2026 09:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781690323; cv=none; b=NuLJ2yRS1xAKyWIMTctOHGQddqgLuBG/J7EurCYQOAddWWIzSSzf0WKKBeXzwHXVbKG/VSzwTeJToc3RByRXI0d+HheV11YIsKZ+alrESjSOzaoM18skhY5ul24MZa7V+JGejmA5yGJxqClDm5GFCgEu/s72Z5jL3jUiTdoz7to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781690323; c=relaxed/simple;
	bh=pX65t2txArkHcwDg3wemWwTziKw33QD1Iq9DsnJOjHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L6GIL7vPbfNywpiCMan19EzPa4uHuGPDiKS/pZ4EvHvkbvp/e8eYFRrdL1fyS9rR+9DlDxeN3XA6r7b3KV/wDjzc71zjzmq1dEWwe4+AKfrcw0Hgpr8wHapLONoy8QR9HUtwT3oF8siF6HRumQSW54AA1fntwiAKwABKPYHTbus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l8kJnIBm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l8kJnIBm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5C081F000E9;
	Wed, 17 Jun 2026 09:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781690322;
	bh=vf55Z27wBvYv5++UeYCjXZHA1iYmcLSXC7ozvIxrmWQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l8kJnIBm1jSmrk2QikHqGG6bK1/5+Ofq3pmQ45J9JHLQXBFissEibc1nEPgk60hw6
	 mBZ3XvX9Y0pV2Ve5kuvKvUo14CtbLx6pPoUzyfVVbM18ux/1qHODNcUF+zmUo+mFVp
	 q1i6Zn1dTeBQJMk9HGbyr7H8LBrdwWw6Mm0SJ6wbKLluYCoC3x35r8BKFiVdMY7p0H
	 OYnxP2DKGkR9ZBMwH2IsFRGXt8d+nHVDCAlcyhHFQGlpaWmMhXR1yT3EjsU5whp2Sd
	 JEesksXMx4E3wbx9EzkoNxnfFYzzxmelGRdy1iXgLu/9PPiuPbzqn3u7bKzmUQILRC
	 HPsXjlZPSF+7w==
Date: Wed, 17 Jun 2026 11:58:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: joakim.zhang@cixtech.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
	gary.yang@cixtech.com, cix-kernel-upstream@cixtech.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 resend 1/5] dt-bindings: soc: cix,sky1-system-control:
 add audss system control
Message-ID: <20260617-resolute-sarcastic-orangutan-0fcf73@quoll>
References: <20260617064100.1504617-1-joakim.zhang@cixtech.com>
 <20260617064100.1504617-2-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260617064100.1504617-2-joakim.zhang@cixtech.com>

On Wed, Jun 17, 2026 at 02:40:56PM +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> The Cix Sky1 Audio Subsystem (AUDSS) groups audio-related clock, reset
> and control registers in a dedicated CRU block. Software reset lines are
> exposed on the syscon parent via #reset-cells, following the same model
> as the existing Sky1 FCH and S5 system control bindings.
> 
> A clock-controller child node is required under the audss syscon. It has
> no reg property of its own and accesses the parent register block for mux,
> divider and gate fields.
> 
> The AUDSS is also controlled by one power domain and reset part.
> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---
>  .../soc/cix/cix,sky1-system-control.yaml      | 48 +++++++++++++++++++
>  .../reset/cix,sky1-audss-system-control.h     | 25 ++++++++++
>  2 files changed, 73 insertions(+)
>  create mode 100644 include/dt-bindings/reset/cix,sky1-audss-system-control.h

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

