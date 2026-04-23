Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B003935CB61
	for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 15:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776958629; cv=none; b=KQCu89bC2+++Zegy3VS0Zunk3rrH1cqqneRDbeixYLfzDL/LIt2NoNyNgz9ml5qDC16Iwmqby3t1D+4BTfoXW7+KDoyPhUKTAJyVbBRgTgVY5nM1eBDJrXlslh6bw3gS+GUzor4ndRPv8XDiSty4AXARqVabmVe9yarlLLrdy4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776958629; c=relaxed/simple;
	bh=FxeWSHojL9I2hjnDP74oJjigeNvPpCt587ys1nSqs4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dAJwtBYEK2vcVFradbXTEgu8NJXmvUf85o1BAnztOoexZZ3MSy559WZXvDIs09wWkJoL/JisVMDl4FRsQh3R0o9sFfcDCap7g4oh9nFSdRBn1XaIF73bukgRjqumzZY+M/PLEnH+BIyp9ZoxLPl/8JnsIiANMDauarDTXYTU6b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CIj3MDwG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FUwkUEIr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CIj3MDwG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FUwkUEIr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776958626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gw+/sVmfB0haxvhnd2I+rhbcypsN/pcDpOnZUNWDrB0=;
	b=CIj3MDwGNgaXgOj2Lz6lLrJgfVMFhkVErOOoWMqjNm418O6KvWcKbzODNSSI73MIGcgnth
	2x3yvxMEO1QbphVsKeCjWtYQwWOVDmhSWhVVyQO4EIkwhK9EwVbBzHgX5oUcxnIWAI031Q
	mOtgbRUhGo0A0j39yPOCqa0FTi+yJ2g=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-6-cOC54UqjOJqokxklw4Ah7w-1; Thu, 23 Apr 2026 11:37:05 -0400
X-MC-Unique: cOC54UqjOJqokxklw4Ah7w-1
X-Mimecast-MFC-AGG-ID: cOC54UqjOJqokxklw4Ah7w_1776958625
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d58bed44aso131585821cf.3
        for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 08:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776958625; x=1777563425; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gw+/sVmfB0haxvhnd2I+rhbcypsN/pcDpOnZUNWDrB0=;
        b=FUwkUEIrfRZteYq8QTVHC8f+bWdI5CetWe9q40aKmF3wsnecnu8A3geFSBkSQZYNjd
         x1nMJapPTE4NTxj4rSueiG1kH1JbmAq8UtMHOS+UL5ZHmWYXWjSzX/mLSs32YrR8vKv8
         rqBSmWRZebaQGYxLOuiZXJASfzVKqxLLrHPJk85J9rFml0EkGj5N1LhA0qv+CvKmpjPU
         XPfHL0zy1qy2f71NzOrsBP7Sci18EtaUwUhgS/2mAcnj6r8A7yfxuh6vhkZdDaH8erB5
         aDeRrf6fTse1br+AjOxA8w+Tjhmk/KddmY2oZd27dkscuMpBtpmLQbOXaet8CxtEOttb
         xK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776958625; x=1777563425;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gw+/sVmfB0haxvhnd2I+rhbcypsN/pcDpOnZUNWDrB0=;
        b=YsJZHUge+dFHkh7espXgjUryadz2DHBPJfPOXbfKfHPcEpjVzeMyq3Z0JrBxX6ROe3
         gpoQGRkP6y+uUi/bxrVj8nIBXeUxciDAjlnvWZfx9VVBYTPoV2x/1CP3L3elq9jdNiHR
         Pibtq0P4CT6/MCIoDB0mGsrpU9+Jj6ce+aZdCXcf8wej+Kd6TC7aXvzmSwr5Ln0pfsFU
         gZBRq6IM1MefilCmt/pqZbpL8e/RJiIB1uX4Gz5KSp5LW2cUk0uljwhrNdCXguxgCudG
         jd0MEIInsnxN7ecmM0EXM/ASZou8KMCTyTHHeqDt47CKawFYmN4vgpMz8cfAiHmg5fEG
         TqNA==
