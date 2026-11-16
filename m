Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794807821;
	b=oSJOCda1RXTVzOuIAzZu/3VBp85BKYosS10gg0ua2gkto0GVc+266aQONQTty6IuCeCn
	 r3ehOWZVK4iieCsp675M0FC1hAHCkSnPoQUl6Q/9bwraAKdvIjc+mmGTKybYCv21tOmUg
	 Zj7+9v0i41nflUOrT36m1BsLiKBmVFUCXVkktNcQjnbWAe/kHrBsNY2MV4oxS9hNeAVts
	 NcXuWvBL3QTteJ8RMXJno9OhyM6E/S798JTMpyY/0+Dw7vaw0QtgED18BBr+l4ccKMLI1
	 2chVbDb6w2Tfz8dWeKkuUifiPuX0ACtECgmApSByaW+eYB+d0XBKLf4CD3h/KEsPxhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794807821;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=cfRcv7NfBSJP+p9538ZjBTDmpz8IXDfqMluGayoDZB4=;
	b=JV3nxBX8yyCk1v9fYjTokSSb7gD9xTaYdW3wx2JMfLLR9gHsrtT3SRIRHjOc0CYYhrJE
	 5lMv/WgamXqBhQYdk8Uu2U1HP9bcmUE6gzRO6cKk8XvDWUZFCWFKbZ3IWRxpzN55PUnJk
	 c9IbH2FMEn+GxFHAEHfZoygx6/4aOhuwX3m9t33kYx6i9T0NDGNcC8qvF40qJj11D3MId
	 fKLJQStkZnpLM5lC1oWlpZEiNBgkdSm3eMFAoSsE4plK//+fp5YmRY/ZfRK19B5eU1SMp
	 6Ba/MwmlJjV94LWTQMZ3G9/WDmmL5jr91OVe+sIoPbnAPQeftg8YbeflH5V8eB7XGYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g9uLcQ6X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099AB606A882;
	Mon, 16 Nov 2026 05:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g9uLcQ6X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DC411F000C4;
	Mon, 16 Nov 2026 05:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794807820;
	bh=cfRcv7NfBSJP+p9538ZjBTDmpz8IXDfqMluGayoDZB4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g9uLcQ6XL4Of1eEk4LOJlBE+i+tiAWfPIrqjLL6ZGdRhzVh5iwfIdU5nbDGZSZdxH
	 bBqYj8Hd88TIW1gfm7ljnOqZpL44DcbJ3BWTm0atMHI6yXX43zs+znbNIeiYuld8QA
	 JACxiggNR2DFBAMuTWAS9GMNQtouwLWERwG4wFATZn3YRBDv8gxJhLcuVisFNN9LlP
	 OeQHSvehRESg9SlfFHUXiBzHH9/ekVKbo6UbtgWJVd9t9d9CnBgXmLEuVcZ0divx3Y
	 cEGk2d3ojE0dK7U/vzcN/zOAGrG6Vi9syiZ3vAVSPJj7eeU4UdKulpsyj18jC2apWU
	 80TkhFRHiOfGQ==
Message-ID: <sashiko-outbox-216223@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 3/8] thermal/qcom/lmh: Switch to match data for SoC
 CPU-to-node mappings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sreeshankar K" <sreeshankar0910@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-sm7250-v15-3-6acbb232fef8@gmail.com>
References: <20261116-sm7250-v15-0-6acbb232fef8@gmail.com>
 <20261116-sm7250-v15-3-6acbb232fef8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 05:43:39 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] thermal/qcom/lmh: commit message struct names mismatch
  lmh_soc_data
--

commit eec53390ca0e7b9b5a048e799d6259ee4ce6ec2a
Author: Sreeshankar K <sreeshankar0910@gmail.com>

thermal/qcom/lmh: Switch to match data for SoC CPU-to-node mappings

This commit replaces the hardcoded CPU-to-node ID checks in lmh_probe()
with per-SoC mapping tables stored in the OF match data.

> diff --git a/drivers/thermal/qcom/lmh.c b/drivers/thermal/qcom/lmh.c
> index 6bfe25021e05f..9d66d75d87735 100644
> --- a/drivers/thermal/qcom/lmh.c
> +++ b/drivers/thermal/qcom/lmh.c
> @@ -94,19 +94,53 @@ static const struct irq_domain_ops lmh_irq_ops =3D {
>  	.xlate =3D irq_domain_xlate_onecell,
>  };
> =20
> +struct lmh_soc_map {
> +	int cpu_id;
> +	u32 node_id;
> +};
> +
> +struct lmh_soc_data {
> +	uintptr_t flags;
> +	const struct lmh_soc_map *map;
> +	size_t num_nodes;
> +};

[Severity: Low]
This isn't a bug, but the commit message refers to these structures as
struct qcom_lmh_node_map and struct qcom_lmh_soc_data instead of struct
lmh_soc_map and struct lmh_soc_data.  Also, should flags be unsigned int
instead of uintptr_t, since it is no longer cast from the match data
pointer and is assigned to unsigned int enable_alg in lmh_probe()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-sm7250-v15=
-0-6acbb232fef8@gmail.com?part=3D3
