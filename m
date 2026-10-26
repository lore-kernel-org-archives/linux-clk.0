Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793003854;
	b=mghyK9dWfoLkVygrH2PHOp4ftRsDdMYwtB5w+g75n/UaEriNdlaqqDmfs0j0WiLQJJWa
	 DCmXzIc3cQeUMmwD+Z9R2h1dLwjyjner3VxT1ZWN2/ww8aB/qJ4Kz19fWgbjBgNVZ/dqy
	 TQnqc6eav3vtnALttEqK2xa78gtggcZwiq4IGkAomdAWJPzGeG22K004plTR7rarUa0Hr
	 STd2DHAEzXG2B0b5kWxIX/ADOimaNQrD67E7K09Uic18tVEt+AVlCpL3vDBb+axrEpNIC
	 KdGUYhESx2WsBUImRB/nFIsF8qtfXF5yTkeeVFKppOUk6jh3ByK+ebukZWqb6piJNSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793003854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=DUCKXpFhOMZBT2HnErNgc1GGFPbfPUwN4bKfvKKAN5I=;
	b=y4AOZsIRqtUnd+6dequ3k9lU5EcodqVEsfQ9LSq2bLehcuVBY9duurJdRmY4/dFHH3xS
	 n5p3ATVIja8XNKB7nD2/guRmIXdy6FbFbJoYuoa+7tuzd7d6o/9pFwx+Y5VabiCVGBHNm
	 DReqKELktNTS3SkYxgfv49iDmdMxXeqjIU187dGn54nl6xTBqzIbLCyJ8/RmchCnSS4z8
	 3rJDblsHYWw4QsePLGBZWeC+c9XsOheWa8Au5CqF5SlzhHM4tW1Wi7M98jBiYL6XHqs+d
	 sMdgzxFfFhtAI3bGWvw3OZw1fg5AQJT6vsS0iGhe5NURqJDf/jBBNcJ9MHqH3qFTbOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=BsO8qC9F;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE28606A31D
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 08:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FE28606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=BsO8qC9F
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e20edd106so2345532f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 01:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793003852; x=1793608652; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DUCKXpFhOMZBT2HnErNgc1GGFPbfPUwN4bKfvKKAN5I=;
        b=BsO8qC9F2lOPtizlCkLobBeDKo4VQrsOUuJGH/4KWvKOlrPpYOCzISiIvipa8qmSzw
         l8Lfqk7a4UUWjyqof3zy2lF5xwhnjuOAKQd3zdKE0Bto3CmWD84GGOf0om3tquqAImA+
         +elsN2pWhKZjySDOJYoRmRAp9AGobzxKWeXfTItdztxUt7yD06bLS1VzyGwj1IfhHKnh
         i0KApEtUYN7KWz1sdIeDml7OdanoI2NIVx8ubkRoDv3bgHlj4mfYNV1i97fGdL9p6CEe
         J5UwZmveldODhXwblREBXLDqfIhHar2Ufm18GOc1Pnq3nRQQ0Q2fOSVr4+TTa939nBMO
         rMeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003852; x=1793608652;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DUCKXpFhOMZBT2HnErNgc1GGFPbfPUwN4bKfvKKAN5I=;
        b=y3EkDnZ8NIPvQih3rlF2SeidgGQCrSVqW92ZkOGwKFlKhm9dVaoIVbXEhoXP4hkDYc
         RH8QOkxE1pHzsFJVB517AGYZXuX+jKnQVeq6gYm/0uKym0SrslVkdfA121TbcJLF4k/f
         hFfbsvAVttl5CxLStqHczf69umTUI6GmJHA9zqkIGucYRBQQlDlpEX30ht6pBhwJz4sH
         IvWloZQc4S5YbTPB1K8x+HWo7cPGpym3qz2LPXkG4Nb0Kl8LVorjVeTZkdCGgEHwtqpK
         9o6m/p3P4ezsiDlkXw4lVtywSdnbACBJ9XHWzikkcYXo2q/AF+wGr7hHWY8sfbsdZw9u
         XPLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKZJXi+oaQRJ4zjz3vBBXS3UYXJhDVjR0jyvBZnexvtGPHb0MOptMs2HPApGh2WlHnQQXoH+ilYkk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlhrsBg4jLtfXOPRzPt+NPAkwcQVFnoiAc1DeG7N7+E8HTx4ve
	uIsI9z/+Lu9u9+/a7V37LA6WL3cVzJxUARJYjkd/n0yDRFiq7QZv9rkPaSVcmCH9Fxc=
