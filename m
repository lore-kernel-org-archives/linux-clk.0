Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A37483816;
	Mon, 14 Sep 2026 14:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789396285; cv=none; b=YUDOCoHlP0xCtlvc4w6y/Fr3OmVRe7jgyc1VNJpHtfUj7fPKVd9pyCCNW1OX7blBIqN4J9tckYn5q30DVf+YRJFONh3+uxJs5Stjf+9RNaa+fP5sn6WBwPndXTSdhiSZzH/fdrECsVZM04+mrPHpSITPLx2rIhB6G41B7YezKIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789396285; c=relaxed/simple;
	bh=YD3wdaecxOK4+16Ks87Ex8K4AMnmFu3VfULPi+HpcVM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Vyeba0S3fx/QCmIuuEfYaZg2RtpNGk56AwFgUAW2186izuxa6JybjsKfE39/SSDHgzoqUw9lW165IZhs/9LTbs9SkaTdlqGfbb0+zpDpdzNMclhXhUasFdWJzTDFmpkWfmeqfsZ2z0fWl0GFSWx0Zy5HJSjZPaTp8g2KEPwYO4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FEG1Pdtc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FEG1Pdtc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 365DE1F000FF;
	Mon, 14 Sep 2026 14:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789396283;
	bh=MJovtcylYmL5yCSxOuybT8hbz7tN/4fqZybGUx3vpAY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FEG1PdtcSrYN080vEZEC8peWH+Te1zxgOZ/hEmxiWHufpJ7t/Hvyf3oRJhOX/mAPm
	 GPdkBzIGUklTWb5WqD18/pVLyL1uwRc/BA3HxPduS62QAs7Zt2S7EIGDJlEYqw5xck
	 Hr5gWZiZNLEx2YELEXF1tMIOy/FxnY0gozQa33RO8bHeeGm6Bp9PBNlPqrmfoAdPOL
	 462W+dX/jwgLYiRP9Un5NdVP5DdUOPti2ff0uvgMpDlQDoqf4ShmXHSfGwGNqhXC4Q
	 aYylYINwCsgcoitYUQ/uhoXNY7Zo/+hy1gKAzQgAxb6ddaaPhmqqP0fAQ6QUKHawAX
	 7CBs+0ely7VoQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 20/52] clk: qcom: gcc-sa8775p: Tie the CX power
 domain to controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-20-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
 <20260914-qcom-tie-cx-to-gcc-v4-20-9d5a606ada33@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 14:31:22 +0000
Message-Id: <20260914143123.365DE1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Asserting a reset via the generic reset framework can cause a sync=
hronous external abort when the GCC controller is runtime suspended.
--

commit 7874573f5500623d6e83e44dfea983e35bc931dd
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

clk: qcom: gcc-sa8775p: Tie the CX power domain to controller

This commit enables runtime PM for the GCC controller by setting use_rpm to
true. This allows the CX power domain to be powered down once all GCC
consumers have released their clocks and GDSCs.

> diff --git a/drivers/clk/qcom/gcc-sa8775p.c b/drivers/clk/qcom/gcc-sa8775=
p.c
> index dca316decd0e6..2f867596bbc5c 100644
> --- a/drivers/clk/qcom/gcc-sa8775p.c
> +++ b/drivers/clk/qcom/gcc-sa8775p.c
> @@ -4652,6 +4652,7 @@ static const struct qcom_cc_desc gcc_sa8775p_desc =
=3D {
>  	.num_resets =3D ARRAY_SIZE(gcc_sa8775p_resets),
>  	.gdscs =3D gcc_sa8775p_gdscs,
>  	.num_gdscs =3D ARRAY_SIZE(gcc_sa8775p_gdscs),
> +	.use_rpm =3D true,

[Severity: High]
Could enabling use_rpm here cause a synchronous external abort during device
resets?

The QCOM reset controller operations, such as qcom_reset_set_assert(), perf=
orm
raw regmap MMIO writes but neither the reset core nor the qcom reset ops ta=
ke
a PM runtime reference beforehand. Additionally, gcc_sa8775p_regmap_config =
has
no PM runtime awareness.

If a consumer driver (such as PCIe or UFS) calls reset_control_assert() bef=
ore
enabling any GCC clocks, the register write will hit a powered-off bus beca=
use
the CX power domain is suspended.

Should the reset controller paths take a PM runtime reference to ensure the
hardware is accessible before allowing the bus to be powered down?

>  };
> =20
>  static const struct of_device_id gcc_sa8775p_match_table[] =3D {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-qcom-tie-c=
x-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com?part=3D20
