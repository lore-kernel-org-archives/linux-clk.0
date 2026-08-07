Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A4337F005;
	Fri,  7 Aug 2026 23:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786143661; cv=none; b=Kz2ALsjpSLhnPnkfFJK9XYcO9KqOUjHhwfOff12yW8DZf9wD6X9K4tg2cI13BWkPwhbwx70332u6xFMzBOxFTOkzbT8c0Cch9FmqKRBOY93R338mdToeOfPeskqZ+KUaa1Z5IyQWauaX6SCTRBApsWAWLD975I5YZSIJ61+6Vy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786143661; c=relaxed/simple;
	bh=ehn886O3NCnmgZc9PsLrDZvpvQacFcgAeCSNjra8r3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rydaWwn3lvi5qKpWH/Z8K0FY5wXVrLcbZZqMpKG4XeGUJs7Ruuh7ikAA5b71FHVhWRhlR6eXlC6wDYI8HKASRKQsn0f+uSMZadVxvjQphvog456hx8ZFqUzdePJTjzkalYskLuRHMvRy9olePAZ8LYGtyFciuTvpYbKEsfQnDuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TKvsulIi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TKvsulIi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AFA31F000E9;
	Fri,  7 Aug 2026 23:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786143660;
	bh=80WwaWF3koU49E/sRFCnvP1FuEZ0SDdFnVmZ11ugSq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TKvsulIiESdBbBvXgonJJwAOAKG8TSVt2FgsLIZaPCONt51BEhO4suy5xyN4sNNwD
	 X243TXYp14/zmjAfI38a/A5ckjfvIFLlKY95IUN3e6ED/DjGcZlrNctEFqQhy8FiAn
	 /a+rH1pK0F9aIGaDOxj/XXMWkUeNSZkFOoTnlJZqes1q9ukqlI2PPHq4J8XHD3FE5P
	 j0v/G5+5xXhzDSDbHJUWwiBcmXUxAZMI2Vj/kdQl5+Nt4KU/pOp7W78LSJgGUJaFWO
	 9flqrtndIoebvI8BUbZZmZxACXKgsq3guEr2np2LBSUoB5Y3TiAnbKECkqUMqXzBxt
	 zW/Pbxfiwt5TA==
Date: Fri, 7 Aug 2026 18:00:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cody Kang <codykang.hk@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Vinod Koul <vkoul@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Haylen Chu <heylenay@4d2.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	David Airlie <airlied@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
	Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	spacemit@lists.linux.dev,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
	Simona Vetter <simona@ffwll.ch>, Brian Masney <bmasney@redhat.com>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH RESEND 02/17] dt-bindings: phy: add SpacemiT K3
 Innosilicon DP PHY
Message-ID: <178614365931.2211151.16636336802948226214.robh@kernel.org>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
 <20260725-k3-display-v1-2-6de34d80e86c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260725-k3-display-v1-2-6de34d80e86c@gmail.com>


On Sat, 25 Jul 2026 00:51:11 -0400, Cody Kang wrote:
> The SpacemiT K3 DisplayPort controller drives its four transmit lanes
> through an integrated Innosilicon DP PHY, one PHY per controller. Add a
> binding so the controller can reference its transmit PHY and the pixel
> clock the PHY's PLL sources.
> 
> The PHY's registers are interleaved with its parent controller's inside
> one MMIO window, so it owns neither a reg nor a reset and is modelled as
> a child of the controller.
> 
> It exposes its PLL-generated pixel clock through #clock-cells, so the
> APMU pixel-clock mux can select it as a parent through the clock
> framework.
> 
> Signed-off-by: Cody Kang <codykang.hk@gmail.com>
> ---
>  .../bindings/phy/spacemit,k3-inno-dp-phy.yaml      | 48 ++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

