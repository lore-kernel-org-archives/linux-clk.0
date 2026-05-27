Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4241EEA3C;
	Wed, 27 May 2026 08:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779870991; cv=none; b=tLxuJYDa3V/8YZizPuf1PG8d1tKmy8R9glaeLsNm9jV71EBwBB9h3XHNqXvVbnVOVAteYBXJmOkKDdA6VbgUM6EUcFw/dvyv3YXxrxcPGvSEskvGDATDtpN1E1R1/mkGjmW/xI/V3tpISWee0JIKVlUbNMp5L9QUicm1eHhfc9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779870991; c=relaxed/simple;
	bh=5Z6/f1KXDDMffTQYOYjEqa4SegMwUt7JfYz8IYOpQik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h9epIEG5cgy95CVXuUvyMI7BhhuUNGTgM33XmK+XJsuk4mHLxBTKXQIDVZgUiveEBkXkNf2ryeba7MQE+TbqFfmyeh1Ws8zc7EUdb9nPn7Xnx8o5+G6BXVNuw14TIjRJx+wXNqnHTIbzMztewVRldQkPT4Zcf+XYnz8QWkKKbpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YE1Ll8ai; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YE1Ll8ai"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE3DF1F000E9;
	Wed, 27 May 2026 08:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779870989;
	bh=DQICb37b6tJT8rYSfInWzIjWd8QW9Ba0rxbOLrI9sgo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YE1Ll8aizXG+NDFKOUhO70NmB09uLw22F/DTRGfs1YBqLtO3htyRGs4huui151bIv
	 onOTDIrY9EroYIJwik7pYf7ug4r0m3NOd3hxjSINAKASrSLn9uv482tM3YdwPuiNho
	 AdqUU+mQtZ/GbYpbCf5sh9i6jm3FVUaPPuMeyuqy53XMwAIqL8xd5kOmAf8YN89l4O
	 KcU0tYcFLFZ7KuG3Bo69XA+RzdG2KpFNdJuIMkaft2Mfwfl/csPMTCQCKAEDl8qmFf
	 PVuHSVR1ralI0ovVAIvtOK80ALsZzDqQMAvggc2nlHqG4KmxcEQcn2jzdJmwQ9wVpe
	 9TQUhJIEaJkDw==
Date: Wed, 27 May 2026 10:36:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Frank Li <frank.li@nxp.com>, Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v9 2/3] media: dt-bindings: Add CSI Pixel Formatter DT
 bindings
Message-ID: <20260527-cheerful-academic-oyster-cebb2d@quoll>
References: <20260526-csi_formatter-v9-0-ca3d8c334c39@oss.nxp.com>
 <20260526-csi_formatter-v9-2-ca3d8c334c39@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260526-csi_formatter-v9-2-ca3d8c334c39@oss.nxp.com>

On Tue, May 26, 2026 at 04:57:21PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> The i.MX95 CSI pixel formatting module uses packet info, pixel and
> non-pixel data from the CSI-2 host controller and reformat them to
> match Pixel Link(PL) definition.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

NAK

Implement previous feedback.

Best regards,
Krzysztof

