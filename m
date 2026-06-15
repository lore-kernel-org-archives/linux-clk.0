Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FDA3321A1;
	Mon, 15 Jun 2026 21:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781557476; cv=none; b=O+vQaUPO1otljnAM0fZnrAjZ3ipqIP1llj/wUOgfPJBR241oNKfTYSWnpRnNX/HrXBFy/RRVSKu003SktbY4NkyElyWdvmsGmN2+/1OCR0R51y7GLb0JzuNlAcpRj4RPIjZOb5nvLbcA49kZ9UAWBNPiH0+Vdyy9X2wu9mHqNMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781557476; c=relaxed/simple;
	bh=2WymXcmDnbTlWuMxRn4kNi1soTb/3DvX56AzCNTNZjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gckuib1xZgrxku6gtQfzPqcQH6Q5HxsMxDe2rQb4jrzAaHZIcLLLDZ6tXbwFmX1BhiwQDMvnC9re0sJr08/nxG9irvVSRwQPiPjG+yN6jdWNgAUsUoNio7Xj5GU6lIdprY+TrWDdGsviAXLd7G5l2awRTiUCvnmZRs8Vy+0fRho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f2snKoPo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f2snKoPo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 728481F000E9;
	Mon, 15 Jun 2026 21:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781557475;
	bh=4b0Lv74/nBILk2gIMYWUm6i3SoTaSg4GpRxXNoby7dE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f2snKoPoB7CwlS7KzqRFdoObM/38la6po2Kp5PWfB8qUzXHJ7XEvm+T0D7AOk8ofj
	 zItneTSHyEJIJzLhdCGE9qPCSyykot/o54R3ctVUIme7V9qXDtxjb0XsTBpY/5fnIb
	 9OkOeybaXMpaG+mfcB/ob6KHmJZu9QLZNl0Utc/DALIZZSerMOK85bUpv7VdpklzwF
	 SAaEUCvo0iba0yAhcjRHytmxWNsqFl7o6RV055yko/bwBKbD3w6bmOFXFCIUjiOHhD
	 qZlnmHo1y2SXxmlAl91AoR9BMuwC4ypUNB1kXUoLsxiJ0Qx7F8gpM3bBOrXal05L2J
	 Ow0qzPJQT6s5w==
Date: Mon, 15 Jun 2026 16:04:32 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Fabio Estevam <festevam@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Ying Liu <victor.liu@nxp.com>
Subject: Re: [PATCH v9 4/9] dt-bindings: display: imx: Add i.MX94 DCIF
Message-ID: <178155747196.1679059.5104272619144115714.robh@kernel.org>
References: <20260612-dcif-upstreaming-v9-0-8d0ff89aa3c5@oss.nxp.com>
 <20260612-dcif-upstreaming-v9-4-8d0ff89aa3c5@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612-dcif-upstreaming-v9-4-8d0ff89aa3c5@oss.nxp.com>


On Fri, 12 Jun 2026 14:58:35 +0300, Laurentiu Palcu wrote:
> DCIF is the i.MX94 Display Controller Interface which is used to
> drive a TFT LCD panel or connects to a display interface depending
> on the chip configuration.
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  .../bindings/display/imx/nxp,imx94-dcif.yaml       | 90 ++++++++++++++++++++++
>  1 file changed, 90 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

