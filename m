Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446705;
	b=S0xl/NF8j8uu6vXFC8cgf4/rQsBqp+pI0c8lYm8+G9UbudcE2Su3raHvYFgeSPvkrDAc
	 1Tg9YHUZRYhRQi5iCM8qZ+pnIQdetYN+SmKx9ki4G9xXRPJAhuzcS14WeFieOO9s7Y4yj
	 kiYWf91VfrHFRqnhRUhHqqds+EcmmMcXShTTCsBTT9nG/4gxeQ9L/H+v7S/PU/UF8ki6o
	 OmVMYXSYGyFcwxVq9L7RAY6k81TjChuXnC4TCRXk0ONh7DeC4Nc0/NAChj1IUujYlOwe7
	 wpXLnC6OtOQLIUCUNzBemNCKM27/yd1rTkiwW1/Az13SCCAeyJaZvPp0Vb96KB9zXEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446705;
	h=Received:DKIM-Signature:Date:Content-Type:Content-Transfer-Encoding:
	 MIME-Version:From:Cc:To:In-Reply-To:References:Message-Id:Subject;
	bh=1L9GnpsNt8ZZ/pgT3HpvaYJ1aoMYBrPB/nRuqcQd1UI=;
	b=EDlsaflTfxTLOW8W+GZCUE4XRppHKdsE6nlxRXYfmog/jqbBMX07GootLxLGfNOy/0sT
	 EgqcbLOmdBHW1zJWFbo4X3yhC2l78zLgwg71Wn/aNXus1n/oNsjw2pms9ygMpQIXs5LQP
	 LtWznFQI0E8+BFVffUIM/YoXYZVZpD1UQXiTAh5Vau0EazYe/5B5N0L87G1A+cphXaxKT
	 +3DJZ5CWX4VkmISl37JBksOfyWtsXPnkg4P5blaxfK1bihjRlIUFn5K+ygGv7VZHEFIEq
	 B4IqDM4dioqruDSsIXshP3JxY1kumV5WODUof2U2/2DVC68yNL2ZHCMOrrT+6ysVuUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XyM+H3wB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67758606A339;
	Mon, 23 Nov 2026 15:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XyM+H3wB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A79D11F000CF;
	Mon, 23 Nov 2026 15:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795446704;
	bh=1L9GnpsNt8ZZ/pgT3HpvaYJ1aoMYBrPB/nRuqcQd1UI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=XyM+H3wBvmzaxqKBrwC4x2bacOx0bB4hKBfd2ALSqtpn3lwVLQkMuWHiF+2juMxC6
	 n6BddBMHiMmMtTjHQq1iqcIoG0ZEy8+oPaswG1235S+GHiLoqWZ958riK1v5EVniLK
	 7Jf6b2OWO+q6gbjOCb1+RNZlccMdZQOmyH9KS8x9JkPz0vsI/PO7N542Mbh+MTcY7U
	 EsohH4cWCQ5ybVIWIvqWo+14d9PnVWhykIVBzdwaBHuD61vC5rEUjb7aGWeF/FwDEa
	 DtasCByHVgjGC3pHxqxbXHuvpRX5Mer6ZtyfbawiK3ADeQRy2WD3ICuar6AzlKJus9
	 ODHgr8Z2DUuJw==
Date: Mon, 23 Nov 2026 09:11:43 -0600
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
Cc: linux-clk@vger.kernel.org, Brian Masney <bmasney@redhat.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
 Michael Turquette <mturquette@baylibre.com>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
To: Hikmah Gumelar <hikmahgumelar@gmail.com>
In-Reply-To: <20261123110805.119610-3-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
 <20261123110805.119610-3-hikmahgumelar@gmail.com>
Message-Id: <179544616487.2477744.9094052738854164877.robh@kernel.org>
Subject: Re: [PATCH 2/6] media: dt-bindings: media: i2c: add Samsung S5K5E8


On Mon, 23 Nov 2026 18:08:01 +0700, Hikmah Gumelar wrote:
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

See https://patchwork.kernel.org/project/devicetree/patch/20261123110805.119610-3-hikmahgumelar@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

