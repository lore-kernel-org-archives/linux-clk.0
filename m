Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C0B3CEB8A
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 07:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778053425; cv=pass; b=RAknXhBLRLQ7CWwBUrt/vuREHuaz5/ScigLWGMPmrJ2QLsyIOelImoByos/PD/q1vZ4fnjb3yL6uTemJuiHZCplczcpa6Edrd/WrbFaAy/QoMTxcUopQx0+5twBLIYX8Hzhk7SXCW0Xzrq5URBgMm9rzsJEuJBOhdgMNyTgEVbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778053425; c=relaxed/simple;
	bh=RFbvpvHKnRfMKRV5cipTG5wqX1hpuMNrtGYd3OURDQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g8PWQFjYTWg4VXsJ9zkftlP9h4YOr05y6/jXf5l8RvITsYwRKldJGLeWs1heyh6riv+D5t2i5ldmrkJJk2y+8fDHDwc7Vyov8kzyxGYe1b4qvjEiwpGmhBeOXnFHlRg1pJrgYE8f9UKdLKueNV3lk0sBytStjz+I0u6IaG1RYG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=hd3q9V6f; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="hd3q9V6f"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-364f7c42c62so3204418a91.0
        for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 00:43:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778053424; cv=none;
        d=google.com; s=arc-20240605;
        b=c4/NrYJUbAGOd6O3crqkoPn4/N4Yu5mBEe5U6IeBCts/yR8xEL4jNvAoTOQ5Pzume8
         Oee2QWYmqZ0GsovkpzPnU33BCRxcQlaPUyuSMZUO+OUKKl6KIw/Ho9IM3tjLfh2KmDee
         mBE0jsnH9BGY9OflFunCLE6+bIKdvkm2memlaqTz8BGB6fdUR9cZmhKof5K2y7JxlJNF
         7BbTkervcuWXMWV8CTmQri4mehXUmk+zDTA4jo7V7OtMdkZoIL/P6B2iQYTHd15Sqsbq
         hvwUIL5/SISI/d9BOHmSHKHe12CnFiPSfy8EjF8nd0336/l26LfFq5W/+x179mz9XCL3
         l7nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=g5P3Od/dQhtcZo5k/0Xi9Vgf4dbLkIvbPE4wYTTN+tg=;
        fh=KkFCEC8sH5jJPVsWu/m7JD5g7aGxOO3G+1tLlAA3+1A=;
        b=Iff6pOcGo0y9Nl4KOBIfwzkP/Oc82V8BIISxcs7TIieeSf0NdUCBERI91wS9wmTYAB
         UA1sbYe4vaU5J2JpL/KFG3YLzAFLlCqxEZN972o0sPcdMnuJ/st6zKbWswsdtvZn2t9n
         9qa+AsuJ93tROF9XMf1Niy5M8ipa1yxYVV50K16ZN9si3XoUIYWYsIuAVrAmmpe4tsMc
         DwFedeoa/yG4iFat82tJXrHRDuntIyfNr4y2pISKvJL2Zf+B+//wsds23BYSDFtfRVko
         G7i9Nx8tThMG150MPvbpToS1LoNRKdJw4qCTVMn9eiLpwUr3My5pWbLZoCDb+oWyoavX
         YElA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1778053424; x=1778658224; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g5P3Od/dQhtcZo5k/0Xi9Vgf4dbLkIvbPE4wYTTN+tg=;
        b=hd3q9V6fis79Fk8mHqWjo1BZ31U3SC/cFiMo0XOeRgutgKj4SLdjUfwzd+Cqkr9nTp
         BinxTIfBpd32IQ181CfM9CVpHbwqjw4m78uv9LxpvYCvq5A2pZyh1mF/Gl2iPYGouGjf
         c95bVaHmdiw40GtuvQ5kNK7ETGR5xTp5GO6f8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778053424; x=1778658224;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5P3Od/dQhtcZo5k/0Xi9Vgf4dbLkIvbPE4wYTTN+tg=;
        b=ZRXcX3zuN4EYIFTF7sZlZyPKCUqxPaQ5eMwWnS3DCT43dQETDCN87xmrXSkb80djSb
         s9KsRZ23Gc4RF+Pc6UFI4UOhcmDGbXmdmCtd5xf1G5IkPQW3rNoPq6Qgod03mMTujdVU
         2272ddcIGnvyDV5vow3ScZJbXJAkTlA0UJB6tObUrKFIbGT6HEAgV5ujxvjs5tX/55Hy
         I0ElqNmBTeaZpb1ocQev2ipjsZTyowmReZXs626eyUMoz+aYbtnJdXhB+YeKYgmCE7Gy
         LJcxinHWAOUB/YVvvaUfknhZNkoimyl0DhUCbciX6ETdZ8NxOmS7++kYGbf+6Vegnwhf
         JMkQ==
