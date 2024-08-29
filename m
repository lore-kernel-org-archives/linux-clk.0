Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692F71BC9E9;
	Thu, 29 Aug 2024 21:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724968385; cv=none; b=l6Myi9GRKPCxAgS7/zGXfCOMatiPavjaIVuMrCEsLAFqqAxj+dYZ5ul1aJ5fujPCKSQiWzVRhN8BCoNlGJWOU2mx8lJ2wWweiCF4/9YfDKxb2MiPaN4a5nAB/1E5l6ckPmLqI5IxTyRWrLfB8Wv6mjCp1l0VVIvoIQjXwiupwGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724968385; c=relaxed/simple;
	bh=XDrhTqp3/tV7ytTfCzMs9brLOEVk0fpZ61B9+TC+I9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=etcw6iCP9hBsBqBEhwedcNvspArzbKE9UHtSIU1v7+XBykeFUFNNp+S4y5BBKbex3VuODSB8CSHjni068cO/A529msmq6DK3zWCZl4ffTkhAbrB0cj2xl4uhrqXVUFPby7n49hovlu545fL5l6lyoTDmC/BpphhrN415fTtQWco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=lFPtX9W0; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="lFPtX9W0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rNDr78QWZPeaDVSQsJuGdeCoq91CTLmRnMS6AwHS6ZA=; b=lFPtX9W0D9Zi8DW9hO/B9mgVJS
	jithM++IxBgDTV5E5DS8ySbsfln4En1MRtfyK6v6UEqwf1giGXFwEuS6bZnmvSBdNr+E8JK7KWnIw
	v/BvSpa6hSdL12jZkD7Fu60l+djlsiFzb7EmJhQoW8vcj+8HhHGEuCU9FnKmnXHLfBC9yaipDCqtj
	rSGIX+QqpeOMzBdccXF3cFhDIOImSOm+IGWP1T5c+TpKR+hyR9crYXWiDgpODzyh9846WXZDVz0OL
	GF25zsWT/SysM+ym9/C6L9vze0xUdbe0Mf6S3o48vZg2lkhPQCPflVV4DbLvpS4Cd/olcXxEPzv5v
	GxD3LYLg==;
Received: from i5e861916.versanet.de ([94.134.25.22] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sjn4b-000788-Pj; Thu, 29 Aug 2024 23:52:57 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com
Subject:
 Re: [PATCH v1 1/1] dt-bindings: clock: remove assigned-clock* from rk3588 cru
 binding
Date: Thu, 29 Aug 2024 23:54:17 +0200
Message-ID: <6207501.2l3rmUXbR5@diego>
In-Reply-To: <20240829165933.55926-1-sebastian.reichel@collabora.com>
References: <20240829165933.55926-1-sebastian.reichel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Sebastian,

Am Donnerstag, 29. August 2024, 18:58:05 CEST schrieb Sebastian Reichel:
> These properties are automatically taken over from the common clock
> schema:
> 
> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/clock/clock.yaml
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../devicetree/bindings/clock/rockchip,rk3588-cru.yaml        | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml b/Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml
> index 74cd3f3f229a..4ff175c4992b 100644
> --- a/Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml
> +++ b/Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml
> @@ -42,10 +42,6 @@ properties:
>        - const: xin24m
>        - const: xin32k
>  
> -  assigned-clocks: true
> -
> -  assigned-clock-rates: true
> -
>    rockchip,grf:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description: >
> 

I already applied a similar patch from Krzysztof today:
https://lore.kernel.org/all/20240818173014.122073-4-krzysztof.kozlowski@linaro.org/


