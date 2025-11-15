Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139EA482EB
	for <linux-clk@vger.kernel.org>; Sat, 15 Nov 2025 00:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763166470; cv=none; b=VxxXluaiqgaubgwiipROnSgOOIfA2ba0RxrFGZUDjV+WVdUW+9tw5eUnSOaR6J/ZWgzMH2goUgFz5yb3WFgwOOf+7oRbzoovxI26WFfy01k4Szb/acpzJzuqVSI6ZtA/7fhVUcqoUUqZHZ2Os9X/XXyuV2v3KwvxZjiWj5KkWCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763166470; c=relaxed/simple;
	bh=uER09aGCjpQzKFxlMGMrHTeaHFx85Z6h+DKHQBAXj14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rP781uHTBcFjSSvbTwKudO/gtEELLowbkFN6HbXnhxYACuQhscWWg9OYme94LH/LbQb+YvByvMmggMo2ibCUDbBO9wA9k4qZ4haDWBt+/Iz38d8kACxBgwqfvng4nlhzsbMaSFcJM9+elcjJ9bFpOtFGxeePsA9T4HrRi+VfmzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F6P/x9aC; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=IZLNVFLx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F6P/x9aC";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="IZLNVFLx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763166468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MY79eneNfrMG9dz4hIdkivq1gZvCTrtfj5tzDev1p4M=;
	b=F6P/x9aCvDfl6GcuUO7XUBHxvBrAibq0xTTIi3MlvdauPMmV5/mNMdGsgv8YuQ/e/qLajD
	J4mU349AewLwzU8iTgREZBE5gZ1Vf5MyW6nAHYTMBL2sp9UpkMW9EMpLy3AM9qyJeTQNH5
	rzFl4+kY5DyXb4qUf6/Q7QMRXfUCd60=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-Q6vGPZwpOSCRGOxv81t9Sw-1; Fri, 14 Nov 2025 19:27:46 -0500
X-MC-Unique: Q6vGPZwpOSCRGOxv81t9Sw-1
X-Mimecast-MFC-AGG-ID: Q6vGPZwpOSCRGOxv81t9Sw_1763166466
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8805c2acd64so78804656d6.3
        for <linux-clk@vger.kernel.org>; Fri, 14 Nov 2025 16:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1763166466; x=1763771266; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MY79eneNfrMG9dz4hIdkivq1gZvCTrtfj5tzDev1p4M=;
        b=IZLNVFLxTNRHjrxDuwi6yKI7DevvCO42BesKctrV4zRCOqARpTazmqhiOooCStg/2k
         laHNkQXfBaGfytDZG8YjkOGHCmBToGiW1WIgWl/JiWXflbXyizpKXvKR2+rYBnDjSHav
         iEivyj70+BsINh5+b4qbSz37pSQf6ikPe8EDNKlHDWJQtseMtuyKyTeBQKDP9VqgMybY
         jLR0ZuGnSQ2SN8R24Evesbq4zznl8GRRvn4/qa6VItr6tOzoM388JreUn6L3VlLl0bnM
         bQpKr6ZWGDvegIfFzQe7coo/OEJUjA/XFPfoI+N+kleyvKa4YbWUoZ/bireWNCkHYc4i
         qvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763166466; x=1763771266;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MY79eneNfrMG9dz4hIdkivq1gZvCTrtfj5tzDev1p4M=;
        b=Wfr5KPMFGSdrm1XoQ9ZJgGAFAne7+UUHFzMrVlJrIWZUchief3TLu56CfxHtbshZW9
         Ugx3DjG1jNqBw3pQoxVkwaYR3DwtWZmuk5Vu555KFDjFof+84enE4qMYplRUdrcRfy5p
         P8ZBYC8qOxmuSsx0kGIimpaASYFDQEDZdaNNcMRdkiqw/zFF0Cl2yMGNCplXN/YGgUJU
         6M6l+zsOqKlJMCJ0dKNX0pPAEIKX1Kwf9gvUKBadI+/RA/YKepn556t1oDMPYlS0yXNO
         DycEp6/sjlL2JGbIbhh6U///VgS2/sqjvIUPLFrBmQoo0f1fQB/ykZl5rbUPYmqN8p89
         Na0g==
