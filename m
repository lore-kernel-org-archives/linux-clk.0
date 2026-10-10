Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F8F3E7630
	for <linux-clk@vger.kernel.org>; Sat, 10 Oct 2026 10:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791626821; cv=none; b=cKq3FupBhjTICn45zckBoHpiP17XrvIAWphOkJGGQ1C3gASG/yZYQNnWM43+uLzRKkrYTWB/iBttY5zCrxZcIJHMkCStDFsdWCdERZm5huklwDS7rrDCnFiYMvIo6yeGEESx+oESALhunheXLnWrl2ypfbAMKeqzHXvU91gxTSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791626821; c=relaxed/simple;
	bh=G+OmJo6KHk1Dz1mbCFgc9+lDQS9rLz/nyFsb9jkmjTQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nxajhPou9gB9mZdFjOZUxN7NIU2+4krV8xwqvoU9Zybqf+dyUXelzN5Lmpw4pApRrXlBl1B3SXAfpwe6Z2acjhqN6otCz4U+Ml9jT5JHvufF5cBQvdaoJ8U1+NTaqfl06CBIlx4t55/muJL4vGlqDQp6MY0MIUcq8Nk/WoAeOzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=d68cN/PS; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="d68cN/PS"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c4649b3aaso273789f8f.2
        for <linux-clk@vger.kernel.org>; Sat, 10 Oct 2026 03:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791626818; x=1792231618; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ElWk8fKGydcvVdEATDJFrXGRGjE67AASQOUO8YEQCOc=;
        b=d68cN/PS96BgvaIVEbW2urVOHeTHY7+qz2vq3ZYroJ7w6D2flGUHlTYleNncFvf4vO
         puUb3WbeX7NaZjNdQ17BYEefqc7aCo6zwUFZ//ichHmHw2uvxkUYlqip+MoobynRH+Ma
         h46VywE+M2rCQUhdXxzsXBSp2DNt5+uNyLjvoh0yGSVenUen61/flVwvUqVCr3FtKWKO
         zY96L61c0UjNnt1Sxg1utoRuwI4rOX9hJdDjmmXYXprqHZJ+4cF2h3Nbq8Oc+v51FzEa
         VjFySdR3C4kLh7p/pvbtWP0Lrnvl8JKnt58lPu6Km54GKt3h6KTjcga9YUY+czD/duZk
         7xdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791626818; x=1792231618;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ElWk8fKGydcvVdEATDJFrXGRGjE67AASQOUO8YEQCOc=;
        b=jc9IYuo3AO6G41Vh1YimCdywTIQzZQblhs7IcIutxtefPMHclQPL2Jux0M5s/Uim9T
         9CkTCqMMCZ6DCUs2okYtJJldZyWuNYQr8Fa7cgqRcAmm9iUc7dri7gbWCNknjk4eWkDJ
         iXheP+BHMzZ7/8QWDIFiRNeE94TX8XA51TZk/UuTGAJUGXIr2NpX/TCxfYjb/wgJ6BnO
         A4gOXvTuT35jWOchuG/Zex/nna0Ro8yla2zHtMNvKkCCCt5e5NfjCxEUYGVPlNZoaedQ
         wa6k8E1W08Cxo8HKmMlsprufPVhjuTb6PZCNO7f7QKL37087FDq6nDe3BQJhpwTkBjPU
         NY5A==
X-Forwarded-Encrypted: i=1; AKwUvBwm99QbzkmoKyukt83zG5hytbq9ihN9TQg736GLQRA8GwPe68/oOViTE1Pe59L8j5XyuVO7OZnG86w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLv4oXxOd7nCpvuTslhKjMvwq6vvDEt1YOwiyaY+phlDVSCUIbC
	xeh149XlBdv0fBxQR1kfRmvQ0as2/YyFQjRNlypzM6bonLcncl7hgnWjlCkLTjkZ+bY=
X-Gm-Gg: AYBFou0d0TNNTRg8JSwb2jydvWegB1iGlcxRCq/wyR2ttWw/Qlb7iosirBC8UZ5OoEj
	Hmli0MBtKfaYEbGlUUcgkwMYceIc3a/ZgmzPkPepWQC93BuGCWNQqtCHNwmh2STzVwmoUchxuXi
	nLGTAQnMA1H7MJ1t9VnhsAaXtEjKgnLI6l5osNWSqT5/3lqC7gsyjDqBmSSEJKE1ASSQOaHI5SQ
	cag3TcZSWBLkSTyz4HRxLwkbPz0OJafazM3yYMO7fnh+2ExVKLadlzZKuiP45K6+6Upl3JGNlVG
	TZtHlI//vCjZJtKBXsmKkvMhnVD+IWcq6ZsF7eTeYgEMDLu0FiMI6I2wMrWnidgS1FPAXNb6Wb0
	esUl5ro9L5dpHJ7E8gj2VvUblZFazXRFL7MdW3gON+gm05IKaulL5moF8SNX/e7Vy0vVqHsPV+S
	3OEU5B3h4FFrV82D5aJnT2snVVURpX8jdyJLR60nOU6QPZ71olmB0iil0ZRrmNotYNlGAlcdiy4
	8TsJEeTuQ4ePj5Whg==
X-Received: by 2002:adf:f2cf:0:b0:48a:fe3b:64b7 with SMTP id ffacd0b85a97d-48dbacf6ef6mr5914261f8f.53.1791626817764;
        Sat, 10 Oct 2026 03:06:57 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ac6a91sm7389151f8f.41.2026.10.10.03.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:06:56 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lucas Tanure <tanure@linux.com>
Cc: Brian Masney <bmasney+clk@redhat.com>, 
 Chuan Liu <chuan.liu@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260905153234.133217-1-tanure@linux.com>
References: <20260905153234.133217-1-tanure@linux.com>
Subject: Re: (subset) [PATCH v2 0/4] amlogic: t7: give the MMC bus pipeline
 clock real consumers
Message-Id: <179162681558.457042.13976808955805070898.b4-ty@b4>
Date: Sat, 10 Oct 2026 12:06:55 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

Applied to git@github.com:BayLibre/clk-meson.git (clk-meson-next), thanks!

[4/4] clk: meson: t7: don't mark sys_ampipe_nand as critical
      commit: 363f97a1ce635b86be7fd263d56a040fbd87bdbb

Best regards,
--
Jerome

