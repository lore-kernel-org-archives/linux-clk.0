Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794341235;
	b=wR/CoCyfKShy26FZMK8Vi7uPv61mEhdJsPyZuHsllYEBP4Q67tp7Lgj1mor3oMvDo/I2
	 v/vYf/H0G8OZSmR2h+jN+EJLUTOEKOPhbASJXUezcTyusE8Vga5ymfl4p7JnfIfuFnC+F
	 rjGrdprSyLhHXSxbyvu4sS6Z9BEerv63C6ntKqESSYv/K1pE9L+onLspbWxeTG1/bhEkT
	 4Q+Q7hm4j9S3dMyDR7wgBp3OXUOOxr6NSoDENsDJwnjPnK5MFMmwZbITX4NZhuMGo3yJ6
	 3UKP5MxRdZTzOdeUaYbqNtNzIi6EDjE5K+xwDpcO9qJuLsQzCRqapvvceIalCk8I3jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794341235;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=bq7gVJQHWBjqS6F+14wEEAlhv/2t/NZ6mUvTScCYERA=;
	b=glrTyMlt95sQSGtBPhnjJ3KWAaehuS1pIhp95u4T9X8vh1HEzTeAcDXZGbILq3CaNi9m
	 fgb+lH3s5FTzjHA9wZ/s6byj3Kf1qG5FK1GfE2lZSH6zWJ26c4nRVonpt0llY82Ws35KG
	 V0XXvDJrTgbTBCEwhvPhEcNqojIlcINr9Y7skbEjKRGTM1VGcX5KNnbe8jVE5K+4V1P20
	 tDV/qejhW8692CJaYGu5SJg+llfiJzD6CRFKqCNUN6DtHO1AWCAkO+ZFNnCw8BX6oU00j
	 LoEmPYCZrSS4Nrlc/lEef/Q4y4qstT+wlbYKUQV286rQEyeTvWQfCxsXbb09yhhP6ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aM0wUI8u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6F5606A31C;
	Tue, 10 Nov 2026 20:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aM0wUI8u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 222D51F0089F;
	Tue, 10 Nov 2026 20:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794341234;
	bh=bq7gVJQHWBjqS6F+14wEEAlhv/2t/NZ6mUvTScCYERA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aM0wUI8ukQcFIWwnLH7kYFVIKM+u4kUIHKxe4DFZeS86o3iCDvERJuhE2OHADygW/
	 75SPx/TGsJ9wItILS7lR2s+wdJDBFA1vYLbDB1tuRS0ITTic6aJwf3Vne8kQpgD9RE
	 nlf3NGZg0U2MGqQP0cBoxsFIDvfx8spTnN+wStxzXreehGhG7t6/heXQE+0rXgsdpv
	 AorWslqjlAV5KmhH7KA8+n0X2A0B9nK2FZWh2ZKQ7JaJHKn2ZAon0ua8MQTbBz1ycz
	 42GSHtDZBxbkixL1remC9DVOj2Xmisu2zF1pDrsBCJgH+k3/I0c4Cn8tvQ6r/tepXG
	 uSDN3vQTI8m2Q==
Date: Tue, 10 Nov 2026 14:07:10 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Jerome Brunet <jbrunet+clk@baylibre.com>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Stephen Boyd <sboyd@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Abel Vesa <abelvesa@kernel.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, Brian Masney <bmasney+clk@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v11 5/7] dt-bindings: clock: nxp,imx95-blk-ctl: Add LDB
 bridge child node
Message-ID: <179434122994.1702778.1936835522870745685.robh@kernel.org>
References: <20261110-dcif-upstreaming-v11-0-9e13c85ae0d8@oss.nxp.com>
 <20261110-dcif-upstreaming-v11-5-9e13c85ae0d8@oss.nxp.com>
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
In-Reply-To: <20261110-dcif-upstreaming-v11-5-9e13c85ae0d8@oss.nxp.com>


On Tue, 10 Nov 2026 14:27:45 +0000, Laurentiu Palcu wrote:
> Since the BLK CTL registers, like the LVDS CSR, can be used to control the
> LVDS Display Bridge controllers, add a 'bridge' child node to handle
> these use cases.
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  .../bindings/clock/nxp,imx95-blk-ctl.yaml          | 24 +++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

