Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780788;
	b=tonXezBZW9YOcDfUqhBzERbJFINZ89UltfHVEN1WOAHSJNc7XJ0E16pDssUQmtE7O5mQ
	 WK8NNs+XKFMN1HVBBnerSjLWfqOUOYVt6cnPLgF8ByKwN94w2K9i7/fGxceoj4rDFFxTw
	 KRh70sWOiecsy46aCkXfHYIXx9DeQbAXqe62R2u7S8sjnR4+ib4qSHqS/nX0gTG0OnO7u
	 agF84IWNkcTicw6j6rooFtNu7qm80Su7pPuRz22qTM2tLdc5pJYZHtreXXBM/axDlT0ck
	 9KZxzGLs75qDZ3wv1CmsU635/lu9zybxr0PqVjgqOV41uZtJOCQYEGeZKGItBKH/6Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780788;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=DWvdXdNhFnJ0O9DoJ8Tn8ak0LEXNXrkgh+s7K3f4xnI=;
	b=Rm+1bEEY+Oz0G74ixHIC0QI4/zUwc1tdJpceHYsE/nxwC3yXT63eQ3iPwL2MJh7SLvw/
	 9JPbGzFPREsL5JHP6D9cApNh+LqGYIS6ZAPRfpm7cxABmSpoFH0ewYH339Bn6ndjs41nH
	 eKHPzGnCaiaoMZwdE65KcTGNFZNHS0d+CoNOnYNPhTXKkER0s/dfcFaOlxVOCzRS2TG86
	 m69hIfR2pY0qHS0G+V1wLIgz85VkNhQRGFLENj/nllm/uF+uLR7Na0uagY1kpNzaDHVF0
	 llOKUMCXYCzgAECeybX9tAj5G7WKGEND7StH2QFvJGb2hVndVEns+XuFfgBje5E6nWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l0I0ZftD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C26606A31C;
	Fri, 27 Nov 2026 11:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l0I0ZftD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60B501F0089C;
	Fri, 27 Nov 2026 11:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795780787;
	bh=DWvdXdNhFnJ0O9DoJ8Tn8ak0LEXNXrkgh+s7K3f4xnI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l0I0ZftDXD4AB2bf9n4f4oN32BKlNolMQUSDPy+tt3tMkzwytHKrNwF0S9fmmEN6K
	 tRrPFEPgAjbOyYsuSsH2G3/EYYTZAjQM/veZpA55LKcue0PK+vtv4YnlLzPvsI6veT
	 nn15pCa7Jqi48wJnkvtViYi85U5YzMRnx4H/ZT9UcR2XA5yKFSpsKjLNgmfi13U9ID
	 ykrz/af1no7QhfHIYG+PUUlLLRzqt1v2KCdj1mjasH0a8Opavyd98pvjQNVu0hhxQ0
	 S3hWFPGla9hXUdxg9C9U3ylYMpPJ61bi0kUSWUhrfJahBsOY9CmgxOXwZzdlZdGuss
	 umTW/rLXaW3Aw==
Message-ID: <sashiko-outbox-237308@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/6] dt-bindings: clock: qcom: document the Seca TCSR
 Clock Controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261127-seca-clocks-v1-3-1781298e658b@oss.qualcomm.com>
References: <20261127-seca-clocks-v1-0-1781298e658b@oss.qualcomm.com>
 <20261127-seca-clocks-v1-3-1781298e658b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 11:59:45 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] dt-bindings: clock: qcom: clocks listed before reg in
  qcom,seca-tcsr.yaml
- [Low] dt-bindings: clock: qcom: inaccurate description in
  qcom,seca-tcsr.yaml
--

commit 79f9dfc2c2abd664b75d0b9d8b416fefd80c9efe
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

dt-bindings: clock: qcom: document the Seca TCSR Clock Controller

This commit adds the devicetree binding schema and clock ID header for the
Top Control and Status Register Clock Controller on Qualcomm Seca SoCs.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,seca-tcsr.yaml =
b/Documentation/devicetree/bindings/clock/qcom,seca-tcsr.yaml
> new file mode 100644
> index 0000000000000..1349f70b5672a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,seca-tcsr.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,seca-tcsr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Top Control and Status Register Clock Controller on Qualcomm Seca=
 SoC
> +
> +maintainers:
> +  - Bartosz Golaszewski <brgl@kernel.org>
> +
> +description: |
> +  Qualcomm TCSR clock control module provides the clocks, resets and pow=
er
> +  domains on the Seca SoC.

[Severity: Low]
Does the Seca TCSR clock controller provide resets or power domains?  The
schema only defines #clock-cells, and include/dt-bindings/clock/qcom,seca-t=
csrcc.h
only defines TCSR_*_CLKREF_EN reference clocks, so mentioning resets and
power domains here looks inaccurate (compare with qcom,x1e80100-tcsr.yaml).

> +
> +  See also:
> +  - include/dt-bindings/clock/qcom,seca-tcsrcc.h
> +
> +properties:
> +  compatible:
> +    const: qcom,seca-tcsr
> +
> +  clocks:
> +    items:
> +      - description: TCXO pad clock
> +
> +  reg:
> +    maxItems: 1

[Severity: Low]
Should reg be placed immediately after compatible and before clocks under
properties, matching the canonical DT binding property order used in
required and examples below?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-seca-clock=
s-v1-0-1781298e658b@oss.qualcomm.com?part=3D3
