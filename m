Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0064E50AA
	for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 06:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789625747; cv=none; b=tVw24CvmYw0nvx0jeu/pHvoBhGoL78Ti9X/bVsS3lR3BcZg6kjN7YdMaOfm4XfxoKVCofxsnYy0zIcoTaGOL+HHE+1luJOOqwRqAWeCO60DWYAY6rsOpUCYsU7vMmobW3gF9058KRvDXGpiUJW526yBQkI8fXbpprpzJE+/9k9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789625747; c=relaxed/simple;
	bh=+K4jEI7K5jG3d7ElsjaI4ZZGrcnnZ/RJPFxiwdiWFHw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IGvfBRGvHf5u9cFoFbHGpRGoCMpmPSnVBkK44XAQG0iFlJlNCoagR5cdoRVlwI+mKSgu+w8KJtwq2jwfrqj60Nv+FlwjACFr0wi20LJggXJ+HILWkfbOokzAmp5YXgkl/2vlW/98mOiZHQ8XwP0D0r9d3XI7RtoMU9OU5OhuUiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ecx+c3t0; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ecx+c3t0"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso3338855e9.3
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 23:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789625744; x=1790230544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+K4jEI7K5jG3d7ElsjaI4ZZGrcnnZ/RJPFxiwdiWFHw=;
        b=ecx+c3t07MH9sBrCeEPAbfQYci6shc52HtS4r73KOSmKZ7n4S5F55teiL51reGS260
         XxUannRRoX6RRYc1f7aW9mvhaZ+WgXCu7gziS4SAT36HfZZJaj1Gx+RxdGCh/xEhCUUP
         2SCTat+g5dZsiedwwIWKEwDiQtRdH/tVOtvGdare6TbfDhYQYC4fah/s7N1HDKy5CkBT
         hRseOleyC33ZzqhKJot4fK29HoLBE+yqpPAIEGaQcqk+GzTX7Ek/n+miWDC48k7jqg7Y
         AKrTgIM8Gj2+rNAg4qjtFpaogRwyVsxeaW5K6gmaRDK0cOeIrpXx648jfj4vv5SdUEEe
         nxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789625744; x=1790230544;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+K4jEI7K5jG3d7ElsjaI4ZZGrcnnZ/RJPFxiwdiWFHw=;
        b=kbNdkAVgkOUMjWZynn+u9gwRm+IkJJ+VKSx8h0bl/4hdIAQ2IYiWq97XBEqpBjCahB
         5L1BNT/VfAkzHasK/f1JnQU+VxCFGnZCNmcBRXS4mGJ9t6Ja7RPQGIa66iXTKE6KNuz/
         KNHqcCs/5VCkSHxq12MiWKx2KtPFLGLsZPU7t1CUNp3s3N9TolZhNXE2N4XydmOnH56X
         X++ODoqz2Hp/xQb+kEzTYTQfdaLhjRyEvgjEI9XnW7r0L0lfuIFtYpKi7R+OQ5ayBJFD
         CSPAiOh3M2gikLqvLargZLMo27nnNhheiBKTAqXvDriBfnsS1iPtVnBymKjAx/Ba58Bg
         dFTQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsln8eysUG+asL+8jDB0Ux9WhOlbf/xXosEwNhkBotXhG8x0Ms08LkCgdKXd7SYUxQbIQIT7fRLGQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nTL7+toVRyDtHKJOeNz4Tzyljwg3WDNAH8zwjLuOOCe/0HHDmZ
	pT6Gel5sSD3dDJX36MQ/c29AYiEgk+8ndGj/uAjfaTqoZVgZplCKBv89
X-Gm-Gg: AYBFou3GYd2nu7rYN9qulqIRiI9lJXHq7igCgJWVlesbFQ+/ecKg9ZvJoLVffOkiMAP
	0RyELc/3zRqZVkJHg5RK/n0CEkrHmFe6SHus78r9eg1POanMg2yPBErUy2SyI1ByYUzXaZQfTxT
	TjGbpobQffZ6VjRh8UnAGswQ9cF4eytH+wmBPJ0vpNQw588JdPWG2E9zd4OKKca2eKSBLT+hMGT
	HFU/29ljYt+HAzSWj6hmHQfeud9h1LGCfmIbKY93y1y6rkOM1H22yBkFd0WLmBgqSLBynJDo+0F
	y7K/Ur/T10oCOAvOpCnOy13m7PNtdgKkOeUa0RVklhGM4EpMcNM3RJ53qd20suPqp1oC+2TXqCs
	D3eYkooXrcL61ECj5gCSilTqWi8wflpF9N5NSzmBoS7wFIEgazsKDknNTvlPNks68Ev7xhAIpch
	0O8oEEcE7efjHhzRnHJFptADuORXQQ7qDjDjZukv64VBSuY8ykU5mx/XX5s9BKvNUtu2Iqkw5We
	+zXGcocUj86gfbZ7KjR6xDvjQwq431n5SHn99l5d1B4UE6roQSJhjt3CqWOPViqZZq+iOQihEuv
	dzOrSR4NAAczjuRuCC50lEhgkLG9X70ZUytzyoQlNYig3GAjEG9Pgi3BtchH2EXn5ULVYAfF+xr
	F
X-Received: by 2002:a05:600c:6296:b0:49e:602a:b4ec with SMTP id 5b1f17b1804b1-49eb730e225mr109105555e9.8.1789625743878;
        Wed, 16 Sep 2026 23:15:43 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9dc6-c001-54ee-4741-4927-0a28.310.pool.telefonica.de. [2a02:3100:9dc6:c001:54ee:4741:4927:a28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd23f4e6sm55558105e9.8.2026.09.16.23.15.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 16 Sep 2026 23:15:43 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Joel Stanley <joel@jms.id.au>,
	Brian Masney <bmasney+clk@redhat.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-clk@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Subject: Re: [PATCH] clk: aspeed: ast2700: select AUXILIARY_BUS
Date: Thu, 17 Sep 2026 08:15:39 +0200
Message-Id: <20260917061539.51943-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260712160301.98941-1-kmehltretter@gmail.com>
References: <20260712160301.98941-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 12 Jul 2026 18:03:01 +0200, I wrote:
> Select AUXILIARY_BUS directly, as other clock drivers that create
> auxiliary devices do, so it builds regardless of the reset driver.

Friendly ping on this patch. It already has two Reviewed-by tags.

Adding the new clk co-maintainer addresses to Cc. Is anything else
needed from my side before this can be picked up?

Thanks,
Karl
