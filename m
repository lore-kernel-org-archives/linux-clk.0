Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AB42EACE1
	for <linux-clk@vger.kernel.org>; Thu,  3 Jul 2025 15:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751555441; cv=none; b=PvHRooD1p1W/BDPz9UwAEZ1WopiFqTTZbdBIs5FLR0eb21Zoo5mxWQ2K8/B9bJi42NTBI0jJe2CVtNQ/XKKn6MBsEsqOEHvWSvrwRYKdgQIg4o4LCoyl91MiX4jgCYmV7OjtCMurv7aH6BTAZrn1fgP0FWJu8jnaaseXixZIZ90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751555441; c=relaxed/simple;
	bh=HcpB7WcJRiu1n3uBKLFMvcSjTuFp3XqHuTv/XQqwXIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EupZuB2gjQUWSUuf4mY4hpPsEevNlVqMxurisuJefef+ZLJhtey5iGUWu5cCAIsQUzDZBn8XHqJkTNdnlg+8IpteBEtDGgBJ1E4W7c2PlM33gcBc1YWVVjnWNoPB3JB9bSfjCsVLqQVvvhGwN4Hn1gkiHk5+Vdes5zBaU26I960=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iAATeiGj; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iAATeiGj"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ae0e0271d82so1466723766b.3
        for <linux-clk@vger.kernel.org>; Thu, 03 Jul 2025 08:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751555438; x=1752160238; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gBhYZEvvr6wT0rA3y1ifWP+OcQau5rDJJM6LpP/dVA0=;
        b=iAATeiGjUj5uhUVs20MUepRI9IH5zG4tHSzWgr2pgAIJ+nABbJ629e0H9W8+ytanES
         tSXmDUzZoI2Q7qnuxdghkJejmZQVKv5yebZ5TS1fJakh/HEiLerx9cAXRBM9YRzOWhzk
         r7fSME2UlGXJeUNLMnK1P4kf++Y8UEVFBbHzsoyYb7KRawKcWZNGTLsgjCqVwbRYT2vQ
         BO8fSwWyvxB7RIiZHOEESCo/xCcYxRta0h6/7SEAEzmJGoNK+4zGNstWB3wAItbjQU8v
         A3QkiHQsI0m5eMkaKWQ0ZbWGjvxovP/OwbRFZystR8ZEa56hFc2U3hMBmFhqvAcVtSC1
         xzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751555438; x=1752160238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBhYZEvvr6wT0rA3y1ifWP+OcQau5rDJJM6LpP/dVA0=;
        b=e/ukpIlDnHJY77CdYlPBBNPk/eTYJgT249X+K5oltS/O6+sR7KilVZp3mhW0qDOhn2
         nE/hVD0vaRWGdEMBI5a6TGu60FsyexFUB5DHfVE0E3V7awVgv8ZmoFV8Ysa/J1N+aUst
         4Ky3gujk0GWhTkFXglV7xf4xTPVYgF78MbYu+X1m27YdTrq+KsPwg4Blt0az/7IYb+rg
         KE70/trmPq4JedAYQgUdzWPOfWZggEnSkM56mnEk8CN83/VQJCU7q57dLgFNl72D2Q6b
         Qb4ikLY9E1g0uxDtQ+sNq6mx0Whupnd7o64zM9kTNTHD9MpwODb++WGRnoRA6c9Y+RKI
         bPEA==
X-Forwarded-Encrypted: i=1; AJvYcCVWt4TM810FF8oua+rkMcbULR2FKsEjLmeyahLfHnwwp1UczTmEodETWMtZp/Vfh11ePX+rP7jl2go=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGeoeazyXWbYHxHZImhwgsXOh+NfwTJxva6lOlmYHyFPvzZUwK
	hI66bfzmGoB8xJk9NGbRS4R6JX0BLurY4HB7btdLIScrZ7fIHd7c4WyTdSg9hVI/RI4=
X-Gm-Gg: ASbGnctCHN5CZNK4H3xEtwjBEv1ykIaJFGZBAyugNlPHFnjNObfnKJuQiUEPPZNoq0v
	bXd94mU/38UiX9tOmp17Jo+ZkSGaBP/n/czNnUrZepDfAty4JgUjNDft43o9ica1pXI1EeotI05
	17bF1uIceh/7VSnTcpnixqTix6ck0WBsLYHAkaUgVr0f/WLLUdSbmtWC5jzb0uyh/4YcTKwDmsL
	17lnXIEEv1FbkXXQreLEc475N2D/FGiwToiO3VwCWeyMS/6YkD9HTABrC4Uk2cv9SdAoO8AlCan
	uUnAQmtSrlZWLqpfzh8KGBbLLO6Ugnu9ANDxDnDkePHVQRdQLcG0Q9umMVdQieFLX0WMFQ==
X-Google-Smtp-Source: AGHT+IHFWA0SjfKo8Q9HvR8gkZ0iZby8sEu/tE1InGy6IA+SPlppSiNPUeimMeEYtk+3MIxhso8xqw==
X-Received: by 2002:a17:907:3e0b:b0:ae3:bb0a:1cc2 with SMTP id a640c23a62f3a-ae3c2aaedd7mr750188166b.19.1751555438164;
        Thu, 03 Jul 2025 08:10:38 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b369sm1274968066b.3.2025.07.03.08.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 08:10:37 -0700 (PDT)
Date: Thu, 3 Jul 2025 18:10:35 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
	Frank Li <frank.li@nxp.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] clk: imx95-blk-ctl: Add clock for i.MX94
 LVDS/Display CSR
Message-ID: <aGadazB4LbRvk1BM@linaro.org>
References: <20250703-imx95-blk-ctl-7-1-v2-0-b378ad796330@nxp.com>
 <20250703-imx95-blk-ctl-7-1-v2-4-b378ad796330@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703-imx95-blk-ctl-7-1-v2-4-b378ad796330@nxp.com>

On 25-07-03 11:40:23, Peng Fan wrote:
> i.MX94 BLK CTL LVDS CSR's LVDS_PHY_CLOCK_CONTRL register controls the clock
> gating logic of LVDS units. Display CSR's DISPLAY_ENGINES_CLOCK_CONTROL
> register controls the selection of the clock feeding the display engine.
> 
> Add clock gate support for the two CSRs.
> 
> While at here, reorder imx95_bc_of_match.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
