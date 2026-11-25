Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621006;
	b=imvZDq3o7Fj+kPRQ4lVBXVYUhANMI2BeqQkW+1pYYUWTRcCyLIaTS0e/xILR3f6XYVnG
	 +FiI5bDYdSEHMY+AtOWap9B9nFI5UomjkMZriGPr/7gD2YzkaG692Lxfu2b2OORQATOA1
	 qk28g/3/Blql3Zonin1KNqA7GbJepgbl8LEIkDIcu2natBfrhmTjdhYYbdweKI9aVnMeY
	 92+QMMuJpuTEG2h9pniPzzMS7hlHt2P7EG+v5Rt48tdyxRCGplAnJGBR/t7L7LOxuvSca
	 UBO/8yIw5yskK0iZPDFxLKmz7+4COtMmd5i9w1EnSA1NLe1G2V1ClzEFF9oqzBBvsJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621006;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Db0NSgXMkMNO+C2D5Me7g3QqZEixSPV9A2/gMgzci+4=;
	b=mziSo9WsmmfQ3cPShv7rn3Ha9G/poHP/VyAAezSkckqWmTt6a/fWnKS9FxtTZrS9MQyi
	 NpyzPIXFi9nd81nuOHcSqowq1bkwCI/IX9gBCcCgd1y6WFZ4IneyYU6TCS8/Up+gtj6xM
	 a9L4MMs/GDxX9VUF8wS4Iikwedj6uPjkt4KbdtAmNlNBWcE+u9BP6ehn1Yc5JBqLVNHlG
	 MsHgUuo0RJ/wg1WZErbwHuMtPRyXfZqe28VQowkFrgaFteEag8WDR0xVfkVbKvszsd6CP
	 UDur5k4BwWgr01RwcXGMUMLP0GaITioAgxQpwyLOO1mm4QTg2kBouV85RG5hV3mKR4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kwvwmjDA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37D560A261E;
	Wed, 25 Nov 2026 15:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kwvwmjDA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D09B11F000D2;
	Wed, 25 Nov 2026 15:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795621006;
	bh=Db0NSgXMkMNO+C2D5Me7g3QqZEixSPV9A2/gMgzci+4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=kwvwmjDAoL+Vj3LJyhaLGAWrR86wbbBIdS15WS6xazfyEjZ7kvnWwxjfOGBbHmB5X
	 Ye1o18WjwWuK1NtCC5i6piR3bPfdyaoEsRFKKLbHX0HMs1J/Iiahqj8U7jKmE1SDhI
	 C41Fs0A9gw4P7lb2WLsP04xTaxmX/bBuF8/Zrn6wb25WJ7eGONpImBPwRz6xDJ2oLu
	 55Np/qbyYBCkNZKJMYizEvPLqBOMSgQhW3+m3fImDvVinbEirVQBk81jAAHyEbJPcQ
	 SY4cXUvkY1/AhJNOx2b3FGF0+whmW/UDn523mnLZTSIQn188GaGXqTnoWFzD0+LtkI
	 WTQrRY77D4nJg==
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 7/8] clk: clocking-wizard: Fix division by zero and
 unbounded register write
From: Brian Masney <masneyb@kernel.org>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, git@amd.com, 
 shubhrajyoti.datta@gmail.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261124035613.1968260-8-shubhrajyoti.datta@amd.com>
References: <20261124035613.1968260-1-shubhrajyoti.datta@amd.com>
 <20261124035613.1968260-8-shubhrajyoti.datta@amd.com>
Date: Wed, 25 Nov 2026 10:36:33 -0500
Message-Id: <179562099317.458327.4285167925748688864.b4-review@b4>
X-Mailer: b4 0.17-dev-8145e
X-Developer-Signature: v=1; a=openpgp-sha256; l=1934; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=UMWYa4TPDU8Q7t9X5oGe2QDTLUGyi07Kbjlh8X3LaZg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLZGVoreoKZZKLy780+0aUj0GRSYbzH7l7IxvL2qSxW4
 R8mXbrUUcrCIMbFICumyLIk16ggInWV7b07miwwc1iZQIYwcHEKwETuNTP8ZpdJ/rBmM3sDk4xr
 bPPk1Ec6mz/PYo3xu3RxpnPhlS1yggz/65IT2wPneP0I3/t6D9uxFOGO2et77Oxf792sk7dxrf4
 +TgA=
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Shubhrajyoti,

> 1. clk_wzrd_determine_rate(): DIV_ROUND_CLOSEST() can return 0 when
>    the requested rate greatly exceeds the parent rate, causing a
>    division by zero on the subsequent parent_rate / div. Clamp div
>    to a minimum of 1.
> 
> 2. clk_wzrd_dynamic_reconfig(): min_t() result was not assigned back
>    to value, so the cap to WZRD_DR_MAX_INT_DIV_VALUE was never applied
>    before the register write.
> 
> 3. clk_wzrd_get_divisors() and clk_wzrd_get_divisors_ver(): If rate is
>    0, DIV_ROUND_CLOSEST_ULL divides by zero. Return -EINVAL early.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

This needs some Fixes tag(s) and Cc for stable. Also this, and the last
patch needs to go at the beginning of the series to make it easier to
backport to the stable kernels.

> ---
> (no changes since v2)
> 
> Changes in v2:
> - New patch
> 
>  drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> index 7fe8d0d4cfba..046efa5c77c9 100644
> --- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> +++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> @@ -303,7 +303,7 @@ static int clk_wzrd_dynamic_reconfig(struct clk_hw *hw, unsigned long rate,
>  	value = DIV_ROUND_CLOSEST(parent_rate, rate);
>  
>  	/* Cap the value to max */
> -	min_t(u32, value, WZRD_DR_MAX_INT_DIV_VALUE);
> +	value = min_t(u32, value, WZRD_DR_MAX_INT_DIV_VALUE);
>  
>  	/* Set divisor and clear phase offset */
>  	writel(value, div_addr);
> @@ -341,6 +341,8 @@ static int clk_wzrd_determine_rate(struct clk_hw *hw,
>  	 * achievable
>  	 */
>  	div = DIV_ROUND_CLOSEST(req->best_parent_rate, req->rate);

The Sashiko feedback looks legit here regarding the u8.

Brian

-- 
Brian Masney <masneyb@kernel.org>
