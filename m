Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787929;
	b=YIHMRTg+Qm+GsO4rHvZvNpnoJIm7v/MPnPKeV8jPW5xifOS/lb17f0XFCTxj0+JTK+XL
	 lfLHl9lZz0pg81dicTex/YXwJLD8OTivniYYzZPPGheRRBEjyj1BTxw1RJBBUsw9YJgW2
	 e/RVmeQFGrTzuI2I8Fp+eIPaJFchXxMXK0c5WMJqfK4eN9iHjy7+6chjYI2wT2T4L21Tm
	 FSY0hgQrvBkHterfc4+yyIvCjCRunsBhh1suzgjkostvSE9ffsBrt+0sCigu2Lke3JfXD
	 XpOLX6eAmUaXV2qxbI9QyZrjOi9lJrV0QONF17nhACWMWoBBzaosS9HPvfJVd8mZoTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787929;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Cp1UWzaXiW4wn439lxLfaZ/1xu/LeJQxFQKofFWygeQ=;
	b=2T5ktvhf/yP8ezzhutUneJyTA3llu4BQgnYOeERh3mJBKqimnDExSPctGR2PjrMWisFq
	 yWcbp1WyL1Mkl0voH0Y2n/Y16YmpBCdmi6/UGqwvtwwZEwFf2sCrZSHvN3OmVXscw3X9P
	 +0bQYi5dbNbVWVpo/60aY7Ce8rWL7F5076MudS7UJqkc1IQsV6m8Ekg+1/8XKSbLK0ewW
	 6Vet36xl3DWbQT1cBQjz2Iki3nH/Enl6MB46u3xCmQqq9mT84yfbLRUdwLxH/gLsN9nf/
	 SihqUtb6dQugOgduj3nDIiMDz7d/hyW6HLK3Lg1nkc/IN4uPzHUeHutqPjCtrJksAng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I0Nn9DRH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1315A606A33D;
	Fri, 27 Nov 2026 13:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I0Nn9DRH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D62A1F0089A;
	Fri, 27 Nov 2026 13:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795787928;
	bh=Cp1UWzaXiW4wn439lxLfaZ/1xu/LeJQxFQKofFWygeQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I0Nn9DRHx5q8CTU+WrhZqmuW5wqwpoJKeO+EExtyezka3TuSBwL0hp8/f9SSq+lYu
	 O1wAQ+Jn+zxw5VMfhjf40B+NREzIG23tMMUMY6RpU9I1jRn1JsjnUXRaW+OSUZHQo1
	 eIJmkZAMzgCNUgGKog52qNF223lSuMbhgDPMvkw98c8ZSVxGAQpJpEv5CfAVUHcaGl
	 MV1tn80yIRlmRt06yHx6458cj61cPmfwGUCsjcHNfBfiyjAM1mOkNAKE4M+Mm9cSFc
	 WnIQep1qo9kEJKAyLaCWjs5YRg2CGZLOvcJUGXVEzQZDPsHtJRRbWVfgh7/5yfoQVd
	 m1rwCrRXrhktw==
Message-ID: <sashiko-outbox-237526@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 7/7] arm64: dts: qcom: msm8953-xiaomi-tissot: enable
 front and rear cameras
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hikmah Gumelar" <hikmahgumelar@gmail.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261127134507.125513-8-hikmahgumelar@gmail.com>
References: <20261127134507.125513-1-hikmahgumelar@gmail.com>
 <20261127134507.125513-8-hikmahgumelar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 13:58:47 +0000
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
- [High] media: i2c: ov12a10: self-deadlock on ov12a10->mutex in
  ov12a10_set_format()
--

commit 180043166dff2dc952f91efcd5a2089fead156a3
Author: Hikmah Gumelar <hikmahgumelar@gmail.com>

arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras

This commit enables the CAMSS, CCI, and CSIPHY0/CSIPHY2 nodes along with
the OmniVision OV12A10 rear and Samsung S5K5E8 front camera sensors on the
Xiaomi Mi A1 device tree.

> diff --git a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts b/arch/ar=
m64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
> index fccb9c4360cae..d8db3567fd36f 100644
> --- a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
> @@ -74,6 +74,108 @@ vph_pwr: vph-pwr-regulator {

[ ... ]

> +&cci_i2c0 {
> +	camera@10 {
> +		compatible =3D "ovti,ov12a10";
> +		reg =3D <0x10>;

[Severity: High]
Does enabling camera@10 expose a self-deadlock on ov12a10->mutex in
ov12a10_set_format() from commit "media: i2c: add ov12a10 image sensor
driver" earlier in this series?

In that driver, ov12a10_probe() sets ov12a10->sd.state_lock =3D
&ov12a10->mutex before calling v4l2_subdev_init_finalize(), so the V4L2
subdev core acquires ov12a10->mutex via v4l2_subdev_lock_state() before
calling the .set_fmt pad operation.  ov12a10_set_format() then locks
ov12a10->mutex again:

drivers/media/i2c/ov12a10.c:ov12a10_set_format() {
	struct ov12a10 *ov12a10 =3D to_ov12a10(sd);

	mutex_lock(&ov12a10->mutex);
	if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE && ov12a10->streaming) {
		mutex_unlock(&ov12a10->mutex);
		return -EBUSY;
	}
    ...
}

Any VIDIOC_SUBDEV_S_FMT ioctl on the rear camera subdev will deadlock
immediately on ov12a10->mutex.  Dropping the manual mutex_lock() and
mutex_unlock() calls from ov12a10_set_format() avoids this because the
subdev state lock is already held by the caller.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127134507.1255=
13-1-hikmahgumelar@gmail.com?part=3D7
