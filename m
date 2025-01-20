Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE5B257D;
	Mon, 20 Jan 2025 07:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737359151; cv=none; b=hdgntPOmzdiUmxQ2SMHBHMkjYIDrzhOLVaTSOlbTZJaVrxMGEEwfX5WETN6S4QtlAn9A/OhJB6sQqE80CE+/S5lXvDTRmMSWmYVrWD7Z4XUgVw1o2zJ4bTuat3CllefRXJIp0fPvbl35Am90GFoYoJe9I6e1dslmWZAy9jdAlmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737359151; c=relaxed/simple;
	bh=SLyPkcqPR2Tw5C72SJaWnOo8jl9wu0NKblFOeOHCt4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F0q7rjzdX9t8DPxXxFVuofZFpg0pJTCqMXO5xV25IwCWRDzgDQoX8HSAVi4NAZe2ZV+Fmie9cy4ghknBbi2MSiD3nn6fGKCKvyOGcB2BTJkDRUVlclpcyqPFtbSvEecRhTUek+Dfc1CKIZuaAn3/AVKXKyzDWIIN4apScSItkbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YhTrJiiw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YhTrJiiw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A4EAC4CEDD;
	Mon, 20 Jan 2025 07:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737359150;
	bh=SLyPkcqPR2Tw5C72SJaWnOo8jl9wu0NKblFOeOHCt4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YhTrJiiwu4uCfcSwmNzAWzEjnL/3C8SHE5GWzLFP2KK+Hbo0DXeqe0XJgfDheXfJG
	 rVx+PnGRpHy//caa/610+aBon6CjU/9kzlEkXpgjVcgso9An03p3YTViyAZImuAts8
	 nHp7WwE3+yURkmWsu4jg9/rERsdQtFgoL89NkQbnBwyT0p+38nJ3KDIUV2xk9er7vX
	 asYdqqxg31ZBmo3BwuYMgdYvFXSxqs9w+BF7QoG2RV9goINZgBcaAn1PpNreeKqn/0
	 gDR5k7KAhXmM0tOlImuBDHCTg5ei329L4VsVKN+edgVVn69pKGzvQBVw0aFvwJUGy8
	 yxYibTXzZPK9g==
Date: Mon, 20 Jan 2025 08:45:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-clk@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com, 
	tsbogend@alpha.franken.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org, yangshiji66@outlook.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: add clock and reset
 definitions for Ralink SoCs
Message-ID: <20250120-expert-fox-of-argument-c4dcde@krzk-bin>
References: <20250119154447.462857-1-sergio.paracuellos@gmail.com>
 <20250119154447.462857-2-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250119154447.462857-2-sergio.paracuellos@gmail.com>

On Sun, Jan 19, 2025 at 04:44:42PM +0100, Sergio Paracuellos wrote:
> +#endif /* _DT_BINDINGS_CLK_MTMIPS_H */
> diff --git a/include/dt-bindings/reset/mediatek,mtmips-sysc.h b/include/dt-bindings/reset/mediatek,mtmips-sysc.h
> new file mode 100644
> index 000000000000..1bc6024b1f22
> --- /dev/null
> +++ b/include/dt-bindings/reset/mediatek,mtmips-sysc.h
> @@ -0,0 +1,152 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Author: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> + */
> +
> +#ifndef _DT_BINDINGS_RST_MTMIPS_H
> +#define _DT_BINDINGS_RST_MTMIPS_H
> +
> +/* Ralink RT-2880 resets */
> +
> +#define RT2880_RST_SYS		0
> +#define RT2880_RST_I2C		9
> +#define RT2880_RST_FE		18

These do not look correct. I understood from previous discussions that
driver relies on these for its internal operation. It looks true for
clocks, but does not look true here at all. This is register bit passed
to the hardware (and I explicitly mentioned last time: that I expect
these not being register bits passed to hardware).

None of the resets are bindings - these are just hardware constants.

Best regards,
Krzysztof

