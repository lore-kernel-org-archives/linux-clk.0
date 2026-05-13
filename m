Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9653C4963B0
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 15:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778687172; cv=none; b=jiMU8KbsWjOxhLZUz2/lL/HEfXNszIjgivK9REMc/U45oJ8Bwdp2ToU+Wie3pV4XJylbLR2eUsRtRbUa2eDzWZZIrtFzEH8tclKucFpIUYzvVE78n0fXDOk47gEpfQnGQi+o4VUSHOi/MErh+PGNaZbEbCUw+WKDw9WuJFDUrYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778687172; c=relaxed/simple;
	bh=p2W69PE9zLk6/TftqU6evLE//ajOPXC8lwspmoMpV2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S++hY/sem41TQUyrL8ckV9izTdQp18y0TfReVOTbsap3VUx4DwNnnTcq1Lu6yghITsuofRVKtoMUcFl12ACesFs+p22qRa7JEdNuoppS5Rx+REHY8qKASMp4ULGXMXusUdRoC5hZGJjCY2NFNaMBZ6215lKYY+ytQ0GuHxWy7hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VCDAk4kW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VCDAk4kW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 127DDC19425
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 15:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778687172;
	bh=p2W69PE9zLk6/TftqU6evLE//ajOPXC8lwspmoMpV2U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VCDAk4kWr5lROkgbCxaPTBOyKdlmtM4JSybJX+IYJ0Kh81Nn6dR4c7R71AzsnMfLP
	 PG2zZ44k9bCDNldJWeWIfk9PURVmrz98PCF3b+uJsR05mcXhG5ZXetZXWaNp8k7AbH
	 8iYzWa1Rrnl57agdmejuydhYAuJEMN8DIFoqa1Zp6128rFfmvTm9v44NYWbpkhouXv
	 3hxSIPRgfg/6Eav0rV6eWn+wAWl59+pspWR0w8hzlJXB6GPiza1Z0IH9jfXwL3gkWx
	 aUyK70w9rMajj5Z6ilUvJmePzWOZqvCpkCBt2yWv+7lPyDgn3lQaIJUs+8SinaYhcC
	 E6T4X13M1M06w==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-393c93a01abso59094151fa.1
        for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 08:46:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/sJoyu0NANWDtF8fwZhLQjpV0cjNgYz9sldVwC/JrP4dcGU2xuPJq7WMZNIrxd8sYywoNG6d5IffA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfDAxUB4WzDAfNQ7ukm/GsLSkmrbakCSlWqV3943OT2CChizk/
	BUTu7wk8/pjCUXdDN/aC6UZgJGCBC+zA++yNWS+HIde0VIv7pISxdhM7qHCkkmtzkUGEu8o06vl
	RHB0wMA74cpRJUUaXP2kH7WpUDF0S2WEIK+FoGhcIkg==
X-Received: by 2002:a2e:8a9c:0:b0:393:b365:6e28 with SMTP id
 38308e7fff4ca-3944b7719b5mr14546711fa.31.1778687170744; Wed, 13 May 2026
 08:46:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513-nord-clk-usb2-phy-v1-0-8eafcb2d5129@oss.qualcomm.com> <20260513-nord-clk-usb2-phy-v1-2-8eafcb2d5129@oss.qualcomm.com>
In-Reply-To: <20260513-nord-clk-usb2-phy-v1-2-8eafcb2d5129@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 13 May 2026 17:45:58 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mcps9GrfbP+FMJ-9uLe+G+w_Sp8PHXvywEGbv4ydSzsLw@mail.gmail.com>
X-Gm-Features: AVHnY4JvEog9uAQ6uXxYQi6na6RQSKr-R3zFzCCe566_QBpOOC2Suio_Kny8Dcw
Message-ID: <CAMRc=Mcps9GrfbP+FMJ-9uLe+G+w_Sp8PHXvywEGbv4ydSzsLw@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: qcom: nord: negcc: add missing definition for
 the USB2 PHY reset
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 5:35=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> The USB2 PHY reset definition is missing from the negcc clock driver and
> its bindings. Provide it in order to enable adding the USB nodes in DTS.
>
> Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controlle=
r driver for Nord SoC")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/negcc-nord.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/qcom/negcc-nord.c b/drivers/clk/qcom/negcc-nord.=
c
> index 1aa24e2784e536e6b6e76f488abd0e2fcc435380..31442d39924a6f79bf39962eb=
b0de8d5c65fa0b0 100644
> --- a/drivers/clk/qcom/negcc-nord.c
> +++ b/drivers/clk/qcom/negcc-nord.c
> @@ -1918,6 +1918,7 @@ static const struct qcom_reset_map ne_gcc_nord_rese=
ts[] =3D {
>         [NE_GCC_USB3_PHY_SEC_BCR] =3D { 0x2d000 },
>         [NE_GCC_USB3PHY_PHY_PRIM_BCR] =3D { 0x2b004 },
>         [NE_GCC_USB3PHY_PHY_SEC_BCR] =3D { 0x2d004 },
> +       [NE_GCC_QUSB3PHY_PRIM_BCR] =3D { 0x2e000 },
>  };
>
>  static const struct clk_rcg_dfs_data ne_gcc_nord_dfs_clocks[] =3D {
>
> --
> 2.47.3
>

Please disregard this, the address is correct but it was supposed to
be called NE_GCC_QUSB2PHY_PRIM_BCR instead. I'll send a v2 on Monday.

Bart
