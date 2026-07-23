Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2154347D955
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 15:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784819058; cv=none; b=mz4+B4jFqO5uMRjCdDo7w8qCcG/rLaTAfnxNiHMA9DUMWf4BqG47eAisXyIZYta9/yNbsCQ5nkTrmtVeR05BfFkGCE9XFucAKyDMP7a86WZjwr8Uh45RUZUUlCgDHC6QD182Hdt3WVMslNioxvRAi0b+eWYEPvEQbwuw4jHwcPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784819058; c=relaxed/simple;
	bh=UEMwl1mUTJq51zU6rBTHe0+55FnjRFqfSf95Y/ByeA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HALSo+eRDacrDtfHl/fmxRYoOuJERwstslN0LLi9lUFh83SoennTVmXdOjE54r/BSUVSDv4e3wWK4R5ry1c1wGOyLKNIDreE4YW5fPNVWSb4QwXp0Nf09CPWLh7f4JiHsGaHY2pEXdP7LI8a96ACjD3IiylmvkGONEyryL4LcEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V9Fl8MQ5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=XgFku1er; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V9Fl8MQ5";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="XgFku1er"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784819056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aIw6GIPoYXkHISLGH2TozSxZ9dhllUdd+v51QggT3+w=;
	b=V9Fl8MQ5Wn/+DHL9MOXGlYUmSkIRcIXdAWetBYk87444NqreTKvk+7M6fh7AOPcPTlYS7I
	+TlqIEXfY4Pmlh+mrr7yDymoUYcMA6t3Cmj+f6j4UxaWbWbwI3Rx7GHcZ6msv66uGNzwAm
	H1zsSVEnxYEEAfDAWnVbxWlC1/NH9V0=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-399-yfBHyWf5MACebo2p4z5ltA-1; Thu, 23 Jul 2026 11:04:14 -0400
X-MC-Unique: yfBHyWf5MACebo2p4z5ltA-1
X-Mimecast-MFC-AGG-ID: yfBHyWf5MACebo2p4z5ltA_1784819054
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-522de3c645dso20628921cf.3
        for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 08:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784819054; x=1785423854; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aIw6GIPoYXkHISLGH2TozSxZ9dhllUdd+v51QggT3+w=;
        b=XgFku1erIFKjnCWJ294bJGfDCMvAg805NaEB4LA5LjtmogoUtGYVNBzDk+BQCmKltT
         q9z2NkU9MHJ6mkrLIHVp/gD41Z+MDBVAGrZGuyulECuvAOGDYDoYOk73q0QAJJdwGtAy
         iAVyOpdy9WkDIhkUplxygxaXB1zHLUXGd1V5TE6IzgsPVhJ93GvQUUg5Yg8GkY4WJpD5
         gu+OFglsQckTx9/3HxkFxUHcMNqQz1S1TrM+qSEXFLuxb7/SIAu4MhiDmFvl1xBpOdht
         yoFVbfpWX36Xtbmgo2dltr3x1TTwmZG3IhAnoEDaiJc062Mw65cbPzF08OsWbLCG57sc
         sIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784819054; x=1785423854;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aIw6GIPoYXkHISLGH2TozSxZ9dhllUdd+v51QggT3+w=;
        b=jEteQ0iTloeNeEH2oKl42MUTQMs2MS+taaHJbYOQcRd04y6U7Q1o5NxS/SWIBHO6QX
         WARt8gvfvMea8Rf2HoJW1DYiKHHQ+O/B6uAliGAkvm7HFsyT7PzclV4sjkHWbko05+fa
         FUKOxBEqarEbKDvL0feBlCK9YFP+T1eXbDBKesYldwCKYhQv0nTbapieVE3Cw2erg2UN
         CvH7DqNJYj3ZIabGAp8XglqZejo+oW9ooagGU5+TxnJIKkEK+UT1Hjg2lvDQICYJE+c0
         X5hRB4ZsyB11WGrfe5O5jxjhPa6qKoogNCOV8kJFcYsSAJfWOuDzUpt/weaMgESMraLT
         kAVw==
