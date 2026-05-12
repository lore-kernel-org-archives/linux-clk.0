Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938A83B9929
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 15:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778600897; cv=none; b=eclWBs4tdkN4qPUWl78bhcqHv/nGFU8quTdKaxASIYM3yfxjUgaN/yd8PabyqEJXVArT84SaJK/bhW9kwCY3PpY9E+SpkqRE/6Sk/PgiD+XD03C7bNVKFpFrtBhvS9QdQrjOaEKPM2N2dHg8xqCIwNDDQZDwgC4+CuX2w7cXW0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778600897; c=relaxed/simple;
	bh=Tc6Bg8J+jJKF6D2ctfjKeBriYeQhmdTGjP5iSl+ZSm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GxukJOYA3u9Rm7E77FH3VmrYG3jNiGDMtj+vGumOceIos+IxwAlPQ6VQ9Z0QUl3Qbpkqn31FFtLraDDlecEBLGes4aE9ldci1fyQwHmeCMoEspr4VAT1A/QsxvMn8noMou0aeMoG2Os9ORIDUcES+aXK6Qr5cwy7xYdNm9+kOiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MkdLf4/H; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tKziIRbb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MkdLf4/H";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tKziIRbb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778600894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e1U0ouPtDtvkd6M4yD7vhJkd7OXbr3G9ScJ0rAPyXT8=;
	b=MkdLf4/HAoXx+QfpwG0GSfAhtygeYbJsiWnren7Ogmf6iqDUKFT/Jlwp+oq62zfwYlKnPA
	k/92wexj9AZrGn4e53o0hXCL6RBcCtw8133ftlxgjyMq3d8ovEWqsBAR86A5JRtn1caDWh
	5iKcb/zPgss6zQOPEOaPOh8ObS49XmQ=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-tbDo9ZJMONGpd0Jpl2-tnA-1; Tue, 12 May 2026 11:48:13 -0400
X-MC-Unique: tbDo9ZJMONGpd0Jpl2-tnA-1
X-Mimecast-MFC-AGG-ID: tbDo9ZJMONGpd0Jpl2-tnA_1778600893
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8bcb482b185so104160556d6.0
        for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 08:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778600893; x=1779205693; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1U0ouPtDtvkd6M4yD7vhJkd7OXbr3G9ScJ0rAPyXT8=;
        b=tKziIRbbcVqI3LnP1mrMU6juGrXDziMkGrEgpgDsjvq8CE0UJ1+CzyYns6+CmWTQYV
         I2Cr2m0nLoHBsJ/VT3KX8OEOYDyEpDSb1bu1skEyd5anTQcNomVuJkFvMLUYHKrn/SKE
         d1JIkZkvxL5Ig+sUr+p8K0TuIwt23U9GACOe5ipMp7o49sjiU/P7XUKNukmDeVAWXsdo
         HUQNVMyAlq53irksCHE/+uXZY3918TivWokhUbeREymlClzv9kdHjv8KQbvoo6qpVQxK
         cSG+avDF6vwrKK8J/sv1/RU9QottDBc+UUF0j7w2+2HZC+hpN+9txFezcLXdSnNvEp3h
         g+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778600893; x=1779205693;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e1U0ouPtDtvkd6M4yD7vhJkd7OXbr3G9ScJ0rAPyXT8=;
        b=lhBOxABjOeikPyUmWXnmnMdkm4Ym7nVWD4THz2edeOsrRheGfGxZOkVSDz3DJAEnaB
         aLiaj8xjKCxE4jCcQxgz2hLjunr1fcdtwD7DowtEVwYmWFiFIL3ksqjrpTT/g5qwH4lF
         WahGJg7pW1oEjKUxeNfW8YKp82g20XX9h6JxYhCsZLcTzr3rG4sHig/PLXeWPADLAiwb
         IeHPX4ZRQ4Wm7CNpbs4z9r89RJAAKswVg+xb7x1WmaZAotln2dc4kWduTC5iSVLfUVmj
         vSCygOnXbhsDTCaM3BR8PHVAof+ogaZwWqv0uEW1OqAv+/uADinzos7ERWg59KV2FPYI
         z/hw==
