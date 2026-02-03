Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE88D3ACF17
	for <linux-clk@vger.kernel.org>; Tue,  3 Feb 2026 15:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770131754; cv=none; b=f1tVU4KzskbjYDUF4GiCVppEPgZlJduOtVvKLKCbDRweW5dljZqHhoZ4UWNswb6ryR+uxzYJT40TRAxwbFyBpsyxDTxFc9gKuPog7ffW++wpzwHvtcrLHSq1UgzvGSzU5GyLTpfHBiXggGoaPTbowNn1Xmxm1Eb0HtOa/pgkwRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770131754; c=relaxed/simple;
	bh=1Fi5bzZAG+1cbdUfewtQaIkBwyxLJrJtRKSaoVU2o4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hizyxdxdimbvRJLmewgEjfxoRJVPuV4eeYURVAQhYZAruYTbYadpusAuTlzpBcTHbpo2AzEj7zO8Lo3NDPmjLDVL6lSDNsohtJIA1Iqx8Ww6McobPMBZtadRr1ETRXHbUxGeQBXnr/VCuKWX1x+PzNtQH/FYP+dGvEbLzyvUZZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Yp5DGoms; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=eRbtheRD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Yp5DGoms";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="eRbtheRD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770131747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3GPmx/o94nzL4/jmMhbm+4apVlFi7+ZwJQ/KS0Eum2k=;
	b=Yp5DGomsUd8neCy5SExr8VH53jM37A4iuM+XgCU9mzOA5kkH6XKETrlEUVeXcZBcmis7MN
	WoSn/wEFo2Smqr5F/pty0UCL8a2TMSPSbcV8bTh6lT4vnnT2Y/SYu7ZPDj6Li46fUU+Hzq
	FBmAqb6jSmEo1m910iVoYWTd4SSlBGw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-Ht3kvzAHOzuXuPIw6xsFyQ-1; Tue, 03 Feb 2026 10:15:45 -0500
X-MC-Unique: Ht3kvzAHOzuXuPIw6xsFyQ-1
X-Mimecast-MFC-AGG-ID: Ht3kvzAHOzuXuPIw6xsFyQ_1770131744
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5033c483b76so208132901cf.1
        for <linux-clk@vger.kernel.org>; Tue, 03 Feb 2026 07:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770131744; x=1770736544; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3GPmx/o94nzL4/jmMhbm+4apVlFi7+ZwJQ/KS0Eum2k=;
        b=eRbtheRDBAkNLSmPnQXSLY51IZYS7mSyJ4nrPWKfqOEw4Bx5Be0Mmstc/QgM9Z6i4d
         1RawUsTchID0EsAQYN6020Rx3reKsAWGk9bEMtmMcja4GHgegCVKGkkZ13N9aFvmiDal
         KyYiRpkIz+f77c2hiE2K8zNoVg/uYedTlUCnEPux9OGwiHw3lngAqafvLQ1OM5h/VpYj
         Kd3nhFlsMjXtkIZVie9i+UpvNAg4KtbCwmUJt9TGrARaK8KFtFlW+Juw/bhF7xZKlTmo
         dWDCW92hqXWr3KlbxhfN5AXfI9W9wgmEc30JjMqBsG981xaMhFbx9ktax7YviCIyWO4V
         grFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770131744; x=1770736544;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3GPmx/o94nzL4/jmMhbm+4apVlFi7+ZwJQ/KS0Eum2k=;
        b=gn/yYZ0ZlzYG0jJcFk8PIl9+Ag521uJFKnhW96zR6Y/d80bMqsL3QdKI+K/GTDmGGV
         cRTO875OnqS2By3qNTod4kMlUEaT/4F6AXg7S/MNPEhl1rAqGkYb2pyb/+0JPEQqh+zM
         mr3N8edexYFssUSuJvWwXMG43p2Ty77/DGlsGZzHUp3Jndboy4GW3ujI8CPYnqLz2dS6
         vVBcY/emP35ZTgcN1+STAIL+14+NJk5iwh488CfGtrYL/bB7U8gOasGGgTDjXCZ6q+nQ
         Gm2/8ai45K1AttyL6yjvJz85+VoLwBF75h/YGs8R4LvPUSyagHL37CTokKdXThOgfVG0
         hX1g==
