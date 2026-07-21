Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5D630FC1D
	for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 23:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784676039; cv=none; b=sH72NDY0pJExGOn184cd+GfwIhHnycSIfWXSu+1vYU7OEHEZ5uTTKnRmr2nnAExwyhuvCx/ZJWOdKO6Rs3KuZBBiJ9w2L7ioXx7f98dyA9RPXoq+ezbkZFPZ46HUnLhULdJCXGjTv1MlwFTD6zm67inPNZ7Zl7LmchAFdSNK0Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784676039; c=relaxed/simple;
	bh=55PZ1dRQ+QBAYnTCFWdNn3YYw3nMqxbVavpQigkSyKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QKUv6S5hTOq4vJ5eXcw3DdoIhWPnJPoQSuD7jxOPSITJ7R8VmnYIZ1bdbX9gwJJjVFM9Cmikq4ZjholLOMkwlV30LOH5SOi1NXsrctzDqruerDXEKKzSAfmWiCd+j1g7tgxW5KxI/zi0MVY7ktwgJKjsn0+/j+RcSXwjcJLSsXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b3Q8TgQX; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ezkaf0XJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b3Q8TgQX";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ezkaf0XJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784676036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZBvF4sHXwwFEFaVeA6IZnlYB/+c+MHkK63AEWgH6t/g=;
	b=b3Q8TgQXKmX5YGc5NU1eav9/m1SfuKo+NDp8LpkJOHCO73SuvyRmzEsFr/70VzGFCK4WPR
	K454fDz9z2Fjt7b4IKWNIkcvCO0Nwq6DtUgNKf1eoKBqw3jgnhE2t6t49F03xVnOgoI5SF
	k+673HpKErforf1F5FJ4Qcv5NZ/t24Q=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-iXfK_vw6Myq9s76E6TGc0Q-1; Tue, 21 Jul 2026 19:20:35 -0400
X-MC-Unique: iXfK_vw6Myq9s76E6TGc0Q-1
X-Mimecast-MFC-AGG-ID: iXfK_vw6Myq9s76E6TGc0Q_1784676035
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f113592bf3so185895336d6.2
        for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 16:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784676035; x=1785280835; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZBvF4sHXwwFEFaVeA6IZnlYB/+c+MHkK63AEWgH6t/g=;
        b=Ezkaf0XJl2O+trTwCzZVkpwUGQZf421eI6L3Gcc+TXuE2owBVUy4aU7RUwrlIj/s99
         c+fn8gzp+/f5Pl4DTc4sDRagxo8ltc43XW14u5q7Kjf9MFomixKxmRcPXFwHYyf8TXHK
         Bs6AWlSBTrZJpJE4o7ExexluquElgxgVedjmxwx6/8nON3qewvYGxvlIhIZP7/cV2C5B
         Rn97XhEWYeNCiKQGtkPBlfXsku+70Cr+okyTbOasmbI0+ad0qWr5WC3Aw3I6V69L8Z6P
         MO1q9J4SkMRAze+wGsLcQ2+yH9oiVtE4jLvZkoXsUKtXHY9y5o0cc2/sEaCXhhTEUQ6l
         5llA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784676035; x=1785280835;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZBvF4sHXwwFEFaVeA6IZnlYB/+c+MHkK63AEWgH6t/g=;
        b=PIqxXAtu0YMJHG2HSors56DNMWhuO7x/3vHbRhlT3jpZZIpovghTwPzb4wJhwfWE4N
         CD1eU3dAZTMlkVQ3BNc+dLgK+E9xeEql8FwF6xkwslsf8bHajShOiD8heJjR+ePLA5tH
         JGQA8uVMU+Bczw9ZqHvNjNx+Arq/UGlnPJBFdrGt86zcW8QA8Kpu9lrgXx4C1Yo+0Lki
         at1cVJ+y0CZuFeIxPmqnYq/ru3yd5fjVF+16c+PHNglPfjO/BX5m0n1B+xly7pahjHrE
         wR0eQJzp65T/lwQ5MVG6AsWWBmCeA5C//UVevegmuS1oZpvgkTJk6vIHXXu0Z6+9+MVS
         NvjQ==
X-Forwarded-Encrypted: i=1; AHgh+RoYrEFsZWFob+wECGo44zI2g8CNUPVgkxXw2JbOvg9NVzMaZ7lKqYJ0fExiKcFpH7H6NGew7YBAv8E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXU0DQ1t8EXwZeBhtCAPksLsrnhVSeIIDPiLClB4qaJhMS6NE4
	Cq6E79rojsKP40s/9a86QQ48L6ZNMZuboM8QlyhqOTPn4wGLsq+qWL5PiVJASWmPTFD4xh+J58l
	AVKZsRNujWI8m7tQ9V1HbOiNNetFEzWs7o/hX8sptHYAQxWIF2jO547BMvycDTA==
