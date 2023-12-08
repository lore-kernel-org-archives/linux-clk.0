Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="oGsCiZm9"
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F52BF9
	for <linux-clk@vger.kernel.org>; Fri,  8 Dec 2023 09:40:05 -0800 (PST)
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 35CFC3F79D
	for <linux-clk@vger.kernel.org>; Fri,  8 Dec 2023 17:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1702057203;
	bh=0Wg7c2RtoSlacNEX+QsvU/G8vYuCUeUJAnALPbL3Qqk=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=oGsCiZm9In+2jXgImmVL8dzSuruyfGsL4cWAkffTvth1Fgi3Jh4711hMmuS3PoFqB
	 mtpV+RGxpHG0jIsqPLp8u3siYu+1AD8QH76eW1/5Rcm1/SSdNnVvOMPlU/yQr76xIM
	 L4PoMxeisdI5zwBQULSzRfl8/vvFrCvEWbdQ492IAmFBJFGMGCVtG6mf9VsWszzmJ+
	 uwDHWlApmS/T/IT+JabMCkqW+WdBPEcWMH1hXmBvuO0v8r0q6s1uDVbwXuDxPw1I3g
	 BTQJcwqC667CZQSYGYT0TdQxVv8th2V/4ymADhDTyzA1O4/kYwa2xo0tiI/PK4Wq2a
	 ooi27HTcQLIWg==
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-1fb1f23d1bcso3681389fac.2
        for <linux-clk@vger.kernel.org>; Fri, 08 Dec 2023 09:40:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702057201; x=1702662001;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Wg7c2RtoSlacNEX+QsvU/G8vYuCUeUJAnALPbL3Qqk=;
        b=UJJgOHU3eGVPe0ck7DCB+VxLg8Wto8OHma3HVI2sWD+Qdp7dWrfTVBE7zqlaUDHw2X
         2rOIxi5tJ3/XcTqYOLSsn6KxVvuiiEraxsbT8+sfsPEhY8uObxtpbSfEsftLEy4jhmKx
         sAlr+vHSjLOMiRr/YjWJfQoqm95QrRbBp1e2pCH2ZShqlxSB6Vq1U4E87qPiJkue/029
         yLMLi6rCqdvwp1KIWGAgKcirei1bDX2O54ULUn2pX+p2t/wJ4+psUF8j58VlPPssBW/S
         cHlEMVJw1qIOOVe9TtA7I5kHsRtMT+XZQz9OgEEUswHn9M7XdNIQPkrEKWSaiTFyI+/8
         TR0Q==
X-Gm-Message-State: AOJu0YxTAAb/+18Q7UwaZcpAA1/N0Sm4G563aCUzpxXN9igJU6lRMLjA
	zeROCO/adeCkQReEc465hJyu67g725Pk2/jAA4rtMQGPTLm2HbYnxg/VC/p7bDJUi3/3VxPsnIV
	oaiD64j7MUChfyyTz6yCqrRSDYqjn42oMm9IYSJf2lGOYKxXDhOQxGw==
X-Received: by 2002:a05:6870:829f:b0:1fa:1ca4:b917 with SMTP id q31-20020a056870829f00b001fa1ca4b917mr505709oae.41.1702057201371;
        Fri, 08 Dec 2023 09:40:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvoxqbD9MmiUzi/kijiStuj/gY6AFJbn8AI5LFKGHA7PcQEWa4r0J5A0xv1noNymQSla3/fUfHzp1Y4889ZZA=
X-Received: by 2002:a05:6870:829f:b0:1fa:1ca4:b917 with SMTP id
 q31-20020a056870829f00b001fa1ca4b917mr505697oae.41.1702057201119; Fri, 08 Dec
 2023 09:40:01 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 8 Dec 2023 09:40:00 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231208-unripe-maximum-fc77f4967561@spud>
References: <20231208-reenter-ajar-b6223e5134b3@spud> <20231208-unripe-maximum-fc77f4967561@spud>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Fri, 8 Dec 2023 09:40:00 -0800
Message-ID: <CAJM55Z_ozf=MwOJCSM154L__TE1Gv7Ec=gM8LFJ31-_eX66OKA@mail.gmail.com>
Subject: Re: [PATCH RESEND v1 1/7] dt-bindings: clock: mpfs: add more MSSPLL
 output definitions
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Wolfgang Grandegger <wg@grandegger.com>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> There are 3 undocumented outputs of the MSSPLL that are used for the CAN
> bus, "user crypto" module and eMMC. Add their clock IDs so that they can
> be hooked up in DT.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  include/dt-bindings/clock/microchip,mpfs-clock.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/include/dt-bindings/clock/microchip,mpfs-clock.h b/include/dt-bindings/clock/microchip,mpfs-clock.h
> index 79775a5134ca..b52f19a2b480 100644
> --- a/include/dt-bindings/clock/microchip,mpfs-clock.h
> +++ b/include/dt-bindings/clock/microchip,mpfs-clock.h
> @@ -44,6 +44,11 @@
>
>  #define CLK_RTCREF	33
>  #define CLK_MSSPLL	34
> +#define CLK_MSSPLL0	34

You add this new CLK_MSSPLL0 macro with the same value as CLK_MSSPLL, but
never seem to use it in this series. Did you mean to rename the CLK_MSSPLL
instances CLK_MSSPLL0?

> +#define CLK_MSSPLL1	35
> +#define CLK_MSSPLL2	36
> +#define CLK_MSSPLL3	37
> +/* 38 is reserved for MSS PLL internals */
>
>  /* Clock Conditioning Circuitry Clock IDs */
>
> --
> 2.39.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