X-Forwarded-Encrypted: i=1; AJvYcCV2cyghZrzurerUMIsNSNMYvdREZhVE6+M7QGTQctmD/95Q/CWBdMYH8PSjB3+Lv83SDXXlfPfDjpQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgOeZcrZcM+hU3qsJItcNvohliGrmP1y3FnDLt0I4ccOpso15E
	NxiLu6jI2WnyHnYpkCYcqsPdL0Y6rZRJwhnbkmfpJO/W8PZ8Q9wWPd8YUTHdz5N9gC3kfzCJg41
	6QgMfuDODYhztM1Lsraver2oPPei1/dOGAS3YNfh9hLxGswyi1mZCo+xvlOv19A==
X-Gm-Gg: AZuq6aJfNv74BmVbrVemtq2d2+EdZbNd3NMLr8kpMJir0/9iEYZ9lw9qJxRq1/CKXH5
	c78E2hppk2eznm6D25POxSor4iILpy6PHPYUrTo19NORlZQDJ4BjaLf0LqN9tfxRTxE5wYmVnvQ
	ILQDv9o0km0Kx3VKIzGBW2n0qLWn1oaKzAK5LEAPdvQ1OImF0JAwQ2JBGdK9Jq00p28zM0y/XMQ
	NqhHGfXGM1INWiPF+sL5vyIAt6YGS8SrDgnwPxd/nNSYJQ8K1ptAvkbFxVj/KaohdniIfmurBbz
	p1Oxs0ahPYC/GJgiGgTk+u60BnpUjvJPYG7cmovScSsEgAm15rsEfz69tzcaQ+9VHbBhJekkzgw
	YF/v793e3eysazUD8OMlmWC+x872JgF0pHC4+xfnFIbzv
X-Received: by 2002:ac8:7dd5:0:b0:4ff:c08a:52c4 with SMTP id d75a77b69052e-505d218ff4fmr206450041cf.18.1770131744188;
        Tue, 03 Feb 2026 07:15:44 -0800 (PST)
X-Received: by 2002:ac8:7dd5:0:b0:4ff:c08a:52c4 with SMTP id d75a77b69052e-505d218ff4fmr206449111cf.18.1770131743486;
        Tue, 03 Feb 2026 07:15:43 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5033a4de38esm129309391cf.27.2026.02.03.07.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 07:15:42 -0800 (PST)
Date: Tue, 3 Feb 2026 10:15:41 -0500
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	patches@lists.linux.dev,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Mark Brown <broonie@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH] Revert "clk: Respect CLK_OPS_PARENT_ENABLE during recalc"
Message-ID: <aYIRHf1njCXmoswF@redhat.com>
References: <20260203002439.1223213-1-sboyd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203002439.1223213-1-sboyd@kernel.org>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Mon, Feb 02, 2026 at 04:24:38PM -0800, Stephen Boyd wrote:
> This reverts commit 669917676e93fca5ea3c66fc9539830312bec58e.
> It's been shown to cause problems on i.MX and STM32 platforms
> where the board doesn't boot. In one case, a clk with
> CLK_IS_CRITICAL and CLK_OPS_PARENT_ENABLE is being registered
> causing the parent to be enabled, the rate recalculated, and then
> the parent is disabled causing the critical clk being registered
> to stop clocking.
> 
> A fix for that would be to calculate the rate of the clk after
> enabling the critical clk itself, but that wouldn't fix another
> problem where a clk with CLK_OPS_PARENT_ENABLE is registered
> before the parent is registered. In this case the hardware access
> in the clk_ops::recalc_rate() function would fail if the parent
> is disabled.
> 
> There are even more problems exposed by this patch because it
> introduces logic that disables clks earlier in system boot than
> has existed previously. Historically we've not disabled clks
> until late init (clk_disable_unused) under the assumption that
> clks have been registered enough to have a consistent view of the
> clk tree. The clk_disable_unused logic doesn't work very well
> though, leading to quite a few devices booting with
> clk_ignore_unused on the kernel command line.
> 
> Long story short, disabling clks during clk registration is full
> of pitfalls. Revert this commit until a proper solution can be
> found.
> 
> Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Closes: https://lore.kernel.org/r/6239343.lOV4Wx5bFT@steina-w
> Reported-by: Mark Brown <broonie@kernel.org>
> Closes: https://lore.kernel.org/r/036da7ce-6487-4a6e-9b15-97c6d3bcdcec@sirena.org.uk
> Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Cc: Brian Masney <bmasney@redhat.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>

Reviewed-by: Brian Masney <bmasney@redhat.com>

