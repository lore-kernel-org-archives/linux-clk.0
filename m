Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795029022;
	b=woAv/LmBlSZueS013w7VQf8LnaCCXr7LX15a84dZChSRnLHpk0No5RDuIDRI0w84d1de
	 xt/i/XMc+Lf76I4z1NCPk6y0lYecUDXPoT0zhPWanO+kzXXZLEa3bAmGDzDScsE15y/5L
	 0j+J/Qo8JT0o8iXZkv/ilqcyQFg8FndhX0F20vsBwB9PEy7HHBnIBq8ISutC518y2Ly7+
	 3uKWlLe6gAuVnzG08Aixnt5n/5h2fvjdevQ5Lws+jfNhxeM78w0mPNjCr7xa6kETnTkC0
	 uGAuYe7rcpZqoOedE8sw7AIRPfMaAli4J4BzKGq4VMSJsdQ8Tcs0jokTrYcVjGnDJ1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795029022;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UCh5hxQKcdbzNOsUZdCUK4aYJ8BLmHiwc+AaL/5mCtw=;
	b=W0dM8JEr2Y98saU5k5xpjQdnpK7e12ZUjIjIGVNOhNxMiMx17tfdpJErWhfOsdXvL2My
	 6uB1YO4vB63PvPyJGkdWnBF4emu4Q265+E4xRE+GgLWbu/hzFpzXbYu9H4Kio4Jg9i9kF
	 K5GftVGnAIgwpMrMnSSA3sUor67aAatST9quolgjUEPKGfMQ+YG6fKD0GFFP1t5jGjEVd
	 Qb2wejx8dAoCn7QLeGFadrX4x2XdOzet37VaFvtCkjO7kmePLPvvVwI6dVXgspKfb1H9S
	 wgvYSASSfD31IslaS8XZDGNuyyt6PJ7e06vf5QZ8Uo7LOsFiPZrWUVzZ2zgdCASDyDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k5HDhFWd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3C560A261A;
	Wed, 18 Nov 2026 19:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k5HDhFWd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1E961F000C9;
	Wed, 18 Nov 2026 19:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795029022;
	bh=UCh5hxQKcdbzNOsUZdCUK4aYJ8BLmHiwc+AaL/5mCtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k5HDhFWdwjKadxktuCmDcMvY+D3moREE+GETDz0pFNOebjgwsDrTn87jPGwHdYOW3
	 L8EeQr9uUYADO1ofNqcw94QXA0ad4XWFaCJpxob3CGBh+zTdfBU0MoAtTIHo+dsINM
	 Vk+U7DpDuOAiImIsXxCBaBEZvJavktPLwXMCzUAGcyMMzKf4jOMjzzFR1aqW+Ur2jr
	 NmyFmfVJnR2pLP76e5OJaD28i+sKjwkU2T48ZvYfxNtKA78yw34Lv9NEhVZ9XkCaQ2
	 6JHJFHzv+3QCM24PB1zGtor0DJLnniixl7X7/UJeGUQNJSadj2nRVVwN4FHDkmqX9g
	 WH8r046ydH57g==
Date: Wed, 18 Nov 2026 13:10:20 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: linux-clk@vger.kernel.org, bmasney+clk@redhat.com, tglx@kernel.org,
	cix-kernel-upstream@cixtech.com, vkoul@kernel.org,
	joakim.zhang@cixtech.com, radu@rendec.net,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	robin.murphy@arm.com, devicetree@vger.kernel.org, sboyd@kernel.org,
	linux-kernel@vger.kernel.org, conor+dt@kernel.org,
	jbrunet+clk@baylibre.com, Frank.Li@kernel.org, krzk+dt@kernel.org
Subject: Re: [PATCH v4 1/5] dt-bindings: soc: cix: Describe the Sky1 AUDSS
 DMA IRQ controller
Message-ID: <179502901965.259850.4106981988225434645.robh@kernel.org>
References: <20261117094408.1393837-1-Jelly.Jia@cixtech.com>
 <20261117094408.1393837-2-Jelly.Jia@cixtech.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117094408.1393837-2-Jelly.Jia@cixtech.com>


On Tue, 17 Nov 2026 17:44:04 +0800, Jelly Jia wrote:
> The AUDSS CRU contains a separate AP interrupt gate for each of the eight
> DMA-350 channels. The enabled inputs are combined onto one GIC interrupt.
> These gates are part of the CRU register block, not the DMA controller.
> 
> Describe the CRU as an interrupt-controller in addition to its clock and
> reset functions. A child interrupt specifier contains the DMA channel
> index, matching the corresponding gate bit; the parent interrupt is the
> combined GIC line.
> 
> Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
> ---
>  .../bindings/soc/cix/cix,sky1-audss-cru.yaml  | 31 +++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

