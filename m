Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CDA2E7372
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 15:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779980492; cv=none; b=NvPHPIchCIPVK38yn9acTGK6X0qoWLkwwm3L76cG6x1/jaEph82nijvesXRNzJ5whKpGa3rkTAkwSL7FHZ8Bp+0MUae/guQ6VgWwy27ygA8T1JTDI4OYh/5gu9EAuRBTTzjZEqbiylmShj6jD12ZgqwMhlSsmF4Q0Z7/6LPinxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779980492; c=relaxed/simple;
	bh=9xzyoUE6qOdj6O2bY4JAlCLASTXIu14f/2Bz1bQlr7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u9DJN3D88Ik8PhcXGTrlSrRW2yvGffdgk7GAcnpoHNs21v9/O4xM3rREy4HWfptv/Gs22Iot2d8lo29Bvj0I5V9iv1ZtOc03b7o/2oxD2Vjn+0f3Udpu9QuULtLaBDKYBJv1E2riSb5WhiZBFhx/LoEat+OP9OTNxKc0pbmnFv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g/eRvKoh; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y/m4jXAl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g/eRvKoh";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y/m4jXAl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779980486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CBJS8Qa+mR61hdZo89Fp/7Obv2aTJuMCATxA11asNhY=;
	b=g/eRvKohqZLH7NK3tzwyf7Cr3n6rFTjjPvFBg+EfzGVwD00eiPLH0i992GLK8xpy3MpIm9
	NxYD9G4LWzdoz1o2RPJH/NUYoSejR0QouDx/fvHGMzepfDjBR5tELIBgwSezfYD5FnbKrw
	/AEGwdUWQkPHV4TXJvIv4EMtxVtkkMg=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-wNNP8SaYNhyeSCoHIkymdQ-1; Thu, 28 May 2026 11:01:22 -0400
X-MC-Unique: wNNP8SaYNhyeSCoHIkymdQ-1
X-Mimecast-MFC-AGG-ID: wNNP8SaYNhyeSCoHIkymdQ_1779980482
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7dc18e2498cso20510057b3.3
        for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 08:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779980482; x=1780585282; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CBJS8Qa+mR61hdZo89Fp/7Obv2aTJuMCATxA11asNhY=;
        b=Y/m4jXAlX5biOhD3shd9cJJXEeKcnRkPICtNqq8IcMq+fb7Jx+XLd3IlPD/BMuMNL/
         wlA4G0t0aeAmVOo1q+oEU1ScTNHvZp6Jm7PXXv2ofuaTevTq+BtU62T+L9DDtrW6v0mQ
         8d9WbM2ubUzhwrlKi2ZFOOqNDnzfXCDP8hdF95zDvC0KL7OlWnLXt2RHQAcw4riZS9kV
         CQ+yFW1gvzEnwVBypgwGiKEdo+4z2xDmWygJCZRiqHP2c9BYmt3OgqVng65du39smjiW
         RLlqCqKwaut0CttrO2qnxbOY81ojPXrGOkEO1nM951GSRHnRaUxazZiiBwnQVaKNLxRe
         5Oag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779980482; x=1780585282;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBJS8Qa+mR61hdZo89Fp/7Obv2aTJuMCATxA11asNhY=;
        b=GyCLM4oUGGiCj2R6yKV0zvgn1hyHRk7CF4S77QFdBG5GLKTmJY+NoTkwFzAirGNoRt
         kvO5eOLXCqXl5Dkyox+YWjns/ShHiQjBM0BUVpUwcVwrhiYCmiIl5jeWVJ4Fg4Ma6xCS
         kzUKqBwriIxzbcu4Pb9yOQfomM6+6Ij21tiQlJ/LbhM1VMCoXonB4+uLkF5SXRkLpGu6
         BwqnPi/HkySBn+kfkFJYQPsqz/X3bjyW/FWsZQUHsaiszLrLKtmgbj5c3FxF8+PKLjga
         czWTKSU2CplIDmkEGpBLLvPv2oIQWfKx9JXzHew4ICZ1/omnvgHg/VEP7/xT79ZKMii+
         qL5A==
X-Forwarded-Encrypted: i=1; AFNElJ+usMhf8jfLavN9ARtl2MOkPwZTC38GoUx3EE/WKEXspUI5qB9xpbppR7/us9Nfa+8YlxXpE6VhcC4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw72LgV3wtJod3+ofMdNQ0oAk1MKgPshX9R+DUkj9Yj8ZgYQjFH
	RD78LC8WO8ovklIti4wuDNGHeMF6F89PHi4FC6NlXRguMyCK++v4TW3azdRZmtwY5v4QTM4ljLd
	aMwK8UxCFKFkc32Fe0qPUISrWtPvIdtgR054YQWfnjU+jXcyCzdYa6VY1UfxQhg==
X-Gm-Gg: Acq92OEgyGlE1R54YGbSvw4X6RKFotDTThAStFOBw7f8nI9338mODl5HstB8MQ/d7AS
	4e1q9BZ7I4Cmh0E0mwrXVo7ZfQO0vzF9MN/DiILgOFTVSchC1EgE+8TPqOctr4c+lBhGn1h5T96
	iMQeS5A5SAxry0mZEmO6Nqhs0rLfgXNtA9QlkB0rUBnKzshaMGxuqPuYEG3hymRJtOisT6CAfUV
	zkIq5oSjMxSiuedKGuMeGy+B9gk84io4jsmr2THnlKfGzJy3+OxZxl6Pq4/sm8qNo0jLnYJhssA
	zAlfr7vlmnZwwRhftztS8+2Tg8c0oK2CpBmzrJLFpv+9LB528wLVcq4aTvXX8sXmUFOOshWlA5l
	ijHo0Jr0lx0AQcJbLH/YAbomSphfA0KcCIqVsSgC6DubNSh/VJ6MBr/a3dwcAwS2NNdg=
X-Received: by 2002:a05:690c:6901:b0:7db:ba77:89a0 with SMTP id 00721157ae682-7dbba77995emr58160117b3.35.1779980481556;
        Thu, 28 May 2026 08:01:21 -0700 (PDT)
X-Received: by 2002:a05:690c:6901:b0:7db:ba77:89a0 with SMTP id 00721157ae682-7dbba77995emr58158977b3.35.1779980480727;
        Thu, 28 May 2026 08:01:20 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccdf274370sm5674976d6.32.2026.05.28.08.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 08:01:19 -0700 (PDT)
Date: Thu, 28 May 2026 11:01:11 -0400
From: Brian Masney <bmasney@redhat.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v1] clk: Use named initializers for platform_device_id
 arrays
Message-ID: <ahhYt69wr3vg8A24@redhat.com>
References: <841cf835a24bb2f3acb99a97bb58e583220e03a2.1779963984.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <841cf835a24bb2f3acb99a97bb58e583220e03a2.1779963984.git.u.kleine-koenig@baylibre.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Thu, May 28, 2026 at 12:29:38PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> Named initializers are better readable and more robust to changes of the
> struct definition. This robustness is relevant for a planned change to
> struct platform_device_id replacing .driver_data by an anonymous union.
> 
> While touching these arrays unify spacing and usage of commas.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

