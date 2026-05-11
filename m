Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705A83BD241
	for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 15:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778514046; cv=pass; b=IMNyseOCoiOfiRyDeY9eUML6BVR9B5g8iI1wvSBnUQourHqsjmXUZoGSVLniEGhkdb89s99inzrHs0BW+yNnp4zZMEz+KzVBJIYU6RebewM/wiAiDxIM/9dAkkEpeURfsa9IvmXbX3AYmBQRv5XcDwUj/W/ch0YTVxsFlIfI34w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778514046; c=relaxed/simple;
	bh=pYW7RgYPb/aitZu0xIOw+1rg+iW8B1yMUnmb+fIb5/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iB0zrJ7fL7QpsQv5BWT5GifnuXcslC9Ck1zKY5xebr7E0S6Go/ddTBXY8pV7IRI7VpKmSH/h/sXbEMPYcZEJZbRTLRH1e+Xp24ZskVXnoufVxffNWcrmTFjCNwKVQz5lc1YvJTfu9rrLNQgTZFHoDbbRFsXz/28uVT2rsLlPDZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a1ukhUyj; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a1ukhUyj"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a85b30dd54so4556012e87.2
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 08:40:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778514043; cv=none;
        d=google.com; s=arc-20240605;
        b=IObZ7yF685FKTsJgQ3yzhkjlQwXMrk0FqImctniQcFLyjLdqozSknaUiAi6X9VwmJt
         EHg5kmjN0aB06GW4B6qqQE4DN9Ia3tBTkQf/rUZMmc+ErxLAXKZPsyy4VaqD6SQ55Qke
         Kf/t6YhGxLxIxL5BHJa3s+0n2OchpYPcPb141qaUl83scZV5Uh+ovqwjI8q8eHeBkaj9
         74RRDtHzAAt3BaFOlXc9we6lkuQ9m8pwEEHvM8LpUg6F35LlJWpi7yCrvf90mfqGrvOw
         lO1Vu1nSno+rdP1jpS92XSqNFH9syc5s7PgHnJavJth7kWXW9cQ/R1IbSIQc+krKzrn4
         5Zbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KjChFc16W6YK3fibnourBR78yR1fv1+j9VkzA0wOe20=;
        fh=mcsYJi+/P81hz8/XPkKVDukc1LxPvtnWuSgQyi8EwoI=;
        b=ADXBr1UO7JLSPNCx2Jqsf5ZdUjfacaBdM5ZMVEvBVkER+ztUtmd80tRZWbcyz350hW
         CHj0k+jBikj6OJfUSGtJBX0Oq2kpo+LeZ36GITLFVj8hIaKrkeea+oxKd9Zj4MMeZ4XX
         l1hOPpcHI3k0QwyEynyqaQWJ4uPdYN8VX+/W3ucsEsV0iwhiM7Gi66lEOP4FpqgN47IM
         4wqmwsX255bL3sy114vJ63rnBJj4tNCfcD6n0TI0NQVt+noJADtSwMrjY7jewNo01+iE
         p0r5INLVmzLONP+SsQ18J88Q1On9rvGNIurIJLSDeASUFzXFaO7IUMgMPhlvHgfuha2u
         pHpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778514043; x=1779118843; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KjChFc16W6YK3fibnourBR78yR1fv1+j9VkzA0wOe20=;
        b=a1ukhUyjKTE726gtgTOMCKf7F2deXxfK6tsxGlpzHMG8+Y9nwqBOPk22P+dBdjBAqZ
         VQY/tcZmrT/V96CPMoa6RpKNHns/Gs7dHkzATxu4uT9GTXIqe8FAik6fmzjlpcDOnaM1
         anGAfKQZLGP8sIcksyFQ4005gQq2kh4cAZUmRA73VVejE7wXfJLvL2vbnGN1Zkj+UNWC
         PRGZLgJT640sCFtr+VBw/p4EF/kHT1tQ4fIzWhq3bv8xZx7t8sY/DAR2wwRCOvxZ4+T/
         XCXbXe6upsLV2UPk+94n5aaQvJk5IeuGF7N/3CMVAML1xO7qbdbVvICvIsrfGmm3iqsy
         eSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778514043; x=1779118843;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjChFc16W6YK3fibnourBR78yR1fv1+j9VkzA0wOe20=;
        b=MJxH8SKoAnICN7sIqGr+04mnksaM9nGAdqlj6+A80BNuOjIfU9eU5r+Ct94bR9ELQ9
         AF2v8ZaU76glYrkH+uQtN4HVPX5w9hajM0O6Zzq7PVF354rBMgVBOkE9jyo06WbcgfiG
         4+l1OAEtdldvJXjcUOb8h51zYQJX769YhJBkMbZqVGy/rpnOxFhG4ByHr+OiyD8nbUyF
         RRgAFf3pCwKs0eRnNvSmdkue9NGazTvRu5BB65p4Ak3guXrpU8DxeBnfjM4daiFuyXR4
         PY1mm6C47cZGA3IoPXJGOXs78kYptFHCELFBKw8jXBSBGN1bXf3cco4GRxWfoW+rwvct
         mBhg==
