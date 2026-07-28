Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97D242AF95
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 13:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785244211; cv=none; b=Z+C4XbIfGucdvQP0CgSHJafIZ5V7pSPVpUWXJtXFtwylADygVC5lH36uw19wS4xLMHGXbRCitelDj63aqJjJ+56V6GQSLXQO8d7NkN6CPYFqzYFTIszDauxQ7tVGc2TExX/tq8VFoiQuRNIPzoZ11l3L1pxp4XOFPDIGnWwgk9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785244211; c=relaxed/simple;
	bh=U+tfHN98ncg01sZri9VJ7wQMLRSk81hMN/6Uv1K769k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L2ZMm9NzcJ9ng1mkS1YC7/a0B61ahkfRLhjKMWC0i3US2hDAFUHuTg/O1fTyGvRy44cZ76M07ZSLtm10qmJ7luaQaidLCduw2t38yUnB+fXRGvCrdOzaAAGHQIQFEhUR1CKNoyDRki8NO64r9ju8kY3roWGjpXUGdqhm86jV4t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iGFsRMvp; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=p0p22kzA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iGFsRMvp";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="p0p22kzA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785244208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vxbqXLAunmT2qGsW55SMRVrOQZR4H5ggveSMTVA7VUM=;
	b=iGFsRMvpJZAlooHC1kvifPbLYQV/8DOBqDFH5Iuu8EaCfl4aAiZIl04+nV2Dizo1DakxZo
	C7xr3o+6A09+kFwEId/WCxc7Bj5Brdp75+PuDwzZAulA76QM9SgzN3URW65VKjfP0BgnI0
	Z/CIlCldvJe2xzFt3K550RjvSrp2tuc=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-WprB-DI2Poa03ObgV643lQ-1; Tue, 28 Jul 2026 09:10:07 -0400
X-MC-Unique: WprB-DI2Poa03ObgV643lQ-1
X-Mimecast-MFC-AGG-ID: WprB-DI2Poa03ObgV643lQ_1785244207
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e55721a8cso460445385a.1
        for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 06:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785244207; x=1785849007; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vxbqXLAunmT2qGsW55SMRVrOQZR4H5ggveSMTVA7VUM=;
        b=p0p22kzArOn2T8sq6ks/AGowrPuUBT7HpW2XNFLjdvA5si2g0Wq8HJhmYsNIgOWLGS
         FRzVg5AbanEFCpcwnP3AjOCvpMQTzPyOEJRjPbH/rsIegZegtAgIZdzYTN0D94hdCoqf
         5Ou3S5v1B5S5HEW9CfqXZf5fm04x+G2ePGoeXHSTH7PJIBFrxu6yHbHv3bn1z050Hlor
         eEYGzQ8BSAXgoIuyYiakK4DRqq7KAEYkoDNc+ZNbhcBPHb2D+US+ljjfOzXA8lW6MU6V
         3zeyJLe6N1cYu3YEia9nBr7k/ePbf+b4YvCehNsFBZnzXbtzTRYRn4uf9126EIszJkob
         wmqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785244207; x=1785849007;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vxbqXLAunmT2qGsW55SMRVrOQZR4H5ggveSMTVA7VUM=;
        b=Xqfv+mGGPviYa9NbtkYlbnrMAk4qh0WPJRBU3/Cblvsl3/AoEoJxkr3lIwVv6FH8KS
         2ct/4n+vEX87UXZyQcCba2nFJ2PhZPRdqjVYWrNhZSBCwVYBLCBXKAf9zztu6mRDdQF6
         IygUQ93aVhskEfGqfpqyegkJBaqNJkjEg8W5qs6eCbPJFFae91ClpABIE1NSPoIsinYp
         fB+DO80ZeZPrHy1Ju5PBBwPRx1TthWnr4lsu5rVG96srgz9VMl2Pi0TYvxQFkY8u0YYt
         gQR70JMAP1mducjH2njJFahSnxRrpqqPdBk7+dAAMcUA1QwbCrp6IZARLbPqYh/iGM5B
         oBmA==
