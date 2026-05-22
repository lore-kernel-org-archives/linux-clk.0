Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F0119CD1D;
	Fri, 22 May 2026 06:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779430017; cv=none; b=cZojH0zHTD/jSAvHFGM58/TifgzPtqyDHIhSnVArH5b7RlKgkVAwA/PBJVt62oJprwCC8GootrIfAoABJ4R37VaNHcP4cN8ABfe/bhc9YHUwLE3k31SDX6QV6a9NU2s0znVu3QkjJLP69xDg0u1SSXVQYbdPT7PtykPEVx62XvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779430017; c=relaxed/simple;
	bh=62plWfu9YLO/1j5mOJl2kBA3xulZRGnUXzKNwubtZ/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qyvH4T5k+gmeNg+QqH3lWSQ/bRQ+J6piOoDsiHZgtrOq2/+S8q7Q0uETOlm2oAGU1elnlQRXzcqmE2LODj5XldLlL71WIPXgtfkOd+6IOj+EWB8P5YXZLbSCSHFx/22jzA/P9qmNzbzfLcn81Fkq2wN5Gi2ZnvaQLu0DpFASWMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bTaHUPD5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bTaHUPD5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04F241F000E9;
	Fri, 22 May 2026 06:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779430016;
	bh=Zv+bq8Y4125ZUtVQWA5vR0XBl99zeMI54gkrK9c5vNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bTaHUPD5OkGxNjL9uDPG4wGMmKtXLO5mPQJ/MqDVK5784jUhIG9jhLGixf0M7782/
	 xHdlQaLig7FdM8Ht8T9tEHIZRzxp74JaRC7kKg48+RQ7lpqiq7pMnddYb8fyhP7Vj2
	 BfZUktHANeYE5bMliEjICrkfRZMMGeM3xlKRCUDPMx3ZwybizsnxkJ6A4wjXGmztFg
	 /t1mgbdSx1cVLlinmtNaMTqk5dumtUrGw3ZRyfNbm/CbxVCjyTamvaTiQhx15KXRUG
	 mm/WU2adz4GbLOYZph/VQTLmuURBDMePgoZPN1CtvjNIbMTHGZjoIWxkbIhIpFOJof
	 tRmum7N4OWKNg==
Date: Fri, 22 May 2026 08:06:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v9 2/5] dt-bindings: phy: Add documentation for Airoha
 AN7581 USB PHY
Message-ID: <20260522-obedient-lovely-kingfisher-2deda1@quoll>
References: <20260521153645.7028-1-ansuelsmth@gmail.com>
 <20260521153645.7028-3-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260521153645.7028-3-ansuelsmth@gmail.com>

On Thu, May 21, 2026 at 05:35:53PM +0200, Christian Marangi wrote:
> Add documentation for Airoha AN7581 USB PHY that describe the USB PHY
> for the USB controller.
> 
> Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
> always supported. The USB 3.0 mode is optional and depends on the Serdes
> mode currently configured on the system for the relevant USB port.
> 
> To correctly calibrate, the USB 2.0 port require correct value in
> "airoha,usb2-monitor-clk-sel" property. Both the 2 USB 2.0 port permit
> selecting one of the 4 monitor clock for calibration (internal clock not
> exposed to the system) but each port have only one of the 4 actually
> connected in HW hence the correct value needs to be specified in DT
> based on board and the physical port. Normally it's monitor clock 1 for
> USB1 and monitor clock 2 for USB2.
> 
> To correctly setup the Serdes mode attached to the USB 3.0 mode, a phys
> property is required with the phandle pointing to the correct Serdes port
> provided by the SCU node. Providing the phys property is optional if USB
> 3.0 is not used.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/phy/airoha,an7581-usb-phy.yaml   | 62 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++
>  2 files changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

