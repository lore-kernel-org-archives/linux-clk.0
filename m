Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81D71BC58
	for <linux-clk@vger.kernel.org>; Mon, 25 Mar 2024 19:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711395612; cv=none; b=qB9umj7lnMSKeUF+RDDgZcvI9zzlM51NBwn9FT3SZFFQmv03UrhV2B72me2k/Wb32M5UamoZ58UWalcE2O3/XzWB0S83SLmY4deqzUqnmqWmSsFPMJN+gKM1RNOOhUM7Osfs2sLF3bNTlTlsfykvfkuUsWxRXRrfIvPgXnkCUEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711395612; c=relaxed/simple;
	bh=KlDcReSHkzr3q7MI7ZjcywQz9k72vldHzd9nToqdlAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MVLfkHUbLmn5lSY3nebXBtEPG7tlxKayFpPxDgt4UkCPKIoiGF+itf3Qiy9Ix9N57dcXn24j/rmWRaRnvpgH5c4N3mSfuKofI/pynVD8LsJSWbroMF/s715QAT7fhXDkd/eHPcR6p6Zx87XGSCH3c/qdN1ma/5RBZQJ+fQ56Ihs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NQZYABUP; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NQZYABUP"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-42a029c8e62so35706841cf.1
        for <linux-clk@vger.kernel.org>; Mon, 25 Mar 2024 12:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711395609; x=1712000409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rCSW8ugAsHBM7+R2hVkV4HgvR3WEY/XblW4OKhzKjhs=;
        b=NQZYABUPao4a4Lf9eRexgJwG/Y2QuUU3w+gdbP1A+OD/WRIAwnJOZMp/xPPGAMRgXG
         wHQSvyXnnj1bL4ofCrXBLu+xMO/GCrp17u4QJ6WGZRnXvtvveslGTKwH8pfQ3y+ZxqjT
         16+tFI20/3lF+kv/JhISMqsCUlJPaX9ZbYHnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711395609; x=1712000409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rCSW8ugAsHBM7+R2hVkV4HgvR3WEY/XblW4OKhzKjhs=;
        b=JJgEn4a9obcJ5ZjvbJ5W7RhQyVYtl9wFystF1CBHMC4JQVP6C5FtkYixKDuGQ36shw
         s42z7L1/Lawd4M8KRRzLVMnZm5B5/p/pAm0vg8W3qKAIJdSADKoLkJTGxmtJtvhLGeLC
         VM8igtorfx/ja+F7NWutYQukngI4W+zNc+l0Bi8BzJVroFpCW7BcJNOhcblSnDx4smHY
         VDM1Y0m1dsxP7yrwV1JB1f96VShcXaHUvwaJ5nhyUJ45t3kz7G72we4oGaqoOAnVxNx2
         lvLXEtRYJXIHGaMaZAR5ToYW101ZqKlFXBveRjpWmrptvYjDxEfiOTz4dq8pmqNPt9b2
         TBpA==
X-Forwarded-Encrypted: i=1; AJvYcCVjrcvM1Es41jI1DIYsTRd/YEOPecTeP5OtTjLB71cXWWYxmU6s1skCaSru5ybHW0mka2eOWi8cGuIMzYDU9E0A+SYOm6XlVhS1
X-Gm-Message-State: AOJu0Yxyd2K1s/PwmhxbFNi0k5HdmgNJf+solqVj2aFgV/By5d9TiTHU
	Lvrhz62EcJTMfQh+SQIfBHRd9SofUUgcglgMiQVaDGq4r+lBEnlCWjmIrUVSPkWVYEa5r3CqVfo
	=
X-Google-Smtp-Source: AGHT+IEkMvIdNGgltxHS1Tq1xL4TM1m6/8hQGp7qfIA7Skiz0b3z2a+62KW7T2YSPtEozU3zm4sJmw==
X-Received: by 2002:ac8:5813:0:b0:431:5f07:8015 with SMTP id g19-20020ac85813000000b004315f078015mr2507504qtg.52.1711395608703;
        Mon, 25 Mar 2024 12:40:08 -0700 (PDT)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com. [209.85.160.177])
        by smtp.gmail.com with ESMTPSA id cm17-20020a05622a251100b0042f43a486c9sm2897305qtb.77.2024.03.25.12.40.06
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 12:40:07 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-42ee0c326e8so3051cf.0
        for <linux-clk@vger.kernel.org>; Mon, 25 Mar 2024 12:40:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU3GZzrEi9AD9rcXsZlkTErw3k+gHzPekb2VEbnUM2gNUIvGN9XoM7pYLcYA7a8eRBd6Wp1cbdySIM379npLMcWT4hcfPJN8Z6t
X-Received: by 2002:a05:622a:553:b0:430:b590:e88c with SMTP id
 m19-20020a05622a055300b00430b590e88cmr1295243qtx.6.1711395605673; Mon, 25 Mar
 2024 12:40:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325184204.745706-1-sboyd@kernel.org> <20240325184204.745706-6-sboyd@kernel.org>
In-Reply-To: <20240325184204.745706-6-sboyd@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 25 Mar 2024 12:39:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=URo0V1JGJ=sOz4i7hW9EqrCHyEwW4Bc1P7hsoxdw5tAA@mail.gmail.com>
Message-ID: <CAD=FV=URo0V1JGJ=sOz4i7hW9EqrCHyEwW4Bc1P7hsoxdw5tAA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] clk: Get runtime PM before walking tree for clk_summary
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, patches@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Mar 25, 2024 at 11:42=E2=80=AFAM Stephen Boyd <sboyd@kernel.org> wr=
ote:
>
> Similar to the previous commit, we should make sure that all devices are
> runtime resumed before printing the clk_summary through debugfs. Failure
> to do so would result in a deadlock if the thread is resuming a device
> to print clk state and that device is also runtime resuming in another
> thread, e.g the screen is turning on and the display driver is starting
> up. We remove the calls to clk_pm_runtime_{get,put}() in this path
> because they're superfluous now that we know the devices are runtime
> resumed. This also squashes a bug where the return value of
> clk_pm_runtime_get() wasn't checked, leading to an RPM count underflow
> on error paths.

Ah, interesting. Thinking about this, I guess it means that a single
device that returns an error from its pm_runtime_get() will fully
disable the entire system's unused clock disabling as well as the
entire clk_summary. Crossing my fingers that doesn't show up in
practice...


> Fixes: 1bb294a7981c ("clk: Enable/Disable runtime PM for clk_summary")
> Cc: Taniya Das <quic_tdas@quicinc.com>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---
>  drivers/clk/clk.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
