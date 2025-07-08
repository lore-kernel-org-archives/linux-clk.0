Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7D021C177
	for <linux-clk@vger.kernel.org>; Tue,  8 Jul 2025 09:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751966422; cv=none; b=RS6IkyHYEfgDRBsHsu0qFUufvrcAg++dby0S2cpyornTQyim3rmP5b3okjNk5cco5jiKPj/Qx58hdZk+DWSZcfQJst9cp54O7RkecOj00V0AbE4ApmnGY1XxR0huczNfW2p181uGqk3rXLSQstfWsSir6wKyalN7ACc1GY3J9vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751966422; c=relaxed/simple;
	bh=tTnkj9/iMWnXfZ8wbeIpbX5DCcf2AwFFVw7LzOLB13I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QWlli7U6wLJm8CcTorZVEmwJwLfnfpfDI7wIwWNMZ1juoWcIIW16pScJcBPiazRdI1m9VRmFQHaYHHb5jiUFdIWj/YAq5UIXEeqhzm5dNmR82K+jDBD3iYGp6UEXd/TZtFrDISjpL9rvMGowD/C0ECrMHpJLStAr4f46kD8G2/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jYcjN318; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jYcjN318"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ae0dad3a179so711802466b.1
        for <linux-clk@vger.kernel.org>; Tue, 08 Jul 2025 02:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751966418; x=1752571218; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qde20GPEW8GrZb6i2zWlEkGphLDMaxaujFgrrC5mKsw=;
        b=jYcjN318UWLukEq+Tw/dua6v6SbK1nnVglvm2qlUiFOXDm27AEdaLiEIbGj06Onkki
         JbYiFGDyNo8aKeDxsgX73Dd3n6Mjf/O7EdJg8ia3QkBi7xYmxW/FDAdffiQIhvMPdZ4/
         3SsbywE3oFFpVGPERGa5LZCIAgPCB63VRFVN2vnlLmtSQmEYe1BcR72icn8TFFS5WC1S
         tUEAz8bC20cEn68IymUXoMW7d5jyMfECUAEs27NfKW+5TyrjQsjoKyrTJc1VA/ZeE41x
         9mfICm18TjcFbm8gA8amMGDvEGb8vlPLOlW/g0rfd3VsYVMPIesX+2iLiKY5JfUzSw6m
         407w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751966418; x=1752571218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qde20GPEW8GrZb6i2zWlEkGphLDMaxaujFgrrC5mKsw=;
        b=ckEMW0Bg4XRmhVb2CBvURCaqxJqDHUHWJC/NfGmRRPdNR0fXr3MBkvavKWrPtRyziT
         FsGiYD8nqzXZGTFlSvvIgZkBMviFsl+klQwHXYHvNP0i0q1+rWSL/06W2nBCvKtYFpnO
         YbymhRKyJR40CIMxaDoa5l8l6+a1NNg6ahya8R4y97hLD8iyjE0fCdptYBMG0+8phtaj
         Wjwg+FnTwsBUUcpyMr/P9FBi37uPW6VlBPLhcxX2DDyWlWxibmP9FUv3cGshAW68RR5x
         dJoLlWcqNvsxugWl3nWaOr179BNBb0VAaErITZjqD1/xUSYrXE27mKekPqjK8jGpIDYP
         zIjw==
X-Forwarded-Encrypted: i=1; AJvYcCWUOV/YRMDRoggs+ysnMZC1eS7TsMm2WwI/GS197Hjv3T8zrNUpHyHEpVO42Nl/op8DXtJ+xdwIODE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqjSvRzZtD8MefP+oR+/rMmZl41F+fenYy+iaTW1EwRSEHtJ1e
	QzjrzYSItAfRQNmhBp9OF7AUoKsCYQ7+WftpiynZTzn7J5SHn+CKRQSSK5Jro5VeMk8=
X-Gm-Gg: ASbGncvkFCaNgEeJExWVN/QH0vX/04Nw20DBixzBEdt3yvDCCenb3EvVY5XHDhD4VQC
	d3QVFBxxm80a4QcczDQa7BDtBE5/YiYP9tfLEZeU/w5d/g54Dk1DzX/I35MzTNbY/t1NwHjLGKH
	RLk5r5LnxUn1ZIN9WgYVbb6HtY3aUJ8Obi/zUFMvY0gw4nrgr1PDywT8/vOwc6eem6wog2JiZMi
	wL9S5rf/a8diXHavvQa9IkMvBV9b8wed6BtbNyWl9AiT3GB4UXcmHXMvQXzla6Xq2Tp1iP/kb7E
	UzPmP3ukxrEivGeNjh0qsxscrtbY8Ls/zC8nrEt4zMsKMNnSt9+0b/ae5t0=
X-Google-Smtp-Source: AGHT+IHP/+5wQx+82Xsq93Q+p1ivWxiCeoN5FhCTp6b5wZJQBNJcP3y1aTVdV3ogaf3T1uMqF+NcPg==
X-Received: by 2002:a17:906:f592:b0:ae0:a351:49b with SMTP id a640c23a62f3a-ae6b06f2722mr201059366b.34.1751966417914;
        Tue, 08 Jul 2025 02:20:17 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66e7d4asm840670366b.23.2025.07.08.02.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 02:20:16 -0700 (PDT)
Date: Tue, 8 Jul 2025 12:20:15 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
	Frank Li <frank.li@nxp.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Sandor Yu <Sandor.yu@nxp.com>
Subject: Re: [PATCH v3 0/6] clock: imx95: Add LVDS/DISPLAY CSR for i.MX94
Message-ID: <aGzizyLX8HDWsWWm@linaro.org>
References: <20250707-imx95-blk-ctl-7-1-v3-0-c1b676ec13be@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707-imx95-blk-ctl-7-1-v3-0-c1b676ec13be@nxp.com>

On 25-07-07 10:24:36, Peng Fan wrote:
> Similar to i.MX95, i.MX94 also has LVDS/DISPLAY CSR to provide
> clock gate for LVDS and DISPLAY Controller. So following same approach
> to add the support, as what have been done for i.MX95.
> 
> Patch 1 is to add the binding doc.
> Patch 2 is fixes when supporting i.MX94, but the issues are
> also exposed to i.MX95 even not triggered. No need to rush the
> two patches for 6.16.
> Patch 3 and 4 is to add the clk driver. Patch 3 is almost picked from
> NXP downstream with a minor update. Patch 4 is modified from NXP
> downstream with a few minor patches merged and updated.
> Patch 5 is the dts part to give reviewer a whole view on how it is used.
> 
> Thanks for Frank Li helping do NXP internal review for the patchset.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

For some reason, this doesn't apply cleanly.

Can you rebase on 6.16-rc1 and resend?

Thanks,
Abel

