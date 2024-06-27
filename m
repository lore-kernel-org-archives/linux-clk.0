Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7AE139D0A;
	Thu, 27 Jun 2024 09:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719480832; cv=none; b=j7/8UXZaFQOYTeM0MZ6cYZZg2cIlrvVyPHQmLNTR/kmlne1IdHyuNFrFSQbu6x5l+BYjN+VDiqm6TE09p+8gV5y4bEjpRBnTG193ijj1C4rNssNtkl0YYqF8YRtX2G6dKOp9zrq2WiaeeCK0B/OW7kPKXjH8lyCWIjYPMvbvz4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719480832; c=relaxed/simple;
	bh=KLuMXqR+MS8P13l+zugshwDLDpOMABzhmZMkO3CZO94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cUbPQy4u/EflQHwrb8l9N7zBLRnTNZdYbetK2mbYpClUwfPigq+tA5bVbqOUxUboMVrg8diEQqXJksvYjKvkFFSXWf2RhzyqFjRQrvbsZI4QQAVCoKmMl1kB0qKuu+pOiX0h62h1rD3qoSp/Dh+VKVGpoxplB0vvHcNrs/NLfH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gTCkWHsM; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gTCkWHsM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719480829;
	bh=KLuMXqR+MS8P13l+zugshwDLDpOMABzhmZMkO3CZO94=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gTCkWHsMLs0vGQx/T/F762RQpQh0BGayVYxVsjDhj3jnXm4Luc5VBD+EAiJFC/wNc
	 oZbgaVNqxCmmarHFJ83bpAHuccWqQSmFdq7aJdZ07cXVS4+2Z++a7kiEht2LMqFem6
	 dPpUMuBAMkEhbtJe/Y98TgT5hmNLYZ+FdlHGHMWYJ7dQTLTCflGFA1mCNGOsfWj4j6
	 C35TDVs1KqcIC7CKqIwKFoVaZ76/ajtLc2rusGhYiCmPhk7oqn6VlGkhtYhAHvV582
	 lUaBHcXXpESEHVBgzauXaiMOrqvTjlOhGaQAj0WWzhg+zn3ZRYhQZ5rOtp9Zc7TB5e
	 IDC+TOq4Z0ZcQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4D65937810CD;
	Thu, 27 Jun 2024 09:33:48 +0000 (UTC)
Message-ID: <d1021a8d-6e7f-4839-845e-88e2c8673c34@collabora.com>
Date: Thu, 27 Jun 2024 11:33:47 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: airoha: Add reset support to
 EN7581 clock binding
To: Lorenzo Bianconi <lorenzo@kernel.org>, linux-clk@vger.kernel.org
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
 lorenzo.bianconi83@gmail.com, conor@kernel.org,
 linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, nbd@nbd.name, john@phrozen.org, dd@embedd.com,
 catalin.marinas@arm.com, will@kernel.org, upstream@airoha.com
References: <cover.1718282056.git.lorenzo@kernel.org>
 <ac557b6f4029cb3428d4c0ed1582d0c602481fb6.1718282056.git.lorenzo@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <ac557b6f4029cb3428d4c0ed1582d0c602481fb6.1718282056.git.lorenzo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 13/06/24 14:47, Lorenzo Bianconi ha scritto:
> Introduce reset capability to EN7581 device-tree clock binding
> documentation.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>   .../bindings/clock/airoha,en7523-scu.yaml     | 25 ++++++-
>   .../dt-bindings/reset/airoha,en7581-reset.h   | 66 +++++++++++++++++++
>   2 files changed, 90 insertions(+), 1 deletion(-)
>   create mode 100644 include/dt-bindings/reset/airoha,en7581-reset.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> index 3f4266637733..84353fd09428 100644
> --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> @@ -35,7 +35,7 @@ properties:
>   
>     reg:
>       minItems: 2
> -    maxItems: 3
> +    maxItems: 4
>   
>     "#clock-cells":
>       description:
> @@ -43,6 +43,10 @@ properties:
>         clocks.
>       const: 1
>   
> +  '#reset-cells':
> +    description: ID of the controller reset line
> +    const: 1
> +
>   required:
>     - compatible
>     - reg
> @@ -60,6 +64,8 @@ allOf:
>               - description: scu base address
>               - description: misc scu base address
>   
> +        '#reset-cells': false
> +
>     - if:
>         properties:
>           compatible:
> @@ -70,6 +76,7 @@ allOf:
>             items:
>               - description: scu base address
>               - description: misc scu base address
> +            - description: reset base address

Are you sure that the indentation is correct? :-)

After fixing the indentation,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

>               - description: pb scu base address

