Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DEF3AEF57;
	Thu, 10 Sep 2026 08:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789029289; cv=none; b=PGvt0yeTu/fTDdSPT/TPc7GxG3Vq50FGPAfVUlPMCX3YPTDxul25HgolR1zB99wtSySVlz4r4AUDCyiLAOJgtxmOKfoAvy1890lSCbbGpaFSrJq3UcPXA/u0hwFgzDOJnXlCGLWOEABCuf/5kr5aLBjPVrx6sAHPJNAoJAlceX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789029289; c=relaxed/simple;
	bh=bTHZpMQV4TPzGVxUAuMK7s8bRsJJMpd2UFMikmZsAwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L2JuXcUdFUIw0DapOdztpIrmwwG2aa9RG1b7h0NIqqcLMEuyrIGx6ZuN2Hk1altQwoxJe5zlTRXIiR9tmzuuapmP/ZRUu0AaZ331LtBgeg8XphYN2ZO0TrzOosTHRs9yiz4kwNMrlfE2Bml4CLLd118qglFy0ZDcZ8OMdQu9Xp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EC+u8d71; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EC+u8d71"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BA041F000FF;
	Thu, 10 Sep 2026 08:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789029287;
	bh=az0kiZ6Vkg/DvTV9UcQQ1SWFv3DTv1KIes24E9gOO0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EC+u8d71j2WycnMf8Rx/Q+VbqSCS2snfakFw7Cm7u1f/m9J/4f4/CihF4SEm129Te
	 GsZmSY8hs2YqP3NDSZ6eq++rS8Ozr8UFNxDeaXWL+y5Un/mkNlEhL7bNu4/FSwxbnC
	 AaV8kLEdS8ZiMcRlHDMrdIFTvu03KkrI8jlDGA5LsaOu5VMBnBxOSpFHiiigBiCaR6
	 K/ngYO1NKF+oOSzx1pup3Pu3kFmELfMeSRcrHjE3NEix62oVqfQHdXaeqO07YxnXIB
	 6jQmir41XTMnu8+XQGTg87PJZVoFZDHDVBGU3GMhUcLcKHK5DzZwebu0JDarbK+pFh
	 BYln0KM2aPhLw==
Date: Thu, 10 Sep 2026 10:34:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Andy Yan <andy.yan@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Dominique Belhachemi <db@domibel.de>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, mfd@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Andy Yan <andyshrk@163.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Maud Spierings <maud_spierings@murena.io>, 
	Graham Markall <hello@big-grey.co.uk>, Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v3 06/19] dt-bindings: display: verisilicon: Add
 starfive,jh7110-dc8200
Message-ID: <20260910-amorphous-vigilant-jaybird-d65c4f@quoll>
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
 <CGME20260904132719eucas1p1c900149ffa1b8771aca238e6441482ee@eucas1p1.samsung.com>
 <20260904-jh7110-clean-send-v3-6-484f9ae72715@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260904-jh7110-clean-send-v3-6-484f9ae72715@samsung.com>

On Fri, Sep 04, 2026 at 03:27:07PM +0200, Michal Wilczynski wrote:
> The JH7110 embeds a DC8200. The binding requires an SoC specific
> compatible ahead of the generic one, so add the JH7110 to the enum.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  Documentation/devicetree/bindings/display/verisilicon,dc.yaml | 1 +
>  1 file changed, 1 insertion(+)

And this one must be before patch #5 or switch in your patch #5 to
compatibles-style for children, instead of $ref (see some recent
display/msm/*mdss* bindings like sm8750).

Best regards,
Krzysztof

