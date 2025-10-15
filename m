Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43721A26B;
	Wed, 15 Oct 2025 13:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760535109; cv=none; b=rMYMh4tm1pI3tvOk2XNzv3fKwtZNFEh9vAxBZZoTp9UjwfOUV5g/BMP+sLkzglDCtRaJiU+B6D8XdsCrEeV/uE/sGrhgGuh03bxwU/t8izhkKauc3byBwF8hlrv/rAQOpTBgabTfEPn5h7SzCJc2BfV04/8IdEBtdlOoFjluOuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760535109; c=relaxed/simple;
	bh=U6U9Isg9UG30rWgAIkGOrIJ8TJ7Vt+fz8n5cRLTTnNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GGYTJnNV5SPjsczNvpt+lvI+5G7lY495M/VeRxAIiVCSfVn/EEvyM13QSQmcVM8Wzth4OVZYZL3KLmgbQz+5DhA3uF6hQ0p7oRJFrvryHV3yfcmcgeIPP/FIYvYPRv7YknC8uyhHf+UI8e1ey/Np1Uz20q3f6SzNg1rQtLTjgzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NjkVEOa0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NjkVEOa0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B13CC4CEF8;
	Wed, 15 Oct 2025 13:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760535108;
	bh=U6U9Isg9UG30rWgAIkGOrIJ8TJ7Vt+fz8n5cRLTTnNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NjkVEOa0kDfH9tViKXPU8re9ULjS63UkwqtmS40Er35wFdQP/39XagX39obdH0pNS
	 kacHVArwTN8ZpgIFFwnorVX7x71UBMbm1LVlKkWodBC+sxGBwPhuI8fgokg4mG0SRl
	 9QgQzrOlPBRf7hcdcdowOGDhAs8Ig8rqpXrG5duNFvzuXWt3NP1N1OwpslbIKFbMbY
	 0kqTF2XVa0QxJ7tffLU6jZX/jbyQTyLdPeVOpntsnk5dTRufeHH8JWCbbECC1GIlXt
	 wDIdOI7lTQSIv0/VcCtNNOGylySalRmp8Ja0tkKf2guvhWUB0JMAUaJaN9dCpBsR1w
	 tfVDFvPSjOUiA==
Date: Wed, 15 Oct 2025 08:31:46 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	Liu Ying <victor.liu@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 37/39] dt-bindings: interrupt-controller: fsl,irqsteer:
 Add i.MX95 support
Message-ID: <176053510455.3263483.4220696056487086323.robh@kernel.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-38-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011170213.128907-38-marek.vasut@mailbox.org>


On Sat, 11 Oct 2025 18:51:52 +0200, Marek Vasut wrote:
> Add compatible string "fsl,imx95-irqsteer" for the i.MX95 chip, which is
> backward compatible with "fsl,imx-irqsteer".
> 
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
>  .../devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml  | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!

