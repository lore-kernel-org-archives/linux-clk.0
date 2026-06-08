Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3F93B38BD
	for <linux-clk@vger.kernel.org>; Mon,  8 Jun 2026 22:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780958638; cv=none; b=oadHJ36haDABFzt0Gcr/du+58PZlv/qatMsJ5T6XeiK0laLyGEu9bfgZ/R1UL7WT33bo/4HLGebJGW9Uj74su9FFOgjF/EkwVj2HPUzSTFcHyybfHyRyLPbelPBN9DfOzrGe4Kgk4WdKFlHovgafjFEkUl2g+K5OR306t3XNXY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780958638; c=relaxed/simple;
	bh=A0aMEuooSpehlxvLLcCYGZi3/rId/udlnvg3u80kiOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l9rqlYaSDr266Ogp4C3LQaOMxbH32sft5SYlaBLEUrGOcKWZqURvcwXhBP/gEZuaDBwLQuopbtAd37VsweQIbvlVR0Mzl4nmygPfdxCQQmhEqIDFUuVHyyMbT0c+WjcABnsAAypELLZHZ9frboc10353LL0Wm/OZiMEFUW/6oto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GV5Su1Br; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GV5Su1Br"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 251551F008A2
	for <linux-clk@vger.kernel.org>; Mon,  8 Jun 2026 22:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780958636;
	bh=yO33fZb1LjugzRw+G0ggE1zSXDOM86JcqH727KoL53Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GV5Su1Br5SvCs/rJNXXZeLpyhUFI3jQikNovCcx5qQfodSUdXRHSVw7DWxNCJL3KT
	 Ou1iT5jrVoWXlUuZ2Gvf+gJ9/3gVWTc42TyvGOdXuAir8y1XTOQGaUMi6Cwxw5zqkj
	 MWv2oDZUFskzYtIx4Qk/BmlliyCwfAld4Us+jiDYSGykz5OxNPICZnBG6Mlqf+Ymzt
	 omLwRHUBR72YpNwsMTp6K0HaG5OxXpCoK7fb36r1AMVz4EqT4uHJMwXb5m10bBmQsW
	 wefup+Aa0hpns1Hue0lbWvYs8BdM1RjR6gbkmq6De1rCAuFKglyfGY74YQOGd1yaDG
	 +dYmx5GlgXleg==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39677242021so48002501fa.1
        for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 15:43:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8Zo7vG69QRuzRT/iRFlQyw34ATsmWjyG6sjzF6a9YgdENnx+OO1kHVWZgNfSSO5vUwr5pQcx9qcZk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGeoGM1fT5BByzuJFSbT6+8ImuLXuC3oYyXVFQ+BOuE76oDS8O
	ssDwHARymg02pNEJQ77b90o/ojbenFRBbjZmD2EIrbqovjyeBjKtzRqHbU29blVKGjOug1MUbFQ
	sI3jTpG0FydaaYk/4ojWFfQK16vbBo44=
X-Received: by 2002:a2e:a715:0:b0:396:b398:5990 with SMTP id
 38308e7fff4ca-396d0802544mr31409431fa.10.1780958634795; Mon, 08 Jun 2026
 15:43:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com> <20260602-pdm_clk_gp_mnd_v1-v1-3-1522662b6c53@oss.qualcomm.com>
In-Reply-To: <20260602-pdm_clk_gp_mnd_v1-v1-3-1522662b6c53@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 9 Jun 2026 00:43:42 +0200
X-Gmail-Original-Message-ID: <CAD++jLnqCipTxkOhiwQhKFymOxu1HOTbHzLbNrGTOkCO33y8Vg@mail.gmail.com>
X-Gm-Features: AVVi8CdznhrC7lojiEVCZUJLtYjgr49qwHSYBFLmYEj8dqSmxJu9YBHItYZ4E9Y
Message-ID: <CAD++jLnqCipTxkOhiwQhKFymOxu1HOTbHzLbNrGTOkCO33y8Vg@mail.gmail.com>
Subject: Re: [PATCH 3/5] pinctrl: qcom: Add gp_mn mux function for QCS8300,
 SA8775P and SC7280
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 5:22=E2=80=AFPM Taniya Das <taniya.das@oss.qualcomm.=
com> wrote:

> Add the gp_mn pin mux function to the TLMM pin controllers for the
> QCS8300, SA8775P and SC7280 SoCs. This function exposes the GP M/N
> divider clock output on a dedicated GPIO pin, allowing the clock signal
> to be routed externally.
>
> - QCS8300: gpio32
> - SA8775P: gpio35
> - SC7280:  gpio60
>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

This looks all right and no-one is saying anything about it, should
I just apply this one patch to the pin control tree? It doesn't seem
to have any dependencies.

Yours,
Linus Walleij
