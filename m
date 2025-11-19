Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950AF2848B2;
	Wed, 19 Nov 2025 07:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763538283; cv=none; b=bEfVlgj+ok8OIBuXs7/R/nGZMXUKfU32Hsm1sc3H5PRanxWcd26ypVyxCTbryXnCge+rqE9JY2KgH/cs72VplNbfInJWW/TeGlKkynDQJwsnfP5SKd5a47j5K3SZ44AaIpPuKZ5WAjXLRhFVmA8qu8913nzfAQJ9RYKutWgrCRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763538283; c=relaxed/simple;
	bh=P4X5R1xAaEUx6GYW9HO6udKC8PmwrPn1P0IPKvae+wc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=phLweRlMQIcHSFyYc/CwPsDQoAut4Kdf5yHXQ9aW1XdPDUH4SzOY2hzA042cWqRHizpCZhKD+9nZPDbdB3Q5E5tktenNE6fC/scEHBgh5EUsX4uDql48tCHKNdcik/S8b4bFPzCIcE0KRAZl48cYihEMYH2MqRVsS9zadTj/qzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WTkEzMZe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WTkEzMZe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71060C2BCB4;
	Wed, 19 Nov 2025 07:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763538283;
	bh=P4X5R1xAaEUx6GYW9HO6udKC8PmwrPn1P0IPKvae+wc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WTkEzMZe/upeKCy7Qhq6hsvHddhyCrVVeI60L0OdUXAQLmKIt6FvyPddM4/VIhQX0
	 fpUJULOAQzKlSNzk6xBRBPuTpCopeaTH21/rKTG7+omk7qI0oQzW42+2fUPRIl6VGp
	 pHR4IfWDtu0SHVghoKd1BOSpeUY+45XYuLP+hj17b8kHzuDqqnMAqeCEQCmS5FY/6f
	 456eESZkhE7FLT04yGJpswLH8xqxWbBeWnF7EcRvJyFuM+Y1SyJPC3jxYN8DvsIkij
	 x7soGhtP2M56WGKrF0BdwkHjVEeFvylz59ltHHOIRr5GZBG4zummh7Dn4wGaECoLOy
	 PTPdFCLikRpKg==
Date: Wed, 19 Nov 2025 08:44:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com, 
	sboyd@kernel.org, Frank.Li@nxp.com, hongxing.zhu@nxp.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: clock: imx95: add PCIE and USB PHY clk
Message-ID: <20251119-encouraging-cooperative-tortoise-b22df8@kuoka>
References: <20251118074055.2523766-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251118074055.2523766-1-xu.yang_2@nxp.com>

On Tue, Nov 18, 2025 at 03:40:52PM +0800, Xu Yang wrote:
> Add two clock definition in HSIOMIX.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  include/dt-bindings/clock/nxp,imx95-clock.h | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

