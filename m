Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794752890;
	b=Nkt8DllRNKJE/bhRGjPrQeDwIGZ/FXeiB1czsyl4jSkIhjvo39dHYKiu00PHJMazhmJR
	 TBqoT7NN/f0T6dIocDfKZwMZ2Ks255ffxEwocgKnOsfdEAx5xjLjIilqIz81WSHAWQZ4n
	 Wy87eccEgttEG8ht+n+Ec/VzAMfiggjozZFIblcnZQZxMXdWMxdzEGD9AR1FGUpPUwyNn
	 vy9nrDEGyzf3GORILXAxsgjKn+5PBEvEfHawzJ4i3R9bc4S+yBPIOgFyK65HfQ1ncYlPU
	 vNvQHgWVisiOinOn9G9yTWVHuCg5b1O2TqGhUN5LXx9avMGUEealp4+wGxWTaxG0Zww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794752890;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=sUoDtLVA9ljXZnRKq2GB/Pv0PB8RT4+TCqXc44SMSuE=;
	b=RBrU8paNZGDFPJSM0ljhQV10lTSerdzKs5O9cCsNPHtz447u+YFb83FY+u9PeNBntlZE
	 o8Ln3xG5g1/SuDXl2iemR0AkDUkSAf7TTXfOFHDVuWBa3W3BgNtHrouQJTdSFZb6kLM52
	 X2Etqa/fCo2s36B0/kXtBROUsnYYKcVTK0uPf+s5Wr0Q1hs6HsAK0I7nL+jriD7Yza0TL
	 GZ+b9hXffhbfzQly+mnmvg3GB679S25orzFqY7h0vD5F2ceYlUjTMbKXPO55pdkXvPsUF
	 gMLjuOJimpFxJgPetNgq0JvnnEtO4oUKkuTQLJIQ8KeWmz/vuIfm9v2vfbkd+FwJ/AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FDNxLs5f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B16606A32C;
	Sun, 15 Nov 2026 14:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FDNxLs5f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B9091F000C9;
	Sun, 15 Nov 2026 14:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794752889;
	bh=sUoDtLVA9ljXZnRKq2GB/Pv0PB8RT4+TCqXc44SMSuE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=FDNxLs5fRdTX2OfiBslbQl1uCUUqAX35bBWAmyyH6l3nAqHkyF3K5oOAbL2ofbzAX
	 wz0wFXqmOVOgqhHu+E/lK+tg2N5ZUkEg27SsRTUgVMN0hQ/ju3UkJBK8rP5/NVJr+X
	 PgBUIfNMgB/2Q+R2s8hJ5RVPt+HO+7BqGqmh+gE5a9jWvromvmK4qsKtXWUgiMJiqM
	 IX06SfdO5Bhg5oP7KKacBJR21OClkn314dQDKMpy8wUoeQdnyVoHZ3mT3Iv0r4Td2Q
	 hbm2hGsouezxMfZ6D5PdFxJ5pgLbKYtN9WuzAWgV9esBrb/RxfZY4WvIEgGSaEBRvp
	 nmCbGLBE0bFsQ==
Message-ID: <cde80ba1-a424-4467-b052-785931822014@kernel.org>
Date: Sun, 15 Nov 2026 16:28:07 +0200
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
Subject: Re: [PATCH v4 12/16] ARM: dts: microchip: Use new per SoC PMC
 bindings
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-13-ada@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <20261105110715.2486432-13-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/5/26 13:06, Alexander Dahl wrote:
> The bindings were split up per SoC before adding new members for
> missing clocks.
> 
> Signed-off-by: Alexander Dahl<ada@thorsis.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@kernel.org>
