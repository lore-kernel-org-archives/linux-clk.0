Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D21A168BD
	for <linux-clk@vger.kernel.org>; Tue, 13 Aug 2024 02:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723514809; cv=none; b=kGfioC3TxXDZWCKqM/FOjZxKcCEAGH3eGkVPYbMRiq3I8Y4iPWjW044Kkuqpy3VPAfOTfO7WzoBdxGX63XncB5fz/EAv/j8Ol++Ewh9PbGr/pSj6pZIB7jUzw6RZZDTlXtoRJYuyTuwafAIiecaFPf8HdS/bKHSkIeGd9sQ7XRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723514809; c=relaxed/simple;
	bh=Ccz8Tq00DpqWUxwmzDQpZlkK1veUNzBlOHz7S3uulrY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ENEy0QyhCQi3SMfwwTK1W5+zTwiR8sj4nGCX6eL+QM8T0ZvrWkkT0ndtJBylYEEhz/tktZCoPmwIslI9u2gdhknd46onCS7ygLXrm9zhUHtpZrXjh9C3pXB+pt2RV6Z1X0gRB0gvQPIOr3vM0wTH9nNYMWJfL9EEZKO8amGBYn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org; spf=pass smtp.mailfrom=kali.org; dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b=E4fEeS99; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kali.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b="E4fEeS99"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5bd13ea7604so3275123a12.1
        for <linux-clk@vger.kernel.org>; Mon, 12 Aug 2024 19:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1723514806; x=1724119606; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHZTSIXCxVPB1kB2H/9p8LdJ26VtkWVk5hxjWfiYSLo=;
        b=E4fEeS99A6p+rIrn2c3+5uI7qFEA+QjDL51p+yrESo2W396zBN0/PrkU1yHzokZVGv
         SH5rldYeSkP9je2s/iIblP6W5w2wV6b6NhxxCQC261H+/joeV4N6m0z3mTSoOVDOza7t
         AlxvK0i24lvz+zkbAoIwJRzi9YUl7GNsXLtN24Qn2/u95bVtQlQuVhx72tVGUV6zRUKA
         BxPqD5hhUgFjP22GOB7Ul0+7nJAgi1kE5Bw7M3d9RcVSgvOGTOZ81G3opjYHr/PcixmA
         O44HU0y56W21kAs5v6gMpqJFKOI7ZmgH0/f+PMtC49JUkw0qi/2zA7RR0Ulnm3Y1xCmV
         qBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723514806; x=1724119606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lHZTSIXCxVPB1kB2H/9p8LdJ26VtkWVk5hxjWfiYSLo=;
        b=NcjyFcehc2hZfHD5IVYyxceKctH+FqG9rWHdd7+/kcnCLDK4OxJnFIvfm3Lm0p1ksC
         aNt4CINF04RRUEIAJKDYSM0EeNRSfLMl8pMJhPv8lFO07Ftrxi/7NW+nFfo8KOqOFALr
         DD8gsDC2whbwkvlwsJJ8mdTs4eZ5k/x1yJyxOd8TK0SfA/xc+hS1IL9aCeg/kt6p9lKg
         tQqJ8/YVFY+C6hpef1ULDUi8q9n/bB2kDbJfxAb09CDTsEf3esLH1sDV8j5GlNOBMctg
         n9YSKcY4v5FaSghVsTs4jHqjaqteKz0epoNxcUrQAtrqs1KoEasVnwOXe5sxwvnFeJ9P
         JmzA==
X-Forwarded-Encrypted: i=1; AJvYcCU2x3Jtb02o8nGZ5WDazKgx0YvuITBLFMt02oXy/8nbRSyGqowm4R6WI7WGWNbHBmxVkinJ31O3NqlkYVHth3PieLh1qq9Xc9Dh
X-Gm-Message-State: AOJu0Ywq/5+m6DV7LyPfrVg5EWYkKotxEMob1bScDHEtCkuJ/K/jFbq7
	Bf4mqFOMKy35b2tjb9NkUDvzguVhoUeo2RAII4OPT+SKTRxvE7bHAEXDiJfZo8myk1HCQHAz/b2
	WPhCcC+3CgYsac40awgXUBzkhYJr+AFo08PR0bFXwDYJRWT+Xs6E=
