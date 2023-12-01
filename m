Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tSFwR5W0"
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 831A21993
	for <linux-clk@vger.kernel.org>; Fri,  1 Dec 2023 12:13:25 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1d065be370aso5090055ad.3
        for <linux-clk@vger.kernel.org>; Fri, 01 Dec 2023 12:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701461605; x=1702066405; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z3rjxz/DGxu24GsmHPsJcKIMXuhLYYUkDfFjYzr+Skg=;
        b=tSFwR5W0KZoLz2swN64EUPYq+bdUGsZvyEbT5ODipbl8cYs5fPPzZW/CSncEj4Cpe7
         twiKw0ekvf83+PQLw02wf92YHui8CVNwGm97jR22vVnSk0htpMxgIUoqTKV8KilDmENe
         QAjubZIIRUOirSxQNKLY6IcxunDGr9MzM8uCSl9zKW1ItKT0043Q/EYsyD4aU1LU9bvv
         yo/3gWBHG/TZKoj3HyOy1h0v+XcPcZ0xP9sLC6A6qsHefcEkrQqfWrp6We46xlrkfnVn
         NWSxANLTYEqwAXxSVGuBdywgqMLFbjW6pDEnJQ9n7SstLGzQyOwTS3SrRfgVCxk+wyB/
         CDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701461605; x=1702066405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z3rjxz/DGxu24GsmHPsJcKIMXuhLYYUkDfFjYzr+Skg=;
        b=aablSqXbelcwR4G4mIaN5gE6a6RnqQbQl/qvZj3tF3O2FT2p1CrwVUd3pXFW3xncFe
         lhrAd1dV3t8fGM2Fa6Y5C7jUqnqCJOx5jMr51t5RBc1RhMQFyVFBwvkgipBSk4kTfwRJ
         V5lIgHd+ig+okMszlGvs/ML9uSfZoRwQk7mIKz/sRSfz0Yka1nAqtQWMq17EPAmiW+0P
         VXE/LqJmdilF4wF7LVndm7uQ7Od47Q7vkr6dXF0vXTNhpD6ewUGZjG04OnzKqh7dHajw
         muFMWrDjsUOohAId4+NL25h78kY2zZ+1O3Mlb3BtoSh12vFy5TPPSTl7lMA6pvUlBFJn
         YCnw==
X-Gm-Message-State: AOJu0YxDXPsWZQ88tAkUaYqfO+Eg+dhTJLaHc4uC7XYhYu3v4hAlA84d
	AtX2gMmGuCk46PC6VnV11LRxY651La0eQawjWlgbvA==
X-Google-Smtp-Source: AGHT+IHkEyBcFrICiGFLOM8wMi5B888ezZ7RSvNyP3OK3Rh9MsRoluODUxrTWHGQPO04o2OjahKipeMHCbUIGEDXEfY=
X-Received: by 2002:a17:902:efc1:b0:1cf:fc8f:3fb6 with SMTP id
 ja1-20020a170902efc100b001cffc8f3fb6mr76235plb.17.1701461604899; Fri, 01 Dec
 2023 12:13:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org> <20231201160925.3136868-5-peter.griffin@linaro.org>
In-Reply-To: <20231201160925.3136868-5-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 1 Dec 2023 14:13:13 -0600
Message-ID: <CAPLW+4nNuRXB8a6M0dmWhFZYkSu62M_nAW3aBeV5wfedVLkraw@mail.gmail.com>
Subject: Re: [PATCH v5 04/20] dt-bindings: watchdog: Document Google gs101
 watchdog bindings
To: Peter Griffin <peter.griffin@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 1, 2023 at 10:10=E2=80=AFAM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> Add the "google,gs101-wdt" compatible to the dt-schema documentation.
>
> gs101 SoC has two CPU clusters and each cluster has its own dedicated
> watchdog timer (similar to exynos850 and exynosautov9 SoCs).
>
> These WDT instances are controlled using different bits in PMU
> registers.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  .../devicetree/bindings/watchdog/samsung-wdt.yaml         | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml =
b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> index 8fb6656ba0c2..57468c2c5ece 100644
> --- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> @@ -17,6 +17,7 @@ description: |+
>  properties:
>    compatible:
>      enum:
> +      - google,gs101-wdt                      # for Google gs101
>        - samsung,s3c2410-wdt                   # for S3C2410
>        - samsung,s3c6410-wdt                   # for S3C6410, S5PV210 and=
 Exynos4
>        - samsung,exynos5250-wdt                # for Exynos5250
> @@ -42,13 +43,14 @@ properties:
>    samsung,cluster-index:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> -      Index of CPU cluster on which watchdog is running (in case of Exyn=
os850)
> +      Index of CPU cluster on which watchdog is running (in case of Exyn=
os850
> +      or Google gs101).
>
>    samsung,syscon-phandle:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
>        Phandle to the PMU system controller node (in case of Exynos5250,
> -      Exynos5420, Exynos7 and Exynos850).
> +      Exynos5420, Exynos7, Exynos850 and gs101).
>
>  required:
>    - compatible
> @@ -64,6 +66,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - google,gs101-wdt
>                - samsung,exynos5250-wdt
>                - samsung,exynos5420-wdt
>                - samsung,exynos7-wdt
> @@ -77,6 +80,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - google,gs101-wdt
>                - samsung,exynos850-wdt
>                - samsung,exynosautov9-wdt
>      then:
> --
> 2.43.0.rc2.451.g8631bc7472-goog
>
