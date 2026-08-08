Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E067C2853F3
	for <linux-clk@vger.kernel.org>; Sat,  8 Aug 2026 05:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786165455; cv=none; b=hGmiWsNP7w9fke071lPG3mXa66s+7f+W2rlXCDgBY/2s1K40BL2rGlE8XXao+QhMhVTev9kJKlhPTbiO3O5vm/RePNBeweWCYUyKdXg5QdOG9ZQQ/8eVxeZ5J44s7KpJeF7cZ2nvTmP++0DQH6UIYRKUgE0wgSEx03HlpMLbC6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786165455; c=relaxed/simple;
	bh=9ucFn8yjujP0VoUhtpH8rGna1HadIHc3Y9n01MXVHxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nTies2XMaQOaWqxW0P0lsweqvANLsNOFj55h3ipZG22aP/l++w0jjQkXFiqIro9aX30EauIykcPoAS7922vrCE9qtkMeSl+5jfRgR1XUm5W+07KlVMtWpeXkosfiryKvu/9WAGaWnB17R44WAiXS+uU/TYFuMt1Xo48eHMx665I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ie0nOM9o; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ie0nOM9o"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2caed617615so3022175ad.3
        for <linux-clk@vger.kernel.org>; Fri, 07 Aug 2026 22:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786165453; x=1786770253; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8uD24huWZm6XpJh9wT7WOr3BJsSLtwFgAarL6fJ9kQ4=;
        b=Ie0nOM9o/dW3jWg3YduBRJxgGPN5xEQ8Cm0XrIlaBIv0b5sJNWITi7u7HmbMtAZmzJ
         xsNf9/5fz3Ami7BDcTS3lnDmweuo5ajT7fFxuqwpeDKbw4U1AgFGXZorqR+8md3xYIfw
         EEhVsEXacOE3glEvLtFOMF5pbxsCt2UqfRTZBRPFPB6PBHJxv1XdLv4Bb33s1ivNlAdW
         tlAbHPqgGmoaRGq6RjmFXaJcXG4tAjF/Zd6u9q2YLKxgbn9/eoUksNYUtUhnQa5SIXLi
         2hH+8haraPeq3aFR9f0ArHUJXYReGapM7Tm7/3U07Rj4fau5QoNo7ZairtPjlGEKJ2NG
         3+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786165453; x=1786770253;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8uD24huWZm6XpJh9wT7WOr3BJsSLtwFgAarL6fJ9kQ4=;
        b=mGBvykx7AOKKE/2M0tn/03UWmDe+wpftrede0THPZtxRsDPCQkwp5kUojfUZKTCRoa
         lCwF8/+vibd8PepCaJFRj9tae/h7efQdejAYHS/OKhXSG1tdB5CYOxf+kkNvuIL1vhN5
         zQMlKgIi44iSb439eA+DE4l3BIup6ZhBj+nJCP3VYMFFAfU7kUhT5LFyfxMJp1MBJzp3
         Iskll4ZGYa5uzMdUcF6PjngsLkzmLXJ7bHolQv94Wi/xyHvmMSvJXbByCWjXEYu3A7By
         WRqRFKGz0LQ2PIDKrCl4u8bkxIkRseRNcEXOJO5xHDq81f39E9/8Zp0b5N8fM3rPrQ/u
         IHWA==
X-Forwarded-Encrypted: i=1; AHgh+RqrXIunVOE7A5RPw4BqvxPcxUhkctfFXwv3RUE9Sylb68F01uICpIT22q53KgqRxqoJ+hEj82L7yVI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQV0dQZChhF/R01RAbPcqyAUMdFkME3v7SZSF34vcUYNvEfsPK
	XhTQOvxK86Rai0WW0tm2DlUoAtJrHdqa7T5lQp/9CXe76bKPyucMujrp
X-Gm-Gg: AR+sD13W4Rf33Q2e4FAx0jdQkrxBmzrosUCQrPxP1V7UDdtBb+gjozxGMIqe7jmbTtA
	oK3IoB/4VjeQHGC4UZ0ZOSXp/xBi+k49bByd8c2yVFkvSICJmh0Oxy1ynCLucLkA0P2efU7AxmV
	Q9Dx0qcw2rlZdnfvY2uGgxs0Lq/WGSNO/xFmn7bgTrjDhxbYNKOR4gWfRHvle0Ly68LpMYPkuJx
	TH30SUmScJG5Vbqb24OIeXCKoRaa0UzOzwQNeoDlWmFeKR+u66CZcPoghHlwM6gSitluFcJxtoD
	HvsmoITeGN1jTRLNJsYb0o9TQ8OUsm0FB5RvDzYgNR1nCG5Q4Xh0p9WyO/qQAuhXkudu/33C83J
	5ceKi1LgjKR7wOa/7YfF95fk1NxHI4TdnpNTPqOYrKDZD5TDfLsWsER6LViBf8niXVgNqNiruQm
	PlIsrbJPQIKdKlEw+cnFGiY7FCVsosoVqD9A==
X-Received: by 2002:a17:903:fa5:b0:2c9:d8c6:1dc3 with SMTP id d9443c01a7336-2d0ca1611famr339026475ad.0.1786165453023;
        Fri, 07 Aug 2026 22:04:13 -0700 (PDT)
