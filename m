Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793963033;
	b=QVmFgQJX4TIjDMgzTlJ4EznM2hFDpL3Dbokg1Wgi6IkL+WTx7A4gmSsu3gjTE8v+FS+q
	 0IlR1sf6Nr5ezY2B650dlzGRMKg1B3C3hhVqh1fy7LAZjx+pZrOxTsfyQUr00JDF2dLsy
	 GsZeBRUXf47s9XZ489w7cnIdLcnaZnb+TQq4kDnhE+bwGdih/U5U69EVJtN655oFpgqpn
	 6nSyvWPxAugzyMxyXdqumxnlrsF2bRuXsKl/1yGesIpnU2C2FJnIoUp8g3skeMl96VNVN
	 yXG2o1qtO19vHUraBeTagZJB9xUFGeEUkczi+w0+CBjpk3v4bHOWeowVmXLA/5T7MuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963033;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=1UC53npQZPQBqPO2Jxjhg1ObzLlkCePsQ0TzF6vvsAI=;
	b=K+4dv2CyGnZL9awsVXVzizmu7QPXRbFsJoFHB10QYFRW48qaqDo43pI/TVVICkecSh3q
	 Z2FMT2WRtVfnLIXFenGqFcqpTVD231151WJlaeop7HpqCr7afAo7HDP4zzy3WKfNUBi60
	 +F9eMMyEeMylkCTnJhOq1uXnluxRR/G4kadcfCFxAvBrfiksbsTyr5SlSfzSey4vv58IE
	 Frzp3WBt8gaLfv7pXXq8Rn2VSZdhq2b8pPA923IebAHFBy5kP42xkiz1nzL/x6zAgAmym
	 I9xxhF/HV0eevOQ8EYyumLLsTUdMNwMspcvtBuP+tsWCNIUSCl2cesCozkEp8zhnLfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y0fehbrx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8235B606A32D;
	Fri,  6 Nov 2026 11:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y0fehbrx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6E9D1F0089F;
	Fri,  6 Nov 2026 11:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793963033;
	bh=1UC53npQZPQBqPO2Jxjhg1ObzLlkCePsQ0TzF6vvsAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y0fehbrxZK4U1L6mbrsLPFee2Z4vhsiKCQDuZDDdR3IP0/KQ1BWj8iz65QCd4sIPU
	 uj2J77yKUmt6TiFfH1cYb+yhDROniFN84dmSsQIZHKrwu3OpwAwHz1Jc52BUUjqUdr
	 ThUvTcx1a6oBpc9VrSqnIGxTt8/Bv85FlxuGoW0FflMeQJTb6WUv2FXsY6PCk5Kusx
	 hBM8RQRp5eSfPensMaUZJpQszG6Cb43fvAzIO31dMR1DleAr6rBTNEquLPnPZyT/NS
	 e+5tKCqEQ0ykqvKQSBDDHdm/67jAW4xKYcmo1uy2W7aMr3Hrn3GIsTFt+MBmC3Elfo
	 d4Oetw6U2C9bQ==
Date: Fri, 6 Nov 2026 12:03:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Dahl <ada@thorsis.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Ryan Wanner <ryan.wanner@microchip.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v4 03/16] dt-bindings: clock: at91: Allow referencing
 main rc oscillator in DT
Message-ID: <20261106-zippy-coucal-of-focus-ecf65f@quoll>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-4-ada@thorsis.com>
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
In-Reply-To: <20261105110715.2486432-4-ada@thorsis.com>

On Thu, Nov 05, 2026 at 12:06:39PM +0100, Alexander Dahl wrote:
> The main rc oscillator will be needed for the OTPC to work properly.
> 
> The new index introduced here was not used on the four affected SoC
> clock drivers before.
> 
> Link: https://lore.kernel.org/linux-devicetree/20250207-jailbird-circus-bcc04ee90e05@thorsis.com/T/#u
> Signed-off-by: Alexander Dahl <ada@thorsis.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

