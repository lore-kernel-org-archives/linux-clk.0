Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E432F143C61
	for <linux-clk@vger.kernel.org>; Wed, 28 May 2025 23:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748474586; cv=none; b=TiPL9kax8v1suQxylZbc73GEbFzeKdLe5KhoOqGN5jNkHhEgVmQX5KlXUmEetLfTylqf9xHaROn47bf2Z77S1bVr5Du4ViQ9umm7tfguI8jzFtCqsMZTMCuzNHvJj4lWGa1O2R4m3LMG89SKzyOdHYR2Uh7CGKiyixUbjXJJY6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748474586; c=relaxed/simple;
	bh=p3cS7ziZxA7eWl6AkFDcQeO1xTNZ1j8LYv7CxtgwRMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sygQ4n00s2b1IAHuca01FPhGI9lPw/Fgdokv+YnPm+3ahXu1HzME5hwxuloZ32YCzeEyLFSUmMbs97K8ySCJK/gL/9Wwh98+NGv9rCAvEZuk+jF3i6TrNTAlPO/9VGCHuP+K9hT6RCsih3ArqW/Vg4uQBUWy70UXR/g5AxDreec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Kt+j9N6H; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Kt+j9N6H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748474583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p3cS7ziZxA7eWl6AkFDcQeO1xTNZ1j8LYv7CxtgwRMQ=;
	b=Kt+j9N6HQt17GTPGaOHkbojNdJCh70XdH95zE/QEDRtFHl6Nn6fYHj6Rp5erNHe8Yu5hC4
	2Am6UjutlJ/p6ckvC1U1dXpicBKUmLN4JM7P7CXkXhV/uYbW+zUcVwyKBDkZCqlZsJYyU3
	EQW4ihWuE34STqOb/3GU4OcVKwKfsAs=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-323-_JITJnpLMVWVyK4czzt5Vg-1; Wed, 28 May 2025 19:23:02 -0400
X-MC-Unique: _JITJnpLMVWVyK4czzt5Vg-1
X-Mimecast-MFC-AGG-ID: _JITJnpLMVWVyK4czzt5Vg_1748474582
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-476900d10caso5529641cf.0
        for <linux-clk@vger.kernel.org>; Wed, 28 May 2025 16:23:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748474582; x=1749079382;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p3cS7ziZxA7eWl6AkFDcQeO1xTNZ1j8LYv7CxtgwRMQ=;
        b=hrbJjpuNMOCqC4oqcTty7qqxFoJEhEIhCNEB9kDSb/fBApcsiRD15pNqlmQ63sohr3
         lXBlxUOCE0h4nTZmKzk3m3fJQkFUKcZVZ6VDnP2CYE8ao9DQBN7KxPV9w8fGlABTA3Hi
         M2X9fDsMMEnHmbl/tpMKMCyPrPIyurn7HE0PvuyTu3edpK7r7LPaqwEhGbLqKs1klQP2
         FI/64Vh9Uj6J6QO4ywtsNb1M9Q9U7bKdhc1d0XTYAq2BlwAMizsEeK7tdPJcIxHt9ibj
         saiEq0/23kWip2JRx/b9R/tNlN9qB9lgYsRsEEcHvrYAOtwzzyxstreT92yDgiMoD/1N
         VN5w==
X-Gm-Message-State: AOJu0YxbvFlJuPSkT89QnzuEskNTm23C9oxRQpvE7VtG/kgf3/hNkvE/
	TUmFQ2NWjvJv5d24Max3s1Xb78x/JeCmt1MFthTaGSpbn/yjGABfr4uis4yoY8fBu54zFUTPLdp
	1r5iMrqNmCVGmQ8nWgtMK1FKNyryqjfBMip6Hv7DfaLXuwDRIuX3Us2H6bZDpww==
X-Gm-Gg: ASbGncvLb+rfwfUo61YsUM6UmlvLYXhm3bad13bj+rSbfVp+H69Y5ZdxU+Ks7sK/Jv2
	yOJTL/RmMLXEFiYP5USmma91c0rHBxYAi2oHH9QGEh+rpGxrJCr4jyoaf08r/kWlFV99LCFQ/ka
	QQ4ZjOfcYJ+IFuCkyZWT6IGKvNV+8TWmJcxxOeSowa/3i1RdyNCpfUiO9YieOQMuhVy88YIoei3
	YNR7UhpgtR4X+cNvbPF6+pmUjfqX5H7ckU5UxLpHErLKmmRD044w9Lj+hRtJcT/mAvBfI3+CpGG
	VCnmmRVDij3IZYp1I0NY+HgYMPpFXVoXLVQ=
X-Received: by 2002:a05:622a:2591:b0:4a4:2c46:26a2 with SMTP id d75a77b69052e-4a42c46272dmr39923341cf.10.1748474581668;
        Wed, 28 May 2025 16:23:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxmHZfkjn5NZQNvu2eOxIy27NyirRpd6v7QkpaRHIVY/chEiuLRUJUD1UiqdL0oTpISgUIjQ==
X-Received: by 2002:a05:622a:2591:b0:4a4:2c46:26a2 with SMTP id d75a77b69052e-4a42c46272dmr39923091cf.10.1748474581307;
        Wed, 28 May 2025 16:23:01 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a435a37204sm886781cf.60.2025.05.28.16.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 16:23:00 -0700 (PDT)
Date: Wed, 28 May 2025 19:22:59 -0400
From: Brian Masney <bmasney@redhat.com>
To: sboyd@kernel.org, mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	mripard@redhat.com
Subject: Re: [PATCH 0/8] clk: test: add tests for inconsistencies and
 limitations in the framework
Message-ID: <aDea0w0hWl6yBVGa@x1>
References: <20250407131258.70638-1-bmasney@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407131258.70638-1-bmasney@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Mon, Apr 07, 2025 at 09:12:50AM -0400, Brian Masney wrote:
> Here's a series that introduces some clock provider kunit tests. These
> tests are centered around inconsistencies and limitations in the clock
> framework that may lead to some clocks unknowingly changing rates during
> a rate change of their siblings.

I posted a v2 of this series with a new title for the cover letter. This
combines another series related to fixing an issue in the clk core.

https://lore.kernel.org/lkml/20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com/T/#t

Brian