X-Google-Smtp-Source: AGHT+IHw7Vj+1O3qWVDHqkUrCBYrBw567nYAPWAav7W+llaUreh4R4gKPr7c82NIydGG/Vup3rh8SbBAN3EhvwFTL+4=
X-Received: by 2002:a05:6402:5cb:b0:57d:10c7:aa4b with SMTP id
 4fb4d7f45d1cf-5bd44c6a562mr1307360a12.30.1723514806268; Mon, 12 Aug 2024
 19:06:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240730-sc8180x-usb-mp-v2-0-a7dc4265b553@quicinc.com>
In-Reply-To: <20240730-sc8180x-usb-mp-v2-0-a7dc4265b553@quicinc.com>
From: Steev Klimaszewski <steev@kali.org>
Date: Mon, 12 Aug 2024 21:06:34 -0500
Message-ID: <CAKXuJqi+Y8hM=nXj7G7fP7RdrNyQe_29yKaUJtey98vOYDqoDA@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] arm64: dts: qcom: sc8180x: Enable the USB
 multiport controller
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 10:20=E2=80=AFPM Bjorn Andersson <andersson@kernel.=
org> wrote:
>
> The USB multiport controller found in SC8180X is used to driver the
> camera in the Lenovo Flex 5G, and a couple of additional USB ports on
> the Primus AUX board.
>
> ---
> Changes in v2:
> - Moved mp index last in DT labels
> - Dropped applied PHY patches, and sent dwc3 binding update separately
> - Spelled out GPIO_ACTIVE_HIGH as necessary
> - Moved status last in a few nodes
> - Corrected MP_PHY_PIPE_1_CLK
> - Link to v1: https://lore.kernel.org/r/20240525-sc8180x-usb-mp-v1-0-60a9=
04392438@quicinc.com
>
> ---
> Bjorn Andersson (7):
>       dt-bindings: clock: qcom: Add missing USB MP resets
>       clk: qcom: gcc-sc8180x: Add missing USB MP resets
>       arm64: dts: qcom: sc8180x-pmics: Add second PMC8180 GPIO
>       arm64: dts: qcom: sc8180x: Align USB nodes with binding
>       arm64: dts: qcom: sc8180x: Add USB MP controller and phys
>       arm64: dts: qcom: sc8180x-primus: Enable the two MP USB ports
>       arm64: dts: qcom: sc8180x-lenovo-flex-5g: Enable USB multiport cont=
roller
>
>  .../arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts |  34 ++++
>  arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi        |  16 +-
>  arch/arm64/boot/dts/qcom/sc8180x-primus.dts        |  60 +++++++
>  arch/arm64/boot/dts/qcom/sc8180x.dtsi              | 181 +++++++++++++++=
++++--
>  drivers/clk/qcom/gcc-sc8180x.c                     |   4 +
>  include/dt-bindings/clock/qcom,gcc-sc8180x.h       |   4 +
>  6 files changed, 285 insertions(+), 14 deletions(-)
> ---
> base-commit: 668d33c9ff922c4590c58754ab064aaf53c387dd
> change-id: 20240524-sc8180x-usb-mp-4eb278df7ef1
>
> Best regards,
> --
> Bjorn Andersson <quic_bjorande@quicinc.com>
>
>
Tested here on the Lenovo Flex 5G with Cheese 44.1-1+b4 in Gnome 46,
have a working webcam, can record videos, and take pictures without
issue, and the webcam shows up as Bus 001 Device 002: ID 13d3:5419 IMC
Network Integrated Camera

Tested-by: Steev Klimaszewski <steev@kali.org>