X-Forwarded-Encrypted: i=1; AFNElJ+yuIxrxQmJwxeDV2Rxn9CiCrwxH75qS5DDw+3M/pBzkaPb0JHIaharhrUX+90GCH9O7jDOTP4AOlw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMH+beVN66eVDWw7UT9X5fnoRRK5eob3EfsIeIuDM9p5uLHwMY
	5QSvWjKvRC8StxmQes+TYr/lXjw86Dqjeq6x3dS2O5nLD1DsKXaYMjOcYwSeyrw4mNdiXGHYXg4
	R6GIp1xpMayb8bxM+9zlWR2sEKRQQsaz19C9GRUuBqw==
X-Gm-Gg: AeBDievXVFtaVixe8uOXSZuLcObsNBAqYiRaXqbTouT6aDwVQFpGFow0logr6G3/B9D
	HT8Ues5f3J6ExTnLsjhTIlWSLhIUU5BuVYt0tPHdnYrPshZhrKpcWKVpqxyT+H9kCSp4JpMWN7k
	QJ0NO4nA98q7/LgHnehnaVoERup7tmu2nAOyJ5pKciPyfFLVYrIcSTX7DGZ3uGU8J4AxvgJia/S
	xQ+W6GF1KQXMr7/7tffoQy0/H3QuQKrTTy6OJtpxDMgclflEwJiy2RiNwS8FlyP1EsgzCdSNYVJ
	Y2cfWqlt5L+KkKYV7Zfw+IU0E02bjer8g+KsuCFnXy9h1pWOIsYXIt5mO8Hbro8JlFv7l4kzxaQ
	9tBsVE329oWAcEwM1JrgME+FBkpdfWC7fyEiQyGgs4fG/6yxwpRNRvcG/rZMyZ1PPXsW3qQi4H6
	oIShGvt8m1xzIvzMXy+RV9WiL6PZ+DpXeOAXFn19xKPo7vZYUEcgf++4keuRY1RXQXshzFMnYu2
	lHa8pg=
X-Received: by 2002:a17:90b:2703:b0:35d:a5cb:95c1 with SMTP id
 98e67ed59e1d1-365ac76b0ccmr2428335a91.23.1778053423619; Wed, 06 May 2026
 00:43:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505152908.302097-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260505152908.302097-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Daniel J Blueman <daniel@quora.org>
Date: Wed, 6 May 2026 15:43:31 +0800
X-Gm-Features: AVHnY4JCbXxxDzq14SSrsch6ke1ZEydvkRZgDuga2OQ5LeaqIKdcgjww-KpcPz4
Message-ID: <CAMVG2stysMiG_9J1+7s42yCfkBC3sm+w6DMJK_cR_qMAGC48pQ@mail.gmail.com>
Subject: Re: [RFT PATCH] clk: qcom: dispcc-x1e80100: Fix (possibly) dumping regmap
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 May 2026 at 23:29, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> Reading few registers at the end of the block (e.g. 0x10000, 0x10004)
> might result in synchronous external abort, so limit the regmap to the
> last readable register which allows dumping the regs for debugging.
>
> Reported-by: Daniel J Blueman <daniel@quora.org>
> Closes: https://lore.kernel.org/r/CAMVG2su+V5fcZ9LOC0Qm3bpfnhpbmQdJackc7-RvfztDL_dajw@mail.gmail.com/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>
> Not really tested, just idea based on sm8750 and datasheet/manual.
>
>  drivers/clk/qcom/dispcc-x1e80100.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/qcom/dispcc-x1e80100.c b/drivers/clk/qcom/dispcc-x1e80100.c
> index aa7fd43969f9..575ba90d2070 100644
> --- a/drivers/clk/qcom/dispcc-x1e80100.c
> +++ b/drivers/clk/qcom/dispcc-x1e80100.c
> @@ -1634,7 +1634,7 @@ static const struct regmap_config disp_cc_x1e80100_regmap_config = {
>         .reg_bits = 32,
>         .reg_stride = 4,
>         .val_bits = 32,
> -       .max_register = 0x11008,
> +       .max_register = 0xf004, /* 0x10000, 0x10004 and maybe others are for TZ */
>         .fast_io = true,
>  };

Great work! With this change, no system hangs are observed reading
/sys/kernel/debug/regmap/af00000.clock-controller/registers on my X1
setup. This and the same fix for the other clock controllers are a top
candidate for -stable.

Tested-by: Daniel J Blueman <daniel@quora.org>

Thanks,
  Dan

--
Daniel J Blueman
