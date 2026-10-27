Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793110788;
	b=utF7qe+Ey4xcU3nS+NspwVKeSsBOfi01wJh8uuR9hgoHNZmysf4CrRv8ndwU7NBf+tWL
	 iISOi2dKcPXmgcXurdDlz4YdZHlGB/MPQ3GSoo6+YlZizygZa7VquW4+Zm8Yrb/OCeZ3Y
	 xceSHlFMWZmTUo5HDF3NqIW2cun1FqIeFb79llzzIYcXQ6OjJYD4NqW5ocINjzza9WhVn
	 lXCFniRF9rpxcQGntkLPgf8vnxjxxviTdvhoppzp7UyHBbGIIhKgjARlb3K1atLPK0JJJ
	 8lS+myfal0Klfa4iUPSESTyRSQVKEALny/1w4ny8erLHdrEH9ZsSSmKHDmBcpkLCRuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793110788;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=65YpN1lY+wIR6jDJdFChwRJvAOKrauAXqkCBZN30u8c=;
	b=kNsO7oLjOhn9dSNFKAcUyBAfbbDq+lOwYn8MqKgJJw3BlWi6GmJkrRH7SpWqt1VUHF9f
	 q4M7Lbd68E2BNHiFwAYEf6L6Ranje7yIF7Wle4tR9OQnmNEPsVEY0HzhTiaD06ZVooMgH
	 gXw6Zad8dnWKP9+hHy5gJll6plNioFkSX/WEGJfZdeNv8qC9QqmYcUEEUGdTEVoG/C3rX
	 v0ZSDciWqAAmu79XG7Jr+6EuM6qCVE5NwQfA7hwWJVKXvNs2pzhK9S4Yq+VOsOYoZW8Zg
	 fsWTRI2EvyZqlVpEafMa5MPabIQWVTGqor0XwTMhM87DVneihAHsqYabuVscTJm7Zuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="bTrYKY/N";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C948606A32D
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 14:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bTrYKY/N
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E9BE1F031EC
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 14:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793110788;
	bh=65YpN1lY+wIR6jDJdFChwRJvAOKrauAXqkCBZN30u8c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bTrYKY/NCtBQEqHzZxx5FWO4+paP6G4Zi606u8ECeNkDqyadFAAmZ//dG3grmowVm
	 d1tciUMEEDAQFCj1uYrrSKri/n6ePDG9eeISLDcFHhEl557VzR+RXrO31eGIO8eQNU
	 JTkprt7vienttMNV5MxlOGduU7dpzTNS/y8MU50kvrBTrwzhzoZISIeYECH7ena7Eq
	 6/otvp2wsbwRx5Z6CXoWzFM/wTZbzOIWo8tv42AVzG1/qMANM2RCs0xSe/KNLOlSZN
	 VdzIxQpxYfFhHzkRW3TnKUV0ZddDh5zMSpZ/iEme/pBnRjBgjgAb+2lpT9sdJJYSA7
	 LB+VxUC7mQXQQ==
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-483a66818edso2063895fac.0
        for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 07:19:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxEaTsu99r857VqDfeu8DiZI31IU6su0CnvoO6GtoSp+SYfyba84scR+gqVUqsWCCGrzUOx9GI74KU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+tkjnajVRNZ4BrJUZ7EfD/OwlmyKHuMPmAn+6hS6fpeqad0iD
	49/tUsuAADmDbUcprvLWKpnDPHkoSWRYIRwe7S8VvnXFK691CJf3n+KD9U2L46EMHdpJ4bF1k2H
	QtfJFt2zex826KVPRjijALWYz848jW2M=
X-Received: by 2002:a05:6870:8109:b0:48f:e0e5:a205 with SMTP id
 586e51a60fabf-4a83f55fc6amr6537849fac.57.1793110787343; Tue, 27 Oct 2026
 07:19:47 -0700 (PDT)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792776697.git.geert+renesas@glider.be> <528b079a19bd4043754bfb56db8e5950bdda62f6.1792776697.git.geert+renesas@glider.be>
In-Reply-To: <528b079a19bd4043754bfb56db8e5950bdda62f6.1792776697.git.geert+renesas@glider.be>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Oct 2026 15:19:29 +0100
X-Gmail-Original-Message-ID: <CAD++jLkgVwJCKbQEpapoBtrUdfBLTyR-UpcDxfduw5cOfOHsaA@mail.gmail.com>
X-Gm-Features: AclHuK9sHLPk_RjSdPfQ2Qb8ggjUTeBfa7KowfsZSBkBlD3ysUfPGnnDgLhFvkE
Message-ID: <CAD++jLkgVwJCKbQEpapoBtrUdfBLTyR-UpcDxfduw5cOfOHsaA@mail.gmail.com>
Subject: Re: [PATCH 1/7] gpio: rcar: Convert to gpiochip_generic_{request,free}()
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 7:52=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> When a gpio device node has no gpio-ranges property,
> pinctrl_gpio_request() returns -EPROBE_DEFER and its GPIOs are unusable.
>
> Restore the ability to use GPIOs before pin control support is added by
> using the gpiolib helpers instead, which cater for this use case.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
