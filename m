Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268939;
	b=A9RZUK4zwDTHeRx7x4RkXPAZP/sCNyIHL9zdYDXB0L+rfFwRF2uET1pCeuzknf/K7WjB
	 byW4N4wqWCNZpSzQ1yzI5SGjd3tbkDuc8gUa9Az2wT8PBWMZBpd3Atsk2QWBzpcv2s6Nf
	 WlntTZeiITQ3wX5D/hL1BaH9vyQa2deBOU6PawVN+2mUtWS4CfDuCbNESSigwGYXQ6vkk
	 AGLZ3416c+KFELGIWP5vrYOGUZlrRb5JJMND99L0/6ZTuugjkPyy5F/m8+lcPo0ky/3M8
	 wmS8xQwUWhXOkigR8B2ymsLKKzNgwRBguFRDBNLAEZDeuCHpXf31+KWJxqhRv21lUiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268939;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=iswmhSBupd3+4V/sZqTdg7s5PvMqpcv4SbYDCcMLDi4=;
	b=3S9YLQYzbcTBAkpp5i7n0tliCmCo+k7bo5xkxBWfxA/kqtTTcydj9LNctHQZANFVvERe
	 sdIRg9x3cT8gopWXrhgLkxuIAIo9Xa/bKW6WG/hToRSFVtYOtr0VWkGW8+7k0olcUwG/+
	 y8Cj2O+lhPZh+gFNYP1pFslhLYgMaYSZ+7N6cgyhWuU3mRisk5vPR4oLhnds7Q4VFKaH/
	 IcnANFB4/A4393YcLjuB+8EC6FSywBuMjaaciwGeqv8hHIrz7UoTnvoPofBfCGbR8o7lc
	 1znSJBDf0IznAGRJP+PwAhYIOXOgIwpJLBjmioTido7PQREnIp1bR7qd4rpR+KqjBJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BQainA3a;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5B2606A338;
	Tue, 10 Nov 2026 00:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BQainA3a
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ABBF1F008A1;
	Tue, 10 Nov 2026 00:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794268938;
	bh=iswmhSBupd3+4V/sZqTdg7s5PvMqpcv4SbYDCcMLDi4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=BQainA3aLL3tctF6eSYz5UD8z2/yzFPcugKNRyE/1A5zT4LS9JhnT8CqzKr/Drilj
	 aE87krEXFwsTsJ9plyDlqD699om7yYYJ9Hlcijf2Qy9YFKewnFhI0cmYpfSjKmPx0A
	 ifTCIVRgBfYmll6RyRoEmCZvvF9brZyyh7CyzHYrCh+U5fqZ30Is+1fYD3BfEJxIza
	 N1UFfywzZnzjxncbqvUfjcyjcUOVcYQi7Ff1Hw5YusjtavXe2Kwc2hHj9zvhQQUuT5
	 /ZNeERrKhyTdQIXisHVzxxCT1ml38DbNVsEnK7wU6Gpgq/vX2fe4n6UINpitx4XFJL
	 1/w+JXLf6VzLQ==
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] dt-bindings: clock: Convert hisilicon,hi3519-crg to DT
 schema
From: Brian Masney <masneyb@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wei Xu <xuwei5@hisilicon.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261109184453.449141-1-robh@kernel.org>
References: <20261109184453.449141-1-robh@kernel.org>
Date: Mon, 09 Nov 2026 19:02:07 -0500
Message-Id: <179426892717.1046663.15910907070007330456.b4-review@b4>
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=959; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=eWKZGKoXvfxcJ/98GY5b3tEl1FtcVXybVj7TdBkfkMA=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLI+xTMYTjJluvPvdnfa56dPL03/e85z61QDFlnlrud8X
 IoLXNnPdJSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCRvQcZ/hdaJ585FZA3mVH7
 W9+BVhvReitFHVsm+2zVA5Vb/zP/SGFk+BbDs3jBK5XV+SfVNPYY+N2of759oaD8XQ6dLVf/rPu
 ZxgAA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Rob,

> Convert the HiSilicon CRG binding to DT schema format.
> 
> The allowed compatibles was not very accurate, so update them to
> match the users. Drop the hi3516cv300 compatibles as the platform
> has no DT and only a few drivers (pending removal) upstream.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

[snip]

> diff --git a/Documentation/devicetree/bindings/clock/hisilicon,hi3519-crg.yaml b/Documentation/devicetree/bindings/clock/hisilicon,hi3519-crg.yaml
> new file mode 100644
> index 000000000000..c0b7a5521fe3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/hisilicon,hi3519-crg.yaml
> @@ -0,0 +1,61 @@
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/hisilicon,hi3519-crg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#

I can take this but please post a new version with a
SPDX-License-Identifier.

Brian

-- 
Brian Masney <masneyb@kernel.org>
