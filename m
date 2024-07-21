Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AD7D530
	for <linux-clk@vger.kernel.org>; Sun, 21 Jul 2024 22:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721599689; cv=none; b=D8m92/g5qj+e7Boddo68nLmoujJ5kieW5Q5uo3+uHWSjXcxm55VNFh48vvpz57YFHVfKs86oth0f193r1zIcgzwkbD7lhAC6H6lENl8qXVtzd8PZgKOZ985bQXvyH+xECwMI14Jq8Yw0iGkwEcVbrC6dNIK5row6pZyaisALJLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721599689; c=relaxed/simple;
	bh=NvQhgqZ/eJ4eay+hcTekcrXMx75pemCUoA4q7W94dWo=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A6xKubtXMZyin0DwlM8/hryJsflFstbJe91HYpNKVOuoEL7vrgIZGhBBPlRY0LfuXwMkklSqwPoneHCgDPkI5LFUjYLqLGQ6lk3xq8rZvZxgdkdX0eEskAq3QXtBMPdTXIZ8ybumClludxKniyoDwhMrvlk5Jsyq52SBzvJoJHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=V7j03+qr; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="V7j03+qr"
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D15623F429
	for <linux-clk@vger.kernel.org>; Sun, 21 Jul 2024 22:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1721599679;
	bh=y5sr3lEv07by+NAwwOdiyaM6+TTZ7xKpJ82kUwR7sbg=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=V7j03+qrzYXaO6hBgVfXmic6Zbzm3///tcOWb6pDfrgs73AqiSADzcTS6b3H87zBK
	 3rqZdGtK/CLc7xLQOzOS2cR74fGNMNKIdwDrzAjwEtSzvxjaxpNbmUzItGFEkFaq2G
	 J7pZzT5cUcwqILOp6FRWf7s1fZr78fRXzodT4oZwHy4/gKbBBKKuomAgRMxFLNCIlr
	 1yIllrdAHyua7gn8OH10yUf0TUlwbFtoq0KKHpQgNqZf96nwFCj7nGoPc1zH5eCvRT
	 ZBO/n5Q7OlYBuaZiZkHrasKsP3USAyBSxj7+d/voC5NWrMcRNxKvSx4ZUdUvTG5B2k
	 pOyf89EL2rznA==
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3d92b366160so3447821b6e.3
        for <linux-clk@vger.kernel.org>; Sun, 21 Jul 2024 15:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721599679; x=1722204479;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y5sr3lEv07by+NAwwOdiyaM6+TTZ7xKpJ82kUwR7sbg=;
        b=Xm6xm4n6VfttsUvdozt8t2O7ebYySLDPtkTm4Dz4MFV4NBiZTkjAxhIMVS6ZVWDwhI
         t6WUEYl/dXV2O5uireu6gkI5sK3aKMGaVRqFL/52tdIARx1E+pLtE8G7pyqpbny8RbT3
         118sNIcAycNhl5otzp+Z/sgb4yXLiJKU0nb+3ucSOwfKgfxICVbsD8vO0QGH0t0p5krw
         iIxnwkoD6LxKIPYCrXSr66B+NYJ5b9M7RgfT3SdvJg5MTgaMEjHkEJiE8Mop69gV1HO2
         1NomU2YIqpfirurOJmGByXV2sKQ52Pql3sf8ocWd1XpQ7/ATpINNZNtz3b29xIGPpJBY
         YfbA==
X-Forwarded-Encrypted: i=1; AJvYcCV+3emIPBo67sHUHjyzM1jvdEUPIA0/qRBI/SGXLe9Wq2rGsMw7moNnXktz8CL/JvJlF8/gbIQT1IMnZrSpt4dLTbJyGlkGRsQn
X-Gm-Message-State: AOJu0YxWHx0Utvr1GiazckDm1+EVmYeIC6lQsAoIHu4rw0kg7vwNA4Xs
	LptXfTIKDEFVACjG3QlSWY0US5dIUVsoxmu7UuCs/I8/7pmweWnj3pFaKE4jesJdhBTamG40pBu
	pDTNwMOGbaz/blWGlsyeCVbKRlN3h+SEfPKNVxeoLqGAvd3mNPH8El8Lr6A0w+ab6/jTvG/ao77
	517urIMLJAxbgyOLq6myj6iNHVyPZAa3f2ps8SlmpagAlBAfD+
X-Received: by 2002:a05:6808:2384:b0:3d5:2e2f:bf9 with SMTP id 5614622812f47-3dae5fd6b6emr8114719b6e.30.1721599678742;
        Sun, 21 Jul 2024 15:07:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKu3rxDjbynntjHH+0+p7b3ltQUv9i7hhvrMnwR7SAjBoMSrD4QUg9VCnWIvxOUrarV5om39CY87FNWsSBz4A=
X-Received: by 2002:a05:6808:2384:b0:3d5:2e2f:bf9 with SMTP id
 5614622812f47-3dae5fd6b6emr8114702b6e.30.1721599678304; Sun, 21 Jul 2024
 15:07:58 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 21 Jul 2024 17:07:57 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240711-th1520-clk-v3-3-6ff17bb318fb@tenstorrent.com>
References: <20240711-th1520-clk-v3-0-6ff17bb318fb@tenstorrent.com> <20240711-th1520-clk-v3-3-6ff17bb318fb@tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Sun, 21 Jul 2024 17:07:57 -0500
Message-ID: <CAJM55Z8uo-Z_9ruyqygK1pbBCTkCxMBVoF8GD2dajhTKOYrAfA@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] riscv: dts: thead: Add TH1520 AP_SUBSYS clock controller
To: Drew Fustini <dfustini@tenstorrent.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Yangtao Li <frank.li@vivo.com>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Drew Fustini wrote:
> Add node for the AP_SUBSYS clock controller on the T-Head TH1520 SoC.
>
> Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf
> Link: https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/tree/main/docs
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index d2fa25839012..10a38ed55658 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -5,6 +5,7 @@
>   */
>
>  #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/clock/thead,th1520-clk-ap.h>
>
>  / {
>  	compatible = "thead,th1520";
> @@ -161,6 +162,13 @@ soc {
>  		dma-noncoherent;
>  		ranges;
>
> +		clk: clock-controller@ffef010000 {
> +			compatible = "thead,th1520-clk-ap";
> +			reg = <0xff 0xef010000 0x0 0x1000>;
> +			clocks = <&osc>;
> +			#clock-cells = <1>;
> +		};

Please add this node so nodes are still sorted by address.

> +
>  		plic: interrupt-controller@ffd8000000 {
>  			compatible = "thead,th1520-plic", "thead,c900-plic";
>  			reg = <0xff 0xd8000000 0x0 0x01000000>;
>
> --
> 2.34.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
