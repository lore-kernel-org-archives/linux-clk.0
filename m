Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56C722F01;
	Thu, 21 May 2026 07:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779349857; cv=none; b=oYqIWstcPm26r2Q/KzDSGuPRMaa8wpevL6O0udlwudVmuUDaDQgrcYTBwbp9ACBAApebIcNbJExIwLUJBxoRRJ4ejrm7aWBTwagmUsbd9Eu/sJvSADnHZTwD8MzQ5mH4Mxkh+skVCvmORrLz7pjwPd+QpFfX0RopnipJBTcJfw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779349857; c=relaxed/simple;
	bh=cZn0DrNNxJOzSOEdOJO+GAdpQ02V7KesA2hV2C44tvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sx4T872TQHogCErHhwKDCurYS6qmN6Wz6HGjrMnGqNfS/muA7/8xh7gSH9wil/ViZxWbGEeROs1RUpWO8/RnOLDdNOPcJX2HqhZzqZ5tvXMJCAjorlv5OsaLCaDeU2OHGlH5xO+dIbl6KIExDB+GkdlsCRfcAkXbKschk22y1Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IDfQb128; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IDfQb128"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEB901F000E9;
	Thu, 21 May 2026 07:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779349856;
	bh=9QejERVBrMhM6mbYOWnu8u+EPjvWN3z78srTmhr/GPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IDfQb128fU697N8wbzfEsy8+umqzduOuq/pYSi7ljSE/gy7f9kPbfHhewshP5ZYO3
	 oZrdP8OG/JXa1C2Oq+4Pc5jF16/izhX1tdCtlHmEwIjEbwgrlacpAX+cTfZnGerREJ
	 xKgNNpPZGNCD8EG+7YTPfBPz8d/lSHlE01DkQYGSrZGd9Qmg5i1Lho3wxODhA01cm9
	 0DpxL6dSBNuZrM1IU8A9AtLibwxBDBujUwxDUJngduhfNJP6RFV9E3eu54u/5mQsAJ
	 n+SUU2PHUcOTZRWI2VbspLFNmL3EdSwaXAIaKYXcW7msDtH5bN3VYaos8/T+/+IMMH
	 HnosktSPakc7A==
Date: Thu, 21 May 2026 09:50:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Emil Renner Berthing <kernel@esmil.dk>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Alexey Charkov <alchark@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Keguang Zhang <keguang.zhang@gmail.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/8] dt-bindings: soc: starfive: Add StarFive JHB100
 syscon modules
Message-ID: <20260521-awesome-tidy-tench-eeee8b@quoll>
References: <20260521012932.24163-1-changhuang.liang@starfivetech.com>
 <20260521012932.24163-2-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260521012932.24163-2-changhuang.liang@starfivetech.com>

On Wed, May 20, 2026 at 06:29:25PM -0700, Changhuang Liang wrote:
> Add documentation to describe StarFive JHB100 SoC System Controller
> Registers.
> 
> Add the PLL clocks for the sys0, per0, and per1 domains under syscon,
> as well as the PCIe RP reset.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../soc/starfive/starfive,jhb100-syscon.yaml  | 114 ++++++++++++++++++
>  MAINTAINERS                                   |   5 +
>  .../dt-bindings/clock/starfive,jhb100-crg.h   |  12 ++
>  .../dt-bindings/reset/starfive,jhb100-crg.h   |   3 +

Probably you should have own headers, instead of reusing CRG - CRG does
not sound like syscon, so these look like difference devices.

Anyway, if you decide to keep them in one, don't change your mind later.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

