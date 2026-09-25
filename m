Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064AC4A92F3
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 14:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790346768; cv=none; b=iICCB0ouYSA/UYs/wM4ULqw5xXbCmUwm+fJY94Ss+WK1oFI+DKWfNbaR6cGhDq7dxR+o+86CGwqYZnLEveoWKlO0CO1wrPw2WA3odHZze1ske33Mtw17dhmqugXWlsml4EipV/FGTSp7UvifgzEBsWOy+2w9+k4M+C6fsTYRb6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790346768; c=relaxed/simple;
	bh=JfjNdOkV6czIA57rgjyzP2vkzS7QeX8zyexGClAHNV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EgcUoBKkmg+bEcF+nY+5rRuFmWdJTYKcT3Tf5r8NbHCLW4t6TLUvrejXnlOBBOXMcA9yyO+Jj5IjaUlLL/+bE1D/JlLbFmHp8pRKl8mAQ6I1I0RuzKdiBvpBobuf/WyF3SskWdiIz8DXytmE+NwCo4lVJi3aIryOjb0xoVZrtx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hR6z2bMD; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hR6z2bMD"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccead2aecso4748185e9.0
        for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 07:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790346754; x=1790951554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/6G1/nB52qdf+pNA4653UiqYpDMxleEfU1TnV94wJwE=;
        b=hR6z2bMDq0jmYglEjbKA6Xre+kvsAjX8/IzpTm1EJ6QgiwpvJCih0EXAlrxlJz2W3A
         wJZ1JOw9THj8GCx47p+kfz36Y/OzHfp2zob0r2RoDe884ozVMZ5HbVVJ1ia61z70EGMe
         PHefQOn4mO0HWamibHpSI2VrdReQecoqKdUrQFB33grsv5u6DfeHyCJDBrIN90u3oY3j
         N0O1lKaMOfm3rLwF9lZDOMBfXLfVbrDaSnrCGejig34YxvmBEYnumAZ51grxe0aj63nl
         ScL4wKQ5r5UD4OM1EBiOmvSQb+IAXAoVltLnaKAFjsQRIGBbbHNED7YxycdxVDtqWsoS
         Yriw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790346754; x=1790951554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/6G1/nB52qdf+pNA4653UiqYpDMxleEfU1TnV94wJwE=;
        b=kSGsrsaAblvO7lQscnZ6mWMBcRRJFGiqh2DQZ0P2dFGF2rUOJrcXH3nUWpA1MUDEU8
         /sGfllJYwos4/excqyDan6xTLkbhwQYWugeA+s/4c1Nb1+r6q3LMrR7DeCo/NS2ow2aM
         8iCtx8DJipu5f5qDIsr/fg8cSYkZCMAq9/ovIVhAcpsfKSX4oQuOhClwBmhlOj1HZEPg
         JAwxghnEcs/wIYsxEG+IR5mYl3Ddpi4ZD5zHxyLDhMv0AvDJWtDoZ5QLV8QqfILAXPsb
         GHExucWIIGVQ0Fs+s52AIHTcbTvl4qYTHdUpG0ZNYnZy6S2TptWkKpIBH8yE9Hx5Hdml
         9Qyg==
X-Forwarded-Encrypted: i=1; AKwUvByBh3unD3re42/b5lXu7vgSd9XR7YK8RuGRstcZqzKDO7lxfYz8z05/7ZvD0XTy4bODf25kXe9DigQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lTQri+1zFJkpVVaJ56RZiG/RCiTYeFK8JGUYm3dTR3BPiibKzn
	mzMFu6+pMz8tL6OaZFJ6LaaC1Y9I6MWAF/FIiEXBEngpp1SQsjT86CUf
X-Gm-Gg: AYBFou3WVHtQ9w/zTZ7J3y7dngR9D/8KnpsqIYIQ2Wb5l3R2+id8baAY9aKrjAhKq+H
	eGBDkJ2JAg9etwjTUQvLUHi2O38DA6K7YOB3pODSk8t4aYVvndA8ThxmGPJ5qIJFYXYL8EpHvzJ
	LPwzWJKv60jn13f2qIbSmeatX0UnpfU/wHx1MmYIjMRMXevvEJDfGLOT3IGsewn2dICpRp1C9nY
	MLh5MU8KMYns/uOZAL0UYwsRogSYfpFWf64cT9it41PGqLpAlXT3wDd3BSNEldsfW+9mpHerVv+
	E5UYiVisfpNbp32tMxK2zMR4RJ2fXbx+e60aNfmUz0qWXZg4EU7wOGxBZ3Z6zfshE0e9OAYEHWX
	0H2N6t9p2/Q9z9e/Mbe6fxlgMo67/Dl+cHQkc+zdIYvT4vfF+ncHVPQOPI9GiiAm1yBrdgToaMs
	nyxUEJSUOALUULKDbClWRILVQcI2p7C5N+oyRX8kVg5lkv8GHf6I2IrCj6v3pOcCbh8FC0uVv0q
	/uF/9rutR1YEDGMlwUNTcbRLr+fwi9Fq8U1RbxHqyjICXoLVoaJ
X-Received: by 2002:a05:600c:4f47:b0:49f:c199:e1e2 with SMTP id 5b1f17b1804b1-49ff06ed9c1mr51897165e9.28.1790346754282;
        Fri, 25 Sep 2026 07:32:34 -0700 (PDT)
Received: from VivoBook-ASUS-X712UA-M712UA.lan (public-gprs197761.centertel.pl. [46.134.111.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm7034706f8f.35.2026.09.25.07.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 07:32:33 -0700 (PDT)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Gabor Juhos <j4g8y7@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Jie Luo <jie.luo@oss.qualcomm.com>,
	Georg Seema <georgseema@gmail.com>,
	Mieczyslaw Nalewaj <namiltd@yahoo.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v4] clk: qcom: ipq-cmn-pll: keep the CMN block bus clocks enabled
Date: Fri, 25 Sep 2026 16:32:28 +0200
Message-ID: <20260925143228.386299-1-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813093351.178419-1-kuncy7@gmail.com>
References: <20260813093351.178419-1-kuncy7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please drop this patch.

Gabor's fix for the same hang has been applied:

  33f9cb56cc28 ("clk: qcom: gcc-ipq5018: mark 'gpll0_main' clock as critical")

It addresses the platform-level cause: 'gpll0_main' feeds the CPUs
through GPLL0 during early boot, before the APCS clock is registered
and CCF can see that consumer, so the first driver to drop a runtime PM
reference on a GCC clock under it takes the CPUs down with it. The
ipq-cmn-pll probe was only the first driver to do so on the AX55 v1; I
had verified on that board that Gabor's change alone gives a reliable
boot with this patch absent, and OpenWrt has since replaced this patch
with his in its tree.

That also answers the two open questions here. Jie's suggestion of
making the GCC a consumer of the CMN PLL outputs is no longer needed
for this hang, and Konrad's question about crashdump mode I cannot
answer: I never captured that state, and with the fix in place I have
nothing left that reproduces it.

Thank you all for the review, and Gabor for finding the actual cause.

Best regards,
Stanislaw
