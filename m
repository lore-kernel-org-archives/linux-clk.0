Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793831422;
	b=JskW4FuKnVoG1sUQfjXi1tYQU5ne4daU95svk7iy2W93DGS9UavQD+R8VkNaHGJim6VH
	 S6Wd/M1G2vvuIGW3jPx3G0GvVTSAKvUB+8kqG3CjDXSn3v968pPP0JZgctOmQ1pjzB27V
	 qbrmqK1jtfzp4wjpeCKKyJqP6JWXegVRAnO/VQMYUq9D75PSTexgstSJjQwSDmqUeT5C7
	 J9l5c22C6iMMYsL/hTkhu3wkQHpQlL0NtudasPyJULx7qpMafJOcJy88t9LSpUZJG02ZE
	 3TbFhI83OPfj3rCso1k1BAInQag2M+vsl3mYnDzs8iqXjFRhYZkQ62HYX1IpkY7LyiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793831422;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=3mri/QZEgpm6PEQDC7RLq6cQ/hDLdWlk+7v76qgnP6c=;
	b=ubDbqhGKzrUw3Xb8eP91ddj8gqP3+y4jmw7DGeiQMKSsUV4PBls49mtRCH0eGjD4P46A
	 pxS27LC/HSeTAnNddMhfx1tpWOoXQ7N7ochthJELcG9ZlncIdS7H23VZDKQUaHmh4AkCi
	 2l6hXc/3qorDLRGP9YINWNeu9t8PW+CqkmwtPxmoQ9Vem3a2s4DCVmdFMv+UxIJaZdg5G
	 P2FPQj/5b0K75V+ss+F462T6wZlalg7rA6jpC4OwCihZZcNZlwftev+vH4F7zZhxdAAQq
	 zFYyUdfZFClH52bEvl+s2KxO4fhybWqlEA6w6U8AVgrK99tpy1aTqpY6VNaHcWAgWVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VFq+3dDH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE50D606AB31;
	Wed,  4 Nov 2026 22:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VFq+3dDH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E2F51F0093A;
	Wed,  4 Nov 2026 22:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793831421;
	bh=3mri/QZEgpm6PEQDC7RLq6cQ/hDLdWlk+7v76qgnP6c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=VFq+3dDHC4imojbcXXhl8reeTOTwtvGzur9ckCYanXyxSIeqKe7vEMqnSPfh2Ppq7
	 Wc2/PVHekSuQkMDTpT90ETHtvDP6LyLH2WH5UNtuBbFJw8pOZRVdSHj/+4QhWjq0s9
	 IKQrqIPZE+mQ1skl8cTkV4JvkQ9R7oGBYhc1Oohjse/tHNAcHo+Wi5wnCs1MpEvslg
	 HTfJU6/ZYfxdOcJ0AMDV1ify3r4nLPBZeHbov+FAzUj/PxpaBv+Lewx9Ro6wRI+SDg
	 IufT+mNYbXYTVnGJ1wNM4kW0LJ6ZWttk/9T3mM+iPrMV9l/ujVS0J6ii/MXWzOB4gW
	 QJfTsLnZNLB8A==
From: Brian Masney <masneyb@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20261020-ups_mp13_clk_spi-v1-0-6c00730945c7@foss.st.com>
References: <20261020-ups_mp13_clk_spi-v1-0-6c00730945c7@foss.st.com>
Subject: Re: [PATCH 0/3] clk: stm32mp13: add the SPI1 to SPI5 bus clocks
Message-Id: <179383141362.620422.9540521231939469885.b4-ty@b4>
Date: Wed, 04 Nov 2026 17:30:13 -0500
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=847; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=d67aLjjx5NPzRK8+TYg7tarnAbqEZJwNtwj/735hMts=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJeb/xukcty9GAY+47rdo4TBJy6cs0yvu6zffbZx0Iw2
 4q5qEqso5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgIkcD2f4X3rjvX+6AHfajQ+Z
 V/fX2366c9rNQ3q1Nod7mt/y2L3WBYwMi3/NLmr1fLbdqvO5HEuzzobIJx3Kk7/+P5Vn6q51aL4
 QMwA=
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Tue, 20 Oct 2026 10:31:06 +0200, Gabriel Fernandez wrote:
> clk: stm32mp13: add the SPI1 to SPI5 bus clocks
> 
> The STM32MP13 RCC provides the kernel clocks of the SPI/I2S instances
> (SPIx_K) but not their bus interface clocks, whereas the STM32 I2S binding
> requires one as its "pclk" clock (the I2S driver gets it with
> devm_clk_get(dev, "pclk")). The STM32MP15 RCC already exposes them.
> 
> [...]

Applied, thanks!

[1/3] clk: stm32mp13: define the number of clocks in the driver
      https://git.kernel.org/clk/linux/c/eec8af6e2558
[2/3] dt-bindings: clock: stm32mp13: add SPI1 to SPI5 bus clocks
      https://git.kernel.org/clk/linux/c/110cc8efcacc
[3/3] clk: stm32mp13: add the SPI1 to SPI5 bus clocks
      https://git.kernel.org/clk/linux/c/6140e27299bf

Best regards,
-- 
Brian Masney <masneyb@kernel.org>

