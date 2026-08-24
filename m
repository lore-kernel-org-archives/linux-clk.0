Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538B83672A0
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 15:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584965; cv=none; b=TROqjoHZtJelNy954rLldL6k+fCBY+w9ijlQ4vp105nfK+bXli07V+dOA0RHAjUkIsirSD/eriW7JwVZxR9JWnnn68ck4zHdcSrUv658s/kyxQC91RYQAbF5RaA7Ms2sWO+BosdbC9ItC3Um4IL3yRc1GeQzV+qvmHmwoP+Ho94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584965; c=relaxed/simple;
	bh=BgxHo+ySNt0SDscvHDIJ+CWLjsPpMmXNfeGCoW3Rr/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FF5TaTlujFs3ETU41sgcCJ8HFtFnyINOeJD08vrY7gGVjg85n5sLL24hsJoxKBn4haVzNGHzNceoVFBLllHBAdlUigmDwXf3R7Wu+73c/+sWwj5NMwTY2xyFJa/P7T/XBWA3nWrucYLJQ66ObWMQbhvwr+KHtydtjrTiRUhHsDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PWoTh4NC; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=cF1FXtCq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PWoTh4NC";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="cF1FXtCq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787584963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+MIjWVFV9tiFSCvKJHotyKhr1YJnlwFE+nvcQBHjOak=;
	b=PWoTh4NCCQDh60Fb61GBo+U5yQ7YjoTH2HzOwhWHXv12sHvSm9iTt+tbJM7jw71JUbmB2P
	nM1iVum6uwdnwrAIy5zXN0dWzTd2V4Vj49MmSuVxMN+kWDsJEJT3c4/Cy8MxRty+t3eMA1
	72J7PWPVxYY9i0e73GKAKDVnpISw75U=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-E6tOrTu-OY2-9oQvAOR40w-1; Mon, 24 Aug 2026 11:22:42 -0400
X-MC-Unique: E6tOrTu-OY2-9oQvAOR40w-1
X-Mimecast-MFC-AGG-ID: E6tOrTu-OY2-9oQvAOR40w_1787584962
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8eac2620cb0so37935156d6.3
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 08:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787584962; x=1788189762; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+MIjWVFV9tiFSCvKJHotyKhr1YJnlwFE+nvcQBHjOak=;
        b=cF1FXtCqelP/0bBxbHfH1NCn3UzE9544X/c1M0XYSr/QWEjt5vla0YJPF8FtQFgap9
         j1jKxnOILUBvT37dtgiE56q2Wn69HXG4w+4jrX9kjq/tUJ+8AdZTgfwzVTvktNYPKnVT
         uApA0A2xuXPksaX99HxQFuBoOdMunf1grKuBgpLNAJiuThMr4TglxOh6AedYTg5J2V9k
         FbIodL3pDi87tkoPDGQZHGyX3DAaJ4A3is/pO7hOog+0mu8i4zCHehmVHgnx42efWaJI
         ZTl8wyVFT+nDQf5SQTqGZwXVg0+MjzEThX8M01S41wlpwBpRSukG5IclH+jXs+82Qyf3
         q+Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584962; x=1788189762;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+MIjWVFV9tiFSCvKJHotyKhr1YJnlwFE+nvcQBHjOak=;
        b=WRxBGiQ1JB5Pi7uwIgA4O2BP9P4u1+gi8DB1vfqdRSDdBfFbKk394thGvdMRFiQRJS
         Gbf4uI/shyAUai2UDOuoEPl5KMpO9A5p/w+e+hgctHAEWb22uR8tclfr+5m2c020tiT4
         UlVNmkOchCR1rYP2AHYxTWdHPwVtqN2zLj38qFzV0TO9VSYElwuh9QRySz9N39tTEw9S
         ZCHY+eGWxreHL54W+/fJ2UVDgXzqVja8dRj20uQ7H/HREKsKtVHRp0pSYZjprsn0vf93
         HX7886XvU2bS10Rh7NkHUEtMw6qcqhvXFM/0voKBdFPMr1mke4Ob9KUUCWPdW1Ib+Ym2
         xJCw==
X-Forwarded-Encrypted: i=1; AHgh+Rrdy09AoY6f4txDA9WC2MliQvUgQSZgQ4yiU2/Bgo4IJ3zzIlr2UBqYYfWEzCSpWjrs02xyI1OXWFA=@vger.kernel.org
X-Gm-Message-State: AFuF++n6yjDE0UCHWUX9WyZo3slJH4s74nXi0ZmWQ69sS9HppsqQdxYv
	ICZ9BrINlC+OsNXLjvM8g0YJGppvBuvKVsjsLFQKTnSGxzEigoThqfsk4Z5qp7gnThGfh5fTvLe
	Ajiexd9hJ7DAUQYVALIMWonuPK06BD3Mxh2ho2Wf0cO0QcfX97rPFbzPQoU3ikA==
X-Gm-Gg: AR+sD12W+l8RFInBIgQx/55Gd+LIvcaumacJ0mjXa6Rbfe6EdgtK1c3u7VGAgyL5bYj
	vpC+8muhHwqXH5Jw0j+sEHG4Ih0wYOv+gVS2oz/yn1O5tqfTn2MFhbiG5ubbLAlNeJJUnvXcgID
	Ul5Wz3h9evApXRYe/cvZkGVxfhcde3Nj7742DKfQ3l8AB+WFFz4dRQmjJ4K0g8kRf8h1K8Ax5ZU
	mo3mm6I9yjx9GfePOuNn3y8Cq1GaMycfpNwIKGVPMnYdtoHUl+zzw7eCUZigVBXeCaD58dnjxAy
	I03xAiRlqdG3HgzYQO7/Sg2Cb6K8/AIlsladnSzZijZPbVlzKOBXOmPxFF7hMtg6gnoc8FjbHNf
	B7A1yupiLmxd5DtKeVZfti8+QMTIqcrG9OyM=
X-Received: by 2002:a05:6214:4113:b0:8df:98e0:4594 with SMTP id 6a1803df08f44-90c80c5c09fmr261569026d6.15.1787584961622;
        Mon, 24 Aug 2026 08:22:41 -0700 (PDT)
X-Received: by 2002:a05:6214:4113:b0:8df:98e0:4594 with SMTP id 6a1803df08f44-90c80c5c09fmr261568266d6.15.1787584961110;
        Mon, 24 Aug 2026 08:22:41 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c9393202esm65746196d6.27.2026.08.24.08.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:22:40 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:22:39 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ulf Hansson <ulfh@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Michal Simek <michal.simek@amd.com>,
	Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] mmc: sdhci-of-arasan: Make sure clk_init_data is
 fully initialized
Message-ID: <aoxhvzXB_Cn2vExX@redhat.com>
References: <cover.1787240090.git.geert+renesas@glider.be>
 <0235d3a3d5b71a125eeff6d7be25ddaec80ce539.1787240090.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0235d3a3d5b71a125eeff6d7be25ddaec80ce539.1787240090.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Fri, Aug 21, 2026 at 12:06:04PM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>

