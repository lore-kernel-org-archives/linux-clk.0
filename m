Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5540A26CE05
	for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 14:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813625; cv=none; b=ffv4Bl6L0xLNTECauLndiQOOv71Csqa68NCYnhpKd/ywHBCK3dtFIdF/WO8J5jDRvf6tnbel5oSCbGIZUxILlrzzF/VgWA5HNvsiloLSduevKhmlzTrZxkQsfhSlUTaxAfLY0QeUCQe7QGJOgnmnf0cfXn60c+zybDg6DKWbjiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813625; c=relaxed/simple;
	bh=aa5DERomGGvC4qLnGZLTEOZG21c+T/FPi1X9gvZMK+c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZdSq077Ia4Vh/i+kpP3QovjB990yam77LtZ1pC89hcrLMcGo+rer4P/geV3i8orqKyOsUANwo0EIQs1+QcRNu8VFbzG/PwvFDpDQf64uu3TcJep3PjsXRJ9TrIg+U6KM8VSWtbbh90DAB4PIfYLkYR7ho2Nq2oVdQkgGIaAon5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=lu6vWgvc; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="lu6vWgvc"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a0213948d3so11949275e9.2
        for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 07:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791813621; x=1792418421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X1FOHZ/aarWttDJsXYH5g4xTlMJF5XYAWbfKp7MZzrk=;
        b=lu6vWgvchcpBFY5SNlqPvGSSmfvvdX4X5c7xI+C0mmQ3cAmkXZrrCUmB0s9gH+91fV
         dGQcDt34QdkoxOt52cMwPJHxVnVGqunZjf812+SRrIKhsbm6EtLdA6UWPRqwtpz1Uk5l
         +p9K9yOWFIpomCKOw3cT+45TnakRZxWgm1GrVYmR3UgQy+J2TFwfgw6WdRCSy2yx++F3
         ylxNYYCvZrPjpPzHazfsZgYY5arKRdH7XBC24ToG7Hy8hQnJMdbdSE8G9Jm3FS3mMj5/
         Ke7ATVSZeuVBgIPEha/fH0Ban1JLx5vdsr9HkZfMQQQ2OSPmJE65XmmTcxvzjqFw5htW
         hWNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791813621; x=1792418421;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X1FOHZ/aarWttDJsXYH5g4xTlMJF5XYAWbfKp7MZzrk=;
        b=aETb7ZGX2ryHVrrnIZUeb2xbHIbI3lhJSxfqDvMEOAo3YL1PnibNA8meBFzqjfFYJP
         x7FUUlVFhs7BQycaxc+Hx2Ap7GHbuEkeecE2oWWxYG+o+kencRMQe9BfDYAUfQ6h/YOX
         cyZauoGu4uyXXfyOUOU0ENKVuXCEkCWzDJvhbUf58ZP7V17Vi7N80NAtwIjtO4qwbArg
         TcWsnLy39+JHj8W1HMK4ae3R8xxJJGeTYANVdt6AbIoiQ/7ACMnF34BjQkbZL0lcUFks
         eZJLBnCN9wK6pzhdlcNaPu+VVsYjXCs/Fo8s56RJRWB/l/CiKMLEVkiQ4wXedFFD7lyn
         VO0w==
X-Gm-Message-State: AFq9FYIWtSh5RehyGn6ZPWSQ8SpkPzPyngMxAA2Ru0r+UXDhxYrYUbwq
	UodeAD0zL8ozCC+xJFW+LusyTz3aWNYoqpwkx4luTPaT1KWnXskwchfK9vS0XPogwyg3XdEUh0v
	cPTlemAw=
X-Gm-Gg: AYBFou0t28F0SJUk7VZReszT7L8sOAGw48ThNm5mQ5kuE7AqOWCSXU3bw6UWx77GWEr
	dL2aDQ4VxgkdeGlFQ4M0hPS1zTX3v+7jQ7Dq1Sn9tV5F4lH5CwRlal6LoD6fMJCizPtBxCfq4yz
	MY74C4uqjSyctCeGAaLMJHa+5qJ0BXme61oL+wN3hzhh597PczuM2SplspvVxL4IIV0vVc+4pXc
	eCevnKv+/l3qziisjSwtcHL9Ze2wO+NS4oDEjj23LYyBNxsDe9Yul7MONHuBsYqEaTnvK14rNzh
	OlwClDN6QmD8PhZZDmoKYHlOLMjNN96Qg28JMc9AZAX04iQ+sKVmOkv4XfOyYyfr4wZzPnsxdId
	eOyHKLCfO7QedIk/+dv6tIrnIVUwWqpEQQxWhNmjlbRxWQopNgb4xZtJ6mJU8eehIMCOEyHeOW8
	R+pkRlgjKqhF+lmJLi+ktQFeIxRNEOE92Pm+8Kd7/WNLtvhEcowpEU2lShx6LwUu7Fqi/letSLf
	L/Piii96kmwH5Qt1g==
X-Received: by 2002:a05:600c:a088:b0:4a0:2644:80db with SMTP id 5b1f17b1804b1-4a18e4d55a2mr179206085e9.35.1791813621497;
        Mon, 12 Oct 2026 07:00:21 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ab981asm20197430f8f.30.2026.10.12.07.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:00:19 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 gabriel.fernandez@foss.st.com
Cc: linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261012131859.215240-1-gabriel.fernandez@foss.st.com>
References: <20261012131859.215240-1-gabriel.fernandez@foss.st.com>
Subject: Re: [PATCH] clk: stm32: fix clock array size for STM32MP21
Message-Id: <179181361097.33566.11163084689857836132.b4-ty@b4>
Date: Mon, 12 Oct 2026 16:00:10 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=186; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=aa5DERomGGvC4qLnGZLTEOZG21c+T/FPi1X9gvZMK+c=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlnnn/a9NpW/ihXqd0BQdk/jza5dC680t825+WcdZfjt
 KSurgu83FHKwiDGxSArpshSw10t/k5S68us6Tq3YeawMoEMYeDiFICJKE9kZFijtTo89LBn7NeG
 3pPeBScT+vqqkr6F229zO/r80GTe2FpGhn5urf3rMkKSGfcaP9r8Ze/FWpc9tyc92Lk0e53QOrv
 j31kB
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Applied to clk/linux.git (clk-pile), thanks!

[1/1] clk: stm32: fix clock array size for STM32MP21
      https://git.kernel.org/clk/linux/c/57e9b2c11056

Best regards,
--
Jerome

