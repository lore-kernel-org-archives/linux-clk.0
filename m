Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FFE4C8C53;
	Thu, 15 Oct 2026 08:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054322; cv=none; b=g1+bJl8p+7DKX5GpXSdMjfl5jDPSOm75HB6ABS9phvwVZ7o7tphgX+mOfBXFINJT7UWWorz6mjIDy/8iDA4d9+9kPnrvAL5ttJ4zI55Do9xop+sHJM5Jlg58gqy44j7BlDmSdsqkwoYFhcXTg2TSbQ9bEIj4DB9o4j0MoIOH4XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054322; c=relaxed/simple;
	bh=XzL5sDkQ6gBCoosWvQKyScGFZLpTRYLTxeYG/KDWQ4Q=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=tRxfm+525KTetWUtuQPch/QoyQute72zGG6XCU0ghi1UQlg0sJtwMHMzGQKFwPcRZS7h0rmb4HXRWMrh5xgPgd0vsq+Il7w3SBPPeRswXh7SwUgu3tTx22C93qecyGOmEywch1ymtKzFBE2SLVV1Opcyg8qeRSMlrmQCAxIfj+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a0JYqDde; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a0JYqDde"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D6061F000C5;
	Thu, 15 Oct 2026 08:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792054318;
	bh=dWcQvOvf0MJoEk6VNqyDCjj1jOptNR1+bSUzeS9rWHg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a0JYqDdeV4dUJEEKDTGctJWkP6A+yCD9pB/X1h5SItjMlV9fhcQ1qjownfE8lC7IA
	 ECFWUWKkexj8iIhe4/bSqAozOiu2gBIWNBuyZjKmPR9ZpM1KAEq2zmSa1H9ndZYHWx
	 SRFiZU6vcnhqcuorUnszUiSl8heO86/oqmLjHiHXgQqRiA+vX3vLhbi4/6gRECAkkQ
	 SCFB1f+iNyM3SN/94BX5D56urZuXgcE7JDgZfs3YIS4s3+/KCPQbh56vyd62XJLVyb
	 PnUQWLfEOHGpqm15uTU6TbGdmJXizL0kEPishoIwm2qWdn+n1YlPpHfK0ZcBg+2VeZ
	 C+q+5BnebxFzQ==
Message-ID: <sashiko-outbox-172521@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: add device tree for SDM845-HDK
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015-sdm845-hdk-v4-4-b532b9f4029c@oss.qualcomm.com>
References: <20261015-sdm845-hdk-v4-0-b532b9f4029c@oss.qualcomm.com>
 <20261015-sdm845-hdk-v4-4-b532b9f4029c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 08:51:57 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] arm64: dts: qcom: inconsistent SDHC_2 drive strength vs comment
--

commit ad3a4fdbe0a1af267d2159b955cbbffe917a1e14
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

arm64: dts: qcom: add device tree for SDM845-HDK

Add device tree for the Qualcomm / Lantronix SDM845 HDK. This adds support
for the development platform using the modem-less (SDA845) SoC, including
peripherals like HDMI, DSPs, and USB.

> diff --git a/arch/arm64/boot/dts/qcom/sdm845-hdk.dts b/arch/arm64/boot/dt=
s/qcom/sdm845-hdk.dts
> new file mode 100644
> index 0000000000000..a2f139751ab6a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm845-hdk.dts

[ ... ]

> +	sdc2_default_state: sdc2-default-state {
> +		clk-pins {
> +			pins =3D "sdc2_clk";
> +			bias-disable;
> +
> +			/*
> +			 * It seems that mmc_test reports errors if drive
> +			 * strength is not 16 on clk, cmd, and data pins.
> +			 */
> +			drive-strength =3D <16>;
> +		};
> +
> +		cmd-pins {
> +			pins =3D "sdc2_cmd";
> +			bias-pull-up;
> +			drive-strength =3D <10>;
> +		};
> +
> +		data-pins {
> +			pins =3D "sdc2_data";
> +			bias-pull-up;
> +			drive-strength =3D <10>;
> +		};

[Severity: Low]
Is this configuration intentional? The comment in the clk-pins block just
above explicitly warns that mmc_test reports errors if drive strength is not
16 on clk, cmd, and data pins.=20

However, cmd-pins and data-pins are configured with a drive strength of 10.
Does the comment need updating, or should these pins be set to 16 to avoid
potential mmc_test errors?

> +	};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-sdm845-hdk=
-v4-0-b532b9f4029c@oss.qualcomm.com?part=3D4
