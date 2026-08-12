Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D70384CDA;
	Wed, 12 Aug 2026 07:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786520151; cv=none; b=S/RVrzy/ASmJohrSYBV5rfbUEthz35x6XnOd88gGxQVaxyNPU87v/AZ84fIl3ZU9THu2Kf07MiCgioPgRVoxevltLxM3LOiJ/XQrT88ML2+fT9b0YcvgLaVhTEM5RvJAlYpGT/yyC658wfObnwM4SbWr/gPpsiOMUKGzfKI0xGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786520151; c=relaxed/simple;
	bh=I26toeKwrqlA0uzDb6MiEV8dyzDrVSN2BN2Qe2vefSk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=V+WC/fk17Ea7zaj5n2p/WK9y/GdyNstHZ95uN+ZgoPGTCqf9WO4dWunvZsX1ey6DqH8f0f/jdbtnRFsQoCagEMEmiHV5LQTHyN1hkoTkE4walIhIiijCcTviFpNUiWOGwTJe4Q838i8VHVyPtsJb7r7lYFa57EB8pNDtg7N3ASs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G+ibUD5O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G+ibUD5O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43BC01F000E9;
	Wed, 12 Aug 2026 07:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786520149;
	bh=u1/W59W9pDR/VZOdnwEcZ9qvWbPlX/3hk3S+kCXSOaw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G+ibUD5OplqwNFI+bsEFIW0iXz2PUqHvV7I7zxrcJKzKhpJhfVY85PTGCX1E+FUKC
	 1WNufykw0orqPmni/XAXnlo2mkYnkH4hMikv06zjjFzkUNHfBVryQMSE25gNuCyJWi
	 qeL9FPC/xXIq65AW2P0Jy/+Vr3WquQH4m6S35gvM7GV5OMBiClxmp8O5LVajTTxgy/
	 NxWNVicvbPXwKUPC3g5JPIHPLH70AwAEg+an78952qQQjQo3sVYKsjM7X1Vbi9fVDL
	 l7ZQyfbE3vvnnm6aBLaMc5Y2ksvwDNHz3ETxGmtFhKWYjunQKo+4JeQ2WqwfemfaNG
	 PZ1NF33OghVHw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: qcom: Move x1e80100 TCSR to
 own binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qiang Yu" <qiang.yu@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260812-hamoa_tcsr_qref_0812-v3-1-dc7627169c6d@oss.qualcomm.com>
References: <20260812-hamoa_tcsr_qref_0812-v3-0-dc7627169c6d@oss.qualcomm.com>
 <20260812-hamoa_tcsr_qref_0812-v3-1-dc7627169c6d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 07:35:48 +0000
Message-Id: <20260812073549.43BC01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The TCSR clock controller driver does not implement support for th=
e newly added mandatory LDO supplies.
--

--- Patch [1]: [PATCH v3 1/3] dt-bindings: clock: qcom: Move x1e80100 TCSR =
to own binding ---
commit aad425dc59252c040c4a40218a6fd98a6935f85a
Author: Qiang Yu <qiang.yu@oss.qualcomm.com>

dt-bindings: clock: qcom: Move x1e80100 TCSR to own binding

This commit creates a dedicated binding file for the x1e80100 TCSR
clock controller to document newly required LDO supply properties.
These supplies are mandated for the QREF block to provide stable
reference clocks to PCIe, USB, and UFS PHYs.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-tcsr.y=
aml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-tcsr.yaml
> new file mode 100644
> index 0000000000000..92fa416e7270b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-tcsr.yaml
> @@ -0,0 +1,120 @@
[ ... ]
> +  vdda-refgen2-0p9-supply: true
> +  vdda-refgen2-1p2-supply: true
> +
> +required:
> +  - compatible
> +  - clocks
> +  - '#clock-cells'
> +  - '#reset-cells'
> +  - vdda-qrefrpt0-0p9-supply

[Severity: High]
This is a pre-existing issue, but does the TCSR clock controller driver
actually implement support for these newly mandated LDO supplies?

Looking at drivers/clk/qcom/tcsrcc-x1e80100.c, the reference clocks are
modeled as standard clk_branch structures rather than qcom_clk_ref_desc=20
objects that natively handle regulators:

    static struct clk_branch tcsr_edp_clkref_en =3D {
        .halt_reg =3D 0x15130,
        .halt_check =3D BRANCH_HALT_DELAY,
        .clkr =3D {
            .enable_reg =3D 0x15130,
            .enable_mask =3D BIT(0),
        ...
    };

Additionally, the driver relies on qcom_cc_probe(), which does not parse
or request these regulators.

Since the commit message notes that the USB/PCIe/eDP PHYs cannot work
properly without these LDOs, will the lack of driver support cause these
peripherals to unconditionally fail on boot when they request their clocks?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812-hamoa_tcsr=
_qref_0812-v3-0-dc7627169c6d@oss.qualcomm.com?part=3D1
