Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699551AA788
	for <linux-clk@vger.kernel.org>; Tue, 12 Nov 2024 08:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731400889; cv=none; b=RySA3jEUYjNYd/8JPGq+ZyL9ybi/C8pqcBEC4EI/+/UZ4dOhXi8KoL/CoU8Klk+8RgtC7dBt0IjuEX5AAC3Yt6HPScA6pspc/fS9+Sj+bV5pU8CzgNBhqru1ncD+dwhWveDl78ZFbL31TaIy42bif97/5y5fN1HGxDBZ1Ij8Sbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731400889; c=relaxed/simple;
	bh=jHB4s4LU9ACDx6xSxG22pBcvKm47MTKyQ0AxNKkKFL4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Wk3I+nklJYGVA/bGewtoFYzR2iXdZGPJvIoL0VcCCYAXQBifFW/O4ViCbOPbpJC5xQu/eIVPOC+i3lmCX+d2xb1NJ2fA3UKC9oUEMc3fxieCUk2Lv4/a5rsjnMO9A4fgPeGWv/yEyPmPI6eyQ/ks8WVAnmJ+IdFpEB5f2KyY5dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=kJgWanSt; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="kJgWanSt"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37f52925fc8so3500629f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 12 Nov 2024 00:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731400884; x=1732005684; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=eG2XhW9x/O5qAHARRVzbECFvOW6UZdHty+Mkfwr+2ps=;
        b=kJgWanStG8ZOtBGUQ5GNoVLrXeYsSSO9o7odW2ISInzQZ/wWZLnd0dAlpUDES73VjW
         OW4Vm+5pbsAmUdItk/z2ipTEbXLrGZYxprEmjRGuY/pA02Qrn0yXK8AJ3lHOwqgpqswl
         ibRh0TLGLzf8XFqGovi1uvqPmgpJek2tAAGi26M5sD1Xcw8Ip58mU55/WfB42NKvrsDV
         N0EgvcfwWJPAGQH+CZtxBD91qP55lev4ZarVqCUH5EXY/IKka8msK1EwHtIvYnMre9uX
         cJmuwnFdYIlqNODzwE2563VOh8rbN5Mzirf3QBlFylGmrJccOZbKwqEiIOCHsNgJ1tZG
         Xx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731400884; x=1732005684;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eG2XhW9x/O5qAHARRVzbECFvOW6UZdHty+Mkfwr+2ps=;
        b=u5ZZRiK3kwYzPmpNahkUNanT+xq4HX6N2hNa7zpf8eq0YKf+GTbK0UkR99bDGv2nX+
         xosgPI6Z0HrpyvkJWU10y+/UTmTfCCbGGTTAOfA8yQ4mjQas1wA3b2HDHP7z8y0LWejt
         9xpb3ztXiq2aBH23L2PVrsPhqjWUOOw8x3QT9SM4tLTxOIqBpoRwBvqkjGXroePm3I1f
         t1TL7NXBH1leJ2HELSZ+brU3d/4xz7Lc/Rm8FsxWi1LlsXaApxxeYuc45ZIk2Y/9pZot
         u0l5IO54/6hCjBwbjZ361pEg9hyJPc/NVzvB5kYZ1Ta//T5m2fvrR9jA6htMq9mq3V8x
         ymNA==
X-Forwarded-Encrypted: i=1; AJvYcCXQg2OJUJ+9nnfqNCvkFoMIPbtvHqYM5mt/iuqGDC4ln1MNNFiiAmIAL5TTaoEYTM7pZgnqr8OOQAw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwP7eOXkFRhypDJsl7u6trPY4pElen4IguuwNNJJnMu9o4oXS6a
	njZZsymy4/IY0hu+f4k9ZR0J0U9qY9wy2kAyXjgzcDIPz5hqvIStmBAfYXaRa1uTe1993GXdnYj
	m
X-Google-Smtp-Source: AGHT+IGUE8SBMbLKPxMonN/2CkAeXqXMHELhWYBo6IiWeJEKGp9mNtG5Y4mRS+LvxuwyDgdxXSaWxQ==
X-Received: by 2002:a05:6000:2aa:b0:381:eba9:fa75 with SMTP id ffacd0b85a97d-381f1866fc7mr12542783f8f.20.1731400884519;
        Tue, 12 Nov 2024 00:41:24 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:50f9:1df6:c2b9:a468])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed9f8827sm15169457f8f.72.2024.11.12.00.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 00:41:24 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin
 Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] clk: Fix the CLK_IGNORE_UNUSED failure issue