X-Forwarded-Encrypted: i=1; AFNElJ8bppXVwmc8ZRw6awKOet+mAqGpkUcxpP6BZjxZzp+/prfFp0I71Tp69mrc/F0EHwJVXIvNAL5NR48=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1z72Z/RbM+Qjk5BYN2MvSq1yfQPTCwnHwiKVvFPnVIIf7wBhk
	ExQ5l3wZ91/krOheKEzGpYZGvyGxr3dCbBDSCRJR7Uos5s1RkMFr8uyvoo5Qc+m0FTQIeEnQVRx
	DW//w/1XsixsBcgAWVLuTgrZTRJPDsJV0sTiWja3i2EZdEI0A+GLdmL1mV6nYWg==
X-Gm-Gg: Acq92OHg0Ec2hzyLiRJFSEnM2xEpZaQZQk/kC09Fw2nXPoDsLQIq66lANaDUP0K7PXy
	DseDbLJzZpHyUnDZDOu0hxPqbIAxK0Z4JQtCM9rqCmTpdYlFyPVOPTBpML+mUqv8xGYvRVVRaz5
	DTNjPX5/9Rw1qXxMpPPPbFQSFECS4YLeaYcvU9yZ+y+x9TRO6+0E3h4Ip4EHnO4PyjzZeRhKVl8
	+jCFEGK+eQdW5FAFJmE4O5EHUYk+8DEVBz+N60TDUqrbhFthXfAbIVkd507oskcJkTA7lSa8MRH
	GTPleh5uJMO+qrd8ZEu1hRHHFrEHwVKfeSkagAW8tYJmjakZh2dfqXH/OuQkSp0PeVdO64qDVXU
	i5ExbxEcWWRPgrnmEbHoCqNNKFVeXjT/h6bnV1503YHLpvih5693HvWcI
X-Received: by 2002:a0c:f08e:0:b0:8ac:c651:bae5 with SMTP id 6a1803df08f44-8c1a37955e8mr217255546d6.20.1778600892548;
        Tue, 12 May 2026 08:48:12 -0700 (PDT)
X-Received: by 2002:a0c:f08e:0:b0:8ac:c651:bae5 with SMTP id 6a1803df08f44-8c1a37955e8mr217254936d6.20.1778600891943;
        Tue, 12 May 2026 08:48:11 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf3b0fcfcasm128529486d6.2.2026.05.12.08.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 08:48:11 -0700 (PDT)
Date: Tue, 12 May 2026 11:48:09 -0400
From: Brian Masney <bmasney@redhat.com>
To: dongxuyang@eswincomputing.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	p.zabel@pengutronix.de, huangyifeng@eswincomputing.com,
	benoit.monin@bootlin.com, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: clock: Add ESWIN eic7700 HSP clock
 and reset generator
Message-ID: <agNLuSCDlukeVGcS@redhat.com>
References: <20260512020432.671-1-dongxuyang@eswincomputing.com>
 <20260512020511.726-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512020511.726-1-dongxuyang@eswincomputing.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Xuyang,

On Tue, May 12, 2026 at 10:05:11AM +0800, dongxuyang@eswincomputing.com wrote:
> From: Xuyang Dong <dongxuyang@eswincomputing.com>
> 
> Add bindings for the high-speed peripherals clock and reset generator
> on the ESWIN EIC7700 HSP.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>
> ---
>  .../bindings/clock/eswin,eic7700-hspcrg.yaml  | 63 +++++++++++++++++++
>  MAINTAINERS                                   |  5 +-
>  .../dt-bindings/clock/eswin,eic7700-hspcrg.h  | 33 ++++++++++
>  .../dt-bindings/reset/eswin,eic7700-hspcrg.h  | 21 +++++++
>  4 files changed, 120 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/eswin,eic7700-hspcrg.yaml
>  create mode 100644 include/dt-bindings/clock/eswin,eic7700-hspcrg.h
>  create mode 100644 include/dt-bindings/reset/eswin,eic7700-hspcrg.h

Does the MAINTAINERS file need to be updated for these paths? The entry
in linux-next currently looks like this:

ESWIN EIC7700 CLOCK DRIVER
M:      Yifeng Huang <huangyifeng@eswincomputing.com>
M:      Xuyang Dong <dongxuyang@eswincomputing.com>
S:      Maintained
F:      Documentation/devicetree/bindings/clock/eswin,eic7700-clock.yaml
F:      drivers/clk/eswin/
F:      include/dt-bindings/clock/eswin,eic7700-clock.h

Brian

