Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9DF234989
	for <linux-clk@vger.kernel.org>; Mon,  3 Mar 2025 23:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741043852; cv=none; b=lyV8BE0qn4Qc3HXMjjaUVZJOOaP9rUtbJ7E1YAwDEEbBN8xoBWr9NZrJzhyiRG8nLEyjDc5/RJxVyUk13XgJ2qLVqTxp5+NYpi12+tkr5OhBe6Uho/jYhKdeIfeT4zTxdTQ7HoVs6xYWUs20rUc7xnrIuc0Cg4ztslXttnOe8hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741043852; c=relaxed/simple;
	bh=NPxdklpo+hfB6Q5aEYjRbk28iZGSbxF0mOWy2NS6sNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LGDYep637fQxYwYtYklf4D0anRe6iB97sigenxU3ouczS11kL9vz7lm6tBFdSg/sglwabBYuniZdGIFH5GM1CM9LqqQCIUBAhluoXJnnFOYY0N7ybJCqr76onQsrRRnEN/HrIylV0p5q6PNuESOvVku2QznoARj9nKgWuWYxgqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JZwTJNTS; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JZwTJNTS"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e608b2698fcso3439383276.1
        for <linux-clk@vger.kernel.org>; Mon, 03 Mar 2025 15:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741043850; x=1741648650; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nJU/yvYz6haiwFOMPRsCHOU6kFhXq6ZBBygufHFSnzw=;
        b=JZwTJNTSJ03cFQz1dWsA/AU9gfbqKKpWb53dCTMAxSDFBa4bQAUB4Gq9V0YAuAwavQ
         rJcTfIChgqj0TQ4GDoHoZlXfOePZ49Rh2mO9VxlJ4sLVLQgX+tXtdhC0oEmXtjhJiQC4
         LR4PFmpw4DnjrQkH2dVDgsFJuMwoSxHgipvDOK9CXDlE/gEypP9WoA8yHOGoe1y6plyg
         +b2H+PWHY9NhdSaUFNeDwbznzU+6S/qTeQOlfMnZZNEpphuDS5y+vjHaXKTJjfV4ZRxM
         ia7FUPwZxiL66EcFju7Y3sakaRMe2uytakcxz6NJ6we1OZfc4XSvjcNcMJy1TrMjEEvs
         nQwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741043850; x=1741648650;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nJU/yvYz6haiwFOMPRsCHOU6kFhXq6ZBBygufHFSnzw=;
        b=JLOZoFOdxKPIv+Vf8CHM0Fxsvm+MU/vIOF/412gAvR9J6VyglBaqnUMoyfp7stNn7L
         q0CtkqWB5sVcCqYxSUX1usSW3ExHLl8g7WxI0sdqNByu3vUKZ0MlhypGE37pUHaROdcP
         wina4dQHxrycgXfF3qm0PcLQ8LsoK5jR/0Q2uap7SdBJ+4xL+2ZTyUp12BL3xshbGjuJ
         ubjXYnNE9eJKmrsBa0/d2kMNKQ1VHrRqdESg7VUCmujZMIkgwP3s+gK+vOaWBcA1xEq0
         ZCnINmT8g8n+Tkl2pSrs99f4imkmURcB92bVcAOTgfgtKira8Kp73fVuHibQAygP/all
         5R3g==
X-Forwarded-Encrypted: i=1; AJvYcCXV0EC6no1PhyfqIRELsfsls1eozEe4xYPmDsEeSB6o+ab9fIjKiVYMFWY0nFcZPc227QTm7FRU+3c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKdJ75M1uc61BNsxQJhIn9dTQkXF3RQbkmXgjBjhMs/m56GFwi
	Nzkpk+SRENPx45DY1Wn36P6+AR40zrgclI4d7SN6anhq+mWrdv+cuTc9so+lZfOz8oX/U19z5iO
	MAkMNyNZ4BLSL2E2MFrNNpPb83HBLfi3QM/yHBg==
