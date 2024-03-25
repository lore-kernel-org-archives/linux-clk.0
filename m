Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C6C149C6A
	for <linux-clk@vger.kernel.org>; Mon, 25 Mar 2024 14:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711375846; cv=none; b=b/+myQzbP96B/GWK4aJyVCd4yl+bGH9Qyhm/+ramGoIIm4/xViGmbi7//SALwbUhorL9WQG5cse4GQ74GpbsBRRWZoTFOtGMdvwcrNmoypPgVXpGtjplhDr2vc1/fCmzkY8B+WJHk4k/TmyWWQEDhPLVh5wZUtVrqB8Cdcn7AqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711375846; c=relaxed/simple;
	bh=+QYOdWMPVby5jZqjvQM8+GF5g7s+FSbARSBKiK4+XKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gT7Z4OitDQnIxqhzRvNeT6Y69jpPbUrlivZBxlGozATU3M4E4apE5W5gohpaSVMZ+jzlHGwUjS+jGpt2yVyDy+q4WQtRm49oCi8MomfIiXB3NbI0mmLn+XTgEEbTuD4EquSInTgauZE5DKvPLL2QIxGT7+8Znnfnu8OOa0ufbQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OLAottkP; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OLAottkP"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dc6dcd9124bso4199657276.1
        for <linux-clk@vger.kernel.org>; Mon, 25 Mar 2024 07:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711375844; x=1711980644; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=txFP5jH6roviK6Ext4CLx3t1HKBA8RgvWyQlQ3eWqFA=;
        b=OLAottkPaWDsRg66TFozTifR3NbFgYiz13RDyldFcH46HyNIE7PIOjpkH6rJrPO+2s
         hSqZUDRnsrLfA52eSnw8Tr9FyvWO/gPe9slRHkySIXzKPbJfUnqNtakgk3qBwnsIeZx0
         wWYRCkd+N2YUy2D/c4njD586fY4fPSWUS5QgTjkpi7e57tX3Z2biepWCkyj7mQklMYZJ
         yX9WTAJg1PmR0nHWpTQuGfJOXRiKC/ARLv6RG6FulWWEv5LKWHfA4vU0lmTpWboX23xD
         1fH94Ozabua+dEi1qyTwCpe3lkT61muvBTO2QSvWf4mLz09af79j61gHg20ug9Mazwnn
         Fe5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711375844; x=1711980644;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=txFP5jH6roviK6Ext4CLx3t1HKBA8RgvWyQlQ3eWqFA=;
        b=sbgv6FU0aNNhn5aFC9y1Jk+spRLnw5QitE/DWVJ0bm/YYiLSS16X2anpor2lXEhvSG
         DfX+SkOLROSk9BFuMu3sH+7rKtfundjxV83tbS8k4Rh4UG5JQHn61qipPc2s6gsznLJ5
         blZQM8O8XnvMAOYj1Co/ovflCbbpmluSJS8Q4kDwIJgG+GtLQaYbDUUiNczWmA/t/iRW
         mkfzERdsOii0cf8BKuohV1EuaPBZSfl9vOCAtKCqhAsEWGW0KZ1ZzKwZ2eOoFZEShijR
         WV5wLLGc5po06bNVCrs2OxRO1c1YYb49zzo4mYnZUe44I6MWNK/G3ZsB6T9CnJMqHe79
         9OjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVr9ttz/U0kgDv9E1LuJ4e/DIS55g8MmDyo7soeQMpA+/tCHW/zOkc48dmYhGMdWcw6dzzo/PNhgDSOXOdJdjfqX1fxC3hvI2Wf
X-Gm-Message-State: AOJu0YwjmDpLqIRRy9bZwJsNH8jRxPJD7hF0ozfZgel78i6jJWKnAF1E
	ovHxqhW2uAK79e7l0UpJiCEDnaPto+UiE02B7V+aD+h4fSgiYZSuAm71bmRKISg3nKOEGH/4hFn
	+CFe6zCwlSPeCy5NmJpi7yH1448PzMEEupvtidQ==
X-Google-Smtp-Source: AGHT+IGK1q4FlEtm2qFSh9/hQncp6/6I/Wk9SmWPqaTVVT5u98SyrANfhyP3OahcZRjZ4NnXsYrWuGfGuMA9EjiBEe4=
X-Received: by 2002:a25:aab2:0:b0:dc7:acb7:af14 with SMTP id
 t47-20020a25aab2000000b00dc7acb7af14mr5485083ybi.5.1711375844041; Mon, 25 Mar
 2024 07:10:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325081957.10946-1-johan+linaro@kernel.org> <9b2a7e9f-dbb2-4acb-91a7-fcc64d5cfabd@sirena.org.uk>
In-Reply-To: <9b2a7e9f-dbb2-4acb-91a7-fcc64d5cfabd@sirena.org.uk>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 25 Mar 2024 16:10:33 +0200
Message-ID: <CAA8EJpqvYYCFRJVr732VORyHgpU-H2nif+n6hB6pJbXsqCH3_Q@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: gdsc: treat optional supplies as optional
To: Mark Brown <broonie@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 Mar 2024 at 16:01, Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Mar 25, 2024 at 09:19:57AM +0100, Johan Hovold wrote:
> > Since commit deebc79b28d6 ("clk: qcom: gpucc-sc8280xp: Add external
> > supply for GX gdsc") the GDSC supply must be treated as optional to
> > avoid warnings like:
> >
> >       gpu_cc-sc8280xp 3d90000.clock-controller: supply vdd-gfx not found, using dummy regulator
> >
> > on SC8280XP.
>
> Can this device actually run with the supply physically disconnected?

On SC8280XP this is supplied via power-domain instead of the supply.

-- 
With best wishes
Dmitry
