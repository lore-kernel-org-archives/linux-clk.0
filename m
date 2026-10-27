Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793099018;
	b=EquYW9qiiXH/3eD67Rr3vOsDgBKuZWYQUnjlwc8JM/ni63YhoKRMRBn3ucle68CDM3ca
	 lj3LY9DgVyExMMAIgTiNUl9XaAWMuysUodoOVRkFQro2RyxKXxnJVZwAB8LJwmaObhDHH
	 cuIUTa037i7+n/gI7zcq07yRCoZ7+G0UhkE/T65ixc7TrdhgQvhC1YCnyl5wYbu21RocO
	 O1QLEYxQrWbKEMf1lMhL51JMB5mNXoe0sT9WM7Ho174DRa2DkbA3csMoRLLXaEaGRZl6w
	 gZ27oFLrsbuNPKVWP4RsX2f3OigroHFCSsyXiUiOvt9SGH56N+AbQP2q/3IBQgxHPTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099018;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=yAbU5I2eU/VIR9BDkWK2xzH7j/NK2q9jtYmR8/DGsU4=;
	b=dc933CUzGUzYo/H+g5xuDjEVXOwBlKW7WqprYdFxO4OcEvfgddGQcrNuZP64KvloYXZx
	 o5erTFRZBjFWYvdDaHxkS2lYSlVoAjYCUuNqvz/K9PEUb7RDT4GZmE9e+db0z7GZ1Ccc8
	 Poo1BDPysQhZzxD3DvDtESUQyx95S8RATX0liudL5cqQrgiDZu4ybZvkmsWC1JZz47T5z
	 qGhFfPuQQnj856k+yUdl8uaodz6MIdydIW4PmFVEpOCuzRvkt4NhO1BE85KHmDUYyiiTz
	 V9F6IzjtYO13BEg+MsLIrvgit013Pa8Wa0Th/ZA84AqkILyi+VZN9fFfvWkzoujQfcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="WEThs2/Q";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80A5606A31D;
	Tue, 27 Oct 2026 11:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WEThs2/Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0203D1F01829;
	Tue, 27 Oct 2026 11:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793099017;
	bh=yAbU5I2eU/VIR9BDkWK2xzH7j/NK2q9jtYmR8/DGsU4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=WEThs2/Qu3ffSZECM0r6Y8xDhs8eOr1Etzm93ywP4PoBLKeJrSb3MkpfB6JFnxHMN
	 l2kXIklS6UZou1+p5GFf7ZFslidssCz+t1O2p8hHu87QNK532TO0EYohndrhA++7MQ
	 UDrkDn3qMPlSSVBGuwRuNj4hJvsqpFwL7HgqQe6nXagfeDEDtxF9kiVPqQv/gh4RvU
	 dpPAZv/uMOFGozhMKIyC5zw0lpwyPfyUYyT6bUi/zf3L4pN/Y74Teb/XQ3LlCZGIT/
	 4fGjAODJgeCkgyh43T57CN6BWux0C9M/iW5OX7Ua8YqNsZkatntCA8yDev1sJXf9qm
	 nO5VWdEK01W1Q==
Message-ID: <4aba41b5-0aa9-4a3e-8d8e-efc5ee45fc54@kernel.org>
Date: Tue, 27 Oct 2026 12:03:30 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: ti: dpll: drop the ti,ssc-*
 properties
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com, michael@amarulasolutions.com,
 Brian Masney <bmasney+clk@redhat.com>, Conor Dooley <conor+dt@kernel.org>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20261026074654.3997494-1-dario.binacchi@amarulasolutions.com>
 <20261026074654.3997494-2-dario.binacchi@amarulasolutions.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261026074654.3997494-2-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/10/2026 08:46, Dario Binacchi wrote:
> The common clock binding provides assigned-clock-sscs to configure
> spread spectrum clocking (SSC), supported by the clock core since commit
> a7f16660af39 ("clk: conf: Support assigned-clock-sscs"). Keeping the
> vendor specific ti,ssc-deltam, ti,ssc-modfreq-hz and ti,ssc-downspread
> properties would leave two ways to describe the same thing.
> 
> The properties have no in-tree users, so they can be dropped.
> 
> Existing DTS files using them continue to work, with SSC disabled,
> until they switch to assigned-clock-sscs.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> If keeping the properties as deprecated is preferred, I can add a
> fallback to the driver in v2.
> 
> (no changes since v1)
> 

I responded under v1, so same here:

I see the user:
	git grep ti,ssc-deltam

Maybe you ordered patches incorrectly. Anyway, properties with in-tree
users must be documented, so make them deprecated instead.

Best regards,
Krzysztof
