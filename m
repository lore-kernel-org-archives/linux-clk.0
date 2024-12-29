Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B5933062;
	Sun, 29 Dec 2024 14:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735482637; cv=none; b=c54kC0tI6v+Z9bpiFKdQ9KLWpMegKLnpTJJjhFfuMKkfYkfktrKduVV8GvsWr74qrre3iM+xdfy3zzolfOhVtIT7dH7qgxMtYv7rv7T/MMHLxA82OI+nqoVaizvtBjJOfTNhcVrqQGJPR6RjQyNy+CpyWuA8Lf8xdv3lbBbqj+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735482637; c=relaxed/simple;
	bh=lFIVaV71tsM7UxfJbfpVommJU7JD4UzmobP32UMnsZU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=SVXzY3v7BR0vKQ/rzH/IwkKIed1QrCj/WPqjX7bgVP3ePMPPVLd4DlJqjCCS7UYfti7UEzv2FH4amzBTx2wPV9JNAVStuJiIqX/379enDrni0p4VsS1tNt6e5btfcX6/cVTRrrUmYQVfZs+0WFKsmWMvMAqw9sL3H2symgAdjJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oUHJ9E1l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oUHJ9E1l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42E9AC4CED1;
	Sun, 29 Dec 2024 14:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735482636;
	bh=lFIVaV71tsM7UxfJbfpVommJU7JD4UzmobP32UMnsZU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=oUHJ9E1ljBqkdDUI0KZvJrzRVz30XDvTlNQOiXt4xBxyPoHI8L+Ud3ZO05V094zjY
	 NpgcQFezAHhFNUP19fZ1NfhcmPbQ47ZpDgMm0X6TpSxL2fLIJAQ5r8ZFZIABHKl8GE
	 N7DEMR0BGD7MYZmIE+BpNsmth9tmvPwn27nSdtwvHdPr+2wp3hgQJM+OTV2nwdcI4k
	 iNYaJ/B8CMINcitW5afhpvGi3UZCJ/U/5tXEcLiXsMgc9e/j+v+EY/apd94PY8rQ/O
	 AR17HaiSyHitgEh1HMQctV/7CI2x5W0afe/4Zt8H2qDNclwlgLExbkDkEyjoLerlFc
	 4Anz/z+YGiwzw==
Date: Sun, 29 Dec 2024 08:30:34 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <TroyMitchell988@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
 Paul Walmsley <paul.walmsley@sifive.com>
To: Xukai Wang <kingxukai@zohomail.com>
In-Reply-To: <20241229-b4-k230-clk-v1-1-221a917e80ed@zohomail.com>
References: <20241229-b4-k230-clk-v1-0-221a917e80ed@zohomail.com>
 <20241229-b4-k230-clk-v1-1-221a917e80ed@zohomail.com>
Message-Id: <173548263487.3742243.93806553348966195.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: clock: Add bindings for Canaan K230
 clock controller


On Sun, 29 Dec 2024 21:21:08 +0800, Xukai Wang wrote:
> This patch adds the Device Tree binding for the clock controller
> on Canaan k230. The binding defines the new clocks available and
> the required properties to configure them correctly.
> 
> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
> ---
>  .../devicetree/bindings/clock/canaan,k230-clk.yaml | 41 ++++++++++++++++++
>  include/dt-bindings/clock/k230-clk.h               | 49 ++++++++++++++++++++++
>  2 files changed, 90 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/canaan,k230-clk.example.dtb: clock-controller@91102000: clocks: 1 was expected
	from schema $id: http://devicetree.org/schemas/clock/canaan,k230-clk.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241229-b4-k230-clk-v1-1-221a917e80ed@zohomail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

