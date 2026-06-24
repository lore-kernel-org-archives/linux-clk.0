Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC9735E1A1;
	Wed, 24 Jun 2026 06:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782283790; cv=none; b=f1N3KVfdXT5+aT5lWP9VrHEc/33o///1QNP9x9k/7QCIkcDuYjB+nFGqDivYIi/1238TV3fmIjP4PUeAJbf4JulpxPQWzqqXltqULDNXbA83n7TnZp9YHTz3PgiSEUndiFxFFv/qx1BekLcC35mLiOAXuCXZEo34fmoHt3BRiu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782283790; c=relaxed/simple;
	bh=Jr/tC+wphnO1UrKNhVlddtBRjxmWYhreyvKQdWQWWN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AjgvcdZetgcNI6vV8iH5GgubSbuZ9owDJhloynzdG+co0swHL4kyZ4NgGVEU7vesd7th1KgGWiGmM8Mh8XpgMwOkqdPKLtzuVrVL2HLKC2c9QYxM66u7r4JF5mxqfj4IZNI5mIU1duiroxCr8AkxujBMC/7YHzYMoMNL18+pRq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T/NRgVAn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T/NRgVAn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A91D1F000E9;
	Wed, 24 Jun 2026 06:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782283789;
	bh=FkRf8oCoME6EAzb6TRQFzhDqGWGObt0np+ROSMUH2RA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T/NRgVAnXbQChFzjlIiqk4XdOFWD+atW8L779exuRdU+/PHgkDEfarn1pHoRR6xCj
	 6is5obfwbAQZVt/pYe+lDZ5++G6l8jxoZTro/NkHhnSpOivJ6D696g1WjOnJ/7rMY4
	 GJ8APisAdapr8A1nrYenuzXKV8I5QCMyUuIG9q7vT/CIpS9s/0oAc3a9mx+GRB0/I6
	 FJrN/72yYZxNNTIFwT0/zKbEX9qOAtu5ltZsUXUQOz9cqeaxsJ3vB2SMW79jaKUy30
	 rAiWmiUM0OhFHjxNnxrcD7oIrcdaeiTx0HnsaqEUOjvAJM7KntJs8R1dEZJy4RQyvG
	 e2Ns1vhut7uDw==
Date: Wed, 24 Jun 2026 08:49:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: joakim.zhang@cixtech.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
	gary.yang@cixtech.com, cix-kernel-upstream@cixtech.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 1/4] dt-bindings: soc: cix: add sky1 audss cru
 controller
Message-ID: <20260624-rampant-ubiquitous-turtle-f7edda@quoll>
References: <20260623070805.211019-1-joakim.zhang@cixtech.com>
 <20260623070805.211019-2-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260623070805.211019-2-joakim.zhang@cixtech.com>

On Tue, Jun 23, 2026 at 03:08:02PM +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> The Cix Sky1 Audio Subsystem (AUDSS) Clock and Reset Unit (CRU)
> groups clock muxing, gating and block-level software reset control
> in a single register block.
> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---
>  .../bindings/soc/cix/cix,sky1-audss-cru.yaml  | 92 +++++++++++++++++++
>  .../dt-bindings/clock/cix,sky1-audss-cru.h    | 60 ++++++++++++
>  .../dt-bindings/reset/cix,sky1-audss-cru.h    | 25 +++++
>  3 files changed, 177 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml
>  create mode 100644 include/dt-bindings/clock/cix,sky1-audss-cru.h
>  create mode 100644 include/dt-bindings/reset/cix,sky1-audss-cru.h

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