X-Gm-Message-State: AOJu0YwC/ug7QYe86GdCBlFGJhuF5aKukvlQSf8SaR0j+mnjsPLxTez5
	pB2DDas6r1O7Ox9l1LTN/86Cd96Myw/arcLWd6XFl/WWWtCFtMgprqhEirkwVoB11uP2C73NPYX
	bp3JvVbqYPv+au/m0bFuh0a1vrfwy2i4HVqk9VgBMMhargtICwIDu9N16gBRYoA==
X-Gm-Gg: ASbGncuYzEtv1hixMAUCouAuR8z9s9S3bg5d7cICURuEkujFfqXM5hZIiy4tEhC5SKM
	xNy+S1i4IsysnT+MdBeh6N6cMx57Wsn8kavAYE40pLsMMNA67YRHkRXIi4A6hIIwrftPrw3nj79
	QB1gO+1N8cJU63ujTciRZwQJuqXB6dNgtA7OO9eGm7WY2M1EcScjssk4f7bHbmug33RqZttSvsQ
	Hgb6eHpr9FhI9XOd89GOcCIK2vTD+P6brm+C6f69L278p0pwjP2HGoUjxuvg++LuX91p3Jvd5S3
	79DwDRPNocXSjUvrjTCySEEXVPkKhJNrXU9MzrfDvpQYBbSxpQHOIl64UbrVxbSe4SRAGfZ0Kbe
	JU+JqrDfbSzi2AUlXTynxem3o++vhPzQk2dVaHd2gLk/I
X-Received: by 2002:a05:6214:5014:b0:882:4be6:9ab9 with SMTP id 6a1803df08f44-88292705010mr65042346d6.54.1763166466367;
        Fri, 14 Nov 2025 16:27:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGraWChEBaQ8Kt2DRqLdXdplufLvs8tWzEMELdXUg1GXFx2RN4xE4J+31DR8rAVpI9IzMPVUw==
X-Received: by 2002:a05:6214:5014:b0:882:4be6:9ab9 with SMTP id 6a1803df08f44-88292705010mr65042096d6.54.1763166466020;
        Fri, 14 Nov 2025 16:27:46 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8828659e0fcsm41781696d6.53.2025.11.14.16.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 16:27:45 -0800 (PST)
Date: Fri, 14 Nov 2025 19:27:43 -0500
From: Brian Masney <bmasney@redhat.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>, Stephen Boyd <sboyd@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH RESEND v2 0/9] phy: convert from clk round_rate() to
 determine_rate()
Message-ID: <aRfI_xT680E7Cf-o@redhat.com>
References: <20251106-phy-clk-route-rate-v2-resend-v1-0-e2058963bfb1@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-phy-clk-route-rate-v2-resend-v1-0-e2058963bfb1@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Vinod,

On Thu, Nov 06, 2025 at 06:25:46PM -0500, Brian Masney wrote:
> This is a resend of my previous v2 series since I haven't receieved any
> feedback.
> 
> https://lore.kernel.org/linux-phy/20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com/T/
> 
> I'm hoping to get this merged for v6.19 so that I can remove the
> round_rate() clk op from the clk core for v6.20. The clk maintainer
> (Stephen) mentioned this work in his last pull to Linus:
> 
> https://lore.kernel.org/linux-clk/20251007051720.11386-1-sboyd@kernel.org/

Can you please take a look at this series since rc6 is this weekend? I
have almost 200 patches merged in other subsystems across the kernel
for this work since the Summer, and this series to drivers/phy is the
last one remaining that's blocking me from posting what I have to
remove the round_rate member from the clk core.

Thanks,

Brian

