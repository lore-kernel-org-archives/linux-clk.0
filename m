Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B208C340263
	for <linux-clk@vger.kernel.org>; Sat,  7 Feb 2026 04:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770437435; cv=pass; b=GOZl0L6rpITuLdSoS1Uu4jDmD/uadjUPVSUL4JAX8artDJlTbhVOMCpOnN2C3plB8I9wpyYVd75CMQLyZo/1f3qH+2qOPY6TnHBYmxd42DB4b1WDCJYEsQQiz+m8aZV3JQMaTBL+qGPfYuGuBO4LwK1LsPP8daxhXghslZ+Wdpg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770437435; c=relaxed/simple;
	bh=/olLHK58Ree37pd5x+aRR4nUmZI2TIMK1khE0n4fVcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hqsrbpcEy1sEA1sjByZgzCj2A8gQDWX1noYHbQMt+99xs0fBsoWF//ukOPeLW9evW3wzImuIMOW0FaOi03glSnTF3bFOCmfnPhaq8NamPkinn3P6IGdoTbST2FrFr1KxpGJKn3bSRc1OVK3zUPtURj7yZvl5omTPM2sYeRNZC1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=NTRygHsl; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="NTRygHsl"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-64ad79df972so239383d50.1
        for <linux-clk@vger.kernel.org>; Fri, 06 Feb 2026 20:10:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770437432; cv=none;
        d=google.com; s=arc-20240605;
        b=BRb5KfMQrGyFAA2viwRXbwxxlzmsTNEDGPOXbBFXfVIdWbwPbG/pev/RUgfKFViVsp
         3UQzvsktiLd6KXhAVaalBnAns/fWZg3zVwU8ZTudgbzt+fMV3RE6S35aWTUIkTIzkO2o
         nP3Pq8GrO0jRoT3BtBaNnVZ6vklVzY/zE1aX5aNvEBK290SAi5i+/46ZLDrHv49lc7zR
         i+gRtcAsLKIRgclutlI/UVEPvCoiatdX50O7DUeKmuBZ8hY9z6bQ5FRbdeABm8pEUjFK
         XZbr3Q2siCcDsQr4MQxWIVsFoVRPWxYkGooC2WNLOsRq6y4Vr457icjoW17+zFBjzPVR
         CMHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HQK2vIOwkG2ALyK6WHU0SCQALHfOl9ftPcggyCW9CDQ=;
        fh=60ItsBPFh45ZjdZrmKyuTf4tl2tuBSXAkBOEY4OFBLM=;
        b=OTczamj+zxEByDYHIzKdGFvQrc9QKxL8RK56DFiJcXCO7yqK6OAuT8unYCOTwUkkYo
         YEcB8zJWTr1bwFXDN6gssJxumHssMz249a8WelqYu7r3BSbO5Jeq7Ef7KkjNgtC5/jUE
         H0kT+skp+xvSlOy50q0rC+U9RguUFUyrYX9kPDptgzoG+x7siIsSqvwlmEjo5Y9Vbf5x
         tKmGT6tRL7gHXPKV7oRIDNtrfKYJ3blmDA94Eed4VIsPSB8HHqJ/IXBfiEhAE9jCVYM0
         Sz/88S741vkdCQpL7qiNg+AIfw6pAah4rqj6soEMVkk+kedAMLk/MrzsrskfTWs268rW
         KvXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1770437432; x=1771042232; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQK2vIOwkG2ALyK6WHU0SCQALHfOl9ftPcggyCW9CDQ=;
        b=NTRygHslQR8w5Cn2pI0AfM+p4GLQkOqsczjs+yD/t5I2I14CigTX+uYhzP7RxGyoRb
         tB0S9amA9+vsAysECxRSnQRL7Skq2rTYITnxoqamLyKJqvAuFu31NDMgZoTXl/IaMrYB
         gOH9G/82yvYLW8uptVCnd0ynvXyph2X9UqTM24Fzy7Qp9USkzzyKnHlH4fPBLTstZEJc
         qzKfNWdcYBrzfOzARCnLOxyrcsSDgEXizkqw9pKriqUopbg1RACsln98Rb2q8nPLGb3z
         LIesPMjcQWDnoXQU1cEQ9oksvictfhigAirSZEVul1Rq5DCKGYtDfoGe3wwsz4kdYtPB
         EIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770437432; x=1771042232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HQK2vIOwkG2ALyK6WHU0SCQALHfOl9ftPcggyCW9CDQ=;
        b=B+rJsTTRfc9oGAld0ePDSc1R6QleP3hzqE0AAW/XPzeWUjsul6qg9BzyVap0bi68xe
         N3E5/ntwp8XeWVp7O6XZx2EDgE2NX4X17xyrCGT4fKQLxHXqFM3Mj/i73CU9nM0fmOMy
         nOPxzPHNMqdj7udSUelkYOGgwZEzp2TPE9LihEQ18KCmVu083cwQrYmQmftcoS2KUbJ0
         2PxdGqa1qFId3UKIxh3c7qkmKs5uNAgukPgvEkKwKOikkq0WIzvjyQJqu9TtiDD8DNQn
         kgN3SnHiXIhYisw2G9aPw1I+2JLh4LeaLBds1S3Tyk8woG+Pb5bspKQHameTgwE2uWJf
         iT/w==
