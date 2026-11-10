Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794299170;
	b=ltiQDfEFshSNb/TxWWPHbRWz9B3XSLj1gxAkb9N8SwzXfv1fLnzfwdsLp0w4ROO4JZU7
	 9e3Bu3wYmpsKDAATyFnRUoPbtizC26Sv68ZxV6c/LjstdsTtCGuFkC4jPa1n/vGY7d+SR
	 zCRmywcPHCQ0gUuvmZ8U+59Cwbpj9vyuNWztCJp3A44IB15o63sIw9xjH9dqpNICAOYVO
	 abGu7FSuqxNtYMr9Gi+NCtmD/s1Bl39AL5b5pdl4q4Jc6ypReZIGuRWqbUg+qOxAuk0vm
	 Nkl9zXh+yXuMmUMV0ZUXjXoGCj/0Q871l9uGKNVCHSrtAWD2SQexVJeFkG14PCz+k2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299170;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=KGB9UbUuUIBLuGWbVi5rtXFYasd5PhFrkHNVfvzg7ao=;
	b=OY3OHFCk0zjUO/oVfh4U3Qf7Ve0OsZ84Vvr4u/VCJ93fW8HDHaKUIabm/y5mJMveJX1i
	 dp+K0rdQ8YegmVGos1kKoS3sNKSjimFBY051LEDy6AfDCk3Ms45f4HgrkO1WShJgoMIAs
	 SZzljDXkVb9ZsC130UriYi81AWRR1Q9oatgzTWr1mlq9y8x+OtTW8HkKzkBf120G0gGvt
	 XPpDrr6Ul19xTgnlNypB9Vf0jTrS58hKAv0yQri2ZJ38eIgYor3EZ4+5yr3aK8a77W2h9
	 0N5BmXd6kHD+FeaTWlweR++FGgo9UeRF3dQc6iYnq+gRYrsjvC9AOuRCQYbRVq3dKOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vy3sNs4B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41923606A332;
	Tue, 10 Nov 2026 08:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vy3sNs4B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBF9C1F008A1;
	Tue, 10 Nov 2026 08:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794299169;
	bh=KGB9UbUuUIBLuGWbVi5rtXFYasd5PhFrkHNVfvzg7ao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vy3sNs4Bee6tkGrdkKtqDQq1tpYCsigpN8wMAJ8/mw3580gNYKQAY2vsi1qmA8RHq
	 05sC8wY6Vq7zO51quYwNuXtIQ6q6jQcXMNsmT3APEwmoiJBIfMmlU2A6GTy4OnbKoW
	 j0jZIJyRYCsN8Un8fK9m79sq8Cy8rGBhCVDjwfTL3fSkzhWTKTiQOT+CijysuikkC4
	 oi2vd0TVyOyU046uHp3JQ2TWzKHKPZ4KlnqKBmZigAJeYING07/ANcJAB15HoMwK3U
	 EWzhImAkrWenIWitw+rx7362zlnGga9dbpmm3fE2I3oVGXyaR8cJ3EF4TH82noWw13
	 5MSNiFgIGh5pw==
Date: Tue, 10 Nov 2026 09:26:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, jian.xu@amlogic.com, 
	shuai.li@amlogic.com, zhe.wang@amlogic.com
Subject: Re: [PATCH v8 1/5] dt-bindings: clock: meson: Add audio power domain
 for S4 soc
Message-ID: <20261110-puzzling-holistic-firefly-acea4a@quoll>
References: <20261110-audio_drvier-v8-0-1489241e4c83@amlogic.com>
 <20261110-audio_drvier-v8-1-1489241e4c83@amlogic.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261110-audio_drvier-v8-1-1489241e4c83@amlogic.com>

On Tue, Nov 10, 2026 at 10:28:24AM +0800, Jiebing Chen wrote:
> The audio power domain has been found on S4 device.
> It must be enabled prior to audio operations.
> 
> Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
> ---
>  .../bindings/clock/amlogic,axg-audio-clkc.yaml          | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

