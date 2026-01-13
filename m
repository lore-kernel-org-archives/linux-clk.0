Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2986C34F48D
	for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 04:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768278095; cv=none; b=BqLwvcwFpEQ6sOf7HTrTuFQ0CilFFrTPf9d4BQgL5+3A52IeHGEPLcqdVau1/C74UWqh8OnHXx0Kv/3UWPsrjoLU78clIixucwz00puGOYpmsGXow/jc+KG8u8yQyy4QcngA9j07Rw3up16oawAEJcFNe3ChsvyBKyOf0Q/BLsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768278095; c=relaxed/simple;
	bh=9z2ygHADRlPRv6GZSQG6Zjqzw6mYA3L1xkaQe+u4lys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SbmY6xka/rpgSjmyXJmRk9Q9BEFgs+gwqyoteqFbPuTB+O1q/ZFhJDlUM8M8PJcId5k0jG+vN0NE4oMgia+zG0yUOHDphRpHgWZwJZIqa0KigXq3PYBYtur+u6fkMPe9scaYEfIFl5hXawhI2togZhpzIqWbpykJGWANdb0rdKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LK84SrVr; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LK84SrVr"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6467b7c3853so4858962d50.0
        for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 20:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768278093; x=1768882893; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9z2ygHADRlPRv6GZSQG6Zjqzw6mYA3L1xkaQe+u4lys=;
        b=LK84SrVrXJNVZPVLIoozNS5LeTKIvH+RgeTeIAtfUhGtnUFLW/iY2dS2rY5xGc2tAe
         r1a7cvOHtdJEIxddrlGvJ1s5cm2wWhSNM+6ZYvwYlWom35cGKq+0KY6ps7Q4kx3p11tz
         M5E0uslt3VK3RjgRQnJBxN71W6pBV7iQW/V8WqVfzFDk8+I5zESu8aI0D5cj4nk9X6Jj
         HVKGA3AH3FOoGQdGbjqrdwdCVOkaRPs84TH4kDzchMVg3sZEH4ROBEsqz6/elbnWNNNj
         RUF9tLCC2TuQjJSodnOjJjalRbL+NrNpBptSQUjUFLKiAuZgba35ioi1ZeTYTgAKDg+x
         c6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768278093; x=1768882893;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9z2ygHADRlPRv6GZSQG6Zjqzw6mYA3L1xkaQe+u4lys=;
        b=nqIR5pg0v9Phv4mkpPDjqwxxboib692Qh7iMdqpMsYWRI+uWAO03V8GzT/seHzARo1
         ZaYuVzFH873eV26HnU25e2Ov4FluvtVBAh7xWWImt2v3qhkwsqctP9DIYrNMT78P+gJB
         UeXX1k5CyrBsf2aXP6zX6yn+MFjoqpQkx6PSso0HFU8lT98n7456CGc39ilm+jdV5EOY
         gEmYIyLZ9a7xYeBoG3xO2JbRi+JilDSJwmlsUnG3aediZsCacBO3nFazbQi6IyZ8d5Hs
         YTh9sA3fjI1slk3dPKGqj+p7H0ZNLzasBY7qXRRcTEK1xqz0wvQO+3lQmgG0j3yMfN/k
         072g==
X-Forwarded-Encrypted: i=1; AJvYcCUZpXkIYMFQXLqcTmcFvgBb4vF4/wIczF/IULBaZYkI4M00OTpgZ1huyvGMggo7z8/sEektEoc0/KE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr5NZyvc+Tc+7Qm74+SUx36rt+CXxvWKKNpj12/77Rw+K7sh4g
	LSr4BoSG5E0mikZ+sZAi1YbGEVpVwWun6zudkHwPk4ZPlHcqOqRIve8g
X-Gm-Gg: AY/fxX5knOfhqYRubpsv/xo7Hi++/znzI6W6MzZtiA2WzgvJOjDUvDsq/xNJeZVT4Nm
	jN7HCpdidw3NhA/Q354saTUQTtS/v+C8epQgKVtfjNtVHjluZwuETelFkM6M54IhVjMpAJetO8s
	weDK2goNy5oI9OiXGXE6/Vi9nGDJEuVj+az/+l20UFtvyKy1f/kvbow2tqkUqt18cFdl7qFe8mj
	xNz5PGKjNbwCBnE9gmbwY1Flab2FA1xdMF1o9SxEIqW36jUBFwjmhIcycmtSqAqXQH+GAcasd3K
	6jagIeaJsMANVKIj/6QbQ45Okst5PFd91iZH/N6ME36hSLkO2Dn751T3n7yXqlJe9RuzDwWpd+b
	UXGC0YmK4weaOXkYIUfqSiBoYbsF7hLLltPqqmOrp8yHt24YHgfW7d5S04aAKIh3FLBv0kpy195
	TdKPL2FyyM0Sg0A2hMBR5/4CAao1fMe9OrwUySIq70
X-Google-Smtp-Source: AGHT+IGGcZLGkIPFIQNjOBHEDejVFdSxvol43+/5acwy+R+srjitlMp64hasZauwcNrOFpf7o0YCkA==
X-Received: by 2002:a05:690e:12c6:b0:641:f5bc:6999 with SMTP id 956f58d0204a3-64716c7a1b8mr16140967d50.85.1768278093158;
        Mon, 12 Jan 2026 20:21:33 -0800 (PST)
Received: from hoboy.vegasvil.org ([2600:1700:2430:6f6f:e2d5:5eff:fea5:802f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-790aa6ac1c4sm76004817b3.45.2026.01.12.20.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 20:21:32 -0800 (PST)
Date: Mon, 12 Jan 2026 20:21:29 -0800
From: Richard Cochran <richardcochran@gmail.com>
To: Wen Gu <guwen@linux.alibaba.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Dust Li <dust.li@linux.alibaba.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	David Woodhouse <dwmw2@infradead.org>,
	virtualization@lists.linux.dev, Nick Shi <nick.shi@broadcom.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Paolo Abeni <pabeni@redhat.com>, linux-clk@vger.kernel.org
Subject: Re: [RFC] Defining a home/maintenance model for non-NIC PHC devices
 using the /dev/ptpX API
Message-ID: <aWXISRWpkW-oHyUw@hoboy.vegasvil.org>
References: <0afe19db-9c7f-4228-9fc2-f7b34c4bc227@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0afe19db-9c7f-4228-9fc2-f7b34c4bc227@linux.alibaba.com>

On Fri, Jan 09, 2026 at 10:56:56AM +0800, Wen Gu wrote:

> Introducing a new clock type or a new userspace API (e.g. /dev/XXX) would
> require widespread userspace changes, duplicated tooling, and long-term
> fragmentation. This RFC is explicitly NOT proposing a new userspace API.

Actually I disagree.

The PHC devices appear to user space as clockid_t.

The API for these works seamlessly and interchangeably with SYS-V clock IDs.

The path that is opened, whether /dev/ptpX or some new /dev/hwclkX etc
is a trivial detail that adds no burden to user space.

Thanks,
Richard
