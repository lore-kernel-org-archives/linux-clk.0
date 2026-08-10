Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340A83A48ED
	for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 08:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786351041; cv=none; b=of2ONF3dRjUpr5upogRW/nTz9xszwc7+yzOsNBC5k0uCUwWMkg7YjbEL0hAnBd0V6Pqv06PdIZBVG2LHWJMkYLX1mZwXtCrBTs4KHB1jMa4pGjPh2PnaoSW4+ic0OThN40V3FdPJ+xsUolylrud+xq1njicSdd5Gmiddsy2wRZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786351041; c=relaxed/simple;
	bh=n3M7vDB+4pdqtoiwS0EDbk/4OUWMutfgaBq4ohs9IUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6K0HNxOzC4iJDZjWJa/34xfyc5dm8T6VRW3Q5VApLci44U3uyOaNnJCbOrlUhmZyoXLmF0Cn13Wbu9DAV7YYploVbPKeH1Lik3zS1rB7HNf8jCOjGxzCDc2RdxKh81qexdWZPJp4QAPgste4VnOfE9r0uxaPjFu035KkqIaCs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZG3nsYu4; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZG3nsYu4"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so7898255e9.2
        for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 01:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786351038; x=1786955838; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FkxIlSiaSZQV6q19WHtk3rSh+il/+YXh4ZFHxv/IYH8=;
        b=ZG3nsYu437UhNB6PZXOEK0tGMK7fETFA7QBJbFsRtkT7ydG+8Ae+jtGTKYUxi59gRJ
         drqPKKQ/M9vwB2KQnMP67W3PhxHnkt63B7Oazn537nyjwefR8ok/lvT8BoYzKoOhfND+
         lP9DxPo1N3m7i8NOg33Lf6XEVi4lwcTgT2AnjTYNw1oj9O+gDn23AUjJDhjg+XmyO6yQ
         jH7sTN0eAHeuwYymOHYxpRZ0lcG01OpOVZyzMbU7MwPTMBTmsjjW3sQZ0OfPzD0Gp3t0
         SSYhDmw+KS/MOB8a+CLjHKKXce5sntI+rSy6pA1J48U71oPCXmT/z6WJpg7mxQW2QJSu
         o7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786351038; x=1786955838;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FkxIlSiaSZQV6q19WHtk3rSh+il/+YXh4ZFHxv/IYH8=;
        b=s45/00GUOVRT6gBh06/zRHL5PVHt5NHsDwYaefxZUAVelN+RoAEorgeEOvN2FT33Ep
         hyx2nFP6yzUm6S+kDMi8Z95Tj7MpK1M8mWyuDQ96lTpDMqQ1u4V4UYgf+pNEwZE3qHEo
         tTrI/ZeH+qX7Pq2UlLGCJt3UxafndJK1cdtDg5q98qsuc71NmaFMbJ4idu3/zdgSbOFn
         lPYkx8a9qLAyVXy1ow7bGjuOShS6UyfArJQsjv8O5WTBxUderPWaNSSgG5H0T7rDsyof
         JOBnCIwEz6ZkFbnWRHgBqY+Kbx/12heIhtLzJwOyhaFjk55WGTuStviXJovpKA4vz7c5
         wLpA==
X-Forwarded-Encrypted: i=1; AHgh+Rpng9CgorDSUxU3QDZdp3cJoWWeAwdDFyVE8lMcNlUwI2r4Lkfr+SrLYmy43cvfJho+9sWlOvs6/9M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhQoHweVB9rOn+wRTw+oSuh0m23Lnmp/NJYSt1Fg8SkqUxjNXI
	dM8lm2o547xwLJA8RzJewI6YAufOO/AMuJB9+Ue+JDkTKHkMzO2GCrOB5B1yq+QgHgE=
X-Gm-Gg: AR+sD10dT1uNc3Kqlrg+dZkge8O8uzY0+bWlnmwHapyAKQ+7CvXgx3YyV7LTk1QpiSU
	S3DDsb090zljgO21Hy4ZWcs7RE3tqYjxjwbvuKpH/OyrVaWzfpIsH6gwNSv1PzWIf9p9IYUx9Hy
	ws840d+Zt9GbgQwtO45ymn3ldwHaLqDG42sLu7sG7hmCseZJNrZJLipdAmd+48t3NK4Si0y6Cqe
	noGQiyfR1B7ebprwSFmOQ7DM/tOANDWX6EywjAdEMJzDZz4CoxW5T0W/rvR5q9wsVoN7iEaGwnH
	qCqMsKRHd9G83g+Qo9w6Fl7ctng46o15Yu9Hrp15m8GJDcoIjtCrKTofF/iQqQ9svjuGklXAktZ
	VQPlfbO0BQZmFxmE7iX4rgLEZhwFTfE+dQO7JQ6PznQWwci2eAoDYYGclKWTAcSKyTmxK2bF51k
	rc1KBehz54WEbhA4j+ZHjD4cd2twZJzWQkQQsojziCXGvSlk5ujnZxt/FZ2K/VA2CiIsZ2Mug=
X-Received: by 2002:a05:600c:35d1:b0:499:5e9e:1f50 with SMTP id 5b1f17b1804b1-4995e9e207dmr298923685e9.4.1786351038298;
        Mon, 10 Aug 2026 01:37:18 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:71da:59f:1cf4:ec2e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995e9f9424sm241232975e9.8.2026.08.10.01.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 01:37:17 -0700 (PDT)
Date: Mon, 10 Aug 2026 10:37:13 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Ulf Hansson <ulfh@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: mmcc-msm8974: add GENPD_FLAG_NO_STAY_ON
Message-ID: <anmNuXoOK7Xn73TZ@linaro.org>
References: <20260809-msm8974-mmcc-fix-v1-1-50f2dcf18d2e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260809-msm8974-mmcc-fix-v1-1-50f2dcf18d2e@oss.qualcomm.com>

On Sun, Aug 09, 2026 at 09:58:37PM +0300, Dmitry Baryshkov wrote:
> Commit 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until
> late_initcall_sync") kept power-domains on longer during boot which is
> causing DSI clock to get stuck and fail to acquire its configuration on
> DSI bringup. While this is being investigated, add the flag
> GENPD_FLAG_NO_STAY_ON for MDSS GDSC on MSM8974 to restore the previous
> behaviour to fix this.
> 
> Fixes: 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until late_initcall_sync")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Have you tried adding resets = <&mmcc MDSS_RESET>; to the &mdss node,
similar to the following patch for msm8916.dtsi?
https://lore.kernel.org/linux-arm-msm/20250915-msm8916-resets-v1-1-a5c705df0c45@linaro.org/

Thanks,
Stephan
