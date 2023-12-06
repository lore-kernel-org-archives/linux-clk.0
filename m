Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="cD+d5TB5"
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21DAB1A4
	for <linux-clk@vger.kernel.org>; Wed,  6 Dec 2023 02:24:51 -0800 (PST)
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3BAB43FAE9
	for <linux-clk@vger.kernel.org>; Wed,  6 Dec 2023 10:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701858288;
	bh=LIKhW4ss/YSZZ/5dNTu3+bUFxFWLLuAd/satadt/iyM=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=cD+d5TB5FjLMIaJ+4CDCRRuCO8TyFw4N4NW/vFZnSxdkQDjdWvA61c1Q2mBI96hLE
	 0FFT+mpSbBLUQHAJh76m4ps1rFHMfqZbqYDhAoDvB4yIj4lI2gb5MP9/QjT7YhqDda
	 cbhR4wyZs46ehGhiC71/cnjYx5rmolvHc5QDX87sdgWaNH7FwxO2wC7Uasl9xrl0o4
	 ofWJgdtbcbUvc5QSELsS8Y9d+B7wF/N0FaEFHxU1/p4LuVAtVU2fQH5Fydjl3L+N3Q
	 dDi42H6jjQfLqjo4RWvWB0134gR9/ot8eVuctfFCj6gv/kDqgaba96hoWnLUaIiF84
	 c88L5TZalnnSg==
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2ca23b6f61eso2386211fa.1
        for <linux-clk@vger.kernel.org>; Wed, 06 Dec 2023 02:24:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701858287; x=1702463087;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LIKhW4ss/YSZZ/5dNTu3+bUFxFWLLuAd/satadt/iyM=;
        b=dZ1G/FNFvSeuHmZhhL92nYw8lSBYA65d79CsB0Og13FQnSpuvLT6E8+Nm7ao6yV6J9
         gTK+PfnwfnVLrUoOOwhjmFPoLQVcJj6H5MSR2PlJmKVgkttygm0EaHaQiD92e6yznZFL
         5OyDuQMGAXCO1HOFZq7QbA1vW9cviQtOEcnMx8D9C4LfBh7SP+TZ9zEpq+lUZtMc4ZQ2
         58YhnC0YdxUSn4qeldvUMJHAtBPX46e5CYSDp1nwkIyk8ogfBLnr/ZbfuducJ+z7alUx
         qUm0bIGHdTN7G7n/0BQiX3GqCXfLRO5wMn+7U3Nz1//4HGlB7nYvUbIsdzvNBsinRdYh
         nivQ==
X-Gm-Message-State: AOJu0YwicfiHuvJItasteXSIzlX1R9bsbsTDfOAADIR5s/QW/sDdUX4Q
	qraDE/EeRUx3WmrUSEAMwIV72hXPNpqh8N81XTGPl8wku3e5I2pd/jYP50ZarvcED0MMll7BWZE
	irvNcJCxVza7wWWjrZsDkohufIAfAvqksavUdmXTZOtro7K6tcJm6Sw==
X-Received: by 2002:a2e:a30d:0:b0:2c9:f59d:36b8 with SMTP id l13-20020a2ea30d000000b002c9f59d36b8mr512520lje.8.1701858287653;
        Wed, 06 Dec 2023 02:24:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCeINFJy0uhVhrZBDH15wYnuutrQXQWc7tS3R3VsQ92NNxf1Fzl+nhQI6LO6WIc+v6/wFypP12KWEtfWYx+EA=
X-Received: by 2002:a2e:a30d:0:b0:2c9:f59d:36b8 with SMTP id
 l13-20020a2ea30d000000b002c9f59d36b8mr512512lje.8.1701858287360; Wed, 06 Dec
 2023 02:24:47 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Dec 2023 04:24:46 -0600
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <IA1PR20MB49532959D6D95B0D9D5E6A4ABB84A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <MA0P287MB03329157B1914F38A3485402FE84A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
 <IA1PR20MB49532959D6D95B0D9D5E6A4ABB84A@IA1PR20MB4953.namprd20.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Wed, 6 Dec 2023 04:24:46 -0600
Message-ID: <CAJM55Z9CCH3n5g4_cRid-inr0SU_Kk39AhbrCavGJKhOoz=asw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] clk: sophgo: Add CV1800 series clock controller driver
To: Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicorn_wang@outlook.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chao Wei <chao.wei@sophgo.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Jisheng Zhang <jszhang@kernel.org>, qiujingbao.dlmu@gmail.com, dlan@gentoo.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Inochi Amaoto wrote:
> >
> >On 2023/12/5 19:55, Inochi Amaoto wrote:
> >> Add driver for CV1800 series clock controller.
> >Add more clarification on your changes. Seems you add several files with different names for different products, what's your design idea, please add some brief introduction.
>
> In fact, it just adds the driver for the whole CV18XX series. I do not
> think its clock controller has something different for different product.
> The CV181X does have more clock, but it shares the same driver code of
> CV180X. All the things just follow the manual and are for the hardware
> design. Anyway, I will have a try.
>
> >>
> >> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> >> Link: https://github.com/milkv-duo/duo-files/blob/main/hardware/CV1800B/CV180X-Clock-v1.xlsx
> >> Link: https://github.com/milkv-duo/duo-files/blob/main/hardware/CV1800B/CV1800B-CV1801B-Preliminary-Datasheet-full-en.pdf
> >> ---
> >> ......
> >> diff --git a/drivers/clk/sophgo/Kconfig b/drivers/clk/sophgo/Kconfig
> >> new file mode 100644
> >> index 000000000000..243d58a30117
> >> --- /dev/null
> >> +++ b/drivers/clk/sophgo/Kconfig
> >> @@ -0,0 +1,7 @@
> >> +# SPDX-License-Identifier: GPL-2.0
> >> +# common clock support for SOPHGO SoC family.
> >Drop this comment line, moving forward, this Kconfig file will be re-used for more different sophgo products.
>
> Why? I do not think this have some impact on reuse.
>
> >> +
> >> +config CLK_SOPHGO_CV1800
> >> +    tristate "Support for the Sophgo CV1800 series SoCs clock controller"
> >> +    default y
> >> +    depends on ARCH_SOPHGO || COMPILE_TEST
> >Suggest to add some help words for this config item.
> >
>
> There is no extra information other than this title.
> In fact, I think the description title is enough to describe this. Add
> a duplicate help is useless.

I'd also like to see some more information here. Eg. what are examples of SoC's
in the CV1800 series. checkpatch also complains:

WARNING: please write a help paragraph that fully describes the config symbol
#337: FILE: drivers/clk/sophgo/Kconfig:4:
+config CLK_SOPHGO_CV1800
+	tristate "Support for the Sophgo CV1800 series SoCs clock controller"
+	default y
+	depends on ARCH_SOPHGO || COMPILE_TEST


Also the driver says "tristate" here, but defaults to built-in. If it works as
a module it should be default m to not waste memory on systems not needing this.
If it can't work properly as a module then tristate should be bool and the
driver should be updated for that.

/Emil
