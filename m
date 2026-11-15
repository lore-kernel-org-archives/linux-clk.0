Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794704334;
	b=I5fpf0kroV80fTwSuenLZYcK6FFTZ5vOUe5LUmqeDv3MML1u7U4ZBmK6qeS9UljYhBcv
	 qxDKf4nCvVcAdcQqhkZwYebAPdAPxb2L4SsDNtB/TnJTrC1lud2JxIMNqTjSUthHqC7Rj
	 oBJNfDPMI0Zn3wRCWfC8fdjgBDq9TsKGTPE1RLKMVSSGk5FA7DeNUgDoiLcPjlc62dufP
	 IhBi2+V1xG/E3I8F/wSUOjGILpd/5xYjvg/KXl+mjXnz8LmvC6F7z7Lc1gCFdHhCrzqHU
	 gk6AQJ4A7zPA8vUAP5j7cy5mjr64acTzPtFk9ptdN44XiC1fTh+SjZX2qEXkQ04r6vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794704334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:
	 Content-Language:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=k7NOu9mRwqKS6KEdePuU/ewkkmtEQ/cj2Ubt3cKxgyM=;
	b=ErY1RCpK+iFmTmx2X3fuCoAJvffpYk1WMe7YbJaa8V4CJoCLLEkVT/I/jRACKeGzbpM1
	 PMA9mvL3mpJ3kGChOo5QcKAkO7x3svk4Db+eeRShlYwipeyW6qQzBkKbkiM2BIbHAI7h0
	 IIOxUjie0eo0EZa/RceLp4ENAKyFQfhmVUmSsHpRq0xjXV7QYfaYXOWLZnhAoSKqXXMlE
	 A2HEoLx8awsQubYpGOSW4FR5CscBAjtiZGhyAnAFqQriqlVKKTydrbZbA8vyL6dTGPXma
	 Dtz7w9FjbH1+QFY+qXU2eDcQLVgBcVoYBDVJY4XmGDcp2yxIdFvp5a9uzekKeQF1BXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VVLoFXwq;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F8D606A327
	for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 00:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48F8D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VVLoFXwq
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so2971712eec.0
        for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 16:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794704333; x=1795309133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k7NOu9mRwqKS6KEdePuU/ewkkmtEQ/cj2Ubt3cKxgyM=;
        b=VVLoFXwqulWeucnw8PTyUoqoKo1n49Ix8VF4rvFKoBGKRxj3TB3ua9vgyrgU4nL2qi
         PmkoJxjWcOIms1fceHg+BzbYP5MEl2G9jm9hFUHK9J4QhiCX8Kqo8m67i3mnnhzTZLXu
         B7koqJKt5c7cKnQFC1prGlQO4bQiXQ5S76HBq9ky8BOQEcznfXKRoOE9o8dtxJKRVfR0
         jGKlG50HAOdRETaAeo9ct3E1rJju8j5wA5dFycvcn+bvJmkq1Jt0hWkrHPn7nj+pzTI/
         jt/0qZkh6VIukufGj8bLAWqdzfXdUBhON83OXlbaGjqI7UH1Etad5mwVsjEeyePuQ+u9
         OC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794704333; x=1795309133;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k7NOu9mRwqKS6KEdePuU/ewkkmtEQ/cj2Ubt3cKxgyM=;
        b=OGENCHPGKqobhFl0FNDyBO+EFlVqF2MqU5WwnWerZEqdDrS0bOSZf1rRDDjN33bG8y
         NLDzyJQOCfIKltj6iS00hUGrG1G/MEXmt6MiQWVO+g42iVSv5X2Aqgtj7JLh5vj9s9VV
         yNwjfscoWE2nBQVwgj6eU3CI3oTs42dwN5xKBV3T9mJKjpxV4gZLgWf+Fhh+Qh9RIChu
         TRMQiyIX/YehNHJ+9VF88yyAzrTUL1f+WYkIGPcdTyk0efNrdgxhGGfCoUxkbV4xgaU1
         Zfcp/MKhBjQABu9T+og/xuU4FJXkAmVxKvndV9mkRBGxaiUUcfDoEFFqsDIU5AGdgIb/
         laRA==
