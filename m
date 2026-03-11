Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7FB29B200
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 21:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773265818; cv=none; b=X7wt5jt1y8ggLrAo+3vug9QtTB6vuihvOIFmfba9VbqV2kcSpA2XKkDIi5MypSKwJ5WW7YQaOEKz/f5lb+ZE8b6cUZMS1HsJ8wKE2Z649WNK6rs4daRykmAAR1Kt/1GKcgU5T7fSamhzXaGjQ/2GhP37RsZnTC27jqi4uEVB0lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773265818; c=relaxed/simple;
	bh=nUDluusk/uDGZ8oHjMwCbcwuRMtWi9qzMZ+YsH6si/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I7d6FCyXWixqbczNArUddFPA2fv+N6V/whfKST9zdvvZYRjepBEtyzh3GY7iB+w3t7OQx58zA9kih7JHv/hU3kt8zqUhQ1IVDhXAFVSq1YiVYa5VPULWoOKRWEpUQE5FYfi/jvLukX1l/nHUXjdzMIHhhsce1qaUuyvS/beGDAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CTtnu5tB; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=lhC2TzYF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CTtnu5tB";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="lhC2TzYF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773265816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iG1sK9K8o9dl9Vde3v0efNWoYZtYHoBdU4iIKqn1yc8=;
	b=CTtnu5tBTqWW3hfxmRHWOtvdcosAVLRikJGSKrhlMxxtgE8LTO/pLFPmKx7B3nUGL/55aU
	RhHNxmg6HkczU2DpknOT4A5LY2qEbhbbjcuucTJITVzv5vPDJoxIE4nDE4AXPOA9XGaJQR
	icquQjqGxtAChP5D4Nmul/uBiCHIXXc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490-9ZQHuxcPOJOj60-o6EQ2MA-1; Wed, 11 Mar 2026 17:50:12 -0400
X-MC-Unique: 9ZQHuxcPOJOj60-o6EQ2MA-1
X-Mimecast-MFC-AGG-ID: 9ZQHuxcPOJOj60-o6EQ2MA_1773265812
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd773dd409so63382385a.1
        for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 14:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773265812; x=1773870612; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iG1sK9K8o9dl9Vde3v0efNWoYZtYHoBdU4iIKqn1yc8=;
        b=lhC2TzYFzJa0Olv+maLTO7IHRURLGBtxyQwBS4Pe960fTXKOW4/6zqeXc2ITV5/o4k
         //jSoVsMnmxQ21SN1uwNwU3TXFDwkYNCrJ8A0YtXCKsh5e2K5jdvet11IToD1EzYPlX4
         D75HwFnt+jlgD+exqsaaFkDynSlj6w+2Zo0oUC92JM+YkzL8Oyb2/nQDo6RZQFznmgu3
         /9zrodZZL99umRlBKSLxL7MyAvfIx9koP4/4My7g/vUh70GiTVjQU7MVPTrOBY+3o+eB
         MbztcftD4uKcdW1BKc8/GW/Nd0weTKJWCCbljVb6R8nquPT/6UnTzUqhb3tw/FMWfqno
         Izjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773265812; x=1773870612;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iG1sK9K8o9dl9Vde3v0efNWoYZtYHoBdU4iIKqn1yc8=;
        b=MRy4xYyztdd+v8CRPbofWesESHyaUsgCsTECmpK9wGPuVOTU9/Q1m1EgwUEJE5Wwxv
         IDsHCYP5NLqNg84v7Ow2RMRYaH8gWS+n0EaLenXv0nQui5On93jEbf5I7QxkDQ2UGD+z
         1iU5hTDPQU2HcM9Kiureu7rEkgJ/wC9bO6Racg0xJpssC0rahPWpEIlNxFdsIz11CLAR
         xbyMPhE+r8d+/DqucFDC9HAIqApoGFqaqd5A5am7DBQ3zmZZNizO7VwNcnkuV8fNQQoV
         Qk9GdfKfPlFQ/Xv3jwK9oARKmoJ1pt8YrHqrJEm0XbeuHYCVLW05NnUYQMS9sIvh75mT
         vdkg==
X-Forwarded-Encrypted: i=1; AJvYcCUMnN99hRqb4XsJrzvS0JibgF44fVqzC8j/1RxZX/Eok25kutlRZoNWRHL8wjQ1dRjxNozgujljYKM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFs3agQ9MH9l/524y7YrjVPDsYzPu6mtS9nVGa5x8Artr3n/0x
	GzWeu3KDEh/tnv17h6Rb79IOc4zlA39HDMggvLG7pQdU56qd+qoyRBI2ddCEiYWZ5feJYaAdTdL
	JXphMzJ73ORwjawijYx1ycAeGEPFoljV0N1uwPrKnnrus6Mbav48MS4OgVfoweg==
X-Gm-Gg: ATEYQzwVMMnExRb3gfjUbhVbvMLV2KzftpE9X0IMBrD7YIy85zlSOhN/2AxOvA/adDM
	7Y8xz4OjNkr+iDZj7gqN27DKbfeXcCg+Kzr93MYHROBMwXqhNnhgs/Vlm8wSFbaDLO0FXRfzA4Q
	LnE2ebmHuzv0UNkkRlihfgt3bxzuchRYKp3bS/leN6n/5GG9gTO+vuvBr6g+TVJdwUYeMnWN6dP
	owhBnjHKBweicxrH/y33B/gtV5gtrGawIOO46vT3CYE6Dur6duevggB1z4UQhGQB1zraVxsdNhI
	jJWf8+9iOJVMyTx2UKdBv+BGjgI4R8SaAp68IAP8nAOM8ExZAqQgvk/0u3INK71eoZbTq0tWYR4
	qJJEi+4HGZNg+G0XuwY8=
