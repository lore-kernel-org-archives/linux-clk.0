Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16D31527B6
	for <linux-clk@vger.kernel.org>; Fri, 21 Jun 2024 06:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718951242; cv=none; b=bhbyViyWJxz9cNbvFIrZRViawe7Exi3UF2r1NezHGg+a9sokPz0m1XOyeBID5B/aGL4ufJeV27PhW7+ra6gONsW5+bs8hfIhmpLeXA5gVStJsUhqG15JsEwF21FRN3Jh4yAQCIvnxhhlIyx/ejY5alUWyLTd3WKE9EupB1MCWHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718951242; c=relaxed/simple;
	bh=O6MjZswWxwntHXClsDM9YbpgAlLq+nr38VNJ9W/j6i0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Nv5V07lDz/kVdzqQiw+Z5vydyYCpJNd/tm8mODUC23TEivPsPsZh26O3GF4GN/dyh7l2y96eWWnDRfqSb5QsWYZekg6CeXyuJTGRFTODwpUvrWtYTvyHDaW+3dUqxLrPluYKmTV3emwIAzBNZEDj9H1zn5Yj0RF56GRA7EYVwKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ivbd5374; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ivbd5374"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-57d10354955so1684669a12.1
        for <linux-clk@vger.kernel.org>; Thu, 20 Jun 2024 23:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718951239; x=1719556039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qRT2G8wEhc6dH4aHQrzIOLEXVG/hN2dtlzKi2u99ZHg=;
        b=Ivbd5374tDuC37JxjpomV/E2UDG/THeUhfRqkigOXwCsPtsIylemiMaACr6zgqTZ/e
         3NdjXRIvAw7eJPLa8vPVmlTRw7mraK8C8G5PbCQesD3AaepBq7cCTlNZayNiK9c8lgz/
         J39gCLbVFyF64C0+xYlmkNJneYnYrjA0BwUA65uEA0fYSz7AZvm71NukDb4Cyo64rzKL
         O3xXDoWwutlMbgODid/nlWNpEc9pdcoB6V+tioIPriq2rx1dYWD1dGnc8tiVUIyJgDih
         +SkCgfKgcv+L+rDfGZqO+5PIzLa8zsd6lxc0gPQ0hMnvn8HoxZmDEJ/EL63rGHxuYovu
         RnXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718951239; x=1719556039;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qRT2G8wEhc6dH4aHQrzIOLEXVG/hN2dtlzKi2u99ZHg=;
        b=wVo/ZVXpDgPrejEauAiOcp6kAWKwzhwFCMKPIluan2RSBzzeWTuu59YCpkEhNHYoVe
         RcUuehYLrigLdE9YajJhuogXKZcxYu5xwlx1a0nx1sdPlCYMkSmQS+ts6yWuV+z2sM9a
         tdjfLMwdpPa95M0HH0K1cezJKylPwX8v9+Tso3THgt6OCJCoxwLm1uvVMmbPa8E6CWWC
         ulfeQaq5+dJVw9PWzc/fVYqNNzUGbYAbqq47QJDT3YhZ59xCWymdXRWi1PUEenuwjls4
         F7V6mgM5hjx7CCqYxixlYiecwqfhHHb3v2rtbMPe6LEShrCaKjDeVqpEurUky0iZTjJA
         KENg==
X-Gm-Message-State: AOJu0YwVudkpxYtaCfOsSuuoLweREbcJ44Qnz2k73rOPcCVTP5nVgiE8
	EhN65aNdAdMb/wLsWgOlFzB5u7sA1PqhDRVZSkQIrkKc6SDLEu+eEGO/OTk/nOw=
X-Google-Smtp-Source: AGHT+IFAv88TzuxiL/3SxR316E/tKMIQkz0tc9LuhcKrKV31IpsJ52gkEFzP/J41BcbE1yC4bD7EVQ==
X-Received: by 2002:a50:9ee1:0:b0:57c:abf9:e6ad with SMTP id 4fb4d7f45d1cf-57d07ee3198mr3680772a12.42.1718951238856;
        Thu, 20 Jun 2024 23:27:18 -0700 (PDT)
Received: from [127.0.1.1] ([82.79.124.209])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d30582262sm470860a12.94.2024.06.20.23.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 23:27:18 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, Lee Jones <lee@kernel.org>, 
 Sebastien Laveze <slaveze@smartandconnective.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240528151434.227602-1-slaveze@smartandconnective.com>
References: <20240528151434.227602-1-slaveze@smartandconnective.com>
Subject: Re: [PATCH] clk: imx: imx6ul: fix default parent for enet*_ref_sel
Message-Id: <171895123748.3617543.12435143750010864537.b4-ty@linaro.org>
Date: Fri, 21 Jun 2024 09:27:17 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 28 May 2024 17:14:33 +0200, Sebastien Laveze wrote:
> The clk_set_parent for "enet1_ref_sel" and  "enet2_ref_sel" are
> incorrect, therefore the original requirements to have "enet_clk_ref" as
> output sourced by iMX ENET PLL as a default config is not met.
> 
> Only "enet[1,2]_ref_125m" "enet[1,2]_ref_pad" are possible parents for
> "enet1_ref_sel" and "enet2_ref_sel".
> 
> [...]

Applied, thanks!

[1/1] clk: imx: imx6ul: fix default parent for enet*_ref_sel
      commit: bb2c2aa7db67d0e13adde59c823606eba7bb06a4

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

