Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B66D13C8E2
	for <linux-clk@vger.kernel.org>; Wed,  5 Feb 2025 15:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738767604; cv=none; b=KY13HP5GNeNXzGcg18KXxPSxuM+PkYmTAIi1ibzmg6WjNoA3GyhUqQRMSnfStfqzmsr+a6oyB3YRYMitObAnYzgIJuZhaiifF/S802tsfgOpANPnNGdW1IABInadLq6tbut4L3sjstY+dVmdgqqg2WRIH71FyR42Rz/VH5/Zfzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738767604; c=relaxed/simple;
	bh=ieUUdlZxbcLRdRiGh3xcdOsHQZsT4C0mgE4mZbccstU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=A8qkySmYvG3HrU2hWdmXZZ9SOeseBCA7MYb1d6wr00MO5Q0OVfPgANWv07EEapORjCxGuQqL5jWqN+U5M7XBzrSTVrAGUR6kWv4fMxl7iXLOqJzoB+awOk55lqtdcjp3o7sgu4L/Wl+/M1H/E0g34EzjJAMe41HmE9S8cM7Wd+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=gbUTYLnr; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gbUTYLnr"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-436202dd730so48847135e9.2
        for <linux-clk@vger.kernel.org>; Wed, 05 Feb 2025 07:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738767599; x=1739372399; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jXKQZYwIMRdWb1WTyhDach9eNkGuIVB94zg4DR+3xaU=;
        b=gbUTYLnrlWb+VFGkA7lYC3A69xAAoWWg/Qy90b+zZf7UhVAUbveBEL8UQ6BUS0L8bX
         IoBn48IuRYLTDzbS8hdRqoOMMKMk2r0z2kG08QEMApK0w7R/q19r9vIRm363/8PqDgTR
         HrQe6CqQPcxpg+4DP98VKJSiSgLDQCT8MPgb0FPULcVDF5ttiVEJ4mML5fg6eZ6/znz+
         fvTcuM5JiImThTBfVKpkULCP/EaG2ijK0OBBJ7mITdD149csEklEDOJtjuJTM7jWGOzx
         vmxXzFcuc9KcyBOcZhriWBZUP2cGTMEyOItCgZXo2CCC2PtS9Ba4Zi3pxXzlx9hRqlXV
         6Cbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738767599; x=1739372399;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jXKQZYwIMRdWb1WTyhDach9eNkGuIVB94zg4DR+3xaU=;
        b=DAJvn4tn6Y6WW6d6rTbjtJuBso/u37XTXmVHKiRTdEE7xuCAKQtaxhT/GRZ1WgbtYr
         DqpNmoTnDyCGQ1zoB2b2K0K1nIiW2nwP90NpZ1r3I6U36nnj9zrAWWSc6IjiuE6c0dzs
         tlmur+YKtR4+GB6vyANWMqZntquoCt92Yet6XnAvxTDE5TR2GMNHhGn65U4dNP237C4P
         OxzNJ6lZcIRxXYMcgdPbNDwqlUS1fAZGfMB7OJm2rldYuqRX13arK9tL/+41Lv0/zyGb
         GMnMxcHLpk8ZKJExHlxrCJ56NZc6cmNygdNP/ELZusPbAM4xh90jHcM4+5KJ4upxVSxo
         5P5g==
X-Forwarded-Encrypted: i=1; AJvYcCUCLjly+3XEYTkhpclKdfekhDYP6nG1lcj6hhiUSJCthnXeJr4fHC2qIbLrcQeXoCo9syQ7U9P7190=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6Op/cSRVa/aeP9jPfKz2MhFdaFaXeaWnMNcNMgbbaKM+DRLmy
	+0vSUYZ6wmJFQvF/zNv+EhU4NIOzrImsuXsaapwCfIDuxpQe1BX48+CEFOpUZZU=
X-Gm-Gg: ASbGncvpeyAuF+aa25gBzL+c/LxZ6lq5xgAvkJY5pgbfdAREqD/pj17Gs7Vw5uRwWcW
	yeYRSMeiRC1nW/MWs8kuNHu5/eluQC31SQuhjqEQqDpoiE0PaJLawc/KfkDO5lC2COQmUcUbZ1E
	tTG7VTkKEfx3m/ThvXKo7Ed7QCkgYiWVEfo6K/1sonNJDMaGkM4R0oMY/kLatk000wqpapQIJSE
	PHnCxSAi8H2m7VXZoO61l/YQHz5O4GZOQ1Fh8XAQ8GppA2FEq4SOJVoTOD0uxhWdZse7HYwI854
	QaoiHt1KJKXa38M=
