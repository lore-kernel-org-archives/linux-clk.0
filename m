Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474271;
	b=YaVmtbc8erwXd7094TxnwhrH0tNbi+aD1i8kcHCzA7iHuXDRHLAd6iu0L0KmnzbMMORA
	 F9kMnPJkwrcixnfK0iQmiYqII6lnoxUNF49FIunhbxv3tjjSJhQlgmpFxbBoeHcZJNfBn
	 VjEGJGWLx7na8XvIQaO0xw2i8wLEjjm3NNjIRb9Ulyy96a5T8Vk67ThrqI9o1ZIimQgm/
	 KNrzaDxIKLXmgzWl94/Wyr1n1W+mrQyHpy3FvuvbJNk8IcD6qJTI11Bt99mfyFCxF38qf
	 Gz8ZRuxIjtcZmx3PwrWbDs1NyuRlEJGvIHaoPnTX2ZCnU4CDefnOQEQsiywO30je9ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474271;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=VqOPjEs2c2PtxQxUY6iDUQAeKabD5jZ3aW3QTAoUWP8=;
	b=LuzywWEOp34Ggfk2/dcWsQLnmdTr2E6arokzhEojVhwJDhaWc+WiVOk4HsmOH1z6rxgH
	 R9rsr3od/S5iJn/AojztzlEHJVdXDPwiVSUlbYkGIGpVInecQS5dXxJ+MVLU86k6Is9gG
	 rGuvPB3BBBjgXfOszt8B5hhQ0z62qakkybNgyvGvP6yjlQn2RpRMN7Mq1UQhowXd5tSHU
	 fc4ABWzr7L3uRBUD6UL2+12vx8uMBAW+cFyRpy8ToViLDbbghju3Ev6R83qUAqS7BrZJJ
	 9BMOTVJaJngTKqT/xDZAfkoLoN5DqBInSlIo3N6v46aTXP0J5BQIhA5Cgx6FqsAoDxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ix6miF9I;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B96606A32A;
	Thu, 12 Nov 2026 09:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ix6miF9I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 505F91F00A08;
	Thu, 12 Nov 2026 09:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794474271;
	bh=VqOPjEs2c2PtxQxUY6iDUQAeKabD5jZ3aW3QTAoUWP8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ix6miF9IdCAh2ZxM98Z4EB1VHDjlMcyzyB4FiIiCZVSptVEBl3/I/2Fgw96fA6DrO
	 3pd5RWHe85H432Tg/LvZfvh7yvgXQ1QEnReOLkqfqDLkv5IbleeoiFqc4C92ubMB6M
	 Py1ILRgtCD3jpwxxMKy10Vc03ynECbMRx+QcwJ9XqxK+TNpo6ZzTNciZXz8WpD0i9X
	 wu5TTfnW2YLgMkdfNSo7qRMyoZx6kNNuiEppJGa+THmL0reP2jupXEgEz91nkW0n4u
	 XUraPgUrGW2MgwDt9Z40kjR/HyazdFxIQUnXAFt3hEqpPRUBbUYknKmhcyBUIkXFiv
	 mEJEJ/ntj7L4w==
Message-ID: <20f9fe07-6f2d-45d4-8ba9-10070d2d859e@kernel.org>
Date: Thu, 12 Nov 2026 10:04:22 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: soc: introduce
 toshiba,tc9564-config-syscon.yaml
To: Alex Elder <elder@riscstar.com>, sboyd@kernel.org,
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, p.zabel@pengutronix.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, fabrice.gasnier@foss.st.com,
 alexandre.torgue@foss.st.com, marex@nabladev.com,
 changhuang.liang@starfivetech.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261104004332.2141282-1-elder@riscstar.com>
 <20261104004332.2141282-2-elder@riscstar.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261104004332.2141282-2-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/11/2026 01:43, Alex Elder wrote:
> Define the binding for the system controller that implements the clock
> and reset controller functionality present in the Toshiba TC9564 SoC.
> 
> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  .../toshiba/toshiba,tc9564-config-syscon.yaml | 68 +++++++++++++++++++
>  MAINTAINERS                                   |  8 +++
>  include/dt-bindings/soc/toshiba,tc9564.h      | 46 +++++++++++++
>  3 files changed, 122 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/toshiba/toshiba,tc9564-config-syscon.yaml
>  create mode 100644 include/dt-bindings/soc/toshiba,tc9564.h
> 
> diff --git a/Documentation/devicetree/bindings/soc/toshiba/toshiba,tc9564-config-syscon.yaml b/Documentation/devicetree/bindings/soc/toshiba/toshiba,tc9564-config-syscon.yaml
> new file mode 100644
> index 0000000000000..5a241a9c915d1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/toshiba/toshiba,tc9564-config-syscon.yaml

Additionally, if this binding somehow goes further, this cannot go to
soc directory. This is not a SoC in this context and "soc" directory is
not a dumping ground for things you don't know where to put.

...

>  TOSHIBA WMI HOTKEYS DRIVER
>  M:	Azael Avalos <coproscefalo@gmail.com>
>  L:	platform-driver-x86@vger.kernel.org
> diff --git a/include/dt-bindings/soc/toshiba,tc9564.h b/include/dt-bindings/soc/toshiba,tc9564.h
> new file mode 100644
> index 0000000000000..66bcdf837f958
> --- /dev/null
> +++ b/include/dt-bindings/soc/toshiba,tc9564.h

Neither this. If you have clock controller, then header goes to clock.
Soc directory is ONLY for a very small subset of SoC driver ABI, which
you do not have here.

> @@ -0,0 +1,46 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +


Best regards,
Krzysztof
