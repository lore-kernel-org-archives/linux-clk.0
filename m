Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40DA37F339;
	Sat,  3 Oct 2026 01:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790991231; cv=none; b=rcSG/W/RQiAiy6DLK3w1x5wl1mrVi0DaTq4uhqSKTdksUO7b+f7d/srjdrssncE17GKszerp06OjdZaJ9hC9BhwFGpCLQitr8HQDJpTHOOd978Ryy6NWYRbuZVrt8hgQ/0aGzssRcxgRMta7XqfTKSQUPy1Y1HbRhsxhYbrZl8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790991231; c=relaxed/simple;
	bh=3+9mKCgxb9otCQr5pHSEe/WnHWxEg+JSki/GbsMrClk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=smjzfMMKsRknid3qwpEpoadRGYtevU7q+PvywyNIdfKMD2oBqseBoBRBWr9bKAr3DwEEJ6pyyL99gpOfpSPImM+n8F1sBbTCVXT8hw14CC5nPOghDlT3qslPrbqAdIsQnMcHvUusfOZ3BovmImPCb2TdQ+6qZsLiyE5rEUXjPjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PUKX34xf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PUKX34xf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55C4C1F00893;
	Sat,  3 Oct 2026 01:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790991230;
	bh=RQYOIVqOzZS0PFZHt6iSDtb1yPE0cgKbh6X2s32xiLc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PUKX34xf9ifnpN+CXG+wIVDzjdcnS2iUo5CbXw0dy+0L9g3YAdgNxwRwy7FCjwd9u
	 KhTpU5VGaKRHEOIU6T2u41oITWKBCmNDEhW6YgwfqHPfUNIwrLWSQIoCDwbgZXhrgB
	 sCe/kjEFfBV9NxV8LOJcCMyitwiFKHfcbPq10hU7EwfhY19ugEJop4Dla1tGs/9JL9
	 hSnlMs+0NfBojvNutpu3ncNokDXn0qWuF/EQbMofB0aaliuJfFaaHXu4SmXM+uVpSd
	 /2Z6OlwLwadMQSsaKOb9JKLM/RRvEAF7IZ6mTQHn0ECLvB9c3dLahxT/WShM6dVuTe
	 SYVM93FoDtUkA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] clk: qcom: Add lpass audio clock controller
 driver for Glymur
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: conor+dt@kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261002194436.1275056-4-srinivas.kandagatla@oss.qualcomm.com>
References: <20261002194436.1275056-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261002194436.1275056-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 03 Oct 2026 01:33:49 +0000
Message-Id: <20261003013350.55C4C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] kconfig: inconsistent SC_ prefix and missing select CLK_GLYMUR_G=
CC
--

commit 4d46e5258e028c341d462d1519e907620d08c409
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

clk: qcom: Add lpass audio clock controller driver for Glymur

Add support for the lpass audio clock controller found on Glymur based
devices. This would allow lpass peripheral loader drivers to control the
clocks and bring the subsystems out of reset.

> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 27d0ab24d50a4..89e6a636e4973 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -1274,6 +1274,17 @@ config SC_LPASSCC_8280XP
>  	  Say Y if you want to use the LPASS branch clocks of the LPASS clock
>  	  controller to reset the LPASS subsystem.
> =20
> +config SC_LPASSCC_GLYMUR
> +	tristate "GLYMUR Low Power Audio Subsystem (LPASS) Clock Controller"
> +	depends on ARM64 || COMPILE_TEST

[Severity: Medium]
Should this symbol use the CLK_GLYMUR_ prefix instead of SC_ to ensure
consistency with other Glymur configurations?

Also, does this configuration need a select statement for CLK_GLYMUR_GCC?
Building the kernel with SC_LPASSCC_GLYMUR enabled while CLK_GLYMUR_GCC is
disabled can lead to the driver being built without the required global clo=
ck
controller infrastructure, potentially causing probe failures at runtime.

> +	default m if ARCH_QCOM
> +	help
> +	  Support for the LPASS clock controller on Glymur devices.
> +	  Say Y if you want to use the LPASS branch clocks of the LPASS clock
> +	  controller to reset the LPASS subsystem.  Required for the LPASS
> +	  audio macros and the SoundWire compute-mode controller to leave
> +	  reset on Glymur.
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002194436.1275=
056-1-srinivas.kandagatla@oss.qualcomm.com?part=3D3
