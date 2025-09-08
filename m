Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8BA3126C6
	for <linux-clk@vger.kernel.org>; Mon,  8 Sep 2025 17:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757351569; cv=none; b=P/Dfb1hkpdADLxKF4YIV9EQBCct+iWMs22JQtZFVpiHfarWQnOBIl/CbxytvUG6exdvFrzdHvV0m9mzL2QHZ2S+ZA1jklmTA9BL8AWAawE5HObaWyaVyrpmGYsW8onv20BrG4EvkxvZ+Yqzn57SWqTErN/jlUXNBD+/APHa7vSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757351569; c=relaxed/simple;
	bh=9wENXREJWltOZIo5LsFs5L8jitKtQe8nqAyfDbsl9ys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hw8I7fFn0px4vXZy/VDA6MpX1ntZkseJZjfNsRG5Gl7Th+80CGQyMShCvp1VJLDMYCfBf/pDieDuO1p8Es0PAMkry0nmqikEy8dunu9xxhigE7rYDS50gxP2jRu0UR1XRCwuTkAp5ZlS9aChwLqa3tKhfcLLRXgJSZ6mZIA0d4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DOsYG0DY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DOsYG0DY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757351567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7ITe2If+kWs1Wpx5tlRiHNQVWbTASg/lvnSb0pDekYg=;
	b=DOsYG0DYxinBpThkxeAHTXfscqm7n+RGzdX1yvnZINwFaIDYjKOi4hIc5wasB6Dn/WcJni
	ASm6Pxkjc8UISk7/4shO8ZSbBMtlj4BBojtOtf0mhKt3YwL9cXGkIqwiOMzKK0/WQNQC0m
	nYodxerG+O3r/7ywFRNGdik8s8d3iK8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-296-y7hWzVXyMK26HOjWWzAsZQ-1; Mon, 08 Sep 2025 13:12:45 -0400
X-MC-Unique: y7hWzVXyMK26HOjWWzAsZQ-1
X-Mimecast-MFC-AGG-ID: y7hWzVXyMK26HOjWWzAsZQ_1757351564
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8063443ef8cso1933817685a.1
        for <linux-clk@vger.kernel.org>; Mon, 08 Sep 2025 10:12:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757351564; x=1757956364;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ITe2If+kWs1Wpx5tlRiHNQVWbTASg/lvnSb0pDekYg=;
        b=LxlsPOmAaZmT5jB04kWav6eCYdtWXbs58JPbrFRfQxoVn/ACD87/J2+Z0u15Ki3ZWU
         fcZK7jzXHFzJMozh+iwACX5fkQM6xeUHt0UYAv2cJRMvl5rVCk4qWPGv64CT0k8wV9X4
         M7pIQX0h8+o9FyLdhhucn9aKi5eOLtzVvXuU/fjD2bovPPJ3j+y+hSali7fOkDdoBefx
         qbcOVtOX5G7zye+GfrU6Nnp2bPJvT+/Saurdzfebgj5NJyx0bg6WAlDp7KGWZcfJ2GNw
         OjS4T0mg9Tve7t0+yNc02WnMsIDZ/ccq7UBmHTx8k734sPg1jjtc9P4i8z6dTCzbQlG9
         +vPg==
X-Forwarded-Encrypted: i=1; AJvYcCW9ks8si+wz3IjcdKHoV+sT16nUyl70prvAEQKXt3JP7Ou/lBMnMT3P6rDJMQ2HcaqOsU7k5DLUOdI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMWSRc6AbyMy62tDYobwesRjAM5jX+LHlaKGAuA0aGH1njpkNS
	WSJqd+zIMdKhn+FOgYMU8C5Aap6CSrXzZfeTS13SIMUE10sTGaC8iqYDifNFh2m9XEx0jNjXxKP
	0jpeu5IICWluYvrobRIrcmXup5J7+9yhhi5byfuSM6qyNkOKE/0IllHlxMTnbeg==
X-Gm-Gg: ASbGncvw1uM0cChvW8Hdp7c/ERJKBAlo7tdYu0sOCuuaSZ0/9e74pKlcb2aCxDIeltM
	kvgJPwfSd3bX5y+dZozgYEpGVdkLZnnGX9Sy4XO73vr6KxnHQBBqJprpWtL28TnWlNfR2ut3QGv
	HAczsF/QYHKHJ+VdJDpbpJIENvwQlkHdbjKKSdC84EXWQZ/hEjebBAt48f/SWAFcxml1OaiDZtV
	HeeAeMcuIRWzMW6i3ipyJJAVrvUOf9ErTaUqwaUNlHsWYwAYXRjfhau8GccS2pGjnco5lPrBoY0
	cCiyqQ1TB5nFx1ePi0mdgyxuJZn2A7XPxu8WBasGAMEPyLENDPVjjstfq54=
X-Received: by 2002:a05:620a:4714:b0:7e8:3fbd:4190 with SMTP id af79cd13be357-813bdf6a9c8mr829190185a.2.1757351564610;
        Mon, 08 Sep 2025 10:12:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwMZsEl4SQNKbeMqNXOZc4NyVlPYCi+ENDx/Vjfad/o+tQQ/qJhvSwRqRuWnLNVWOHla1Uqg==
X-Received: by 2002:a05:620a:4714:b0:7e8:3fbd:4190 with SMTP id af79cd13be357-813bdf6a9c8mr829186285a.2.1757351564056;
        Mon, 08 Sep 2025 10:12:44 -0700 (PDT)
Received: from x1 ([2600:382:8507:870e:b6f8:ee72:4f09:a16a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8138798dfcesm600461485a.34.2025.09.08.10.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 10:12:43 -0700 (PDT)
Date: Mon, 8 Sep 2025 13:12:41 -0400
From: Brian Masney <bmasney@redhat.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: scmi: migrate round_rate() to determine_rate()
Message-ID: <aL8Oifz8zR9nJ_Wg@x1>
References: <20250827-clk-scmi-round-rate-v2-1-3782a50835ed@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-clk-scmi-round-rate-v2-1-3782a50835ed@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Wed, Aug 27, 2025 at 01:12:07PM -0400, Brian Masney wrote:
> This driver implements both the determine_rate() and round_rate() clk
> ops, and the round_rate() clk ops is deprecated. When both are defined,
> clk_core_determine_round_nolock() from the clk core will only use the
> determine_rate() clk ops.
> 
> The existing scmi_clk_determine_rate() is a noop implementation that
> lets the firmware round the rate as appropriate. Drop the existing
> determine_rate implementation and convert the existing round_rate()
> implementation over to determine_rate().
> 
> scmi_clk_determine_rate() was added recently when the clock parent
> support was added, so it's not expected that this change will regress
> anything.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

I included this patch in this pull request to Stephen:
https://lore.kernel.org/linux-clk/aL8MXYrR5uoBa4cB@x1/T/#u

Brian

