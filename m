Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EA231A07C;
	Thu, 27 Nov 2025 07:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764228982; cv=none; b=kOXFMUVWDAcc9KeeWXBAsWQUb/yyXvLSVtorGtm98QvdE40FeJ7BC3ZvzQnbYHgo5ds1sJJply/cJuQyaJ1wliMFtJd3CVs16NPMuPE0QhtlpIF5Eq9iimehhI05WJU6xTbG04cWaAyb1jm7E08sTXeAcrSnSSDJ1wGyzMhc2hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764228982; c=relaxed/simple;
	bh=Vf3bgVUZ6jVpjj6thPrEznvts6kLXfHQzIMa1KX6+xY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ixOdIinyQSMYApXbFCsZd2XfFkngyyIiNz1TZY+VuW16h4FZBZYAgQwY4Wz9ectnb7HceD9hvWkSRg3exeAO5t+xA/ZfMQRnnvKpxCLSIvpDEDltRYKLxM31g+77EucpiqcYwGW2FLxDHp0NTf/4cVWOeM31DDWoYqbNioGBHGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DLtymqOy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DLtymqOy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C8A0C4CEF8;
	Thu, 27 Nov 2025 07:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764228982;
	bh=Vf3bgVUZ6jVpjj6thPrEznvts6kLXfHQzIMa1KX6+xY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DLtymqOy+a5GDlbVK/f8cPDWYtf6HR2lm2TtOCXg7RwMzYaMigdHpQzi/zFFh4pj0
	 KbieLH9YsdKBNzvw3WVb+N6/MdMNZpkHJLSPMDhs6F10kEFTluMrs0SBP7yIoE3ZaD
	 cGn3nTDaEHy+0D651eajtq/tqSNlV8ZPi6JGdY9ccGYLizHjejU4hJDkzlc2+gcI74
	 lV51wk0P6FOY8lQCLdiQAsJW5/Xy8u8mK4L/3HyKxkYbDLL/MUEBugZiRQMi3B0FSm
	 thh0SyLgSlIY7hCnan5wSQq9nQYoB2mzWfLnkUKJNAYR173vVY3Lh7BXaSZrTB3pKA
	 /QggbLYy5A14g==
Date: Thu, 27 Nov 2025 08:36:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: clock: mpfs-clkcfg: Add pic64gx
 compatibility
Message-ID: <20251127-accomplished-garnet-earwig-baeeff@kuoka>
References: <20251121-tartar-drew-ba31c5ec9192@spud>
 <20251121-unclip-shabby-a7a16e865146@spud>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251121-unclip-shabby-a7a16e865146@spud>

On Fri, Nov 21, 2025 at 01:44:02PM +0000, Conor Dooley wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> 
> pic64gx has a clock controller compatible with mpfs-clkcfg. Don't permit
> the deprecated configuration that was never supported for this SoC.
> 
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/clock/microchip,mpfs-clkcfg.yaml    | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

