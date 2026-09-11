Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C558D436BEA;
	Fri, 11 Sep 2026 06:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789108832; cv=none; b=WE3ad5I8O1w9THYYibXED/ZsIa7IBtq25ARE0cqqNVUKwj4BJQ+LVjopGm30lo8WEmSHTCUN2UUiLI9ycA/ia/iXRXx/k2bYYZ1JVPbEvOQtxi1BQuSlW3AYzti1eSiThMDW/oJX8YoCb5+ICr4hFU1GrBE4fY8QJlU3shOGZWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789108832; c=relaxed/simple;
	bh=EMMBVGM8+XcsYubTP7I8vhnpG+VLRkqfhGi35MfCAc0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RBn1pwGYZW+0ZC+vn88UaycvgIReawDG78l0AcXL0G9ecN9XNvDJS7Xk+tlRtpOwg6eeks3mwXb303nRSxXdPuSe3zQXPgJezKukQos9HAGAm6sTxAWzVZ6hWekxS7df7JWV+R1w1c0BWQv4p5hhRKOWp0m8EQxFnUQnSyRkfFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [14.220.232.127])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d637da6b;
	Fri, 11 Sep 2026 14:40:15 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: taniya.das@oss.qualcomm.com
Cc: amadeus@jmu.edu.cn,
	andersson@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sboyd@kernel.org
Subject: Re: [PATCH 1/1] clk: qcom: ipq8074: set BRANCH_HALT_VOTED flag for usb master clocks
Date: Fri, 11 Sep 2026 14:40:10 +0800
Message-Id: <20260911064010.3140984-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <21cc9c5a-aabf-4ab7-8f2a-e8f90d5fb2f3@oss.qualcomm.com>
References: <21cc9c5a-aabf-4ab7-8f2a-e8f90d5fb2f3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa08f32082a03a2kunmcbf5e3e11dde9b
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCHk1IVktMGEgfQ0NKGh9DSFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpJTFlXWRYaDxIVHRRZQVlPS0hVQkJJTk
	tVSktLVUpCS0JZBg++

Hi,

> Fixes tag?

This only occurs on a few devices, so I didn't add the Fixes tag.
Should I send a v2 patch with the Fixes tag?

> > +	.halt_check = BRANCH_HALT_VOTED,
>
> BRANCH_HALT didn't work?

I have tried these:

BRANCH_HALT - still has a status stuck at 'on' warning.
BRANCH_HALT_DELAY - No stuck warning, but EMI warning
may occur once: disabled by hub (EMI?), re-enabling...
BRANCH_HALT_VOTED - No warnings, USB working.

Thanks,
Chukun
