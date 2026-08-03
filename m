Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE7B30146C
	for <linux-clk@vger.kernel.org>; Mon,  3 Aug 2026 14:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785767828; cv=none; b=g50QOZ2H0IcW9lY0u3uG0fklf2TorLlaWQnYHGr1d3wX+j/ekHo4VW9+kJdNq8Dn1uKm3GOWJCqnuCNIxREQlwAlU4cLASEOYbEMBoHnDE93lzCYEn6REuU0IOchrzxoT0dTUOmg51rQVGB4mmO6vJO8sX98bSerzXcCnzs/FOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785767828; c=relaxed/simple;
	bh=pb/2bJn713F2QrBfYFAcNFUuDl0EojezK6P1ZrrJCpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bWY1xQgWLFVh7fccTwJkY4qi2ThvrURIiaxjKvlcjCrfSWMxkr8ua5/VLD9GbBv5AnV8FLmajDvTG9SoyvC3R8lGi9oW3nYHnalW3756Hvl119NPBiudwDg/0bvRnQF0SZ0lH6yZ/mlJza6jIxHdCRLwJYwYaMCwHHCpQS4c33Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GWPTgQza; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qPNkLhd1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GWPTgQza";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qPNkLhd1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785767826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Oz+46xoU5Ps+EiowJN5fDiWs3w3cNh/2x67ul7cY68U=;
	b=GWPTgQza/FGzpBYrl55xvJCgfkAQJYJLHQxLioH/iqGZ/QymGKUFzz4Ypknz7hjv61Qgay
	8/gTTqNCg20WZT6/hqlcmu0sAtJ6Kwlya1BZLq0e/fErLppi76WGc1dWnN4ks/C0DI6xU2
	wJtt+PI8glyEooB0NXdFGxDygZiHVg0=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-116-bHBOLrsjPSW5zmJ8S99JvQ-1; Mon, 03 Aug 2026 10:37:04 -0400
X-MC-Unique: bHBOLrsjPSW5zmJ8S99JvQ-1
X-Mimecast-MFC-AGG-ID: bHBOLrsjPSW5zmJ8S99JvQ_1785767824
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-81e8653ad27so117712957b3.2
        for <linux-clk@vger.kernel.org>; Mon, 03 Aug 2026 07:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785767824; x=1786372624; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Oz+46xoU5Ps+EiowJN5fDiWs3w3cNh/2x67ul7cY68U=;
        b=qPNkLhd1XpZ6n0+waw7ob2Ef/S5em34NvI698Jkmz3YZNTALwFtdn+jv7MCNcwsFSt
         WmJsWcT1YSUD7IPRF64DSf1Z3iq8lhsTw5pxg2IrrBe2JgjK4F4FgE2gPm56W1k7+ZUg
         upOIjHmOL7XLbSI835Jhrmm2IujcdIAPejKlKoU5se150sZNLn5l2DoWN0nqqwnkgKkp
         4xvNq8J4Z9m4T+NapUV1X8B4ZW4BN4B0qG4RsUOBwEMHDso5DIsXP5CMDEbUsCUcywq8
         n8ta7fMHWVykms7CsaV1HubrG2YI6X2+wFVtX1hru59T9JT84LKsm5UMfEs7FN6N09kF
         Ds7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785767824; x=1786372624;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oz+46xoU5Ps+EiowJN5fDiWs3w3cNh/2x67ul7cY68U=;
        b=N0pHcW4fX0el9BIU10AfOPXPK3zTo2TlWIYcLKnOlgR9KpilsdiI7DRnfKFGFQzipU
         TzsLTS0TPDM6IAd7yQVrV6e3i96UdwqMrNT58/D43qQQFawrfkhoKEI28lw3SYHMJNk3
         3goAjvH/7ENA+T7DSiOHJepadKozivg3aR3bIvIcZmzYqZm13oAEm/U+TwlerOqj8aok
         u7urAo6nwbb15UWw5/GCy9RN8t6D9uCEmm1VtC0yZn8z04gKi8Gsofl+mz7eOBqT1iwk
         cyNlhUFjSmwBjmixEzTy/sWgu5WXeHSUMQ7evRy0hpN5Lprvs+DQn2rN1wqdArNDLexO
         2TOg==
X-Forwarded-Encrypted: i=1; AHgh+RrO5uFZyKjqvvJfsuAdV6baOmufXTvwRUsoCrgWrny79iEN1v7UcWyAEfv2Y8DVdh9Nh0rHgOXuSZE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwasCe4ajytBUm7uPisNo+ua5u5PHouA0IGE43kpOtLsVlxchOF
	h8oqBmm3WMRTIjTPOHegJ7OFZz+EXAD2r7C7eWw/dqaSn8CsaUgk/wYV6JNj6pfxZ2nmbcS2+9T
	duIqyYbn4pg3DCtAkHFLO+anWMQrVLTKC0+q9lB0+KxhKZStnt/leYCGnNjE5yQ==
X-Gm-Gg: AR+sD12/1qQ36GUHlXMMQQmkM9Nv/bj7rVSeC2fB/0xVscWiHMTz0i957TGfLhgjF4H
	04Hdv7iIWpVo6a/elNRQEaGOyYUWxG6MhZJrfFCF/WqjfpRGNyF1Gax3BzB8aYVUwTwTyw3WZoA
	jeS3kfQHDSWrLt5rMjdPHTm2SlO8d3xQovKZ34shlr7YNXWzB8xSYpw9yk9vgUtDijiVToR50D6
	DDhKK9ytMV5oo2ah6pOdBzv14lqMpPgOErSNDgwTjuIyikTO0d/H/T4wlP2pw7WSqvte4WI/82I
	pFsEtUpftD08yqcwUIanfNfKSmeCtqt/SIkQ+IMXRQoRfHhGtkbjA+T1e+sqv7EIOLBOtRAa6fA
	yywT6JlUR+kFwG9bXJpgrJBJFX4RtQq24j1U=
X-Received: by 2002:a05:690c:4d83:b0:80b:9f4e:a70 with SMTP id 00721157ae682-81fd4ba6936mr134850457b3.26.1785767824044;
        Mon, 03 Aug 2026 07:37:04 -0700 (PDT)
X-Received: by 2002:a05:690c:4d83:b0:80b:9f4e:a70 with SMTP id 00721157ae682-81fd4ba6936mr134850157b3.26.1785767823526;
        Mon, 03 Aug 2026 07:37:03 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd0d70besm54676927b3.31.2026.08.03.07.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:37:02 -0700 (PDT)
Date: Mon, 3 Aug 2026 10:37:00 -0400
From: Brian Masney <bmasney@redhat.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v5 10/25] clk: mediatek: pll: Add BAR reset register
 offsets
Message-ID: <anCnjHectpXOqQku@redhat.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-10-ac4410697cc2@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-10-ac4410697cc2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Sat, Aug 01, 2026 at 01:20:56PM +0200, Louis-Alexis Eyraud wrote:
> Currently, the register offset to handle BAR reset, for PLLs that
> support it, is hardcoded to CON0.
> On MT8189 SoC, there are separate status, set and clr registers to
> handle this, so differents offsets are needed.
> 
> Add the new fields for offsets and addresses to the MTK PLL data
> structure and modify mtk_clk_register_pll_ops function to compute the
> new register addresses so they are available for clock operation usage.
> 
> Also, replace reset BAR address computing by its computed address
> from MTK PLL data structure in prepare/unprepare callbacks.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

