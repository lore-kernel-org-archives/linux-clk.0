Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8D1261B70
	for <linux-clk@vger.kernel.org>; Sun, 14 Sep 2025 12:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757851722; cv=none; b=Gtmsg1uQASwRT1E7EoYXskOuyvBoaHg18TCRbBdMFHL7MvglmYNf31ovmsu9VYrPygLnG5p6ci1c2PbyceC71HpaVA0yZU+ClCDFQllmC5Pyhle7O05XPJiaVo54yR2QVD7JqX0yIj9b4bPfG61tmvI8tcui6W58Fpp81oIvqlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757851722; c=relaxed/simple;
	bh=/vAVhu/ngR4yHd05XqGLRzyRf/JzOKMB5L/10fK0Kk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QivdxamIqZXfPEcZAl4DBoy4jbQ91Z/KQeVJ0unjgHe/h33bVOW49T86jPGrdF4CcnmK10koWhOkzcJUJyX3icrdhNcR5JyU9LoSJUd6qGE3eiQNZPXxJieO9P7doeAzFeVsOx7h171j4Ive1RWXYvJqo70jFTlVdRQEIN5SmmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FUeAnkDJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FUeAnkDJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757851720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TGC4WoAJlpX9tdCXckzAZr5W3saj1ZSsINit3PsYuzA=;
	b=FUeAnkDJW2mk8y1fOisF489Z0IOpfqgbpu9XulN49RNI288zmCFbSBfrEfRjRpKAZ5tK44
	7S/gQlysYWIHns+MG2wcxt9+q3ixxGadaflWsIYiKMs7qVeMvsM0b8LrcdYK46TWPA8Mgn
	GU8DJINiIk3yZCr1VyN3F7dsLXU/Lvs=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-381-BkWmWpZlOKCzfQO2Xnqr_w-1; Sun, 14 Sep 2025 08:08:38 -0400
X-MC-Unique: BkWmWpZlOKCzfQO2Xnqr_w-1
X-Mimecast-MFC-AGG-ID: BkWmWpZlOKCzfQO2Xnqr_w_1757851718
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-828bd08624aso119249385a.1
        for <linux-clk@vger.kernel.org>; Sun, 14 Sep 2025 05:08:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757851718; x=1758456518;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TGC4WoAJlpX9tdCXckzAZr5W3saj1ZSsINit3PsYuzA=;
        b=VL8IY8FDFUXy6FQL1jiNrRTU/ZfJi1X6YAwagX1ZvmrPwTi3k47puc3XufaXqFha2n
         jJbIc4+smvZjBFWKuZ+/aa+RZxSm4qfEhJCpUmUOcUjBPm6Wx8LOpOiIr8pEA9Q+ZnsC
         Wy21WqLh8MjkIq6d5//CP/TewrFNSIrUfbtaopCoL+uwPGarbgXrflFSqAprbi+OYtAh
         wiTt+gl326Cozjg8eUV5a9VC3w3MXaI7RDS9gskb+CPefzUdWHsUCvBUaxiiyG18W4d7
         tARsW9hEsomajitFwIGmNT7Ss8r+gi6sxDEi5VWbMItjL9TSOFiuqJ/mIz7YfHcf+vLD
         8Uew==
X-Gm-Message-State: AOJu0YzeD9CHxRp4iBXGAgjcKlm1XD4+Az4Kw4zvzhPYWGLfwxF47k1J
	QSRfxRSg8sjPJfrb4QwnhfpjX5SY5WolhBy22yUERvSCgVsEZy4ObmosUB889x/SvPX/7qIWEBi
	ItGYSZQeiSOUtYwa91VEtwA5Kjijz9WOYM/L4jv2CYChXIPrmO/gpvmOmIhqYUA==
X-Gm-Gg: ASbGncslJeSlEWz+8tHe5t9dzc9X8zLQiTxM3qkc1WDADLsIvsPj7fcAaqq0mAm8h+y
	bm3RKGmbI6xOAgEgI4gEKVENRR/1jAvlZ+Q2OYcXGfVPlRmONQiTTGZAigIT3RIbxVDu05adN0J
	YTeLXmslj88Az35cBlT88ZNdYVaI65oKi5zK20EddQMXPz8WKgp5YRLCqZPN2V8KgA0BPikl5vs
	tmDeD4NYYkasDtHkzOYWU2t5FNxBDrdYqmFnhG/nTAzijYVwzhEKfQMokEZbeswzEmuBCeBMhMH
	cWDsIWNFklYJwpDCMNEYQ3+CqD2KjaJX3zZA6SgRTIF3dX43LK6LI1ZZoo1VqPaxGRcfQKkbwMM
	HuXFjXu432uI9oZpkzR/svTsISZOhITU=
X-Received: by 2002:a05:620a:c4f:b0:815:9bd3:72a4 with SMTP id af79cd13be357-82401a95c9bmr1036168585a.69.1757851718237;
        Sun, 14 Sep 2025 05:08:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRdCKGXPgtbhvJpUCdDwCaaC2B0DLna/CzbBAvfkLzYJU98qL9IvUSFcqawGBto49lPMPxgQ==
X-Received: by 2002:a05:620a:c4f:b0:815:9bd3:72a4 with SMTP id af79cd13be357-82401a95c9bmr1036164085a.69.1757851717778;
        Sun, 14 Sep 2025 05:08:37 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-820cfcaca15sm580413985a.71.2025.09.14.05.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 05:08:37 -0700 (PDT)
Date: Sun, 14 Sep 2025 08:08:33 -0400
From: Brian Masney <bmasney@redhat.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Philippe Cornu <philippe.cornu@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/9] drm: convert from clk round_rate() to
 determine_rate()
Message-ID: <aMawQYUIjPw9m4IO@redhat.com>
References: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi all,

On Mon, Aug 11, 2025 at 06:56:04AM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's go ahead and convert the
> drivers in the drm subsystem using the Coccinelle semantic patch
> posted below. I did a few minor cosmetic cleanups of the code in a
> few cases.
> 
> Changes since v1:
> - Drop space after the cast (Maxime)
> - Added various Acked-by and Reviewed-by tags

Would it be possible to get this picked up for v6.18? I'd like to remove
this API from drivers/clk in v6.19.

I'm not sure which tree(s) this should go through. All of the patches
except patch 1 have at least one Acked-by or Reviewed-by.

Thanks,

Brian