In-Reply-To: <20241111-fix_glitch_free-v2-1-0099fd9ad3e5@amlogic.com> (Chuan
	Liu via's message of "Mon, 11 Nov 2024 11:37:01 +0800")
References: <20241111-fix_glitch_free-v2-0-0099fd9ad3e5@amlogic.com>
	<20241111-fix_glitch_free-v2-1-0099fd9ad3e5@amlogic.com>
Date: Tue, 12 Nov 2024 09:41:23 +0100
Message-ID: <1jv7ws26a4.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon 11 Nov 2024 at 11:37, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:

> From: Chuan Liu <chuan.liu@amlogic.com>
>
> When the clk_disable_unused_subtree() function disables an unused clock,
> if CLK_OPS_PARENT_ENABLE is configured on the clock,
> clk_core_prepare_enable() and clk_core_disable_unprepare() are called
> directly, and these two functions do not determine CLK_IGNORE_UNUSED,
> This causes the clock to be disabled even if CLK_IGNORE_UNUSED is
> configured when clk_core_disable_unprepare() is called.
>
> Two new functions clk_disable_unprepare_unused() and
> clk_prepare_enable_unused() are added to resolve the preceding
> situation. The CLK_IGNORE_UNUSED judgment logic is added to these two
> functions. To prevent clock configuration CLK_IGNORE_UNUSED from
> possible failure.
>
> Fixes: a4b3518d146f ("clk: core: support clocks which requires parents
> enable (part 1)")

Still don't think a storing the ignored state is necessary, same as v1.

> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  drivers/clk/clk.c | 67 +++++++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 65 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index d02451f951cf..6def76c30ce6 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -94,6 +94,7 @@ struct clk_core {
>  	struct hlist_node	debug_node;
>  #endif
>  	struct kref		ref;
> +	bool			ignore_enabled;
>  };
>  
>  #define CREATE_TRACE_POINTS
> @@ -1479,6 +1480,68 @@ static void __init clk_unprepare_unused_subtree(struct clk_core *core)
>  	}
>  }
>  
> +static void __init clk_disable_unprepare_unused(struct clk_core *core)
> +{
> +	unsigned long flags;
> +
> +	lockdep_assert_held(&prepare_lock);
> +
> +	if (!core)
> +		return;
> +
> +	if ((core->enable_count == 0) && core->ops->disable &&
> +	    !core->ignore_enabled) {
> +		flags = clk_enable_lock();
> +		core->ops->disable(core->hw);
> +		clk_enable_unlock(flags);
> +	}
> +
> +	if ((core->prepare_count == 0) && core->ops->unprepare &&
> +	    !core->ignore_enabled)
> +		core->ops->unprepare(core->hw);
> +
> +	core->ignore_enabled = false;
> +
> +	clk_disable_unprepare_unused(core->parent);
> +}
> +
> +static int __init clk_prepare_enable_unused(struct clk_core *core)
> +{
> +	int ret = 0;
> +	unsigned long flags;
> +
> +	lockdep_assert_held(&prepare_lock);
> +
> +	if (!core)
> +		return 0;
> +
> +	ret = clk_prepare_enable_unused(core->parent);
> +	if (ret)
> +		return ret;
> +
> +	if ((core->flags & CLK_IGNORE_UNUSED) && clk_core_is_enabled(core))
> +		core->ignore_enabled = true;
> +
> +	if ((core->prepare_count == 0) && core->ops->prepare) {
> +		ret = core->ops->prepare(core->hw);
> +		if (ret)
> +			goto disable_unprepare;
> +	}
> +
> +	if ((core->enable_count == 0) && core->ops->enable) {
> +		flags = clk_enable_lock();
> +		ret = core->ops->enable(core->hw);
> +		clk_enable_unlock(flags);
> +		if (ret)
> +			goto disable_unprepare;
> +	}
> +
> +	return 0;
> +disable_unprepare:
> +	clk_disable_unprepare_unused(core->parent);
> +	return ret;
> +}
> +
>  static void __init clk_disable_unused_subtree(struct clk_core *core)
>  {
>  	struct clk_core *child;
> @@ -1490,7 +1553,7 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
>  		clk_disable_unused_subtree(child);
>  
>  	if (core->flags & CLK_OPS_PARENT_ENABLE)
> -		clk_core_prepare_enable(core->parent);
> +		clk_prepare_enable_unused(core->parent);
>  
>  	flags = clk_enable_lock();
>  
> @@ -1517,7 +1580,7 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
>  unlock_out:
>  	clk_enable_unlock(flags);
>  	if (core->flags & CLK_OPS_PARENT_ENABLE)
> -		clk_core_disable_unprepare(core->parent);
> +		clk_disable_unprepare_unused(core->parent);
>  }
>  
>  static bool clk_ignore_unused __initdata;

-- 
Jerome
