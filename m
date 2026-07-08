Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087AF3E63B7;
	Wed,  8 Jul 2026 09:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783501564; cv=none; b=TXigLJcy8zxsaNHURBOHJz8ijqkesHpmO/YPFG1X1z9zshe8L07meFhPMwaHH36nb/MU/46tTwsjjplTono5STYJDXg7RIK0IiqsMZctySuF7jcxixwI8qbbMuDP+Xq0ZV+FJCSzhAFLJgHkPGmqSo0AMuiXmJ8WkSF+3gYBb1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783501564; c=relaxed/simple;
	bh=PoUJnzPX4dOmxMBSKZmCYJ6F3rHOxpsYaFkQlf3IC8A=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=UpNV0VVb2wCcVlpF2WCX905s7lR0cHVwwUpa75NqgInyobDcFAwpcXMUFV/KVo9+2H9YgBj2FNllGqI489S6kOvOhVllyKmxzutA2A/KK/YgIbDXVqRGLGo1yc6akweTssaRPdev0bfQCWH+irRHchuVG5xFa44YksaewdiC/nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g0gssUXp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g0gssUXp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C23811F00A3A;
	Wed,  8 Jul 2026 09:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783501562;
	bh=X8nQPHPZF9ibSe2QeM2g0Ll1JIPfuYfJWJiXYgzvRV0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=g0gssUXp7OyJJqvrtvPi4K+Z9iWCxIGmlPRlBsE+BlGzJEKnSLO2YNOpGTb9E5UZt
	 6wEDiSxrXYjYpeFK+edzadnyt5XU07XyGOWBiayOatzAFKOjd7+hRrR0wyXOYXAqQJ
	 eHlJAsexKCot+mTBw46/eGNT0bE4GEYUAGIGmebt+bXXuCnJ/lT6lJFjiDL+TojMGi
	 qRg7nwhxaOeLPZALfaOKDw2hFvAVDM5H5jvLoNOnjdAub40crtxFoK820s5YmVpGMl
	 G6HriwohKaO+vW4Pa8Df8fc+/CvYPIg2vI7Fc/Iy/HnHFFD1VaHzZz5pWVwfG2QGIf
	 sITPE3MI8XTag==
Date: Wed, 08 Jul 2026 04:06:02 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, monstr@monstr.eu, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>, 
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, 
 "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
 kishore Manne <nava.kishore.manne@amd.com>, git@amd.com, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Michal Simek <michal.simek@amd.com>
In-Reply-To: <f6fc3f65475888cd5726e3f2795a110e9f7a79c3.1783495122.git.michal.simek@amd.com>
References: <cover.1783495122.git.michal.simek@amd.com>
 <f6fc3f65475888cd5726e3f2795a110e9f7a79c3.1783495122.git.michal.simek@amd.com>
Message-Id: <178350156210.1961721.11862849242704458553.robh@kernel.org>
Subject: Re: [PATCH v4 3/5] dt-bindings: clock: Move xlnx,zynqmp-clk to its
 own schema


On Wed, 08 Jul 2026 09:18:50 +0200, Michal Simek wrote:
> The ZynqMP clock controller binding shares only #clock-cells with the
> Versal bindings. Move it to a dedicated xlnx,zynqmp-clk.yaml schema.
> Also remove "(Optional clock)" from clock description because it is visible
> from schema itself.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> 
> Changes in v4:
> - Update regex from previous patch
> 
> Changes in v3:
> - Cover change in zynqmp-firmware.yaml
> - Move clock-cells to be the last in the example
> - Remove comment around (Optional clock) which is obvious from schema
>   itself
> 
> Changes in v2:
> - New patch in series
> - Split zynqmp-clk from versal-clk
> 
>  .../bindings/clock/xlnx,versal-clk.yaml       | 50 +-------------
>  .../bindings/clock/xlnx,zynqmp-clk.yaml       | 68 +++++++++++++++++++
>  .../firmware/xilinx/xlnx,zynqmp-firmware.yaml |  7 +-
>  3 files changed, 76 insertions(+), 49 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/xlnx,versal-clk.example.dtb: zynqmp-firmware (xlnx,zynqmp-firmware): clock-controller:clock-names:0: 'pss_ref_clk' was expected
	from schema $id: http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/xlnx,versal-clk.example.dtb: zynqmp-firmware (xlnx,zynqmp-firmware): clock-controller:clock-names:1: 'video_clk' was expected
	from schema $id: http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/xlnx,versal-clk.example.dtb: zynqmp-firmware (xlnx,zynqmp-firmware): clock-controller:clock-names: ['ref', 'pl_alt_ref'] is too short
	from schema $id: http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/xlnx,versal-clk.example.dtb: zynqmp-firmware (xlnx,zynqmp-firmware): clock-controller:clocks: [[4294967295], [4294967295]] is too short
	from schema $id: http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/xlnx,versal-clk.example.dtb: zynqmp-firmware (xlnx,zynqmp-firmware): clock-controller:compatible:0: 'xlnx,zynqmp-clk' was expected
	from schema $id: http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/f6fc3f65475888cd5726e3f2795a110e9f7a79c3.1783495122.git.michal.simek@amd.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

