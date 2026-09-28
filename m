Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DE9347BC6;
	Mon, 28 Sep 2026 10:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790592800; cv=none; b=uPjKIUHwKmBBGIiwjolli4UM+oB92m1qt9D3fxjm4QebnHYgIFHmIqbe54GrUJVtkxeat53wxYuS5ncicIqNch3fKzhjBL4aIKysbP7cOXHXa97+5M1fUXrhiJpaCNJ6/fkjpzdy6s5JZTwc+AsTqxzXYqEqGSoAc//o02DqxqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790592800; c=relaxed/simple;
	bh=lRnGRmTIK4eCxRJqWaqBj5lTEM2b3uoBnMuiP1tCOP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s28XVUqei6RX6AhtfPLOJywFqBCa/qMJKi0aoFMa3tpENjdbqKIyogPcqNqIfq+K2TCsEluA94FAR+AgtrXTR4URtAzxUweu74hA8+KLk3o3EcdlF1w4JvnA0+5DUyUBk/OtZwS6ANjMH9pL7fJ+88zuGAjAYh0vm1FuDVlsufA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=famf3kER; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="famf3kER"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A93B1F000FF;
	Mon, 28 Sep 2026 10:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790592798;
	bh=6D098QPVSwWqNBpArd/Me/az4SDZX0zwpAQXNcTfI+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=famf3kER+GkxLgEogwc7UzWg6j4FmsvuKVnURgfMYXi+JENjk4lphACWxOq771lKk
	 G1uyaoKtQeJlk8OGnpfFgyG8Iv4MdUgogcEKRMbb9eJOAkBrsxTzfTywFBgPgWL2bn
	 I7z/DT6S7KtkixVwQQ7zJYpL1YNGnpNKriefMHgnnN11JK+ZjMA+dR6hfl5FEQulDB
	 fGzq7fEgOm/RfvOp8rfkWQzMtv+MFn5E7ePFwESsCKzDeCvtKnaHw0TlKUCmWpbItD
	 3duiEV1W/1cqvRRq1GBD9A04aIixYjb06cO4dwuRAi/xsLitE4AyWZbbdqFzo1Q2Mv
	 L4+Qx6v01G7ww==
Date: Mon, 28 Sep 2026 12:53:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: qcom: document the Nord DPRX
 Clock Controller
Message-ID: <20260928-vanilla-rottweiler-of-might-94ea7b@quoll>
References: <20260924-nords_dprx-v2-0-fa4364e087ef@oss.qualcomm.com>
 <20260924-nords_dprx-v2-2-fa4364e087ef@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260924-nords_dprx-v2-2-fa4364e087ef@oss.qualcomm.com>

On Thu, Sep 24, 2026 at 12:51:32AM +0530, Taniya Das wrote:
> +
> +  clocks:
> +    items:
> +      - description: XO clock source
> +      - description: DPRX CFG AHB clock from NWGCC
> +      - description: Sleep clock source
> +
> +  power-domains:
> +    description:
> +      MMCX power domain.
> +    maxItems: 1

Preferred is the simpler:

  items:
    - description: MMCX power domain

but no need to resend just for that.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

