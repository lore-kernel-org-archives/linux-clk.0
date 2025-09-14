Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BB3487BE
	for <linux-clk@vger.kernel.org>; Sun, 14 Sep 2025 12:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757851498; cv=none; b=Dwp7JxM3zL/xNNiyeU05Ksj2HrmFMOP6zD2SeAe9fL656QwaA0EOvPDQHPki8g20XyJPBmxaP5l72jEpdIRchrdWfnwdvHFdr70U4lmU2fzriA45NYkcLDgaiig8RwIs7moBDGFtRV7CEVn5PkLu93kwUtYRnJzYDDn/JcxBWbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757851498; c=relaxed/simple;
	bh=x6/x/F9H1jnt9+oD8dGb+mTu5SQ8wNiEgVuCPP1souw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gkJ6w1LGV71VMXVLj6rsaDkj03ybpQ7y9xtlrzvK5+NBXfJi6FGksV2avwcIwc4EL3A055Cdc+FgsRnLn68kBBXHiISrJCLbttH9Jr+cMe5UoyhrKiZ8lPee0qXTmRAmM+zMD4/NyQNcbsJupFM+DaUs4vdJ4ICOsm9qcNrY5Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HmW7IKij; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HmW7IKij"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757851496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x6/x/F9H1jnt9+oD8dGb+mTu5SQ8wNiEgVuCPP1souw=;
	b=HmW7IKijo9YBtew6ZyocKIXibVimANFTyoqu9R7DcAalTq3dLYAMDgHKIkrq+X3LbRpN0h
	u0YWzuDOwUaE4s93NYAnPa00ac+pP4aYBnKIUA5OBukvKHCpUusZDkT4XYHVINkpF9unc3
	QLNP1rCjzDx/0G1c+eyY7i6bgDC4KLk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-353-HyrQ7MM_Mq2BX7YA_JY3kQ-1; Sun, 14 Sep 2025 08:04:55 -0400
X-MC-Unique: HyrQ7MM_Mq2BX7YA_JY3kQ-1
X-Mimecast-MFC-AGG-ID: HyrQ7MM_Mq2BX7YA_JY3kQ_1757851494
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-77ef97f684eso6827976d6.1
        for <linux-clk@vger.kernel.org>; Sun, 14 Sep 2025 05:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757851494; x=1758456294;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x6/x/F9H1jnt9+oD8dGb+mTu5SQ8wNiEgVuCPP1souw=;
        b=Vx+0gpKaUEtkF6dJE4Gp9YODo4qhjuuH/8nvvi5xDQ7bQRvhesvfqRQ6TOcq6BvPiP
         c7fr5ZqDzrV7RcWzYARBv2nGrZyumLgMqw1GOfZVpBTO+l5taO+hYvK89YDwjBW3Eoro
         kp0vkun3+ILpEQIR+kTydoiMyJJ5bO8cJ50ndWO7z6BhItd71JEpPDd4qcpBi6+uI87o
         GhN6FqH4ZTp7y0wD3jEKX+snvScSiKesdUyru83e1WhY0/MBj+TQoe6mmDAMnGckHIt2
         k9PxUjJDamnXFzUWng3QQKqPKPPAWl2VYf8gABLzrzW1lMDdsLAlTxtyFsq0PR3dJ3Vr
         LRMA==
X-Gm-Message-State: AOJu0Yy/OOkzbIkEikKDOMW3dR3CLRyBQUszPXX1BXKLJhRlatLDD+GI
	cp8hvZK7AQ46RBVBEJ0+HfKkKv9IPu6/rv8eo/ogL8Kx+F0NpsPMKn0N5I70NenIIDdMz3habpX
	GnS/WKY46QNA5vTSYWGrrl38ViatOsvEl4KIBcXjUgRjl8iZDnP5DD1tF46EvCw==
X-Gm-Gg: ASbGncuD9CLCXipj1BPDeL39tHUOY2g0srNRJvTpx3QLqzjLYh6dDAgxv/A4iyR9WB0
	PGEHAQ/FE60V79vqRjvd0IsO4UnkbcoLRlfjoEwK7ETQCOlQostnSI0FfSFKJHY1wRsp2xsgvpd
	d/+oO4MmsExs5AI13CS94J8yDPeDTd8fANE2Yv4DuGbAJzVc3ZewRJQ7/VLZ+mjwAndnXrNMeCj
	8Su2B0913aSa7DgsvhQZwHSrikn7kx2zjE0rlkM78cjpchOBMf+Y5yydulJTMjKnLMk65D4k9oe
	s6J3E1wzmQhsbL3FyKkywNnIO2Fvh/r4kcCwCF08162NbeUyVboxVtd0xwgIZTGEy0Q4rqJGmt+
	RfQIpZu7sZdZ327YoriZ1a9EXTKR7hNc=
X-Received: by 2002:a05:6214:a54:b0:77b:dd92:d8d3 with SMTP id 6a1803df08f44-77bdd92dc85mr17330196d6.7.1757851494630;
        Sun, 14 Sep 2025 05:04:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECmPphlLafTRPXos3E/qMQLqgcw4g6SL9e96QNHBNQO+FV4Ve60CSx7PadzySEh8hyBowFVw==
X-Received: by 2002:a05:6214:a54:b0:77b:dd92:d8d3 with SMTP id 6a1803df08f44-77bdd92dc85mr17330016d6.7.1757851494267;
        Sun, 14 Sep 2025 05:04:54 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-778d99113d1sm16067766d6.68.2025.09.14.05.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 05:04:53 -0700 (PDT)
Date: Sun, 14 Sep 2025 08:04:51 -0400
From: Brian Masney <bmasney@redhat.com>
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] ARM: convert from clk round_rate() to
 determine_rate()
Message-ID: <aMavYz5z_CXMh8MD@redhat.com>
References: <20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi all,

On Thu, Jul 10, 2025 at 07:42:15PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's go ahead and convert the
> drivers in the arm32 subsystem using the Coccinelle semantic patch
> posted below. I did a few minor cosmetic cleanups of the code in a
> few cases.

Would it be possible to get this picked up for v6.18? I'd like to remove
this API from drivers/clk in v6.19.

Thanks,

Brian

