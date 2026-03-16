Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18E62367CF
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 11:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773658982; cv=pass; b=q0JAjqveaXZVjH2d1ng8eekdYbNrwfud9YULpUv7O0KdQdUCfPDqg+oJWWWeXT5dpvH9lu08y7HwlP1RlBTEoCJrwPe461n3Bzo7wStiek4MBpjOEBxipZZc6oVdQcjPu9zcRa1USvx/D1VnVfB+hYKs8CPqJvc/QPoRoUqcbi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773658982; c=relaxed/simple;
	bh=ps6KqBz3Tolb4OztqKZDKSfuCF/1Zo/6VCi2Bz089KQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FrxrIWYo5EG4Ktg4aPwQ6baiXutI++dtsRlFXBkGRquIhc5J0frbm4dFMRiszStpUpFnlU1Q3J0JDDoUepl5iEPu7p8HnauV/CrryQLRf/dBPHTNvrQe7dtNdZEkXZ5NHIZMysvWfAR0iGBvSwW+eDa5trQzDO/GQ9QLyzMSoMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ei+aqoCN; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ei+aqoCN"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59e4989dacdso4983111e87.1
        for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 04:03:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773658979; cv=none;
        d=google.com; s=arc-20240605;
        b=VZRZfGSyKTC4gbIn1p+6Vj21IXzo46ipWUSAVXXD6YO/tn6D3j2XrgxzC3LHAMZbMT
         g/RF8I6ZH2e6YveaicXvwtaNzOxys6ljJik4UdcmGIKKwfoTUEinRxBKkWHQkr086Rvz
         /+lNJXwdo58inylMtJqhAPZ0u930JgOls/PUyhMeqPVfQZnL8E3SdLVPeS2QkhCCA4tU
         xqBGtxX0FB4DYAOiIYeGMEmplKy3JrUZDyG2cJmOxK+ypluAMBtH1ce4bFjYrvCExldJ
         RUo7CylQn2RvZk/ABC059RAFNKiCi/ubXoJu8ZvyjK4q5v0lt0TFn9/LP1AP9Jvh8QMY
         sWqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LHF5jh1E/8cDW6oFzgL0o++DHKJ5vfxqmY6kxOKCXrg=;
        fh=dHovL/2/4FQB/4UCXMMZRQ8DboY+KBkUL11TWw2OGpM=;
        b=B3aKpE+eGFkISgnQ5ENyVg6W/DkE6ilKeEVhBjrHexReFyowvJ8CGEInGhcIwD31NO
         sFb8o8cN7luQXbrAjALVAnJHxXALTmJfW3WptUsaRMoVY3+cRO+ON2gAbJSUWBN+PZOC
         CIBzM8N+WEDNHUt5u7sQ1a2xvs7/SwTH5XicIUhesdwMXItgvrV3gMm6FWh7ayxMyrmU
         okdNG3N46//qy6MHYk4iWWzDvj+QRvVu9mQFDZbiFV4Mu0QY2ocb5pMdo7iNpxB0g7DN
         dhxcf+H1FSMSLxbNHpH6NspaxrlX3+zFOC0U9NYNLXjKqMqO+bLFO/5UuPj2lEiUMeju
         S63A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773658979; x=1774263779; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LHF5jh1E/8cDW6oFzgL0o++DHKJ5vfxqmY6kxOKCXrg=;
        b=Ei+aqoCNSVPXPa76BzbrgxSc4q7IzkNfHuc0dlBwMcmnbKbCi3Bb9wERR8FK4iGk5P
         VF5lKXdfxqCXu5MAVy8aXm41UlQQwb1MrjkyUCnJetXuhGDq/gO5bR1nntx4i+9jm7el
         H+1lzPjEIF5+z7WlYe+1IAK/vWHaxmEPN2EvluBiJbSDbSJ1+CcMHR4UfWYXpQqUa0qs
         c25p+tWIScmB9bLl0Dknre+gNPFbbfnGxZUanu0q6XIMxOKEK8WLrYvfBcmdRh5WhblE
         R2Dl4xLKEyO6iRJQrJlfLfNPPYxTnwKs9LekvYCVnSG11Uj37ejbx6ykG0H8/W82hWl+
         1eyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773658979; x=1774263779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LHF5jh1E/8cDW6oFzgL0o++DHKJ5vfxqmY6kxOKCXrg=;
        b=dY7558LDNhBJQHvJbt4yPhggG1111Zt5FZ43BYyYedKvaPodxCLAg8HfOUnLYCK1QX
         czxzsIa5dGsdqmfNDWeDB22NbSe35EmGu61FTjcMBR7JcfHxo5rJ6DCy7aiE+s77/7+0
         485azh20m3h+TQ6YwRVX7XaWiXNkivLKYSTQ5BWVyUpGrUpf4ABkrm+cxVD4BQhClr8+
         DK47JgN4OMmEF1A+ITLAJpUoxvY83IKtudg1jHsJn7yAmr9st34WBmH62TzyCXeAfwqj
         26eQugAz+psPGW/QTXpQRyJi+nKnpXWFEqw0I85aEBN/JPaY6tklXsGSrk+HD9UzQvoG
         FQWw==