X-Gm-Gg: ASbGncsMq+VNYmN+eQxyMG3bHkqXdeUFSgBrhxzjXIjojIHC3ngYgONyDa8N/Hy8xQn
	VtQUSgG25uHUuoxl6SevOakV5lV4ysZU5vAU7orxxiM7mqtuFy1iMqCm/g1ijEJyF6b3igcW95J
	Lq+r9e6kD5KquhHI/buxl5kBo461PEJXazcDm52OtrwniqwODOXwinpyMhFwM=
X-Google-Smtp-Source: AGHT+IE6J32scZcQCUr9Yh/ghM/bua+zO4/HH6rxu31moRlCqq0EicPtjHBgPE4qSnbGz5efb6sDCSe0Ys70/YyeEEs=
X-Received: by 2002:a05:6902:2405:b0:e60:9f80:535 with SMTP id
 3f1490d57ef6-e60b2f1ceabmr19768288276.40.1741043850226; Mon, 03 Mar 2025
 15:17:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250201-topic-ignore_unused_warn-v1-1-f29db78cea3a@oss.qualcomm.com>
 <93b5004dacfe1151ca3abbb0fa31eaa6.sboyd@kernel.org> <87241686-90b5-44fe-b4e9-1a59451e3575@broadcom.com>
In-Reply-To: <87241686-90b5-44fe-b4e9-1a59451e3575@broadcom.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 4 Mar 2025 00:17:21 +0100
X-Gm-Features: AQ5f1JrNfSaFjOZVORaIa_wvDSL26potTqDwKAKcZrvq460zrESF_F1ECLmvBmM
Message-ID: <CAA8EJppgU7_BoVCDfTuKVveBnnhtHUN6jEzkUaAou7=aypD-Dw@mail.gmail.com>
Subject: Re: [PATCH] clk: Warn (and therefore taint the kernel) on clk_ignore_unused
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 4 Mar 2025 at 00:16, Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> On 3/3/25 14:48, Stephen Boyd wrote:
> > Quoting Konrad Dybcio (2025-02-01 08:52:30)
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> If any sort of ignore_unused is in place, it means one of:
> >>
> >> * power is going to waste
> >> * the platform description is incomplete (missing consumer-provider
> >>    relationships)
> >> * the platform description is just broken
> >>
> >> Many people will happily declare their job done when a platform
> >> magically happens to work as they make use of bootloader-enabled
> >> resources, which then leads to double or triple the amount of work
> >> of another person, as they attempt to reduce the unnecessary power
> >> drainage and/or ensure stabiility throughout a suspend-resume cycle.
> >>
> >> Issue a good ol' warning (and taint the kernel) to make such cases
> >> obvious and hopefully draw more attention to it. This way, it'll be
> >> easier to avoid effectively untested code or DT description getting
> >> merged into the kernel, or worse, going into production.
> >>
> >> The clock subsystem plays a crucial part in this quest, as even if
> >> the clock controllers themselves don't draw a lot of power when on
> >> (comparatively), improper description of clock requirements has been
> >> the #1 cause of incomplete/incorrect devicetree bindings in my
> >> experience.
> >
> > What is a user supposed to do about this warning stack? We already print
> > a warning. I don't see us dumping the stack when a driver is unfinished
> > and doesn't implement runtime PM to save power.
> >
>
> Agreed, I don't think this is tremendously helpful given that it does
> not even tell you what part is incomplete, it's just a broad warning for
> the entire system.
>
> Assuming you have a clock provided that can be used to turn clocks off,
> and you did not boot with 'clk_ignore_unused' set on the kernel command
> line, then you should discover pretty quickly which driver is not
> managing the clocks as it should no?

Unfortunately it's sometimes not that easy. And some developers
pretend that 'clk_ignore_unused' is a viable way to run the system.

-- 
With best wishes
Dmitry
