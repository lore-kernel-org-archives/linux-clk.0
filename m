Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEFF3EEAC3;
	Tue, 22 Sep 2026 18:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790103295; cv=none; b=FbyMtTR0xsr3JYgBax09RU8F50FU2w9imWfjC3NWp3ylZBu6s2+eRL28K/Xy6h3ZUW5DSv/+imiCtLnqUo0O2JG99wKo8FcjG02gVWRc+xx4o8XOL0GTo93/X79sugGJSSgKElVWhfZDSR3uvYxGPHStKgl5P1QTyzEqRSpSVKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790103295; c=relaxed/simple;
	bh=99AVqzP1HNcp9/lr+LE/qiMjzjfoWgDtKISwjoAlG1s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NjoeDjJkHb4vSGDkvyHTM3jARmTbhzt1L8SucofbTPmS+nbIIS/liykJjkvcgW5s/i7igkht/tBlpiz+dmLE2Kt3yXWhH8rXz+JyWC55iWYOvle6S1L8feH9Xa4QES0XmSq9YzjqZ6Y4IUYE0D8/2hKqpramdlZUfFv8jAjM+Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NDcj/eWZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NDcj/eWZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51A221F000FF;
	Tue, 22 Sep 2026 18:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790103289;
	bh=sJU/kGetLa+JXuMCazuhx0pB/N2b6BEHcVtCtBLjApo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NDcj/eWZjqvUKJxiPkdO7AIzLoUCbbo5vnFEMCtK4Gz7gYX9G1UV/4AD6rvyOgUY+
	 Qmv8n0+93a6zUjK+K8bJm1JNEt46Ce7ayixGOTz3RLmSrN83aAgW4Z3gvPkWcMtdPS
	 UXaxPGlT7rkm4wci55VR5yT7Dn4BMpg1m8FJ9GCtQSFH6Pbvl9JxnAGfiW4ZRXQ/RU
	 JEJuy9Vo2uXJqOktTwYiD7A1/Xwx1fwWHX75BojMaEetmaRcuT0aJwHvKImX2Yv9MU
	 H5vaq3L73XJlDyI27wc/ciKB5FI9QiIi9izrJIDHzdiZG0ZQvR0Y0mDQQliv8D3TaA
	 nobg9juyQjbrQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: clock: Add LPASS AUDIOCC and reset
 controller for Glymur
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260922184425.56114-2-srinivas.kandagatla@oss.qualcomm.com>
References: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260922184425.56114-2-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 18:54:48 +0000
Message-Id: <20260922185449.51A221F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: incorrect `#clock-cells` requirement for reset-only pr=
ovider
--

commit 347d3aed7b27ab7cf248e5a7c46279253cf08e0e
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

dt-bindings: clock: Add LPASS AUDIOCC and reset controller for Glymur

This commit introduces device tree bindings for the LPASS audio clock and
reset controller on Glymur. It defines the compatible string and required
properties for the device node.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.=
yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
> new file mode 100644
> index 0000000000000..c047c0174a93d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
[ ... ]
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,glymur-lpassaudiocc
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'

[Severity: Low]
Since the commit message specifies that the audio clock controller only
provides reset support when it is under the control of Q6DSP, and zero
clocks are exported to Linux, should '#clock-cells' be required here?

Making '#clock-cells' a required property forces device tree authors to
include an unused, dummy property that incorrectly models the hardware's
capabilities just to pass DT schema validation. Similar reset-only clock
controller bindings (e.g., qcom,sm6115-lpasscc.yaml) correctly omit the
'#clock-cells' property entirely.

> +  - '#reset-cells'

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922184425.5611=
4-1-srinivas.kandagatla@oss.qualcomm.com?part=3D1