X-Forwarded-Encrypted: i=1; AFNElJ9egBV/ujLfpYGk1mEYpotsgm+BqEUv9kOlpwFJqzoxRAV5k7rISJ3rc/ZXb4ne5xmBygl2vNYiumI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyETmWuqRHqMye/rsqcXH4IjHKJhKOjGxZf80E0pfFts42Whzmh
	hBW+cAk2G0egrNKEGNhcpaVSk2f1MdFvCJOjzhdNAUnbpiaasiH1ze1RiBAf3EdkWjDXnPV+mdk
	4sbdIVOmZp7QQ+lMsRps+XbXA0Fth9SsRx7sWYaVFPA==
X-Gm-Gg: Acq92OGc38/sW0pPOjWE0q/vlu8bk+nlQnVOaVLWzaOSVDbFj1pI+PAd1OpLUQGmz1o
	/rQvuhsZXBYoHmVIOr20HSJXELCcDV2XpvQOtSn7raxMYXbw3ZPJFfNepLDTTMkV+uskdUOsYMT
	q+Wn235EJliyIlLcg4hbvzueJLFXqPXq2AJdR/OmvHE+KUAm0TgmO5JV8sQwO1w0MAuGIWql/vs
	QzAUwSh5gsRCZv4ekD8qRfVSZfODRnceW9vf/Nk6nPaE/lYR9auj4M7cXBQjy8CjxepMjKh8a4D
	WO52D1hs
X-Received: by 2002:a05:6512:3a83:b0:5a8:6e64:e88b with SMTP id
 2adb3069b0e04-5a887add6d3mr7544636e87.4.1778514042559; Mon, 11 May 2026
 08:40:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org> <20260504144534.43745-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504144534.43745-2-marek.vasut+renesas@mailbox.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 11 May 2026 17:39:49 +0200
X-Gm-Features: AVHnY4LAe4jSY9ZIU0Jqqg3bAkBng0JF_5D_OZzU-aQcORXNKnNE7TuCtsiJ2MY
Message-ID: <CAPDyKFrDzA-dYF58_N05JCTqdgvPUMvXF+FKeyCFivLyhw5_6Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: mmc: renesas,sdhi: Document R-Car
 M3Le support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Brian Masney <bmasney@redhat.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 May 2026 at 16:46, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
>
> Document support for the SD Card/MMC Interface in the Renesas R-Car M3Le
> (R8A779MD) SoC.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
> Cc: Brian Masney <bmasney@redhat.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Ulf Hansson <ulfh@kernel.org>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: - New patch
> ---
>  Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> index 64fac0d11329a..4d66966ce2900 100644
> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> @@ -52,6 +52,7 @@ properties:
>                - renesas,sdhi-r8a77980  # R-Car V3H
>                - renesas,sdhi-r8a77990  # R-Car E3
>                - renesas,sdhi-r8a77995  # R-Car D3
> +              - renesas,sdhi-r8a779md  # R-Car M3Le
>            - const: renesas,rcar-gen3-sdhi # R-Car Gen3 or RZ/G2
>        - items:
>            - enum:
> --
> 2.53.0
>
