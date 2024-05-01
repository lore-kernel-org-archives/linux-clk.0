Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4347CF3A
	for <linux-clk@vger.kernel.org>; Wed,  1 May 2024 11:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714564480; cv=none; b=CYFleHhI/qKTustcdjDMtkQ8/uWa3hf4FJnV1TLUlHbCt8GqAeEiVVvuJA3DFVbxlQvoFfjXpDNktPdZQP0pMTbt2DfeA52MNAMxuUG9R9QAqTBwGZwuiIPdFkEUbePJMVc+EuL8R1nq3uP0c6DfgGPZSrnb7Lum4pCIKXG5ArU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714564480; c=relaxed/simple;
	bh=VgLKkmgQwkz24VDfpIkR7Ysk2CwmG6rtIKGUvwJr2P0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QbxsoXrK13YdlMLIrpjDDqXbmLrkfw9X9/SlBvtwblomVH8Pmh8CT76dwJAG5QXwnSjREt6j4pkCNepd9CcO06zGTZMNBp4hNA4iC8V7cesq5CV/iddZqGInH/h6pOjgBatogkPPLwvYS+cvvDXAfPNunPCV2/cOLtemtXI6uRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qG305f/l; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qG305f/l"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-572250b7704so7078275a12.2
        for <linux-clk@vger.kernel.org>; Wed, 01 May 2024 04:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714564477; x=1715169277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWU5y5fq+7Sh/5YAl7I0WzeqGM8D5DqoKBNmDtAfIbo=;
        b=qG305f/lb9AJMQuRS9UYKZthKMnhVNFyInSeRDj44yi0rR4Yfl5Ze1xzMJD83ugUDL
         WXl9R8YOnqVpt+EkYm9e7lxXERl4QyAyhzzYbiwqWHfGGhu2c17L3MJ3H+VdXg/0XFWi
         LXLNm6tDt8Ry447DCFmb8yirTE73D7RM6iHEam0npJBneZnxsvPsvmv5LM9vaikDhab0
         brU7qzp4VisoydZ1gwIpqNBGg4mYNEDyzwTligLvSB8FMWTXbRKna/ktU2lNCzZfSbRc
         LKmTdvu7+1Q9XYw8IRMF+NKr+8WxI/XgzW1Y/spjLI6rrEXePTLje6h37sDtuEfDuchi
         iXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714564477; x=1715169277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWU5y5fq+7Sh/5YAl7I0WzeqGM8D5DqoKBNmDtAfIbo=;
        b=dIqTygXSH+MyD9M2+TZqm5zbEDY5DM+f6u2SN9MnU0w1IkNpu3iTs8DavY70KyuOKK
         ggmgvT23OKuy9L194aKxcFmfTtiBQIAfKTVBGwvCc2sfIzMfFSHDmxxsXwzTH69ebKzl
         cy8hGo1xyEfdKv7/mPEewoWQgPvcWsNmQZMDMjvTCOpkuVQBZsXUdt4rCyZwOLO1A4j+
         6k8xdss/KiPKsfA++ojF2EeOPqopUvybA3YI0J2QTS41JTUFXe2z5j0EqeavLKNLJuP3
         rALl5A8HgqspEpvLPg+nUyhj1/h+vS8ZgYf/svgUHERiIdI7UPSEXs4G51xoDTMDw9vD
         Ilrg==
X-Forwarded-Encrypted: i=1; AJvYcCUHpjjJ+iKq1h3af5ZMt8rP6fBDPQ2C8U25iytyhnIe7MzIx6hLiy4ee6pNLIUQUWhZE6wmGJgQBdHAXKlMlAGQpog6Peplvyf2
X-Gm-Message-State: AOJu0YzcjmKvA7tUoiFn2CXPa1jbRO8AQuq+bGVQYYWmB1v4tgKJqDKW
	2r+wS9Cibuy0Dbfb/eDA4naGpEtPTJzvCppy8jdb+eL/ZUAOB6jTrlFfCBpvSfs=
X-Google-Smtp-Source: AGHT+IFvuGfM78B72ca+Oa4xepiLh6v1yafhkqQhzAn8IImg9PFRUyZjFCtX26ZD8B0uUZkAFvpSgQ==
X-Received: by 2002:a50:9b59:0:b0:570:374:d6ab with SMTP id a25-20020a509b59000000b005700374d6abmr2113395edj.3.1714564477326;
        Wed, 01 May 2024 04:54:37 -0700 (PDT)
Received: from hackbox.lan ([62.231.100.236])
        by smtp.gmail.com with ESMTPSA id q25-20020aa7cc19000000b0057203242f31sm11334987edt.11.2024.05.01.04.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 04:54:36 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: Abel Vesa <abelvesa@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] clk: imx: imx8mp: Convert to platform remove callback returning void
Date: Wed,  1 May 2024 14:54:30 +0300
Message-Id: <171456445302.602991.15999220730191213802.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240423071232.463201-2-u.kleine-koenig@pengutronix.de>
References: <20240423071232.463201-2-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 23 Apr 2024 09:12:31 +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> [...]

Applied, thanks!

[1/1] clk: imx: imx8mp: Convert to platform remove callback returning void
      commit: f5072cffb35c122ec85d91ef327fa8814f04297b

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>
