Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728E336A018
	for <linux-clk@vger.kernel.org>; Tue, 11 Nov 2025 15:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762875996; cv=none; b=VrC4GCKaCJ6JimvGEZKG+RJ0PGS+Cymolp3s41qvGU8NYj8ZTtLd1ueDcJfrsJ0aScKyBZsEOUJpULpB7rrGCBXsWVyOWbbxRIAixoWtKGy6+OtrE1hU3zl33Zdo0n+yRsXiqvTut0lU2+ZNOTYCy/3mDZo5hU6rwm29ngdsHGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762875996; c=relaxed/simple;
	bh=ERnZBlwh830mwLoldZOqqvJ8QgCiVP3NFpUKwuH37cA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rCXA0iDXLb1A8HWEon//klEzACepOo0WoTc+LgyJdKt7HWwJVEQeAh7F0QhTb2DPWOjD4GfFgPJrnQPOYmQ70/ku5+JoEKZWOwfmihXRSqLKYfK5kxdu2m6gDiYebct4uKWDP4HbR7ySVsx5J25IUUAgz+h3BjeQJDoEjETs0iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=omyOI1JR; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="omyOI1JR"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so34040025e9.1
        for <linux-clk@vger.kernel.org>; Tue, 11 Nov 2025 07:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762875991; x=1763480791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1HMARtZJuraEYMooYga7m65rMsGPE/c/b4abR0gmXnI=;
        b=omyOI1JR1OwCPno1hh7iynWwjPSUPnsHTuLs7XAkTkegwPGmk+u1ujJX3gvpuQMggG
         sMATcBSHG7XeihnfgwzVMo0MXjmqtjeMMaPa1oc+z/xhpsfkmRDqmuntMHMAaMA+tiZU
         M3nFybxoDrJjmyOplO3UHzSOamq4TtSirI5n+t+G6n6MtQWzTjL7SjGkNG9+QJjOX2SK
         yVkD3amZ62tindxmNC5OLjVFpsE8Fw3MgSJndThEkKvvlmKTeosGgC4xK9gqnVeWDoVX
         3qnjPCU1X4T+TfKi/P0PfYyJs31tsiG2ATPq5lc35RxDN0CLUytVfCyWqLAzKZyOowB0
         w7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762875991; x=1763480791;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1HMARtZJuraEYMooYga7m65rMsGPE/c/b4abR0gmXnI=;
        b=wFwyZgALkFa3gRPO6cZ3ZIOtZ3qvzAHut7MJTEjJEtIh1A26oFTRowkxnJIuuV8tdw
         RxKfjezevAwjQzrbNqOLemothc5/wMgJjTL0NontRL6ML2cadYgg5ErQI0MKMSzwXIyZ
         flNqOGEDInEqXVrJQ0m28bFC1ZoVcU4k7EeVW7qUuhol/EblmkiYLSZkbRBhZG0Qhi4n
         CyA5y0ZaRVbPicfMYApIOQDc6qdaf5t/fJqXm+7e3NcUTowehDDxZ/Ucg2PTpYvlvXCb
         CmavsMbysmQRBrud9J3KMAmVtijtRRb7gx4vFwzhpa0r8N/bYbRCTL2Bk5W6O3BWPcQ3
         jTsw==
X-Forwarded-Encrypted: i=1; AJvYcCU0e7M1ox91Yp4mbkt8DkvDXhHAXKsNNQJY0GPnR3psbVugStH9uFBPtNoOZ1RowETGOHZKXE9WjBo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMOw5TbGplAoj1zsVJHLU6R3ZQi7eNEsyqVhLicZuI5oDFaOU1
	BinS5EkCfzhvhm7t1wlno9SHyWhf0JQK6tNe8TtSfTVGPhO7ilHWw3OfeUiy9+mJCmw=
X-Gm-Gg: ASbGncuLC4m9MppyhFg8ZKKau6/bqpizAgbPQ/ihCSlJp1sN4plNSKAh5OcFUA7//nd
	DbSXNTXtBVYfHi5Aph+Q6AztwYc4xAc/MPuyZlEneVnPPiCko8MZFBJLZicZ2MJ8cLh9rnlMEnG
	cPHmcSJgYp904/ydkrMy1IiY+34ziF+zyyFiuxCAULUs8OqIUI/0L2AJSQgq6VOiFuqRKWQsKPE
	j0XTATj3z/YT2/GseRtecBdel4bU2lADqNlZ1tKgWpKq9UIO9oI71lp3qjFzIEBKgyI0hvzi8Qr
	cCyB5YXw+KR2j08Tt3uuBIVrADlWu4RDAHSVK4p/W3RfB6gTY7K7mndiqyAoDMC3u/qjdyYynNv
	D+DEF3hWvq4JEY6wth4CIoEWRSnkr2709LVaBKLSgBgf6Tgv9joHFaXyOfC+VkiVyHQ8JxLADoQ
	BNMebdsold
X-Google-Smtp-Source: AGHT+IG/mjf20bwbB9ulOVh4z563amE05UyfIyNIY5aYHGSZyB1LNnu3YZ77PJ1u1Qd3j2JGeLOsNg==
X-Received: by 2002:a05:600c:a41:b0:477:6374:6347 with SMTP id 5b1f17b1804b1-47773271aa5mr102937745e9.22.1762875991319;
        Tue, 11 Nov 2025 07:46:31 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775cdc33bdsm377541625e9.1.2025.11.11.07.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 07:46:30 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: Abel Vesa <abelvesa@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>, 
 linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20251024-auxiliary-v2-1-a353dc9e6b1a@nxp.com>
References: <20251024-auxiliary-v2-1-a353dc9e6b1a@nxp.com>
Subject: Re: [PATCH v2] clk: imx: imx8mp-audiomix: use
 devm_auxiliary_device_create() to simple code
Message-Id: <176287598917.23558.10560877169801867963.b4-ty@linaro.org>
Date: Tue, 11 Nov 2025 17:46:29 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dedf8


On Fri, 24 Oct 2025 09:45:51 +0800, Peng Fan wrote:
> Use helper function devm_auxiliary_device_create() to remove some
> boilerplate code.
> 
> 

Applied, thanks!

[1/1] clk: imx: imx8mp-audiomix: use devm_auxiliary_device_create() to simple code
      commit: 9d97a2fe48ae77976baff441edd5b30ea4e179c0

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

