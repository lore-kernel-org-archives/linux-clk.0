Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95E737F8C1
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 15:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787238592; cv=none; b=iAMD5mBdUg+l/mbTuJzi4/Wp4DSBeKgzArQFlTpUhPQ7tmTMhOSn5F9eFYOFzZ/tzIxs8cysVBa0TnnoGlh4nnAqYXawjct5XBbHI6Vh1N0rkELK5R+wgvZuy6KBKG7b76+hk1O1BRc0DCpf3R94TjIv70Yy2b4mqzgOmv/1EoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787238592; c=relaxed/simple;
	bh=Pf7JfpDwX4+Poty5IvXCho7jfNMVaUeGZfsawai3w+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WosIfA5a5TvMmlsPhS7rNg6BhMiTIWTzeuWoezh+Qq4Dgd4O6WMzzJZ1PcLr+EgOgHyjVkZgy6V+7CToPToWAzHkiTg2Usupx2L5JTtmkMbZNH1d3x0csmYXjAk3xpnfeps1zbbolp+zzB7NpYLECxbnNvV6hr+ZCNj+T/JvkQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KyxA8/Lt; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=T7GyKCD1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KyxA8/Lt";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="T7GyKCD1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787238586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bdrbfrFBNKxusVF2TTjyC1jQzKOXzXeYZT+7fde0g/o=;
	b=KyxA8/LtP1joS/ditvKolKC8etIMF8MtGXE2spklP3pkMB8mY5nPsVNpJmSsMTX7JMvHj/
	k+Rqh0B0VWwqQMc7qJKwWGhYWnBiVTdF683jGr9amViapWUNRaPhxFtn3wQev+z6rw+Aqg
	2S5xsVYLiKIqM++a5mLky+UmFAubXkk=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-178-NzxqomATMLapGCRLMgRqUQ-1; Thu, 20 Aug 2026 11:09:39 -0400
X-MC-Unique: NzxqomATMLapGCRLMgRqUQ-1
X-Mimecast-MFC-AGG-ID: NzxqomATMLapGCRLMgRqUQ_1787238579
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52d33c89a29so31692551cf.1
        for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 08:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787238579; x=1787843379; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bdrbfrFBNKxusVF2TTjyC1jQzKOXzXeYZT+7fde0g/o=;
        b=T7GyKCD1EoxTnpy+V4IyGNjGgW/ZSPS5AojIjuV6FoqS2XOvVO6b3vAoY1cVpdv0hq
         P/1OZQrz7augvoyWsJ1o9AxfYl3+dmVf3Gk+9BPD17hf59kvUbAF0kClpS9G1HtENysC
         SRQxtbFHsY53Wj4ah+RVdAs2thwZN1lTZ5pHv/Qs/ZFJYLb4DWeHjoti4TypnKoHbWw5
         YRAEcHW8eVdffOo83HK0nV7E+cv3TZAU5LC8ZIqckCkHwaPdLrOHB5PCnLX/d+oUIyk+
         +RKR6KWd4HJ7KlKXwu+xy65Gl7sNNV+ldCQDgAUYJE3D3YSRo+cMPZ3gLT4nBdo4r7O/
         90CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787238579; x=1787843379;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bdrbfrFBNKxusVF2TTjyC1jQzKOXzXeYZT+7fde0g/o=;
        b=pnyFUy6/cFLrpJEIMtKiWbHxUEolz3ZhogtRP9IKF4x/oyutI3xJUW0hI3HdnOQI1t
         WDsWa+aX7o4Q85KESxQju+cTlq3CnPIE9EUvArX7CCFov41ubH9gkFIQLk8gPavnGLNp
         XnX7iF93v7rT7cvPBKK/SI8LTv5Jt696KUDnPYsW2Ks/rUu8C8LYIu4//ZYGxSm3wrgh
         wUgXseFJHCpXuNUlaWWeD6Qn5grxKcWXHm33VjyCZWlZtcSTrLRDTyxmAs1YpqYQXdKO
         NClmYeQdrqM2KXcipbJ8iE4cYWAX+CK7WxJmrz5oADzFhEWP4YPpezjsTTJS5XbvTfV2
         BQOA==
X-Forwarded-Encrypted: i=1; AHgh+RoA2lOcxLD5eZIRgD82rIxf6odGQGpbl7p44m52vxLwqMNmuko/wU0g23bL+KH7VnXh3jB8mQx9JWY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAOF8E/coRUWDHvQJxtKlHDpI66agUW7B1EtHqBLnxjOjGUsxh
	9yCROG6tBMXjjBRGqjtaUucmv+rU/nsWGlSht5S3vcx53b4R05fwbzeP2InTT6JvjiTKJaFS7FK
	gHe5wGPIH0kToh/G6V7GXJ6C4hcpRHinFv6Tcl9LFIo3jZDkeP2qmgUZ+I0J8Ew==
X-Gm-Gg: AR+sD11niiWsK++nezRRIUlfFGdHB0i8wQhmkEgcELEh1YGX8ub1YuKpvc4V+rh9ev4
	UeYI2VAfd1cU1yOFGpdJiIGrsr6G8fWMujVZJVJA1fU4mkk0lp9b6fJKybCX3KAwmZ0qSy+N45T
	KFXFKGK8QNo2gHOYY5OrFDmf1DSAwdTkIQyedUQOHQYRMbYRrhLMR9cDuEZvisH3XDUzMdUSQE8
	peu6P75Up5+iYHAV6RpSdwM5xGzKvnM6LFOhIoT/FQa5q3K0ZdsLbz72jyN4aTBEqxdPfMFI1w3
	QgZQqaKZRIWdVZY0zS9TyTgBBW06RCa/Apfew6LUmDeMxWDJroEyDzcjN5+rTALoNfd1fX5XkLs
	pkQ91dzcy+u7z6lEFt4wbryF1fBO/oF6W3+A=
X-Received: by 2002:a05:622a:38f:b0:517:87bc:9b47 with SMTP id d75a77b69052e-52dd5e04d71mr123094581cf.39.1787238577659;
        Thu, 20 Aug 2026 08:09:37 -0700 (PDT)
X-Received: by 2002:a05:622a:38f:b0:517:87bc:9b47 with SMTP id d75a77b69052e-52dd5e04d71mr123093701cf.39.1787238577229;
        Thu, 20 Aug 2026 08:09:37 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5edb5196sm40682116d6.8.2026.08.20.08.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 08:09:36 -0700 (PDT)
Date: Thu, 20 Aug 2026 11:09:34 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux@analog.com,
	linux-iio@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iio: frequency: adf4377: Fully initialize
 clk_init_data and clk_parent_data
Message-ID: <aocYrlbsNqEzahky@redhat.com>
References: <ae48ed1dc6b1ad9e10cad0d9df28d9fab213f653.1787216909.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae48ed1dc6b1ad9e10cad0d9df28d9fab213f653.1787216909.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Thu, Aug 20, 2026 at 11:19:52AM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> adf4377_clk_register() fills in init.parent_data, and assumes that
> init.parent_names is NULL.  However, the latter is uninitialized, and
> thus may cause a crash.
> 
> Similarly, adf4377_clk_register() fills in only parent_data.fw_name,
> leaving other members of the clk_parent_data structure uninitialized.
> 
> Make sure all members are fully initialized, to fix such bugs, and to
> avoid future breakage when converting drivers to a different method for
> specifying the parents.
> 
> Fixes: 60e5448ddbec2dc2 ("iio: frequency: adf4377: add clk provider support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>

