Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793002430;
	b=zspsHpa6zGIGNgL7TY9lXWBI6N6lIMrvBIBKQFPgFvLMBu3x77L5xMdlX/SiZdbHN0nD
	 jIV8oRBgmG4sExfYaZr72WA8n3q19yUmZc2r8OgAM6EAzZqKUpy/LEgxe3YEs3uahX75S
	 bFVY4CYoFLpQWjjgNwaSsT+a8kbwS4ktji0tVQuks5G6BR9MMyHyxyeZ1U7JzjaBQi6BG
	 D4jwtYmWfvgji0QxdKMn7Yygddy+gpjat+tl+sizdfWEt2eu0oYI5b8BtsA+cZIkl3w4x
	 DjdUOy7SZ8CKpQqoL4nkaHgXumjJGHdtRpO+EPFMcUCwTcOcr83P4Mxp2c+tN9c0cAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793002430;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=X2H4QnyiBP1iPdtWwbpaQFD/CMUA6gFsOOMxlY9gaFc=;
	b=uNnWDPXu+cZE0nGajo33wys2TWH+v3Thvz8XlsISz0pmoF6MmFL9zOKrFr1smrA/ezk/
	 B0kyMrh8CmHaK2NiQuKzmqmL8/7YajQBHWH3ZrkzU6enRqt3tG9jxa16BkN7hm7XKgObS
	 axyzEozxQ22aybUMz3l7WUJEjqDYvHppcNxtAX6kq5ru/R+7fZ85KXhGGLqxmoneBOrga
	 XHesisZskH3wcNcRYIgxauSCRb08JxEexZwp48QkKve2rMNgzsMxJEfcljRSRIJP4MazA
	 loTFiu4CNiTCcEoQIS5zMOL5tkeiR5Ji3nVcUTRuOFbTTuHYaOXW21hnpQNjm2YVDbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Yg/cljWl";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9381606A31A;
	Mon, 26 Oct 2026 08:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yg/cljWl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FFEC1F01825;
	Mon, 26 Oct 2026 08:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793002429;
	bh=X2H4QnyiBP1iPdtWwbpaQFD/CMUA6gFsOOMxlY9gaFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yg/cljWlruKlO3PAR0wRkUDPKKBqJuUbWyvawAnpUlGrJdhNZOMymt1uk+twrU/R6
	 RLqOCLTN9VQtKJGzrz/GS8pcFzg3QljZuUADyW6ZMOpN8MCfDNtzkDsRTu+Q5Owc6i
	 xQCsAmhMbJ3UOUIl9S3BcdWooIj2bigZ+DWY+DzKaVvfIXsNYRTsdxrvwSZvFVzRyY
	 0volyFR3npJKtv+ESJOiY15LJ81XxNJoxpkvsM0JmFJIN73EBoyv4GjZS01Rd7d7TD
	 LMqnQHbrn/Z8wGfGbHb5BiWOI0IrEPp3W5Krl0Q7WZPguqH9J32wJ9MYQ/5LZqq6HA
	 xiDSIaa16EdJg==
Date: Mon, 26 Oct 2026 09:13:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, robin.murphy@arm.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, devicetree@vger.kernel.org, Frank.Li@kernel.org, 
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joakim.zhang@cixtech.com
Subject: Re: [PATCH v1 3/5] dt-bindings: dma: arm,dma-350: Document
 dma-channel-mask
Message-ID: <20261026-reasonable-durable-marmot-5f33e5@quoll>
References: <20261023093045.3248630-1-Jelly.Jia@cixtech.com>
 <20261023093045.3248630-4-Jelly.Jia@cixtech.com>
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
In-Reply-To: <20261023093045.3248630-4-Jelly.Jia@cixtech.com>

On Fri, Oct 23, 2026 at 05:30:43PM +0800, Jelly Jia wrote:
> Some DMA-350 integrations reserve channels for firmware or another
> processor. Allow the standard dma-channel-mask property so firmware can
> describe which channels Linux may use.
> 
> DMA-350 implements at most eight channels, so one 32-bit cell is enough;
> limit the property to a single cell.
> 
> Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
> ---
>  Documentation/devicetree/bindings/dma/arm,dma-350.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

