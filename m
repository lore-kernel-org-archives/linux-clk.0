Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8917A32D0F3
	for <linux-clk@vger.kernel.org>; Thu, 20 Nov 2025 11:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763639565; cv=none; b=GaicOsW9O6rlKPr1l2IANfjcjL4jSqAJ2RmbX7lf89sB//bLMzdChQfraSMynPyUMTfPEpovWubYvqrdxj9aPioDvqP5CuV3z9G8Jkz/RR6u8mLB5bAvoddsUy7Z+f+RSCm+IEWTdId9HmjB9K/XhtXF9Ow+7Ogqp8nwm4gNVHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763639565; c=relaxed/simple;
	bh=p63LggUjA2Mwlm0TlfEXg8s8OBroErGX+ciNpQvn8mU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mT2NChGV+x2oO+ArZgT5+bDpyVnO4PGgst5SJLIYxj1DlQY2ptg6TkPqRv2lY4h6ftNYk9V9DLQEiNPKlT9HiEuqInw9/quyuQnVwYEJFn1ECTOwDc9MaVa7rQlPonoHe1hG4jmmIhM7R+l80eZTTwCnP1+XNWwUmo3avOCOfuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v7vXYeYg; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v7vXYeYg"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477563e28a3so5445555e9.1
        for <linux-clk@vger.kernel.org>; Thu, 20 Nov 2025 03:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763639562; x=1764244362; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4CHeyGudbu1LXeqUG0mQSvHnHZEWEYW2FGlxYtxIq8E=;
        b=v7vXYeYgYJqYw/UjdN5lk6IRLhICGZmAzB3i8GnrlDAW6EJBNVPeLAc7qSuQKqpTas
         BO8XaX36sJeHR52Nd+VThvlGrpuFm/zxZe9tJeU8c1GLIK9ZPfYG/kSfbajd3qWTM40b
         SgnMfSPIA8NlrUkjplFGKigIUZ4gH/d3+vUWuztaImDcsSJLVM2j0+eBur0zGanJ7QbS
         dpKUqsU1Im5jAjykQWH7eYNBWya+9/spgxmBXXf3XZYukn2Wvicszyz0vs2g0b+aDICs
         YgaUpfC6hltsXZAtPKtG9xvm9DZOnpWRDiUg5pnIbN/OfDc9bwv+IMrIoCmtXJCntWGr
         om7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763639562; x=1764244362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4CHeyGudbu1LXeqUG0mQSvHnHZEWEYW2FGlxYtxIq8E=;
        b=NIOu4/mA2FmgXySEW87Fqg7lMdsudSu7Lpe+HuopHxQHb+x14y4qHNiNbRJM6DrsFT
         x+K52RR57GJMHrJL6IogT1uKbiK/zeNBEOlNxqETKhSYOcf0gKtZk3acDwNFyE40rri+
         X383nQ2Aq92ROuPowajtntuJ9DxeusYcg3Gk3bYBCudH3SXTFtqBSo00WUC5XeA77g07
         RrmocC3R7Gfhw/Na4a9rQ/PDfapUD4Y3+8eGHtgJbJWhiiSLMNmy/He8C0oqDfgOFvT2
         ZiUZAFR2KWSxJHoreWNHIsGbc0mFk3Yi6DLx4dUJuTQZgAtde7fzHUbYTkAE5sj+qY2a
         +hmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXW/r/W4K7jLflUFEQq/CAM2AMqh2K7fEwXNdC5U47A3jzcF3d2X9Xe+gU7JQyJGtOxpe0OhpA1xl4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/zrpHcxtMWtR3ZK3ElZ4uMxKKZI/MByZFVanXTdcE62SlY730
	llV/cxZ6R1YaILXf0Q4tdY6+W/VGNSi6TgvYFtTkozllfO7WdtXvBraAHqYdOBdj/Pk=
X-Gm-Gg: ASbGnctJtpqa/FIds3rapwTLnqaWBwWB3IUtaaQaCag4jURe4LONF+IY6AtAt9+FpDx
	kqSb3ptI8tFICf1mCew4P2VwRPzxDj4Oht6Uf2uVKjFqtFmhmrhlv0pWIlRbjmwPLOLk9gi8SmW
	26mRj+/ZwrEeOa9w9FTHsUI7yY2mGSNoJWn1DwBrJxufMb7sWPL7AD3aQ/3NfisfzYFemVkw+Kf
	yFjxUPI4jicB/6cAskasg6LPsOr0blTl984OCN7K+G/MBqXdU27/Kr23NzXWPmkjwMBE2u/vq9x
	H6gYxLTXqB4B6mtH6UlfimPKLSV85/LbCDKPUznSqpVW77dNh81QOphQHObh0wkATChu+ACVxvr
	By5XAbUy+/uHMiBoNI9OQvUF9PyueKXCWr3zzE9bCB1f5OWSatCQFCKTr3TOhE+4sOZyEzGDFGj
	h8pii7zbg=
X-Google-Smtp-Source: AGHT+IFQPVYPXKXlC3tClVZjt8tudwUH2eZNOfDOIy5RAo7064xIrtSc2NGzDPCzYB2IJcqqv9ZM/g==
X-Received: by 2002:a05:600c:3515:b0:477:7a5c:6a8e with SMTP id 5b1f17b1804b1-477b9eb69e3mr20765905e9.9.1763639561736;
        Thu, 20 Nov 2025 03:52:41 -0800 (PST)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a973dbabsm65564845e9.3.2025.11.20.03.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 03:52:39 -0800 (PST)
Date: Thu, 20 Nov 2025 13:52:36 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Imran Shaik <imran.shaik@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-x1e80100: Use BRANCH_HALT_DELAY for UFS
 PHY symbol
Message-ID: <xucvtz75jqhnxlfsxceapa4leal3qj4z2zrulx4ucvrcqonnt6@ff7jkcg4obhn>
References: <20251119-gcc_ufs_phy_clk_branch_delay-v1-1-292c3e40b8c7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119-gcc_ufs_phy_clk_branch_delay-v1-1-292c3e40b8c7@oss.qualcomm.com>

On 25-11-19 23:23:03, Taniya Das wrote:
> Switch the halt_check method from BRANCH_HALT to BRANCH_HALT_DELAY for
> gcc_ufs_phy_rx_symbol_0_clk, gcc_ufs_phy_rx_symbol_1_clk, and
> gcc_ufs_phy_tx_symbol_0_clk. These clocks are externally sourced and do
> not require polling for halt status.
> 
> Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
