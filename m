Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA4E369D7A
	for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 21:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786399184; cv=none; b=K/0Yrlh8dAQ1wlgEPdWM2aDwafjpoETLl8B+m4R+Cuxfgyfv65YvtJ4Z98HwHDgp4HH0dE/S6TGLBwOyYKyPepY33muIt3PkEm13SLxkZ+P3VmMH6Vcu/gRt4IfnEO4cN6DRy4hHAUW736XBlJ4RDSRO8jkybmEFZCQMgY99WVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786399184; c=relaxed/simple;
	bh=WGRaFchSac3g+d7dCJ6oKbRm7IjQJlD16qXgPvpuuT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EpFFqg45MB94INEaD94SlLO565S/BMNDP4favV8aFoeD+h51+VeTTVE+aknXSQQWfyUPN86/W9spF7l20o9ABebTFHSA5y23K5KjyeCYVb2xc12WVNSFY7UVzBM79u7dDnyGfEPcBRT6Xli0lsDasdh3wzZFgBqek0S/14q7bZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vpm7vIiy; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PJtPjCD8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vpm7vIiy";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PJtPjCD8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786399182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HM0jDu4T7yH1UL3y9Xop+wHBl7p45KQE498sSn5/W1w=;
	b=Vpm7vIiy0aEOzqwV809u5s4BpQptXvNph2H1XR9ATGpQy2b4eKUvio55+XwuHUxxyMlbCA
	MK3d25fgQkjYC2AWwYXIXeBm4ONCYe+sOIJ6XgW8WsEHQgxjD/jqZgXUkgwZ+WqTpwxr+j
	hZ/RjFCNfYmKOMDHovIhly5Y3KfFtTY=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-3aBRHreQN8anD_VQcUe-rw-1; Mon, 10 Aug 2026 17:59:40 -0400
X-MC-Unique: 3aBRHreQN8anD_VQcUe-rw-1
X-Mimecast-MFC-AGG-ID: 3aBRHreQN8anD_VQcUe-rw_1786399180
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-81e92ddc199so84470427b3.0
        for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 14:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1786399180; x=1787003980; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HM0jDu4T7yH1UL3y9Xop+wHBl7p45KQE498sSn5/W1w=;
        b=PJtPjCD8zXEHxfYR141w5awgbodb/o7B5Ser56S2lZTz9ZS9njekyVyJPp6/AFX6rn
         mOJCwRmwvprLAzvVr+BLcDuOJPy5yX7cdENjEZrMZgIXxD/cCDQq9oRxPSFgxlhU6IFS
         vHXyYqGVG/h3K9YYSi6AXlK+rIOV5Jtuxghyk7T5qGR8UHVV4wfSh3G1ccK0/FMNtPlM
         5yx42ccpBNwLgqrKfTk6H5Hgp+JyUaQpcNfXlcyZejiC00diAk9kNZ8VsV0RNyCiBn7x
         4YM2gRQ9EoeFYfhDdhxmXttk60HPLUws/88BteNHE1MMNp+skS7QQrcbt6JAu88ByYx+
         tGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786399180; x=1787003980;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HM0jDu4T7yH1UL3y9Xop+wHBl7p45KQE498sSn5/W1w=;
        b=WgPZDHyyQVk7PGAgQ9Vsmfn9Cl59ICj8GGgtslgDNjpCwqJpK0RJVoHOpHrO0x3aUZ
         oJ7DJ6fqjN4HGRLOZ+VdcKV65jZSPdN2/uh5cpqG6s0FrDCY/K+NV7jhOf+UKQ+coLVL
         G/93lrmIDEKpUnOiIdMyZ+5WP5K7xAyIRtobdkvzxoSdK40ISed+1aWHl2SYURvsefWL
         5TlFe+QDDVK9SuD2v3LqWwH0EgyLBefmUJCPkud+e3Tm7iy9KQgacCk1gpbWOXDLoEvs
         IXfUM8nhIWndGF8aNcHsin4CYy/65JEdBy4/1PT/bK5kUpjk+5ME2J52HXmV2XVl8DqX
         TBJQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq1K4vl30ctqNQbRPxcNsUkntCNseyFhMHb4b7KaOpfVNPfGCc3TNLxo4ysC7SrBzAURInRBZWx6fI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZQlNQq8UMtYFmLE88YuaHckBXg3IcW9dLGihZCneQpxcB8pc9
	Yf58LXouJrbsxYDdatN8sRF2/wpcBVN3ol6OshPS75JtAl2S4jgfIe7BcqRUdXg+HIFEHdnPo2A
	bSyXtAgB8cMd6x14DBv53LcuGSXZAGZ5/ShjFwWj1SyB/kJvtlrBXrUKD9ZUKxg==
X-Gm-Gg: AR+sD13N/AVNsG39Dm4BfnvBwkaZwW9DftJKZ1dCtVCDi6ZiqyXQbWvIYTQS7+gqLGS
	YMiSv5XIqlqWOwz4aXWUZYnpETyjZqdcFSQtMSFZYRcSYxZ5Y6mcY9AEP0ZgYBUdtqkhkvoTpVC
	OzEuHhSOi2cy9EDO0yF3Ez9c+Vi85/PJ7kH1UM2WHb5Q8CLHwxn3K8lmnG1M7oRpqgxEsXuCIOs
	MXrTirhvAqIim9yH1JKZ7nOCqIc97gPkQXvJRWSu6Z61ibofocG/XYz2XgHipBNAt29k2VFhMBr
	uMLO8XIaiZMFMVmoDkOyhj6DCcfpGnNEdzHncnrkfw3YRdt8+4pp2ej+0oXon/gznbZ+X5VdMr2
	vH9B/I9emSO/dcqmh1jF8ILum4bZRJrR9Y7c=
X-Received: by 2002:a05:690c:2506:b0:81e:eb11:6e5f with SMTP id 00721157ae682-820229c195cmr279357117b3.34.1786399180126;
        Mon, 10 Aug 2026 14:59:40 -0700 (PDT)
X-Received: by 2002:a05:690c:2506:b0:81e:eb11:6e5f with SMTP id 00721157ae682-820229c195cmr279356737b3.34.1786399179584;
        Mon, 10 Aug 2026 14:59:39 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-823efbf208esm64134367b3.10.2026.08.10.14.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 14:59:38 -0700 (PDT)
Date: Mon, 10 Aug 2026 17:59:36 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, mfd@lists.linux.dev
Subject: Re: [PATCH v10 10/12] clk: zte: Introduce a driver for zx297520v3
 LSP clocks
Message-ID: <anpJyOYpFBe6ah0I@redhat.com>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
 <20260810-zx29clk-v10-10-63846490712c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260810-zx29clk-v10-10-63846490712c@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Mon, Aug 10, 2026 at 12:28:29AM +0300, Stefan Dösinger wrote:
> "LSP" is ZTE's term for this part of the SoC, I suspect it stands for
> "low speed peripherals". The main UART is here, together with the flash
> controller and more surplus proprietary timers.
> 
> It also has one more I2C controller that supposedly connects to a
> battery charger, SPI for displays and I2S for analog telephones. The
> boards I have don't have any of these components though.
> 
> Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