X-Received: by 2002:a05:620a:44d1:b0:8cd:a071:9aae with SMTP id af79cd13be357-8cda1a8a3b2mr581381085a.78.1773265812367;
        Wed, 11 Mar 2026 14:50:12 -0700 (PDT)
X-Received: by 2002:a05:620a:44d1:b0:8cd:a071:9aae with SMTP id af79cd13be357-8cda1a8a3b2mr581376885a.78.1773265811916;
        Wed, 11 Mar 2026 14:50:11 -0700 (PDT)
Received: from redhat.com ([2600:382:7708:94f:6bbc:89e9:5b48:3a11])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda1eab31dsm211687585a.0.2026.03.11.14.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 14:50:11 -0700 (PDT)
Date: Wed, 11 Mar 2026 17:50:08 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v8 4/6] clk: Add KUnit tests for assigned-clock-sscs
Message-ID: <abHjkMXPK0fXcdrO@redhat.com>
References: <20260302-clk-ssc-v7-1-v8-0-2356443a7e4c@nxp.com>
 <20260302-clk-ssc-v7-1-v8-4-2356443a7e4c@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302-clk-ssc-v7-1-v8-4-2356443a7e4c@nxp.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Peng,

On Mon, Mar 02, 2026 at 11:01:18PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Spread spectrum configuration is part of clock frequency settings,
> and its behavior can be validated similarly to assigned clock rates.
> 
> Extend the existing KUnit tests for assigned-clock-rates to cover
> assigned-clock-sscs by reusing the test framework. Add new test
> device trees:
>   - kunit_clk_assigned_sscs_null.dtso
>   - kunit_clk_assigned_sscs_null_consumer.dtso
>   - kunit_clk_assigned_sscs_without.dtso
>   - kunit_clk_assigned_sscs_without_consumer.dtso
>   - kunit_clk_assigned_sscs_zero.dtso
>   - kunit_clk_assigned_sscs_zero_consumer.dtso
> 
> These tests cover various invalid configurations of assigned-clock-sscs,
> ensuring robustness and consistent error handling, similar to the coverage
> provided for assigned-clock-rates.
> 
> Co-developed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Reviewed-by: Sebin Francis <sebin.francis@ti.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

I'm collecting up patches for Stephen for a git pull. I wanted to
include this series, however I see that the clk kunit tests fail.

[17:34:44] ================= clk_assigned_sscs_skips  =================
[17:34:44] [FAILED] provider missing assigned-clocks
[17:34:44] # clk_assigned_sscs_skips: ASSERTION FAILED at drivers/clk/clk_test.c:3218
[17:34:44] Expected 0 == of_clk_set_defaults(consumer, false), but
[17:34:44]     of_clk_set_defaults(consumer, false) == -2 (0xfffffffffffffffe)
[17:34:44] [FAILED] consumer missing assigned-clocks
[17:34:44] [PASSED] provider assigned-clock-sscs of zero
[17:34:44] [PASSED] consumer assigned-clock-sscs of zero
[17:34:44] # clk_assigned_sscs_skips: ASSERTION FAILED at drivers/clk/clk_test.c:3194
[17:34:44] Expected 0 == of_clk_add_hw_provider_kunit(test, np, of_clk_hw_simple_get, &ctx->clk0.hw), but
[17:34:44]     of_clk_add_hw_provider_kunit(test, np, of_clk_hw_simple_get, &ctx->clk0.hw) == -2 (0xfffffffffffffffe)
[17:34:44] [FAILED] provider assigned-clocks null phandle
[17:34:44] # clk_assigned_sscs_skips: ASSERTION FAILED at drivers/clk/clk_test.c:3218
[17:34:44] Expected 0 == of_clk_set_defaults(consumer, false), but
[17:34:44]     of_clk_set_defaults(consumer, false) == -2 (0xfffffffffffffffe)
[17:34:44] [FAILED] provider assigned-clocks null phandle
[17:34:44] # clk_assigned_sscs_skips: ASSERTION FAILED at drivers/clk/clk_test.c:3194
[17:34:44] Expected 0 == of_clk_add_hw_provider_kunit(test, np, of_clk_hw_simple_get, &ctx->clk0.hw), but
[17:34:44]     of_clk_add_hw_provider_kunit(test, np, of_clk_hw_simple_get, &ctx->clk0.hw) == -2 (0xfffffffffffffffe)
[17:34:44] # clk_assigned_sscs_skips: pass:2 fail:4 skip:0 total:6
[17:34:44] ============= [FAILED] clk_assigned_sscs_skips =============
[17:34:44]     # module: clk_test
[17:34:44] # clk_assigned_rates: pass:3 fail:1 skip:0 total:4
[17:34:44] # Totals: pass:16 fail:4 skip:0 total:20
[17:34:44] =============== [FAILED] clk_assigned_rates ================

Can you look into this? I didn't look in detail, but should the tests be
updated to expect -ENOENT in some cases, such as 'consumer missing
assigned-clocks'?

Brian

