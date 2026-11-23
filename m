Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446708;
	b=m17q0/6kUB/BTVUJVXeoKVeJO9L9JMvn+/UDGiggw/uRTDP1Ch+wIJll9ZeWO/Tkxqq9
	 azGmv9x1k5TtEpDDqVuCil7O0rqCbcS0AEipf5JuVm1Jytw+/J/K7+vXFTSjQp6HDJ1no
	 wEZciTgal7nid1+HBlUe4t7HVtHGwhMrvO4XDIU0OEiIcLfGIreW4PpGO9pBmBue2cKEL
	 chOCPmpTxzZZSk0/C9RJj+Y7erR1YxmRuin4wn8XlsbL+8rD5guLCUhlzqgFHWPgusxAs
	 yqrxMBHezEJronL/IhsfFJ1bU7+5c2Ti9gguw+JXH2KnXor+dXD30zcrYw3B5tialbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446708;
	h=Received:DKIM-Signature:Date:Content-Type:Content-Transfer-Encoding:
	 MIME-Version:From:Cc:To:In-Reply-To:References:Message-Id:Subject;
	bh=Bguxprv9af9sIZu8H90jTyVeqmhxNUY00+W9NIe0CBw=;
	b=YAJ2xEaE4kH2UwLe86F+pgwmvTTXfhh8yQoYxpfXXC0kMjdPzT8qZDR3/H/mi81MAfZO
	 w1kmIbogETGwWT0ku9VJlVgav4dj8Uornd9eo0wDTeZodtdBI7/JIsVOGzZ55an0DQUfW
	 AIIBVVy8kCPUq2FSTG9PRsSWezR6kP3MvPyDdf6Ha2EEKvO5jY//jOzWFkTkk5K92UqnC
	 kUTlSG9unwsmPeZrbGLSQ2jV/QU5GZsHZryWd8Si9RmzADXJwwjjszo9vWXXHXTfu5vTG
	 gksOf+hhf5Pv+KSGkfvMxhrTrrVJtCpqvtqUUp/nWQ/nmKm2PDXTthbJvmVXwkdL7IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NM1SK7MJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CDC606A33D;
	Mon, 23 Nov 2026 15:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NM1SK7MJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78D5A1F000F4;
	Mon, 23 Nov 2026 15:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795446707;
	bh=Bguxprv9af9sIZu8H90jTyVeqmhxNUY00+W9NIe0CBw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=NM1SK7MJ6y48IdEy7d8zOvydV9kgRJbSKP8zYm7Llf3MmRDoTo0Yv2r06lVf0MV0A
	 aLeQaUelrdlQ0ee32PTivM11eUse+Aj0Iw5IiNF9NENEe6O5MhVAzNOJ3wPdh2t+5z
	 KvfTECaQW1k32a64vol9gvkNSAXxncAPgoVURF0P75dapi6IbxEhRSeDp/aM64djX5
	 oHHaDmpgx5h0SVi3Qj7yjhy1zlrtkh8x9uCDWy7cXcEleOA0L6mkrLfE06HsVkO/Ov
	 15vzGTqiSOaK+HlyjPEAOXPfhmFO+NL5PDHtpfYcUNABW1ZCVOMhK2Tl6Amn32Npuk
	 RRsOONsnfG3ZQ==
Date: Mon, 23 Nov 2026 09:11:45 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Conor Dooley <conor+dt@kernel.org>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org
To: Hikmah Gumelar <hikmahgumelar@gmail.com>
In-Reply-To: <20261123123546.152162-3-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
 <20261123123546.152162-1-hikmahgumelar@gmail.com>
 <20261123123546.152162-3-hikmahgumelar@gmail.com>
Message-Id: <179544616634.2477873.11039098838412723713.robh@kernel.org>
Subject: Re: [PATCH v2 2/7] media: dt-bindings: media: i2c: add Samsung
 S5K5E8


On Mon, 23 Nov 2026 19:35:41 +0700, Hikmah Gumelar wrote:
> Add Devicetree binding schema for the Samsung S5K5E8 5-megapixel MIPI
> CSI-2 CMOS image sensor.
> 
> Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
> ---
>  .../bindings/media/i2c/samsung,s5k5e8.yaml    | 103 ++++++++++++++++++
>  1 file changed, 103 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml: error checking schema file: cannot load meta-schema http://devicetree.org

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20261123123546.152162-3-hikmahgumelar@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