Received: from localhost ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14cce7830sm15452855ad.29.2026.08.07.22.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 22:04:12 -0700 (PDT)
Date: Sat, 8 Aug 2026 01:03:52 -0400
From: Guodong Xu <docular.xu@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: codykang.hk@gmail.com, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Haylen Chu <heylenay@4d2.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH RESEND 10/17] drm/spacemit: add Saturn DPU KMS pipeline
Message-ID: <wr3264hzlya6zep433nr3u2acukizilkrqpkj444kfqeyaeorj@2rc4zo2cqcer>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
 <20260725-k3-display-v1-10-6de34d80e86c@gmail.com>
 <084a860a77f18aaafcda4b223eec4fdcd96e75c9.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <084a860a77f18aaafcda4b223eec4fdcd96e75c9.camel@pengutronix.de>

On 2026-07-27 09:35, Philipp Zabel wrote:
>On Sa, 2026-07-25 at 00:51 -0400, Cody Kang via B4 Relay wrote:
>> From: Cody Kang <codykang.hk@gmail.com>
>>
>> Add the atomic KMS implementation on top of the hardware backend: one
>> CRTC and one primary plane per DPU instance. atomic_check validates
>> the plane rectangle 1:1 against the mode and sizes the per-channel FBC
>> line buffer; atomic commit builds the cmdlist batches, maps the
>> framebuffer through the DMMU and arms the cfg-ready handshake, with
>> vblank events driven from the DPU interrupt.
>>
>> Signed-off-by: Cody Kang <codykang.hk@gmail.com>
>> ---
>>  drivers/gpu/drm/spacemit/spacemit_crtc.c   | 815 +++++++++++++++++++++++++++++
>>  drivers/gpu/drm/spacemit/spacemit_planes.c | 376 +++++++++++++
>>  2 files changed, 1191 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/spacemit/spacemit_crtc.c b/drivers/gpu/drm/spacemit/spacemit_crtc.c
>> new file mode 100644
>> index 000000000000..b75ff6320501
>> --- /dev/null
>> +++ b/drivers/gpu/drm/spacemit/spacemit_crtc.c
>> @@ -0,0 +1,815 @@
>[...]
>> +/*
>> + * The assert and deassert orders are not mirror images: the hardware wants
>> + * these.
>> + */
>> +static void dpu_reset_assert(struct device *dev, const char *name,
>> +			     struct reset_control *rstc)
>> +{
>> +	int ret = reset_control_assert(rstc);
>> +
>> +	if (ret)
>> +		dev_warn(dev, "failed to assert %s reset: %d\n", name, ret);
>> +}
>> +
>> +static void dpu_reset_deassert(struct device *dev, const char *name,
>> +			       struct reset_control *rstc)
>> +{
>> +	int ret = reset_control_deassert(rstc);
>> +
>> +	if (ret)
>> +		dev_warn(dev, "failed to deassert %s reset: %d\n", name, ret);
>> +}
>> +
>> +static int dpu_pm_suspend(struct device *dev)
>> +{
>> +	struct spacemit_drm_private *priv = dev_get_drvdata(dev);
>> +	struct spacemit_crtc *a_crtc = priv->a_crtc;
>> +
>> +	/*
>> +	 * Assert before gating: a reset asserted into an already-gated block
>> +	 * has no clock edges to propagate on and leaves the register file
>> +	 * untouched.
>> +	 */
>> +	dpu_reset_assert(dev, "lcd", a_crtc->lcd_reset);
>> +	dpu_reset_assert(dev, "esc", a_crtc->esc_reset);
>> +	dpu_reset_assert(dev, "mclk", a_crtc->mclk_reset);
>
>It looks like these three are mirrored, and could be handled by
>reset_control_bulk_assert/deassert().
>
>> +	dpu_reset_assert(dev, "aclk", a_crtc->aclk_reset);
>> +	dpu_reset_assert(dev, "dsc", a_crtc->dsc_reset);

Is there a reason these two cannot be mirrored in order? Please double
check. As I checked the vendor tree, the suspend/resume side appear to be
copy/paste rather than a deliberate ordering.

Please double-check. Unless I'm missing something, I suggest to bulk them.

Thanks,
Guodong

>> +	usleep_range(10000, 20000);
>> +
>> +	if (a_crtc->core && a_crtc->core->disable_clk)
>> +		a_crtc->core->disable_clk(a_crtc);
>> +
>> +	return 0;
>> +}
>> +
>> +static int dpu_pm_resume(struct device *dev)
>> +{
>> +	struct spacemit_drm_private *priv = dev_get_drvdata(dev);
>> +	struct spacemit_crtc *a_crtc = priv->a_crtc;
>> +
>> +	dpu_reset_deassert(dev, "mclk", a_crtc->mclk_reset);
>> +	dpu_reset_deassert(dev, "esc", a_crtc->esc_reset);
>> +	dpu_reset_deassert(dev, "lcd", a_crtc->lcd_reset);
>> +	dpu_reset_deassert(dev, "aclk", a_crtc->aclk_reset);
>> +	dpu_reset_deassert(dev, "dsc", a_crtc->dsc_reset);
>> +
>> +	if (a_crtc->core && a_crtc->core->enable_clk)
>> +		a_crtc->core->enable_clk(a_crtc);
>> +
>> +	return 0;
>> +}
>
>regards
>Philipp
