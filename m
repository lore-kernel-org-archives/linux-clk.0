Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B039E40B6F4
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 16:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781541656; cv=none; b=mFZbHaeVON9y8tk+uYf2kSoKwENMOXsRdwDm/yeOWCFcojFBsixcDrC6dnVKcksB6QuiBc0kAuQQWASwthF5+VzAR/USWgOpcJy/F2QgexshnONAciyDfxpADF2iboWiPENHthkctSz0jI4DJ7Eot1LkLGZc6/TmWZYCV3Fm0yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781541656; c=relaxed/simple;
	bh=sgFYe03AdqAI3bmcuoDq5yghX+BkC5mlsAqcpIEve6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OgiGWANOBTTzlrEHUzMfe1taCSXRKS6Q9OjaZRd8VK/4MIgJ78VRRdzC+WCCYOO0/Iy5nlvVujhJ4l8M641vvB3f+BZCF+dLIu9ZtUFgWoWmVbILb4ilvQbyMMlRPoaP63QO6u10rtDJAXEIe8z7U42/Ul7TwtXLW8t0bqW7P8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ONRgOO5V; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SRXWYeak; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ONRgOO5V";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SRXWYeak"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781541654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fYiGHVY1xpFWEX6h4yQg4Y2KYAiZFnPKyRrFWVlw2cc=;
	b=ONRgOO5V3u2ytYqn0L/ERJ5Tgtude6rP6Li9duSvWX47YlErAipSYtyTDWMH9TnQe/4AFu
	Pi8OlRJqNnzlsRdPHZ8Mmer2wV2uEQb4gJVimkHznntzswKmt2leZC8LXmUkhsS0WOnn99
	obg/XP7JG4AKsd0/BnsJr2ETNDj8394=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-QVbFxM3xOnCik5taouojeQ-1; Mon, 15 Jun 2026 12:40:53 -0400
X-MC-Unique: QVbFxM3xOnCik5taouojeQ-1
X-Mimecast-MFC-AGG-ID: QVbFxM3xOnCik5taouojeQ_1781541653
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915ba226a9bso895987685a.2
        for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 09:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781541653; x=1782146453; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fYiGHVY1xpFWEX6h4yQg4Y2KYAiZFnPKyRrFWVlw2cc=;
        b=SRXWYeak+v7j0jqiJ7b51gxeOtyaapgR1CtatxokgXbwiO6AvPUMg/tTPHn9XZEVFM
         VeScC+cq6DNqMcqxPTSipShRQ1QaGCMnjl1Dw3on9Qt9BrTICGvndLIbuTuq6JuJg6+3
         dvUssKANX1zRu8zTcGu0N03aFVzEoYBSg+SbueM1Rgs0XpVR3czA6KTNEwoqkD6B66vk
         bJ6QhWYV7xuJiUyRJl/ez0B2xyORC3xDMWjCnEwdoFtM3cXVx5HnxhWTvDsMC1K7et45
         akJS5DFP25ns3/ie5OYrrZxiwQmnrQOiRA4OvVLsdwcmP4P3NhdmcH/VXtVEbTMcPCJR
         wRgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781541653; x=1782146453;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYiGHVY1xpFWEX6h4yQg4Y2KYAiZFnPKyRrFWVlw2cc=;
        b=IawkNJWiW4Nv46mVrDzpZbQ4mSszTiZmcxAUS1PZKbmvoF7bBzp6++KAFZOkZ2xB9p
         MjYZXCluDLYN/+LWJkTGmLWRkmZZHyFrvyK8vdkjUGBIA4WInVQWfOoFzA6+amgfsASb
         SVnRVTEvvXjRG0T1dFF4SYDW2vSQ925twGtmj6/qwJYtcM/7thWhxiqunqpyTNVkBL4T
         WrJIoyoAaLIEbbpPuhnGdmwBJe7+mBn9Q17F3dLtAOZo7I3caMuJSUMx7BHS245+Z09c
         uHsV+DZIQxulObfcCanL1DClnzCC984CH6EtnapO9OcSRb951j3IQLGSMFaicD6eV/Ew
         iSwA==