X-Forwarded-Encrypted: i=1; AL+hErFnkaHEYsSYrBBzWdD6bmyLZ62J5G41PIKKsKw//5muQ3wThq9gxaNv1KK68AmwCahOExaw9A+MvRg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rOgbH1ziVguVfQ2xtwFPNjchBYqg6+Iz/gtfZIwEtjslu0dMV
	9pBYEe2T/2/Bt1S+ChfyFy3J78H2KKauDeqEYYFQNM8gL22OaXdaadf0y6b3QlotsdA=
X-Gm-Gg: AYBFou0XgNyrjxCBmTjlYf1IrwTU1oAq6ay/vZSvrOQB1ouJJ2xeZr88twJ5c+7os5J
	cdj/58Q2IJux/QpQdOmhQDvLxYGrv6Xu6FF1sifQupHqPkH2D7xJPZyLwT89lD9dlRkF0Np/hDV
	Ux6l2ZmHAIndPN6vyChvr5JkTN6uer1c8ZePTTC+gbqNJMgTlVmep51MugQPyK8VGSV6Ut7vWY9
	icOwTWwGTQ/jtqmn2DsHyVXRwE6HUjezcGJ2/3DfxZuks0FS3I4wd4X7GP53UX85Fqzs5za+sAl
	TJvnRaVx5keHrh9cq9g4DeMNlYKnI19e5MnGI48QAIN+7dkJeghGEgr+Vxy/OUiBfFeuoMnG+IE
	3K3qUbaY4KdXr38QbtaL8EWx0lgLK+gD6PqcyGBvbLZrwnnsDp+Ye83B73rvB2KRehzA0iytHUv
	7eeNX/jXjM24LLZiELeVFMGvqjVM+TjMansa7pqedUciUlAbJpjZ7TBDF2JlseVJbXVoNhu/S7j
	on++VsKx2FmDQZRpulXZjPsc9OoMYGXaCwOf+5SRRhm2MqOgXhmgsdzT0piAVuwa0XE3xyb/ZKT
	gEeUjngT3WnsDtBh7ZQwrs9yFM0L/RfNFQUJG6rxOD74we/QY6K0xeT3dP1oj9JmJhk=
X-Received: by 2002:a05:7300:e9c5:20b0:361:167c:2364 with SMTP id 5a478bee46e88-37966e3ab7cmr7375931eec.8.1794704333340;
        Sat, 14 Nov 2026 16:58:53 -0800 (PST)
Received: from [192.168.35.43] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm35679526eec.21.2026.11.14.16.58.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 16:58:52 -0800 (PST)
Message-ID: <0f536451-9f7b-46f7-acca-e10e54dec37e@gmail.com>
Date: Sun, 15 Nov 2026 09:58:48 +0900
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
Reply-To: chanwoo@kernel.org
Subject: Re: [PATCH v2 3/7] dt-bindings: devfreq: event: rockchip,dfi: add
 rk3576
Content-Language: ko
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, kernel@collabora.com
References: <20260921-b4-rockchip-dfi-rk3576-support-v2-0-04f847016321@collabora.com>
 <20260921-b4-rockchip-dfi-rk3576-support-v2-3-04f847016321@collabora.com>
From: Choi Chanwoo <cwchoi00@gmail.com>
In-Reply-To: <20260921-b4-rockchip-dfi-rk3576-support-v2-3-04f847016321@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/22/2026 6:15 AM, Sebastian Reichel wrote:
> From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> The RK3576 has DFI hardware for monitoring the DDR's bandwidth much
> like other rockchip SoCs do. Unlike the RK3588 however, it only has two
> memory channels, so only two per-channel pclks for DFI.
> 
> Add a compatible for this SoC's variant, and add it to the conditionals
> at the bottom of the bindings file.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../bindings/devfreq/event/rockchip,dfi.yaml          | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml b/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml
> index 3450e28b4020..dcf3bbde3e8d 100644
> --- a/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml
> +++ b/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml
> @@ -14,6 +14,7 @@ properties:
>      enum:
>        - rockchip,rk3399-dfi
>        - rockchip,rk3568-dfi
> +      - rockchip,rk3576-dfi
>        - rockchip,rk3588-dfi
>  
>    clocks:
> @@ -64,6 +65,24 @@ allOf:
>          - clocks
>          - clock-names
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,rk3576-dfi
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2
> +        clock-names:
> +          minItems: 2
> +          maxItems: 2
> +      required:
> +        - clocks
> +        - clock-names
> +
>    - if:
>        properties:
>          compatible:
> 

When I applied it, there are some error.
Could you please resend it on latest commit?

-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics
