Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201173C98B7
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 22:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779835287; cv=none; b=QNXUUNIOZJIUGsUCV5Wp4QHh2hesGwCzNsbLTOWP9PTT6iZ2dUG4DuRG+jEzmpZA55LumIcXmbkkRYtgA7VBl9fWIUHZ8jHztzzsV0OZjI9ci5LxUSK9QgZwOpNz8b7pBt1rtNeMmg7hjVKWDnPCQol7NDh9GK+6gC0Bktj1HrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779835287; c=relaxed/simple;
	bh=2Dugn1cR3jbPWjetHrOVKStOpJEfKw2sbShSsMS8O/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gGAgxm9Gsmx8RDamLWtZ2mUEzZKUXLmvdsdH/RCyYKVv+j6IoDya5/Iia4MRdceA2YP95HTPCzyTmarQf8OvMMpwMTGx+y9f3mfqlImgJr6fEwxwfCnajLAWRqzW5cLsoIYnL613hP/QOsCgv8KDguLx4qMld451oG+PMj8yWEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Dt+lVByJ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FROTyYbt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dt+lVByJ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FROTyYbt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779835285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FHHZZiQsfame7Zg/4A4jt9+9wiuoOherVRDLu4XWaqo=;
	b=Dt+lVByJVC/bZ8q8HZO/GfFvpMpr1mjDpEQ3B8s7rnDixqMA+EkdAQFSxFcR68pjifXk0q
	G9sck9benCNr90pRIsf43paUga7vE9ZHkqcNyRLBjuOlOwHmGVa2naCPd/NNzyttPmDh/M
	yuABeVizoB1m9izZbbx4xov7ESOTMQM=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-wP9xT-dCNWa17aXHGJC0OQ-1; Tue, 26 May 2026 18:41:23 -0400
X-MC-Unique: wP9xT-dCNWa17aXHGJC0OQ-1
X-Mimecast-MFC-AGG-ID: wP9xT-dCNWa17aXHGJC0OQ_1779835283
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-914a8522bd2so1160590385a.1
        for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 15:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779835283; x=1780440083; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FHHZZiQsfame7Zg/4A4jt9+9wiuoOherVRDLu4XWaqo=;
        b=FROTyYbtFJqkHvPyhVLB8eVKkOseZ3zwESzmKZYEJXw1j4t1fhdOacKFtDOd9iRtS2
         51bbSc/K+VNke01+y5M00/cMfZIlFdB3HNLU/MlZm2ur8wfTUScQ8y/PDxZ96df1OdN0
         UpSyaxQTvN0SxkZUXHuZEo/FBdGolAdsARlnspoPffnIGmDGAld7Xd7oSm+ErlAek5x4
         7nJdOaNccZRcqFpG22hmDECBJjVmLu6SA24eEWk2o3sZ28CMKYqthMT7JwEpSIordTwq
         Ut+AIy8Szdz7X9hmEQd9TaS1Vzba+y8Zf8vlcgXus/v6T8sNVyi5DPilOhhDPoiRX81I
         KV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779835283; x=1780440083;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FHHZZiQsfame7Zg/4A4jt9+9wiuoOherVRDLu4XWaqo=;
        b=aZT5jJTfCA6RF2MreK1itGQM7nPc3WLrMXzWVeVv/uJRulc5uO+3AxMFUdG+b8ph3L
         UphYntNiLfGRcu2r9Ky4QouEgmvvNk326TyX1xC4kWPL/ZCkRfFY0brMwkCfzyJsjlew
         R/6xZ0rcHZxjYJpEFgPwcp8G75MG6o0l+oHflkID63DDxMaarCSj1MYsf1YtAdLNQEXu
         Ae8F9XfWD9GDy3BUmbCPLDPp9FITYWH0GUapyGiiKo1gahtZgySMbXl9ebSznjeCLU8B
         9nli0UPq5huKJQE/ZGZDm1IopqUbpfTquTwr3JiKVd9pc9qfD5dInViaiuYBAyFJURSe
         wRoQ==
X-Forwarded-Encrypted: i=1; AFNElJ++eKsgo3Do83iUeOcnHwxd389YiIk/tBpsLrsIsNz3NQeMZecXbD68Tu0fVCUv3cR7qn3PqSiIUpM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ8NsW6Cy23zaD9/dJKGjycGuqWMVPtTtkTMK4bH0bgGmBQfCf
	6pDuPbcq0kT+L2zjfP76oRayg3wfyyIlsTvapkhLk7qNXitLKDMLuiEhWZr8vUZBN/zjGReW4Xz
	wBrokC6RJ29nYrCtYJxI7QDVL3nqrHGj6tuE3OLWJDc9Rjk19P06znsLikzCJuA==
X-Gm-Gg: Acq92OHQVFrSLzmKd91oaD6f+zrLzFVAM8bbEeP68JpsUlugh9jOB5GvGIdnE6Zhwcm
	WrrhmmkxSy780TKx8fPfR1PweY8JGc5hzZ+fdbHUdZRpvap+YAVewbwm+0IoujcznkIlQXZEQ1M
	BP8fu+Tg8QDhF5m1H6JCYIvo48/XFUQZ0dSn6E2xnjsidQ5wASJf4A7Lj52hUcsTUA0wDw+G8es
	WJWMxecPQZgJlDk1QBem4aCJS3uWdsy9RJGwqzg/4sm1VZifs7wFL4SYLYSQD37yPQ9aCIUn04d
	EIvB6OecWhGgr9wSes+U9WGj32jtKr9f8XKiBKXdBKz6vKepy2E7dpu9VBV8tzlN+aJSKx77mPC
	ddQdx6vvujkUHxM3eIOnVjehSP4l1yONqM8vKjTtP5cTJ/NQOobYv8KI7f9GGN9BHpYY=
X-Received: by 2002:a05:620a:4408:b0:912:671b:d0b1 with SMTP id af79cd13be357-914b5029320mr2353468185a.2.1779835283003;
        Tue, 26 May 2026 15:41:23 -0700 (PDT)
X-Received: by 2002:a05:620a:4408:b0:912:671b:d0b1 with SMTP id af79cd13be357-914b5029320mr2353465585a.2.1779835282596;
        Tue, 26 May 2026 15:41:22 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914f87d1cc0sm362316785a.26.2026.05.26.15.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 15:41:22 -0700 (PDT)
Date: Tue, 26 May 2026 18:41:20 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..." <linux-arm-kernel@lists.infradead.org>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: mvebu: ap-cpu-clk: fix refcount leak
Message-ID: <ahYhkK3LhHMCu3L7@redhat.com>
References: <20260526184105.18962-1-grandmaster@al2klimov.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526184105.18962-1-grandmaster@al2klimov.de>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Tue, May 26, 2026 at 08:40:56PM +0200, Alexander A. Klimov wrote:
> Every value returned from of_clk_get() is supposed to be cleaned up
> via clk_put() once not needed anymore.
> 
> Fixes: f756e362d938 ("clk: mvebu: add CPU clock driver for Armada 7K/8K")
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>

Reviewed-by: Brian Masney <bmasney@redhat.com>

