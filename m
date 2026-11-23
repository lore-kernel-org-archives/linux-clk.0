Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446710;
	b=oju7LxxvWkUSruln2BnS82Wb0OLtyQkWSqfo+N8sYMW2kQ5/dHP80HeGuJlNK8BmcPcW
	 l5fNeMYntT+q2Dm2VV4ieBuyyJiEg9kxfYIrEw4DgqEiYAHUMwVqU48/Rbycz0bxgFY2C
	 l9JYr8wRGjy0DsJxr/6k+SnBr9DmSyvOwHMVYiEBhfhJord3Omx+KXu5eHYXhVRD7ztMd
	 EXu2b1cDLwNLrsVt1/FbXc8DB5RJmFOCrHkLLiGx/GWarWJQtozvFr6yuJf/3nc/0s8Km
	 iTcrIE+CLPZNnH7vYEjuAeKJONhhwS/SXNYKs3reH0GgQ5C2nhMzzX5rI/ANbxzAN6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446710;
	h=Received:DKIM-Signature:Date:Content-Type:Content-Transfer-Encoding:
	 MIME-Version:From:Cc:To:In-Reply-To:References:Message-Id:Subject;
	bh=FvnFG2X958aZ/IG5XTqnRSJAAVBXRr/sljwh7YAWsrA=;
	b=m1sPDmeK9diVh/jgY4msDj+8SRipa6rTpE7kvCJXQIvH0uRMF9ivwVwvasH1Lh6nX9OR
	 7IIPATGzkcWVNFQ4hCDgk+nxxE9fZO8XB0mTxopRhkEIWSMZIBFwzb9Km+J6h6EnhqGc3
	 OfWpU/L3Rw739Bq66uwDE6ZsMKd2+3bnC2jDsDy22A1WdpFN35UTWUGuNnIH6UBbMYw8y
	 Y82Y+fWu34E2FGa4Y91IvQahF/sjA6ffGo/0DskP+f/AXSBJs4zH5zJpKZGVdrEPa5w4G
	 TSrbQHejQuuOIb3QMSTr0EoxEY6KBhtlXUa8fOHGoukX++pr+/MwUsUkyqq/RMqGQUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n01Ax64I;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3179606A683;
	Mon, 23 Nov 2026 15:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n01Ax64I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 280C41F00A36;
	Mon, 23 Nov 2026 15:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795446709;
	bh=FvnFG2X958aZ/IG5XTqnRSJAAVBXRr/sljwh7YAWsrA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=n01Ax64ITaJ75BdRgnTQosOs5o9wc7eYsCqqp3Jcbf0bNPD2mHzxy10K3I/V8Dq0J
	 yg/LdgxP4po8T8nZsnHlUL8lvRnLtRUAU8PHevrkpD8RM+4yHEzXuv/KY9Yxv2LOvU
	 0ISvZygZmEB8WG44xqVA5ThAm3r6j/oz7P9R7J1IzpVw32IOOcO/lvmgO3z05v1hAy
	 KoT1HEWmWQ50HT04d/C/Cntmfz928SqhjAO8TiT7of+0mF9TO3aXqLMMIgrsyBYEVS
	 hG0DYnvkHZ5cHZw7SwAKMsU7GHK0IIPfiyg7Os9QEOB08UthhOpFucDvcaFu6pZWnV
	 A2WVHJce1rNlA==
Date: Mon, 23 Nov 2026 09:11:48 -0600
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
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-clk@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
 Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, devicetree@vger.kernel.org, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>
To: Hikmah Gumelar <hikmahgumelar@gmail.com>
In-Reply-To: <20261123123546.152162-5-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
 <20261123123546.152162-1-hikmahgumelar@gmail.com>
 <20261123123546.152162-5-hikmahgumelar@gmail.com>
Message-Id: <179544616751.2477990.9941137305681847690.robh@kernel.org>
Subject: Re: [PATCH v2 4/7] media: dt-bindings: media: i2c: add OmniVision
 OV12A10


On Mon, 23 Nov 2026 19:35:43 +0700, Hikmah Gumelar wrote:
> Add Devicetree binding schema for the OmniVision OV12A10 12-megapixel
> MIPI CSI-2 CMOS image sensor.
> 
> Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
> ---
>  .../bindings/media/i2c/ovti,ov12a10.yaml      | 115 ++++++++++++++++++
>  1 file changed, 115 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org'
./Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml: error checking schema file: cannot load meta-schema http://devicetree.org
./Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml: error checking schema file: cannot load meta-schema http://devicetree.org
Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.example.dtb: /example-0/i2c/camera-sensor@10: failed to match any schema with compatible: ['ovti,ov12a10']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20261123123546.152162-5-hikmahgumelar@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

