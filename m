Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF6E356762;
	Mon, 22 Jun 2026 06:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782110650; cv=none; b=ApzpxlrjXO0g/LyvhBU/wqKp1BJA89lbvD8/8MKCx/QbQgDIKXSUnXpbmReYbA3P1HjpK40+Rpz2WodP/b17wXvw6Kwf6pJDPoocAqoW5PjgYayDJenqdRxyy3huWahsTiWZN+RJuUvX+g5as3D6YbDaBHcacVc8S1WOFnyED+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782110650; c=relaxed/simple;
	bh=11e5cDqplT2NxYT9DHro5vRtlOIGIO2JjB56BOEvoCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mZOY2aIbwH3HCn/C418CZR+aYgPdrpKlzqYkvTD4ZL7yrsx3VEAFzzVkH3rrfbyOvN/oN0a9bluxlrdOZo3Z3UsD5hAAZNMDFbmK15xeJj+m9AZiK++x4xBweHxFMfuO3NqBvPK6rIEqUlKCGrRT7KDPawy2kMYPL6gVKNOIlwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eEDWfZTu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eEDWfZTu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABDFB1F000E9;
	Mon, 22 Jun 2026 06:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782110648;
	bh=IzhbVxm6PfzXUJZqfMwjQILtkohuzDxMcNEH8PqMZIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eEDWfZTu5VtMmv3V0jtFcGO1mgxPgVWo68B7BXJP6youKaLSbZJ022dddJFUzdPeB
	 3KWhpEa198kspPWcUz+KdP9UNJImpBkYfYNXlQlx9J67Ei+9C3/2KbhgPPNMwvKBD2
	 0fi6KDT8EpPyHlxY2LptzJoSYVcns9Hx8Nkcl3roDIBazMfKwsv7E1jLN+ntYUqqO7
	 MYu79Ahuto7atKjPaoDZpMARs3DWHVWLp3XXNxURl7sqKxxUd7Qe9jMv/pn65HDcV0
	 1I5HMoqIWGB7bpWQVUTlkg6T0BfBayEUbbRZrMiqKnMPWI3zWanApHCudOd3ljl1cj
	 oDFClYEoYQYqw==
Date: Mon, 22 Jun 2026 08:44:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: guoniu.zhou@oss.nxp.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Frank Li <frank.li@nxp.com>, Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v10 2/4] media: dt-bindings: Add CSI Pixel Formatter DT
 bindings
Message-ID: <20260622-bold-spectral-muskrat-a8dcfc@quoll>
References: <20260618-csi_formatter-v10-0-f23830312ba5@oss.nxp.com>
 <20260618-csi_formatter-v10-2-f23830312ba5@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260618-csi_formatter-v10-2-f23830312ba5@oss.nxp.com>

On Thu, Jun 18, 2026 at 05:41:36PM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> The i.MX95 CSI pixel formatting module uses packet info, pixel and
> non-pixel data from the CSI-2 host controller and reformat them to
> match Pixel Link(PL) definition.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
> Changes in v10:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

