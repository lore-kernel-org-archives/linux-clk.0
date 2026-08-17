Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B4B5477E;
	Mon, 17 Aug 2026 08:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786955652; cv=none; b=SNfP6d8RejGnvlFEmXl+J4YcWLuS15H0wV02xaYQzCN+ck5X4DmyVT6uEpnNfqDybBtJAEuv5h1CP0l4utJF0UvmVwJkKL1tsnG4xLfqnrz09r7bSxe+ViMkyShSG1SJwORZJn3Om6i1cSbL3uTKpP5DMapsWccsv5/TibUh7YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786955652; c=relaxed/simple;
	bh=V3FFEDwVCO5uZa8DyixPwzN/Uy1euTAFyoRehPEj810=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FMNkU5wHb8I+B/bijq0CO8QjkRziq++DA9xKEg54xflcHEFb/5uJ5467P5fKYzmiVm7/QIXz58WJb1vRlRuo2JJElIN1BNpci37Y8FiP1+cSgZjztp/09vweNaeTndHze0tefhwaI8caBoUKBRnRgsAe5Og0spP5+YqmDSoxqYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mt1hi2Ps; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mt1hi2Ps"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F3231F000E9;
	Mon, 17 Aug 2026 08:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786955650;
	bh=sTDuRm9jJV9kacfomDPYYzlkfo927o8z+l4ElrwP0JM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mt1hi2PseN8RGeZzWYzLM0KPKkqx7zl0EfTo9LrZ26bn4+yESb+3NruGDfboW5NY4
	 DnVNovKb0aXg87BpEsKFdEDaO7lKP6VsFT2aebmuPdCuLM2dgSPQimiF8UDPpPIo83
	 0RhA1mOr0pmkZEv1+89GGeAuKlGIuds1kuRgFTFU/2urz9ZOJ2d/xOTA6BhM91a/U1
	 kzLuXSZHpnxBPn0qouC/ygKGM86c1uFsDecwTWoXNEroRC2f1tJ0ECHbKBoKXeK1lV
	 QFjKeRDTETGyYW6/3Xc7TDpV25vnMOAj46DVBXsWV5GxXJWJNj454nvmc2jf7hGl8m
	 jizAGpeTvT/Ig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into
 SM6375
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260817082457.64797-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260817082457.64797-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 08:34:08 +0000
Message-Id: <20260817083409.8F3231F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incomplete update of the binding description when merging SM7150=
 support.
--

--- Patch [1]: [PATCH] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 in=
to SM6375 ---
commit 92315f069f3a56f62591f2cf108c846e8914866e
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375

Bindings for Qualcomm SM7150 and SM6375 GCC clock controllers are merged
into a single file since they share identical structures. The SM7150 binding
is deleted and added as a compatible string to the SM6375 file.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml=
 b/Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml
> index 66dfa72fa9751..b4ad2ad14d85e 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml
> @@ -4,10 +4,13 @@
>  $id: http://devicetree.org/schemas/clock/qcom,sm6375-gcc.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: Qualcomm Global Clock & Reset Controller on SM6375
> +title: Qualcomm Global Clock & Reset Controller on SM6375 and SM7150
> =20
>  maintainers:
>    - Konrad Dybcio <konradybcio@kernel.org>
> +  - Bjorn Andersson <andersson@kernel.org>
> +  - Danila Tikhonov <danila@jiaxyga.com>
> +  - David Wronek <davidwronek@gmail.com>
> =20
>  description: |
>    Qualcomm global clock control module provides the clocks, resets and p=
ower

[Severity: Medium]
Should the description block be updated to include a reference to the SM7150
header file?

The deleted qcom,sm7150-gcc.yaml file contained:

  See also: include/dt-bindings/clock/qcom,sm7150-gcc.h

Leaving only the SM6375 header reference might mislead developers configuri=
ng
SM7150 hardware into using incorrect clock indices, as the clock IDs typica=
lly
differ between the two chips.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817082457.6479=
7-2-krzysztof.kozlowski@oss.qualcomm.com?part=3D1
