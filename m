Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78513A5E9F;
	Thu,  5 Mar 2026 13:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772718324; cv=none; b=ZzIJ6K8+oyJRcSjlE3vhfGRg28uIW9EjFkkIN2afr/y+07t38VGVaw7g3YoxD++TCh6ihFT3PVe1XLfJh3ykwtAGIutYZpEWDmqf09w9WjKDdQXmxrYP+NNbuo9RvtW0BmtPC0563U7P3MdwzoNhVqQE+LO03jyKJcGuvDQbvE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772718324; c=relaxed/simple;
	bh=cfwd3qIJwmG1wuBwTW5ybvjyz1eIJ+iRMnfvFs+2hdg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=annpuf/hJZZGyayCUuw/fmKjkV4pDJlZyqTf2qbOZJWTwo4jHhgoCH+xHAQLqFRRpxfVLv3afgrIPG9aeyFOeommNsHBt6HFRqWfwJOamT06djH4IfFQ3FHmgXui/BvMZC6N20Wlks9e7dIANflJGSTKtKDmF20LovTRPuVTV/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R/v3qqbd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R/v3qqbd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F76BC116C6;
	Thu,  5 Mar 2026 13:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772718324;
	bh=cfwd3qIJwmG1wuBwTW5ybvjyz1eIJ+iRMnfvFs+2hdg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=R/v3qqbduJEbLupxWE8fZTb/UX+dNWVPcPvZFAHZRU6FM6YXTXinqLyG0sGwv3ksq
	 swPJAVC8ECOibBcjy3A8xnEMnojp/njgVtqOsfLnLUi4lTF/wRUgx14MoW7mY2I3We
	 0ZuyNUp8fHzNM6+MqNvQKihly9AMg6zfTAgsb+K1g5+pCVgLLfoPD49cwK+R2UC9iP
	 sIcY7SqAob3eLScpS3gYrhe4h5+4dwwr3DskR63I2s2gcTnt2bA2rHmLkw+KhEbylL
	 F0hJ4Vt2K4i3grQnSnfqlNn8TjJgvnCjzzRHevDGrNyGZC5nD0uTZhPtfDIKKdmGFz
	 JImiDUYXXIeiA==
Date: Thu, 05 Mar 2026 07:45:23 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 linux-amlogic <linux-amlogic@lists.infradead.org>, 
 Stephen Boyd <sboyd@kernel.org>, Ronald Claveau <linux-kernel-dev@aliel.fr>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-clk <linux-clk@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 devicetree <devicetree@vger.kernel.org>, robh+dt <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <20260305074328.639993-3-jian.hu@amlogic.com>
References: <20260305074328.639993-1-jian.hu@amlogic.com>
 <20260305074328.639993-3-jian.hu@amlogic.com>
Message-Id: <177271832223.3486876.11276313304536737957.robh@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: clock: amlogic: t7: Add missing mpll3
 parent clock


On Thu, 05 Mar 2026 15:43:26 +0800, Jian Hu wrote:
> The mpll3 clock is a valid parent clock for sd_emmc and mipi_isp on
> the Amlogic T7 SoC, but was missing from t7-peripherals-clkc.yaml.
> Add it to enable proper clock parent configuration for these peripherals.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  .../bindings/clock/amlogic,t7-peripherals-clkc.yaml       | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.example.dts:40.26-27 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1597: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260305074328.639993-3-jian.hu@amlogic.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

