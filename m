Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794752902;
	b=ICxWJkTC7srU0vj5hLavexgL7kQv9g5/zC01ytkVtiD1HPcbGJKKHXAWnL7JNA8Vj5CM
	 3Qf8XSZeKylA4uCMNBbWIhOX1TXJZvinxOUUOWjAJkQ2KZrRN2xgyfe9kFwHMNzaKWF+i
	 VLb1hT5a8Cwxoq4AEcyHw1AP4nXGXHgCTRtETgJO4QYIOyJ3q7fGD7qSwGbC2tII7zG9X
	 n/EOCBfXbmcjagPNlViQ8ha+UYfgqDhxePBTW2yb84ynBwYqhfc9AEtYsTpC2BFqcHPxL
	 bBZgXjzBh0nKBlO3Ap5lmLH+JWG/tzez7KzcDH07RzS69h/GgvAAJRhE/99GhgcYarw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794752902;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=zDDmPLN/vORV4feX+wDc3Z6tM6cjTEDR9e6IezQyu0M=;
	b=HHuH6VhUtWLoH0GIW+QbCZlKKKdgvdPIwgSoYHnTe0JWGwGJRQloG0txI/G/Pqp+DL1u
	 Aktbbu1kzuJEraA3vaqmibyqJRQDWd+KyLsrjA+SHtkyvlzQdYbXW7bo9RpqujdmGVZ5s
	 AFotYtX3c6UXiqxHshm0vr+WQrfCIoe+IhIjgGixpvHrtrRv7a4fjkq3e3maGAT2UvtWS
	 qmaYjS/hPAED3Urmhnum4xvHn7VOBmhxjSAOxbm9cHd1T3vi/IHvOJwM+cZeNtu3kRjsW
	 3L2tNFCzoecGRN1UndH6/NV0WNZ1lT7FJFPSCQ5xCFu0SkzjuoV/6aKFNh+fWJM/SZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KNppYKNq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C98606A327;
	Sun, 15 Nov 2026 14:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KNppYKNq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B3BD1F000C4;
	Sun, 15 Nov 2026 14:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794752902;
	bh=zDDmPLN/vORV4feX+wDc3Z6tM6cjTEDR9e6IezQyu0M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KNppYKNqzAJleubEyIv/tWcxOhGjxkZs7qlH7GlP0JYNDiCL7lENbyJ+nXwmcWiMC
	 Reg3MLIFS+xZuxjjwylVdR7VvoH//ltRG03j+abTQBtg7T9N2I3RRSAuRhce175fRI
	 n/Cm3kro0Bh9qdcXcU4lrbnzhLstY9arcmnXrgTrmL8KSNBM5pwA6BSfCH8ktju6mG
	 Nh4PNvJlJaP0MuNpD8hKiNt8u/vq7OYDVvUaT5sqazJURpHw5yFglqvPXIpXEKdP/A
	 UehrxSkjDzJLMCkxMehfDbvhChes7bbU2ngU/0Q2tI41djj5YZAGiYkqnh832xmLTl
	 rJfBUnDnOeDvA==
Message-ID: <ae8bc8ad-3846-427a-8910-e33ce07f599d@kernel.org>
Date: Sun, 15 Nov 2026 16:28:18 +0200
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
Subject: Re: [PATCH v4 11/16] nvmem: microchip-otpc: Expose UID registers as
 2nd nvmem device
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-12-ada@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <20261105110715.2486432-12-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/5/26 13:06, Alexander Dahl wrote:
> For SAM9X60 and SAMA7G5 the Product UID x Register containing the Unique
> Product ID is part of the OTPC registers.  Expose this unique id as
> trivial nvmem device in a similar fashion like the soc sfr driver on
> SAMA5D2 does.
> 
> Signed-off-by: Alexander Dahl<ada@thorsis.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@kernel.org>