X-Forwarded-Encrypted: i=1; AHgh+RrIBpDpK2fAhojUinuAnw98hnLpJhMyuKxS3KHyMQBY5rDd9xjN0lZ4qdSJ1UT3JuqaVVwgqCshguU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1gmTNzzminsUScmHf0d+TWznOr+QDDsHdBqRD3QR1ByKffOoe
	fFVGZ3JItXguL0UCJXDGCSfT+sZ6Np7n4tuCU0iXiSOpfAj4LYilfo3Hm4987fuIknAeFg52mFM
	ItQyynr/YmEXV84ujBeY4e/BIO5huCtllu745v3QQFq6u59/TwYsPZGUYCSinXA==
X-Gm-Gg: AR+sD10yrJZycVyXS2thOCMTLm6TPS5YRdtN5dPjKx8pBMoVa5UHgBkG3SMcvUBjG57
	yFTxq+v/fZYzsUF9vSKgQfC4f4UhvuK/i6/4C+B4PuPDCIss2SNBc3DQl/+HSpij1BI7WRh/qrR
	6OkJkeTe7GNFucOPYsssBfzFLk3fsXsejOlXiraRb1pZiWx1EjyR9mJZ4baNaynSWaN9sGGSTUY
	9vumx3VY9JQxHDFnPIg6UwepYe5xL31kY4C5w8OIelgkcwx/hgX09L6NBUfOeESwN1HEU5pZBUe
	ySUR6SNqi7TKzDh8CZtMncV2zJX2y3E/Ar+NSOCmx4MLptGrSoGouNTnPf0lud5xzzav2vev8Xm
	UCusnHDPNbm4O8086fflE8ZCQVhRvZue9kzE=
X-Received: by 2002:a05:622a:244f:b0:51c:7b12:5fdc with SMTP id d75a77b69052e-5283e03d447mr32053831cf.88.1784819053822;
        Thu, 23 Jul 2026 08:04:13 -0700 (PDT)
X-Received: by 2002:a05:622a:244f:b0:51c:7b12:5fdc with SMTP id d75a77b69052e-5283e03d447mr32053161cf.88.1784819053161;
        Thu, 23 Jul 2026 08:04:13 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-527d402cb05sm36676211cf.31.2026.07.23.08.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:04:12 -0700 (PDT)
Date: Thu, 23 Jul 2026 11:04:08 -0400
From: Brian Masney <bmasney@redhat.com>
To: Suraj Gupta <suraj.gupta2@amd.com>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-doc@vger.kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, harini.katakam@amd.com
Subject: Re: [PATCH net-next 1/7] clk: Add devm_clk_bulk_get_enable()
Message-ID: <amItaLCmjtmH8SRQ@redhat.com>
References: <20260723123838.125145-1-suraj.gupta2@amd.com>
 <20260723123838.125145-2-suraj.gupta2@amd.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723123838.125145-2-suraj.gupta2@amd.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Thu, Jul 23, 2026 at 06:08:32PM +0530, Suraj Gupta wrote:
> devm_clk_bulk_get_optional_enable() gets, prepares and enables a set of
> clocks with device-managed cleanup, but treats every clock as optional:
> a missing clock is silently returned as NULL instead of failing.
> 
> Consumers that need a fixed set of mandatory clocks enabled for the
> lifetime of the device currently have to open-code devm_clk_bulk_get()
> followed by clk_bulk_prepare_enable(), which loses the managed disable on
> unbind, or fall back to per-clock devm_clk_get_enabled() calls.
> 
> Add devm_clk_bulk_get_enable() as the non-optional counterpart. The
> underlying __devm_clk_bulk_get_enable() helper already supports the
> required (optional = false) path, so only export a thin wrapper for it.
> 
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

