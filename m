Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795125322;
	b=GqZpM/ker80+bhizXZ/FC1PKsAmCtITMmPbycXYAM3DFwNWANqb8IazwaQULGI7rsuHs
	 aZgb6gL6Bbka5xxyBUinpOtXlA8G1d0x0lDGP4tL1TD704+cov6goErInwmuDJGUWxlJm
	 r24dx+ovaOhaIzZtj5FijJWlKjBVAXaOz4BfXn+Gush64uormmxvljUe3SNApe9HsunVQ
	 Az6EbGajiGwSQqZruHKWJ3ntU1CtEniAKVoCESYpIweOgBvvQsnVZ7DYUP7N09Mw7N+AU
	 385I3gShgs9hh5JGAnSQgaZToql2QunByidrw1pYOmx+zNNbS2PSWpwputNqXnIVn4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795125322;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=6KwzjveDi991tVEMYI9CzDOax6QGwXMqfiSely98usc=;
	b=M2QegG9RuIiM/7V2Ua9WpnbxsbAyVWjmI0Rt+6oliK4Fos32KFPZBOJGxiWbLs7Hafu6
	 Xu7nOx5nm0BGacUPFcBuGw+fjmUIG+47kQgsWsUt3r6aOAnFlftvwKagBc63sIlZEHWoD
	 VAZ+Ci0yhB4nJrS41g+WOGKiXresSPaKYamVVa9T2rIDnlQTgq8DpDBRcddK3RPXWFZQv
	 OCSD8gVcikQPbFXONGBBLMYc/qN1dOjPu2Pr3tG4mN0an5pfrsnp8ajrQVnq5h1qUh1Si
	 Xa89wIbrAgF9ZM0qd/s9oB8ob2aGEUCWltJeb87wIF1m9vh0RWNXQ9K9+Ai3D+mpalg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lm8g6rL9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FED4606A331;
	Thu, 19 Nov 2026 21:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lm8g6rL9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A061F000C4;
	Thu, 19 Nov 2026 21:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795125321;
	bh=6KwzjveDi991tVEMYI9CzDOax6QGwXMqfiSely98usc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Lm8g6rL9y59Oq7TvY4eP2yE0GMOYPhHIcbtq+wDyWAyc9D2yJxZQjX1gEjBeG5sno
	 6bwoNYgzy3NvJt0dSF5YEH8K/wkkpa2IGOmCc4iWMZPlGe/28zH0bV7/streFsrNiC
	 RlnivLbkcdtC7v9i+tUo1pp9lkxzVNY6o7JvQyV7quy1n4xVRmomPG0aCFoxM6KinA
	 oZDw0kjm6Lw9Gt/xs3mDz4aDmS2x5ifK9o5Cg+ie/LwAns3/XkHfE81dQkE2SA0GW1
	 NB3vSLRf3mcaKtW1f+b9DVPvoKsyo2nKifVb33ibDxAp2qjzuZ2RQc7cFvEfIK1wa3
	 RSnA8xtwIVGWQ==
Date: Thu, 19 Nov 2026 15:55:19 -0600
From: Rob Herring <robh@kernel.org>
To: Demeter Barna <me@fromdisposition.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: clock: qcom,sc8280xp-lpasscc: Add
 SM8350 LPASS audio CSR
Message-ID: <20261119215519.GA803514-robh@kernel.org>
References: <20261104-b4-sm8350-sound-v1-0-4c872df294fa@fromdisposition.org>
 <20261104-b4-sm8350-sound-v1-1-4c872df294fa@fromdisposition.org>
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
In-Reply-To: <20261104-b4-sm8350-sound-v1-1-4c872df294fa@fromdisposition.org>

On Wed, Nov 04, 2026 at 06:07:09PM +0000, Demeter Barna wrote:
> As on SC8280XP, the SM8350 LPASS audio CSR is controlled by the ADSP and
> only provides resets to the OS, so it takes no clocks. Its resets are the
> RX, TX and WSA SoundWire ones of SC7280 (at 0xa0, 0xa8 and 0xb0);
> SC8280XP has no TX reset in this block, so there is no SC8280XP fallback
> and the SC7280 reset IDs are used.
> 
> Signed-off-by: Demeter Barna <me@fromdisposition.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring (Arm) <robh@kernel.org>
