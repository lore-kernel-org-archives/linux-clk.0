Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CC61CB31D;
	Thu, 21 May 2026 07:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779349294; cv=none; b=uv7Q4YWlvPfvTR0unsYc/q2PkOw6g2AwXBqiEddroDgQjTpVQWzHjjWsfKgGXhq3dOagLpYwt4WVUC93lY3bKD4c6xTRNk+BMtcM9YoASCrOxSBJZhN4eP6XAtfg2TlgBOvSsSTxDlyYuE0JOruahJzcurKOLzqAyMQDK1TTJTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779349294; c=relaxed/simple;
	bh=BsCkkLoIo2vhWfZpeKs0jG2aOF37PFlNhPexNOlsErI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FsiJnoWtAy0Y/iMpKz01w6TGDdK3TTZoH3Ygdk58fYjZhjg8bCborr7D2xwlU5tNHpCOl5p4s6QfrwmHzhN7pSChTxmVbSkhhjzqbdU3YIPgUFN5WWMuc2EINBq6OmJAk3y21t+wbYPWW3IlY0TpFUgFxiUeh6BV07wmy+sb60A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M8beKdZg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M8beKdZg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E0671F00A3B;
	Thu, 21 May 2026 07:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779349292;
	bh=52vwZ/BSNkydb9uU93Hebvk9NIZbJYHRFhGEKEB4wvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M8beKdZgg9+KeP/MfjGyGScAesw/Iw+ZDWKCqEOjnU/hyjKrxtrGv1gXnuwkGzvwP
	 HqkC+1eW0H8qH1rHJp7Bgu4WPAsAJ9f3mEQl4pQMkvkTbF22IDwD0HO6FF4xzinxts
	 AJnZCrSWsLqTDDOMnGbcAzR6dYCDf/eF0KGt6plAEz3boRGcf8FZJK7MkoEC1/l6qk
	 cFjS8Y99YLZs1PwPUU5VIKI67Fii5Pp6g8YZfGdeu+ghi19YMA7+qty5pX9sgRFF2r
	 KTNr84Ld8P22b6SD02pRfqCVR3ZJJjakpIpGQ41M5u8ThFc4KdNhtLK5xIXNaaooAW
	 1I5GUEy8kIPIw==
Date: Thu, 21 May 2026 09:41:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v8 1/5] dt-bindings: clock: airoha: Add PHY binding for
 Serdes port
Message-ID: <20260521-savvy-attractive-ant-b43826@quoll>
References: <20260520150912.11614-1-ansuelsmth@gmail.com>
 <20260520150912.11614-2-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260520150912.11614-2-ansuelsmth@gmail.com>

On Wed, May 20, 2026 at 05:09:06PM +0200, Christian Marangi wrote:
> Add PHY cell property for Serdes port selection. Currently supported only
> for Airoha AN7581 SoC, that support up to 4 Serdes port.
> 
> The Serdes port can support both PCIe, USB3 or Ethernet mode.
> 
> - PCIe1 Serdes can support PCIe or Ethernet mode.
> - PCIe2 Serdes can support PCIe or Ethernet mode.
> - USB1 Serdes can support USB3 or HSGMII mode.
> - USB2 Serdes can support USB3 or PCIe mode.
> 
> Add bindings to permit correct reference of the Serdes ports in DT.
> Values are just symbolic and enumerates the Serdes port with a specific
> number for precise reference.
> 
> The available Serdes port can be selected following the dt-binding header
> in [2].
> 
> [2] <include/dt-bindings/soc/airoha,scu-ssr.h>
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../devicetree/bindings/clock/airoha,en7523-scu.yaml  |  9 +++++++++
>  include/dt-bindings/soc/airoha,scu-ssr.h              | 11 +++++++++++
>  2 files changed, 20 insertions(+)
>  create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

