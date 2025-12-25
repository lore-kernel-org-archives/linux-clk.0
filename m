Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6826E78F4F
	for <linux-clk@vger.kernel.org>; Thu, 25 Dec 2025 17:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766684690; cv=none; b=pm87dper3HIrYIjfgmJ5JbO/SmGKqb3doXM2XAzHtlgcYzc70hArJPQI9lr0GPiAdt+mg0wTMhYq0e2OYRR06tlT203ognFfb1DxPHwazmdWX36SEGZeagOXf8klyeU29B67Raa1UosQQh6EOBosi9NeLvET8elvtfJR/KDSIyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766684690; c=relaxed/simple;
	bh=ABbYCHLQAWHGB6az0nJ3ykJgyztyqsdufQ0ey9vMT50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F3cPKx7G2VTCPk+wOkqEew+Wz3rukpWnqRWVjARogbts1w7fSxmne70hzXNkL8hHqgrB694i+Khg+20pn+8lIwXjFuckbMdxPOxgy/W+5YiE3cs5lL2widosb8j/SAn5D1cj+9512qeZxLjJ4geVkO5T/h5OrQIAf1JCHRQ0S/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eb10cczF; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=URiAeiQC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eb10cczF";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="URiAeiQC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766684687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/mLLHQ0NYNnx/EzrQbuQDe5XiynoiftrV7RLmjK4LUY=;
	b=eb10cczFEs6nCsw/kcylV4F6d5HtmfVM8HYzT8RCBwP4ic9l1RTxpieeagE4Bjk/tnFUHM
	OeynoCJ4ViHo8F6N1j7pbhzmGFO4vwpx0nBrY6ZJFDGAqHeCbzjLeucFuRqQGZj419/J+G
	+842thW9FsODUmvJSqVKukfeFDIXlZQ=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-uJooK_NWNzSrERbPoaV9sQ-1; Thu, 25 Dec 2025 12:44:46 -0500
X-MC-Unique: uJooK_NWNzSrERbPoaV9sQ-1
X-Mimecast-MFC-AGG-ID: uJooK_NWNzSrERbPoaV9sQ_1766684686
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b24383b680so2248856785a.0
        for <linux-clk@vger.kernel.org>; Thu, 25 Dec 2025 09:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1766684686; x=1767289486; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/mLLHQ0NYNnx/EzrQbuQDe5XiynoiftrV7RLmjK4LUY=;
        b=URiAeiQCah9F8iK3y2WmZQF0/RXKsrp0ruay390XcgVin5d5kJJirIEIZISH46rZH9
         1s5jDlZnAUHQfJbCPstevYpIx6qKSySjeDuqW1TeU5OmIxi6tD04Iq1w7xKsUfVfEUcP
         t8QccuIW11HI+XQM7AFZTZfoTOMfvdUdEU0s2HotYdZOwJxou3MU6ZfGhr3qqhW9Gjm/
         6rYJqve79ac1ZdEEtN6674akAfPDpa0DGl7ND8ZlgbUrV1tXwJSIBB1K/ZNuqej8j6NN
         QQsUnBFhNaQ+7KmBy0GRS2SL+6rmIytM7v+BAkozcAOQwiyxoz7jdiCGFDDhDTw+VCZc
         3eSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766684686; x=1767289486;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/mLLHQ0NYNnx/EzrQbuQDe5XiynoiftrV7RLmjK4LUY=;
        b=MBtfVjQ71jltSyMfhBW36lv0VSFflQSPlMqdsRKWmB7sC2B/aQ55ayJ5NrvZx5JVmV
         zyRJKR3JPUzB/9QiqtRzkFJakv3S/+IWmTlMNdiSquHdhvwilFUQOW4XvWt7RKR44xUU
         ywJMKaIVAueW9XJTPu1q8rbYKYWnnOGC8YaZhKZfNAOcm8rZ+T7xSFBhhDjtAK1yVLHS
         NOUrh2ZSCjtxjAmwscYuDYNSYXFsJLZqiyg6OrAvNGUBXt4Cvixcs6XKqGnDhe5sMesv
         kMn4bNAMSsVyjI1dUWUz/Ok/Yai+IZOjQqAiR0JSRRoCWgfV69Z2XOvIhcHssYuSOhnU
         Lgmw==
X-Forwarded-Encrypted: i=1; AJvYcCU0hSRXRDi/5sR/edVe7GwNlp4RPv/Si0oew8HewEWvpWeUPme3/Vj0cy2ycumYi8stWLPGqoRkNxk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXkj0A0SnJVopiQET6OFdV66mrlHCPXj61LYdsCln8Ee+Abj1Y
	czWvE3J/YuktkA13OhYSnHrTuApiLPZJfe0whde0dfCqFNIBGwUABgB9T66q+ZQLqer9mP6z1ul
	+CCsoZ+SU31m5Hi2AxD+BfBHRz+JOWkKBt+7e962fM06E3vUIv8r6CzPtbE6drQ==
X-Gm-Gg: AY/fxX4f/SVcasraTXp71XJI384pkf2i1KXnZFwYQK4BoBLrHR3wVKTehi3zA5VSxzD
	nerhzGW+mmIgLg084VmuriRAR7qNCZvqdyyN9GynQyTxVQj9VhwJtV+BvUzfk2nF35ERa9oTYev
	+KNNJezGf5Ydmi4Dvpyu5h/2lqe/4tdsYJuYRFda77Oy/jk9hxUIh3X9Y6ofmgd2BJNnZV/zFZA
	YLX9QWOQVW4cEyifn5Q4Ygj2UfNqj/nqPyasaGdjXWm/y6vhQZHjib5Ce9uxaATFK9x9sp4Kwbq
	mDoPkVxXi36rxs9lNOX+eYIT4LE/TZWEh0KuNkmYYEuMS3Qfl/IKdF71qw5QCRuL8+fhvebXwg9
	/m2yZ73Hb4k7ax6anjTMbnT6/uYNQi2Nkpfgp3GGMkaQU
X-Received: by 2002:a05:620a:7004:b0:8b2:a049:4ac4 with SMTP id af79cd13be357-8c08f669593mr3067405785a.27.1766684685773;
        Thu, 25 Dec 2025 09:44:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFG/L5pwoLwpBSCZLzL63JBIDFsHP5Rl5s8WLau2qn2BvQm1lxuhkg/jnhZdcw24cYGOmLPqg==
X-Received: by 2002:a05:620a:7004:b0:8b2:a049:4ac4 with SMTP id af79cd13be357-8c08f669593mr3067404285a.27.1766684685324;
        Thu, 25 Dec 2025 09:44:45 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c096783922sm1560042485a.7.2025.12.25.09.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 09:44:43 -0800 (PST)
Date: Thu, 25 Dec 2025 12:44:41 -0500
From: Brian Masney <bmasney@redhat.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v16 1/3] clk: aspeed: Move the existing ASPEED clk
 drivers into aspeed subdirectory.
Message-ID: <aU14CWYXtU6MhmhF@redhat.com>
References: <20251224-upstream_clk-v16-0-8c1318f56c3c@aspeedtech.com>
 <20251224-upstream_clk-v16-1-8c1318f56c3c@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224-upstream_clk-v16-1-8c1318f56c3c@aspeedtech.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Wed, Dec 24, 2025 at 01:37:22PM +0800, Ryan Chen wrote:
> Prepare for long-term maintenance and future additions by introducing a
> dedicated drivers/clk/aspeed/ subdirectory for ASPEED clock drivers.
> 
> Move the existing ASPEED clock drivers into the new
> drivers/clk/aspeed/ subdirectory.
> 
> No functional change, file move only.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