X-Forwarded-Encrypted: i=1; AJvYcCVWi8vVyu3D/yLoAjF7gm9YdTWX7gDjLwCvl8x4lktsgXbLjkpGPwMJDFXyVyByYzt0OCYbbjO9A78=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwF94DvNqoOgi/wyjujA5B8pOz0PwUFD3k/p9ye8TVMIDi52n9
	Vr5fjQu6n8wu91PxKF7DGdG2xjoaiTN+6EZIyJFjwFB+BHSd8wQcRl8jmmJBV0gl4Fppv9cZ5Y7
	9z3rJAZefsnPIheJr5HNoNPQBJQy4WJBR3OnS73dqtQ==
X-Gm-Gg: AZuq6aLG5dnt72sRz5TbjW/C2nrZ9c2kJy1RzV5VjHQkf7XHdFBw5aq/7pJi3ySQ2gg
	/1DI7BcX84Sa/1TwB38ZwaiZvAtMPLLE0XVmSU8CgWT5SJJ14Vr/1MCu1yq3WQdEYg3sYpuDaVd
	bwTadVD26enuSFdE/wWtK8GVKMf5D9fko8L82u+O8zxwS+H6YHd4FvkrEc6/uYEW2vV402CljE2
	v5wHCD5iNM7HcEasbLCIVSBKq3y+YSSJt02CMgPbL8SjLv0wCPUW2X4Hivcg0TbTBoDK57NSuG7
	RGs2VzqBpiKcKu/n7PoWm4FFLQhPst9rc6Pi52b+LXW+OM3LZO9lkdxPKGWv
X-Received: by 2002:a53:c5d1:0:b0:649:c36a:a9bb with SMTP id
 956f58d0204a3-649f1f42967mr3431006d50.61.1770437431753; Fri, 06 Feb 2026
 20:10:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260202-atlantis-clocks-v5-0-0922e43acaba@oss.tenstorrent.com>
 <20260202-atlantis-clocks-v5-2-0922e43acaba@oss.tenstorrent.com>
 <20260205-spiffy-bizarre-doberman-184d2b@quoll> <CAEev2e_S9LYV609VmrHCqNneuTro=hbAjzgHFLAO6RD0_fErwA@mail.gmail.com>
 <cb18f760-500b-4417-b706-cdc7448441a4@kernel.org>
In-Reply-To: <cb18f760-500b-4417-b706-cdc7448441a4@kernel.org>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Fri, 6 Feb 2026 22:10:20 -0600
X-Gm-Features: AZwV_QiWVk70UuqcqOk0z1X8KAuxupWx6vboVsxCRDDE3guQwzCiVTZlUA0eLqY
Message-ID: <CAEev2e9SqrHu5HdXzpCf1wuFNakEa=p8N-CMEZY-=DwS45E80w@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] reset: tenstorrent: Add reset controller for Atlantis
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, mpe@kernel.org, 
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, agross@kernel.org, 
	agross@oss.tenstorrent.com, bmasney@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2026 at 12:47=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 05/02/2026 15:18, Anirudh Srinivasan wrote:
> > Hello Krzysztof,
> >
> > On Thu, Feb 5, 2026 at 3:27=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >>
> >> On Mon, Feb 02, 2026 at 01:46:50PM -0600, Anirudh Srinivasan wrote:
> >>> diff --git a/include/soc/tenstorrent/atlantis-prcm.h b/include/soc/te=
nstorrent/atlantis-prcm.h
> >>> new file mode 100644
> >>> index 000000000000..841516cbefd9
> >>> --- /dev/null
> >>> +++ b/include/soc/tenstorrent/atlantis-prcm.h
> >>> @@ -0,0 +1,31 @@
> >>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> >>> +/*
> >>> + * Shared definitions for Atlantis PRCM Clock and Reset Drivers
> >>> + *
> >>> + * Copyright (c) 2026 Tenstorrent
> >>> + */
> >>> +#ifndef __SOC_ATLANTIS_PRCM_H__
> >>> +#define __SOC_ATLANTIS_PRCM_H__
> >>> +
> >>> +#include <linux/bits.h>
> >>> +#include <linux/types.h>
> >>> +
> >>> +struct atlantis_prcm_adev {
> >>> +     struct auxiliary_device adev;
> >>> +     struct regmap *regmap;
> >>> +};
> >>
> >> Drop, there is no driver-wide user of this.
> >
> >>
> >>> +
> >>> +static inline struct atlantis_prcm_adev *
> >>> +to_atlantis_prcm_adev(struct auxiliary_device *adev)
> >>
> >> Same here.
> >>
> >> Do not add symbols to headers which nothing uses. These are private to
> >> the driver so they must stay ONLY in the driver.
> >
> > The definitions in these files are shared between the clock and reset
> > driver (which are in drivers/clk/tenstorrent/ and drivers/reset/),
> > hence they have been put here.
>
>
> Ah, but then I wonder why your clock driver needs to access reset driver
> structures. Or vice versa. You are only expected to get regmap from the
> parent, no?

Yes, it seems to be doable without these structs. I will remove them,
and move the register definitions into the specific drivers.

>
>
> Best regards,
> Krzysztof