X-Forwarded-Encrypted: i=1; AHgh+Rqcb2OVXAK+eYK768zo5gKBrd7PSmyUBmmlfrGdlP3ej0DHA8r3rMYUv0SshKWZJPUAcioHh7Pmmq0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjkOfRcjajcxLHy5WN/pjPGnR5/aKXEmrInFEUzfnrOiZdhTDV
	lF1hZrwIfU5pIka8GvVUwn42KNZ4BVLbEC2VBDTQfy6ZLw7dqx5N23v5+l6EW/EJOvcdw9mZSI6
	9H/eZJeyFkOl2b4Yk01Uxd56aYI7BqwmM2tilBu/UJDLLtiLdx/Qm5HlCB1IBKA==
X-Gm-Gg: AR+sD10/Fi/xF1aGdLTsNSpAfEMBYGRoLf53safLVEQLtukfQHiTmjZiVyANUQjfR0m
	QocZ21G3HxWLkZDMhuEd5YADrx7hB5UoYDZT1e/Ix3ijoDqYpURI4jVc+hmWmu9XyFdSZFAUTRT
	5WP9/XX/fFlaRntz6vCgqGTlvyTm9SnSO/y3JEJucjxzIqDJGnJ+6iKaQVoYG47LYjoczX/TG07
	SxAr/GPgPKLGErpMuEesmVrZ8E6rDpx90nSZwjFzqBnoKpJbsNC1CjM8/1A1i2A8lrGBOOJIb1e
	caW52ZqO/v8R5+Tzf+eRGpd7P6UBNRb5IBQbehvgPonTgWKLVnpmm9YCZ4V3SRTh1XK6QSCO8c4
	kS33Twa+u3ocCT85bSfrW5xTypfvpKm1H8Ik=
X-Received: by 2002:a05:620a:4446:b0:92e:7a3c:add7 with SMTP id af79cd13be357-933025a4606mr215983885a.27.1785244206146;
        Tue, 28 Jul 2026 06:10:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4446:b0:92e:7a3c:add7 with SMTP id af79cd13be357-933025a4606mr215965785a.27.1785244204887;
        Tue, 28 Jul 2026 06:10:04 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-932de635f6csm831797885a.26.2026.07.28.06.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 06:10:03 -0700 (PDT)
Date: Tue, 28 Jul 2026 09:10:01 -0400
From: Brian Masney <bmasney@redhat.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	YoungJoon Lee <getfeus@gmail.com>
Subject: Re: [PATCH v4 0/5] powervr: MT8173 GPU support
Message-ID: <amiqKRkFItYwD6oL@redhat.com>
References: <20260728091804.382753-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728091804.382753-1-wenst@chromium.org>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Chen-Yu,

On Tue, Jul 28, 2026 at 05:17:58PM +0800, Chen-Yu Tsai wrote:
> Hi everyone,
> 
> This is v4 of my MT8173 PowerVR GPU support series.
> 
> This time around Mesa was ready for basic testing, using both vulkanmark
> and glmark2-es2-drm (with Zink). Details below.
> 
> Changes since v3 (all in the clk driver patch):
> - Changed pm_runtime_put() to pm_runtime_put_sync()
> - Added missing of_node_put() in remove function
> 
> Changes since v2 (all in the clk driver patch):
> - Made COMMON_CLK_MT8173_MFGTOP depend on PM
>   - Needed since the driver implements PM domains using the generic PM
>     domain library, which also depends on PM
>   - Fixes build breakage (kernel test robot)
> - Fixed "RST_DELAY_CNT" name (Brian)
> - Dropped unused mfg_desc (Brian)
> - Added check of clk_prepare_enable()'s return value in
>   clk_mt8173_mfgtop_power_on() (Brian)
> - Saved error value for return in IS_ERR(data->clk_26m) branch
>   (Dan Carpenter / kernel test robot w/ smatch)
> 
> Changes since v1:
> - Adapted to changed DT bindings
> - Dropped driver change
> - Use same power domain for "a" and "b" GPU power domains
> 
> 
> This series enables the PowerVR GPU found in the MT8173 SoC, found in
> some Chromebooks.

I'm making a pull for Stephen for the clk changes. Should patches 1,2,4
go through the clk tree? Patches 3,5 go through the DRM tree?

Brian