X-Forwarded-Encrypted: i=1; AFNElJ91W3ghVo/iCyVcL93axmbsSt0C9OFly31WnKmifBQIaiHIrvOED1XWgp6HNd9b0CFH8tfy3aLark8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbfyMbOeUf0cVyrPiA4sA2kRjctwfnVyhOJ4ATKjkYvId3P7VQ
	3L+uS8z+F/LTf5m1PURpSq36mJsxmH3Gk3KCJALShTxd6yU8hgJwOsuB4dEfDo4TPnTgp0zDcHb
	9bdwGXyCOSaFqU20jz4JlkRA1EnWGvJo97CQnoyrAOSUolYS9wKwUm5grnY5SFA==
X-Gm-Gg: AeBDiespkv3wzx/i1CvV77m2sG8E7qEj2OzobYHjtZwt2r7aYCQxy3fgFS1BXBaHoLh
	N3Q/aGcd+woGbXd9Xp+DQAorvXN36r1WiS3ncmWu270qHVjXN4EM/IArtpxQLBLwnQugdA5fCSs
	vFoDJgSd58Refz7YJs+1/rbZVLJKzBltwbWyDGwt85o+cFmJbgBfMLSUBDZB7xAopRc4KkDME4y
	3/MxcX1xOUv9WNCsrKaLpIFFzIqRR1e2RnIIofYVsxn6JiVseLjLrMxPQumLLP4alkwHdrh7Sih
	3DL/E/uHxjYrROMlwSfwNJQje8WmcgiQm8SOpQ5i0cXGZRYYVZeEtsvZEVeLeyNaGNqkkXv/hFT
	8QJUesUf4VFXyFLvkeatO/h6LeNlUhmNv3+W+2L7vcZiznYxuR/nrArPpgK0OwaH3tbM=
X-Received: by 2002:ac8:5e48:0:b0:50d:af3a:d8ed with SMTP id d75a77b69052e-50e36c495a7mr404228361cf.41.1776958625051;
        Thu, 23 Apr 2026 08:37:05 -0700 (PDT)
X-Received: by 2002:ac8:5e48:0:b0:50d:af3a:d8ed with SMTP id d75a77b69052e-50e36c495a7mr404227811cf.41.1776958624557;
        Thu, 23 Apr 2026 08:37:04 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50fc42c7fabsm41552511cf.9.2026.04.23.08.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:37:03 -0700 (PDT)
Date: Thu, 23 Apr 2026 11:37:02 -0400
From: Brian Masney <bmasney@redhat.com>
To: dongxuyang@eswincomputing.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	p.zabel@pengutronix.de, huangyifeng@eswincomputing.com,
	benoit.monin@bootlin.com, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com
Subject: Re: [PATCH v3 2/3] clk: eswin: Add eic7700 HSP clock driver
Message-ID: <aeo8nn-eigzlojWx@redhat.com>
References: <20260423090904.2108-1-dongxuyang@eswincomputing.com>
 <20260423091114.2326-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423091114.2326-1-dongxuyang@eswincomputing.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Thu, Apr 23, 2026 at 05:11:14PM +0800, dongxuyang@eswincomputing.com wrote:
> From: Xuyang Dong <dongxuyang@eswincomputing.com>
> 
> Add driver for the ESWIN EIC7700 high-speed peripherals system
> clock controller and register an auxiliary device for system
> reset controller which is named as "hsp-reset".
> 
> Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

There's one minor bit I am not sure of.

> +static void eic7700_hsp_regmap_lock(void *arg)
> +__acquires(lock_ctx->lock)
> +{
> +	struct eic7700_hsp_regmap_lock *const lock_ctx = arg;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(lock_ctx->lock, flags);
> +	lock_ctx->flags = flags;
> +}

I don't know if the __acquires() is accurate syntax. If it needs to
be arg, lock_ctx->lock, or ((struct eic7700_hsp_regmap_lock *)arg)->lock.

It looks like this code is triggered with clang, and I tried compiling
this driver with:

make LLVM=1 KCFLAGS="-ferror-limit=10000 -DWARN_CONTEXT_ANALYSIS -Wthread-safety" \
        drivers/clk/eswin/clk-eic7700-hsp.o

I also tried with 'make C=2' and I don't see any locking messages from
this driver.

Brian