X-Gm-Gg: AYBFou2ZBdRKngvK6sCkzYDMA70+0SfQMSb1gac4bWuGKxcMpdZfnT6cgkQODV+4YE7
	jBxZ6XNR9M09JGC650mzgZOuAY2ukxNWsco7TjpnpmIiaB2JNiKLZSlZO6xAOjnkyk+6LpYah1f
	TdoycC+e4eRwnRrqIxpRLA3xQCfw1KAzlNYwsY7FAL4pa6GcV0utqK90S34X27HPKZJin7PIdd4
	6QIu5Oxma8xtqjj90e4D2c1mKD8FLcxMI5ilWW5VgZ1+cJF3ideZ1DCU8kxy8/2xuX3lk/KSVQh
	bFuFc+VLy0oMn0twjo8gcT6sQ9s7tW6yLCQzzXGsVZt3YUvp1qt6BIDqpNL5CapgWWDTawUxF5D
	ZMOA/Jp1rv4DhjAdEAgDNKQy+JHRoAc7RaSD2IVY0Lkv0dXZyoIgD2lTZSdlwjWvyYSJV3CBqc4
	jTIDAR/P3P4i8ciuq+gpe8uFr6yfcRI+WLy4qXLOjJN8pV7XOayj04wpIZGds/1vzIBiOFfzCyU
	3ofPai0NIL3/cKxRrwqbGyyG5rm4+qMGU+rlSyCMsjfHHRQzyYzLTIe4AqBL126QR+eOr5Ktaaz
	0rskBO26mJQz4yoa7KKbBA==
X-Received: by 2002:a5d:64ed:0:b0:487:1575:ebe2 with SMTP id ffacd0b85a97d-48e3eb96fb0mr10894843f8f.44.1793003851960;
        Mon, 26 Oct 2026 01:37:31 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e542ed998sm73219f8f.13.2026.10.26.01.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:37:31 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: christian.koever-draxl@student.uibk.ac.at, neil.armstrong@linaro.org,
 sboyd@kernel.org, bmasney+clk@redhat.com, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, yu.tu@amlogic.com
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>
Subject: Re: [PATCH 2/2] clk: meson: s4: propagate rate requests through the
 CEC 32k muxes
In-Reply-To: <20261025191852.208226-3-christian.koever-draxl@student.uibk.ac.at>
References: <20261025191852.208226-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025191852.208226-3-christian.koever-draxl@student.uibk.ac.at>
Date: Mon, 26 Oct 2026 09:37:30 +0100
Message-ID: <1jmrs0kgc5.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On dim. 25 oct. 2026 at 20:18, christian.koever-draxl@student.uibk.ac.at wr=
ote:

> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>
> The AO-CEC driver asks its core clock for 32768 Hz. On S4 that request
> stops at ceca_32k_sel / cecb_32k_sel: both are muxes without
> CLK_SET_RATE_PARENT, so it never reaches the dual divider that can
> produce the rate, and probe fails with
>
>   meson-ao-cec fe044000.cec: core clock set rate failed
>   meson-ao-cec fe044000.cec: CEC controller registration failed
>
> The equivalent G12A mux, ao_cec_sel, carries the flag, which is why CEC
> works there. Add it to both S4 selectors.
>
> The other parent of these muxes is the RTC clock, which must not be
> reprogrammed on behalf of CEC, so boards should pin the mux parent to
> the dual divider with assigned-clock-parents.

Again, the change is OK in itself but if you are going to assign the
mux parents through assigned rate why, why don't you assign the parent
rate too ?

You are doing half the job in DT, half in the driver, that is kind of
odd.

>
> Only the CECA path was tested; CECB is the same defect in the
> duplicated block.
>
> Fixes: 57b55c76aaf1 ("clk: meson: S4: add support for Amlogic S4 SoC peri=
pheral clock controller")
> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
> ---
>  drivers/clk/meson/s4-peripherals.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-pe=
ripherals.c
> index 329cd526749e..8e303db6154c 100644
> --- a/drivers/clk/meson/s4-peripherals.c
> +++ b/drivers/clk/meson/s4-peripherals.c
> @@ -407,6 +407,7 @@ static struct clk_regmap s4_ceca_32k_sel =3D {
>  			&s4_rtc_clk.hw
>  		},
>  		.num_parents =3D 2,
> +		.flags =3D CLK_SET_RATE_PARENT,
>  	},
>  };
>=20=20
> @@ -514,6 +515,7 @@ static struct clk_regmap s4_cecb_32k_sel =3D {
>  			&s4_rtc_clk.hw
>  		},
>  		.num_parents =3D 2,
> +		.flags =3D CLK_SET_RATE_PARENT,
>  	},
>  };
>=20=20
> --=20
> 2.56.0
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

--=20
Jerome
