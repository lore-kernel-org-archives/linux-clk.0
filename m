Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0C13CEB99
	for <linux-clk@vger.kernel.org>; Thu,  3 Sep 2026 10:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788429920; cv=none; b=cPSAauWMJi/Bk362of7pBBYgFK2s782fPiobgusEs6au+mPlrmfrECcSObBBp5G9kS3gLDJKJOE7ipF1s63PdWlPV3BSjHJplB6YJ/DBCdLq3yQlntiQrJn3DzaCahO+oykQ9GD8xK6URwlIL2iIqehsUpXhCM8zc2oaErnMISg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788429920; c=relaxed/simple;
	bh=wKv0G5pklL2Tau4nv5A69Up1Qi1EQE0aYPmrDPjRxmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D5Enr9rI/NxZ7jEuFcCc4enCiyo6E1RImzYirFxL6wGQGS6kpOPlLp9AE5TgQOq5oSkxZ6Lf4TFIHlbzV1nWymGcJanV72iFpSJakZpT8mPW3mXnve1tSF/FZMpgpfuLqrad6FnhfvuO90ItWa3deDDYyUN97TpstIzI/Og148M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-66f984b263cso1409982d50.1
        for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 03:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788429915; x=1789034715;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sB2LZifEeupjsxCHsRGx0RoKXBpeYPjdfUIFuUgunMM=;
        b=WyQKIqyFqLXBp1eMtaelL8vdx5ZXJq3NB38TwnJyJv5fxhyyvbz+MeGTX1SIpE7ew9
         i+qmvqw9/Eo+1vQlmPAj1BB+rOEouU+zP2jPNjYPOXwdRbkOiUgIzQE5RctZN1dmrGO2
         pBx8TzszjqfAf1/TIkZUtGnJt8p8YYVIAlcgDCkRqzzAkDaMMv9G1oIXuMk263qVQKxM
         +ckYw/F/wRvvwm4PVcUpD6tr0veOUmo2hLlgI06edBTqlX/o5mF3FRlroVqCvziMTXaI
         92P9fyB/sSn+I6YvyY5iIZ0IN2bIlrxiIgMvkcPTrBxap6qB2gkRGPl3ZAIYzhNpgii1
         4SkQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0oNLoUABxrxAwtmWHej87ZiAbJO594IFxQhnhiMC2nu1suPet2jVK5L5BNzM71cCNIeMMHasTMt8=@vger.kernel.org
X-Gm-Message-State: AFuF++kc7UQUIB7DrMdhzcVCjwcwUpBXbpbF6iXF2IOCglxheHIHDwE0
	QJ2C2IGWQDJ0J2Nw0fCPFRZU1lvqhm9YM3sEh1O/WpZATYeaMq2zFLhvijI+OJSaZRE=
X-Gm-Gg: AYBFou0e5Se25T+8FBxJ56rFpLZJi6WoDH32P6YOOLd24OvQpTyIbNA0LKQppqbEjRP
	M25JzgbMUMmo5tH/yx8zG+dRGfMdTIb7rRjAg4qDSKDi35YLQ+6oDLPgFp94R2LwesVgDUbqxYL
	pXJFkQYpiitSlpApO3QYGBJgIqsJB54ef6wpNcr3+R6sBQPSlCDiro8lYbcKfwFMIsrZhcU3LXu
	Bz5NdRr4vaVAVtNU5NldorxW3xZOumvoI+qRk18fSt0mvlexhm7+EoatAvyBp94C6CRKLZS1Yoa
	elReJnJm/q9Qub1OJ5T6/81ohJ6yY98j2Ar6m4lIWDydOh4U5m/CiJ5bnKHpC8bk030F9vcIUts
	5S1/3OAH5/hzx99sIo8UjWHKELDx7YwcFi4KdEi47S1cdCFsQNh6bdszMhreU5z8KH1WtNINlp7
	PbjWzHvlowxhqexamVFLUwLEVw6I57iXU++ZwmMcDYALfzw3KNjqN6IoMLXj1Hz4L2TRpGQ/8Do
	zusvAFPwHM7M8Ekhr6Yi1mgQGMVQj77k8Aus+yBcIwjl6+FKEHh
