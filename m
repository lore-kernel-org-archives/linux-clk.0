Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551493375A7
	for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 15:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769441157; cv=none; b=WbxF93j76a/+sAkvsxZSBcqM8Mdou1N2nSoHqQ+3uYSFtpSpsmcP3WIr0YWIo+HrOfoxsqpBdYebZgKfTxVsTL7tpSVhj3iaQO/gH7IrdTlVhKrJv/8KVTc2Fcsqvte7QvvtRRAdtGi9AmRzk/UiCKC++E3JHmnVb/OkEKDAzSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769441157; c=relaxed/simple;
	bh=+chqUlgxIxAqqfIFc9NZvOU+i2zlOs4sKoE2dKWsVnI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E1+Yc2Qxc9XNRifTuxyFL8I0K8mvMbAgU3xt428VQbHbvNnpMXSn3PQwq/o1Qz4W59fppWhlkCiSDlLgz8xIJ7Fj6h9C7nUwqObJtMpXeTets/aSpbcv3dQQ506zFr4ICo1AHaiqloR1yg8HY1B028JlvjMkgrK13FAIH3W1B5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5ef5c04151dso1453958137.3
        for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 07:25:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769441155; x=1770045955;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mh7PNCBulLknV4S/MmUqHcjYzn9tSl2obqvDW9AgL/U=;
        b=HV6yzqIOYKqUGGi5rttj3RUzcPuLxs7Oj88wQV3JD5z6S1xyFPw2gJa9H9G6lw9xwE
         qc1UU+dHYkf4eu0jrZll3uu728Izz5ke+pEXATm7Hb6Aekr3etpzRnBNh/AYDrV/h5aj
         9VhoKO+8obcyqkNuOUvDGbVz6PSqsxMV6RRZndOX+KuANUlr8KlU+gnTZ7+ew9soF77m
         4RV7oSaYxJUl1ncZeLzInBmLcrECueLCfr9/CQZliHePSFNgDq0hBIpmZyJWyZwkMcO2
         nBs1Cv+yh0DY/XQOzM37RDXqKfT0mpun+POuwehg21B/DZD8VuR4t+q3r5c18klMqIL1
         W1pA==
X-Forwarded-Encrypted: i=1; AJvYcCVyfQSmDIU5GeN9ZYl06GtfPvYInFperNb/1ok0l1M1E5b6wOIWM2b1OKEmUm8O7uKzSBGRZTDiLbY=@vger.kernel.org
X-Gm-Message-State: AOJu0YybcwQM2ge8U3QY5dKnpihr5JnAZvwu0ycmzHpbLViqgVkQ9C7Q
	QWzeCa1cdlS3hak4rEcckJHARe7VYH3LQeVGralWOY3B+cDhW2RR62Hm6PCzcDzP
X-Gm-Gg: AZuq6aLoUsW+cRgbLm+aTd8jVHSm32Oh0Ot9wIuDnPurWg/GpbYHuxYLMtI40tGT9em
	ifIKSaR5xBbxU8BS4P1Qhc8teuRJbwcwl9XBeG3pAXmxNgZjz5w1Pv/9Vb8UJEugXuj1IGH7nc2
	4waceh0JKt1q6GQpkfhElSdgA/eGupVxDKshYnkzK0GPWkVpkFsxgSKHum+M0DuMhJsZo7gKK4Q
	nKaY/88E5kbIHj0TjruXEmFiVgBjHM3pi2hAvB8yV52o6v5tVLMMy4u+l/D/BzX5P507gNTLGxV
	RTbLMmzDmhAC/k2CcV1yrDZ+E53tTgZvAq17pcDBV0dul1r9DPoXtdgo/cauIZcKPh0zroqFUBr
	at5Tjvi+68d8nxp/eM5I+tGTkfd4koCUipsN5CKXq1ndeo4O+hl30bA1Sy+X2WH4br4KlPaxUTS
	/6OInCQ6YhdTVtKSQr6G1jUSsr1g7kB9524+3FwpSZN2k/EJLsOdLACFVqiqQ=
X-Received: by 2002:a05:6102:2920:b0:5ee:a1e5:6504 with SMTP id ada2fe7eead31-5f57651d74bmr1235999137.36.1769441155122;
        Mon, 26 Jan 2026 07:25:55 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f54d62dde1sm1824957137.11.2026.01.26.07.25.54
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 07:25:54 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-94240659ceaso1275191241.3
        for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 07:25:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVugshAv39eVNh8dvuMuInezatiwPnNNgtFfcvnPC0VPI5UzkzHKyCFhrO/PLMRcBcprstTLB14PIM=@vger.kernel.org
X-Received: by 2002:a05:6102:a49:b0:5ea:67f4:c1ad with SMTP id
 ada2fe7eead31-5f5764c2db4mr1193845137.21.1769441154202; Mon, 26 Jan 2026
 07:25:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125190314.26729-1-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260125190314.26729-1-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Jan 2026 16:25:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUtZqu6xTEena3VXB1_5vdFM1Pu+n9aS_bXXw3cekgY3g@mail.gmail.com>
X-Gm-Features: AZwV_QhokrFly-7I2CTc5dF9CXKTabpeUPSd_ieTfoc7CEZrMJ0H3Q5Y5ctzmCY
Message-ID: <CAMuHMdUtZqu6xTEena3VXB1_5vdFM1Pu+n9aS_bXXw3cekgY3g@mail.gmail.com>
Subject: Re: [PATCH 1/1] clk: renesas: r9a09g057: Fix ordering of module
 clocks array
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 25 Jan 2026 at 20:03, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> The r9a09g057_mod_clks array is sorted by CPG_CLKON register number and
> bit position. Move the RTC and RSPI module clock entries to their correct
> position to restore the array sort order.
>
> Fixes: 2efea3b35cc9 ("clk: renesas: r9a09g057: Add entries for RSCIs")
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.21.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