X-Forwarded-Encrypted: i=1; AJvYcCVWYTgvwXebfROYrwk1iDQliowknFRmFnxcxu4uGJsC8S8+fJV2oI0u0NBKnzzRiDONfqsNE1hygWo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlRa1t7rdjusasYXU/jmY9jh7p5C5MxD+agdLjdbSkEyh+xJL/
	75hCJmeUBRhbSkK9lRBSgQhYC2A3LJoyFXrREug//KHu0GR0V5RUUWG17iHeWW6SxdtJbX6SKh6
	VccBYYZ+lS0w6kyY+rJgL4jtLMIHpMg3fbBCJgkJwKg==
X-Gm-Gg: ATEYQzwzTcWkkB8erwJOed4JvNne81DVol39vUZdVAQoDov3YnY/Re0K249thkioOQK
	UzLtWS8vItIcY4a+RtXnSV1eGEBIx03JH0yGljNFiTJpBbD4WpXx2lIOkkZGmvfpw7odv5s3etH
	icGCdJ88qh4z41uAzYL42S/l8SWYvc55QCzAepbR7Z4wh4/4n50jwisRodqpMFS3s+akIeeHrGg
	jDp3jr+aKEwtc2x1Jq9ZZp/Kt/DYSbFBQaxNNMKus6DBUd7lNZmzsWniR7xeYqb1S/9J3JyGEqE
	d+ZDQe1C
X-Received: by 2002:a05:6512:3d08:b0:5a1:476f:bbcd with SMTP id
 2adb3069b0e04-5a162b1febemr3904293e87.44.1773658978742; Mon, 16 Mar 2026
 04:02:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312-v3d-power-management-v7-0-9f006a1d4c55@igalia.com> <20260312-v3d-power-management-v7-2-9f006a1d4c55@igalia.com>
In-Reply-To: <20260312-v3d-power-management-v7-2-9f006a1d4c55@igalia.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 16 Mar 2026 12:02:20 +0100
X-Gm-Features: AaiRm53iPYU3kIDyxQsV0KhFz9ohyZ2kXqcNJl_f0uC65KcEG9ey-Zyr9y0Dr8Q
Message-ID: <CAPDyKFqqdGG34+a7hY8feNHsnJsHvq0M45Y5-hDJp=bedHcZpg@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] pmdomain: bcm: bcm2835-power: Increase ASB control timeout
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Nicolas Saenz Julienne <nsaenz@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>, 
	Iago Toral Quiroga <itoral@igalia.com>, Chema Casanova <jmcasanova@igalia.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com, 
	stable@vger.kernel.org, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 12 Mar 2026 at 22:35, Ma=C3=ADra Canal <mcanal@igalia.com> wrote:
>
> The bcm2835_asb_control() function uses a tight polling loop to wait
> for the ASB bridge to acknowledge a request. During intensive workloads,
> this handshake intermittently fails for V3D's master ASB on BCM2711,
> resulting in "Failed to disable ASB master for v3d" errors during
> runtime PM suspend. As a consequence, the failed power-off leaves V3D in
> a broken state, leading to bus faults or system hangs on later accesses.
>
> As the timeout is insufficient in some scenarios, increase the polling
> timeout from 1us to 5us, which is still negligible in the context of a
> power domain transition. Also, move the start timestamp to after the
> MMIO write, as the write latency is counted against the timeout,
> reducing the effective wait time for the hardware to respond.
>
> Cc: stable@vger.kernel.org
> Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
>
> ---
> To: Ulf Hansson <ulf.hansson@linaro.org>
> To: Ray Jui <rjui@broadcom.com>
> To: Scott Branden <sbranden@broadcom.com>
> Cc: linux-pm@vger.kernel.org
> ---
>  drivers/pmdomain/bcm/bcm2835-power.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pmdomain/bcm/bcm2835-power.c b/drivers/pmdomain/bcm/=
bcm2835-power.c
> index 0450202bbee2513c9116a36abaa839b460550935..1815eb4ee69b9b672b5e31440=
2f1cc9897c57dcb 100644
> --- a/drivers/pmdomain/bcm/bcm2835-power.c
> +++ b/drivers/pmdomain/bcm/bcm2835-power.c
> @@ -166,8 +166,6 @@ static int bcm2835_asb_control(struct bcm2835_power *=
power, u32 reg, bool enable
>                 break;
>         }
>
> -       start =3D ktime_get_ns();
> -
>         /* Enable the module's async AXI bridges. */
>         if (enable) {
>                 val =3D readl(base + reg) & ~ASB_REQ_STOP;
> @@ -176,9 +174,10 @@ static int bcm2835_asb_control(struct bcm2835_power =
*power, u32 reg, bool enable
>         }
>         writel(PM_PASSWORD | val, base + reg);
>
> +       start =3D ktime_get_ns();
>         while (!!(readl(base + reg) & ASB_ACK) =3D=3D enable) {
>                 cpu_relax();
> -               if (ktime_get_ns() - start >=3D 1000)
> +               if (ktime_get_ns() - start >=3D 5000)
>                         return -ETIMEDOUT;
>         }

Please consider replacing the above polling-loop with
readl_poll_timeout() or use another one that fits better from the
similar helpers.

Kind regards
Uffe