X-Gm-Gg: AR+sD12HnNxMrUekMordbWXH2IVx2YViNL5Zvx2PzwNLoGmv6JdSQbM6j3VxrapocST
	+wi5/X3BSN+IpxMIs+9Teqp095Q/CPkOFpRRWSoCmHrfV+Pzvj2JPWgx/+YSrl7Mtg1/wrUmo80
	8Xzdv3bAdQ+b3vKYA11BAzQLXlMiDOQE1cfbi/haWP+Wvhak7gH/PWO47yOkOYeQgjMPqHFcgXG
	9895SwF9do+dsmhRa5q3FwghhJ4n3vcgmlMKkhm19GpVcrGVrYDRFeIOeWdeUJTdCc0zjw3aOa3
	66QeaJKkPv5lsWV5soVFvCXKdf2qHm5rNcGfwKAX2d1TBvtLqfOzOl7VK+zAAA+4BuNE2x05eRK
	m0dWs6SZMHeh1Ip6OYXK1c/IyVf1QXxTKTPA=
X-Received: by 2002:a05:6214:20e9:b0:8ed:29f2:32ea with SMTP id 6a1803df08f44-907783bee71mr224973216d6.48.1784676034698;
        Tue, 21 Jul 2026 16:20:34 -0700 (PDT)
X-Received: by 2002:a05:6214:20e9:b0:8ed:29f2:32ea with SMTP id 6a1803df08f44-907783bee71mr224972896d6.48.1784676034224;
        Tue, 21 Jul 2026 16:20:34 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907ba9e13d1sm7307666d6.28.2026.07.21.16.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 16:20:33 -0700 (PDT)
Date: Tue, 21 Jul 2026 19:20:30 -0400
From: Brian Masney <bmasney@redhat.com>
To: Simon Glass <sjg@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Fabio Estevam <festevam@nabladev.com>,
	devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, huang lin <hl@rock-chips.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] clk: rockchip: Add clock controller for the RV1106
Message-ID: <al_-vioCVeQxVo-f@redhat.com>
References: <20260714193656.2196447-1-sjg@chromium.org>
 <20260714193656.2196447-3-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714193656.2196447-3-sjg@chromium.org>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Simon,

On Tue, Jul 14, 2026 at 01:36:39PM -0600, Simon Glass wrote:
> +static void __init rv1106_clk_init(struct device_node *np)
> +{
> +	struct rockchip_clk_provider *ctx;
> +	unsigned long clk_nr;
> +	void __iomem *reg_base;
> +	int ret;
> +
> +	clk_nr = rockchip_clk_find_max_clk_id(rv1106_clk_branches,
> +					      ARRAY_SIZE(rv1106_clk_branches)) + 1;
> +	clk_nr = max(clk_nr,
> +		     rockchip_clk_find_max_clk_id(rv1106_grf_clk_branches,
> +					ARRAY_SIZE(rv1106_grf_clk_branches)) + 1);
> +	reg_base = of_iomap(np, 0);
> +	if (!reg_base) {
> +		pr_err("%s: could not map cru region\n", __func__);
> +		return;
> +	}
> +
> +	ctx = rockchip_clk_init(np, reg_base, clk_nr);
> +	if (IS_ERR(ctx)) {
> +		pr_err("%s: rockchip clk init failed\n", __func__);
> +		iounmap(reg_base);
> +		return;
> +	}
> +
> +	rv1106_pvtpll_init(ctx);
> +
> +	rockchip_clk_register_plls(ctx, rv1106_pll_clks,
> +				   ARRAY_SIZE(rv1106_pll_clks),
> +				   RV1106_GRF_SOC_STATUS0);
> +
> +	rockchip_clk_register_armclk(ctx, ARMCLK, "armclk",
> +				     mux_armclk_p, ARRAY_SIZE(mux_armclk_p),
> +				     &rv1106_cpuclk_data, rv1106_cpuclk_rates,
> +				     ARRAY_SIZE(rv1106_cpuclk_rates));
> +
> +	rockchip_clk_register_branches(ctx, rv1106_clk_branches,
> +				       ARRAY_SIZE(rv1106_clk_branches));
> +
> +	/*
> +	 * The MMC drive and sample phase clocks have their control
> +	 * registers in the GRF region, so they can only be provided when
> +	 * the rockchip,grf property points at a valid syscon.
> +	 */
> +	if (!IS_ERR(ctx->grf)) {
> +		ret = rockchip_clk_add_grf(ctx, ctx->grf, grf_type_sys);
> +		if (ret)
> +			pr_err("%s: failed to add grf: %d\n", __func__, ret);
> +		else
> +			rockchip_clk_register_branches(ctx,
> +					rv1106_grf_clk_branches,
> +					ARRAY_SIZE(rv1106_grf_clk_branches));
> +	}
> +
> +	rockchip_register_restart_notifier(ctx, RV1106_GLB_SRST_FST, NULL);
> +
> +	rockchip_clk_of_add_provider(np, ctx);
> +}
> +
> +CLK_OF_DECLARE(rv1106_cru, "rockchip,rv1106-cru", rv1106_clk_init);

Can this be registered as a platform driver similar to
drivers/clk/rockchip/clk-rk3528.c ?

Brian

