Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C009526E706;
	Sun, 17 May 2026 15:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779032102; cv=none; b=PHdQ8z/l9+3Iwvm6/Wnx3hFSh/Jyr8sj964NrQPkuOaZSFA+NQmvvvC6wj4ej6kc6cAFBixcYhrdf6Ok2tj+hXQtSDC5r8LTQnKC+5Q4qf719JeZvy5ifAsMEsHFrANRs0q92GvA78LOXXMWOpESH5ySFM5Lb39i/5TZ7Bsc2uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779032102; c=relaxed/simple;
	bh=DyCKE+6QVJML/SRaH5o/1PGkhtGZiUS9tYCZZV8ek6k=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=XtknV4NsWSO2Z/SQMmEEcT3bd7gjsSdRQ0yIMRIl/E4LvRNaw5J35P/AZ1NQVZa+4ad4tZQZj9QG1O7t33z43Tw8mCPhoqoGP1ooFY0ja2xt1XTIFv0auT00vP0Dpbx7OZz6yWOCwUptIZH9u7qXsCSF2oeUT7l7ofxwzs/JnWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DdoQ81g0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DdoQ81g0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B64C2BCB0;
	Sun, 17 May 2026 15:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779032102;
	bh=DyCKE+6QVJML/SRaH5o/1PGkhtGZiUS9tYCZZV8ek6k=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=DdoQ81g0J1xQP3Pxn/9g5eRaK99GfNAY6DkB1XsC1WIiIl77PPic5z1XapCVT3qPa
	 OiZtwiF+YR/zmraIvF+YrYoT+JTOmR2b8AcBN0QMNN6/dZIan9plkI7qK5lW3mpJEh
	 cjT8kh/IrfYkjbEqX78uPyAzFnAcUfa/oM2UbF5CUiAlgxlEkKLGN4sW1cBXEFfoQ2
	 5DaKgFDfp/PuQKdJoM+mKCKZkvAsBWGfSrSFeq+goFmvwG9FkYs20ivNo2xmGm7UHA
	 SxKmiCvv+aPvXq6jQUUjmaniT9vdGlruVhaUkHUDRLODIVzzVhunpfTT4D4EN4nzXv
	 QAylAryJ+CRdQ==
Date: Sun, 17 May 2026 10:35:01 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Paul Walmsley <pjw@kernel.org>, 
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
 Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>
To: Chuanhong Guo <gch981213@gmail.com>
In-Reply-To: <20260517-sf21-topcrm-v1-3-438f2e0513ff@gmail.com>
References: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
 <20260517-sf21-topcrm-v1-3-438f2e0513ff@gmail.com>
Message-Id: <177903210154.62629.12426356915694314234.robh@kernel.org>
Subject: Re: [PATCH 3/4] dt-bindings: clock: add doc for Siflower
 sf21-topcrm


On Sun, 17 May 2026 22:12:57 +0800, Chuanhong Guo wrote:
> Add a binding doc for the top clock and reset module found on Siflower
> SF21 SoCs. This block provides the main PLLs, high-level clock
> controls, and some reset lines.
> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> ---
>  .../bindings/clock/siflower,sf21-topcrm.yaml       | 69 ++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/siflower,sf21-topcrm.example.dtb: /: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/siflower,sf21-topcrm.example.dtb: /: 'model' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260517-sf21-topcrm-v1-3-438f2e0513ff@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

