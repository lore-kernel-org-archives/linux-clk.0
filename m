Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E1937D126
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 17:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784224237; cv=none; b=Fi+8nD9S1fvXjr6ugrHUjgX0AmJmLL8LSULGMHNM0SxlvVPZH46BGTF01hhdLEwoPlDr8l9meIEmFhG6kEPGn0dG6izmAg038xCPgq8/j6kgcQVo6IxVo99G9NDG4UwcU6p+GQL2UIcKoF1taeyrXAWn+uO+S3ngBlduPZ9T+l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784224237; c=relaxed/simple;
	bh=9J8M2E4nCSvX004xsytxrQ+sR2NrUHgAAaEVDd+Gzig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lwHQa26hlw8A6E2W7zWYkoYB4FCQn37qNsGkeJ/AuRgbaDiBw85+bIOvZ23AJlwlDCNS52NPf/NXHaDIBCzG2FTewWaoWhb8e+tLgsTnsp5onHovN+U1MeG0TCG6QPSwG1Whwjh/U3r1TcglyLFfKFzZ6EymNKBSL/2SFl+bUYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eQIgXHXq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lm0q0NWs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eQIgXHXq";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lm0q0NWs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784224232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y2N4WfjYHE7wwtUQtU8XSYvtJnFaogNRLwB8anl/OSc=;
	b=eQIgXHXqPlRRGhcpoK/os0H7DFk5q9mwqA5+lqxyhYGcZLYPHUc1M2SgH9GCRHrtSfiAjM
	HLXLC8nXPiGhoP8QrogtsVVpHnT9KCFrEmu4iVdVC3b12IrWnkuql/vEvNHxropd+eUX/V
	aH2M586rJId2t/1kiku4T8ce+20gUGg=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-332-uFTvUvwuMfOPA9O1go-H8Q-1; Thu, 16 Jul 2026 13:50:31 -0400
X-MC-Unique: uFTvUvwuMfOPA9O1go-H8Q-1
X-Mimecast-MFC-AGG-ID: uFTvUvwuMfOPA9O1go-H8Q_1784224231
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90410c668adso123523026d6.1
        for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 10:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784224231; x=1784829031; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Y2N4WfjYHE7wwtUQtU8XSYvtJnFaogNRLwB8anl/OSc=;
        b=Lm0q0NWsw2OWwSRUBrLNk+hqphMp7DBNuCYCut5gm8U4LdbP5YHCE4WqKxkDXY9TDN
         kH6E3divpGcqQHBMsvBa4zCtzl8OdiFGfLBRvRQNvaEVJUw7gQAFLV+jHvGy/iXGFW+3
         fbJntYpAGEo5NivXkXllXztwW4UE4EUj03vmxk/15b3KYyK6+yd5R8nK5Cfz8RkWggIE
         IDuhtMnIJyELPb5A1wMgUsIujTgK07YYqwGXYgmcWHlzu7PJc2ouhI8oW5VJ7bW8AMJf
         oPcz38XKKg2BNWBtfDaN+q6wNvV/ti8ct4QSVImrtUS/la7c6bnO+T5H+YvHt4VwtyQ7
         h+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784224231; x=1784829031;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y2N4WfjYHE7wwtUQtU8XSYvtJnFaogNRLwB8anl/OSc=;
        b=l8CpUyX2nORFt6wCKnMREaQCDBmSnHUWfihptBReL8reUxtDe2ugudqs3eoAcLTava
         Wq4IMXTSNRD4kBTco3YsMSRlEXVcl7vMm8ud6JXDV+IeLkvLG14t2Y0JIJUJrpfEIUNZ
         6IE1SXzgkBsf9Ja4HESdLUb7p9ivRf+vsi9yifYilAfSQOX+JGNdPAU/eIj13+I4PsS/
         cQ7bCmDk4JXRp/XOSGPgxn2TKvK5EeqY4C2PtFmTADPutGBeytM/lZYLx+TUhcRzDE63
         d8j49moJOqAPGIeNWkoK8bk4wDHkLdQgevhIwuM3XDFRfyiSK7LocyMrPqxkMXODqRln
         tDdw==
X-Forwarded-Encrypted: i=1; AHgh+RpvFQemIBEKWVEmIvxeS+UFmrmevdYsUGEhLSwidArQIA36nxywqkYJh+/QiwaO/5o0RYdSITHazqk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEmxZwVXA8pQoCXeHJ6Kb5cvxDllMUHVSVBCkfOanslEQZFH5c
	myv8LKBWD6IazJ8KRTy6MuFSsmaY4e9SZYB8oKFR1UM48nPSqs/q6bhemRorTKSFUB5NKXBew9f
	gpLDtls36CucKetRj/PcQvLtYUFbMJ5wASFtE+8EBZbFXPsieRJ+edMnyeik0Bg==
X-Gm-Gg: AfdE7cm3BMeL/3UQqpkzC35BD9rzSHM4bPFIyGJ8PsJnjfdkX5cC0jQi9l/cbvV4Lwn
	QqM/kpaDhXSXr2uwDm9PU5jOKFlF444jaUbbdcS/fhtVYimSTuEcUVZ+RbutB1NJqKyrNv5eT0v
	YduAWQvSx/4jGYLwuTWNjAa72bWnPdC23YVdXwwYJ6NkBbA8jSgqjthznmfTfHtgWjj7ihQK9m/
	wBZ454C9iTHC01yMoiNNa0WiE51xV8oT95JHSsi+AmeQTG497qFLlxwU/uSQ7LRmN0z9fzaOdXB
	/EiLQoU3G0nnPDoHO3SD68Fl190OZwhYR7/tj/tGYgFI/U1ldtDFvfeJb6JQ8VtnSOpd0l1b7jL
	9vvBRrRVGWgLg1sfIeq04qNHb+24eN8jwEIM=
X-Received: by 2002:a05:6214:2b9a:b0:8cc:d588:4523 with SMTP id 6a1803df08f44-90747c2f10bmr115232096d6.13.1784224230688;
        Thu, 16 Jul 2026 10:50:30 -0700 (PDT)
X-Received: by 2002:a05:6214:2b9a:b0:8cc:d588:4523 with SMTP id 6a1803df08f44-90747c2f10bmr115231786d6.13.1784224230237;
        Thu, 16 Jul 2026 10:50:30 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd81f4bbdsm219440956d6.36.2026.07.16.10.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 10:50:29 -0700 (PDT)
Date: Thu, 16 Jul 2026 13:50:27 -0400
From: Brian Masney <bmasney@redhat.com>
To: wangjia@ultrarisc.com
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] clk: composite: Export devm composite pdata helper
Message-ID: <alkZ45CDRc8DMSrc@redhat.com>
References: <20260714-ultrarisc-clock-v3-0-4b1ccaa26b37@ultrarisc.com>
 <20260714-ultrarisc-clock-v3-1-4b1ccaa26b37@ultrarisc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714-ultrarisc-clock-v3-1-4b1ccaa26b37@ultrarisc.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Tue, Jul 14, 2026 at 09:35:07AM +0800, Jia Wang via B4 Relay wrote:
> From: Jia Wang <wangjia@ultrarisc.com>
> 
> Allow modular clock drivers to use
> devm_clk_hw_register_composite_pdata() by exporting the helper.
> 
> The non-devm composite helpers are already available to modules. Export
> this devm variant as well so users do not need to open-code devres
> cleanup.
> 
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

