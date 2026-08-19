Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B119C3BD63B
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 21:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787174573; cv=none; b=WI+WmcIwVAp+b6BtbRUVuQThTgaWrq25DIJaqqKgbvUDrkvPjoNDEkyr44AUTZFgrF+8JqM3Se8NznghENXDZRQj3P2xPlQv3ZV5wWG+7is4uGgVRFbTL99QIWYOr0Qh+TRRxCxwW8a6rUJiw7YmFBAU+pWyUOLRM4c7xa0rSC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787174573; c=relaxed/simple;
	bh=SzUr6zig9u+8VJEkLvWpenZdKF09X36HV3SolVfmfk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bh+88guiv3fwUYtSvXpyCHORR4VtAOv5Y9XUw5CSGwjv7dhLDraFAwoRQm9qUCudY4d1nxXCd13bdSjsfxejh2p4vQQhpl9/NhI9p8ijNZLYibrrQcR+dgkodvCL3RrA7rrMVxhqLKhrHmmseBdCsNMuBlrLhw9/ZxNEvOxuVIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eU5dtyUh; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UHBonBcN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eU5dtyUh";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UHBonBcN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787174567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rj/mRgeCj8M3kWXn8y1lXKamZftjeOSlfCZmQd+Kztk=;
	b=eU5dtyUhzyWvU5glkZr5d9mU9bJCPHuMpBqInc6230+qfJ/KJ0uoaDXVzSP8Z+OCVexp+n
	GJjYIjJ77+I+lxbRUaqxGYAQ6xOzCX2xTeBGUm3d59dzS9Up9sYuiB6lKg/syBQ0F12Imi
	ubgJLYrUJES83cR2njpD2/pWwpWk9RE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-DHZt2n1aMKKYBbtckQl_KA-1; Wed, 19 Aug 2026 17:22:45 -0400
X-MC-Unique: DHZt2n1aMKKYBbtckQl_KA-1
X-Mimecast-MFC-AGG-ID: DHZt2n1aMKKYBbtckQl_KA_1787174564
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-907ca5abf1bso11604106d6.0
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 14:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787174564; x=1787779364; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rj/mRgeCj8M3kWXn8y1lXKamZftjeOSlfCZmQd+Kztk=;
        b=UHBonBcNHqyKboom6YYt+t+ZK9mcVmi9cN0KODqFWGxuCu8/KOdMY7Ohc22sQO7iuO
         M4nJ2EDKe2ByFEhvifdxSk1qngxDudfryBdKJtudp1SyQV0/R4cHe/AvPqEdaWI6VIL6
         lgiF5sMDvLol52vny0cHgEwYNS2V2vB5S8Qkz6+ndaPUnxl/T3ncyKDFoszphPM5Ooud
         TGhQ2cLKd5ebRQ4gygtai7utvrZIHjVn2fczOjPvwY9xXqBigxAiHKzuOYYguQ0vrxEm
         OGUP5x6BkHENkSk8KHmla3HLPCF6dfoTBL8GnWF9ZS/plqAZMyjywbxEtn90ScpWc/3D
         9bBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787174564; x=1787779364;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rj/mRgeCj8M3kWXn8y1lXKamZftjeOSlfCZmQd+Kztk=;
        b=NxraA6xYWka9CImsdMMdENwcVfOdyC/rWR8awkQiFF+E1hjAodfpHNxzhTJINbRCWd
         iH9SzGEOyZGkw91ZhjldoBxWVu1m0JNDxtWR4gLoupYP17j4jWx1jg7Okh1Ngm1heB3c
         BHmlifY7JSHlhcgzXGA3M3+myb17e/bM3U6Kv3kBNYhNbmj4T7Nhu92KFI2+IwuCPyys
         g9OYT2ZkzH7dhUkgur31UlcZcjDMFFAipWandMH7oTXHxwMKFhSXdZzKWC6m20g+rnWW
         8/qWz4Ye6IkSOjAZcWqd0cGlt+7w0jJ7KTTTWBnGlszRkYfex3AAjO0ahAp7aRQ6MPHz
         AZEA==
X-Forwarded-Encrypted: i=1; AHgh+RpfbN7gZbWyNJmv1Z5iUWoOK4BLqFjVSc+UrTpZIKsSbalpi3qV9IcXx4Omq7trGsBfJpfrA/wL/FI=@vger.kernel.org
X-Gm-Message-State: AFuF++l5oxrPhNZSQEheN+HKyU5GUCP0fPEsaMG6MxxqZi6ghdhb+ISe
	EvVuS0OiUK6iPueEjchsLQb5OwPA+4q2oDDeYDBW+jKzuUjxGMVQRlNiCRpF9pTmWXoIkH6865Z
	Z0yT1NkNfVScjOa5zS+0kKPtmoItQInHqwLViuolSzxWEtn+sZ3xGVPpuylEZHA==
X-Gm-Gg: AR+sD13jlIjc8nqY6S2zJQm1QH44TcWKwKIzTomA0XPbYNf0YvwU3S19g7Aw+7OYMIp
	vwqTn0/KDdA7JxE6xZY/f1lxAr3liq+fgu51njUCbro4THkfWgmRyIeyFvwaUxLF2/NZkTZPn3P
	E2AR7RkMa1SmGL4iMJCJZb6xZDQU3o17wx7k/n2X7XY5RlTagxBpj/B1gJLBSoHb3lxFAtqzfaQ
	Q7gVJCilo8XAhK/rEGmJ9y0e+IjQN3WhuXCKgWD49G9VHwIrqlQo6bPDS+cVyPBj44LWyQYHWK0
	+X1Cdp26Rp7Fky3/C0o1TU+pgN4ww3snN2F/8b3vd7wcBewvPv3/waw/u/G9oGmHeypBCxLjIr+
	f+6cvpLd/kWF0p6WjqP75y0T/7loaAkrHluA=
X-Received: by 2002:ad4:5dcd:0:b0:8c4:edb4:a44a with SMTP id 6a1803df08f44-90c5eaabae3mr79736376d6.23.1787174564247;
        Wed, 19 Aug 2026 14:22:44 -0700 (PDT)
X-Received: by 2002:ad4:5dcd:0:b0:8c4:edb4:a44a with SMTP id 6a1803df08f44-90c5eaabae3mr79735276d6.23.1787174563736;
        Wed, 19 Aug 2026 14:22:43 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5eee16e0sm23636866d6.17.2026.08.19.14.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 14:22:43 -0700 (PDT)
Date: Wed, 19 Aug 2026 17:22:41 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Nuno Sa <nuno.sa@analog.com>, Guenter Roeck <linux@roeck-us.net>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sunny Luo <sunny.luo@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org, linux@analog.com,
	linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-spi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH treewide 4/5] iio: frequency: adf4377: Make sure
 clk_init_data is fully initialized
Message-ID: <aoYeoSnvf5-l69lE@redhat.com>
References: <cover.1787165329.git.geert+renesas@glider.be>
 <302584628c4c0699239a0218376fe1c11cdc8944.1787165329.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <302584628c4c0699239a0218376fe1c11cdc8944.1787165329.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Wed, Aug 19, 2026 at 09:05:18PM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> adf4377_clk_register() fills in init.parent_data, and assumes that
> init.parent_names is NULL.  However, the latter in uninitialized, and
> thus may cause a crash.
> 
> Make sure all members are fully initialized, to fix such bugs, and to
> avoid future breakage when converting drivers to a different method for
> specifying the parents.
> 
> Fixes: 60e5448ddbec2dc2 ("iio: frequency: adf4377: add clk provider support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>

