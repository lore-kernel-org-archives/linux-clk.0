Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACE632938D
	for <linux-clk@vger.kernel.org>; Wed, 22 Apr 2026 06:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776840973; cv=none; b=tJnpwqluhEbDTE2vV0zVdsRBhicssPQzZP7niE3xQTHWezd0txnVeR33betHt+UqJKFcDEeq7055WBeMwDQuVvFdQgfnUTCp6mlw7Dk7SXHpNjBCje66WtSKPcz2X2UWLs6ryIxQ9ibeJw7unx3+zJyoCToK3Lq1+k7FQfsxNuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776840973; c=relaxed/simple;
	bh=wpkRjIorbMJMpqwzpLdjkd4Y24lBbCPn4ze08bDnJqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kWq5wEUlvcM30PWROge/F+gX/y1f4Y5L0E7bdHIHbtMvN8Qx37qTKpdDy4OTf3r9Z/FhnxDN6GFn3H/lQzcx94DOR8SoAaB5D2Dh5IegtnLjjEfj2rUVZfDaJXdosNqgV5/nFmaEigGKy34MFim5hNitz9XAbAJDPbjdHML6hW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7dcd9061b1aso1331119a34.2
        for <linux-clk@vger.kernel.org>; Tue, 21 Apr 2026 23:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776840970; x=1777445770;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EQBlVUrhFqLpmXIMAS6FxW1MbLcWzT++sufCtB36Fh4=;
        b=c0eM8GLBS2s175buzvzBj9VZOaJ6Ysv2P0eNRCh33CxgeEAN1uQEuBdZ+2CyFtZ+sS
         EX/X/1GRgt4LBo3bIOAWxmpSDjwkaMlrCmAHSq3ytaFOSA7eEjlsfAmMeyVAbeWLKLAh
         6WPqa1m0U5hamFRjuWybZJKuTCzGogXVCLkjrVUttIFFKNpmKIznoafKOiA4PRtI2czo
         cGUW7j5gjQ6PCXNrsW/mgZA9l5IC9KxdhRJeM6LaqA6AnF0G7MtBobUMLex+qCpnlqOq
         aWXiSKGJJi5IM9bQfUzJc8KJpbKNhJem9Lhrij597w6l07wrqhvzIkJHaYzzeyi5MkaO
         vzJg==
X-Forwarded-Encrypted: i=1; AFNElJ/V2QnaCxacyc5HgsahpQhXGDlqoicX5vrA4vpN+N5mpAURKCREd0qXbdk5UHmbhsuot0Oi75Ju2Ik=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYA2/qfK9NwFDAjRtzjreufaAKR5SOYT/z3y+uAGS+5e9MW5mN
	bHY5a6M1zT6Jya3Wz+uFmY19WGtZ6WHNB9YAw2TlbHmWwgQbQfq6c1hiZqWTMgdcgVE=
X-Gm-Gg: AeBDieuR0EePOtK2CB7rxX/l1koLNCk6RNFMtOoSmSpD1iUUZ/Swxsl2mk5T9bIuLac
	kC8L9TtXkOdtRL8ZQYxp2rzhv5qed2lUjOIHntoJ6ySkLj1PSc5n5T0BjJObILoE4H+aq0dLmTb
	xtfK++KmN0evO82pSNYzZN/pPn7S4ox7xL825T7GNnTm5AaHo++s9xKW1PK+iU+8yAN58fU+q0m
	LaZ9soKPp5rARHlBXoL/OWr4ZEPxeHWkyEKv5UzGRSAR0qVy1dRKNm4dsW4CDDvZ12Lye04eFh2
	xu5T/S8uWXwZaXf58l0bNqLJwuyydRcXeATwOBumbEZd9OzI+od2/nY/R7Qzn6vtE9C2SVrVxIg
	nipWgD3cWrMhJySupxltudFgSHEczI/DhB8d5OSIJKz+mOpbF6+Io6u+ZLqv27p1UpLJLm244QZ
	tzoNzbUMzTNzDWVC7ZndnSkoG4fjkz2UL7R8l5KOIdglccZOrhAKP7eLGNycg8a71EmYU9Jc4=
X-Received: by 2002:a05:6830:3508:b0:7d7:c911:1829 with SMTP id 46e09a7af769-7dc951d6a43mr12598299a34.16.1776840970526;
        Tue, 21 Apr 2026 23:56:10 -0700 (PDT)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com. [209.85.161.41])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dcc953e39asm6098144a34.15.2026.04.21.23.56.09
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 23:56:10 -0700 (PDT)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6948ff6b006so1425343eaf.2
        for <linux-clk@vger.kernel.org>; Tue, 21 Apr 2026 23:56:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+fAixrYxppz3yUY2POCGu0gWNop6x3t9XR5JLG6R9kkDSAgE3Tg2yGtrAcdf57laWN+xWV1njrOTw=@vger.kernel.org
X-Received: by 2002:a05:6102:3a0d:b0:60f:f543:232a with SMTP id
 ada2fe7eead31-616f4b50368mr11299488137.2.1776840661908; Tue, 21 Apr 2026
 23:51:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <72e2a0e7a5abda02fe36b3f5851842f7a77b2593.1776793163.git.geert+renesas@glider.be>
In-Reply-To: <72e2a0e7a5abda02fe36b3f5851842f7a77b2593.1776793163.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Apr 2026 08:50:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXxEsYuOay0+Tf=4ByTAMp0=iXwcS4YSy7UY9_CE0hb5A@mail.gmail.com>
X-Gm-Features: AQROBzBFb_WdSQXK0LqlocZWzf5masVqawoXkZ-ffV8evv9b39yVA9knMtYt5TM
Message-ID: <CAMuHMdXxEsYuOay0+Tf=4ByTAMp0=iXwcS4YSy7UY9_CE0hb5A@mail.gmail.com>
Subject: Re: [PATCH/RFC 05/14] firmware: arm_scmi: Add scmi_get_base_info()
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Apr 2026 at 20:12, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Currently non-SCMI drivers cannot find out what the specific versions of
> each SCMI provider implementation on the running system are.
>
> However, different versions may use different ABIs (e.g. different clock
> IDs), or behave different, requiring remapping or workarounds in other
> drivers.
>
> Add a public function to obtain base protocol information for the
> selected SCMI provider.  This will be used by the R-Car X5H Clock Pulse
> Generator and Module Controller drivers.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -3504,6 +3504,37 @@ int scmi_inflight_count(const struct scmi_handle *handle)
>         }
>  }
>
> +/**
> + * scmi_get_base_info() - Get SCMI base protocol information
> + *
> + * @of_node: pointer to a device node for an SCMI provider
> + * @version: pointer to write base protocol information
> + *
> + * Check if an SCMI device has been instantiated for the passed device node
> + * pointer, and, if found, return its base info.
> +

Missing asterisk, reported by the kernel test robot.

> + * Return: 0 on Success or -ENOENT.
> + */

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