X-Google-Smtp-Source: AGHT+IHwhmaSRrFFNWvkKMkvBDoo/mSQ2n4IGzbyDDbD6YkLJZIfCEMLSF3RcPUjOCdhwhP+nUxtfQ==
X-Received: by 2002:a5d:4cca:0:b0:38d:af8b:6d73 with SMTP id ffacd0b85a97d-38db4889c49mr1918537f8f.26.1738767599221;
        Wed, 05 Feb 2025 06:59:59 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:a66c:715c:b646:6f06])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dae1a1e4bsm4765667f8f.55.2025.02.05.06.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 06:59:58 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/4] clk: amlogic: drop clk_regmap tables
In-Reply-To: <20250120-amlogic-clk-drop-clk-regmap-tables-v3-0-126244146947@baylibre.com>
	(Jerome Brunet's message of "Mon, 20 Jan 2025 18:15:29 +0100")
References: <20250120-amlogic-clk-drop-clk-regmap-tables-v3-0-126244146947@baylibre.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Wed, 05 Feb 2025 15:59:57 +0100
Message-ID: <1jlduksahe.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon 20 Jan 2025 at 18:15, Jerome Brunet <jbrunet@baylibre.com> wrote:

> This patchset removes the need for clk_regmap tables in each clock
> controller driver. These were used to populate regmap with in the regmap
> based clocks.
>
> This saves memory and is the 1st step in a series of rework of Amlogic
> clocks, to clean-up, increase code re-use and ease future maintenance.

Hey Stephen,

Are you ok with clock core part of this patchset ?

I have more clean-ups on amlogic clock queued after this. If possible,
I'd like to be able share these in this cycle.

Thanks
Jerome

>
> Changes in v3:
> - Fix some typos
> - Link to v2: https://lore.kernel.org/r/20250117-amlogic-clk-drop-clk-regmap-tables-v2-0-d1f77cb0773e@baylibre.com
>
> Changes in v2:
> - Add clk_hw_get_of_node and kunit tests for the new helpers
> - Split patch adding the .init() and the dropping the table
> - Drop devres based solution and something temporary but simple
>   while a more generic solution to hook controller init is discussed.
> - Link to v1: https://lore.kernel.org/r/20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
> Jerome Brunet (4):
>       clk: add a clk_hw helpers to get the clock device or device_node
>       clk: amlogic: get regmap with clk_regmap_init
>       clk: amlogic: drop clk_regmap tables
>       clk: amlogic: s4: remove unused data
>
>  drivers/clk/Makefile                    |   1 +
>  drivers/clk/clk.c                       |  33 +++
>  drivers/clk/clk_test.c                  | 116 +++++++--
>  drivers/clk/kunit_clk_dummy_device.dtso |  10 +
>  drivers/clk/meson/Kconfig               |   1 +
>  drivers/clk/meson/a1-peripherals.c      | 163 +-----------
>  drivers/clk/meson/a1-pll.c              |  16 +-
>  drivers/clk/meson/axg-aoclk.c           |  22 --
>  drivers/clk/meson/axg-audio.c           | 433 --------------------------------
>  drivers/clk/meson/axg.c                 | 131 ----------
>  drivers/clk/meson/c3-peripherals.c      | 210 +---------------
>  drivers/clk/meson/c3-pll.c              |  32 +--
>  drivers/clk/meson/clk-cpu-dyndiv.c      |   1 +
>  drivers/clk/meson/clk-dualdiv.c         |   2 +
>  drivers/clk/meson/clk-mpll.c            |   6 +
>  drivers/clk/meson/clk-phase.c           |  11 +
>  drivers/clk/meson/clk-pll.c             |   7 +
>  drivers/clk/meson/clk-regmap.c          |  49 ++++
>  drivers/clk/meson/clk-regmap.h          |   4 +
>  drivers/clk/meson/g12a-aoclk.c          |  34 ---
>  drivers/clk/meson/g12a.c                | 261 -------------------
>  drivers/clk/meson/gxbb-aoclk.c          |  19 --
>  drivers/clk/meson/gxbb.c                | 393 -----------------------------
>  drivers/clk/meson/meson-aoclk.c         |   5 +-
>  drivers/clk/meson/meson-aoclk.h         |   2 -
>  drivers/clk/meson/meson-eeclk.c         |   4 -
>  drivers/clk/meson/meson-eeclk.h         |   2 -
>  drivers/clk/meson/meson8-ddr.c          |   9 -
>  drivers/clk/meson/meson8b.c             | 200 ---------------
>  drivers/clk/meson/s4-peripherals.c      | 341 -------------------------
>  drivers/clk/meson/s4-pll.c              |  31 ---
>  drivers/clk/meson/sclk-div.c            |   5 +
>  drivers/clk/meson/vclk.c                |   2 +
>  drivers/clk/meson/vid-pll-div.c         |   1 +
>  include/linux/clk-provider.h            |   2 +
>  35 files changed, 239 insertions(+), 2320 deletions(-)
> ---
> base-commit: 1909d0d351ed98fdb9f5cbe377213ba0154bf2e0
> change-id: 20241220-amlogic-clk-drop-clk-regmap-tables-18e5cf572356
>
> Best regards,

-- 
Jerome