X-Received: by 2002:a05:690e:4502:10b0:66f:abd7:8de0 with SMTP id 956f58d0204a3-66fabd795a2mr870979d50.38.1788429914963;
        Thu, 03 Sep 2026 03:05:14 -0700 (PDT)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com. [74.125.224.52])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66faa50d633sm1331448d50.1.2026.09.03.03.05.14
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 03:05:14 -0700 (PDT)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-66c7e3a2332so2325755d50.2
        for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 03:05:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwKn4A4GoAIMosXU87OEfLmJxHjBNqeboTlztxx2A//07UkNGdZWe7+O0ZM+87Zma0Y19GfRE9Szyw=@vger.kernel.org
X-Received: by 2002:a05:690e:4890:20b0:66f:afdc:b49b with SMTP id
 956f58d0204a3-66fafdcb54bmr290871d50.0.1788429913913; Thu, 03 Sep 2026
 03:05:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829094758.23248-1-tanure@linux.com> <178818026093.2318126.3676223463693214854.b4-ty@b4>
In-Reply-To: <178818026093.2318126.3676223463693214854.b4-ty@b4>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Thu, 3 Sep 2026 11:05:02 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+17CLQ_4-rcj0KD6kzPWnChQfD3irCR7-h1bGH9hWiD7A@mail.gmail.com>
X-Gm-Features: AcwNN1VRB2D0FTXRpcvHAcbTlWB5xZQpxaG0zutz7J3nfFbo_PpnG2ATadEMYz8
Message-ID: <CAJX_Q+17CLQ_4-rcj0KD6kzPWnChQfD3irCR7-h1bGH9hWiD7A@mail.gmail.com>
Subject: Re: (subset) [PATCH 0/4] arm64: amlogic: t7: describe the VIM4
 supplies and keep the fabric clocks running
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Jian Hu <jian.hu@amlogic.com>, 
	Ronald Claveau <linux-kernel-dev@aliel.fr>, Brian Masney <bmasney@redhat.com>, 
	Chuan Liu <chuan.liu@amlogic.com>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 1:44=E2=80=AFPM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> Hi,
>
> On Sat, 29 Aug 2026 10:47:54 +0100, Lucas Tanure wrote:
> > The Khadas VIM4 has needed clk_ignore_unused to boot reliably. Without =
it
> > the board hangs at random, loses storage and corrupts memory, and the
> > failures move around from boot to boot.
> >
> > Six of the SoC's PWM outputs drive the board's voltage regulators: the
> > always-on domain, both CPU clusters, the GPU, the NPU and the DRAM. Non=
e
> > of them were described, so Linux saw the outputs as unused and switched
> > them off about a second into boot. The regulators then drifted away fro=
m
> > the levels the bootloader had set, which is where the corruption and th=
e
> > random hangs came from.
> > Thanks to Chuan Liu from Amlogic for helping me indetify which clocks a=
re
> > critical.
> >
> > [...]
>
> Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogi=
c/linux.git (v7.3/fixes)
>
> [2/4] arm64: dts: amlogic: t7: fix the pin groups of two PWM outputs
>       https://git.kernel.org/amlogic/c/ae7be5c58a819259e5eb98a3abfa608424=
78f2ae
> [3/4] arm64: dts: amlogic: t7: khadas-vim4: add the PWM-driven supplies
>       https://git.kernel.org/amlogic/c/1e5a53bd16ac501e68463e84023d1bff54=
3cc696
> [4/4] arm64: dts: amlogic: t7: fix the pin groups of the vsync PWM
>       https://git.kernel.org/amlogic/c/406292fd75f95aa3010fec95b5beb5a8b7=
e3ba3a
>
> These changes has been applied on the intermediate git tree [1].
>
> The v7.3/fixes branch will then be sent via a formal Pull Request to the =
Linux SoC maintainers
> for inclusion in their intermediate git branches in order to be sent to L=
inus during
> the next merge window, or sooner if it's a set of fixes.
>
> In the cases of fixes, those will be merged in the current release candid=
ate
> kernel and as soon they appear on the Linux master branch they will be
> backported to the previous Stable and Long-Stable kernels [2].
>
> The intermediate git branches are merged daily in the linux-next tree [3]=
,
> people are encouraged testing these pre-release kernels and report issues=
 on the
> relevant mailing-lists.
>
> If problems are discovered on those changes, please submit a signed-off-b=
y revert
> patch followed by a corrective changeset.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>
> --
> Neil
>
Hi,
Please don't take this. I will submit a better version.
sys_ampipe_nand should not be critical.

Thanks,
Lucas
