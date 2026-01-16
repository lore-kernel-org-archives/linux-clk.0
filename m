Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F4718FC86;
	Fri, 16 Jan 2026 03:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768533512; cv=none; b=Co7T5dZ1IuIU+sSh8I7CyWAYQT3BpnPOcWLJXErCC1nLrm9bL19C5V2rhZUCc9Y+/pKU7A0HNtseNliPOxlIn1oTvv7HKhIkACDRI7rDgaJxUaEO6HMYZ0NmGfDY2w/kYayjZrWMkC2jVb//+EtjdOgjHMw5gXxUqCc6rGjLmr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768533512; c=relaxed/simple;
	bh=Xm+2ll6ivXVZctHPRIrQeLW8sIpBDbueJK+DuxLa5rk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=iISI/Nd7UptvkC2gzuaWSPvURad+kb/83A4QR8+Gn+WwaDzkwiDNizitfaoPzhdYOEj4kcCqim+UM6+40OCORrcHyFxu1DM/hWX2F4sxRqA3klvEkl3V5qXojcMfkgSsj7Rswko2+ZC+dPK4S3ftwp90/t1huxoyi7QqMn5CW9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k3O824Y6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k3O824Y6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4582EC116D0;
	Fri, 16 Jan 2026 03:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768533511;
	bh=Xm+2ll6ivXVZctHPRIrQeLW8sIpBDbueJK+DuxLa5rk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=k3O824Y60vtT5R9anTKnp9bw+151BBSUSj3Sxc819MJHmZ6s52txAlPa//g/3pLMr
	 iYAiwhBafq3AvKJ/rtlljLfzqt2vpzyHLfv9ehGYfcf8EQ3kIsao+Zpo8axxH8uSNt
	 kzYbNm873D8NiGj+ZdwFpC69AWjB75NkrfgOuIHcPmqSonxvcrEl4ordp3BpQihohm
	 SQpiiM26WcrTZYpho6fzFoSfR9qqdMpKyvZ7NbiO12xOgRTrW12IvJ4kwwhmCozAMk
	 BaPuOg1nZW74wWc0bgW0UsBIry2ROQKvpPK6QZ4KJM/eUMa7f402nFNNX4Pu3k4vHv
	 8ThnmyeDkwrjg==
Date: Thu, 15 Jan 2026 21:18:30 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, mpe@oss.tenstorrent.com, 
 linux-clk@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, 
 mpe@kernel.org, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Drew Fustini <dfustini@oss.tenstorrent.com>, linux-kernel@vger.kernel.org, 
 agross@kernel.org, npiggin@oss.tenstorrent.com, agross@oss.tenstorrent.com, 
 joel@jms.id.au, fustini@kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Joel Stanley <jms@oss.tenstorrent.com>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
In-Reply-To: <20260115-atlantis-clocks-v1-1-7356e671f28b@oss.tenstorrent.com>
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
 <20260115-atlantis-clocks-v1-1-7356e671f28b@oss.tenstorrent.com>
Message-Id: <176853351040.1182938.10653081903273010930.robh@kernel.org>
Subject: Re: [PATCH 1/8] dt-bindings: soc: tenstorrent: Add
 tenstorrent,atlantis-syscon


On Thu, 15 Jan 2026 17:42:00 -0600, Anirudh Srinivasan wrote:
> Document bindings for Tenstorrent Atlantis syscon that manages clocks
> and resets. This syscon block is instantiated 4 times in the SoC.
> This commit documents the clocks from the RCPU syscon block.
> 
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> ---
>  .../tenstorrent/tenstorrent,atlantis-syscon.yaml   | 58 +++++++++++++++++++
>  MAINTAINERS                                        |  2 +
>  .../clock/tenstorrent,atlantis-syscon.h            | 67 ++++++++++++++++++++++
>  3 files changed, 127 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.example.dtb: /example-0/system-controller@a8000000: failed to match any schema with compatible: ['tenstorrent,atlantis-sycon-rcpu']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260115-atlantis-clocks-v1-1-7356e671f28b@oss.tenstorrent.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