X-Forwarded-Encrypted: i=1; AFNElJ9z7MVC5tVdOgYLwzcQBtd/WsEdNQwJL8j//OCxEKEtmzZnRT77KxvF1aMYdcAn/XZKnEnlQDXbSDw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFDeN+MLvTRO4TMdnr9I3er+FxU7OfxfLwVGtkDhTa+eZBoM6r
	VEpYV8G1bEdvyKf0BrkQdiieK98A8Dsm0PlBPCMs7bdY7Xs4UnCvVImsOqhCW02QOLY7ebGRiRo
	/vBrH+tPD1OdHJCqD0KsdDxV4LmAFI8NoX6ulWYqVCxlPTC9Fb2F0N7eQE1P/uw==
X-Gm-Gg: Acq92OEjkilHQNq955AM3VUcnx2FhS4ExFc9NaDMYuuiCCDLuObJIvcX2chJvqu6BRI
	vC7139bc+aeqlIrjuHo3TI03ygn6QpSMGw/RCMWz1/6Vp0dCf/dMd8xmRcOgZPU1ibHjMZ1f+J2
	eq1aEeMZcsbdjMJcNWQcl2wkhIIlefpsiPjQCpQN5BJ6ipm0UoSiLhtHKiHS28iEPiVfI2VlpRZ
	0wy2vTAapTYHVF61IC9NsDahMkeSjQQ+eNz1fQhAYHmNfv/cXfTW4sw9hUaYxqHbgzE89KqbmUT
	f3ZUelRP0HT7mm/70tO0l//56Pz3RsXpNCxvYweRHKMlQhN4wDVoe4woDhvzhbJyaRrkTqMakVj
	Gpi+vA1c21IP929liN7cJ2VqI76f9ixpVEK0SIX9E8Z3PlilezHCeurF8
X-Received: by 2002:a05:620a:31a0:b0:910:87f4:9a26 with SMTP id af79cd13be357-917f1e44e09mr1835939185a.41.1781541653023;
        Mon, 15 Jun 2026 09:40:53 -0700 (PDT)
X-Received: by 2002:a05:620a:31a0:b0:910:87f4:9a26 with SMTP id af79cd13be357-917f1e44e09mr1835934985a.41.1781541652604;
        Mon, 15 Jun 2026 09:40:52 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91619f06835sm1180700185a.14.2026.06.15.09.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 09:40:51 -0700 (PDT)
Date: Mon, 15 Jun 2026 12:40:49 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sebin Francis <sebin.francis@ti.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v10 4/6] clk: Add KUnit tests for assigned-clock-sscs
Message-ID: <ajArEQ1rA7AtH-uG@redhat.com>
References: <20260612-clk-v10-v10-0-eb92484eda38@nxp.com>
 <20260612-clk-v10-v10-4-eb92484eda38@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260612-clk-v10-v10-4-eb92484eda38@nxp.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Fri, Jun 12, 2026 at 04:46:26PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add KUnit test coverage for the assigned-clock-sscs DT property that
> configures spread spectrum on clocks before they are used.
> 
> Extend the existing test infrastructure to support spread spectrum:
> - Add struct clk_spread_spectrum field to clk_dummy_context and a
>   clk_dummy_set_spread_spectrum callback
> - Wire set_spread_spectrum into all dummy clock ops
> - Extend clk_assigned_rates_register_clk and test parameter struct
>   to propagate initial SSCS values
> 
> Add a new separate test suite clk_assigned_sscs with three categories:
> 
>   1. clk_assigned_sscs_assigns_one — verifies that a single
>      assigned-clock-sscs entry correctly configures spread spectrum
>      on one clock, testing both provider and consumer paths
> 
>   2. clk_assigned_sscs_assigns_multiple — verifies that multiple
>      assigned-clock-sscs entries configure spread spectrum on two
>      clocks, testing both provider and consumer paths
> 
>   3. clk_assigned_sscs_skips — verifies that malformed DT properties
>      are correctly skipped without error: missing assigned-clocks,
>      zero-valued SSCS, and null phandles, tested for both provider
>      and consumer scenarios
> 
> New DT overlays are added for all test scenarios:
>   - kunit_clk_assigned_sscs_one{,consumer} — single valid entry
>   - kunit_clk_assigned_sscs_multiple{,consumer} — two valid entries
>   - kunit_clk_assigned_sscs_without{,consumer} — missing assigned-clocks
>   - kunit_clk_assigned_sscs_zero{,consumer} — all-zero SSCS values
>   - kunit_clk_assigned_sscs_null{,consumer} — null phandle
> 
> Co-developed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Looks good to me.

It's probably not appropriate for me to also put a Reviewed-by here.

Brian

