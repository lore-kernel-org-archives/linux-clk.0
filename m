Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7827F27F19F
	for <linux-clk@vger.kernel.org>; Sat,  9 May 2026 18:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778352595; cv=none; b=qQh45wHNgq8+5WITihRlskTPKxytr4B+4FAdFrosr07uwJap4m7DuElv5skznJ7CNcBi5Od6U8edKyOz/N1hpbuMpkgmmhGG/6xaOU8beiywSsOawC0QRvppPeNM1EcNBvSLQroJuQJ01aZ2xf1GjR+ZaSZdmWIqWdBHRLAbcFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778352595; c=relaxed/simple;
	bh=6XSQZ+zE7OvBYItJ+fT1jHCTZEPNcigVOgdTtn6IgEE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KoVUCxYpuKJOCZnLSLtbhC6i2IM9PXKeKFGg6UDyUqXNaOhw9KoaKndASLtrI0VR8w7dV6Dk5AUev/elQQAt5ANZx55igNAdDvZ6+5beXSUXn+IcMscyVtBRzdYOXLlb8nsqq3LgM4WEjN70xW1+1qFsKDriNMOpNH/x+2/XNak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z5T8Z4gi; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z5T8Z4gi"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-44a786a9b8aso365997f8f.0
        for <linux-clk@vger.kernel.org>; Sat, 09 May 2026 11:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778352593; x=1778957393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6XSQZ+zE7OvBYItJ+fT1jHCTZEPNcigVOgdTtn6IgEE=;
        b=Z5T8Z4gid38N+U3COZacthkKiS9mQDnSeYXHekmSe32uKRXf5jIilG+G9EoD93mOs3
         Yotwj287xsnvunCCBlQTopG0BRNlK6h5xUi5SJeCoXK2kRBMdbJ1ddrI4ITkAQKQ6LXD
         SGFPWi4MHq30cOTzfZJI5LROCoZOr0dd5OVBnqzXgZVUDFFcKyWd6UkBE6MMqEBnEd9t
         EbaOlrQXI5ePcQkrUUPb/9A1HkhlY3ngrddzL4WKZu3wtb/zKV2g/c4+JX7W9M4VUtFZ
         P/FTZp0TRSaomTQZTrRE38rThMRuQQIz9WGU5kO0E4xqaXd9luA2X36TYOzNGoU6Yn5B
         f8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778352593; x=1778957393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6XSQZ+zE7OvBYItJ+fT1jHCTZEPNcigVOgdTtn6IgEE=;
        b=SSHaP0A+rqfK4xw1VFvzozyh0etfPH3SDxen7SgzqYCfBX0Ze9lMiOoBv8g2xEMlH3
         zHMM4/sczYFHTAHDTGn9Vj4zaNY+nn7zDjUZ9TrZ3hrCZ+clHdSqxnxDNI6RqNvB5zA7
         6ICkb1yqnTyOQip/pTLGi2g1PuBSMuckOfl53NfO7cZo952HVD6yCtBi68U0lc9+9bLN
         /6pEKHapmAnzbhph4HeF/aAi2QX0VrSX8Did0p50E99pP4lhdhFw8UoB7icY73jldYih
         tDfHaSgLgQE7ahkahdnqpN6BYNwvMwrWj2UJoRHG/2Izb8qjldZQztX/IuC5BouDOELg
         jqDw==
X-Forwarded-Encrypted: i=1; AFNElJ8cU3H0wLJ6KXRtuBQBleXjMbrMeWoniIzGcGZ+B305PWtfphmtt44t45KGxhUXjIvOl4qxQuIT+wo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqT0V4ruxtJffqioHZ1DaomLh1Eqgvrf5+XV6Jcwd6GFSZyc/0
	auQJ5RuvrnkbnKj0S3ua+gpeHveRWmNj9zbBEUZR0In/tljH7dgx8U2B
X-Gm-Gg: Acq92OGHlMJsR6iTgHfSUIex9hkgRqeGx9lSxxepSSSIJK3Bhj8VlJnsiad7WEk6MEf
	vqZk5rXEhE7jzQCBGicba6f1TBmSzP6xoyDHg6DdBrKOfygk7syNZDjRwDe92TDtEFnYjMhTwXn
	RzuGYHctY5fhsUhImWeWJLGow0chMuSJ90wbwE2p7mhE5DRFeBYT1dgME+n6uop3JhRCJqyQhta
	P5KyzF/xoQYoOuvOdHoTGs5dUV//8dI/MbexBjnKXxpppXlt16c/i9vp34qc6MRT83Q1OR3e+m2
	ha1Rt3ObcJhx8wS1PbnijeRzqFwsVaxA51BZjBJmUG+Keuk2oGl6mFHzH3ZTVhhLXCW1Oz2iibK
	JqiCoOF7mpO0O4HO4ZCQZCA5PXqv0is487kU/HUAUel9OT4xxpT6+HqYF7wFYfh0gjVIL++yROs
	Ck5sSpGWW17d4cfwrZWKbaf6SBoMZKZXE4ItI71AzIQCSS
X-Received: by 2002:a05:600c:4f82:b0:489:1dc6:d6e with SMTP id 5b1f17b1804b1-48e5325025fmr130325175e9.1.1778352592718;
        Sat, 09 May 2026 11:49:52 -0700 (PDT)
Received: from localhost.localdomain ([82.215.118.79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702e5630sm60853005e9.8.2026.05.09.11.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 11:49:52 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: nm@ti.com
Cc: sboyd@kernel.org,
	mturquette@baylibre.com,
	afd@ti.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sozdayvek@gmail.com
Subject: Re: [PATCH] clk: keystone: sci-clk: fix application of sizeof to pointer
Date: Sat,  9 May 2026 16:34:25 +0500
Message-Id: <20260509113425.25402-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260508152321.3683799-1-nm@ti.com>
References: <20260508152321.3683799-1-nm@ti.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In sci_clk_get(), 'clk' is declared as 'struct sci_clk **', so
sizeof(clk) is sizeof(struct sci_clk **) which is the size of a
pointer rather than the size of an array element. provider->clocks
is an array of 'struct sci_clk *', so the canonical size argument
to bsearch() is sizeof(*clk) (i.e. sizeof(struct sci_clk *)).

The two values are equal on every supported architecture, so this
is correctness/idiom, not a runtime fix, but the new form matches
the rest of the bsearch() callers in the tree and silences the
Coccinelle warning the script flagged.

Reviewed-by: Stepan Ionichev <sozdayvek@gmail.com>

Stepan
